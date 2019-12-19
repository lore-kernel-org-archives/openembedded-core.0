Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410125.outbound.protection.outlook.com [40.107.141.125])
	by mail.openembedded.org (Postfix) with ESMTP id CF6C07CE5E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 12:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MCGrhYHCs5G66OmqgJosE5vlrUqvI6/dLRWDMwCtzsdBGUHIpxDzSQ64ZNjPFg9ttV1fFHZ8SVpQZ9z6Nokq6O/ShShrG7h69keqdQLQTvJ8F/ql/z8kDkfB+BWrzuN8qTPAaAofivMyxu8Nad+VCQH0f4NHgJ0pM6pzYoJ0fP48vTYFgILp8yoLxOM6SZQ1P8HyKhBJwTZwtzJJKIi0nSm1Sz0XPF4Whqk4m05jYYrZV11i7wcKPI2MZwRU5BXK5l/E2Ri+VitYcc9d8WCIga11m9LcOdfmLc7fUNCi1J/Ch4vIFvZxhf0VE0dBxTVWrm5ZxxU3sTxLJAVZLZ/FVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=X+dgjNz9vo5/ayTf96tOU4iMioP0v91y7IIwoNO7V+M=;
	b=ejYHl6MtWJaFQicLgUV1ayHyKJlZ2qS7oSLBXQmUkylwNBLIBAHtu15uTetha3JaIxCzMToA8VdYXLBsCbW9MxrSAx9JiQAfw+agcq0ZMxMCbzA1YhPnhf8ExjJ+4y5LWCDnx8knDWOX+HuDaHeV1uUCdT38Th6hA3PUWKvhuhfFxA1NGp9XwfmIg1NvhY0ppUTYRwJ4+ysIzxaIChx5HtKNnmpTFLzxme/L75a64dtcHSp7wI2JRPsQaSt0yaSshViLkBrdxW6R73AwjVq52eJ6TxtT+ehZO+DXq4v7MH0/Ke67B4L1qEhyVpFThPCFK9GIvfM17NaYi4YnTpWXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=X+dgjNz9vo5/ayTf96tOU4iMioP0v91y7IIwoNO7V+M=;
	b=oXNmtnrDeHA4UsAqtDWuMPmBGLCsSBKGbM+kL1Adon4JlnGDqwP7wfYbEZpEJ2QBTMySyVbWt2vcKK7BxVJbtD/0FIcsdMfceMyy35TlUBMXp2k67/qIgAXXTQfFTXmEcGuaule6JLXpR+xq3J5sxLxsynLugk073aDHFk4/U8o=
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com (52.134.253.73) by
	OSBPR01MB2262.jpnprd01.prod.outlook.com (52.134.240.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2538.18; Thu, 19 Dec 2019 12:32:54 +0000
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d]) by
	OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d%7]) with mapi id 15.20.2559.015;
	Thu, 19 Dec 2019 12:32:54 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH v2][warrior] qemu: Add PACKAGECONFIG for
	glusterfs
Thread-Index: AQHVtmehOZWtmvbBhEelTRlartKZZA==
Date: Thu, 19 Dec 2019 12:32:54 +0000
Message-ID: <f9165acb7da1199e44e89845f6d3516bd5c7b010.camel@cybertrust.co.jp>
References: <20191219122722.85234-1-shohei.maruyama@cybertrust.co.jp>
	<46F6C987-BA29-466C-8435-654A8ED4E2F7@gmail.com>
In-Reply-To: <46F6C987-BA29-466C-8435-654A8ED4E2F7@gmail.com>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TY2PR02CA0010.apcprd02.prod.outlook.com
	(2603:1096:404:56::22) To OSBPR01MB2616.jpnprd01.prod.outlook.com
	(2603:1096:604:17::9)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5014f2b3-2436-4ed4-752b-08d7847f9211
x-ms-traffictypediagnostic: OSBPR01MB2262:
x-microsoft-antispam-prvs: <OSBPR01MB226294CF4E7914B117D995BCD6520@OSBPR01MB2262.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(5660300002)(316002)(86362001)(6486002)(26005)(4326008)(52116002)(2616005)(66946007)(6916009)(64756008)(66476007)(66556008)(186003)(2906002)(81156014)(478600001)(8676002)(4001150100001)(6512007)(66446008)(36756003)(6506007)(81166006)(966005)(8936002)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB2262;
	H:OSBPR01MB2616.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LjXKHJB/nKrttZmlK/iE+WE2Uz3sevO61dV+JZ/CVbU7zF0ivAIojsTXlSXzyhXrCZr3jFAwyh0XJR0JOVuN8GLM4afZsaAH2TrvJnyOz+PcPhSGSHfNBRx3SvjOkE3W5eD5qoTYQ4w8s55flkkVgGTFOTu6UoOxiu6cFIVy7gzBevAEOApnv9FY52hITy3ggK7jA78j57bHGUAcbA5k2qxJ6d+5OpBxwDE52y8+payiMjLXqkDRj5daVwO8GQg3seOhln3DwHL7zrwv8k3wlNKJehVZ4kv2D/rhbx5vmpPgnJ0rhAU72EusvHMtubOnBYEOfl8Db+5b/wSfWwYCKE8Oiu35u5MBx77QI+TpJcyEOyfP8Pqtalf5CFw6K3QC/NvoaYThNNfyMlH5v5O08T6+i9PRIVBvEJczLZWCBMeZZPaV810ho1v76Vd2Uvflly8Mm1SbmBY6yY4e0n8pKhyyyyoJ0TTH9cNL68pcYwU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5014f2b3-2436-4ed4-752b-08d7847f9211
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 12:32:54.3554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xu7vVUANdvVPlRBxPpNwkxQhX06/bKbvGtncxb28T6swei+j4zSJmeuu8Jd93casaBJfiAAVD8o1s7e2YiHFVmDLurmkIUazqJNtCy/wguO7Fb2rRi9udvBL60QZOHhb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2262
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2][warrior] qemu: Add PACKAGECONFIG for glusterfs
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
X-List-Received-Date: Thu, 19 Dec 2019 12:32:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D2CAB6CCB4311499A4463017915F6F9@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64

U3VyZS4NCg0KU2hvaGVpIE1hcnV5YW1hDQpPbiBUaHUsIDIwMTktMTItMTkgYXQgMTM6MjkgKzAx
MDAsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBQbGVhc2Ugc2VuZCBhIHBhdGNoIGZvciB0
aGUgbWFzdGVyIGJyYW5jaCBmaXJzdC4gDQo+IA0KPiBBbGV4DQo+IA0KPiA+IE9uIDE5IERlYyAy
MDE5LCBhdCAxMy4yNywgPHNob2hlaS5tYXJ1eWFtYUBjeWJlcnRydXN0LmNvLmpwPiA8DQo+ID4g
c2hvaGVpLm1hcnV5YW1hQGN5YmVydHJ1c3QuY28uanA+IHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMg
Y29tbWl0IGFkZHMgUEFDS0FHRUNPTkZJRyBmb3IgZ2x1c3RlcmZzLiBnbHVzdGVyZnMgaXMgbm90
IHJlcXVpcmVkDQo+ID4gZi0NCj4gPiBvciBydW5xZW11LCBzbyBpdCBzaG91bGQgYmUgb3B0aW9u
YWwgdG8gcmVkdWNlIGJ1aWxkIHRpbWUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2hvaGVp
IE1hcnV5YW1hIDxzaG9oZWkubWFydXlhbWFAY3liZXJ0cnVzdC5jby5qcD4NCj4gPiAtLS0NCj4g
PiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyB8IDEgKw0KPiA+IDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21ldGEvcmVjaXBlcy0NCj4gPiBkZXZ0b29scy9x
ZW11L3FlbXUuaW5jDQo+ID4gaW5kZXggMjAyMTM0YjNkOC4uZTkxN2E5NjI0MSAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYw0KPiA+ICsrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jDQo+ID4gQEAgLTE2MCw1ICsxNjAsNiBA
QCBQQUNLQUdFQ09ORklHW3ZpcmdscmVuZGVyZXJdID0gIi0tZW5hYmxlLQ0KPiA+IHZpcmdscmVu
ZGVyZXIsLS1kaXNhYmxlLXZpcmdscmVuZGVyZXIsdg0KPiA+IFBBQ0tBR0VDT05GSUdbc3BpY2Vd
ID0gIi0tZW5hYmxlLXNwaWNlLC0tZGlzYWJsZS1zcGljZSxzcGljZSINCj4gPiAjIHVzYnJlZGly
IHdpbGwgYmUgaW4gbWV0YS1uZXR3b3JraW5nIGxheWVyDQo+ID4gUEFDS0FHRUNPTkZJR1t1c2It
cmVkaXJdID0gIi0tZW5hYmxlLXVzYi1yZWRpciwtLWRpc2FibGUtdXNiLQ0KPiA+IHJlZGlyLHVz
YnJlZGlyIg0KPiA+ICtQQUNLQUdFQ09ORklHW2dsdXN0ZXJmc10gPSAiLS1lbmFibGUtZ2x1c3Rl
cmZzLC0tZGlzYWJsZS1nbHVzdGVyZnMiDQo+ID4gDQo+ID4gSU5TQU5FX1NLSVBfJHtQTn0gPSAi
YXJjaCINCj4gPiAtLSANCj4gPiAyLjI0LjENCj4gPiANCj4gPiAtLSANCj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1j
b3JlIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5lbWJlZGRlZC1jb3JlDQoNCg==

