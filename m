Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com [216.71.158.33])
 by mx.groups.io with SMTP id smtpd.web10.4568.1618883715753747539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 18:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=fJRuZii9;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.33, mailfrom: zhengrq.fnst@fujitsu.com)
IronPort-SDR: jEJ9PFpKcU194p0wscKUZXpfzXRRCMfk92dOyT/jyKVLh0/4hnn1Vlmr9qwlZoFrF94rJ1oxQR
 pVSY5iVVDzAwKcOb76KXc3yZzL4POJSXcXm4mguws30CbLmyyt85gN9UGJZ3z0H/g4O0Ulbc7l
 0tSG79Dx9e+/m4Xt4aZrftmAgkcF9fBXmLfYTws87vu+DL5Yfo5FNOl9TcEEQ/vWxrxjOjh7XQ
 7jXlgAhe4Wa0QvhGC5grxopqngVWOzxf6nDXl38oacFcOH4+CHMGquUwnNqla9jbztDVSr5YUr
 VfM=
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="30004092"
X-IronPort-AV: E=Sophos;i="5.82,235,1613401200"; 
   d="scan'208";a="30004092"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 10:55:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv/E4ZKhLfyKTdejmK/4LQDyq8CpPbgObh8i1r9/T8owc5BAhDJJcymg3M5Be2WiyK0+b7Y6gP+vGxRizMhUaEddcfsw0FnNR8R79/yanyB6ZD4Y3D71rwMr+MdVjKDJWyL7WHSA8BNuotLiRmNWoWkknaIZxZamkptOuDoOO1+dZNW/pNOAmpMX3R+A/Jy5EvcctDqY4ywXgs2MNvaOwxJ99dmuSeyCl/r4+YaofhiDkOq/XKZsrD+gIAWCZAxYpmyasLkIhHuKZs+7fAE3GTMJU6CFi55t4zr1WA8YwaXe5/Uk9TO4R1/ufPFwGz0U5vcgYxboX3MAMRB3S4KUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A36EgN5Ru/ahqQb5wIW4xbeDDbMdEV4kcKWE2zlJwf0=;
 b=XI26NzQ4ttH0OUXqZ+xuqbMvfMrnJYspzYI/FPI9fOYcybC3S87PoUdYYb48QLilb/ssMRMfJL7L+22LrOc89CTVB+E26p2lsNtD5l1sS/MugWf5eyb9k/OwYu2dVnIUCAcYdR8ACwyHaThBNxELWb4UN0ki4/iQZmEE3RwzM1EptxdAduft16nvVHETvG40mB9AxjkLjqoB/FkaNlxESYeU4WABlQcV81smKd6bQ3KX2bknaHNHU7PCwnKgel1gRpz/ZLmGgp0oFZCzTGknM31e7bLfp8k5x2T6/lHbVZIzadJxzWFfRWjZyFgxtPwm9n7GG61VncJr95XF7MF3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A36EgN5Ru/ahqQb5wIW4xbeDDbMdEV4kcKWE2zlJwf0=;
 b=fJRuZii9VeLJF6CYcufruydGD0ObzMlwHqJesSuZvSaNXddM+AlEUuknJNE5FywPKiIVRi3dbfc/Jw66HtXwmNcsBQiVVZS2fPBEOQfU26jm9vn3QCpL32fWA1Qp3dUvYbyXhycyJjG7VY6/EufHNNEfDFEezbfkCbpKJeiWYLg=
Received: from OS3PR01MB6241.jpnprd01.prod.outlook.com (2603:1096:604:f1::6)
 by OSBPR01MB3382.jpnprd01.prod.outlook.com (2603:1096:604:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 01:55:09 +0000
Received: from OS3PR01MB6241.jpnprd01.prod.outlook.com
 ([fe80::e967:b2f:bf48:b83e]) by OS3PR01MB6241.jpnprd01.prod.outlook.com
 ([fe80::e967:b2f:bf48:b83e%5]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 01:55:09 +0000
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>, ChenQi
	<Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] db: correct CVE_PRODUCT
Thread-Index: AQHXNOmIoYnwoz1wP0u7yzV8lnoa+qq8pNZQ
Date: Tue, 20 Apr 2021 01:55:09 +0000
Message-ID: 
 <OS3PR01MB6241D19197EB67173486060E8B489@OS3PR01MB6241.jpnprd01.prod.outlook.com>
References: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <YH0qTWrdEX5VH3eS@korppu>
In-Reply-To: <YH0qTWrdEX5VH3eS@korppu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bmw.de; dkim=none (message not signed)
 header.d=none;bmw.de; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc245f2f-9d84-452a-8a01-08d9039f5459
x-ms-traffictypediagnostic: OSBPR01MB3382:
x-microsoft-antispam-prvs: 
 <OSBPR01MB338243D881281C26F9A225AA8B489@OSBPR01MB3382.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5DoEFFQeydsgH7QVNdOxFVOQs1S2BVcjG/avLVUzGIElbb+pnF8e2BGH3PpQWp5FiKewEwxW9S931x53yLOj6844qN4JlR/PbCZTMV3ozhJM56YYDMpulANx+r/bKAmAWfXxPHq7viAbBlM5lI0De39WabHLzp8EYNkcRvL6aN7ZpBLyj41EX1r5M9OC3LYr6SvlFuvHCCsnFnDMaj+r56yrjEXV83WBCL2J+yLMIbMkveSyJvAP8OJr0KThkr705Af/w1CUW/Jbc9kl6Kjb1ZLIapEhi4eTqwA7Gp75eUDVdQd4IR8e/dfnEG2Kw3NBsOGNk3N4UEq4bmr1Fayl0QmK+VWU9JkB5FeRM/e8zRh7CdX243ZsDt5h3TdZKiZ+F7ScYC82OsYLULWp1Nsa6P1oUzqZLlyLiuHusyjM/A3xgoBsgSHjbTDWw9giqIYr/k6rzKA9j8v0wMjnxbEjyAWEIqo0aJL7MfSAcqxmcVElDwu52nv9Qd6J81arDx/+5uYci6Oo6/gBB6RE8Bivnh2Dzqr0GXsxsAopckOUaVGv69MfnDEAVWhkzB3iGr1VFhoL2yn7C7Pk3oi11UODfkNcB0YScKlOii1n2JFqRBDuJJmpPqSEsgOOHf2xnqNSciM/Dtgh7T+cBP6uTWAT7eA6wACVg5uLNF1CG1PF07VZKnMcs95ncZTA0pTN7gwX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6241.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(8936002)(66446008)(55016002)(9686003)(2906002)(122000001)(4326008)(76116006)(7696005)(110136005)(478600001)(66556008)(66946007)(8676002)(64756008)(66476007)(966005)(33656002)(26005)(186003)(85182001)(83380400001)(6506007)(5660300002)(71200400001)(52536014)(316002)(53546011)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?b2d6Z01EcWxNSUxMUndJWXA3elJHeG9pQzVGNlluSFI5aXNhVGJkL1I2Vit2?=
 =?gb2312?B?SGZJcHFkYUUvNThremQzMWNrNTlqU1VpNStORm1hNi9RL09UNGhHSU1wMm16?=
 =?gb2312?B?aGdwOFNNWG5nKzE0enFZZmo5RU14ZGhlckN4Sk5UVVN2WndGY1lIYkZIOWNl?=
 =?gb2312?B?YVBGQkFBaWxhOFhXMlo5U2QwV1M4aW1SdjJ3Y2FUc2RYek9GeUJuZlhXdzJo?=
 =?gb2312?B?bTNQQzFjZDVFTUpoR2EwQ08vMFhmR1pDckdSWjRRamhTTFdBc0lCM1lVLzJP?=
 =?gb2312?B?ZzAyZHFKN05GZEwyUjdVVm05V1QzQlpsUU1oWjVDd2JISzUvMjlIU0V6b0dX?=
 =?gb2312?B?ZjUzb2NnSzlMNnZ4bVFvaFF6eXduUU56c1UwSFhudFVFRmRrODExTkltaXZY?=
 =?gb2312?B?cUZqZEkrT24wRlRsSklqZlF5YzJVelZIT3hqWHZCUWYyMTd6bWtlMUZOYnlB?=
 =?gb2312?B?eGxPWG8vSlBsQXVmd3k0UllYNmhiSVZ4MmFkL2tJS1lCbWVCRndrOUdKOFhy?=
 =?gb2312?B?LzVrTU95ZGE1RkZkYzlQMEFJSG5CckpBby83bHFlbXJpUGJqSVR4WnUybUpX?=
 =?gb2312?B?MmlTcGdLZGlUYVlscWtnWnl4T1dCcU8vbjJFS0gxbkFHYlEzV25FQVVMTTRs?=
 =?gb2312?B?UUFFZkwybmZkd3l4L3gxejhVNVl2MFpFcWkxeHR6SFZhbWp4RTJDVlptbFhE?=
 =?gb2312?B?S0poZFdQbkxpdndUbTNwb1REZHZ3QUJlQ002czFwMVJ4bURkOXNWWTJhMExP?=
 =?gb2312?B?NHFSTGl2VzFUd1ErVGV2eHpKMjNJWm5ZeWp3azIyQmVzSWFWTkpnNXZyc0ZX?=
 =?gb2312?B?VnZVZWdzTDcwd25wZjFUQy8rV3JuQkkzM3kwSi9BVUlqVXI1WTkwWTRCak5y?=
 =?gb2312?B?LzA1VVp2TTM5RmZWV2JDS0RKeUt3UG5kUkUvRk4wMFUxdDJlZEQrZWFvbHpQ?=
 =?gb2312?B?TTJmZGRIN2s5ampudkVZNWVSbDh0R2hNYjhDeDZqc3NYeWluVXd0OUlxUjRF?=
 =?gb2312?B?YkJnck55SWNMM1JoVlVKMnM0MW9JalZKZDlGZlR2MEZmWTdtQk1sdTRpdTFY?=
 =?gb2312?B?SFA4Qk1nbXdHOVZEV24xSCtBaFR5UlhkNWpkNGc5T244VDJ1L0ZDeFY1RFBx?=
 =?gb2312?B?R3M3VFUyaEhoVURDZVgrRDc2Mi8ySitJcG1rekFxSjJvZ2RNZDA0eXdCdWlo?=
 =?gb2312?B?MjgyNUZsL29taktRMTEwcmJVeFBxQVpmZlp5Z0VGbDVlcngxQk1BYWQ5emQy?=
 =?gb2312?B?QXRUOWJLc1ZSQXpERFV6bGtkeGFDa3pKQUVqMnNZWUcwQlY2RlNoZVQvWHZw?=
 =?gb2312?B?RFVyQmVobDU2UnNiaDZ6V2lvK21jUThKYy9hOU9ObE8wcWJtRHJmOTdIS0hC?=
 =?gb2312?B?endvOVRpVUpvQ1Y0dWlUU3JxNHNCZkhXVmU3dWR6aUZ4Uk9MUHJXSUxlT2ZU?=
 =?gb2312?B?UCs4T0NUelBVYUJkZDMxK3RCbVcrTUd4eTM4UHNZZFBCbEM1elUyaWptTUpz?=
 =?gb2312?B?T2RwbkZSb0ZqZVF1S1hURmFmdXdBSEd3a3VXZ2h4RUlmZGl1WWd4N3V2RzJD?=
 =?gb2312?B?VndNMGdkeGdWT3JkQzFvT1dqTE9rWDEvZ1c0MzgwQ2NocTRqOU5nVCthS3Z5?=
 =?gb2312?B?dndDM0ZEUlFZQ2w1Y3M5dTUzQnF3S2phYTJxeW9DOGpwVlUwRXc3eW5ualdW?=
 =?gb2312?B?NlhPNDFRR0IyaDlPNTA5SktMQVBjVHUxOTRSRTNGRWV0clRBVHhod3c5OUVB?=
 =?gb2312?Q?grBzj/0Mo1dVx7JkwV+R0hMvRP2PiUBNO7znktk?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6241.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc245f2f-9d84-452a-8a01-08d9039f5459
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 01:55:09.8159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /mV2/gjMemsMVEMtTd7Zpt7Y6h+PKtkIag/tyWkq26s7DLdkfbBouowv0GUxKZA7ZJtIlV5kso9aTq4h92eQ0KGDrwaJEXqoakVMUFPqa10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3382
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksIE1pa2tvLCBDaGVuDQoNCk5vdywgY3ZlX2NoZWNrIGNhbid0IGNoZWNrb3V0IGFueSBjdmUg
aXNzdWVzIG9mIGRiLiBJIHJlYWQgbmV3IG52ZGN2ZV8xLjEuZGIgYW5kIGd1ZXNzIHRoZSBuYW1l
IG9mIENWRV8gUFJPRFVDVCBzaG91bGQgYmUgY29ycmVjdGVkLg0KcHM6IEkgZG9uJ3QgaGF2ZSB0
aGUgb2xkIG52ZGN2ZV8xLjEuZGIsIHNvLCBJIGNhbid0IG1ha2Ugc3VyZSB0aGF0IHRoZSBvbGQg
bmFtZSBvZiBkYiBpcyAib3JhY2xlX2JlcmtlbGV5X2RiIi4NCg0KJCBncmVwIG9yYWNsZV9iZXJr
ZWxleV9kYiBTRUxFQ1RfRlJPTV9QUk9EVUNUUy5sb2cgDQokIA0KJCBncmVwICJ8ZGIyfCIgU0VM
RUNUX0ZST01fUFJPRFVDVFMubG9nDQpDVkUtMjAxMC0wNDYyfGlibXxkYjJ8OS4xfD18fA0KQ1ZF
LTIwMTAtMDQ2MnxpYm18ZGIyfDkuMV9mcDF8PXx8DQpDVkUtMjAxMC0wNDYyfGlibXxkYjJ8OS4x
X2ZwMnw9fHwNCkNWRS0yMDEwLTA0NjJ8aWJtfGRiMnw5LjFfZnAyYXw9fHwNCkNWRS0yMDEwLTA0
NjJ8aWJtfGRiMnw5LjFfZnAzfD18fA0KQ1ZFLTIwMTAtMDQ2MnxpYm18ZGIyfDkuMV9mcDNhfD18
fA0KQ1ZFLTIwMTAtMDQ2MnxpYm18ZGIyfDkuMV9mcDR8PXx8DQpDVkUtMjAxMC0wNDYyfGlibXxk
YjJ8OS4xX2ZwNGF8PXx8DQpDVkUtMjAxMC0wNDYyfGlibXxkYjJ8OS4xX2ZwNXw9fHwNCkNWRS0y
MDEwLTA0NjJ8aWJtfGRiMnw5LjFfZnA2fD18fA0KQ1ZFLTIwMTAtMDQ2MnxpYm18ZGIyfDkuMV9m
cDZhfD18fA0KQ1ZFLTIwMTAtMDQ2MnxpYm18ZGIyfDkuMV9mcDd8PXx8DQpDVkUtMjAxMC0wNDYy
fGlibXxkYjJ8OS4xX2ZwN2F8PXx8DQpDVkUtMjAxMC0wNDYyfGlibXxkYjJ8OS4xX2ZwOHw9fHwN
CkNWRS0yMDEwLTA0NjJ8aWJtfGRiMnw5LjV8PXx8DQpDVkUtMjAxMC0wNDYyfGlibXxkYjJ8OS41
X2ZwMXw9fHwNCkNWRS0yMDEwLTA0NjJ8aWJtfGRiMnw5LjVfZnAyfD18fA0KQ1ZFLTIwMTAtMDQ2
MnxpYm18ZGIyfDkuNV9mcDJhfD18fA0KQ1ZFLTIwMTAtMDQ2MnxpYm18ZGIyfDkuNV9mcDN8PXx8
DQpDVkUtMjAxMC0wNDYyfGlibXxkYjJ8OS41X2ZwM2F8PXx8DQpDVkUtMjAxMC0wNDYyfGlibXxk
YjJ8OS41X2ZwM2J8PXx8DQouLi4uLi4NCg0KQmVzdCByZWdhcmRzDQpaaGVuZw0KDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWlra28uUmFwZWxpQGJtdy5kZSA8TWlr
a28uUmFwZWxpQGJtdy5kZT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAxOSwgMjAyMSAyOjU5IFBN
DQo+IFRvOiBaaGVuZywgUnVvcWluL9ajIMj0x9UgPHpoZW5ncnEuZm5zdEBmdWppdHN1LmNvbT4N
Cj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGRiOiBjb3JyZWN0IENWRV9QUk9EVUNUDQo+IA0KPiBP
biBNb24sIEFwciAxOSwgMjAyMSBhdCAwOTo0NTowMVBNICswODAwLCB6aGVuZ3J1b3FpbiB3cm90
ZToNCj4gPiBJbiB0aGUgQ1ZFIGRhdGFiYXNlLCBub3cgaXQgdXNlIGRiMiBpbnN0ZWFkIG9mIG9y
YWNsZV9iZXJrZWxleV9kYi4NCj4gPiBTbywgaW4gb3JkZXIgdG8gYmUgaGFuZGxlZCBjb3JyZWN0
bHkgYnkgQ1ZFIGNoZWNrLCBtb2RpZnkgQ1ZFXyBQUk9EVUNULg0KPiANCj4gV2hpY2ggQ1ZFcywg
cGxlYXNlIGFkZCBhbiBleGFtcGxlPyBJbiB0aGUgcGFzdCBvcmFjbGVfYmVya2VsZXlfZGIgd2Fz
IHVzZWQuDQo+IEkgd29uZGVyIGlmIGJvdGggd291bGQgbmVlZCB0byBiZSB0aGVyZSwgb3IgaWYg
dXNpbmcgdGhlIG5ldyB2YWx1ZSBpcyBzdWZmaWNpZW50DQo+IGZyb20gbm93IG9uLg0KPiANCj4g
LU1pa2tvDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0
QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kYi9kYl81
LjMuMjguYmIgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Ri
L2RiXzUuMy4yOC5iYg0KPiA+IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGIvZGJfNS4zLjI4LmJi
DQo+ID4gaW5kZXggOWNiNTdlNmE1My4uMDU3MjAwNTNmNCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9kYi9kYl81LjMuMjguYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9kYi9kYl81LjMuMjguYmINCj4gPiBAQCAtMTUsNyArMTUsNyBAQCBIT01FUEFHRSA9
DQo+ID4gImh0dHBzOi8vd3d3Lm9yYWNsZS5jb20vZGF0YWJhc2UvdGVjaG5vbG9naWVzL3JlbGF0
ZWQvYmVya2VsZXlkYi5odG1sDQo+ID4gIExJQ0VOU0UgPSAiU2xlZXB5Y2F0Ig0KPiA+ICBSQ09O
RkxJQ1RTXyR7UE59ID0gImRiMyINCj4gPg0KPiA+IC1DVkVfUFJPRFVDVCA9ICJvcmFjbGVfYmVy
a2VsZXlfZGIiDQo+ID4gK0NWRV9QUk9EVUNUID0gImRiMiINCj4gPiAgQ1ZFX1ZFUlNJT04gPSAi
MTEuMi4ke1BWfSINCj4gPg0KPiA+ICBQUiA9ICJyMSINCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+
DQo+IA0KPiA+DQo+ID4gDQo+ID4NCg==
