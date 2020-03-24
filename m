Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.2608.1585074865386363818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 11:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=R+IQc24F;
 spf=pass (domain: nxp.com, ip: 40.107.22.80, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gppSSuTSUxZtu9NcenetbNfpd7KPxRp44lYzORNcaWLjk8NG7yWbUnB+VtS0WWj5/dWsRu45weKWJ5y5z5yi6bpvtioYnBUQGmdKVdXjoXlQj7phFK4Iwr/NZyYlsfuv68y/dqtNLu6fBE25a74mjQAytw30sOS7mRiCQ6vXVXIZQF+vG1aUtZWCZsH7Kf3TpyZr9+8eW3z678QgGk3Ofbhzl5F+GkxZITRikL1CHW9aWeGSD5ibemVnKW0CCz+TpNOxETUBvFcs4eG95za53XyXXGBe/AxY0D7y4Kt90fTCQFk0tfkXBISRh63Ya0ry+zUXNnNKyGR9r19h0mG1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBUfcIJf2AhgXkVnBnt0gtNQVVgMCW0UCqIvDbvMcr4=;
 b=jidXw+fsNPa4bcxUXy3/mAm5Tf82R3ICfyRc0qDKV8KXd/09GJ25hyVBaCSo3jRWJVASwpEnIthpYs8I0C7zoaZAKGaxdqIoZQre9bKAVIz+sgVfCNh152280vpdGoMSsmBrXeMDIhYzW9+DxZj3h/fz4IbRom2nCNWnEfH0Gg5dYeacbGFwHS7e0EqFJq3rMLcTGzKUHCxWeJoj56n1ofXQvXWrFp2YTZEzvswCiVhVLDBzo1WbBGqe5FGrp3Mph3/hdMzTjUEN8mpxpXVQlDu8RG1PANz/QCU8nVzLvi2mLsRwQ0PFQEkS+WQ+qD5nFtPfooIu5u+4vJBmoAN0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBUfcIJf2AhgXkVnBnt0gtNQVVgMCW0UCqIvDbvMcr4=;
 b=R+IQc24FvHXz8LtRCg5s49I7tHnygY0VMma2HwxkwH9hKiXrmG6W16GdlJz+9A+vmgPS3B8ifOqP0zvIzUrIU4l6eVRxX6jQOU+EoyW3roZ2W/rMvgrjPB3/OU8BH3YftaPqSZh0RDjuL7gudMHzqhdMY4moZV219oc/d+F8nmg=
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
 VE1PR04MB6590.eurprd04.prod.outlook.com (20.179.234.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Tue, 24 Mar 2020 18:34:23 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.023; Tue, 24 Mar 2020
 18:34:23 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Antoine Manache
	<a.manache@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
Thread-Topic: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK
 toolchain
Thread-Index: AQHWAf4ySYaIHuSCg0uYVir/1OX0+KhX/oUAgAAKeYCAAAKpUA==
Date: Tue, 24 Mar 2020 18:34:23 +0000
Message-ID: 
 <VE1PR04MB6621F3264C205F46AACCA6AFE2F10@VE1PR04MB6621.eurprd04.prod.outlook.com>
References: <20200324170259.3206-1-tom.hochstein@nxp.com>
	 <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
 <5e1f58719f8835201ddcd82bb19af555f5c2dcc2.camel@linuxfoundation.org>
In-Reply-To: 
 <5e1f58719f8835201ddcd82bb19af555f5c2dcc2.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [63.246.163.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ea24580-d827-4a49-dde9-08d7d021f95b
x-ms-traffictypediagnostic: VE1PR04MB6590:
x-microsoft-antispam-prvs: 
 <VE1PR04MB65908F1A3195EA800923B61EE2F10@VE1PR04MB6590.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(71200400001)(81166006)(81156014)(7696005)(55016002)(8936002)(8676002)(86362001)(110136005)(316002)(44832011)(9686003)(4326008)(76116006)(15650500001)(6506007)(966005)(33656002)(66946007)(66556008)(66476007)(186003)(66446008)(52536014)(26005)(64756008)(2906002)(5660300002)(53546011)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6590;H:VE1PR04MB6621.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OOeZxIpyJUEWFCLm9+gM1hw88MqlIni2VUl9td43sfGsR+IUiVM0fcMarinROypJl6J3jgK4492Hh00xFNEb4eD2j/a2/n288Jj/b8VAlCzZbW7WL32LN+vVGNBkXn6Lazs6VhZrWENx+9i+1GveDL8jNgdaqxABsNgjrYYojL+KIi34AGV84r3L7KjisFoZDxlBIQ9QoHJA0XPTLG2w13opwbPm2Kae6D7eDi6qWH2XDpaMQyTvlGVnEZ40sUbi95jDRZMzSAoTaPeNd+ZeiYbDwfOJGZ65WppIuemR3IkD1vwb66ltFaOLazcaQJhXCultuIoWLPogWjwqJw0OHHiRJgtU2xHDtciENrwp6AWI/Mv4Pw1Hedp10ALLuuyvsbqiJCCRMS/zr0fzPqM0V6Te8RYl9NFGTjRAMM+D1oceQ5OSL2YAYmWp43o5Qc01B9fh08Or4QZObwlvS5URSfGvU7RCbNIbkz4jyOy+jqWgjvBHnZoTPW5Wjclr50vTNcnJ2RLS++OMFxHvNMmaJw==
x-ms-exchange-antispam-messagedata: 
 Y/sgi2yioZpFsGIk5JDZ9wr1/HujrKQJWBQQViXFJ5S6SinCs7NBJJLMCvPgpFyIrxm4dQ+0/3Dx+LLc82hmMHeEvlLdN2hoveZmLg5NiJjZKEBPu3XBSAuhih/nHDkWLM5PhdeqQrEETMSMHoB8+A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea24580-d827-4a49-dde9-08d7d021f95b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 18:34:23.1690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SP9dMmjMYxT9CAQgs1BFEQJ3KFxONh2exy0+Nda1ftniwA8afDN3g4VxMSLIuZOriBQUNd0YVWYBhSA4mjn/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6590
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1h
cmNoIDI0LCAyMDIwIDE6MDMgUE0NCj4gVG86IEFudG9pbmUgTWFuYWNoZSA8YS5tYW5hY2hlQGdt
YWlsLmNvbT47IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT4NCj4gQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXVtQQVRDSF0gc2VjdXJpdHlfZmxhZ3MuaW5jOiBmaXggZmxhZ3MgbWlzc2luZyBmcm9t
IFNESyB0b29sY2hhaW4NCj4gDQo+IE9uIFR1ZSwgMjAyMC0wMy0yNCBhdCAxODoyNSArMDEwMCwg
QW50b2luZSBNYW5hY2hlIHdyb3RlOg0KPiA+IEkndmUgYWxyZWFkeSBzZW50IHRoaXMgcGF0Y2gg
ZmV3IG1vbnRocyBhZ28gYnV0IG5vdCB0YWtlbiBpbnRvDQo+ID4gYWNjb3VudCB5ZXQuDQo+IA0K
PiBDYW4gc29tZW9uZSBleHBsYWluIG1vcmUgYWJvdXQgdGhlIGlzc3VlIGhlcmUgcGxlYXNlPw0K
PiANCj4gU2hvdWxkbid0IHRoZXNlIGZsYWdzIGJlIGFkZGVkIHRvIHRoZSBTREsgdG9vbGNoYWlu
IGVudmlyb25tZW50IGZpbGVzDQo+IHJhdGhlciB0aGFuIGNvZGVkIGludG8gdGhlIGNvbXBpbGVy
PyBXaHkgYXJlbid0IHRoZXkgYmVpbmcgY29kZWQgaW4/IG9yDQo+IGlzIGdjYyBiZWluZyBtaXNj
b25maWd1cmVkPw0KDQpUaGUgcmVjaXBlIG1ldGEtZW52aXJvbm1lbnQgaW5oZXJpdHMgY3Jvc3Mt
Y2FuYWRpYW4gYW5kIHRvb2xjaGFpbi1zY3JpcHRzLiBUaGUgbGF0dGVyIGdlbmVyYXRlcyB0aGUg
U0RLIHRvb2xjaGFpbiBlbnZpcm9ubWVudCBmaWxlIHVzaW5nIFRBUkdFVF9DQ19BUkNIIGFuZCBU
QVJHRVRfTERGTEFHUyBsaWtlIHRoaXM6DQoNCgllY2hvICdleHBvcnQgQ0M9IiR7VEFSR0VUX1BS
RUZJWH1nY2MgJHtUQVJHRVRfQ0NfQVJDSH0gLS1zeXNyb290PSRTREtUQVJHRVRTWVNST09UIicg
Pj4gJHNjcmlwdA0KCWVjaG8gJ2V4cG9ydCBMREZMQUdTPSIke1RBUkdFVF9MREZMQUdTfSInID4+
ICRzY3JpcHQNCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRlZC9vcGVuZW1iZWRkZWQt
Y29yZS9ibG9iL21hc3Rlci9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJjbGFzcyNM
ODINCg0KV2l0aCBjbGFzcy1jcm9zcy1jYW5hZGlhbiBhcyB0aGUgYXBwbGljYWJsZSBvdmVycmlk
ZSwgdXBkYXRpbmcgdGhlIHNlY3VyaXR5IGZsYWdzIGZvciBjbGFzcy10YXJnZXQgZG9lcyBub3Ro
aW5nIGZvciB0aGUgU0RLIHRvb2xjaGFpbiwgaGVuY2UgdGhlIHByb3Bvc2VkIGZpeDoNCg0KVEFS
R0VUX0NDX0FSQ0hfYXBwZW5kX2NsYXNzLXRhcmdldCA9ICIgJHtTRUNVUklUWV9DRkxBR1N9Ig0K
K1RBUkdFVF9DQ19BUkNIX2FwcGVuZF9jbGFzcy1jcm9zcy1jYW5hZGlhbiA9ICIgJHtTRUNVUklU
WV9DRkxBR1N9Ig0KIFRBUkdFVF9MREZMQUdTX2FwcGVuZF9jbGFzcy10YXJnZXQgPSAiICR7U0VD
VVJJVFlfTERGTEFHU30iDQorVEFSR0VUX0xERkxBR1NfYXBwZW5kX2NsYXNzLWNyb3NzLWNhbmFk
aWFuID0gIiAke1NFQ1VSSVRZX0xERkxBR1N9Ig0KDQpUb20NCg==
