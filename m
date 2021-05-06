Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web12.5564.1620280774641887226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 22:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=jDI/ZpV9;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.88, mailfrom: leimaohui@fujitsu.com)
IronPort-SDR: 2vaW3ETtKqGtvPDw/A2WP9p9PvzJdUSi8cLppEE5JO2d7IlCInC/BLeZjDolcMPblvjITeD66S
 ZjofYxMWP5aVa/59zxZxI9DcTIymWwL1+uvvVwYOZrTGiD6Ou5SmKeZYuFz/hmu5PfIoeOWO0g
 cq1ZilP6NhyAt29KgtRdZ8WScOG+Ce9Tkg42IkXHVHrGQgRrLqE1Y6ZLop2HuYHMn8P+/hSrXM
 puxfWTZcrvczBCGjym7EXcK87OcYkxZ7OU7awcEQ0xFiAhK0DQh0upQPVnJSVMQI0/Mju3M/qQ
 4mQ=
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="30881297"
X-IronPort-AV: E=Sophos;i="5.82,276,1613401200"; 
   d="scan'208";a="30881297"
Received: from mail-ty1jpn01lp2057.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.57])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 14:59:32 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoFwtu1y50jbtyTG1bkt9FRaM2uMOP/1H6UXmQMaGw9RqTI/RKPW2+x/AfOZTUd+JWZg1JrtwCYBTVgyh4JOGItCWd3DMh9NRPGfOEsxzSwkQVjzzkVpU/qs9p7okqCec47S3FvEtSawFG4+Uf+P4xtF9AWOuZ5h4TqZyttk31MTy78vn1KwPZ5H11Zem6fNBHr7gutLrhfIlAT43Nczk+guTGKHm0bl8/7D8rPlHnRTYGJjDzjFgxqTe/oDmp2FJewZlsxBDp2xQwRw6Pl4TG6Q+pTHgeDw0SdVyygJzAAS/reQI6sBDz41DTQrUTl6m6FJMzCc7Lh7Qxcht/jLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrUIGm70y2Fp6hQBcRYNUjsXDvWfYgrazTx7bFC+Guw=;
 b=ksNxxbNCwp0dk0AKt8uryuQ3BAs3smiF801+N/n9qplu2fqD/nsfAd2jBLpFDLTa/SpNUKdgoez3JI87Sb6QbzlLv410YWWl5pr2KrSDdbPIxK8L+KTcjbIj/t+eowYDu83eqa0L9SEG0pz/C5mC0A7hQ0uqqyJ9WmL+en1PqYoL5gT8P4BKjf5F+V/PclMS6Y7n6kpkRMvBnVfLndswq7HTvVvUfVKUqSwrQTsOm2a572Drp9CV0+AagnNrynV9G8fZiSza6hyX8xOVuidje6xPy5cD1+ZI8IXg7XBQlEYqXjo+fpboJ6YofY6f8/wfqG7csax9P0nhS2Hu8SUZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrUIGm70y2Fp6hQBcRYNUjsXDvWfYgrazTx7bFC+Guw=;
 b=jDI/ZpV9G93LR1GsrpsX5TzSDFrk8tp/yj+TYmMGneUZnRlR3Mp00mApiWetegT7G3GpPDb/xMGimNjHfL1jCSkgDEbPjOi01AogOR5u8Ax5j+1AWyTmrpWE26FtRKY3/IhvOSJcYjv6birX4xBc+tu0Tf8W1Ny17OsI3FEJkrI=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OS3PR01MB6935.jpnprd01.prod.outlook.com (2603:1096:604:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 05:59:29 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::3476:7dab:4f03:e193]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::3476:7dab:4f03:e193%5]) with mapi id 15.20.4108.025; Thu, 6 May 2021
 05:59:29 +0000
From: "leimaohui" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Chen Qi <Qi.Chen@windriver.com>
Subject: Re: [OE-core][PATCH] db: update CVE_PRODUCT
Thread-Topic: [OE-core][PATCH] db: update CVE_PRODUCT
Thread-Index: AQHXNY2J27Cat0cNnkenJvuMDoT4l6rV6IEA
Date: Thu, 6 May 2021 05:59:28 +0000
Message-ID: 
 <OS0PR01MB61781C780E28187EB48FC07AA0589@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <20210420023252.61501-1-Qi.Chen@windriver.com>
In-Reply-To: <20210420023252.61501-1-Qi.Chen@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f7951ea-4d16-4ba4-d048-08d910541c71
x-ms-traffictypediagnostic: OS3PR01MB6935:
x-microsoft-antispam-prvs: 
 <OS3PR01MB6935265BC182CD44CF2E1DFEA0589@OS3PR01MB6935.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:224;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yCzy9uI9ApiKVCpdOyv856vOyIRWW9j+H/DKGTf1IrsGTIaOKDfGoxNM/BbuSTACQxr13jCsl/7O1RkV95M97Dxk2KxiRbHLywZ9v7mV1tO7jUQwFpLqg1aqzxiu3AYqzhE/L0VPWg23cV0VKgKAou/b55TrCJaUtCG8s+ZHhkgZ28EzK3YQGkqbH5ZvrHgxJhIl967mJwxx5oiBoy6fkp9XM70fRehZUqP+/zhryTpr7DlsFecY/wzrE35WBvJcwd16qOq5uGFyaX7/yuzq4RxDE9aB6JfkxsWvFWd6n+Iiw+C6rrO9vX/pPp3iF8sbLHkda+K+1nj3wk1QRsRa/XJ/hyCjPNA8R2nB+Mw3+HAAP8dYxdQjCNOiSAVWWnNkUSrUW6+m9AMfoB5XhVowv4ezIwEN8yujoSLqUIR+QRLdXA+cxDWKOAX+7aRA/jHQqI3zLRC0WuXrHzxofwXTYhjARSbVawjayrYaWlW/a0vfMWgiGc6jcuXYEmmSFgqdCm8H079NO26sx8UPaulTMqNIF3gYFHGJ7o8nv94JiYUevkKGxbbEkA88bNqxaildrt6PsU7YGK9RIj4m0y/zXdOuLzOGs9gBpEk9PGUuXuUvny8aFHvV04T03gzHL+I8pxjMrRux5f/DVOLR2I+j6G2pbonyIc9SZ9nIEOb0BaS0knCvggzKFKIRcqWAj2eN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(15650500001)(55016002)(9686003)(8936002)(38100700002)(64756008)(316002)(6916009)(76116006)(26005)(8676002)(5660300002)(52536014)(4326008)(2906002)(85182001)(478600001)(71200400001)(122000001)(33656002)(86362001)(6506007)(83380400001)(66946007)(66476007)(66446008)(7696005)(53546011)(66556008)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?shift_jis?B?aUpFWkd0QjdtVDV1eDBLazVweGJCa0VCNmFlYmY4Zmo5dnpFOG1pOGhY?=
 =?shift_jis?B?YlBIanhrRjRHanlMSG9RbHFBY0NSdDUxUzlwTUt1ZnF2WnlXQncxNkdk?=
 =?shift_jis?B?cnBaSXVjb1FvU1E3Nk9ndWpmSWlIcUtvSUJMK2tQanRIaWZoKzJpS0kw?=
 =?shift_jis?B?RFhYUU90V2pCNFNFSSs0OGtGb2JkSWVGQkpiaW13Z3dNNUg2UVVmaW8y?=
 =?shift_jis?B?bXNwRzVYTEIyb3U4ZXZKazYvSjlQNlh2bFRkeUN5UTdIY0JVenRQdUlx?=
 =?shift_jis?B?cTZTV1cxdXZobE9Uakp5WTlacXlZdlZNSEdwbVZVTjVBd2UwTmR4T0Vh?=
 =?shift_jis?B?SGJWckdqODJabldwQUJjaHVIdlhaYTRTMWFCK1MxanFpYjlscEYwSldO?=
 =?shift_jis?B?RkhtNWVqR1k1S2lTUEEvbUxyQkNhSXh5clpVd2FLN015NS9XQUp0R2kv?=
 =?shift_jis?B?NVptRCs2UnZFOCtkbm5XQzUyYWgyeUQyVUF3VHR5b2xUaVVlaG4wUUQ2?=
 =?shift_jis?B?WW1wSnlmWE9VaTlQZXhkZVJWZVlRY1dVR0ZaVUlmMUJ4bmRTZHpCbDFV?=
 =?shift_jis?B?b3dGbFAzemdsTHJjb2ZBaU5McTUrSlNrUzVFRm9HRTBDYlVqZy9rMVoy?=
 =?shift_jis?B?d21aRWlhbStoc3hydGQ2RWV3OUJIeFdwaDd4U2wzMGhmTmpibGwyaC91?=
 =?shift_jis?B?cXY0M3ZYKzhqV0k3ZGJBVDVnWngrWHU2QUc5N1FOZjc4MzRHWktYeDVs?=
 =?shift_jis?B?ZERodWNPSGwzRm0rVDZvWnFFT1RqMkF3eXVsUjdsdFFWVzd4QmdZOG5j?=
 =?shift_jis?B?SENyeEtEZFN6MklJRzJ2amJLRmEySHl2dmxNWTJSL3pzUkFPTml0U0tH?=
 =?shift_jis?B?OGRBZDF0RjB2a3B4WUVuUTFORGJqbkpRYmE2RkRCbDFySzRqdjV3cXcw?=
 =?shift_jis?B?TnpUVXEyMSt5ZGNoRlNhMlZjSFI5b1RkY2JYMkhneHJnVVdocmhZL1BW?=
 =?shift_jis?B?TEJzckNYRG50ZnEzY1JVRWdObHBET1M0UWxjZ0twbTRGVWthU3Q1RHMw?=
 =?shift_jis?B?QzVaa3Zpc1NMeDVaOFJEakxpdEZ5a1VwSVR4cHdrMHgvWmVxSXBsVnJZ?=
 =?shift_jis?B?bzdPR0tEc3dEaEYzOHlSTklGTjVLQWREdjh2QkQvZXowWW1WVUw3WUI3?=
 =?shift_jis?B?Z05JcC81eFBPOUlIYkdxVS9tWWRUNWRzVkxlYnJ6TVkxaHRnNnJyN0VR?=
 =?shift_jis?B?WVpLYUhFbHdCa3JJTlIyYXFxK0VOOSt0MDk2UWRnTmg0WG94UVVGZmN6?=
 =?shift_jis?B?OG8yUXlRRDlDbWRQSmFscEdad29xMHVlNFNLOXpOYmM2UVJCbTZWUW9X?=
 =?shift_jis?B?RFQzdEpla0RsSDZ1S1dYU0U2MjJvbjNvOFNSRHdBN0RBMU5UYmczRmtm?=
 =?shift_jis?B?eGNYVHJZbUgyMVVxUTJuUUZrMWdHVVdSRFZZT2kwYVhUWkZNYzByZkJv?=
 =?shift_jis?B?NGM2RlpjVXJjVk1Ud2lLcDgwTXZSbHlwVEVIUW50SERHd2pPYldXU3N5?=
 =?shift_jis?B?L2QxUTZLWld1WXBZL3ovWUJwMFM4azVWdHk4K3FkNm5MeDdrVStkRW9D?=
 =?shift_jis?B?dytSTmdoS0k2d1drSlhLZkw2ZEFaN2cxazFMMXoxelpZY0VzWVhYRjFk?=
 =?shift_jis?B?WE9QUUppVnBNaTVHd1ozS0YzcmFPb1dETGZxQ3hTRE9SeWkwQVprL2p1?=
 =?shift_jis?B?YTFJNkZlWG1BWTVyRTZjbWhsT0srdFBHQUZSMndseUQwYU50NWNpZlNi?=
 =?shift_jis?B?TERWQXlZcWcvaGJrV1cyNHF3RHE5bGZFdDVBaTk5cFQxQXhFUmtsQVZ2?=
 =?shift_jis?Q?JBFrOXoOp/plDYdEIAeDE=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7951ea-4d16-4ba4-d048-08d910541c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 05:59:28.9118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2W7xFq34S9uJFmsujCJtzIxSr2NHZPFNlBLVF9vsmEdGu0t+dff5v/T5pqzOe4usw72nGTKXutlPKmgIDi6+JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6935
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCldoeSBoYXNuJ3QgdGhpcyBwYXRjaCBiZWVuIG1lcmdlZCB5ZXQ/IA0KDQoNCkJlc3Qg
cmVnYXJkcw0KTGVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIENoZW4gUWkNCj4gU2VudDog
VHVlc2RheSwgQXByaWwgMjAsIDIwMjEgMTA6MzMgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogW09FLWNvcmVdW1BBVENIXSBkYjog
dXBkYXRlIENWRV9QUk9EVUNUDQo+IA0KPiBVcGRhdGUgQ1ZFX1BST0RVQ1QgdG8gYWxzbyBpbmNs
dWRlICdiZXJrZWxleV9kYicuIEZvciBleGFtcGxlLA0KPiBDVkUtMjAyMC0yOTgxIHVzZXMgJ2Jl
cmtlbGV5X2RiJy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJp
dmVyLmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kYi9kYl81LjMuMjguYmIg
fCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kYi9kYl81LjMuMjguYmIN
Cj4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kYi9kYl81LjMuMjguYmINCj4gaW5kZXggOWNiNTdl
NmE1My4uYjJhZTk4ZjA1YyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGIv
ZGJfNS4zLjI4LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RiL2RiXzUuMy4yOC5i
Yg0KPiBAQCAtMTUsNyArMTUsNyBAQCBIT01FUEFHRSA9DQo+ICJodHRwczovL3d3dy5vcmFjbGUu
Y29tL2RhdGFiYXNlL3RlY2hub2xvZ2llcy9yZWxhdGVkL2JlcmtlbGV5ZGIuaHRtbA0KPiAgTElD
RU5TRSA9ICJTbGVlcHljYXQiDQo+ICBSQ09ORkxJQ1RTXyR7UE59ID0gImRiMyINCj4gDQo+IC1D
VkVfUFJPRFVDVCA9ICJvcmFjbGVfYmVya2VsZXlfZGIiDQo+ICtDVkVfUFJPRFVDVCA9ICJvcmFj
bGVfYmVya2VsZXlfZGIgYmVya2VsZXlfZGIiDQo+ICBDVkVfVkVSU0lPTiA9ICIxMS4yLiR7UFZ9
Ig0KPiANCj4gIFBSID0gInIxIg0KPiAtLQ0KPiAyLjMwLjINCg0K
