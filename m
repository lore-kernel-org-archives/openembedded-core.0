Return-Path: <adrian.freihofer@siemens.com>
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	by mail.openembedded.org (Postfix) with ESMTP id 47C346187E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 12:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VLQ72Hf8tnhqhrsBlpRQqmmvFo/i+6As9SvGm8fupnVamjmvDi0oeqoTywSCb6tJ87WM4B96b1ki+VoEN2pq/CRLzlQ8UMtiU6/H0nSkRVFO0kP7qosliKC05ysiABcERSjdN5Pb1itZSV56Vgz+uEWNaB95eZk2gg3/CuHI4opej/u+0tjV9UwVosEjb07pTS0s3hDeI8roKypDpeERFFRCddFq0tuL9xe6Pmk3Id69NFPnSngtxSIaWIxKJAUBSGLmiAAGE5SPjTotQw1CqU9DJ54kAfWhnUSTQSODucM9KZX6OBhgP4Nc/sIHGOS4EXnGMRhim+6xou/mNzI1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rv3OPq4xra7VcgH6mrzpOrD1iLnclLMn/gZ2q+TiMko=;
	b=etJnQnZQX7NWcqdCUb+jHMmulS0Cdz8Xee32Q1+wlsTnxGigsg2JkIBHi9PQwrT1O+dGFhX4eZchVIWsnkJyPqnd/9mo/12EjDXYMZqp5zBki3CcLekgWfpFWSdEUXbWiaV8VuMLN4VL5DOogwUtyb/VZkSP4SDhJ11T3JJHDyKf4AqbGdg938+7H0ooFEJFcISRqyqcAqNvno45j1vUvq7/jvYsosfK6f7xCkBZaraNXS7/4hNbkEKE/XjIhRnjWOYrMp8nDxQRLt3tsV1mVsg8df8EYONKeu0DkgRUY/SccyQf6T0EPRe90jui4H92bRJL6WzwDv+s2nXvZPzJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=siemens.com;
	dmarc=pass action=none header.from=siemens.com; 
	dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rv3OPq4xra7VcgH6mrzpOrD1iLnclLMn/gZ2q+TiMko=;
	b=e3wOyyz6yVft+A1ojso6NWA3SZvfdb8aNIOByaJSbweXuSuC4Mra7zVVeg6ajOUNgXQYVSkD1GwE1pU80Jpbx8WG9j+6nHJ/FP7RWB3cG0dvtDG3UHQQunFugX9G7TbZY/NF7yHLzhYu/VZaheToq3D/bBZAMmnVWKyM0B/uulI=
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM (20.180.104.80) by
	PR3PR10MB3929.EURPRD10.PROD.OUTLOOK.COM (20.180.105.84) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.16; Wed, 4 Mar 2020 12:30:10 +0000
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311]) by PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311%5]) with mapi id 15.20.2772.019;
	Wed, 4 Mar 2020 12:30:10 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "pbarker@konsulko.com" <pbarker@konsulko.com>
Thread-Topic: [OE-core] [PATCH] bitbake: gitsm: download submodules
Thread-Index: AQHV8gumN7CJUxSTiUGgisBt2eFRjag4XS+A
Date: Wed, 4 Mar 2020 12:30:10 +0000
Message-ID: <cdda8416d63d0a7cdec45eefc8d93b1f74f175ec.camel@siemens.com>
References: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
	<20200304095944.792423a0@ub1910>
In-Reply-To: <20200304095944.792423a0@ub1910>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=adrian.freihofer@siemens.com; 
x-originating-ip: [165.225.72.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ec45958-7602-4fb2-3929-08d7c037c7d6
x-ms-traffictypediagnostic: PR3PR10MB3929:
x-microsoft-antispam-prvs: <PR3PR10MB39299995495B267C1002C6D38EE50@PR3PR10MB3929.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(189003)(199004)(36756003)(55236004)(86362001)(5660300002)(76116006)(4326008)(6916009)(316002)(6512007)(8936002)(64756008)(66446008)(81156014)(2906002)(71200400001)(8676002)(6506007)(26005)(81166006)(2616005)(66476007)(66946007)(6486002)(186003)(91956017)(478600001)(66556008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:PR3PR10MB3929;
	H:PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0IGMR+BrdXXd9cExisMCerCqOUheT/sTdRPFVM/XrhdI+J+AhGFf7e9WZ7w+froyS0dfXEMeR7UQCz51N+ELIF1v+FRBk2HDFgjG6QQtpFKMJeX9dtXaUMff55yk6wr1T5oA3Lj36mjVpXJoHxLXfK9cRBNJjtoWuDsxxPbAvD3iUFU7Ou/bvpxKOEh/8Yc6I8Q7d/Nt7rGaR1cD62WPx+RnYug5gtT476+e3c4gX75wxhGAPYKl35HwwgEEjBt8l7ZgSCcX0Z5T5124IZVwUXoyKHELKVRz37S8A7flVUV5lejh9bl1BC+FipeKM9XbAuTSzLRCd2ssbghKfUmcBlQ72nZJaqPWwf3aKKwsvGCUUgAifCRR68er+gC6m8Yj9Cr3tZ6InHZRtKcM6j5564O/Z4LiQbprP4Ua2v41awgxtZKOc230ik3u2/OYSeyK
x-ms-exchange-antispam-messagedata: qPdyDID80Foc3lMT8blNqGqZDbiaaT3M9m2fiNrwDg2shkCicGV5IK5FTt0DG9OJ71xcEl1oGq0bbulWGnsjFbYdjEDYr4KTea05ipEFSiKy8/Yaq1KibqNHaFw2AUohLJ/UHD3BLAQlnDnoNPQUjw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec45958-7602-4fb2-3929-08d7c037c7d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 12:30:10.2583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PV+c2iLYHTYPB/0SbPXcyRRR7MJKaII8TR1xoF6rMv/fEPh2YddKB9VJ+SfT3ynjDYA5L/llofb+CdXbgfQOowGYGkVK66+LMf431xsvkIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3929
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: gitsm: download submodules
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
X-List-Received-Date: Wed, 04 Mar 2020 12:30:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AFAA8C2C750D34FA40A134C4AD6126E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBhdWwgQmFya2VyIDxwYmFya2VyQGtv
bnN1bGtvLmNvbT4NClRvOiAiRnJlaWhvZmVyLCBBZHJpYW4iIDxhZHJpYW4uZnJlaWhvZmVyQHNp
ZW1lbnMuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PA0Kb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIXSBiaXRiYWtlOiBnaXRzbTogZG93bmxvYWQgc3VibW9kdWxlcw0K
RGF0ZTogV2VkLCAwNCBNYXIgMjAyMCAwOTo1OTo0NCArMDAwMA0KDQpPbiBXZWQsIDQgTWFyIDIw
MjAgMDg6MTI6MjcgKzAwMDANCiJGcmVpaG9mZXIsIEFkcmlhbiIgPGFkcmlhbi5mcmVpaG9mZXJA
c2llbWVucy5jb20+IHdyb3RlOg0KDQo+IFRoZSB1bnBhY2sgZnVuY3Rpb24gZmFpbGVkIGJlY2F1
c2UgdGhlIHN1Ym1vZHVsZXMgd2VyZSBub3QNCj4gZG93bmxvYWRlZC4NCj4gQ2FsbGluZyBkb3du
bG9hZCBiZWZvcmUgdW5wYWNrIGZvciBlYWNoIHN1Ym1vZHVsZSBzb2x2ZXMgdGhpcyBpc3N1ZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVpaG9mZXJA
c2llbWVucy5jb20+DQo+IC0tLQ0KPiAgYml0YmFrZS9saWIvYmIvZmV0Y2gyL2dpdHNtLnB5IHwg
MSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9iaXRiYWtlL2xpYi9iYi9mZXRjaDIvZ2l0c20ucHkNCj4gYi9iaXRiYWtlL2xpYi9iYi9mZXRj
aDIvZ2l0c20ucHkNCj4gaW5kZXggYzYyMjc3MWQyMS4uMzcxNWU5ODI0ZiAxMDA2NDQNCj4gLS0t
IGEvYml0YmFrZS9saWIvYmIvZmV0Y2gyL2dpdHNtLnB5DQo+ICsrKyBiL2JpdGJha2UvbGliL2Ji
L2ZldGNoMi9naXRzbS5weQ0KPiBAQCAtMTg0LDYgKzE4NCw3IEBAIGNsYXNzIEdpdFNNKEdpdCk6
DQo+ICANCj4gICAgICAgICAgICAgIHRyeToNCj4gICAgICAgICAgICAgICAgICBuZXdmZXRjaCA9
IEZldGNoKFt1cmxdLCBkLCBjYWNoZT1GYWxzZSkNCj4gKyAgICAgICAgICAgICAgICBuZXdmZXRj
aC5kb3dubG9hZCgpDQo+ICAgICAgICAgICAgICAgICAgbmV3ZmV0Y2gudW5wYWNrKHJvb3Q9b3Mu
cGF0aC5kaXJuYW1lKG9zLnBhdGguam9pbihyZQ0KPiBwbw0KPiBfY29uZiwgJ21vZHVsZXMnLCBt
b2R1bGUpKSkNCj4gICAgICAgICAgICAgIGV4Y2VwdCBFeGNlcHRpb24gYXMgZToNCj4gICAgICAg
ICAgICAgICAgICBsb2dnZXIuZXJyb3IoJ2dpdHNtOiBzdWJtb2R1bGUgdW5wYWNrIGZhaWxlZDog
JXMgJXMnDQo+ICUNCj4gKHR5cGUoZSkuX19uYW1lX18sIHN0cihlKSkpDQoNCllvdSBzaG91bGRu
J3QgYmUgdHJ5aW5nIHRvIGRvd25sb2FkIHN1Ym1vZHVsZXMgaW4gdGhlIGRvX3VucGFjayBzdGVw
Lg0KSWYNCnRoZXkncmUgbWlzc2luZyBhdCB0aGlzIHN0YWdlIGl0IHByb2JhYmx5IGluZGljYXRl
cyBhIGZldGNoIGlzc3VlLg0KDQpCYXNpY2FsbHkgdHJ1ZSwgYnV0IHRoZSBpbmZvcm1hdGlvbiBh
Ym91dCB3aGljaCBzdWJtb2R1bGVzIG5lZWQgdG8gYmUNCmRvd25sb2FkZWQgaXMgbm90IGF2YWls
YWJsZSBiZWZvcmUgdGhlIHRvcCBsZXZlbCByZXBvIGhhcyBiZWVuDQp1bnBhY2tlZC4gSSBndWVz
cyB0aGUgc29sdXRpb24gbXVzdCBiZSBzb21ldGhpbmcgbGlrZToNCg0KZmV0Y2ggdG9wLWxldmVs
DQp1bnBhY2sgdG9wLWxldmVsDQpmb3JlYWNoIHN1Ym1vZHVsZToNCiAgZmV0Y2ggc3VibW9kdWxl
DQogIHVucGFjayBzdWJtb2R1bGUNCg0KV2hhdCdzIHRoZSBleGFjdCBlcnJvciB0aGF0IHlvdSdy
ZSBzZWVpbmc/DQoNCkRvbid0IHJlbWViZXIgZXhhY3RseS4gQnV0IHdoZW4gSSBkZWJ1Z2dlZCB0
aGUgZmxvdywgaXQgYmVjYW1lIG9idmlvdXMsDQp0aGF0IHRoZSBzdWJtb2R1bGVzIGFyZSBub3Qg
ZG93bmxvYWRlZC4NCg0KVGhpcyBjb3VsZCBiZSByZWxhdGVkIHRvIHRoZSBpc3N1ZSBJIHNhdyB3
aGVuIHRoZSBmZXRjaGVyIHVzZXMgZ2l0DQpzaGFsbG93DQp0YXJiYWxscyBmcm9tIGEgbWlycm9y
IC0gaWYgdGhhdCdzIHRoZSBjYXNlIEknbSBwbGFubmluZyB0byBnZXQgdGhhdA0KZml4ZWQNCnRo
aXMgd2Vla2VuZC4NCg0KWWVzLCB0aGUgcHJvYmxlbSBvY2N1cnMgd2l0aCBnaXQgc2hhbGxvd3Mu
IFRoZSBwYXRjaCBzb2x2ZXMgaXQgd2l0aCBhbmQNCndpdGhvdXQgc2hhbGxvd3MgZm9yIHVzLg0K
DQpBbHNvLCB5b3VyIGVtYWlsIGNsaWVudCBzZWVtcyB0byBoYXZlIGNoZXdlZCB0aGUgcGF0Y2gg
dXAuIEl0J3MgYmVzdCB0bw0Kc2VuZA0KcGF0Y2hlcyB1c2luZyBgZ2l0IHNlbmQtZW1haWxgIG9u
bHkuDQoNClNvcnJ5LCB3ZSBzd2l0Y2hlZCB0byBhIG5ldyBlLW1haWwgc29sdXRpb24uIEkgaGF2
ZSB0byBhZGFwdCBteSBzZXR1cC4NCg==

