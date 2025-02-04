Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4230C02196
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:15:57 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.71])
 by mx.groups.io with SMTP id smtpd.web11.115497.1738674950990900216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bJHCxzql;
 spf=pass (domain: axis.com, ip: 40.107.247.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwwWByydB/orAU/oL8d/d6Y+82YYa71uNyGGHa2mlamyc6Ba3lkTL4Bpz5XvfEBC5DtS9Imy39uGMtxEJWZDqmhIFXSmH3DkslOIgBCdbWps4dik+4Ce1rhRiuCSxpz0Vha4EQ4y//vseW8Qr5iVxnjf7Ab6DI+Oy4MMI5lbZSD7FHRk6LK30yRr87yEJ1RIIK3DK4KCxHQwXr8UvaOWtWNA/2clwYQlPLWG9DEAOul/owD10jstztLSZGk3LdTLdhBo1r8Q5k8kFS+8sqdKHa9rur7iN24Xkc98SPu4pgBGSE4vsdUCVv6y2P33ZBqlFmZcd5beLHKP20XmeUTQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Yw+7f/j76AbX4XXpCE2l74T0sy62Jm81EFVmSa/Lf8=;
 b=s9ueAhPVamdsPr55QLu/DCNAA1YjJoQFefvv+5d3PEW/7n0K6eIqYBnh0OsQ77n4yz2fd1AHNSY9Op0lQpKYOYpqTIZ0BibylukFkDHXgNZsLFaJII/T1u6TkfzTZmN9ToM1OnmxpEQElPguHLkwBr0AG1aZoxzcsIhxDJrggbLHkwHjCrBZCBGKgzrH6jOOXM74sLvN0wJj03eh4350yB9+gUploSqu4rMEd29EzSfC8rJX9bs0W83nKBiMDJDFNTZadlEBtlHWCL2aI2XWDMKg9ODMcf8FYppTL+Eg7iR5siqePaRp1v92TRPZr1rRLDsiWlahIM0l1q42dWn7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Yw+7f/j76AbX4XXpCE2l74T0sy62Jm81EFVmSa/Lf8=;
 b=bJHCxzqllj4TQhI86jNzlJS7Pg6I2p5IBzj6qxbRZIgEVUftDn7bCqDhhXt3OBQeGt26D1aJcQSd+Gpk41BzZRKQnLIF+LlQ449eINxvSh/DRFyqcue5NrcCb5SkT436Qznx4BYWlgdz8IiWmdk/PAtl1TuASeOP7a6l4T/Ynmw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB5PR02MB10164.eurprd02.prod.outlook.com (2603:10a6:10:4aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Tue, 4 Feb
 2025 13:15:46 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:15:46 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libsecret: upgrade 0.21.4 -> 0.21.6
Thread-Topic: [OE-core] [PATCH] libsecret: upgrade 0.21.4 -> 0.21.6
Thread-Index: AQHbdndlC0SgNJ2PTUakg5CTfDe9KLM3IFvQ
Date: Tue, 4 Feb 2025 13:15:46 +0000
Message-ID: 
 <DB5PR02MB10213411E73A9E48D97EA2457EFF42@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250203200059.161883-1-simone.p.weiss@posteo.com>
In-Reply-To: <20250203200059.161883-1-simone.p.weiss@posteo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB5PR02MB10164:EE_
x-ms-office365-filtering-correlation-id: fba09f9a-e971-49fb-d33d-08dd451e0983
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bjdHREt2SEJWK2tWZUEwajRBcE5YbUNTWGZEN3FGV0JudGw2NXkrN21oMU9H?=
 =?utf-8?B?QTB0M0kwN01xQnR5ZXJlbFV3YWNRNVB3Y0VYMmNWbmNqbmREOEpOUkZFYk8y?=
 =?utf-8?B?dUZrbXc2cGtCQlNoMVcwUmpHUlkvVlZ0cEQ1L3EzTW5QU2JGZXJiUjdNZkxF?=
 =?utf-8?B?UXluWmY1ci9wWUJ4cU4yUEdtL0JUNXpkM201U2xKZlJDQ21tYk45N2FCUnFS?=
 =?utf-8?B?YmYvOVdFVEI5VEp0cmoyRmtXSThCNGtjd3c1cG5OUzZ3Y1FsUXpjOXowTnA2?=
 =?utf-8?B?MHgwN2pWOTFjaVdubGRqa2FtanJXb00rNUZzazBoT0o1Yys3K1JuYU00blZw?=
 =?utf-8?B?U1poZklkTFhuR2ZYbTVLZVJrdTVWWHhzaEQ0ZjZGd0xtVG5YMTU4c21lTjlZ?=
 =?utf-8?B?TmZRKzN0MndFUmV5dXJrU1pRZVcrdk5rVUY0MkRlQkdGN29VUmtZdWtjMkkr?=
 =?utf-8?B?ckVJZGVtMklNNW1qd3hjTHdZNm9VOTdEckNkOFoxWW9KR0JiSFp4SytCNjZs?=
 =?utf-8?B?L3lmRi9CckJ6cXgzbXJQMWJvRk9IcndZelBTclQwanp3MEdBY2xoeG1US2dk?=
 =?utf-8?B?V0p3bHNwVUthR0YvR2MzMUNrTC92eTdpM0NzS1lhZm8wekVDclhjeUZaL2RJ?=
 =?utf-8?B?d0VSLzgxZVpxUW5DSEpoanBCbm9jc2s0Z2xuL2NOR0Vzai8wRmNYNjhJckVG?=
 =?utf-8?B?VWlQZnk5VHo4VUhOTFRmMVdBS3Q5NnZzRlljRVFteEEwRTZuVkxDN3FvWEtU?=
 =?utf-8?B?enlvZUNmaDNwNUMwWDRzbGdlanFhNlFvOUlYR0NmZTl6NkxvdktlcENRaHBv?=
 =?utf-8?B?bUdMVlgxOFhRNHdzbkRiTm5mRzFtUUZYZUt1RDE0eFg3c3ZKdE9vWkwwNFZm?=
 =?utf-8?B?NTk5cTZnUGRxR3lWNjJadnZJeGcrYzloaEtTelprU0I3QjJUYmgySUFIaGxk?=
 =?utf-8?B?TVBneGtNT1lOYkdpaGhJaWEvWUJodFZKVGllQ1pJV2djTUEwQnBBbGFCQnV0?=
 =?utf-8?B?cndnTHZiWTMrSEhQWnFiV2JYOWczTDBVVUpZT2tKU05WUWEzYURxREs2a2o4?=
 =?utf-8?B?YXlqZ1FIR1Q4VFlmVSthdktjb25CcVhjcmlyTWdMd0ovUjRMRTVxS2lOeWZC?=
 =?utf-8?B?Y1pCbXVLb2dCb0hoQk5rOUNZbFNIT0Y5YjhuOTZvZTFHZ0NpQTNYQWJuSWls?=
 =?utf-8?B?Zk95N1duSEhMK3JSUC9rOUFxUkdycHJPZERhNU1jSUJMREI4eTV2NlNzemlw?=
 =?utf-8?B?NHJZeCtzUkRGOHVWRlpyOFFTRDBhTjNaaXRjYy9ieXpBR0RVWC9QcTFTMnFK?=
 =?utf-8?B?b0FYcWYya2hnMWdySHQ2ZTVVVDA3NERTWXVldGpEYUJhaHc5Vk9UaytHU2Jz?=
 =?utf-8?B?VGQvVDZiQ0wzZ2x6UUpJdjZNUFpLdnZsUUVVRFpmS1ZIUnJNWXVoN1U4M2RJ?=
 =?utf-8?B?Z3Bkbkg4WkppbC9FSyt1M0g3T29xcXQyRnVNTmpxRXFpOFM2eW10b2g0TW1Q?=
 =?utf-8?B?VHl6b0FUWDcxVE5jdnpBN3g0b2l2MUdCYktuSVZKN0lXdWVaV0kzYTJ5Wm02?=
 =?utf-8?B?TDlwZU1CaGlJUmpHb3FZZlF6YnhiQThTYTk5YlBuOTVvVTFZaXY5QU16L2s4?=
 =?utf-8?B?dThPUjJIOUpMcWFPNktSeXRKVEtvQUtNUWVvUElaVkxwUnpXR0tWQ1J2OUcx?=
 =?utf-8?B?SWxrZDR6bXR0MCtCOVVkWDJzUExTREVhc2NoMWNPOVR1TDdHZmRaOVp2WVJU?=
 =?utf-8?B?bFZoN3NJWmxjTW0yNkp0WlVuTUlyM21URkdkSVFyNm5ya1RCU0ZYbDd1SFY3?=
 =?utf-8?B?akgrQS9KclB6VkVpRURudGVFSW9Lc2tObzQzMVB5MXhQZ3BBKzlVVXMrVCti?=
 =?utf-8?Q?gIqZc/D9ba/xt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VlpmWUZJL1FsK2JtMGJvSmxWL2FXaWdIdjVtZWxrQXNTalBjc1h3TEdVcTU1?=
 =?utf-8?B?dE1odHJrTXBJRk9rVFVIY0RKNFkvRUM4NitmbDlSK3hWang5TlExU2VReW9R?=
 =?utf-8?B?THVPa0NlNE5ha2JZa3FtWGV6RGQwMHR5RTZRTTg3dFMxbHd5dElCbm52YjdC?=
 =?utf-8?B?Um5qYVNaYUlDRWVmVDhUZTdzV0VCeEFaN29tR2RLcVJXOFJOOHNhM0RmTWZi?=
 =?utf-8?B?VTdVNmtZK2NQOGthdThMMG1EekhYUXcvcVQ3VEt1bzRMR2t1QlNJTzZRb0p2?=
 =?utf-8?B?SmlLV1N2OWlnL2hLTllIWUVvYUh6U1VhSHZhd0NVbFdDT0dMaWpGZzZ2ODd2?=
 =?utf-8?B?YndWMUllU0Y3bGgyN3VoUUZweDkxSEdxYXdsVFI4NTc0cDkrNHJmc2RBOXNV?=
 =?utf-8?B?YllpTCsyNUZUNlR3Z2JmaWpOVHFXemdrMmhkaGZ0ZUEwbk54WVAvY3ozTlkr?=
 =?utf-8?B?RHdzbHNycUFRRi9FSXMvcXgrdi9WNi9jL3hienp6S0hWWGlldlJsdUo4cEd5?=
 =?utf-8?B?Ny9Dc1hEeGY1VnVhZTdtV1FWRzJHMDRvb2l5SWMxL0ZhVkNZRlB3U2pHZHNM?=
 =?utf-8?B?Yk5SUmF5YlFQR2ovdGJ6akJEdHEvOVdYUzlpdUJPTWpCOWZmeUUvbWVuT1Bm?=
 =?utf-8?B?dFhMY3hOQVNzdUtzblFoYUpTODhNWmQvVnZZZVZ3NFdIbFc0SE5LK2wvbEd6?=
 =?utf-8?B?bEJTU0pSVExNSHBLa3djMVBpZjkvZkhCc1hGY0F1YjZ3dUdmZ3hSQ0ZHbGw5?=
 =?utf-8?B?dFdNbWZMekQrSDNMOEFyWVdGSWxFMFZ4Z1cxNmRVeDl4RVMwZHk3OFM3M0Z2?=
 =?utf-8?B?YUM0elJBNWlWUU5CZjJ6MjhVV21FTnhmejVVTmtmVHpBRmRUaVZuYU13YlNU?=
 =?utf-8?B?OWlyYTVZWHFQVHNtRko4QWxueUQ2TldNVmxTd0haTnVjTFJtZ1ZzaC9NUG16?=
 =?utf-8?B?cllvS2JJcml0OVpkZ1ZRcVRWWG9qQ3pXb1drQ0kxOVdLT2lQQnJadWNSMVpt?=
 =?utf-8?B?WG5hQTlXQU9FYjQ2RnJXUzNrcFczY0R3UnFiNUx0S3JDN1Jiam1lRkoxbTlh?=
 =?utf-8?B?ZGEvejlDWmdrMkFKOFEwZFNsWTB5UEI0dy8yWWNiTGlGcFN5dnRCNHpCSGZz?=
 =?utf-8?B?anRMVitLZ2Z2TjlTOWwwTU1INjJZSHpkN2QwRy9wQ2NBQiswNkJDbnZ5Vlcw?=
 =?utf-8?B?aFRYbVg3a0hlK0FUcXpaUjZpRHV0c1N0blpRSDJtWm5ZK0M0T0RPZTdLaUsw?=
 =?utf-8?B?MlZzbGdPOExhSUFjOC9VMHl4MjFTWkE4TEV1dGJzRjJaMlZvMjNrMWRBMGdW?=
 =?utf-8?B?Tmc4N0pGNEV2bEdSWmR4aFU3MVRxQ2ZJaW9rRmpTbnoxRGxnQ2ZHUHVvYkVJ?=
 =?utf-8?B?RnRGM1oyQTMxVWlIQnhnRTVvUmdQRGVBRjMydzJoaVJKZXN5cUJxbWxYUUkv?=
 =?utf-8?B?QWp3VUVzdlcvREgwRmF1ZTRTdDdMVEhNTEdrcHVESkdzaGRGZVVhMzNRSHNx?=
 =?utf-8?B?UDRFNzNhY05memxMQmd6ZHFzWGpLU2tYRDIwYzRSazlyQWZ2b2YzUXgrdzR3?=
 =?utf-8?B?ZFh3VXBXbnZOQi9renRPNTk5anFCcm9UeHFTVTdQR3VCL3kvc21oeUEzT0NT?=
 =?utf-8?B?SkMrVURjK2gxcm9YY0IvSWtVQ2FBT2pwNG96L2hjQzFRcVJvUmJtdUcrdFpy?=
 =?utf-8?B?bE5Nc09BbXd3VkVtUVNwckZLWmVzVk94MUNhc05oMEwvcThFTkkvMUVSaHNH?=
 =?utf-8?B?R296RzNlMjc2Rk5QQ3ZPc2dFY1FzaDZpTUdpNTBiZkZRU3EzaWx2eGliSklw?=
 =?utf-8?B?RWF2dEpJcnR5Y2IrMDNvTUhocC9yd2VTeVB1RFV5MjA4a0FQWEthYThBL1hj?=
 =?utf-8?B?U2pITnk5c3RBQkFnUEx6NzRFTi9henNlSm9CV0lSUW9xYWFwQXAzRGQ2U1NU?=
 =?utf-8?B?Nmdnd21ac3BBbTNORmtkU25ucDE4YSs0RUIyREpINjZqMDMxcmdNQUdMbjJo?=
 =?utf-8?B?RUgvYWhzVlhieURyM1VCbUZpUjlHcHZPY3pMTVJmUUpvY3BHaHVoVG9acSsz?=
 =?utf-8?B?UDNOcDhseUJJNi9RYnU1TzJTTTB0Rm9QNmJnRU5jYzZyUHRQZ0JQMStxSWZN?=
 =?utf-8?Q?ykJ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba09f9a-e971-49fb-d33d-08dd451e0983
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:15:46.7332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X2kltv191E8BZDzgcUgKdu0rMwPx29/Yuuk7ecZBZ1qG6tB75UXGDTvvhZTy8bHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210789

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgU2ltb25lIFdlacOfIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFNlbnQ6IGRlbiAzIGZlYnJ1YXJpIDIwMjUgMjE6MDENCj4gVG86IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFNpbW9uZSBXZWnDnyA8c2ltb25l
LnAud2Vpc3NAcG9zdGVvLmNvbT4NCj4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRDSF0gbGlic2Vj
cmV0OiB1cGdyYWRlIDAuMjEuNCAtPiAwLjIxLjYNCj4gDQo+IEZyb206IFNpbW9uZSBXZWnDnyA8
c2ltb25lLnAud2Vpc3NAcG9zdGVvLmNvbT4NCj4gDQo+IFVwZ3JhZGUgcGVyIEFVSCBmYWlsZWQg
YXMgd2l0aCAwLjIxLjYgbGlic2VjcmV0IG5vdyBhbHNvIGNvbWVzIHdpdGgNCj4gYmFzaC1jb21w
bGV0aW9ucy4gUHV0IHRob3NlIHRvIGFuIGFkZGl0aW9uYWwgcGFja2FnZSwgYXMgc3lzdGVtcyBt
aWdodA0KPiBjb21lIHdpdGhvdXQgYmFzaCwgc28gbm90IGV2ZXJ5b25lIG1pZ2h0IHdhbnQgdGhl
bS4NCj4gDQo+IENoYW5nZWxvZw0KPiAtLS0tLS0tLS0NCj4gMC4yMS42DQo+ICAqIG1lc29uOiBN
YWtlIGRidXMtcnVuLXNlc3Npb24gb3B0aW9uYWwgWyExNTddDQo+ICAqIG1lc29uOiBBY3R1YWxs
eSBpbmNsdWRlIGJhc2gtY29tcGxldGlvbiBzdWJkaXIgWyExNThdDQo+IA0KPiAwLjIxLjUNCj4g
ICogc2Vzc2lvbjogVG9sZXJhdGUgbm9uLWFwcHJvdmVkIERIIHBhcmFtZXRlciB1c2FnZSBpbiBG
SVBTIG1vZGUgWyExNDVdDQo+ICAqIEFkZCBzb21lIG1pc3NpbmcgR0lSIGFubm90YXRpb25zIFsh
MTQwXQ0KPiAgKiBtZXNvbjogQ3JlYXRlIGRlZmF1bHQgdGVzdCBzZXR1cCB3aXRoIEQtQnVzIFsh
MTE1XQ0KPiAgKiBtZXNvbjogVXNlIGVudi5wcmVwZW5kKCkgZm9yIHRlc3QgZW52aXJvbm1lbnQg
c2V0dXAgWyExNDFdDQo+ICAqIG1lc29uOiBGaXggbGljZW5zZSBmaWVsZCBbITEzOV0NCj4gICog
YnVpbGQ6IFJlbW92ZSBzZWxmLWluY2x1c2lvbiBmcm9tIHNlY3JldC1pdGVtLmggWyExNDldDQo+
ICAqIGJ1aWxkOiBGaXggY29tcGlsZXIgd2FybmluZ3MgaW4gVmFsYSB0ZXN0cyBbITE1M10NCj4g
ICogdGVzdHM6IEZpeCAiXHwiIHVzZWQgaW4gdGVzdC1zZWNyZXQtdG9vbC5zaCBub3QgcG9ydGFi
bGUgWyExNTBdDQo+ICAqIEZpeCB0eXBvIGluIEQtQnVzIFhNTCBbITE1Ml0NCj4gICogZG9jczog
Rml4IG1pbm9yIGdpLWRvY2dlbiByZWZlcmVuY2UgWyExNDJdDQo+ICAqIGRvY3M6IEZpeCBQeXRo
b24gZXhhbXBsZSBbITE0NF0NCj4gICogZG9jczogTWVudGlvbiBmaWxlIGJhY2tlbmQgWyExNDZd
DQo+ICAqIGRvY3M6IEZpeCBsaW5rIGluIFJFQURNRSBbITE0N10NCj4gICogU2V2ZXJhbCBDSS1y
ZWxhdGVkIHVwZGF0ZXMNCj4gICogVXBkYXRlZCB0cmFuc2xhdGlvbnMNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFNpbW9uZSBXZWnDnyA8c2ltb25lLnAud2Vpc3NAcG9zdGVvLmNvbT4NCj4gLS0tDQo+
ICAuLi4vMDAwMS1tZXNvbi1hZGQtb3B0aW9uLXRvLWRpc2FibGUtcGFtLXRlc3RzLnBhdGNoICAg
ICAgIHwgNyArKy0tLS0tDQo+ICAuLi4vbGlic2VjcmV0L3tsaWJzZWNyZXRfMC4yMS40LmJiID0+
IGxpYnNlY3JldF8wLjIxLjYuYmJ9IHwgNSArKysrLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ICByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21l
L2xpYnNlY3JldC97bGlic2VjcmV0XzAuMjEuNC5iYiA9PiBsaWJzZWNyZXRfMC4yMS42LmJifSAo
ODQlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGli
c2VjcmV0LzAwMDEtbWVzb24tYWRkLW9wdGlvbi10by1kaXNhYmxlLXBhbS10ZXN0cy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1nbm9tZS9saWJzZWNyZXQvbGlic2VjcmV0LzAwMDEtbWVzb24tYWRkLW9w
dGlvbi10by1kaXNhYmxlLXBhbS10ZXN0cy5wYXRjaA0KPiBpbmRleCAxYmQ0OWJiYzM4Li5kYTVl
ZDFmZDMyIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNl
Y3JldC8wMDAxLW1lc29uLWFkZC1vcHRpb24tdG8tZGlzYWJsZS1wYW0tdGVzdHMucGF0Y2gNCj4g
KysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNyZXQvMDAwMS1tZXNvbi1h
ZGQtb3B0aW9uLXRvLWRpc2FibGUtcGFtLXRlc3RzLnBhdGNoDQo+IEBAIC0xLDQgKzEsNCBAQA0K
PiAtRnJvbSBiOTBlY2JkYjRiOTE5NjFhNzdhN2NiYjNhOWI2YTU3MTI4ZTIxOTRiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQ0KPiArRnJvbSBhOWZkN2RjZGRmOGJjNjQ2NDZmMjk0NWFiNTY0MzU3
YzIzMTExNTQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiAgRnJvbTogTWFya3VzIFZvbGsg
PGZfbF9rQHQtb25saW5lLmRlPg0KPiAgRGF0ZTogVHVlLCAzIERlYyAyMDI0IDE1OjU4OjE3ICsw
MTAwDQo+ICBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uOiBhZGQgb3B0aW9uIHRvIGRpc2FibGUgcGFt
IHRlc3RzDQo+IEBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxm
X2xfa0B0LW9ubGluZS5kZT4NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyks
IDIxIGRlbGV0aW9ucygtKQ0KPiANCj4gIGRpZmYgLS1naXQgYS9tZXNvbl9vcHRpb25zLnR4dCBi
L21lc29uX29wdGlvbnMudHh0DQo+IC1pbmRleCA5MzZlZmY4Li44ZmEyYTRlIDEwMDY0NA0KPiAr
aW5kZXggOTM2ZWZmOC4uMmFlMTRmMiAxMDA2NDQNCj4gIC0tLSBhL21lc29uX29wdGlvbnMudHh0
DQo+ICArKysgYi9tZXNvbl9vcHRpb25zLnR4dA0KPiAgQEAgLTgsMyArOCw0IEBAIG9wdGlvbign
YmFzaGNvbXBkaXInLCB0eXBlOiAnc3RyaW5nJywgdmFsdWU6ICcnLCBkZXNjcmlwdGlvbjogJ092
ZXJyaWRlIGRlZmF1bHQNCj4gQEAgLTc1LDYgKzc1LDMgQEAgaW5kZXggODQxM2I1OC4uNTE1NTMy
OSAxMDA2NDQNCj4gICsgICAgfSwNCj4gICsgICkNCj4gICtlbmRpZg0KPiAtLS0NCj4gLTIuNDcu
MA0KPiAtDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNl
Y3JldF8wLjIxLjQuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNlY3JldF8w
LjIxLjYuYmINCj4gc2ltaWxhcml0eSBpbmRleCA4NCUNCj4gcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWdub21lL2xpYnNlY3JldC9saWJzZWNyZXRfMC4yMS40LmJiDQo+IHJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ25vbWUvbGlic2VjcmV0L2xpYnNlY3JldF8wLjIxLjYuYmINCj4gaW5kZXggZDM1
NjY4MTI1Mi4uZTk5MjAxMjI4YSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xp
YnNlY3JldC9saWJzZWNyZXRfMC4yMS40LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9s
aWJzZWNyZXQvbGlic2VjcmV0XzAuMjEuNi5iYg0KPiBAQCAtMTQsNyArMTQsNyBAQCBpbmhlcml0
IGdub21lYmFzZSBnaS1kb2NnZW4gdmFsYSBnb2JqZWN0LWludHJvc3BlY3Rpb24gbWFucGFnZXMN
Cj4gIERFUEVORFMgKz0gImdsaWItMi4wIGxpYmdjcnlwdCBnZXR0ZXh0LW5hdGl2ZSINCj4gDQo+
ICBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1tZXNvbi1hZGQtb3B0aW9uLXRvLWRpc2FibGUtcGFt
LXRlc3RzLnBhdGNoIg0KPiAtU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMTYzZDA4ZDc4
M2JlNmQ0YWI5YTk3OWNlYjVhNGZlY2JjMWQ5NjYwZDNjMzQxNjhjNTgxMzAxY2Q1MzkxMmIyMCIN
Cj4gK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjc0N2I4YzE3NWJlMTA4Yzg4MGQzYWRm
YjljMzUzN2VhNjZlNTIwZTRhZDJkY2NmNWRjZTU4MDAzYWVlY2EwOTAiDQo+IA0KPiAgRVhUUkFf
T0VNRVNPTiArPSAiLURwYW0tdGVzdHM9ZmFsc2UiDQo+IA0KPiBAQCAtMjQsNiArMjQsOSBAQCBQ
QUNLQUdFQ09ORklHID89ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdw
YW0nLCBkKX0iDQo+ICBQQUNLQUdFQ09ORklHW21hbnBhZ2VzXSA9ICItRG1hbnBhZ2U9dHJ1ZSwt
RG1hbnBhZ2U9ZmFsc2UsbGlieHNsdC1uYXRpdmUgeG1sdG8tbmF0aXZlIg0KPiAgUEFDS0FHRUNP
TkZJR1twYW1dID0gIi1EcGFtPXRydWUsLURwYW09ZmFsc2UsbGlicGFtIg0KPiANCj4gK1BBQ0tB
R0VTICs9ICIgJHtQTn0tYmFzaC1jb21wbGV0aW9uIg0KPiArRklMRVM6JHtQTn0tYmFzaC1jb21w
bGV0aW9uICs9ICIgJHtkYXRhZGlyfS9iYXNoLWNvbXBsZXRpb24vY29tcGxldGlvbnMvc2VjcmV0
LXRvb2wiDQo+ICsNCg0KUGxlYXNlIGluaGVyaXQgYmFzaC1jb21wbGV0aW9uIGluc3RlYWQuDQoN
Cj4gICMgaHR0cDovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzIwMjI4
Lw0KPiAgQVJNX0lOU1RSVUNUSU9OX1NFVDphcm12NCA9ICJhcm0iDQo+ICBBUk1fSU5TVFJVQ1RJ
T05fU0VUOmFybXY1ID0gImFybSINCj4gLS0NCj4gMi4zOS41DQoNCi8vUGV0ZXINCg0K

