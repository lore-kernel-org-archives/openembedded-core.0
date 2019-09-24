Return-Path: <prvs=1632e4f35=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id B3FF37DF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 01:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1569289177; x=1600825177;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=q1+Gud2fDF6k5jpgfuk26bVollLEuOlE7e1LP2n9EGQ=;
	b=G5NqtWslmhveJEy0A8gKDw8glLGD80unh+Xwm9Y29HOdpY6gxCa2tA3V
	z6oHfr4sHVSw576kWWEEgT1f0w4e4gYXLfMOPw8Jj0pjOit2brNUhJjBo
	w1SHlsXjP26kDijZ/WyGpeg/+AzMkfre7vbvFlJTqlfERIOMdKKz5exPl
	ABw6srwCpgAJsCF7XxvO3AY7c3wUupKUl5ce4vN6cKqEjHYacn2D+6In+
	itIXm87kQZ/yysoOIGbaM4X3VwGUDqUGIL12qij6WmLm+bNIdzYijdVPM
	uJwW35KaGz0zhvX+Y34bNN40zYFkpzBmf71Vxds86wCZYFV2OrgzGvW5+ g==;
IronPort-SDR: ZWkvUDib1iiUJMTZLbxbh0HgYvMefLA3/h1+QxbQmCsIog1EAh3CQUBFEUZwfyahCeOY/RT3mM
	ht1pZKW5kI6KpB7RxWR+xh/8ygv7ucrpJUDpJaCX71eOX2EV79/I8RxuNvP3TjfLcyEf7kXsxG
	NI+77WlpwrR4VTH4j9/DuLqOCrjPpbtJwnw9uyp44Uh8g5kZUTUEJNt298z5MUra4Ku+Tg62co
	bhtK9ac0bufJ0o2/fpa5NDq2Dj+dF31yavpb7JcfgAoufdg5ydiVWtn77cXTeI5i6MfIE2+ety
	piw=
X-IronPort-AV: E=Sophos;i="5.64,542,1559491200"; d="scan'208";a="119713492"
Received: from mail-dm3nam05lp2053.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.53])
	by ob1.hgst.iphmx.com with ESMTP; 24 Sep 2019 09:39:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=A6SX36SoUOdFgWLwwqeOQUWbQEIzeQuV4BK2HHn3XRonvOE1ZAeul7VYfzS+SjgCfhcwymHY1sNJPBcJMnFQXfa76SnlQFtdWjwls5GWCXDqFe2pvzpIPHwgkG3RdgPkAfE1CwdEoIhQuDYHcoyE7Qif06LcudpEcdaoX2iJ5AEjKciDOkRnBOZ2xXAYaKH9UE3KX5JtQ4wBsgbaFgnpfiPTSbmnh4Y8JzVPNt9wVWXd6jsU3vEJU904Cj0ZpRHIcg8tbHS5UfVnMqfCdhfazAX7bvoCK0cY1di07ZIkPxZ8v6CZz7uIGAi6r+SlZH3bCma+cROL3NVSg8mXkyV4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q1+Gud2fDF6k5jpgfuk26bVollLEuOlE7e1LP2n9EGQ=;
	b=S5Lih2s3wqRVUfUl8XqNODEPeHYp6o8CtpmcwgFQ9gwxbSMVlgnz6v2/J6cvIGVru/rjTSnEewWidn/w+el8yBicqjGOH3WvZ8YRp+L+P+nhCOiZFsC3RbfHfGgIe2FZYoW19oO6dmZ3IdWkIzSj+Yrh/GuQjXXVblwpokRcTV/YsnODO8SFe8GmhsXnSuRYiq74zK2fab5m3vUJiH3OK0mWMlCMsAmPOV77aDRA8wf2/uNXroxsTjvD2FOrgsCZ3yCgknjcYtUgj1vB6RSnblASZYSCu161BFfKalt/xT4y1/4UxSNYTaQe0FtTllNmMGK+BTpc6YNcpi2vfzDOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q1+Gud2fDF6k5jpgfuk26bVollLEuOlE7e1LP2n9EGQ=;
	b=eTftoblmg1IUtMNWBhbZqs3Ro7aP+jrD+eN2suxkiEZN2Bbna/QsULzbZUOJ7f6f5Jw/2PBES6Dtz2z5E2eAIIJGEI2c46ykGAIkFMpDNMUrQhZo97sIXOlxsbUbexpePRauXkz8V+DHEjWla0vIDtNV60XG3h97NoMjImUc44w=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5447.namprd04.prod.outlook.com (20.178.48.203) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.20; Tue, 24 Sep 2019 01:39:34 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::88bb:c568:c010:3208]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::88bb:c568:c010:3208%7]) with mapi id 15.20.2284.023;
	Tue, 24 Sep 2019 01:39:34 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [OE-core] qemu 4.1 boot regression with riscv/musl
Thread-Index: AQHVcl/oXk4Qm74jXUaOOE5jY/HQoac6Af2AgAALF4A=
Date: Tue, 24 Sep 2019 01:39:34 +0000
Message-ID: <7e0cc8d45ea1b5556dccf61519de8e0d31575550.camel@wdc.com>
References: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
	<CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [2601:646:8e00:37b2:d3fd:11e9:7cc1:adaf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d56a69f-5939-4d50-ed7c-08d740900d78
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5447; 
x-ms-traffictypediagnostic: BYAPR04MB5447:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR04MB544796EF68441FB029DDF1B490840@BYAPR04MB5447.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(486006)(64756008)(66556008)(66476007)(102836004)(316002)(110136005)(76116006)(53546011)(6116002)(5660300002)(71190400001)(81166006)(7736002)(2906002)(81156014)(66446008)(305945005)(8676002)(256004)(6512007)(476003)(25786009)(11346002)(86362001)(71200400001)(446003)(6436002)(2616005)(6306002)(229853002)(478600001)(46003)(4326008)(6246003)(966005)(66946007)(14454004)(76176011)(186003)(118296001)(6486002)(8936002)(6506007)(2501003)(99286004)(36756003)(14444005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5447;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IxKYTZg9RtnFIt3NI4U5UsDqkaqCaSs09JwhVYUap7PwOnLSEg0OlyvAZSxjzTnQeLlO2J6JPSQu9+ByO1eAHuo5B+llNqJ2SJ8qxLuCUciPqP+KEVTBS2UVFoEaGGSUA68O8sUySAhvt78fcLCf1xvSVoEb0iAZD+kU1Q94n6HJl5lWtQPtSULQf7MYNfss1tRVMtXNy1dpvjTcT7yHJY0Id5qW6dH7ivx94emgaHuy/oZCAyEPkBeChsJzpKCnnj1D56Tqw5gc9SARx2gqc9Ud1UyolMaY8KMa0/TOdZoF36mvG9qswyClThHG1cEyPQU0M8ub5tRsl1ZTaRMfUmF3tnbe/tGKGhXWccl8kimUogzENRD7OAmYoQ0XkHV4xGFKoY8ZXiuMVd+uCEXKUaMFGbvRDNtNwEw8KBT6axY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d56a69f-5939-4d50-ed7c-08d740900d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 01:39:34.1057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6rdtzX3DAYYLsyHImjzIQfbcybXhTUGWdVDwEQvFjbD1kW/3/ZPJGM8WwLqqayrckT5I0+sQ6vix4WkL13P8X04oSeD15/tvMVicJLI8/AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5447
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu 4.1 boot regression with riscv/musl
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
X-List-Received-Date: Tue, 24 Sep 2019 01:39:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <453B61D9D36B004189B5D63949D040B7@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE5LTA5LTIzIGF0IDE3OjU5IC0wNzAwLCBBbGlzdGFpciBGcmFuY2lzIHdyb3Rl
Og0KPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAzOjQwIFBNIEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+IHdyb3RlOg0KPiA+IEFsaXN0YWlyLA0KPiA+IA0KPiA+IE9FLWNvcmUgcWVtdSB1
cGdyYWRlIHRvIDQuMSBoYXMgZW5kZWQgdXAgd2l0aCByZWdyZXNzaW5nIG11c2wvcmlzY3YNCj4g
PiBwb3J0LiBJIGNvdWxkIHBpbiBwb2ludCBpdCB0bw0KPiA+IA0KPiA+IGh0dHBzOi8vZ2l0Lm9w
ZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9pZD01MGE3ZGVjOTU2MTgw
ODA5NjJlNTZmZDM0N2Y1MDVlNjkxYjdhZDZmDQo+ID4gDQo+ID4gaXQgd29ya3MgZmluZSB3aXRo
IDQuMCwgSSBoYXZlbnQgbG9va2VkIGZ1cnRoZXINCj4gPiANCj4gPiBUbyByZXByb2R1Y2UNCj4g
PiANCj4gPiBidWlsZA0KPiA+IE1BQ0hJTkU9cWVtdXJpc2N2NjQgVENMSUJDPW11c2wgIGJpdGJh
a2UgY29yZS1pbWFnZS1taW5pbWFsDQo+ID4gVENMSUJDPW11c2wgcnVucWVtdSBub2dyYXBoaWMN
Cj4gDQo+IFRoYW5rcywgSSBjYW4gcmVwcm9kdWNlIHRoaXMgYW5kIGFtIGJpc2VjdGluZyBRRU1V
IG5vdy4NCg0KVGhpcyBRRU1VIHBhdGNoIGNhdXNlcyB0aGUgZmFpbHVyZS4gSXQgcmV2ZXJ0cyBj
bGVhbmx5IG9uIG1hc3RlciBhbmQNCnRoYXQgZml4ZXMgdGhlIGlzc3VlOg0KDQpSSVNDLVY6IENs
ZWFyIGxvYWQgcmVzZXJ2YXRpb25zIG9uIGNvbnRleHQgc3dpdGNoIGFuZCBTQw0KDQpUaGlzIHBy
ZXZlbnRzIGEgbG9hZCByZXNlcnZhdGlvbiBmcm9tIGJlaW5nIHBsYWNlZCBpbiBvbmUNCmNvbnRl
eHQvcHJvY2VzcywNCnRoZW4gYmVpbmcgdXNlZCBpbiBhbm90aGVyLCByZXN1bHRpbmcgaW4gYW4g
U0Mgc3VjY2VlZGluZyBpbmNvcnJlY3RseQ0KYW5kDQpicmVha2luZyBhdG9taWNzLg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBKb2VsIFNpbmcgPGpvZWxAc2luZy5pZC5hdT4NClJldmlld2VkLWJ5OiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+DQpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+DQoNCkknbGwgaW52ZXN0aWdhdGUgYSBmdWxs
IHNvbHV0aW9uIHRvbW9ycm93LCBpbiB0aGUgbWVhbiB0aW1lIGRvIHlvdSB3YW50DQp0byBqdXN0
IHJldmVydCB0aGUgcGF0Y2g/DQoNCkFsaXN0YWlyDQoNCj4gDQo+IEFsaXN0YWlyDQo+IA0KPiA+
IFRoYW5rcw0KPiA+IC1LaGVtDQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlz
dA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1j
b3JlDQo=

