Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DDCC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 10:32:48 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.11])
 by mx.groups.io with SMTP id smtpd.web11.8077.1748946759450800453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 03:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=T7fuLfe4;
 spf=pass (domain: axis.com, ip: 40.107.130.11, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alHp38geUNhub/wGVqiucBIl2M+cOCe1L1EtNU+6BhqTzaC+5ZxXgaZ+ZnX1GoqJX3uKhFqHuhsSb4QPJfm1sJ7k1SegsK3qPdBpyy06MzbOLQHleZipxsoIEUxyAa8DFSKAdl9i11/NSMPwY354wCdVkBpbbWRMbsvTZr22m5Mz4j6t1GbfoLm69FTzFrE1LGMpmytOhxq80umY+qFL/qfwgCpjNBhjGf9Sw12KdmF7u4Ie/3Ha1C1cZR2NqTgsAYJvvQapP2vI8dES8AqhPd7snljiNMGvnnl0XouMq3qDjKW8maN7DHO8EbXme9FPD2ps6jSZYuVflcDTrGvGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x20S+cHUW0XktnF6a1OqM4V0g68tGGrC+OoDlrhmJZw=;
 b=n1+UNqSMiv9rmmG86bQnHpuZB0B1rLdkPZ4pp+Z3nl54Ns/HiZFSSqDDt5OHGqAMUuo9OF7Mkt4qJmaxHaNhXTxC3Oxm2k16MJunXbrX/T5teYXJy4OKAgvA/pqx23Xj7QubDrTh3A9C0OEztTUUCXMSwBnKYkIUytj+REnWWHhLsbbo4B06AzRWL1z2mwu3e30GcIBz9HOk6VkjrxEwjkIs2S4MTod/3RUWQ/ee9kyWKTlJHcyfSAE5FHe2lUEU/05vkavaZIzO03oV9CEcbjpja2qyxHoEQmy2EC1abpV+f5rL8uS/zcxM2zsfRlvKwl2693EI8g1E+eteZFlKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x20S+cHUW0XktnF6a1OqM4V0g68tGGrC+OoDlrhmJZw=;
 b=T7fuLfe416Mqj4xhuss81w3AvE45sJcc5kzzD+MmTRcjFM3NZ4mEoWySckYFPEzB6DykHRgR17CyFc5AonwcFwpl4f7VVFN+pELvMLzoKkT3rT6QS8vxQK5MTOHJadhMnVdcSLECSF6YR5ALe2uS/1+IPFKn6Z6R4BqBqqDR0VI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS4PR02MB8624.eurprd02.prod.outlook.com (2603:10a6:20b:58c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.16; Tue, 3 Jun
 2025 10:32:35 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8792.027; Tue, 3 Jun 2025
 10:32:35 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] util-linux: Improve the package licenses
Thread-Topic: [OE-core] [PATCH] util-linux: Improve the package licenses
Thread-Index: AQHb1Gm8JzqAGr07wkKnYQgsUfK8KrPxMk+ggAAE3QCAAANHEA==
Date: Tue, 3 Jun 2025 10:32:34 +0000
Message-ID: 
 <DB5PR02MB10213955C59ACF4753ECC0CF7EF6DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250603031425.2206714-1-pkj@axis.com>
 <166b439a-86cd-4bef-816f-c016732236da@cherry.de>
 <DB5PR02MB10213CA080A393F42FE4D4229EF6DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <1e9f7bf9-e319-4864-ae53-fb82468cb12e@cherry.de>
In-Reply-To: <1e9f7bf9-e319-4864-ae53-fb82468cb12e@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS4PR02MB8624:EE_
x-ms-office365-filtering-correlation-id: 828b5aed-e2fb-425f-b471-08dda289f452
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TlRNd0l1RnA1c1NBU1dQdkhKazJLVEdMSHE2ZXJ3QXlXWFUzUUUrTy9sVnpx?=
 =?utf-8?B?OVFLeWtwdTgwMkc2d2lZSFRWMU9DSUlxR0IwMjU5Z0ZpbldJWWdKSmtHYUM2?=
 =?utf-8?B?NWNOZjZxQ1NSYUNZMmxjYlpSR1QwSzJrMWpWOGdMeHRyN0lkVlRxQXh3V1pK?=
 =?utf-8?B?YjRJL1ovbnpCcnlXNlh2OWExb2phV28wVnNDREZ3aDR5T1kxdlo3ZnE3WDNt?=
 =?utf-8?B?dXY4WVQ4ZjBXVnNmWTNJc2Faa05iVk90alU2c21PVEV5TWRFTVRiOXNqaHlt?=
 =?utf-8?B?dGRVMlJzWEdtTU0vVGZBTmNZbmdMTTRtQ0pIbjRKRlpteHd2VWtKUWNrckZi?=
 =?utf-8?B?ZHZQblB5elZuY3l4NTlVQ3BGQ05MK0ZBeERvYkNJQVdPZFkzZGI5ZEIyb2xy?=
 =?utf-8?B?M2JFem5neUVnZlNDZW1sSFplbVhMWmZrQ1RIQjVhNU5pMWs1TVA4YW85QlM3?=
 =?utf-8?B?OEZZczRvcmVvWUUrZ3JEczJZVDhCU3NoR1c2bkUwSUsrUG4zZ0gzeklXNkRp?=
 =?utf-8?B?cDJlUkZZa3VZUVQzOWN2NnY5WVpSYi9DVjIzY09TUlBkNVowWkx5amo3RjJB?=
 =?utf-8?B?dDNORUZnK2VyNVErNGRHaGJXUnpoanRCaVprcS9EU25aRk1jekwwdVpnTGVN?=
 =?utf-8?B?dFZ0amhRZ1VqNkNORFEvY0p0QlFSWjQ3amd6cENab3gvRjVXaCtsNWJYaENC?=
 =?utf-8?B?M2xPVVVBQnZSTmtDcEpYZTZWaUhnMlRZMy9KWnUxWSttaS8wNjIxcnBNRTgz?=
 =?utf-8?B?Mm5WOWhuNVZ0dHp3YVhDRWdkUmhvUlpRUHFRUzRhVnBQRUs4ZlVkZ3RxSkpB?=
 =?utf-8?B?bklBdFFJS1BTbzE3cnpsWmdmd0ZVak83U3dhNUI2a0R3eWc5OXNRNm1FakJm?=
 =?utf-8?B?dU9nVWxVMHUzOGR6U3J2T0o4VlFuRE9WdHdFSjB5NVBGNE0yT2MyekpHcnZt?=
 =?utf-8?B?Qzdsb0xKd3JWTVZXSWgza3RxcTMwQTBBZk1jRFk1V1FwZ2JvVXFoNXpURGJi?=
 =?utf-8?B?dmFNSXRxY0JBZDdoWUQ1dVByOG41U0lzdFZMNkVVR1JDajVMaTVpR2J4eE1o?=
 =?utf-8?B?ZzdwNHpJaWpMOTNKSncySWhKczRMaGFSOEF3MGRndk9vNUU1Z3NGa2NOYkh2?=
 =?utf-8?B?dHI1OUF6S1U5blR1Nk1sakpWd2d3SjNpWjFMUDNEQlRocjYxYUdjNVg5VEJt?=
 =?utf-8?B?ZzFxQjRET3loSGQ1RE52VVlSUUZ0VFpoaXhsRlNraGE5M080eFgxN1lFYTBH?=
 =?utf-8?B?dTVLdk1YeXlsQUJXREhwNWhrdlBtK3lEaXRKYlpoazN5bEx5MDArY1lzOTgw?=
 =?utf-8?B?Mm5HYzc0OHdRcndEd2hwNi9LemZyS3phUW0yU29PUGlLRFFobWZiMFVMQVpq?=
 =?utf-8?B?cWw5WnJoWVdHVU5JSlc1WEJKVHdNV2lLdElteVI0N0ZvS2drdWVVTjUyWm9B?=
 =?utf-8?B?ZDcxcmZMR3BKOFFnRlRoSzVjeTMrdXZBL3l2TTRYS2NpYjYvY3IyUldaTkRj?=
 =?utf-8?B?ZjM1WktiSEhCMHhwaHNXckZ6bllFMmlXUnN1UE84UzBralBQclNSV2xnUmI1?=
 =?utf-8?B?ZmZuUEwvMEwyTmQyWEtXUExpdzlDZW9ieFcySDVISjNMOU1aU0IxRURBckNR?=
 =?utf-8?B?YUg1WUhpK2dvcTB2OHd0WHlMS3Zwc0RRMEpmS3V2UjJleHk5RGpzYTVsK0U2?=
 =?utf-8?B?S1VJSjNqSjJhTVNYM0ovZFVZcHQxZnB4RGE0bWZpbmNXN0trdkRTN2xCaU52?=
 =?utf-8?B?cEl3eVNTelFZYWZOU2dXMnhsZ1RDd1NqaUNRZnF3VktVMEpqekNxZm5hUUJw?=
 =?utf-8?B?aWRQdDl2cHVleVZhTkRvRy9mWEw0T0srb2g1UnVkZ1BpeVpPWHJlbUc3MDBK?=
 =?utf-8?B?K2dsQkE0RDhsUUtPeUhuTVducTR3UXV6eTlaMlN6aUMvQTRORVkxNGEyUi8r?=
 =?utf-8?B?VE1LeVRGMUg5MmZRcGEwUTloQkk3alFmRElSNkVSVURaUlBnSGtoQjNtNk1U?=
 =?utf-8?B?a3VTcUFsa2pBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OENwdkVWMnlKYkpoQUdqdFhJcGg0dTlrY0hIcVpON2QrUzdtTFZSaFE2S2s1?=
 =?utf-8?B?ZEEweVh5OWM4YktQRXhUTlJtZHFSUmJkdjg4QSt2UlJoZWZsNWVFa2RPYjFp?=
 =?utf-8?B?eXltdmh3b1VqTytvK3k2R3pmN0w0RnBodC9qQ0Y4RFg3VUEwakZJdCtuWHNH?=
 =?utf-8?B?b211ZWVNdVM1VC9xSzJ3aWlxQndFclRZSTFmdkJmUjJwWVhaQy9paW42Vm1O?=
 =?utf-8?B?dVVrZFNibWFWbDRXZ3NDUzhYSk1LYkhTSlVVMkNNZ2hUYXdSOUFFazZ5MWor?=
 =?utf-8?B?VkRsZ3hSb3MxYjlvMkptdklyaHQ3VVNSWUZ5WCsvcU0xL2RTQStSN2s0ZjEv?=
 =?utf-8?B?QVVnR0RBb0EyU3pBbVN5QXJXZlpzVkhFdkIzMEQzdjduMUpTekNMRWY1VEdG?=
 =?utf-8?B?TDIvSTh5UUZTTnlUVGdpMFlXSUVCV3FYTE14SWcxUndLaVdWNGExaFdJVlZX?=
 =?utf-8?B?ekhLZkhHR0xlcE5ZTytIQzMreG9LT093KzdLbzNzMzlNWGtTTEY1UjAxTGJz?=
 =?utf-8?B?MGNrbG5GZVpnYWhJR3BpVFdzQTZ5a2pWT3B1S2Z1Zy9nZFE1T1hldkVRWVFO?=
 =?utf-8?B?SEhJRG1xVWxsWUFkTW1OWWFBV1R2TnJzaXNwdnM2OHNiNGZydjBGSWpkQnls?=
 =?utf-8?B?ektCTUMxS1B0OU8vZ1NqME9HNE9OQ1pNOFNIR1llVjRLUklQM3Z5ckwwRWdw?=
 =?utf-8?B?c0pUaEZtUXI3QVhVMU53aTl0YitSZFNDNUwwWGFscXk0R0FaNEU2Z3loWUhT?=
 =?utf-8?B?VkMwSzRMRE93N1pxMVZOWUZtcWxYQ0JSaHVVOXZ5eHJnSzR6YlYwclYrNGZi?=
 =?utf-8?B?NzdtZ21CbTd5WXdGMkhLM21CRTdZZC9YaGdyc1pWQUdBTXJPMjJqYkMvZ1Nz?=
 =?utf-8?B?S082cUhlMXMrYzRPenpZdXo0RllhcCsrN0RURWhJMWlteTFGeVRvU29BQ0J5?=
 =?utf-8?B?TlNtclB2WHpEUUwzekJjNVFhV3drTW5majlzY1lMV0VsVjNNemh3OUF3Skt0?=
 =?utf-8?B?RGhFa0lZc05GeGNpY2FnUFJFRHliMWxIdkZUNmpWV3VkbEpWVjVwbWFweE4v?=
 =?utf-8?B?UzFrVUQ5d25qL1VpU3JQUU0xK3RBT3UzVHNlVkxXNUJvM1pDNEcrRFpxUlB3?=
 =?utf-8?B?WFZ2MXh5ZXNuaEpqZzF5a1RTeTNlaTd0OEE1NngyOXFhb2hkUktPSmRFelRv?=
 =?utf-8?B?dENoazErR0FXcHE5MkdNa1dKbTE5dTZnZEh0YjRLQzg0eHEwU1RhYU9DUDJu?=
 =?utf-8?B?Nml0djhvK2hMZEZRME90ck9yVUZjbDMvdExtVXF0R1BLcjExaU1YUnFsS0xE?=
 =?utf-8?B?eTc3aXhDS1k3QnRXSmxUZnY0ZlhzYndVSGhVOGU2S01Iak9wSGxlU2tpV0M0?=
 =?utf-8?B?V1BvV3E0TXJHWDdYQ1F4QnlZNnVJZTExZ294cndLZzFuNXdwWGJUMHB3Y0hp?=
 =?utf-8?B?emR2TE12cW1Ub01lbG1ZMUhaYW0rSXM0SlV5dXdXRE1JSGhQYUVaWEF3dW5L?=
 =?utf-8?B?QlhudWtyTmhOaDRUem1weklYeHZDYW0rWkowS3Nvb1ZYemg4c1RQUjQ3MG01?=
 =?utf-8?B?YlNRZkJBcGJSZThVYmFNWFd3bVdUaTJMUHM0VHI2ZmViaHBaMFFDb1FkZ2ZB?=
 =?utf-8?B?bVRyNE9LbFRTYm1ob2E0ZllrZXp3V3NLTCsvdTlyMy8xbS9BNVYyZGVmL2Jq?=
 =?utf-8?B?M3haWS9mSXBQaWhnSWlYdEkvYThjU2Z2Q2drb3poTzdjRjF3U0RkSXdFZEQ3?=
 =?utf-8?B?eEFQSVdRVjAvd25WMVV4SlVHVkFtb1I3UnNDNHZuK2syOFJqSjZ5dlhZK3Jh?=
 =?utf-8?B?WkNZODZqa2xPTlFTQjVUbTNrSjA3Vlpla1cvcUl5TE55eTBoRlo5enkyZldB?=
 =?utf-8?B?TTFUcGdwc2pCMUgzRWY3K3NTMndTbHZRNERCYnVIZkd3VWQ5OWwxSzIyRUQx?=
 =?utf-8?B?VUNNVWFnY1hIcFVMZEZTUTR5ZXBRbXZyNzJwdFlDTE10cHduVXVmZ3NZVHlq?=
 =?utf-8?B?TGVlbExzbWo3UXZ6VGZ5aFdtMXVPM1FoazlGTkR3UDdUNFR4SDlZR0p0T3Fr?=
 =?utf-8?B?UGxNRGxmM05PRzRnd2s2b3h2akUxbUJMNStMdTlnMG1NTkRLcWhBTTlObFdB?=
 =?utf-8?Q?sgrg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828b5aed-e2fb-425f-b471-08dda289f452
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 10:32:34.9338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lylfq1YhYo0ceQwsTW3QzvDke9V0S82V+A0uBGF2Vc8l+5D8c0iqKHh3aUUDAz3o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8624
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 10:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217800

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRdWVudGluIFNjaHVseiA8cXVl
bnRpbi5zY2h1bHpAY2hlcnJ5LmRlPg0KPiBTZW50OiBkZW4gMyBqdW5pIDIwMjUgMTI6MTINCj4g
VG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSF0gdXRpbC1saW51eDogSW1wcm92ZSB0aGUgcGFja2FnZSBsaWNlbnNlcw0K
PiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBPbiA2LzMvMjUgMTI6MDcgUE0sIFBldGVyIEtqZWxsZXJz
dGVkdCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
UXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4NCj4gPj4gU2VudDogZGVu
IDMganVuaSAyMDI1IDExOjI3DQo+ID4+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtq
ZWxsZXJzdGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHV0aWwtbGludXg6IElt
cHJvdmUgdGhlIHBhY2thZ2UgbGljZW5zZXMNCj4gPj4NCj4gPj4gSGkgUGV0ZXIsDQo+ID4+DQo+
ID4+IE9uIDYvMy8yNSA1OjE0IEFNLCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4+PiBUaGUgZGVmYXVsdCBsaWNlbnNlIGZvciB1dGlsLWxp
bnV4IGlzIEdQTC0yLjAtb3ItbGF0ZXIuDQo+ID4+Pg0KPiA+Pj4gTW9zdCBvZiB0aGUgYXBwbGlj
YXRpb25zIGFuZCB0aGUgbGlicmFyaWVzIGFyZSBhbHNvIGxpbmtlZCB3aXRoDQo+ID4+PiBsaWJj
b21tb24ubGEsIHdoaWNoIHVzZXMgdGhlc2UgbGljZW5zZXM6DQo+ID4+PiBMR1BMLTIuMS1vci1s
YXRlciAmIEJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSAmIE1JVA0KPiA+Pj4NCj4gPj4+IFNl
dCB0aGUgYWJvdmUgbGljZW5zZXMgZm9yIGFsbCBkeW5hbWljIHBhY2thZ2VzLCB1bmxlc3MgZXhw
bGljaXRseQ0KPiA+Pj4gc3BlY2lmaWVkLg0KPiA+Pj4NCj4gPj4+IEluIHBhcnRpY3VsYXIsIHRo
aXMgYXZvaWRzIHNldHRpbmcgQlNELTQtQ2xhdXNlLVVDIGFuZCBFVVBMLTEuMiBvbg0KPiA+Pj4g
cGFja2FnZXMgd2hlcmUgdGhleSBkbyBub3QgYmVsb25nLg0KPiA+Pj4NCj4gPj4+IExpY2Vuc2Ut
VXBkYXRlOiBTZWUgYWJvdmUNCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVk
dCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgICBtZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jICAgfCA0MSArKysrKysrKysr
KysrKysrLS0tDQo+ID4+PiAgICAuLi4vdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDEuYmIgICAg
ICAgICAgICAgfCAgMyArKw0KPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4LmluYw0KPiA+Pj4gaW5kZXggYjBmMmE5ZDQ5Ny4uYmQ3YWQxMDAz
NSAxMDA2NDQNCj4gPj4+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC5pbmMNCj4gPj4+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC5pbmMNCj4gPj4+IEBAIC02LDE0ICs2LDQzIEBAIGRpc2sgcGFydGl0aW9uaW5nLCBrZXJu
ZWwgbWVzc2FnZSBtYW5hZ2VtZW50LCBmaWxlc3lzdGVtIGNyZWF0aW9uLCBhbmQgc3lzdGVtIGxv
DQo+ID4+Pg0KPiA+Pj4gICAgU0VDVElPTiA9ICJiYXNlIg0KPiA+Pj4NCj4gPj4+ICsjIE1vc3Qg
b2YgdGhlIGFwcGxpY2F0aW9ucyBhbmQgdGhlIGxpYnJhcmllcyBhcmUgbGlua2VkIHdpdGggbGli
Y29tbW9uLmxhLA0KPiA+Pj4gKyMgd2hpY2ggdXNlcyB0aGVzZSBsaWNlbnNlcw0KPiA+Pg0KPiA+
PiBJcyB0aGlzIHNvbWV0aGluZyB3ZSBjYW4gZGV0ZWN0IGRpcmVjdGx5IHdpdGhpbiB0aGUgYmlu
YXJpZXMgaW4gYQ0KPiA+PiBwYWNrYWdlLCBzbyB0aGF0IHdlIGNvdWxkIHNpbXBseSBhZGQgdGhv
c2UgbGljZW5zZXMgZHluYW1pY2FsbHkgdG8NCj4gPj4gTElDRU5TRToke1BOfS14IGluc3RlYWQg
b2YgaGF2aW5nIHRvIGxpc3QgdGhlbSBieSBoYW5kPw0KPiA+DQo+ID4gSSBkb3VidCB0aGF0IGlz
IHBvc3NpYmxlLg0KPiANCj4gRmFpciBlbm91Z2gsIHdhcyBqdXN0IGEgcmFuZG9tIHRob3VnaHQg
SSBoYWQgOikNCj4gDQo+ID4+IFBhY2thZ2VzIHdpdGhvdXQgYSBwYWNrYWdlLXNwZWNpZmljIExJ
Q0VOU0Ugd2lsbCB0YWtlIHRoZSByZWNpcGUncw0KPiA+PiBMSUNFTlNFIEkgYmVsaWV2ZSwgY29u
c2lkZXJpbmcgdGhhdCAqLmxhIGlzIHBhcnQgb2YgdGhlIC1kZXYgcGFja2FnZQ0KPiA+PiBzaG91
bGQgdGhlIC1kZXYgcGFja2FnZSBoYXZlIGEgIm1vcmUgcHJlY2lzZSIgbGljZW5zZSB0aGFuIHRo
ZSByZWNpcGUncw0KPiA+PiBkZWZhdWx0Pw0KPiA+DQo+ID4gU291bmRzIGxpa2UgYSBnb29kIGlk
ZWEuIEknbGwgc2VuZCBhbiB1cGRhdGVkIHBhdGNoLg0KPiANCj4gSSBkb24ndCBrbm93IHRoZSBj
b250ZW50IG9mIHRoZSBkZXYgcGFja2FnZSwgc28gbWF5YmUgdGhhdCBpc24ndCB0aGUNCj4gYmVz
dCBzdWdnZXN0aW9uIGFuZCB0aGUgZGVmYXVsdCB3b3VsZCB3b3JrIGZpbmU/DQoNCkl0IG9ubHkg
Y29udGFpbnMgc3R1ZmYgcmVsYXRlZCB0byB0aGUgbGlicmFyaWVzIHRoYXQgdXRpbC1saW51eCBw
cm92aWRlcyANCnNvIGl0IHNlZW1zIHJlYXNvbmFibGUgdG8gc2V0IGl0cyBsaWNlbnNlIHRvICR7
TElCQ09NTU9OX0xJQ0VOU0V9Lg0KDQo+IA0KPiBBZnRlciBhbGwsIHRoZSBMSUJDT01NT05fTElD
RU5TRSBpcyBwYXJ0IG9mIHRoZSByZWNpcGUncyBMSUNFTlNFIHNvIGl0DQo+IHdvdWxkIGJlIGNv
dmVyZWQgYXQgdGhlIHZlcnkgbGVhc3QgKGFsYmVpdCBub3QgbmVjZXNzYXJpbHkgcHJvcGVyKS4N
Cg0KVGhlIHByb2JsZW0gaXMgd2hlbiBzb21lIGlycmVsZXZhbnQgbGljZW5zZXMgYXJlIHNldCBh
bmQgdGhvc2UgbGljZW5zZXMgDQphcmUgInByb2JsZW1hdGljIiwgc3VjaCBhcyBCU0QtNC1DbGF1
c2UuIEF0IGxlYXN0IGZvciB1cyB0aGF0IG1lYW5zIHdlIA0KaGF2ZSB0byBnbyB0aHJvdWdoIGV4
dHJhIGhvb3BzIGlmIHdlIHdhbnQgdG8gaW5jbHVkZSBzdWNoIGEgcGFja2FnZSBpbiANCmFuIGlt
YWdlLiBUaHVzIGhhdmluZyB0aGUgbGljZW5zZXMgYXMgY29ycmVjdCBhcyBwb3NzaWJsZSBoZWxw
cyBhIGxvdC4NCk5vdywgd2UgZG9uJ3QgaW5jbHVkZSAtZGV2IHBhY2thZ2VzIGluIG91ciBpbWFn
ZXMsIGJ1dCBzdGlsbCwgaXQgZG9lcyANCm5vdCBodXJ0Lg0KDQo+IA0KPiBDaGVlcnMsDQo+IFF1
ZW50aW4NCg0KLy9QZXRlcg0KDQo=

