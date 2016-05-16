Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0080.outbound.protection.outlook.com [104.47.2.80])
	by mail.openembedded.org (Postfix) with ESMTP id 12B4C60762
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rKvCCjsx1L2223tW413dH02qOGBYpndjd7Q1V/sNuao=;
	b=mN5bsROwxByVsGVpBsjXlJUh3/kIC6Xkyy3ztQlOr8P8NkqZliGT/uhxaXr8MwenES1nt3fV+zcK8LRgFM/SA7nGl2GurFcp8AvMDL67RlnrHf26nWda692nsiG6muYcygIPVz+EMJU7F4tkcqJyU7tYQlUU0P4ioVyO2dWidrw=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	AMSPR04MB312.eurprd04.prod.outlook.com (10.242.107.25) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Mon, 16 May 2016 15:41:37 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0497.017; Mon, 16 May 2016 15:41:37 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH v2] Add OpenVG demos to support wayland.
Thread-Index: AQHRr33XLvLYphPESU2z4LWaoZVVpp+7nnqAgAAVNUA=
Date: Mon, 16 May 2016 15:41:37 +0000
Message-ID: <AMSPR04MB3094B78E097AB689B249DD5E2770@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1463405655-14271-1-git-send-email-tom.hochstein@nxp.com>
	<CAP9ODKo3WfvCH7H+0HA-yCpOnTxuK5RaN6kWr=pJwW0ODGWS+A@mail.gmail.com>
In-Reply-To: <CAP9ODKo3WfvCH7H+0HA-yCpOnTxuK5RaN6kWr=pJwW0ODGWS+A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ossystems.com.br; dkim=none (message not signed)
	header.d=none; ossystems.com.br;
	dmarc=none action=none header.from=nxp.com; 
x-originating-ip: [192.88.168.50]
x-ms-office365-filtering-correlation-id: 1fe6de2b-7924-414d-d004-08d37da09160
x-microsoft-exchange-diagnostics: 1; AMSPR04MB312;
	5:nxUVQn3hu+48y9Iv9txTIi/BqPUk5ZfU6I9gFKbhqP6TS6tp+qqCjGSHMVB2ZI4U1g3SRR08Q7ec13WosUcUXDDUc5/1Daw6z2qBHPlEqnW0ioJlQ25UzG1CUSj+wwpdeGRNiaiq/NeP0QNAWlOUvg==;
	24:0iaSgZ2hYpzSjTg2zsMQvCG25Xvwr6J6c/JKMGAstXaMM3r6Scp0lg2p/maFMo4GOlGS6nk1UfjIUYmPd52zZviLVxKsLOz9wYjLkl0Wrh4=;
	7:C0ZuaGjju0g703JwUifD2Ygq6QyDT3QkuTpoWVbs5dKfKSkvJl9W8m9mewANK2SaoWFMnELtkfSRmoGb/05ToX/gefkTiApGiYeNeMGEIj/W4l8OWpiKwkATkGKQuQ0g7UGr4F+/BsTHv2FOfH3/6YHGsOGyJxmdl4kCV+QCSNiKBENt3+kR6utA0uQSk/UB
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR04MB312;
x-microsoft-antispam-prvs: <AMSPR04MB3120312AA5C27E1C7D3B4CCE2770@AMSPR04MB312.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(106316996507680);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AMSPR04MB312; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB312; 
x-forefront-prvs: 09443CAA7E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(24454002)(377454003)(586003)(1220700001)(6116002)(3846002)(102836003)(5008740100001)(189998001)(2950100001)(2900100001)(50986999)(54356999)(9686002)(76176999)(16601075003)(110136002)(15975445007)(77096005)(5003600100002)(86362001)(3280700002)(76576001)(74316001)(33656002)(2906002)(87936001)(106116001)(8936002)(11100500001)(66066001)(19580405001)(19580395003)(122556002)(5002640100001)(5004730100002)(3660700001)(8676002)(92566002)(4326007)(81166006)(10400500002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB312;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2016 15:41:37.4621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB312
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Add OpenVG demos to support wayland.
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
X-List-Received-Date: Mon, 16 May 2016 15:41:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIHBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4gSSBncmFiYmVkIHRoZSB3cm9uZyBvbmUu
DQoNClRvbQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogT3RhdmlvIFNhbHZh
ZG9yIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQG9zc3lzdGVtcy5jb20uYnJdIA0KU2VudDogTW9u
ZGF5LCBNYXkgMTYsIDIwMTYgOToyNSBBTQ0KVG86IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3Rl
aW5AbnhwLmNvbT4NCkNjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29y
ZSBsYXllciA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFByYWJo
dSBTdW5kYXJhcmFqIDxwcmFiaHUuc3VuZGFyYXJhakBmcmVlc2NhbGUuY29tPg0KU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIEFkZCBPcGVuVkcgZGVtb3MgdG8gc3VwcG9ydCB3YXls
YW5kLg0KDQpIZWxsbyBUb20sDQoNCk9uIE1vbiwgTWF5IDE2LCAyMDE2IGF0IDEwOjM0IEFNLCBU
b20gSG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54cC5jb20+IHdyb3RlOg0KPiBGcm9tOiBQcmFi
aHUgU3VuZGFyYXJhaiA8cHJhYmh1LnN1bmRhcmFyYWpAZnJlZXNjYWxlLmNvbT4NCj4NCj4gVXBz
dHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFByYWJodSBTdW5kYXJh
cmFqIDxwcmFiaHUuc3VuZGFyYXJhakBmcmVlc2NhbGUuY29tPg0KDQpUaGlzIGlzIGEgZ29vZCBj
YXRjaCBidXQgdGhlIHBhdGNoIHRvIHRoZSByZWNpcGUgaXMgbWlzc2luZy4NCg0KLS0gDQpPdGF2
aW8gU2FsdmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE8uUy4gU3lzdGVtcw0KaHR0
cDovL3d3dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBodHRwOi8vY29kZS5vc3N5c3RlbXMuY29t
LmJyDQpNb2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0
NykgOTAzLTk3NTANCg==

