Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410100.outbound.protection.outlook.com [40.107.141.100])
	by mail.openembedded.org (Postfix) with ESMTP id 808027F395
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 00:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KJ4PXAnylBKecc9B9eZpL1ocE4m17aKaeMV4ceFoiGio38vfVZWwiduzIXa/gmU0K3lK/EHKopVKu5+ohVb5dxMX4f0naMCKFiHxIrcM90GgYVpCWXfgtrqU0OHG8NA4TAYzHOYc+34SnQdCNQESnuOTy6lfkjowWFQB/Aqst814Y5T9HaUrghvPu5YFTWZHuKT7FpD2cyF5c3eTo7znglQ6ISkmiYIX7+bx3V1Ema5u1LgcTC4Cq+XAHfRBIcE8NDOP604CBeh7bdC3vkR3YJ0JAjqkPCzQURo7VZYaK64wphU429x3bm7/iW+Q/BWz2TGGmUTJLGsJuOV/YUsY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=52WlinTQ6Hc+z+/PBJIvlNWAumnF6xCmGMN8EkZ7Rd0=;
	b=Mi1hlsCdgRCs8DEAeAWFuNio1nVVimVJZrc26MlMbZFfupXYiYhj6yzgNhavi1/XNzjfuujIsUi5DJ5OiV9n9b0iiqIhtEVnhDwzvA7mdfyF8TgkJXmXOurBzuJGKBYvumG3LdD8mcRXj2cKAj2Jy6Io5kKDNQS+zwXyYY6PSki6li/TxSdjSJ+6Avr/tGXC0vkwiY3ewP1iM0j34SDPIf1xbrSXGK0wOtV/QbrTWri8zEtFOnuUq3iXjEGBwT6w5nOc6q/dShKoAi7OUi94CtUZVheOxBbZGl0Y61UAj/z4+weaB3ae/QritPM/zcTmArUZKsowgGS0Ne9cNytn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector2-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=52WlinTQ6Hc+z+/PBJIvlNWAumnF6xCmGMN8EkZ7Rd0=;
	b=rIuVV6dA3rzeejcl3oi3dJdm6mLXOGJo9rtcBHYsUhzmcamDvpaH29pZBOVyF7ADqAB5VM0S/uV0wDakT5EbaJPwUYBikRA2DR5tV8zJT8POe3wCfAZ1VsQzEI0TMJEx7Rxwhw60WbCwPbXGnqcXyZ+medZWogh6Phd3KvflTek=
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com (20.177.101.86) by
	TYAPR01MB3280.jpnprd01.prod.outlook.com (20.177.102.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.20; Fri, 30 Aug 2019 00:09:19 +0000
Received: from TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb]) by
	TYAPR01MB3007.jpnprd01.prod.outlook.com
	([fe80::6869:1670:e5fc:4dcb%7]) with mapi id 15.20.2220.013;
	Fri, 30 Aug 2019 00:09:18 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH] runqemu: Change to use -device virtio-gpu-pci
	instead of -vga virtio
Thread-Index: AQHVXVoWmuBzOh7eKkaLDyGL/I4T8g==
Date: Fri, 30 Aug 2019 00:09:18 +0000
Message-ID: <f632b8d9d293b54fe63b308dea7684333e409456.camel@cybertrust.co.jp>
References: <20190828043639.9942-1-shohei.maruyama@cybertrust.co.jp>
	<CANNYZj80wCXerLr-L0zDuG3sShD52snqmG83ySN8cZXXUzT9PQ@mail.gmail.com>
In-Reply-To: <CANNYZj80wCXerLr-L0zDuG3sShD52snqmG83ySN8cZXXUzT9PQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR03CA0009.apcprd03.prod.outlook.com
	(2603:1096:404:14::21) To TYAPR01MB3007.jpnprd01.prod.outlook.com
	(2603:1096:404:7f::22)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1d96308-050e-4145-3e46-08d72cde4d3c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:TYAPR01MB3280; 
x-ms-traffictypediagnostic: TYAPR01MB3280:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB3280D1C0F37B4A26FA7BC334D6BD0@TYAPR01MB3280.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(2906002)(53936002)(6116002)(8936002)(118296001)(66066001)(8676002)(36756003)(446003)(71190400001)(52116002)(316002)(256004)(476003)(81156014)(486006)(76176011)(81166006)(11346002)(71200400001)(26005)(102836004)(6486002)(386003)(6506007)(6916009)(99286004)(86362001)(186003)(2616005)(6246003)(66476007)(478600001)(46636005)(6436002)(6306002)(6512007)(229853002)(5660300002)(14454004)(3846002)(305945005)(64756008)(66556008)(66946007)(4326008)(25786009)(966005)(7736002)(4744005)(66446008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:TYAPR01MB3280;
	H:TYAPR01MB3007.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ROKFGeN/KK7QjjKmsP600pLjVEBCTmh1iNYmoQjS2Pc95YzgdJvwcUOifMw4y6FCP97XY1VdUIYyN3Ld3Van8yO5QKX++VJKz+kkseFAwo1xXVdWMvU5w5IvpxWIUn7bLyA0VEFQ7EUixmqfwHzVR/H2tzUWdERmqNNx45pzmqWO88myXrrX8j2YdR+PAIveV4AsLoPRL4Q3lDiiy0Hv3rAPmWD9YAvv+slsu59D+csZChZbXZHz3IcNWboqqUGjueVFs3TsUSnMtvS8lpGKXQuHv8AvsbtcZyBdgL6e/xiWR6JX2tsTuHBExH2FE6+qFFMx2J6XQLb0bZPuisCYOokwOJRpTuA1Pgj7IRADyhnlBJ1F1H+XcHPf4yyeJQQsLVzh6317aWeZ+uJRelCy2HZ5eI0ehnxmPghJ+PrSfsc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d96308-050e-4145-3e46-08d72cde4d3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 00:09:18.8388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2chhv5hQmW74UVJIU8c/sCeuta/F+4EZvgZOXVxsGoydwprfLMpSlTPstIlQ5u8fslcWsCWHoyQFICh+Wuzv9Xr6FWzYm860MgJKHL2ZKWzbLezjrZhJUeVsJtBXu/rY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3280
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu: Change to use -device virtio-gpu-pci instead of -vga virtio
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
X-List-Received-Date: Fri, 30 Aug 2019 00:09:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8269BDD4C6A18448B7FBF5F6317ABE3B@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64

PiBDYW4geW91IHBsZWFzZSBsb29rIGludG8gd2h5IHRoYXQgZXJyb3IgaGFwcGVucyBvbiBhcm0s
IGJ1dCBub3Qgb24NCj4geDg2PyAtdmdhIHZpcnRpbyBpcyB0aGUgb2ZmaWNpYWxseSBkb2N1bWVu
dGVkIG9wdGlvbiwgc28gSSB3b3VsZA0KPiByYXRoZXIgdXNlIHRoYXQgZXZlcnl3aGVyZS4NCg0K
QWNjb2RpbmcgdG8gDQpodHRwczovL3dpa2kucWVtdS5vcmcvRG9jdW1lbnRhdGlvbi9QbGF0Zm9y
bXMvQVJNI3ZpcnRfbWFjaGluZV9ncmFwaGljcw0KLCB3ZSBzaG91bGQgdXNlICctZGV2aWNlIHZp
cnRpby1ncHUtcGNpJyBpZiBnaXZlbiAnLU0gdmlydCcgdG8gcWVtdS0NCnN5c3RlbS1hYXJjaDY0
IG9yIHFlbXUtc3lzdGVtLWFybS4NCg0KT24gV2VkLCAyMDE5LTA4LTI4IGF0IDA4OjU0ICswMjAw
LCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gT24gV2VkLCAyOCBBdWcgMjAxOSBhdCAwNjoz
NiwgPHNob2hlaS5tYXJ1eWFtYUBjeWJlcnRydXN0LmNvLmpwPg0KPiB3cm90ZToNCj4gPiBJZiB1
c2luZyBxZW11LXN5c3RlbS1hYXJjaDY0IG9yIHFlbXUtc3lzdGVtLWFybSB3aXRoIHRoZSBvcHRp
b25zLA0KPiA+IGFuIGVycm9yDQo+ID4gb2NjdXJlZCBhcyBmb2xsb3dzOg0KPiA+IA0KPiA+ICAg
cWVtdS1zeXN0ZW0tYWFyY2g2NDogVmlydGlvIFZHQSBub3QgYXZhaWxhYmxlDQo+ID4gDQo+ID4g
dGhpcyBjb21taXQgZml4ZXMgdGhlIGVycm9yIHRvIHVzZSAtZGV2aWNlIHZpcnRpby1ncHUtcGNp
IGluc3RlYWQNCj4gPiBvZg0KPiA+IC12Z2EgdmlydGlvLg0KPiANCj4gQ2FuIHlvdSBwbGVhc2Ug
bG9vayBpbnRvIHdoeSB0aGF0IGVycm9yIGhhcHBlbnMgb24gYXJtLCBidXQgbm90IG9uDQo+IHg4
Nj8gLXZnYSB2aXJ0aW8gaXMgdGhlIG9mZmljaWFsbHkgZG9jdW1lbnRlZCBvcHRpb24sIHNvIEkg
d291bGQNCj4gcmF0aGVyIHVzZSB0aGF0IGV2ZXJ5d2hlcmUuDQo+IA0KPiBBbGV4DQoNCg==

