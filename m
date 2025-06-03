Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74D6C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 10:07:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.19])
 by mx.groups.io with SMTP id smtpd.web10.7650.1748945246198227454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 03:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=p7AoPS0p;
 spf=pass (domain: axis.com, ip: 40.107.162.19, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhHQJ45NW4NOBWT+v6cNveR+1Syy4Zn0opHN9MY0vwaD4JExb1y17VeJD9deCs4nXx1OePjdkUsKdjSH9GKRAnBjsP4/JW0pCzhC3J7zLZeB46jtj6CH41mCjvLaAK9mzplEWh3qoDx6A5pTpSPWOENFCV2ZSyxOgzyk8W+I0xWrZS2pFJH4fjZDY9sAEDI78VQLWp8CpQcrEAdFopVdgdroukjbCm6ylirNBHcUMwtsWiNzkWIpopyDKSiqIiCSJhEQLV8DFDk2d0Av/L2LBjHOXNmtXs7NAJh6MgioH3E0122/qYBjFDSddCIfMB7JKvJ9Xms39FpekMMN2cLY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvzzD6+757jm3OQIjAdL3HhSIb16G85ZtHqShtMdHf8=;
 b=pXo8bsv+SQUeG4ppDByHxJIwdv8C21m8x7GoBEsvspLoVQXDWDswnWn2UbdtO7gTr43FQQqI+I9EZ1LNf7UW7y5DGQ1U6HUYUAhramqfBezoISA0mqXpGNyddOp7jyeq9+8YPeh9aRxwZPc6mGG+fwMTaR3PkrULEa5z7530IfzM2swUM3ZwFHm2v2Qq8cxc703aOLVssb1OiaIrkVCnnLSnL6jGztvStYL5EAtuWhOgksNaJRoF2/Tr24/ajtCik0Wknaf/V7DmzrKSfhvsIZNNL8eVSbuHt5eS2e/ojQVgCORTRbT4dcblqOrKBQ4JfdoZh6uaZoY6/iI8mYa8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvzzD6+757jm3OQIjAdL3HhSIb16G85ZtHqShtMdHf8=;
 b=p7AoPS0phaW96lhpzjfmwwnhz70YMTJwnOVs61+55DcKXCbu0FEFyblFAZhVMf6yA7ite9iUa67jvy8tVxukBFAjhMA+fWQfEh7Nyx2c0HTm+RACH/ScOtv1ncHOkSMj8NGKgFpJnsMxiyeY29q9FN5ZB7TlKtIV/U+YFW4YnyM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS4PR02MB8432.eurprd02.prod.outlook.com (2603:10a6:20b:577::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.23; Tue, 3 Jun
 2025 10:07:23 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8792.027; Tue, 3 Jun 2025
 10:07:22 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] util-linux: Improve the package licenses
Thread-Topic: [OE-core] [PATCH] util-linux: Improve the package licenses
Thread-Index: AQHb1Gm8JzqAGr07wkKnYQgsUfK8KrPxMk+g
Date: Tue, 3 Jun 2025 10:07:21 +0000
Message-ID: 
 <DB5PR02MB10213CA080A393F42FE4D4229EF6DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250603031425.2206714-1-pkj@axis.com>
 <166b439a-86cd-4bef-816f-c016732236da@cherry.de>
In-Reply-To: <166b439a-86cd-4bef-816f-c016732236da@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS4PR02MB8432:EE_
x-ms-office365-filtering-correlation-id: ed49402f-21a3-4989-5d0c-08dda2866e81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S3BVSE11cEUwSnV6blJkYWNtbHF5Ym80U1U2aHFWdmZwTmtCUVFnOFRmVzR3?=
 =?utf-8?B?SFNWKzA4MTgrYU9pQ3FxMXp4UURaRFRsVlVzdWUrSDkwRVJVMkp2ZHFFeHRV?=
 =?utf-8?B?RDQzdGgxV0hmVHNhZFYxYzYyQlM0RlNzVGMzaEpYeHY2WHBJaVZLN2JEb3ZM?=
 =?utf-8?B?RmxuWGZuaUdHWU51TEUrU2Y4eEMvRW1GRWNpNzJtKzYyNzErLzVOblZuYVdR?=
 =?utf-8?B?RCs1UE9pMnRhUFlkM3p5OU9wbzJHbmJXRWhtNThaRGdXQlpGOUZPM2F1dXE3?=
 =?utf-8?B?ZHhiblk0SlRMMlVRdmtWbm1iNmo5VHFrZFZWRWNKYk1VUytDZmtTOTNZdTJm?=
 =?utf-8?B?emkzVGxRdnZ1Z3Zocm1NZjVUNlNjRDRFeThwekR6dCs0ZklSOTJWTEhrTjB3?=
 =?utf-8?B?d1lJN0duaCt0dG9XRVpKOTZsT3cyZzI4WTdBZEU1cE5NQ1E0MWt4ak5POEtx?=
 =?utf-8?B?Zyt1My9tUkZ6ai9SMVJmNXN4Q2p4UWp5VEFDUmgyaGFvYkxoQnVMangzM043?=
 =?utf-8?B?dWJZUUluRkVvcmhia3NDV01NMERxc0l5VExaMkpDYkQ2dW45VHhTb1hueFFE?=
 =?utf-8?B?bms3dHJlYXJiekNxTWVhbVpkdjNJamhkcXU1anJGdUtWalFyL1hoTGRSS3c0?=
 =?utf-8?B?T0t3Um00RFpZYnNjWGQwRVplSGxZM1pKd05JdVlRdElyZEk1RFlTS09tdzlx?=
 =?utf-8?B?QVhweXJjVUFrYWdDNFd6TXhPUnprTUhrZWhabUNWUW1xRmR0N1BmMHpJWVNx?=
 =?utf-8?B?eTE0YWJmR3dhMlVNY2pzckQ4TVliV0lhV0VNV2NHY08rRjNtaXo4cGRtcisr?=
 =?utf-8?B?eVp5NitvY0tBakZFNy90Zjc1MFpEUnNuLy9MYXpHMi9KVThNbG0wcEMzbDJy?=
 =?utf-8?B?N2RId0pVTXR4RTQ0aGZzWGdWcDdVWS9wMUN5TUFEWVQ2a0JXS0VEd1lTa1pq?=
 =?utf-8?B?MEFYU1RobjZRdFRyejhKcDJrNHNqdWo1Ui8zNGFSMjJ5eGFwbmtYendFc20y?=
 =?utf-8?B?OUM1UUFHQVdaTHdORXZNWWpTeE9uOFNiRW0rSUR2elk1aHl3SmptSVNuRE1M?=
 =?utf-8?B?NzViV3hkRDdVL1Bmc2k4UW9YMWEyNDd3aUpVUnFJUUVxL296bisrRUJVQXJh?=
 =?utf-8?B?aUtYUTI4ZDhHRVp2dUJMZm12OVZJemV1R2crdHkxbFdkV0JVQlVtaGFtdWNU?=
 =?utf-8?B?aWRLdTJGMCtRM0RmMTRTdkxRd0FxRzhhUmZQK0tXMzhwTmpEQWtVTjRORk84?=
 =?utf-8?B?cWtRQUsyc3N4R2tCdis0NlI2OWh3RkhoUENhQlY2aGhSQVRIV0JuZ3gvVmJY?=
 =?utf-8?B?WVdiaDBveWIxUFhDYk9pMW5lZmJXQWxCTUszZVZkS1d1OURFOVcya01ZVjh6?=
 =?utf-8?B?Z1ZKaG1VZHFXQmVxWDQwTkdpbVFZTktPUHVaWjI0THZjR2ZsV0N6R2J5Mmg5?=
 =?utf-8?B?VDgzbEFuOXBqS09Cd04wd2gwMjNyYTJxK0JwcEZIVDFJV1Y1RHR0MjQ2QU1r?=
 =?utf-8?B?SDM3MTVQTGpCRkM0UzFjMzArUEg5bDFTa1JHVXArcVg3YVpyd2dxclhNa1hN?=
 =?utf-8?B?UDVPY3gvK2JYc1FHSVNtcXg2ZWErbGZsakhTSmVTay9KZkM5Sk5XYkkvM3hq?=
 =?utf-8?B?L0JJSWVlSWl0dTdKNVBzRi9HVk9pQ0dHazVDbzhTSnFvMm1CTGhEQ1hWODJY?=
 =?utf-8?B?WFg1dkJjbWpScFZQRExjd2hTSWlIQ3pSTWdTMVFBWFA5ZkpJNGt5Y1htY2Jl?=
 =?utf-8?B?NFpFcHpENXh3SzdPWlFKVGdhdktEd0dHcTZxNm1OK2NmQTdsb08rbU1BWnpF?=
 =?utf-8?B?YzFmVXVlbzhrMW14NzdXNUUxeWp5M3l3R1lMeEQ0NjRTQmJQUlM5bDlhTW53?=
 =?utf-8?B?RnBrMWJOcVBJbnRQRmhnWDNMbW0xbG5iazBlQ2VWc3JDcUFQSXI2d0k1UVpQ?=
 =?utf-8?B?RDJNRjc3eUpKVDVkcXJVNk91RTFVeXRKeTdGaTN1TEhpNm9pVHVDMVpGWXlz?=
 =?utf-8?B?WTB4OWRhRGlBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWx6SDA3Zi9pbnVaTk4rY0RRTmY5dVIzdlViaTRPNi9zK1h1clo5Nm54S0Zv?=
 =?utf-8?B?TmxFUU1XUHBkVFlCMzZtM2Q3Z3p2K1dRamxOZHhaSXFiOEphL0hDWnhDdjZn?=
 =?utf-8?B?T0NaU0krVlBmblRCNmd2a0kzUTVSeUNpc2dvb2dob1pzNi9SV2ZYakV6VStu?=
 =?utf-8?B?amt1UjJjVlV2WUpqMnh5Z2dYU2tJSHYzMGNKaTdxSzNvQnJsVmpiaml1Rllx?=
 =?utf-8?B?MDRzVXQ4VlRtWXZFREpKeldKWis4Y1RVd1pNQWp0aFAreGcycnVZbTJTUWp6?=
 =?utf-8?B?aEd5WFZWUVhCamZ3MFNWTVNoK2gxVUhpRVhZaEZRWE56WlprYVFEQVFHdmc3?=
 =?utf-8?B?Tk5MVHBRZmsxeUs5ZGVmcVlwVWFGak96WE5FSDlFRzFuaFQwcnN6d0h6L1Za?=
 =?utf-8?B?K0l3Q2pidkluUit6RE5MSWl5UHpsOUtDR0ptUDlEaWVyamdrSm1NWWxuMGl4?=
 =?utf-8?B?YUxwV29lOEszY2Uvc1drYjJBY01JRFk0WjJod1dvTzF3WmRhZWFkWndaU3pN?=
 =?utf-8?B?UktlMXNXc09FQTg5bjhvRkZVS0FzdkZXNzcrN2t1NVp5Rzc1QjRsOFZqSkxh?=
 =?utf-8?B?MW1GYjNjOVJDUFl6bng0WU8zdzBCKzl1Y3VwYzJ5Qk5LTDJkNXlxTmhHWkZB?=
 =?utf-8?B?Ymo1Mm1BeG9obHdzYU1YdFF3dWEya21hWU9HTzExTWw5ZTA3YThOdFpGc0xr?=
 =?utf-8?B?Sm9ZaVk3T3lsMDI0QStLOFYvQ3dLT3E2Z3F4SmlxSUZuSVQwUy9VQk1nSGw5?=
 =?utf-8?B?dFl1K3NUaUJtaytEdXA2djUwdGFvenZXN2VGNUtMTjBjRng5ZEFHd0FvYyt3?=
 =?utf-8?B?Z1pOdWx2SkdhNEhOVjVuZnV3bE5hd3RTYnRFWFo4ZVp1ZmpHYm0zN1RCK3ht?=
 =?utf-8?B?TVVNQ09BLy8ySUJVREh4dExJSEZXN29qUWczT1RFYlVqV2prWUwybkNEOEVv?=
 =?utf-8?B?SzZKNVRGbFdseXJmZkRHYVdDUk9kOXBzYWhLWHBlM0prcXY4Q0V4aUtGVzRw?=
 =?utf-8?B?MU9zdWFHTklIdFAzUS9ieE5MNGRTdXJKcjFnaVcxRC9kT0VQVm9XbUlNMEg3?=
 =?utf-8?B?cWduV28zYjUvekw4bzVqcDZaNjRMVjdaalB0QjR6OXR4T1VhMWpYRXVvTTFV?=
 =?utf-8?B?WXNtcGxGRGZUeXZUeGRLNWVNeHpoNG1NZVBMSVFVSkx6aGlFeEZ6NU42MUd5?=
 =?utf-8?B?NEtXa1hIdkJVSS9rTUxqY1ZpVEVVSWpBR1Btd3F1Nk1XNldEZzU4eERzOTRQ?=
 =?utf-8?B?OGpjQjgzb05FZEFpdCtOU1d4Mld5OGR5ZGVuNm9SdEM3REJ2SnhDYmovOVQ1?=
 =?utf-8?B?V1dzcEd5N2JRYmR1WFd6WTArSW9uUTllTTVubW5tSmZKdXNwQWlyYjZzQ1pw?=
 =?utf-8?B?L05keEtqM1JrUTdRdTFpeDFzaU4xblU0b0FkUUYyUGFhYkI4S0MvbDl5QTVo?=
 =?utf-8?B?S1FXNXNwQjJNTkxjSDdyTVp5OUpkYUV4TWM1cHc2Q0VLWTlsUis0azVTN0dj?=
 =?utf-8?B?aEs5NU9OanFsV0pBVW9KeHduRlVpQ1hPTWZtam9iWmhNdlZKd0o0RCtjaW0v?=
 =?utf-8?B?WjRTZW5CL1NvYXNrMlFQeGFRY2NwTTM1K2JKdlFwSjgwdERoQ0tTbnlRQW4r?=
 =?utf-8?B?Z3gyNDhmak1uWEhOdWtGR210T3VMbDh3UndCNWpWRFcvbUpCTkM5MFBTODdL?=
 =?utf-8?B?ZXBBMlhxZS9HT0NWdHB2VmhIWVVNSEM2cXN5TE10OVgyditKaXMxam54bkls?=
 =?utf-8?B?QXlNWWdvVkphL040M0xLazVZbWJGZGtXVDRpN2FKZVVKRlJxRVcwWHdqKzU3?=
 =?utf-8?B?TmZaMG02VUh5L1BxWFc3MncwVUFEanFZak1UbU9kL0lOWEp4Ky9GMGNPcHZL?=
 =?utf-8?B?UDdkQzhSRWZFNGk0eFlMczE4cEMxbGkrZE9Ob2lxcmQwZjg3U0hGNU1qNVdo?=
 =?utf-8?B?VzhXdXBHTjRiZkgzY2Nxa1BTWUhaclhFRUNIQjRJcVhVZStIUWVqRUVxeEVQ?=
 =?utf-8?B?d3paWXRxMWF5RFI1MjhGbXcxNENBNHdiTW9GWHlwTUUvTzNsZnBBWnJsS0pS?=
 =?utf-8?B?TC9GL011M052aXhmQk9BYzVjNlFNY2p4L01NYmNXc05rb3M3MTNwRzExOFNC?=
 =?utf-8?Q?0Nes=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed49402f-21a3-4989-5d0c-08dda2866e81
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 10:07:21.9548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xr0nhz4yMPg740NuD8Ogi+GIfY30nPeVdeRXsTVTco1ux9DWbJYgEo8NcvfeEo3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 10:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217797

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRdWVudGluIFNjaHVseiA8cXVl
bnRpbi5zY2h1bHpAY2hlcnJ5LmRlPg0KPiBTZW50OiBkZW4gMyBqdW5pIDIwMjUgMTE6MjcNCj4g
VG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSF0gdXRpbC1saW51eDogSW1wcm92ZSB0aGUgcGFja2FnZSBsaWNlbnNlcw0K
PiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBPbiA2LzMvMjUgNToxNCBBTSwgUGV0ZXIgS2plbGxlcnN0
ZWR0IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IFRoZSBkZWZhdWx0IGxp
Y2Vuc2UgZm9yIHV0aWwtbGludXggaXMgR1BMLTIuMC1vci1sYXRlci4NCj4gPg0KPiA+IE1vc3Qg
b2YgdGhlIGFwcGxpY2F0aW9ucyBhbmQgdGhlIGxpYnJhcmllcyBhcmUgYWxzbyBsaW5rZWQgd2l0
aA0KPiA+IGxpYmNvbW1vbi5sYSwgd2hpY2ggdXNlcyB0aGVzZSBsaWNlbnNlczoNCj4gPiBMR1BM
LTIuMS1vci1sYXRlciAmIEJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSAmIE1JVA0KPiA+DQo+
ID4gU2V0IHRoZSBhYm92ZSBsaWNlbnNlcyBmb3IgYWxsIGR5bmFtaWMgcGFja2FnZXMsIHVubGVz
cyBleHBsaWNpdGx5DQo+ID4gc3BlY2lmaWVkLg0KPiA+DQo+ID4gSW4gcGFydGljdWxhciwgdGhp
cyBhdm9pZHMgc2V0dGluZyBCU0QtNC1DbGF1c2UtVUMgYW5kIEVVUEwtMS4yIG9uDQo+ID4gcGFj
a2FnZXMgd2hlcmUgdGhleSBkbyBub3QgYmVsb25nLg0KPiA+DQo+ID4gTGljZW5zZS1VcGRhdGU6
IFNlZSBhYm92ZQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIu
a2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgIHwgNDEgKysrKysrKysrKysrKysrKy0tLQ0KPiA+
ICAgLi4uL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQxLmJiICAgICAgICAgICAgIHwgIDMgKysN
Cj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYw0K
PiA+IGluZGV4IGIwZjJhOWQ0OTcuLmJkN2FkMTAwMzUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYw0KPiA+ICsrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMNCj4gPiBAQCAtNiwxNCArNiw0MyBA
QCBkaXNrIHBhcnRpdGlvbmluZywga2VybmVsIG1lc3NhZ2UgbWFuYWdlbWVudCwgZmlsZXN5c3Rl
bSBjcmVhdGlvbiwgYW5kIHN5c3RlbSBsbw0KPiA+DQo+ID4gICBTRUNUSU9OID0gImJhc2UiDQo+
ID4NCj4gPiArIyBNb3N0IG9mIHRoZSBhcHBsaWNhdGlvbnMgYW5kIHRoZSBsaWJyYXJpZXMgYXJl
IGxpbmtlZCB3aXRoIGxpYmNvbW1vbi5sYSwNCj4gPiArIyB3aGljaCB1c2VzIHRoZXNlIGxpY2Vu
c2VzDQo+IA0KPiBJcyB0aGlzIHNvbWV0aGluZyB3ZSBjYW4gZGV0ZWN0IGRpcmVjdGx5IHdpdGhp
biB0aGUgYmluYXJpZXMgaW4gYQ0KPiBwYWNrYWdlLCBzbyB0aGF0IHdlIGNvdWxkIHNpbXBseSBh
ZGQgdGhvc2UgbGljZW5zZXMgZHluYW1pY2FsbHkgdG8NCj4gTElDRU5TRToke1BOfS14IGluc3Rl
YWQgb2YgaGF2aW5nIHRvIGxpc3QgdGhlbSBieSBoYW5kPw0KDQpJIGRvdWJ0IHRoYXQgaXMgcG9z
c2libGUuDQoNCj4gUGFja2FnZXMgd2l0aG91dCBhIHBhY2thZ2Utc3BlY2lmaWMgTElDRU5TRSB3
aWxsIHRha2UgdGhlIHJlY2lwZSdzDQo+IExJQ0VOU0UgSSBiZWxpZXZlLCBjb25zaWRlcmluZyB0
aGF0ICoubGEgaXMgcGFydCBvZiB0aGUgLWRldiBwYWNrYWdlDQo+IHNob3VsZCB0aGUgLWRldiBw
YWNrYWdlIGhhdmUgYSAibW9yZSBwcmVjaXNlIiBsaWNlbnNlIHRoYW4gdGhlIHJlY2lwZSdzDQo+
IGRlZmF1bHQ/DQoNClNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhLiBJJ2xsIHNlbmQgYW4gdXBkYXRl
ZCBwYXRjaC4NCg0KPiANCj4gQ2hlZXJzLA0KPiBRdWVudGluDQoNCi8vUGV0ZXINCg0K

