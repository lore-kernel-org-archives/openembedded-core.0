Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 846 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Mar 2018 18:10:43 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0058.outbound.protection.outlook.com [104.47.33.58])
	by mail.openembedded.org (Postfix) with ESMTP id CCB48788F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=v7CQGdbdtp+JmbaBRvVdSYbGDooh3tt7M2JZjI3Ozu8=;
	b=VVHiQM9Nr0hhJ6ByxW585VNi1+pxLiMg+UnLveUHPMKPz3H/hTlDRh9E90yjkUkE17kjPiezpXHIm0J1TTApu294DXgfkcN72Q0To9wJyLwjMYrgeT/oNzCRbuMeqlB22+mSuluwrpNOtytaAUJ+XUyVblIQa+pGkO8mEFm74xI=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB1313.namprd02.prod.outlook.com (10.162.79.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.567.12; Fri, 9 Mar 2018 17:56:36 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0527.025; Fri, 9 Mar 2018 17:56:35 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Bhargava
	Sreekantappa Gayathri" <BSREEKAN@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] own-mirrors.bbclass: Change prepend to append
Thread-Index: AQHTt6pPrKiZqK4+lUOUhBkjWawK3qPILKYA
Date: Fri, 9 Mar 2018 17:56:34 +0000
Message-ID: <BY2PR02MB347E13EAB004D3AB8E628A0B9DE0@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1520560178-31053-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
	<1520602008.10851.102.camel@linuxfoundation.org>
In-Reply-To: <1520602008.10851.102.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [12.130.117.186]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB1313;
	7:F06GiTO5A4rtrlAn6gmwbfLJIgsAiLPrBh57ic9qJePfOQ3n9/CPRzTb6FuoHrzCjsp7HyGY5XHgpzQ53yVT3o3kLV532kXKIyD1GJkvBlwt069zh1kNPyVNtpJfz2G8AVqt2nFQZ9pN2r9jcowXaAWdZEHXfX4gOnlAijZzZlBpWVBASoajWMuoymYvn0KcvRCS42Ak8AtyVBEHF1kClMN74L/aGFTBhQjq/RUdFu5XA/Jxcpm3RNr4i6GSeSw5
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(39860400002)(346002)(396003)(376002)(189003)(199004)(13464003)(377424004)(2950100002)(59450400001)(25786009)(3660700001)(3280700002)(305945005)(26005)(8936002)(2900100001)(76176011)(81166006)(77096007)(74316002)(81156014)(186003)(8676002)(7696005)(2906002)(105586002)(99286004)(6506007)(2501003)(106356001)(53546011)(7736002)(316002)(110136005)(102836004)(6116002)(68736007)(3846002)(55016002)(97736004)(33656002)(5660300001)(72206003)(6436002)(9686003)(229853002)(14454004)(53936002)(478600001)(66066001)(6246003)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1313;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c014ce4-1184-471a-13e1-08d585e7193e
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BY2PR02MB1313; 
x-ms-traffictypediagnostic: BY2PR02MB1313:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-microsoft-antispam-prvs: <BY2PR02MB1313DAC1D25A9041CD364483B9DE0@BY2PR02MB1313.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231220)(944501244)(52105095)(93006095)(93001095)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB1313; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1313; 
x-forefront-prvs: 0606BBEB39
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: ImroFA5bn7NC7t1Az0bD/KqmJb9yS57ErUn5vD+JJu6UBdLQ33yegb88tJOSBonU+VYSw24nhV1LUAq+6MjPiRm3qTLn9RyHgakgNrBCI+mAxB4eWyDqHcjDRxEqtJc1G1e8Mco+l9Lli7SplZX8g1nq8F4PvfenSP98FB/ZAl29V0Xb2RUI5DcLi9B8JUCGPQTgRDoiAjcH03S1OBgIhP/RZMWtKZscMMLtlNbB4IA6M6IsxGWGJjq7D+UNlV8p6rCTfeuhaeLxhky/5+vph/X705fjlHGB1kut7a5gHQRxhCakTll4DyIM+BV8HmYeu5AZ18yBOhsv+/J/bSkPxw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c014ce4-1184-471a-13e1-08d585e7193e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2018 17:56:34.8825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1313
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
X-List-Received-Date: Fri, 09 Mar 2018 18:10:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBGcmlk
YXksIE1hcmNoIDA5LCAyMDE4IDU6MjcgQU0NCj4gVG86IEJoYXJnYXZhIFNyZWVrYW50YXBwYSBH
YXlhdGhyaSA8QlNSRUVLQU5AeGlsaW54LmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnOyBNYW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGENCj4gPE1BTkpV
S1VNQHhpbGlueC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBvd24tbWly
cm9ycy5iYmNsYXNzOiBDaGFuZ2UgcHJlcGVuZCB0byBhcHBlbmQNCj4gDQo+IE9uIFRodSwgMjAx
OC0wMy0wOCBhdCAxNzo0OSAtMDgwMCwgQmhhcmdhdmEgU3JlZWthbnRhcHBhIEdheWF0aHJpDQo+
IHdyb3RlOg0KPiA+IElmIEJCX05PX05FVFdPUksgaXMgc2V0IHRvIDEsIGFuZCBsb2NhbCBkb3du
bG9hZCBkaXJlY3RvcnkgaXMgYWRkZWQgYXMNCj4gPiBQUkVNSVJST1JTX3ByZXBlbmQgaW4gY29u
ZiBmaWxlLCBQUkVNSVJST1JTIHZhcmlhYmxlIHdpbGwgaGF2ZQ0KPiA+IFNPVVJDRV9NSVJST1Jf
VVJMIGFzIHRoZSBmaXJzdCB1cmwuIFRoaXMgY2F1c2VzIGJ1aWxkIHRvIGZhaWwgYXMNCj4gPiBu
ZXR3b3JrIGFjY2VzcyBpcyBkaWFibGVkLiBQUkVNSVJST1JTIHNob3VsZCBiZSBhcHBlbmRlZCBo
ZXJlIHNvIHRoYXQNCj4gPiBhIHByZXBlbmQgaW4gb3RoZXIgbGF5ZXJzL2NvbmYgZmlsZXMgdGFr
ZXMgcHJlY2VkZW5jZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJoYXJnYXZhIFNyZWVrYW50
YXBwYSBHYXlhdGhyaSA8YmhhcmdhdmEuc3JlZWthbnRhcHBhLQ0KPiA+IGdheWF0aHJpQHhpbGlu
eC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFuanVrdW1hciBNYXRoYSA8bWFuanVrdW1hci5o
YXJ0aGlrb3RlLW1hdGhhQHhpbGlueC5jDQo+ID4gb20+DQo+ID4gLS0tDQo+ID4gwqBtZXRhL2Ns
YXNzZXMvb3duLW1pcnJvcnMuYmJjbGFzcyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gSSB0aGluayB0aGlzIHBhdGNoIGp1
c3QgbW92ZXMgdGhlIHByb2JsZW0sIHlvdSBjb3VsZCBlYXNpbHkgaGF2ZSBhIGZpbGU6Ly8vIHVy
bA0KPiBhc8KgU09VUkNFX01JUlJPUl9VUkwgYW5kIGEgbmV0d29yayBhZGRyZXNzIGluIHlvdXIg
b3RoZXIgbGF5ZXIgaW4gd2hpY2ggY2FzZQ0KPiB5b3VyIHBhdGNoIHdvdWxkIGJyZWFrIHRoaW5n
cy4uLg0KPiANCg0KDQpBZ3JlZWQuDQpJIHRoaW5rIHRoZSBiZXR0ZXIgZml4IHdvdWxkIGJlIHRv
IGdvIHRocm91Z2ggdGhlIGVudGlyZSBhdmFpbGFibGUgbGlzdCBpbiBQUkVNSVJST1JTIHNraXBw
aW5nIGh0dHAgb3IgaHR0cHMgIChzaW5jZSBCQl9OT19ORVRXT1JLIGlzIHNldCkgYW5kIHRoZW4g
ZmFpbCBpZiB3ZSBjYW5ub3QgZ2V0IHRoZSByZXF1aXJlZCBmaWxlLg0KDQpUaGFua3MsDQpNYW5q
dQ0K

