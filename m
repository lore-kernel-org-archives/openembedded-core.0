Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0045.outbound.protection.outlook.com [104.47.34.45])
	by mail.openembedded.org (Postfix) with ESMTP id 834BA78960
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GEGEQ9fx7d/d4rkYcyP3PvNZtRqS1w9C/wN3MSFrpFc=;
	b=uSPZlAGLSyREkNyOa0eyxRD+Kj6Txug/iRsLQZK0GzlNbHtV/I3zxizunIfXkgImAoCi6layS/Jyw4bnng7o15fcg3IDB4wkGFeLCQ31iAhViMnlUtlldFBGDL5uF8YTcOpMvyxd6PW02wxcyaR5FmCzA09H/KJ95aui0I7YcKs=
Received: from DM2PR0201MB0847.namprd02.prod.outlook.com (10.160.95.156) by
	DM2PR0201MB1038.namprd02.prod.outlook.com (10.160.219.148) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.588.14;
	Tue, 20 Mar 2018 20:26:31 +0000
Received: from DM2PR0201MB0847.namprd02.prod.outlook.com
	([fe80::a04d:c904:6921:866a]) by
	DM2PR0201MB0847.namprd02.prod.outlook.com
	([fe80::a04d:c904:6921:866a%13]) with mapi id 15.20.0588.017;
	Tue, 20 Mar 2018 20:26:30 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] own-mirrors.bbclass: Change prepend to append
Thread-Index: AQHTt6pPK4rb7kzHFE+r4QWKw162baPIMJcAgBFzRpA=
Date: Tue, 20 Mar 2018 20:26:29 +0000
Message-ID: <DM2PR0201MB0847BC49D283488C8C9480E8B0AB0@DM2PR0201MB0847.namprd02.prod.outlook.com>
References: <1520560178-31053-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
	<1520602008.10851.102.camel@linuxfoundation.org>
	<BY2PR02MB347E13EAB004D3AB8E628A0B9DE0@BY2PR02MB347.namprd02.prod.outlook.com>
In-Reply-To: <BY2PR02MB347E13EAB004D3AB8E628A0B9DE0@BY2PR02MB347.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM2PR0201MB1038;
	7:J7h/xsXbW5jH6/Re0XmCDytCw5do8H8JiBR02KEopjDps9dWwgjVyDnvHBn+3/pYpEqA6D5bLyAsElRMXKr6QHthDG77Wpr5sr/a/PSpKN4kP8p6ajawrt/kYAtMG+3+7Hh7tSWbpbqtToo8N8rnkN6a+MMotmkSqDh7qPabMPpHGMqm/n+Oq39A8hSKIzy3znXbI4WhjZDYOi0TpvTItrU+7UXd6pJw17/Ay/u04R6yyCbuF8B1lnlbwzcRGD2j
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39380400002)(346002)(396003)(376002)(366004)(39860400002)(13464003)(199004)(189003)(377424004)(102836004)(86362001)(2950100002)(6506007)(106356001)(6436002)(8936002)(59450400001)(68736007)(6116002)(7696005)(3846002)(2501003)(26005)(25786009)(7736002)(5250100002)(316002)(2900100001)(53546011)(305945005)(3660700001)(9686003)(478600001)(5660300001)(53936002)(72206003)(6246003)(2906002)(3280700002)(105586002)(74316002)(14454004)(81156014)(81166006)(55016002)(110136005)(33656002)(8676002)(66066001)(97736004)(99286004)(229853002)(76176011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB1038;
	H:DM2PR0201MB0847.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4ab080a7-45c5-4305-f7e0-08d58ea0dd42
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603328)(7153060)(7193020);
	SRVR:DM2PR0201MB1038; 
x-ms-traffictypediagnostic: DM2PR0201MB1038:
x-microsoft-antispam-prvs: <DM2PR0201MB10384F94C27AFF4446B8B1ABB0AB0@DM2PR0201MB1038.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231221)(944501244)(52105095)(93006095)(93001095)(6055026)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR0201MB1038; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0201MB1038; 
x-forefront-prvs: 061725F016
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: bnNdVWlQQra9DN9jD0ML2GMqL/0Za9u/Our9IK0e7pB4VWHkucyLaCGM+CxEjTKN9mo4sOsnAb3JT+k0dkbrUxcxs1kPhAxZzc72owV9KYV4LWrZWJy8DiD8qa9FTY4+3MkcXJ/8ob20vF/fBa0VtHHInuEuLuylTuGmQAnn8+h/OxrfSjehqxaPzHJw3z0KTIlpqTtt7epOfD0gqGny0eemRrg/5LtGijPul6Vlo+QS3KgeJFeYIiYbL7L5n7cwH3Onx78QG4zaJtZ2ez1rUmT1vzJrPGS9zi5EYm4svWJlQnaBxENVWR9Zmw/rnlnshToyPMeb9QGLNTrZDiHSTw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab080a7-45c5-4305-f7e0-08d58ea0dd42
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2018 20:26:29.9608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB1038
Subject: Re: [PATCH] own-mirrors.bbclass: Change prepend to append
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2018 20:26:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hbmp1a3VtYXIg
SGFydGhpa290ZSBNYXRoYQ0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDA5LCAyMDE4IDk6NTcgQU0N
Cj4gVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
PjsgQmhhcmdhdmENCj4gU3JlZWthbnRhcHBhIEdheWF0aHJpIDxCU1JFRUtBTkB4aWxpbnguY29t
Pjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUkU6IFtPRS1jb3JlXSBbUEFUQ0hdIG93bi1taXJyb3JzLmJiY2xhc3M6IENoYW5nZSBwcmVw
ZW5kIHRvIGFwcGVuZA0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnXQ0KPiA+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMDksIDIwMTggNToyNyBBTQ0K
PiA+IFRvOiBCaGFyZ2F2YSBTcmVla2FudGFwcGEgR2F5YXRocmkgPEJTUkVFS0FOQHhpbGlueC5j
b20+Ow0KPiA+IG9wZW5lbWJlZGRlZC0gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBNYW5q
dWt1bWFyIEhhcnRoaWtvdGUNCj4gTWF0aGENCj4gPiA8TUFOSlVLVU1AeGlsaW54LmNvbT4NCj4g
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gb3duLW1pcnJvcnMuYmJjbGFzczogQ2hh
bmdlIHByZXBlbmQgdG8NCj4gPiBhcHBlbmQNCj4gPg0KPiA+IE9uIFRodSwgMjAxOC0wMy0wOCBh
dCAxNzo0OSAtMDgwMCwgQmhhcmdhdmEgU3JlZWthbnRhcHBhIEdheWF0aHJpDQo+ID4gd3JvdGU6
DQo+ID4gPiBJZiBCQl9OT19ORVRXT1JLIGlzIHNldCB0byAxLCBhbmQgbG9jYWwgZG93bmxvYWQg
ZGlyZWN0b3J5IGlzIGFkZGVkDQo+ID4gPiBhcyBQUkVNSVJST1JTX3ByZXBlbmQgaW4gY29uZiBm
aWxlLCBQUkVNSVJST1JTIHZhcmlhYmxlIHdpbGwgaGF2ZQ0KPiA+ID4gU09VUkNFX01JUlJPUl9V
UkwgYXMgdGhlIGZpcnN0IHVybC4gVGhpcyBjYXVzZXMgYnVpbGQgdG8gZmFpbCBhcw0KPiA+ID4g
bmV0d29yayBhY2Nlc3MgaXMgZGlhYmxlZC4gUFJFTUlSUk9SUyBzaG91bGQgYmUgYXBwZW5kZWQg
aGVyZSBzbw0KPiA+ID4gdGhhdCBhIHByZXBlbmQgaW4gb3RoZXIgbGF5ZXJzL2NvbmYgZmlsZXMg
dGFrZXMgcHJlY2VkZW5jZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaGFyZ2F2YSBT
cmVla2FudGFwcGEgR2F5YXRocmkNCj4gPiA+IDxiaGFyZ2F2YS5zcmVla2FudGFwcGEtIGdheWF0
aHJpQHhpbGlueC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYW5qdWt1bWFyIE1hdGhhDQo+
ID4gPiA8bWFuanVrdW1hci5oYXJ0aGlrb3RlLW1hdGhhQHhpbGlueC5jDQo+ID4gPiBvbT4NCj4g
PiA+IC0tLQ0KPiA+ID4gwqBtZXRhL2NsYXNzZXMvb3duLW1pcnJvcnMuYmJjbGFzcyB8IDIgKy0N
Cj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4NCj4gPiBJIHRoaW5rIHRoaXMgcGF0Y2gganVzdCBtb3ZlcyB0aGUgcHJvYmxlbSwgeW91IGNv
dWxkIGVhc2lseSBoYXZlIGENCj4gPiBmaWxlOi8vLyB1cmwgYXPCoFNPVVJDRV9NSVJST1JfVVJM
IGFuZCBhIG5ldHdvcmsgYWRkcmVzcyBpbiB5b3VyIG90aGVyDQo+ID4gbGF5ZXIgaW4gd2hpY2gg
Y2FzZSB5b3VyIHBhdGNoIHdvdWxkIGJyZWFrIHRoaW5ncy4uLg0KPiA+DQo+IA0KPiANCj4gQWdy
ZWVkLg0KPiBJIHRoaW5rIHRoZSBiZXR0ZXIgZml4IHdvdWxkIGJlIHRvIGdvIHRocm91Z2ggdGhl
IGVudGlyZSBhdmFpbGFibGUgbGlzdCBpbg0KPiBQUkVNSVJST1JTIHNraXBwaW5nIGh0dHAgb3Ig
aHR0cHMgIChzaW5jZSBCQl9OT19ORVRXT1JLIGlzIHNldCkgYW5kIHRoZW4NCj4gZmFpbCBpZiB3
ZSBjYW5ub3QgZ2V0IHRoZSByZXF1aXJlZCBmaWxlLg0KDQpIaSBSaWNoYXJkL01hbmp1LA0KDQpB
Z3JlZWQsIEkgaGF2ZSBzZW50IG91dCBhIHBhdGNoIHRvIGZpeCB0aGlzIGlzc3VlIGFzIGRpc2N1
c3NlZC4NCg0KVGhhbmtzLA0KQmhhcmdhdg0KPiANCj4gVGhhbmtzLA0KPiBNYW5qdQ0K

