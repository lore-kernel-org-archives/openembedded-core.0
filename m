Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0064.outbound.protection.outlook.com [104.47.2.64])
	by mail.openembedded.org (Postfix) with ESMTP id D1E5074596
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cx2Kn3M0do44r+lcIeS/DRT61jHMTzye8YytM5mipB0=;
	b=AyeLR5I671vz0Zo/4ZxCbBOA0LBHiN2hrpQaKqyAp8a1He0hhQCtfgl095P2tFwFJSvJIx3HjOp3vWFXdY4QjlbbFp2XIQJpQE/32eJqNT6wPXqgnlcPDFU68bMi3AHC4qrqTtA8nm3YH1gguMuwaO59raITfTq5CJyQJpzFdZU=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB2894.eurprd08.prod.outlook.com (10.170.239.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.19; Tue, 30 Oct 2018 09:39:19 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11]) by VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11%2]) with mapi id 15.20.1273.025;
	Tue, 30 Oct 2018 09:39:19 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>, Jeremy Johnson <Jeremy.Johnson@arm.com>
Thread-Topic: [OE-core] [PATCH] python3: Fix python3-pyvenv run-time dependency
Thread-Index: AQHUaq1Z72sGK8G3VEuzU2sUeExOy6U2O2MAgAAQYICAAUe9AA==
Date: Tue, 30 Oct 2018 09:39:19 +0000
Message-ID: <A11C2A57-A412-4CBB-B111-FB5EA575BF5E@arm.com>
References: <20181023084931.5543-1-hugues.kamba@arm.com>
	<CAJTo0LZUu0xXJx8Ob8zW67U-GccgQjwqzeF_9KJ5eMi4ipcm5Q@mail.gmail.com>
	<a269addcbf4c8d57266756f896ed9276579bf691.camel@linuxfoundation.org>
In-Reply-To: <a269addcbf4c8d57266756f896ed9276579bf691.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [217.140.106.55]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB2894;
	6:/NbdCUWzfxbYGvWewSwQ54oG9TrHZFdhF+jxG3W6lNhYJChOYAmNkIAZ9NhSYLAYIqaa63QwTyS16bekqBZA74BGX5DA1VCvj3luRf3jLgUq33/Uu87LdqnMg2FUyq1UXms077ndh80+5jOVLNP+itZo6r719FyJfUig938ux+cjZ3o8g/n19Lx226+aEw/0VGR6+CCKfKWFK3L1MUD/AFOM4Wv+9bDtgjNrI3QTjJvUxpAt/8O/s/BRLFFEOqDNdfwofy4l+IOch02jq4/wXfTdjPIpZVN6fjgakn69M2Q6dvD8PiJsZe3G3iQjy6732ugWQKXed9Ku0QW+2fmJxq85B36JZvtWBh10+7Ed/2yRZMS7JBvGzmtaDI7eDT+guWQjoiS+IC6XSpM7f4L35+fcYpFNYXRm2eZYhKTwHBOT68fHoImhUfXUHPwHof1TEWSovNWIOgyX9mTld2PNlQ==;
	5:FWG6AvnEoq1fLmYSYyAoC9HkD+KSRmvWa2mbJNGYf7EoZOeEj+PEjmKUyKeev/QarBAxlHNM+CKH6iXf4AdHO0X6iJ/Xvz54A4gzwTKj2bcWqySBSqrBoxa+i0HUXfm/hRbN2yTKV4mfLrXeFDsqpamk9EfaUtfOT8XWZ0uHPZE=;
	7:Z0Xm5VwQ84SCR/i86IJhPAfPBu0XKE8NmfwGz7UTvCdBEQ/U9xi1SrVTQU0a4jubkhGsTpVlYnweKTvYVbjT0AnE02W/4++xHp3i5n6yDB2OrbEwVNKZf6JYiggKb4FAF+wOue2mi2khGGXrO/QCEw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: d25257b4-8072-4d0f-4a99-08d63e4b90f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB2894; 
x-ms-traffictypediagnostic: VI1PR08MB2894:
x-microsoft-antispam-prvs: <VI1PR08MB2894A9F57FA3F82D9EBD3B1198CC0@VI1PR08MB2894.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB2894; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB2894; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(366004)(40434004)(199004)(189003)(36756003)(2900100001)(8676002)(81166006)(478600001)(83716004)(5660300001)(71200400001)(4001150100001)(8936002)(71190400001)(81156014)(6636002)(229853002)(6512007)(3846002)(97736004)(6436002)(6486002)(5250100002)(6116002)(86362001)(25786009)(76176011)(53936002)(6246003)(4326008)(14444005)(66066001)(11346002)(5024004)(33656002)(110136005)(82746002)(476003)(105586002)(256004)(106356001)(68736007)(7736002)(26005)(305945005)(186003)(2906002)(316002)(446003)(2616005)(102836004)(72206003)(14454004)(486006)(6506007)(99286004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2894;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Sqgp5FbiSZfC9MxUaucRo8VZdEo9WvwLSbUoJJfadnE2g7UHsiTEaYEw62C/82brRDRq8XMlk7K2+RVI6B+PLSwDfsKrHWjZmrdg6Ko3oTc0+zTgp1IKx30to37Kp/9TU6NIStb5HZXDQQzFJqJUl3TePNNA98R9rGaUZtiIyTowG+erMN8xxlgetGspJv0jfF9b+3SFVaxipJV639CJ4fcmnvvFvUtz5zDzqIr2DUnegMF9D3vuB8U6/kVkYVNO1/Wd0aKEMw23Liaf7pkLjUcAbsiLluR9SmNdgxOHk5fonuxSpV5h6S7kSu59XRb18mT1oVDexdzAm5moiZBKPd/nP0EIDJqf3j4FtcfcU3Q=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d25257b4-8072-4d0f-4a99-08d63e4b90f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 09:39:19.3430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2894
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Tue, 30 Oct 2018 16:10:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <175535676F6BC6469A700D47ACB932B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCkEgUEFUQ0ggdjIgZm9yIHRoaXMgZml4IGhhcyBiZWVuIHN1Ym1pdHRlZCBwcm92aWRp
bmcgdGhlIHB5dmVudiBwYWNrYWdlIGZyb20gdGhlIHZlbnYgcGFja2FnZS4NCg0KVGhhbmtzDQoN
Ckh1Z3Vlcw0KDQrvu79PbiAyOS8xMC8yMDE4LCAxNDowNiwgIlJpY2hhcmQgUHVyZGllIiA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBNb24sIDIw
MTgtMTAtMjkgYXQgMTM6MDcgKzAwMDAsIEJ1cnRvbiwgUm9zcyB3cm90ZToNCiAgICA+IElmIHB5
dmVudiBpcyBnb2luZyB0byBkaXNhcHBlYXIsIHdvdWxkIGl0IGJlIG5lYXRlciB0byBqdXN0IHB1
dCBhbGwNCiAgICA+IHRoZSBmaWxlcyBpbnRvIFBOLXZlbnYgYW5kIGhhdmUgdGhhdCBSUFJPVklE
RSBweXRob24tcHl2ZW4gZm9yIG5vdz8NCg0KICAgIEkgYWxzbyBhZ3JlZSB3aXRoIHRoaXMgRldJ
Vy4NCg0KICAgIENoZWVycywNCg0KICAgIFJpY2hhcmQNCg0KDQoNCklNUE9SVEFOVCBOT1RJQ0U6
IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZp
ZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFu
ZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBp
dCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFu
eSBtZWRpdW0uIFRoYW5rIHlvdS4NCg==

