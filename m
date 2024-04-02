Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D456C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 22:33:14 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.103])
 by mx.groups.io with SMTP id smtpd.web10.1559.1712097193103254391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 15:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ihUkVtVf;
 spf=pass (domain: axis.com, ip: 40.107.104.103, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvObJz9rwDQ7rI7SHr2Qyrpdsu2W8v3uP4UJFEiFR9tZLi4H8pM2Av7tXjJA4hnvVX6mwRWxgEuRiZYAw0IKPNYtyt3WcpZdtPm4Alj72qgR8L/PFzk+B0GOVG+cWLXCr0aQFPdx+ehMfvG7ympDvjZ2sYQkSL72xv5PYyhdWI1gKqADLmqxix8m7Hlxbh4/Ju9ax7rBtQLU3AOeEu5dvT5j3rghh89fgnY4k6qM7nHXmLXtH4KBIbz42PgSnxrVYz7SwMSStfYTq9oT27SrXUjm2dQIwF0UjmdQ7PMFEKk8UFgkgZ/7xf8ub98xsnKtqWLbIfhoDCcJ6JkEWZB97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtSzuFDBRBNCIkccqliItFccHjLw8DKOoID7VszV0D8=;
 b=Xu8n/espivQsrhzNCrr/70JdRQhR9y51+afHvKjw2m9CmnyN6zBF4koiNplnAN4p9ZI6QQW4ILWvkij8WKf7lWlUXNNXlVlDlsG6rSPocipZnZu1RHE/t40b45cf13rK/OnOUxnRqL/TAurRF/lRQlCx4PuBV9SdpIU/GSStTcfOIpTKijWQRhQ4b7Jm2gOvuJK6prNWd8vUM7qfYvrL4MZjRvk9DVeAkHnjUhB/mYZpXSKFdP1dNl+0+4PhES+AtXhNZp/TcusmLLKpyCdzdmiJOhtoXZkZKIsvZnFZEpxSCH/nPJV37y6Y4eQedCpy3/6uo0AbD2gPG+TgHgKTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtSzuFDBRBNCIkccqliItFccHjLw8DKOoID7VszV0D8=;
 b=ihUkVtVfZJV/MVQGM7ha/Ge08NZp09FjHWH93lPJieycFmzM5D9ELE6hZoe3iNNahqBWmyVA1jUgGtIkeZ2HAHrcvSJrmGdyZkkoNxNLpjX5GzBb4rA6wWVCjZlLBYQC2N+rCSy9PlAXirEsCAOpxRNVTP/MnCF2M57ECLHnJZw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8955.eurprd02.prod.outlook.com (2603:10a6:10:473::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 22:33:10 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 22:33:03 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: New mailing list for layer patches
Thread-Topic: New mailing list for layer patches
Thread-Index: AQHagR1cotkaH6M+gkmP/+hETk3NqrFVlqRg
Date: Tue, 2 Apr 2024 22:33:03 +0000
Message-ID: 
 <DB5PR02MB1021390D34E1DC909E4E277C6EF3E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>
In-Reply-To: <8363E7C5-B3C0-4B3E-941E-762A400DF87B@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8955:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rsjEdfrpj9XG6YuSYoj/sGxGycK84r2mp/Yr12cKvMKzNv7SEUGlJGdkQO48wWpBc3s2lUcf+TEv0xhX0beFH0Bu3gGx+XRq9qVLP3cznma662fvlARhkBOJuP9b00Mu+UZrogbtyOdpTTAwDSVk6r9w6AY5LyLWduCVUMyNmLSrogwqM3UDL+T4OvGwTWZbH/aQuc1mKmUFwOyVxb/bAyLLNAcddKRJ2TwSpoSFPgcJ7aNDvYxgLkkgHCOY02jgBFygO0Sg2xQRufm6tWQZhLMrjeBGZJ8LgxxBdOYpPnkgwT0ugphqtPphL1T+W5cF4RnQTjfFXn0x6DaZSqTSQkTx4HIcpoznHfKX+NuJnntrQaNJqoXgwZooyZzigQZR9KR06mhMXqZfXHBYSwUpc9ZBkEC7P2iOjKffStj7cX9Zh08TyRzVvMJ/e0GWHlJQ/6wVGrX9tHLuha4oZIrqrq3Vl0ULxrHz9qX8IAuXiYFdP4922z9eTv3qWL5uDHgdeaJDfImtN9TlWeZLCY+P8id++IRhwSAojPFCYUyw7G6od67sAKBk6P9fLOGo3e7icPqTdjGMwr43FS4OMcREUzcF5xsAJQSHYHWQmVZe8as=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cWEvTm1KbjFxRUtyL2ZwR0xmb0w2czJkRk0wbkhNYnloSXJqOXZCamhqUFo1?=
 =?utf-8?B?eUhGYnlEMnNFNlJaWVRYN3lKVENmQ3JMcUNYd0pXOXBlNllpZTBLMjBINFI2?=
 =?utf-8?B?a2RrQmQyR05xa3dJWXh0YmxtSVhCakdvSVE1Nm1pcWVaNUpubmIreXRoeWwr?=
 =?utf-8?B?MUdkMGlvRUFXV3pza05kSW13bkNsUUVSVkVzVDd1b1ZSV0ZIVWw5N0wwNm92?=
 =?utf-8?B?OUFWOXVRdUtDbnkyNU0wYVZEdVZ2OXBvV3EvQzN0ZDBCbzFESEs1NlJxSUgr?=
 =?utf-8?B?Z1l3MW45SEx1dlBabkhGdkZTZDZ4MkQ3WWJMbDBWNEQ4OWxUWnZTbTcrY2lF?=
 =?utf-8?B?a1lwaE5VR3ZlWEszdU9obXpud1hZRmVCbHFnUzl1d0pKRlFXUWUzM3N3VWRY?=
 =?utf-8?B?d2RScndxM3BXSWVoSlVwd1RmZnFyQWkwSCtROWc4YkcyT0x5bXNpbXA0SStl?=
 =?utf-8?B?SnR1aDFRd0h3b3Nxa0JNQnpsTmVCN0prV3hQa3hnaFBkSkVIS2hXZVlmQnNy?=
 =?utf-8?B?bllFYTNuQ3NVa3JGNmxIRWtsTHFHamNEbHFJaXVXZDI5dUxHeUdQdzRQcldq?=
 =?utf-8?B?ZDVBTjdNc1lWZWxvRldXcXdxL2VtNSt4clpNb1B2aDRmM3pPTmJ1R2lKdGsv?=
 =?utf-8?B?K2FIZURjK2padnB1SnpvamtLc3VZZTVOcFVncXUrT0dwV2xUVEpPSFkwK1N2?=
 =?utf-8?B?UW0zclRsc2x2QU1SdHdWekFJTHNNTTZaWUlCeXlpQU94RG1DaTUrOFgyTTd3?=
 =?utf-8?B?NWlsc0JqT0pqKzV2cjAzSmNoNUhJNnA3RmdvVjZBT0Z0NzE5aTR1Z3hvbm9j?=
 =?utf-8?B?WjJpMTZzOEhpbzFBVEZxTGEzQWFRNDJlZFh3Y2NGVEdSWmt2SEZKMTcvaDdM?=
 =?utf-8?B?MjRpY3hKa0FlYVZQVnkzeC9EK0VWaGVicTVxQ2tsc0lham1zand6Y3NZcytQ?=
 =?utf-8?B?eHZVSmlvZGo3cm5KMDNZMytzTWFvSE1NT041NHFKdDBrR1BkVmhSN0U0WEt3?=
 =?utf-8?B?ZXpmMHJTY3lzdVpmNFE3Mnc0NGcwT0JzLzhyTDJYbkorU0Zwb09JQmZkeEl6?=
 =?utf-8?B?bUV4NDJvSSt4OUgveVc0dUR0aHRBaS9TVVR4MkRHeFA4bXg4VmU4bVltQ3Y3?=
 =?utf-8?B?R1p0RUpuL3NFK2FPZytLcXpZdXROYlRCQTc0VFIwcUtpVEpvdVF0cldJY0hu?=
 =?utf-8?B?T0YybTFoK1dkT0dlcFFMUUVmUkhUeWVPR2VENnpyaExwaXpETGJCTTZPL2NP?=
 =?utf-8?B?VmZwTExIWWc4elI4Q1l5WXFMLzBCNnc3TzVUNDNvaUFFSWFRdkYrMW1LbGg1?=
 =?utf-8?B?SVc0bWJNYWZXU2laaG9DR0wxLzZvOCtZeThheE9JRmNMdWdNWTlGcnlwQW9E?=
 =?utf-8?B?bVJkc2syREtMRk1wUk4yNnNrVGZoelhOTWZWQ1pObGwwVW5VVzV2NUJXZkYr?=
 =?utf-8?B?QVdwV1VTVzNLVGNxRHB6OGU0ZFJPeUQ0SWZYcEtsODVZWk9GVkhzZ2xvWnJh?=
 =?utf-8?B?VDF6d25ac0g2UGhWakF5Q29ZZUFEMVlOVHlHemVwNU8vcFNheWd2RTFQdlJ1?=
 =?utf-8?B?U3dsTVpxMVcwWjdWMlFlcHlhbWZrSXViMTNiSFc2bTIyeWNvMUphL211OWdC?=
 =?utf-8?B?MytwWHMxL2FKVWxQYXg5Mjc5YldEVnJDQXVwOE1wKzE0Sk05RlR6aWZVSlRX?=
 =?utf-8?B?SkduRDRoOWJOaGFFRnNxaEZYN3R4cmlHOVRaNUxzUUx0Vzd5UytjdEdydDJ1?=
 =?utf-8?B?L2IwaFltcmNZMnBTUnkzcWw4SjFXSzBjZEZaWjBaNXE3SzFkaHJCVjg5ci9K?=
 =?utf-8?B?d2s1U05hdVl1azFRNGt2dFlEZmRxYmdnZ1I2aDJnZS9kWWhVZ25pZC9NdDNI?=
 =?utf-8?B?RHFPZTNTelZJMHRMZmxtcWRBZWZLZFc1dTZTdFpjYlRJYXl4Z3VsUEtVUzMv?=
 =?utf-8?B?S0JyQkkyeEhUanhpOG5GNEd2d2dyeGFuY1U3NDN6MFFtRFhzRGQ2dEo1MTRa?=
 =?utf-8?B?Z0U1ODhUN3NINGN4ZUgzUUtzWWtiaGhSd0lDR0ZablhMWmQ2Yyt1dUNCZkZQ?=
 =?utf-8?B?ZTVDd2dIYTFPbHFxODZVeXZJd25McGZiVDlTY1B4YWdFa3ZEc1A0dW9sUXp2?=
 =?utf-8?Q?Amk4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a137a6-177b-4cdd-d1b4-08dc5364dc18
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 22:33:03.3981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoLdxaq7ab2RVHABRptHVcsx7ZIpKOUCF+YmzRYn2AZmY6QHvzguwqPBLJP4Lepw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8955
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 22:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197883

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiB5b2N0b0BsaXN0cy55b2N0b3By
b2plY3Qub3JnIDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbg0KPiBCZWhhbGYgT2Yg
Um9zcyBCdXJ0b24NCj4gU2VudDogZGVuIDI4IG1hcnMgMjAyNCAxNTozNw0KPiBUbzogb3BlbmVt
YmVkZGVkLWFyY2hpdGVjdHVyZSA8b3BlbmVtYmVkZGVkLQ0KPiBhcmNoaXRlY3R1cmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz47IFlvY3RvLW1haWxpbmctbGlzdA0KPiA8eW9jdG9AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz47IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBbeW9jdG9dIE5ldyBtYWlsaW5nIGxpc3QgZm9yIGxh
eWVyIHBhdGNoZXMNCj4gDQo+IEhpLA0KPiANCj4gQXQgdGhlIG1vbWVudCBpZiBhIGxheWVyIGRv
ZXNu4oCZdCBoYXZlIGVub3VnaCB2b2x1bWUgdG8ganVzdGlmeSBhIGRlZGljYXRlZA0KPiBtYWls
aW5nIGxpc3QgZm9yIHBhdGNoZXMgKHNlZSwgZm9yIGV4YW1wbGUsIG1ldGEtDQo+IGFybUBsaXN0
cy55b2N0b3Byb2plY3Qub3JnIDxtYWlsdG86bWV0YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zz4pIHRoZW4NCj4gdGhlIGNvbnZlbnRpb24gaXMgdGhhdCB0aGUgcGF0Y2hlcyBjYW4gYmUgc2Vu
dCB0bw0KPiB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxtYWlsdG86eW9jdG9AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZz4uDQo+IA0KPiBIb3dldmVyLCB0aGF04oCZcyBhbHNvIHRoZSBsaXN0
IHRoYXQgd2UgZW5jb3VyYWdlIHVzZXJzIG9mIFlvY3RvIHRvIHVzZSBmb3INCj4gaGVscCwgc28g
dGhlIGxpc3QgaGFzIGEgbWl4IG9mIHBhdGNoZXMgZm9yIHZhcmlvdXMgbGF5ZXJzIGFuZCBwZW9w
bGUNCj4gYXNraW5nIGZvciBoZWxwLCB3aGljaCBpc27igJl0IGlkZWFsOiB1c2VycyB3aG8gd2Fu
dCBoZWxwIGRvbuKAmXQgd2FudCB0byBiZQ0KPiBmbG9vZGVkIHdpdGggcGF0Y2hlcyBmb3IgbGF5
ZXJzIHRoZXnigJlyZSBub3QgdXNpbmcsIGxheWVyIG1haW50YWluZXJzIG1heQ0KPiBub3Qgd2Fu
dCB0byBzZWUgdGhlIHJlcXVlc3RzIGZvciBoZWxwLCBhbmQgcGVvcGxlIHdobyB3YW50IHRoZSBz
dGF0dXMNCj4gcmVwb3J0cyBoYXZlIHRvIHJlY2VpdmUgcGF0Y2hlcyBhbmQgc3VwcG9ydC4NCj4g
DQo+IFRoZSBZb2N0byBUU0MgaGFzIGJlZW4gZGlzY3Vzc2luZyB0aGlzLCBhbmQgYXMgYSBzb2x1
dGlvbiB0byB0aGlzIHdl4oCZdmUNCj4ganVzdCBjcmVhdGVkIGEgbmV3IG1haWxpbmcgbGlzdDog
eW9jdG8tcGF0Y2hlc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IDxtYWlsdG86eW9jdG8tcGF0
Y2hlc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPi4gIFRoaXMgbGlzdCBpcyBzcGVjaWZpY2FsbHkN
Cj4gZm9yIFlvY3RvLXJlbGF0ZWQgcHJvamVjdHMgd2hpY2ggZG9u4oCZdCBoYXZlIHRoZWlyIG93
biBtYWlsaW5nIGxpc3Qgb3INCj4gb3RoZXIgcGF0Y2ggc3VibWlzc2lvbiBwcm9jZXNzLiAgIFdl
IGFzayB0aGF0IGFsbCBsYXllcnMgY3VycmVudGx5IHVzaW5nDQo+IHlvY3RvQCBmb3IgcGF0Y2hl
cyBtb3ZlIHRvIHlvY3RvLXBhdGNoZXNALCBzbyB0aGF0IHlvY3RvQCBjYW4gYmUgdXNlZA0KPiBw
dXJlbHkgZm9yIGRpc2N1c3Npb24gYW5kIG90aGVyIG5vbi1wYXRjaCByZWxhdGVkIHN1YmplY3Rz
Lg0KPiANCj4gTWFueSB0aGFua3MsDQo+IFJvc3MNCj4gWW9jdG8gVFNDIG1lbWJlcg0KDQpUbyB3
aG9ldmVyIGlzIHJlc3BvbnNpYmxlIGZvciB1cGRhdGluZyANCmh0dHBzOi8vd3d3LnlvY3RvcHJv
amVjdC5vcmcvY29tbXVuaXR5L21haWxpbmctbGlzdHMvOiB0aGUgbGlua3MgZm9yIHRoZSANCnR3
byBuZXcgbGlzdHMgYm90aCByZWZlciB0byB5b2N0by1hbm5vdW5jZSByYXRoZXIgdGhhbiB5b2N0
by1zdGF0dXMgYW5kIA0KeW9jdG8tcGF0Y2hlcy4NCg0KLy9QZXRlcg0KDQo=

