Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130047.outbound.protection.outlook.com [40.107.13.47])
	by mail.openembedded.org (Postfix) with ESMTP id AACD17F31F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 16:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nY42743zYmgWIdOShhPqISXFy3Jr/nNAlNdspYO23GOKvSh1+O7iwGuzpS9OFrvCco/ZgaLOaL4vcW0PSXJj7sXoIYcAURV684KVceXdw3nlSNw8wBkPdliWUE9CjBNcbHBAzsjahka2A979YmiWwvTnB3r/oNIcASiFOfvxpGaB3sovB/0ReH3QrOIaBPzeKhwDKiFcwunI7CmsLBnM/OLgP5xE7Yt4wvd85UNTUs7AB/Jkud3ToUaLcELyYIpYqnhXQ9sOw49oI47NAPYu2iT4yseO2nI17KM+sEVXlUZY8rVNpyB+9bJBcKlD3WIdoEIYADCGIX7yAMbcP4ppRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0cCAVVrFjPynW0sOMKa2MPsIJwmFjLsVBGZOWjrCqCg=;
	b=W3pA5AMTP3urRrmzW7vQDlsnR5Fe37U73lhAkJoMa1VDvR2OyigjNc9StFQg/qwKFpPh+jZQoYkLK2KeZAUlbrO9W5Eu95juy7fcC2pBAHkg7NkCjbxliPhc0bO96Gk+QPju9QZ75xYXRZfGmSmTQnGkGiG0k8BPWGWyA4WGwdhY83motxmvhWkhfIl8G3t5j3P9TuOstUO9ooAtp6TwKStMt+u8A54+p81qN0ka3VYk+gTe5coXWWSLfhcXWgWM9Uyn8irJ3OgYwovY3xUpSTJcsRjzw8wzGL6SbjrZHRSw44zk9a0VZtEUMGwQWmZjyP5bTabcrK8md8Ogh3XyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0cCAVVrFjPynW0sOMKa2MPsIJwmFjLsVBGZOWjrCqCg=;
	b=IY2tTzQHa+vpxRQ0edcCFgocL7d+edc/ArI45C700+mG3H3nbdF7SMCoT9/sHsuHadHdrvXHjUs2ZrZwHuTfWHeltNSGskGPXOg2yr/lOCzRggYh/5ywt5baLRNan9G+50cJ/xilDx5g16C9krfdVt66xwDgiEpZQH6Z91FeDPk=
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
	VE1PR04MB6592.eurprd04.prod.outlook.com (20.179.234.208) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2538.16; Fri, 13 Dec 2019 16:14:38 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::84d5:595f:cb08:c020]) by
	VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::84d5:595f:cb08:c020%3]) with mapi id 15.20.2516.020;
	Fri, 13 Dec 2019 16:14:38 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
	disable menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajF6eqM5oAgA4tZMA=
Date: Fri, 13 Dec 2019 16:14:38 +0000
Message-ID: <VE1PR04MB6621F85F190F08F43967C895E2540@VE1PR04MB6621.eurprd04.prod.outlook.com>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
	<d25ed9e2-6ff8-355a-1de0-8b51aef9e2c8@kontron.de>
In-Reply-To: <d25ed9e2-6ff8-355a-1de0-8b51aef9e2c8@kontron.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 40983993-35fb-44d7-43c9-08d77fe78dc8
x-ms-traffictypediagnostic: VE1PR04MB6592:
x-microsoft-antispam-prvs: <VE1PR04MB6592B777899CBBAED2902365E2540@VE1PR04MB6592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(13464003)(189003)(8936002)(9686003)(2906002)(71200400001)(7696005)(86362001)(55016002)(81166006)(8676002)(26005)(44832011)(6506007)(81156014)(186003)(53546011)(45080400002)(5660300002)(110136005)(33656002)(76116006)(478600001)(64756008)(52536014)(66556008)(316002)(66446008)(66476007)(66946007)(966005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6592;
	H:VE1PR04MB6621.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HmDnRekGWvfH9djoyZ77V5mhDnhXsJcOnPXECLHKsjL4rcOZS4M9svuDTGzpqP/NmJ2NOu8ifhtIEWvHQ6kqdPoB4Gj6OWNM2Ibz5OHn1ORAKcEyq5NnQ+ocJl/BQ4jgGML0vvUTyygdNeIWW8qtdM6pC5Pv6K5YoRySmKwtwmNS0xkbd5IKNh77pK/1ddSSuDj0cp+lF1BqP1Hr5HSClIhzmX8CumRFGd/i+P5uoX6HitZwygDveVgksplOUR+pg8QPsdOfwYA1TS8atsD9NKXHWmtKyYqh9asyin7HeqZUfybJ7be/GNZoxf/Xn74/gamlGQJgx+CR3dkOPWna7xWLRXvuHaHkjabyH4nh32DYvvqc6wG8LQOKSDOCLpa7h8/BwafIPN3i4NtrggjCfD+UyNmF+HljB3ezDSDk5ycUIk25VboLzVJTPYaKDPCvUohQASNr5cezeUmFXSLrF9yXVm3432K1VBHbXadmbPho/ALb5iYJ9HFD9EbsNkeQ0yIjXUf0O4Jw7D7l9mIkSPhJ6cuyaKhV5F9bJyNrZSQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40983993-35fb-44d7-43c9-08d77fe78dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 16:14:38.7660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RarWvELV17+dM4KDPXUhFSng6U02Bp7XROUc/rK+tb6huH74WxWcM6JILXen9dSG10xtxDDpEGrdVsOpvsg38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6592
Subject: Re: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Fri, 13 Dec 2019 16:14:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBtYWRlIGEgUFIgYXMgd2VsbDoNCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRlZC9v
cGVuZW1iZWRkZWQtY29yZS9wdWxsLzU3DQoNClRvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJv
bi5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciA0LCAyMDE5IDEwOjQ0IEFNDQo+IFRv
OiBUb20gSG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54cC5jb20+OyBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
IDEvMl0gZGV2dG9vbC9zdGFuZGFyZC5weTogQWxsb3cgcmVjaXBlIHRvIGRpc2FibGUgbWVudWNv
bmZpZyBsb2dpYw0KPiANCj4gSGksDQo+IA0KPiBPbiAyMC4xMS4xOSAyMDoyNSwgVG9tIEhvY2hz
dGVpbiB3cm90ZToNCj4gPiB1LWJvb3QuaW5jIHN1cHBvcnRzIHUtYm9vdCByZWNpcGVzIHdpdGgg
b3Igd2l0aG91dCBtZW51Y29uZmlnIFsxXS4NCj4gPiBIb3dldmVyLCBydW5uaW5nIGRldnRvb2wg
b24gYSB1LWJvb3QgcmVjaXBlIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCBtZW51Y29uZmlnDQo+ID4g
cmVzdWx0cyBpbiBhbiBlcnJvcjoNCj4gPg0KPiA+IGNwOiBjYW5ub3Qgc3RhdCAnL2hvbWUvcjYw
ODc0L3Vwc3RyZWFtL2ZzbC14d2F5bGFuZC90bXAvd29yay9pbXg4bW1ldmstZnNsLWxpbnV4L3Ut
Ym9vdC1pbXgvMjAxOC4wMy1yMC91LWJvb3QtaW14LQ0KPiAyMDE4LjAzLy8uY29uZmlnJzogTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+DQo+ID4gVGhlIHByb2JsZW0gaXMgdGhlIGRldnRv
b2wgbG9naWMgYXNzdW1lcyB0aGF0IGFueSByZWNpcGUgd2l0aCBhIGRvX21lbnVjb25maWcgdGFz
aw0KPiA+IHdpbGwgZ2VuZXJhdGUgYSAuY29uZmlnIGluIGRvX2NvbmZpZ3VyZSgpLg0KPiA+DQo+
ID4gRml4IHRoZSBwcm9ibGVtIGJ5IHJlbW92aW5nIHRoZSBhc3N1bXB0aW9uIHdpdGggYSBmbGFn
IHRoYXQgdGhlIHJlY2lwZSBjYW4gY29udHJvbCwNCj4gPiBsaWtlIHRoaXM6DQo+ID4NCj4gPiBk
b19jb25maWd1cmUoKSB7DQo+ID4gICAgICBpZiBbIG1lbnVjb25maWctc3VwcG9ydGVkIF07IHRo
ZW4NCj4gPiAgICAgICAgICAuLi4NCj4gPiAgICAgIGVsc2UNCj4gPiAgICAgICAgICBERVZUT09M
X0RJU0FCTEVfTUVOVUNPTkZJRz10cnVlDQo+ID4gICAgICBmaQ0KPiA+IH0NCj4gPg0KPiA+IFsx
XSBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGb3BlbmVtYmVkZGVkJTJGb3BlbmVtYmVkZGVkLQ0KPiBj
b3JlJTJGY29tbWl0JTJGMTEyNzhlM2IyYzc1YmU4MDY0NWI5ODQxNzYzYTk3ZGJiMzVkYWFkYyZh
bXA7ZGF0YT0wMiU3QzAxJTdDdG9tLmhvY2hzdGVpbiU0MG54cC5jb20lN0M1ZDY2OGY2NA0KPiBk
M2EwNDRhYmIxMWUwOGQ3NzhkOTJiZWYlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYz
NSU3QzAlN0MwJTdDNjM3MTEwNzQ2NDUyNDA3NzU2JmFtcDtzZGF0YT1BSGp2dzkxRzhONw0KPiBX
dWYlMkJPUkIlMkI1RTdjeEU1Y2NpQ3BuRWt0SXFrb0ZLTVklM0QmYW1wO3Jlc2VydmVkPTANCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNv
bT4NCj4gDQo+IEknbSBleHBlcmllbmNpbmcgdGhpcyBpc3N1ZSBzaW5jZSBtb3ZpbmcgdG8gemV1
cy4gWW91ciBmaXggaW4gdGhpcw0KPiBzZXJpZXMgd29ya3MgZmluZSBmb3IgbWUgYW5kIEkgd291
bGQgcmVhbGx5IGxpa2UgdG8gc2VlIHRoaXMgbWVyZ2VkIGluIHpldXMuDQo+IA0KPiBUaGFua3Ms
DQo+IEZyaWVkZXINCj4gDQo+ID4gLS0tDQo+ID4gICBzY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5k
YXJkLnB5IHwgNiArKysrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9saWIvZGV2dG9v
bC9zdGFuZGFyZC5weSBiL3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkNCj4gPiBpbmRl
eCA4ZDljMWEzMDIyLi42NmJkMTQxNWMzIDEwMDY0NA0KPiA+IC0tLSBhL3NjcmlwdHMvbGliL2Rl
dnRvb2wvc3RhbmRhcmQucHkNCj4gPiArKysgYi9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5kYXJk
LnB5DQo+ID4gQEAgLTk0MCw4ICs5NDAsMTAgQEAgZGVmIG1vZGlmeShhcmdzLCBjb25maWcsIGJh
c2VwYXRoLCB3b3Jrc3BhY2UpOg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgJ31cbicp
DQo+ID4gICAgICAgICAgICAgICBpZiByZC5nZXRWYXJGbGFnKCdkb19tZW51Y29uZmlnJywndGFz
aycpOg0KPiA+ICAgICAgICAgICAgICAgICAgIGYud3JpdGUoJ1xuZG9fY29uZmlndXJlX2FwcGVu
ZCgpIHtcbicNCj4gPiAtICAgICAgICAgICAgICAgICcgICAgY3AgJHtCfS8uY29uZmlnICR7U30v
LmNvbmZpZy5iYXNlbGluZVxuJw0KPiA+IC0gICAgICAgICAgICAgICAgJyAgICBsbiAtc2ZUICR7
Qn0vLmNvbmZpZyAke1N9Ly5jb25maWcubmV3XG4nDQo+ID4gKyAgICAgICAgICAgICAgICAnICAg
IGlmIFsgISAke0RFVlRPT0xfRElTQUJMRV9NRU5VQ09ORklHfSBdOyB0aGVuXG4nDQo+ID4gKyAg
ICAgICAgICAgICAgICAnICAgICAgICBjcCAke0J9Ly5jb25maWcgJHtTfS8uY29uZmlnLmJhc2Vs
aW5lXG4nDQo+ID4gKyAgICAgICAgICAgICAgICAnICAgICAgICBsbiAtc2ZUICR7Qn0vLmNvbmZp
ZyAke1N9Ly5jb25maWcubmV3XG4nDQo+ID4gKyAgICAgICAgICAgICAgICAnICAgIGZpXG4nDQo+
ID4gICAgICAgICAgICAgICAgICAgJ31cbicpDQo+ID4gICAgICAgICAgICAgICBpZiBpbml0aWFs
X3JldjoNCj4gPiAgICAgICAgICAgICAgICAgICBmLndyaXRlKCdcbiMgaW5pdGlhbF9yZXY6ICVz
XG4nICUgaW5pdGlhbF9yZXYpDQo+ID4NCg==

