Return-Path: <alejandr@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0089.outbound.protection.outlook.com [104.47.32.89])
	by mail.openembedded.org (Postfix) with ESMTP id 9D47774713
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8LExWwP7v++8VaguCYuamVkHzCghXMD2ljN8FGrgsYs=;
	b=SopuLAVqzz4N+mzMFtNd70+ri9tF0rdzZyL0oiwzIpIki8np1Qx8Bt37+ZZmYEX4VPRzXGd46g7WkFwJoVVprJubhYRMUgYw0erDMtgaza0Dqi1iFqH3L6n8XcoBo8PQDB8fXpZ0DHD0o1Bllpr7Ffch2Nh4e/4qI3R70neH8Fg=
Received: from CY4PR02MB3334.namprd02.prod.outlook.com (10.165.89.141) by
	CY4PR02MB2470.namprd02.prod.outlook.com (10.173.38.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.631.10; Tue, 3 Apr 2018 17:59:14 +0000
Received: from CY4PR02MB3334.namprd02.prod.outlook.com
	([fe80::a436:1da6:604f:4a13]) by
	CY4PR02MB3334.namprd02.prod.outlook.com
	([fe80::a436:1da6:604f:4a13%13]) with mapi id 15.20.0631.013;
	Tue, 3 Apr 2018 17:59:14 +0000
From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] python3: Improve logging capabilities for
	do_create_manifest
Thread-Index: AQHTyr5zGFlkEBaE602zAumPEy16xKPu0OMAgAABHwCAAIMW4A==
Date: Tue, 3 Apr 2018 17:59:14 +0000
Message-ID: <CY4PR02MB3334EBE4D1BAD1EB4BA04ED0ACA50@CY4PR02MB3334.namprd02.prod.outlook.com>
References: <1522699721-2863-1-git-send-email-alejandr@xilinx.com>
	<1522749884.11431.231.camel@linuxfoundation.org>
	<1522750124.11431.232.camel@linuxfoundation.org>
In-Reply-To: <1522750124.11431.232.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alejandr@xilinx.com; 
x-originating-ip: [108.65.76.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR02MB2470;
	7:Dwy6vZSn72Q9ZrAeGw78oph1W0VABIRiZ0R6Gr3z+N3GmH5tyy2PE2KQy1p42z0/j3Qpnw0QEwudTG7pSzWiH2sX+zRiP7OyRHsP/Nor4jIFeN8ocP/u1YQE+sQzkaJd0gGKdAJMJcc7KreKZXJ5fh69CZKbHYwev1l5D/aatahARtVpKUBLqkNjQThII7WMY3arAHU3cbNPSNwDsYmazYIPWJixObEfGJpQ4xaDbq4FCWQraoKXuvDZQYSzQqls
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5caaa81a-a224-41cb-41ea-08d5998c9ce6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR02MB2470; 
x-ms-traffictypediagnostic: CY4PR02MB2470:
x-microsoft-antispam-prvs: <CY4PR02MB2470A2646DB0F0E2095E0C4CACA50@CY4PR02MB2470.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(264703809997249)(192813158149592); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231221)(944501327)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR02MB2470; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2470; 
x-forefront-prvs: 0631F0BC3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39860400002)(366004)(396003)(39380400002)(13464003)(189003)(199004)(377424004)(305945005)(2501003)(486005)(53546011)(26005)(102836004)(11346002)(476003)(446003)(7696005)(81166006)(81156014)(5660300001)(486005)(2906002)(8676002)(6246003)(53936002)(76176011)(186003)(6436002)(9686003)(8936002)(55016002)(7736002)(3846002)(5250100002)(99286004)(74316002)(6116002)(86362001)(6506007)(478600001)(229853002)(105586002)(316002)(25786009)(106356001)(3660700001)(66066001)(68736007)(3280700002)(110136005)(97736004)(2900100001)(14454004)(33656002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2470;
	H:CY4PR02MB3334.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: x7M/7NjsdoNQ+1iVAq7i1DUS3+Fb0mi2Hr0PiV3Uh70z+ubi6clYtHNj+so9oldEVvrE0ASaY0N4BcsyJxRrlMkdFZLU52v1pFAbV4hov3NEKrCbzx2L1L21vCq6ei6gv+ve+clVsyiyAPQQPPN3YMwOW1RkqSXOl01TBtXYty71z0BKyGUQjYdS/dK0VV4N6fcOdJu3Q+rkjU5vfeomS2pPzJmcRuwmDAnZe2cs//Zg3VpiZ0EPtwbzZn6Ac5l9d0QUt8Id6sqj/ffWlKXWYJBjNnxFDjJ+f5b8W50LlJSp3zkdZUMzIT2Q72+QqEIfbrMI6jw+YFg30Qlzuq4iR+p3kjK2lC5i7Huv91XuNn4Gm4AM7tBkBtg/xEBf+hERJsYKROr5O13SW+oQtXupaVCMMJcL19eUaZZrVArnJXM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5caaa81a-a224-41cb-41ea-08d5998c9ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2018 17:59:14.7725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2470
Subject: Re: [PATCH] python3: Improve logging capabilities for do_create_manifest
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
X-List-Received-Date: Tue, 03 Apr 2018 18:14:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGV5IFJpY2hhcmQsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJk
IFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2Vu
dDogVHVlc2RheSwgQXByaWwgMywgMjAxOCAzOjA5IEFNDQpUbzogQWxlamFuZHJvIEVuZWRpbm8g
SGVybmFuZGV6IFNhbWFuaWVnbyA8YWxlamFuZHJAeGlsaW54LmNvbT47IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBweXRob24zOiBJbXByb3ZlIGxvZ2dpbmcgY2FwYWJpbGl0aWVzIGZvciBkb19jcmVhdGVfbWFu
aWZlc3QNCg0KT24gVHVlLCAyMDE4LTA0LTAzIGF0IDExOjA0ICswMTAwLCBSaWNoYXJkIFB1cmRp
ZSB3cm90ZToNCj4gT24gTW9uLCAyMDE4LTA0LTAyIGF0IDEzOjA4IC0wNzAwLCBBbGVqYW5kcm8g
RW5lZGlubyBIZXJuYW5kZXogDQo+IFNhbWFuaWVnbyB3cm90ZToNCj4gPiANCj4gPiBBZGRzIGEg
Y291cGxlIG9mIHByaW50cyB0byBnZXQgYSBuaWNlciBsb2csIGFuZCBjcmVhdGVzIGEgc21hbGwg
DQo+ID4gc3VtbWFyeSBvciByZXBvcnQgYWZ0ZXIgY2hlY2tpbmcgZXZlcnkgbW9kdWxlLCBpdCBt
YWtlcyBpdCBtb3JlIA0KPiA+IGZlYXNpYmxlIGZvciBhZG9wdGlvbiwgZWFzaWVyIHRvIGRlYnVn
IHdoeSBhIG1vZHVsZSBlbmRlZCBhdCBhIA0KPiA+IGNlcnRhaW4gcGFja2FnZSBhbmQgc2VlIGhv
dyB0aGUgbWFuaWZlc3Qgd2FzIGNyZWF0ZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxl
amFuZHJvIEVuZWRpbm8gSGVybmFuZGV6IFNhbWFuaWVnbyA8YWxlamFuZHJAeGlsaSANCj4gPiBu
eCAuY29tPg0KPiBDYW4geW91IHJlYmFzZSBhZ2FpbnN0IG1hc3RlciBwbGVhc2UgYXMgdGhpcyBj
bGFzaGVzIHdpdGggb25lIG9mIHlvdXIgDQo+IG90aGVyIGNoYW5nZXMgd2hpY2ggYWxyZWFkeSBt
ZXJnZWQhDQoNCkFjdHVhbGx5LCBJIGhhdmUgaXQgYXBwbGllZCBub3csIHRoYW5rcy4NCg0KUmlj
aGFyZA0KDQpUaGFua3MsIEkgdGhpbmsgbXkgZW1haWwgc2VydmVyIGlzIHRvIGJsYW1lIGZvciB0
aGlzIGVycm9ycy4NCg==

