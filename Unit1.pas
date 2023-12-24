unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    NC: TNetHTTPClient;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  API_URL: string;
  JSONRequestBody: TStringStream;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with NC do
begin
    CustomHeaders['key']  := 'da535c10a8099a062eb903ad5cc4f1bd';
    Memo1.Lines.Text      := Get('https://api.rajaongkir.com/starter/province').ContentAsString;
    CustomHeaders['key']  := 'da535c10a8099a062eb903ad5cc4f1bd';
    Memo1.Lines.Text      := Get('https://api.rajaongkir.com/starter/city?province=1').ContentAsString;
    CustomHeaders['key']  := 'da535c10a8099a062eb903ad5cc4f1bd';
    API_URL      := 'https://api.rajaongkir.com/starter/cost';
    JSONRequestBody := TStringStream.Create('{"origin": "501", "destination": "114", "weight": "1000", "courier": "pos"}');
    try
       Memo1.Lines.Text := Post(API_URL, JSONRequestBody).ContentAsString;
    finally
        JSONRequestBody.Free;
    end;


    end;
end;

end.
