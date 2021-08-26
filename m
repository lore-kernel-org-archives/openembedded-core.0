Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web11.28997.1629977059517078037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 04:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=oZKMGv0g;
 spf=pass (domain: siemens.com, ip: 40.107.21.76, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyxfLtJf+xGyQAThynDysqjGLu6sv+QiExpfER/RAOFn68NV7MN1wn2pBBntXLf3cd36T9QJd82J5qsyizXij2YZFRuULhPs7Bshj9hUrTh2Xq9ziGPDc1+VEyLg+Zzu2DuK8yDX9CHvFc1BSQ6j/O7juZzIspvbn2vT3DtJzu2I3Rk414Or3XwS+RlWrNYT1+09YOg/ggFbiWZaBQLZlJ6fJkxbnTKzBwdFqfobto8PpTLo3bx3tiajGmens74xpp9EqEAGqVuI2CQfEOpf3bSXyGh/a+rj2u41Zd/L8WAvbNySHqwOQ6i5CBY5RFjPm9dnlXzax09pKWP0zYyJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmO50A0FstXZinvbQqkeD4KE/TngYUYnkbSBKwwEHXA=;
 b=RWTU0N596jjxasuiPUsQYpOvmCy5YhVkYu2+H7vFw6ZpPWq2Np5C+r2DUVvOSZ+MPco9LAZcwaLHC3EcBirV11+ee2MShyTIkUZCSxZOhrZrzMlj0d+PQbppCoBuO+oWQdZsvLj4zXEKlIyWP7N0ElL7qJfZmbMo/W+ItVctITgGLs5tS86UTZTKT68Sc8cA5JGBWgEA7BcxdT04nrmgGZlQR4gZEHT0OSCRhybJWOoi7LUjKDLOMC4ym0x3nxHhQ96lfqHZHpjuDABMQdwlxsEGKETkAXrr+k5hN1CpLKmSNqVhLqj99fBrNhNI8w+Wh3xfbiBl83NxALdrQPHA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmO50A0FstXZinvbQqkeD4KE/TngYUYnkbSBKwwEHXA=;
 b=oZKMGv0gOTqB+Y7of20MZtJXm8ZDi1u0R0zSVE589lIPHGGjHkHOurd1O7c3u1haJ9+GB+UwzzhP+mEUjTJ7PIQFgbxOj3UL5SPGijweFIsAzW0KxEmwpHjpX/bSus9okhdLVSJgx+YnsSW/WyNogRqT0Gm5rvEjWs48txIGSJE=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DBAPR10MB3993.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 11:24:16 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac%9]) with mapi id 15.20.4436.022; Thu, 26 Aug 2021
 11:24:16 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "armccurdy@gmail.com" <armccurdy@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Topic: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Index: 
 AQHXmDmyq6OWCTGY0EC5q1c7gKrRnKuBUePwgABWRoCAAI+9kIADWYCAgAARAgCAAAbvgA==
Date: Thu, 26 Aug 2021 11:24:16 +0000
Message-ID: <98ece42c21301b8384d4b2e92cedb232b324b6a0.camel@siemens.com>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
	 <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
	 <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <CAJ86T=V2zSGf3ebYWFh-2-QZ1w55Xsz+6nbkcR9jayh9ANyraQ@mail.gmail.com>
	 <DB8PR10MB3977DC6B069FA94E5EB4399992C59@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <452907b1c72251c6a445882c7dea2ea2dc1b913e.camel@siemens.com>
	 <1b35875da7fb3481400f09bcefd532be90d098cf.camel@linuxfoundation.org>
In-Reply-To: 
 <1b35875da7fb3481400f09bcefd532be90d098cf.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3bd00dc-ea6d-49d1-aac8-08d968840a32
x-ms-traffictypediagnostic: DBAPR10MB3993:
x-microsoft-antispam-prvs: 
 <DBAPR10MB39936BA61A84F619162D16D492C79@DBAPR10MB3993.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sGSNdYtsubKBiBHEPvGTiuqbaf5d0cNH+WIXfoj1oM8Or6xajBE8mBCymh5369SusFEEVj0UePPLxsA+f6Hz7vuDrCm+Jgix6C6SLYNXc1tuWNN7hY2jZ/Psh/7tclA+cqXO0U9GKlOBpGMiQEmhy4xL1cUqaHVsney9odaBiHouNEbkltgTgBIX+6ZFWiY0izXRjedSJyv7lSm3q+XJQJgAv2ZHdt8jaI/ZUCPRPrlRuexuCv7Sb2jld85979YDCCXGcHKz+Hp0RakpUBkAmfBwWfyZlhX1WoY8kGvyoGdCBBf2W8q6qdlUiFPQenS00fmFIPQ5SxKH/A8DG8tJHQjzMmPv2Bgq5rNli8CzRkHTUA11qcVQOX2yKoVwxDJMLlnNXMHdMMKVAAhxFnURWXsA9ybpaVQ7Hp5f67Ttj8eztA9qulRipFwlQe9uoqGO3X+vTFxY/OU+rj/AexNPdML4ObFp1xDOsRXp5+po57vyJ52yUtItGeWUk8Z37e0kN1qhTgIO9tzgNCrXU0z9dWHhbVq1tR1jc6xgZWtiXpdxq/UUMBBV+S5fd4GbaQcWznGUzpLIgW8no0s6PfIg7Y3T1+NjIvpcrar4yf+ORrB1GBAVQYbfUZc4fazG6LU7/VUFUKvPsyf6zRDLBGcXCwdpb/QiSMciA7MJlpUn2bipK3mSp13N5cJLc++JKGdYE0tNaSYeU8p4j9fics4Hxw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(478600001)(66446008)(54906003)(122000001)(6506007)(2906002)(110136005)(83380400001)(66556008)(91956017)(76116006)(26005)(6512007)(66476007)(66946007)(64756008)(8936002)(38070700005)(8676002)(4326008)(86362001)(5660300002)(316002)(36756003)(6486002)(71200400001)(2616005)(186003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WXEzczUzMFlFUWZ2STQ3NWFVbk1nQTdkUU1YK3R0MWJXZk01QnA0dWdzdE9Y?=
 =?utf-8?B?VVJyT3ZEQ3RFalRpMFZHcEVEeGNDRHhCZHlRYjFldFJUcHdwSVNJV2tvYTU2?=
 =?utf-8?B?ZnN3QmkyMVNaU0NaUnFTelo2Y2MxWllPUDV2Tjl4THMxeXNuVWRtVlZKNGpk?=
 =?utf-8?B?NFlnNkNwS3k2ek5aUklnV3pacm42S0YvN3haQlF6aUs4QWNYTzF6ZFVrSEE3?=
 =?utf-8?B?NVM4WHJhL2ZpNU11eHlEZ1k0OUc5bXVpUHpVakltVDRkSzJIeGE5MUw1eS9q?=
 =?utf-8?B?VURjZm9vZHN6NzEvOGtnQXNjYmY2ZkhVUXRPTTBFNWRKYWZ2RmdmZ1RRMm9L?=
 =?utf-8?B?ZkJoNjlpbXVVUlAvZEh1a04zdUZoeC9UZldGSVFuYVdLWkRmZHdFcGFBVjFx?=
 =?utf-8?B?cU1JU1BiQVBPdGJmcHI3QTdlTnpxOXRUMHA2ajBDTEFWa3NLSWIydFRLaE13?=
 =?utf-8?B?NGV3MnNKM2N1Nmc0L1RibDc1aTN4NTdkU2xCc2tuaXNhQ2h5VHp1OWd2TTRx?=
 =?utf-8?B?L3U0WWRpbHVHUmNIczJIVkVYd0NjN1BpemNkSXZWUmcvcWhLZ3BhVUNvc0d0?=
 =?utf-8?B?NXcvdkRreHpuei9DSUFsZER3K1BsRUN4UGd4U0U2NFY2cmJFcm11cmIxQ3g4?=
 =?utf-8?B?SWFJUWxUOWgrSU94R0lPcWZIU0tRaEVtRHJ3M3ZLWlMwM2tsc1A4Qjlza0J6?=
 =?utf-8?B?ZnlhYnlhT0FIdmZnNmxZL2tQdEE1QXpMOE5oSDB0R2lYSzdqTDBRSTlaNWs5?=
 =?utf-8?B?bnduL000NUFRV0grcFpZRkFGbnJWeEVJMTA4ZU11K24vdTlJc3BxTjdDR2dY?=
 =?utf-8?B?bWFaM3g4THdlSzNYYUQyUEwyN1dQbitwMzcwYUhmKzh5WnFmWE5LeDg1anhQ?=
 =?utf-8?B?SzBRZGFTMERtRVM1WU1nRThMMjZzOVQvTmZKY2dsd2pZTmE0OGtLcTJoMVJx?=
 =?utf-8?B?KzVtU1NsVys1MWN3ZkRRY3NWMTVsaXhrY2p0a1hMS2tzcnNCR1N6U2VWMFZz?=
 =?utf-8?B?VWVCbXNlVGk2c1Nob3JxYTUvc2h5KzAzSlk0LzZpOHRJWll6SVVFV2dhRHRv?=
 =?utf-8?B?WkM3SXZCOFE0L1ZXMWVtaXN3WmtxbHJOYTYybnVoNVdqS2NGRE93aVRPY1ps?=
 =?utf-8?B?ZHgyM0wyY3pRZEJtR1BlVGF3Y01KNXJTMTQrUmtYT3hSYnRuZUJ5Qzgyc1Br?=
 =?utf-8?B?dEVJVUwrdFpya3hGYmEzekJQL1c3azN3Vm56Vk1oM0JHS1FjNDY4V3pTZVZW?=
 =?utf-8?B?MkQwRXV5cWJaVnBqdUxTcW5zZldLcWc3RHVOdm5JQm9IVVRGQlQvVXZ6Snov?=
 =?utf-8?B?TlNrc2Vrb3lEMFUyY01mNi9aZjRNNCt6ZWpSWG9nMi9wL2Ywb3VzUHlZZ1FJ?=
 =?utf-8?B?NFBzOThOcWtHdjhRNjhmbUxZYWVqRGhXdU5GM2VHaUxMbmhWMzBuM2NQcVJp?=
 =?utf-8?B?QTRoYmlkQXZYRFdTL0JkQVluL0hxVVRaOWZSYTFLLzdFQmszUnlwZFVGNkhp?=
 =?utf-8?B?c1pKd0xKT3F5MkphSzhGUnhoMU5wYXZhcS9BOHlvb3VRcmMwNkl4dmtnZytP?=
 =?utf-8?B?cVM2aDVqMkZCWEl6R0ZHbnJGRmVsWmp2MjFzVWlNU01GRG5Sdi9CbVY5bDRl?=
 =?utf-8?B?eTBOejdPUXlYM0xKQTZBQ2RNY3VtL21uODIwc3dQeHFZbFJPM2pnYWpzWGYv?=
 =?utf-8?B?Zmdja2JZVFArWGNlWTNiTFJGeFgzMHJqY1lqZ1kvblpVK0Ewdk5SREdKQmNM?=
 =?utf-8?B?RXhyM2lEazZ1dXdjUDZmWkVjd1F5VjEzL0kzc3pscXJoY2diVEp2UE1UQUVN?=
 =?utf-8?B?aHZ2N0p1WHVvRURManpKQT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bd00dc-ea6d-49d1-aac8-08d968840a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 11:24:16.4913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3im9zVBr/zMazCKOKhp8zU3m29nfoY2Zm6brxYW0TylZR9/zUAnC2kuGM/GieMWc6RGM7VCreW1CcA4B0tfhcoQuh11efqKlUR7nxMIFfoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB3993
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2946A4B650F61F4C8CB76E09A1395767@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGVsbG8gUmljaGFyZCwNCg0KSWYgaXQgaXNuJ3QgYSBiaWcgZGVhbCwgSSBjYW4gdXNlIHRoZSAi
LS1lbmFibGUiIHZhcmlhbnQuIElmIHdlIGtlZXAgLS0NCmVuYWJsZS1ubHMgbGlrZSBhIGRlZmF1
bHQsIHdlIHdpbGwgYnJha2Ugbm90aGluZyBJIGd1ZXNzLiAoSXQncyBlbmFibGVkDQpieSBkZWZh
dWx0IGFueXdheSkuIFNvIEknbSBhZGRpbmcgdGhlcmUgb25seSBhIGZlYXR1cmUgdG8gZGlzYWJs
ZSBpdA0Kd2l0aCBQQUNLQUdFT1BUSU9OLg0KDQpSZWdhcmRzLA0KQW5kcmVqDQoNCk9uIFRodSwg
MjAyMS0wOC0yNiBhdCAxMTo1OSArMDEwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+IE9uIFRo
dSwgMjAyMS0wOC0yNiBhdCAwOTo1OCArMDAwMCwgVmFsZWssIEFuZHJlaiB3cm90ZToNCj4gPiBI
ZWxsbywNCj4gPiANCj4gPiBJcyB0aGVyZSBhbnkgcHJvYmxlbSwgd2hpY2ggc2hvdWxkIEkgZml4
Pw0KPiA+IEkgd291bGQgbGlrZSB0byBpbmNsdWRlIHRoaXMgZmVhdHVyZSBpbnRvIGR1bmZlbGwg
aWYgcG9zc2libGUuDQo+IA0KPiBBdXRvdG9vbHMgdXN1YWxseSBoYXMgYSB2ZXJ5IHNwZWNpZmlj
IG9wdGlvbiBmb3JtYXQgYW5kIHRoaXMgaXNuJ3QNCj4gZm9sbG93aW5nIGl0Lg0KPiBJIGtub3cg
b3RoZXJzIGV4cHJlc3NlZCBzb21lIHN1cnByaXNlIGFuZCBJIHNoYXJlIHRoYXQuIEl0IGNhbiBo
YXBwZW4NCj4gaWYgdGhlDQo+IHNvZnR3YXJlIGlzIGRvaW5nIHNvbWV0aGluZyB1bnVzdWFsIHNv
IGl0IGlzIHBvc3NpYmxlIGJ1dCBJIHdhbnRlZCB0bw0KPiBnbyBhbmQNCj4gZG91YmxlIGNoZWNr
IHRoaXMgYXMgaXQgbG9va3Mgb2RkLiBJdCBtYXkgYmUgYm90aCBmb3JtYXRzIGNhbiBiZSB1c2Vk
DQo+IGFuZCBpZg0KPiB0aGF0IHdlcmUgdGhlIGNhc2UsIEknZCBtdWNoIHByZWZlciB3ZSB1c2Vk
IHRoZSBzdGFuZGFyZCBmb3JtYXQgd2UNCj4gdXNlDQo+IGV2ZXJ5d2hlcmUgZWxzZS4NCj4gDQo+
IFNvIGJhc2ljYWxseSB0aGlzIGlzIGhlbGQgcGVuZGluZyBtZSBkb2luZyBzb21lIGR1ZSBkaWxp
Z2VuY2UgYXMgaXQNCj4gd29ycmllcyBtZS4NCj4gSSBhbSBob3dldmVyIHN0cnVnZ2xpbmcgdG8g
ZG8gZXZlcnl0aGluZyBuZWVkZWQgYXQgdGhlIG1vbWVudC4NCj4gDQo+IFRoZSBvdGhlciBpc3N1
ZSBpcyB0aGF0IG5scyBpcyBhbiBvcHRpb24gbWFueSBvdGhlciByZWNpcGVzIGhhdmUgYnV0DQo+
IHdlJ3ZlDQo+IGFsd2F5cyBoYW5kbGVkIGl0IGF0IHRoZSBjb3JlIGxldmVsIGluIHRoZSBnZXR0
ZXh0IGJiY2xhc3MuIG5hdGl2ZQ0KPiByZWNpcGVzDQo+IGV4cGxpY3RseSBwYXNzIC0tZGlzYWJs
ZS1ubHMgZm9yIGV4YW1wbGUuDQo+IA0KPiBJIGFsc28gd2FudGVkIHRvIGNoZWNrIGlmIHRoZSBy
ZWNpcGUgdXNlcyB0aGUgZ2V4dGV4dCBjbGFzcyAob3INCj4gc2hvdWxkPykgYW5kIGlmDQo+IGlu
c3RlYWQgd2Ugc2hvdWxkIGJlIGV4cG9zaW5nIHRoZSBQQUNLQUdFQ09ORklHIGRpZmZlcmVudGx5
IHRocm91Z2gNCj4gdGhhdCBjbGFzcy4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4g
DQoNCg==
