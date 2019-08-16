Return-Path: <jacob.kroon@mikrodidakt.se>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10131.outbound.protection.outlook.com [40.107.1.131])
	by mail.openembedded.org (Postfix) with ESMTP id A603B7E97A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 06:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZdS6VQwvcdq4R6tqNMUtYsXuL7gylAhFjwsCwV2xSWFmiKlZ8mnI3OA63UXWi3xLYsE7fag+xPSZRsd47NMtVmScaAZkB4PdSQSyd5w4U3HDjo567bVD6iamHHRj2wfzMKMQRmVjDsu2+Mm9ICXnfiihGXQrEVUqo5sJZabfhLjL93XD0UcAeIgszhRA3oLNWngCnnPSsx6BMNboFV26jrDLjLUR2UtF1v7oakAeMkQxBiHN7nE9p5ccRB64/xZus7Fan5OQ4koU4LaNjWaUGmZmRbjUN1n5hGoi/tYCxsvAFlMsmy6GV86vXuLKUazXE0DA8a6WvpjTTN/fxiPxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vY2Zu8z42pdMBcJ4d3qJvUFORHbyF0DYG2UlfOpqalQ=;
	b=EqZ70Emi6ONsGo2RYMhvycP6QIf7zW7jAq6LyJNaG1mXxcplyJxD3mHvi4A+r4WC9eEc9l290xsZ0lph6DFXjEEnNu+wsgDRtdDw2fta6wyJv4IL1/UUAJiIkRsIUWDqAH+Tkbvz2IrHOGbO81O95lf10dv8WfBQCKX9v89RNqASv/8KwpT3CMd2URVXBJp0/9vGVRU+NCunyBeXlfqJCMb7Y355WUMR1rWsI74LMuR+x6BAdDRvLhhqoBRuwa9qNmxLb7ixMT6R7jkQk1B9znq0S8BftqFHgWj5aOFnvamqyKTUoY9r4IZZBOy3H0r3vH7PBlUmABpsOoJLfHa+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=mikrodidakt.se; dmarc=pass action=none
	header.from=mikrodidakt.se; dkim=pass header.d=mikrodidakt.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ugglorna.onmicrosoft.com; s=selector1-ugglorna-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vY2Zu8z42pdMBcJ4d3qJvUFORHbyF0DYG2UlfOpqalQ=;
	b=TdpHGLoECclX3N+cGS2ehJ+Mg+k7FX0qqi4kuZHQH1+zwXXokKYJ17ZYT42HUPmeH8h01ExgvFjR2xZF08BLlHAcrUW7C5CwRNYTMothcaRhB3S6HUQwfY4qHItm1NYwSXjwtNdscRn1wqMGm+kgq5t/OQkT8q5468ghbsZC4qg=
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com (52.135.166.20) by
	AM6PR08MB5029.eurprd08.prod.outlook.com (10.255.123.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.13; Fri, 16 Aug 2019 06:40:22 +0000
Received: from AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a]) by
	AM6PR08MB3205.eurprd08.prod.outlook.com
	([fe80::20a0:fa68:2f63:5a7a%7]) with mapi id 15.20.2157.022;
	Fri, 16 Aug 2019 06:40:22 +0000
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: Alistair Francis <alistair.francis@wdc.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] qemuriscv64: Specify the firmware as a
	bios instead of kernel
Thread-Index: AQHVU/16xmsAy4hhS0+Bjsxujg+h4Q==
Date: Fri, 16 Aug 2019 06:40:22 +0000
Message-ID: <f641f2e5-ca75-3580-24ba-b785c17981af@mikrodidakt.se>
References: <20190815213145.8986-1-alistair.francis@wdc.com>
	<20190815213145.8986-3-alistair.francis@wdc.com>
In-Reply-To: <20190815213145.8986-3-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0200.eurprd05.prod.outlook.com
	(2603:10a6:3:f9::24) To AM6PR08MB3205.eurprd08.prod.outlook.com
	(2603:10a6:209:4a::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jacob.kroon@mikrodidakt.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.185.29.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 899b35d9-4371-438f-7630-08d722149ca2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR08MB5029; 
x-ms-traffictypediagnostic: AM6PR08MB5029:
x-microsoft-antispam-prvs: <AM6PR08MB5029657A9F318C5E1C4065FA9BAF0@AM6PR08MB5029.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:109;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39830400003)(396003)(366004)(136003)(189003)(199004)(6506007)(66476007)(316002)(256004)(66066001)(66556008)(66446008)(64756008)(186003)(66946007)(6486002)(53546011)(26005)(71190400001)(7736002)(53936002)(71200400001)(110136005)(386003)(305945005)(486006)(2501003)(52116002)(508600001)(36756003)(6512007)(3846002)(6116002)(229853002)(102836004)(81156014)(44832011)(476003)(76176011)(6246003)(86362001)(14454004)(8936002)(446003)(11346002)(8676002)(31686004)(2906002)(6436002)(25786009)(31696002)(2616005)(5660300002)(81166006)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB5029;
	H:AM6PR08MB3205.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mikrodidakt.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RQuHsmp1UbtJJpJComtI5y98NjPlixJtgo95iIeEseoiHnZId3eiKTLxtamNL9w7oT1/acmqBX60XrNKlrmtNyyk6Au+VrccLroe/hFCOYp2d9zpAEZPTqGBtGQizGwmlJgLmBlQkEuHu/3+NQOL16HlHLd+wrO65yOuE52n5FbhP9R6MvyKpGAUY9xef99vEc80mkH5mxNm8uGoBiz/qFu39fktSjeHaF5pknxmE0ZhhecmNMwKUFd0x/1w14DUS2OBI2x3OYaVtcK/oWizuL1Xr7XZ5M+JAyP0YXN8dgUHHquI0IKjuZQl63fNt+VwKbbedOwS9eE/5Q1i+lmRbe+FBDem1326+aFWFxMwpeDrtLQJCcr5qLRdxY1MV7hGfN9AJslUBWj1c7Cqg4+GTqKsuThyUOhK7BRvnggW15w=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: mikrodidakt.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 899b35d9-4371-438f-7630-08d722149ca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 06:40:22.0946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d8b8e37-ad11-4b86-9071-4e3fa1b980be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMrrj/D3LZRl+fxRKsatBKKm7dfhJMF04OCvYoH/Etdd4/p+GGfPcoVMm1w+u5lkmZW27cXVL0lh/5GCznT+BEGa78Z1VXr8wDJ6iLmMrLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5029
Subject: Re: [PATCH 3/3] qemuriscv64: Specify the firmware as a bios instead of kernel
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
X-List-Received-Date: Fri, 16 Aug 2019 06:40:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <771E5ACEBE39D84C9CF2B58EC40815EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDgvMTUvMTkgMTE6MzEgUE0sIEFsaXN0YWlyIEZyYW5jaXMgd3JvdGU6DQo+IFNp
Z25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4N
Cj4gLS0tDQo+ICAgbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi9xZW11cmlzY3YuaW5j
IHwgMiArLQ0KPiAgIG1ldGEvY29uZi9tYWNoaW5lL3FlbXVyaXNjdjY0LmNvbmYgICAgICAgICAg
ICB8IDIgLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9u
cygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi9x
ZW11cmlzY3YuaW5jIGIvbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9yaXNjdi9xZW11cmlzY3Yu
aW5jDQo+IGluZGV4IDc5N2EyNzY2MGQuLjJlYmQwYTAxZjIgMTAwNjQ0DQo+IC0tLSBhL21ldGEv
Y29uZi9tYWNoaW5lL2luY2x1ZGUvcmlzY3YvcWVtdXJpc2N2LmluYw0KPiArKysgYi9tZXRhL2Nv
bmYvbWFjaGluZS9pbmNsdWRlL3Jpc2N2L3FlbXVyaXNjdi5pbmMNCj4gQEAgLTI4LDcgKzI4LDcg
QEAgVUJPT1RfRU5UUllQT0lOVF9yaXNjdjY0ID0gIjB4ODAyMDAwMDAiDQo+ICAgUUJfS0VSTkVM
X0NNRExJTkVfQVBQRU5EID0gImVhcmx5Y29uPXNiaSINCj4gICBRQl9NRU0gPSAiLW0gNTEyIg0K
PiAgIFFCX01BQ0hJTkUgPSAiLW1hY2hpbmUgdmlydCINCj4gLVFCX0RFRkFVTFRfS0VSTkVMID0g
ImZ3X2p1bXAuZWxmIg0KPiArUUJfREVGQVVMVF9CSU9TID0gImZ3X2p1bXAuZWxmIg0KPiAgIFFC
X1RBUF9PUFQgPSAiLW5ldGRldiB0YXAsaWQ9bmV0MCxpZm5hbWU9QFRBUEAsc2NyaXB0PW5vLGRv
d25zY3JpcHQ9bm8iDQo+ICAgUUJfTkVUV09SS19ERVZJQ0UgPSAiLWRldmljZSB2aXJ0aW8tbmV0
LWRldmljZSxuZXRkZXY9bmV0MCxtYWM9QE1BQ0AiDQo+ICAgUUJfUk9PVEZTX09QVCA9ICItZHJp
dmUgaWQ9ZGlzazAsZmlsZT1AUk9PVEZTQCxpZj1ub25lLGZvcm1hdD1yYXcgLWRldmljZSB2aXJ0
aW8tYmxrLWRldmljZSxkcml2ZT1kaXNrMCINCj4gZGlmZiAtLWdpdCBhL21ldGEvY29uZi9tYWNo
aW5lL3FlbXVyaXNjdjY0LmNvbmYgYi9tZXRhL2NvbmYvbWFjaGluZS9xZW11cmlzY3Y2NC5jb25m
DQo+IGluZGV4IGRiYThmMDllOTMuLjk5YjQ4YjMwOWIgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY29u
Zi9tYWNoaW5lL3FlbXVyaXNjdjY0LmNvbmYNCj4gKysrIGIvbWV0YS9jb25mL21hY2hpbmUvcWVt
dXJpc2N2NjQuY29uZg0KPiBAQCAtNCw4ICs0LDYgQEANCj4NCj4gICByZXF1aXJlIGNvbmYvbWFj
aGluZS9pbmNsdWRlL3Jpc2N2L3FlbXVyaXNjdi5pbmMNCj4NCj4gLVFCX09QVF9BUFBFTkQgKz0g
Ii1zaG93LWN1cnNvciAtbW9uaXRvciBudWxsIC1kZXZpY2UgbG9hZGVyLGZpbGU9JHtERVBMT1lf
RElSX0lNQUdFfS8ke0tFUk5FTF9JTUFHRVRZUEV9LGFkZHI9MHg4MDIwMDAwMCINCj4gLQ0KDQpX
YXMgaXQgaW50ZW50aW9uYWwgdG8gcmVtb3ZlIHRoZXNlIGxpbmVzIGFzd2VsbCA/IEkgY2FuJ3Qg
dGVsbCBmcm9tIHRoZQ0KY29tbWl0IG1lc3NhZ2UuDQoNCi9KYWNvYg0KDQo+ICAgRVhUUkFfSU1B
R0VERVBFTkRTICs9ICJ1LWJvb3QiDQo+ICAgVUJPT1RfTUFDSElORSA9ICJxZW11LXJpc2N2NjRf
ZGVmY29uZmlnIg0KPiAgIFVCT09UX0VMRiA9ICJ1LWJvb3QiDQo+DQoNCg0KDQpbbWlrcm9kaWRh
a3RdDQpKYWNvYiBLcm9vbiDigKIgKzQ2IDQ2MzI1MDQwDQoNCm1pa3JvZGlkYWt0LnNlIOKAoiBT
a2lmZmVydsOkZ2VuIDQ4LCBTRS0yMjQgNzggTFVORCwgU3dlZGVuDQoNCkNvbnN1bHRhbnMgc2lu
Y2UgMTk4MCDigKIgU1csIEhXLCBFbWJlZGRlZCBTeXN0ZW1zLCBMaW51eA0KDQoNCg==

