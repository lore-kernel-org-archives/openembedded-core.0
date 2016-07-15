Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0071.outbound.protection.outlook.com [104.47.2.71])
	by mail.openembedded.org (Postfix) with ESMTP id 964C47317F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 17:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OcAPpT2v6ExdhRFX9lhP3vIJ0tsDWVlv2R/Y58267AE=;
	b=knqBA5eXDejUSfcKpY34p/YSEzr06PWLqq/Zn/k/mOkD+dzgbvDjU5Yr06KROpQvfQz5Y8gLJd5TTRDOJ4MJzhJYyJoDNebzli8wZiS6IjL2phwXLk17vbSUMNRnKEtxwHYpR6FWb0ZO1tVw1+FjODzYyBccgZIt1eTJIzL50NA=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	AMSPR04MB311.eurprd04.prod.outlook.com (10.242.107.22) with Microsoft
	SMTP Server (TLS) id 15.1.539.14; Fri, 15 Jul 2016 16:16:11 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0539.019; Fri, 15 Jul 2016 16:16:11 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] weston-init: De-couple framebuffer console
	from Weston
Thread-Index: AQHR3CX9uJqS0ovxdkOqTmCAlydYmaAZryTg
Date: Fri, 15 Jul 2016 16:16:11 +0000
Message-ID: <AMSPR04MB30944A9A9CC3FF94EA20678E2330@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1468274809-10301-1-git-send-email-tom.hochstein@nxp.com>
	<CAP9ODKrf1L7UTe4FnHOZ=pcKPjEoXnp9iR39tPEXd8-BOiUv-g@mail.gmail.com>
In-Reply-To: <CAP9ODKrf1L7UTe4FnHOZ=pcKPjEoXnp9iR39tPEXd8-BOiUv-g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.1]
x-ms-office365-filtering-correlation-id: 869a8734-dc25-46f7-05e5-08d3accb565f
x-microsoft-exchange-diagnostics: 1; AMSPR04MB311;
	6:U4v72nemM7fd+Kw2F4NjexMcW/tJV6nSHpZjRZuXwgf9Or6pxMWDYbXpHmd37cSqGQnVwfZFd4DfpMD3Je4ciRceixgeqyBam8uo5xM+lKmONROuUWgqS9vPElMKIF5vP22Xl7g4yCoEC6uoxErWqwDijZxf+kDcJCkI1MV/npKwquYlL7aq7vZeCbusD8qNt10O6XGTVP839QUVdMqu7dg0fTjP8S7pSk/70SoJieYnYYETRTGalPenFGQQ4OH+mNVPwc/Lf4Mj6YoRpC+glUJQvq8dBaHKHAPixoRiC/ivvpnoau9FUwkcAeJd6uyE3074Cx7uZILM3C+QSlH8xw==;
	5:PNpOfl7y+9z/aJzeShw/eJkor6ZSBb9CYIbTQPdGwxwvPRi/UHAk1pSKI6GgrTEcDssM+yogOn+SHqnCLqfmhvUOvFbjp3Lf2stcqfq1pJrWezLL2xNEn8JIE0rtQZXESgPKwbY6v1fkWWn0UQNcRQ==;
	24:Gfm+RZ6nFb5tHwp87Hii+R8V1XeXGYgZrSdKao1qeOfrdPhuf0gNiEfKJwAEL24lxSMj5I6VN2GSK6yh9jGyUiaqvS6l9qqJO7wHbX49yp0=;
	7:MeH2sP8Q5kgawdOdc6TrqOwFWPvCypBfO921pmRExzdxfpPQ2oUY+sVGLFdlRuAJTFsSTvhGMzsR521Mhspec6pWYncXV5wx2RWZioRH3+1o8JwM5XOaXaDr6zej+9pZqBKcMSSegjbPyl6etfqqRP79Bw5LdUh9wkaKqVHoLsAxGJoIQnNPS8suL7irNpAfrhidonxam+ogOoGSEr/fivoyu+Tf78taS+JjcWBM9Py4dZdYs3N35Q+fUdHT7tTa
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR04MB311;
x-microsoft-antispam-prvs: <AMSPR04MB311ACC5BA604E70CF764E5FE2330@AMSPR04MB311.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(166494164430575); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AMSPR04MB311; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB311; 
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(377454003)(13464003)(189002)(24454002)(199003)(2950100001)(8676002)(16601075003)(86362001)(33656002)(5002640100001)(9686002)(87936001)(101416001)(77096005)(15975445007)(106356001)(10400500002)(76576001)(97736004)(6116002)(54356999)(76176999)(2900100001)(110136002)(586003)(11100500001)(102836003)(3846002)(50986999)(3280700002)(2906002)(8936002)(3660700001)(66066001)(7846002)(106116001)(4326007)(105586002)(189998001)(74316002)(92566002)(122556002)(305945005)(7736002)(81166006)(81156014)(7696003)(5003600100003)(19580395003)(19580405001)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB311;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2016 16:16:11.4096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB311
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: De-couple framebuffer console from Weston
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
X-List-Received-Date: Fri, 15 Jul 2016 17:50:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIGxvb2tzIGxpa2UgdGhpcyBmaXggaXMgaW4gdGhlIHdyb25nIHBsYWNlLiBUaGUgc3lz
dmluaXQgc29sdXRpb24gcGFzc2VzIHRoZSAtcyBvcGVudnQgYXJnIHRvIHdlc3Rvbi1zdGFydCwg
YW5kIHRoZSBzeXN0ZW1kIHNvbHV0aW9uIHNob3VsZCBkbyB0aGUgc2FtZS4gV2lsbCBoYXZlIGEg
bmV3IHBhdGNoIHNob3J0bHkuDQoNClRvbQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogT3RhdmlvIFNhbHZhZG9yIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQG9zc3lzdGVtcy5j
b20uYnJdIA0KU2VudDogVHVlc2RheSwgSnVseSAxMiwgMjAxNiA1OjEzIEFNDQpUbzogVG9tIEhv
Y2hzdGVpbiA8dG9tLmhvY2hzdGVpbkBueHAuY29tPg0KQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Np
b25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHdlc3Rvbi1pbml0
OiBEZS1jb3VwbGUgZnJhbWVidWZmZXIgY29uc29sZSBmcm9tIFdlc3Rvbg0KDQpPbiBNb24sIEp1
bCAxMSwgMjAxNiBhdCA3OjA2IFBNLCBUb20gSG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54cC5j
b20+IHdyb3RlOg0KPiBUaGUgZnJhbWVidWZmZXIgY29uc29sZSB3YXMgdXNpbmcgdGhlIHNhbWUg
SS9PIGFzIFdlc3Rvbi4gV2UgZml4IHRoaXMNCj4gYnkgaGF2aW5nIG9wZW52dCBzd2l0Y2ggdG8g
dGhlIG5ldyBWVCB3aGVuIHN0YXJ0aW5nIHdlc3Rvbi1sYXVuY2guDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT4NCg0KQWNrZWQtYnk6IE90
YXZpbyBTYWx2YWRvciA8b3RhdmlvQG9zc3lzdGVtcy5jb20uYnI+DQoNCi0tIA0KT3RhdmlvIFNh
bHZhZG9yICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPLlMuIFN5c3RlbXMNCmh0dHA6Ly93
d3cub3NzeXN0ZW1zLmNvbS5iciAgICAgICAgaHR0cDovL2NvZGUub3NzeXN0ZW1zLmNvbS5icg0K
TW9iaWxlOiArNTUgKDUzKSA5OTgxLTc4NTQgICAgICAgICAgICBNb2JpbGU6ICsxICgzNDcpIDkw
My05NzUwDQo=

