Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F9DC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 21:35:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.12])
 by mx.groups.io with SMTP id smtpd.web10.19820.1749159320084077909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 14:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=LVK/1BI7;
 spf=pass (domain: axis.com, ip: 52.101.84.12, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWA90bXWppP//ovR2sJj1kLVZ+DkQZHNVNPzxJnfxaUxUZR1C2TIC6B2hSk+7RzaIpuEVN6cAcbfzUC1jIMgpiQNDvZndhDn023+mHgAREk76/coRstguizoNHwCWxjZsdgLagUfyvUjiD0q3IOdgEQFWXhaRiNq3+5Zv/nNWj49evmngIA8i0SEG5bYuT+LVAHfGZfyFd55xG1x30AwvmidEjPNq8x8xSml8w72Q1O5od+IJZfXVFuGDehOCURrk2apfN1iWMnp+ZjgQvmpe+okSf5QnoGuZ+Ug0njS87yzQJcrJqSNC/7jkAUOjwVBhMXDUtUsPwY6NlTiNbJybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNyOsdzkXec4Y91RiTo6b9idv3cbiCbftvt+V8tfwH8=;
 b=BNyYVkGX9iV6ruczAGQY6ZblxI8A02bxjb54lC/DVdRCEh86G8hlWKQ3akpLi3s+m06SRpjwjRyls9CTAq5Qu1o8c+LlViJWBrx0tNUVlbiroQeZ2e2gdHWQ/QOtQrOyXVfvgM4RiKw5FJ67ERLKiPSdeosBfjQx6uz4qrvSPxNQ/I+vOwl9NKg4LbPn3fbRmj6mLSEXmrfN0oQSK5cyWAZi/z9Z6mS9wIE4b1gWzKvt1zXAUYclL1QQfdFGlWXSnUzL+ikrtSNJYkLzrBkkjdWn5MVewS1xNF+lHcEtJUmUEHnYMhyNU/oGkiAkfdyxNt7H310DBjnUpbQSIaPIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNyOsdzkXec4Y91RiTo6b9idv3cbiCbftvt+V8tfwH8=;
 b=LVK/1BI735gA8y/IknKdCeJSnd8gZq6CZ782zwfvx5TawfOLKO9J1kCr9+zJ5XU+Ql7inFdTHVxOvRMBpIhX6A6DcB0HAOb6OTYLyG08pcdHWczIA73P44aNrEYsZGzspdAGwBQJzKnlooWjWJYuTCFhzXSHDSKnAZ4GvHBdRjQ=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB6650.eurprd02.prod.outlook.com (2603:10a6:10:210::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 21:35:17 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 21:35:16 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv2] util-linux: Improve the package licenses
Thread-Topic: [OE-core] [PATCHv2] util-linux: Improve the package licenses
Thread-Index: AQHb1Mwp8k8wmMlzjkq2nVr0bbjePrP1GTrQ
Date: Thu, 5 Jun 2025 21:35:16 +0000
Message-ID: 
 <DB5PR02MB10213EA39D948D70982F41F1BEF6FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250603102320.2344115-1-pkj@axis.com>
 <DAD7HC7Y5E4V.3AEBXGRCPG1EN@bootlin.com>
In-Reply-To: <DAD7HC7Y5E4V.3AEBXGRCPG1EN@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB6650:EE_
x-ms-office365-filtering-correlation-id: b12c6888-457f-4ca9-dbbf-08dda478dd0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S2lZeWhUMzlGeVZLMGN0UGhqTC9YUzV2SzhQYVF1cUxKRjZpaUs2TTB2dWpX?=
 =?utf-8?B?Z3BLQXpUekdHZjYvWGgzQ05yeHFHWGc4M3hSN2RUaWF4enNSOTZDREtZVkFS?=
 =?utf-8?B?bHB0RmJZdEdtSmVjVnQ4VzMySjJrV0VBRGxnTStWV1FlN3Vtay9wRUxmL0Jt?=
 =?utf-8?B?UTErY0hocW81a3dwYm8yYUd1WkVxK09WVmIrVVFLcnMyWk02aGF2NVpLSFVW?=
 =?utf-8?B?em9XUTQzUU5qdm9JMitoTWJ3TVJsS3gxMkNHWWMwTjA2TE1vZnk3UnIyTmlW?=
 =?utf-8?B?QU5WdHNpN09pbnhid1R6QWE5V0g0TDBwOFR5MTNZa3MvQUs4U2o4cm5mSzFl?=
 =?utf-8?B?ODJqQUpud2ZBbXh2aEVENS9MZk45WHZhRldpS0NVYVIxU0FwbHphWE9jOEhT?=
 =?utf-8?B?ak1IblNYTHpNOUJlMkEwQmRGWm9KT0tTaHVObUlQdTZWVlBVdSswMExyVG5P?=
 =?utf-8?B?VjV5bEtGRWhUMEtNelBKaGFFS1VYL3NOSEJLRnBTbG5RZC83bFl1Qmp3WStD?=
 =?utf-8?B?NTEvYitPeUNjRlZ5YVRoRWhXWlB5WG9VamJFMHc4c05JMG5MRHU0SnE0NDFh?=
 =?utf-8?B?V05FdEUxZktCQTV3UFhqcjBNRzV5bmZOUGQvckJ6V2NEUkN4ekxrcTNqZCtw?=
 =?utf-8?B?WmgxWmRZcHBIZHRYY09BNWxmVW54VGtqUWduQTB2aTVJTURnQlZBQ1JLeTdq?=
 =?utf-8?B?S2V2dkJYT05uMDBJTkxQYUNRZGhObmlUSDVkMVlqUEJPbnF0cDVUZDRUbnkw?=
 =?utf-8?B?OWdyQ2xMZ0JqM09KaUNwYUFrcVFCSnp0MzRsK0lwVmRkRlJIVFVJcUQvdmJ4?=
 =?utf-8?B?c0NsMnd0SVFpc0RVM0pab0hTdFZCUFZ0WWttdmFqWEJVcThjZGVuY0NVQjk4?=
 =?utf-8?B?SzhUOHJwOXdKenBNZkE1OW1YZHBNbUF4RHJaUGdTOGNjN2syd011RDRlWGxM?=
 =?utf-8?B?ZXBrSVN6Q2E2U0xVa1NBRi9MZ1JBdXA0WU1LejZIeUx0UnE3TjNIOXd4UjBv?=
 =?utf-8?B?SVZuSXd4U0lETkJTTHNqeCtVcU43TFJoMERXa1AzaVFwWlNDR20wWG1iVTJa?=
 =?utf-8?B?WXIvTnJpNTUyeEhIYk9qbVFkbjh0c2hqNDNBWjk1cDdhc0lSS00xSVpQYVVr?=
 =?utf-8?B?MWFzSFdxNVBOdHh4WG9xTFNvMVduUTl3OHNHOWU2RFIrOGVReWJqcnU2SDQ1?=
 =?utf-8?B?RmtxUzNIbHZ5UE1rTTQ0T1RZRld6WXkzcnhxeVk0YVZvaWhEWEZDK25jTUpv?=
 =?utf-8?B?OWNLS1pRaU4zbEJmNFRWRXBoQ3o1ZjlTN3dzaHJib1VHK3QvQ2sreGNnTkU4?=
 =?utf-8?B?VXhhQmsxQzdXcndRcDJMeXpmZ3hIekJEb2pESjRkMGhpMW42SnZOM0YvWVpk?=
 =?utf-8?B?SDlPVHVuV01YNFZYWVNDbXIrNHRzZUMyTWhCajk5d0R5bkZOeldOSUk3NU1y?=
 =?utf-8?B?SEpNekUvYnUwRGdjcjRkemhLOUdCallRM0VkbjBpN0RJbHo5Z1dRb21tdFJx?=
 =?utf-8?B?UmIzOHNVaWVDTU9YNXVrTXhJMk80SW9vVmlwbis3TXlESUNYemR6c1o1USt3?=
 =?utf-8?B?ajRIVDZWbEFpL1lBV08vNjhBbnNiWFdYTmhmT2FIMmxVMWdybDRIUnZYdmww?=
 =?utf-8?B?Qmp0SmoxOXJ0MTVwWEZEZ0oxanZ5dmxnblhVRDY1SFMyRGUrQUxPbWQ5ZUtH?=
 =?utf-8?B?OWJMYWt2M29JdDNYbUNqUEd1KzM5OEZYdzdzSVQ5cmZqMkJNV1NEb1FxdnZV?=
 =?utf-8?B?Q0xOMEtsK1VRVHJtbVZwRzdDb1F2UGNDWndlUG1FdENUWGN5KzZVYVFZSzJX?=
 =?utf-8?B?SHdNWGh3WGNlcVl4LzJ4ckhQc1NpZEovLzBkRkFxSTBLUHk3NXNQekRXMkNk?=
 =?utf-8?B?Zmg3bDFYMTBBdVBjYk92aTV2NUgwTGZmS2g0c2RNWmdsN2RNQVByeGhrWFR1?=
 =?utf-8?Q?JI0H88M8b1A=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NXRFdWtRUHNvZWdlM1ZIb3dNbWVDeHNZV0ZET0lsZGttVlpaSnF4NXZwYnVa?=
 =?utf-8?B?Y1Q3K05uTTFGK2MzUlAyRFB2OTVIVnRMc0NpNTNYUlRrVzhkaG9kS0NERTF3?=
 =?utf-8?B?TGNraGd4d3ErcFljbk16TytQeFJCNnU0bzk2bWpDWkRjQTk4Z2VTVEx2cVJR?=
 =?utf-8?B?ajRmVU1kLzBRWVROVWRDS0U1QjZ1ZVhtekFZdDZoS29WWEJsa0EySHErb3dQ?=
 =?utf-8?B?RVZaMVJwaWVpWlEzb0FvK3VEbGphSmJWYTY5YmlIY0VSdEJPZmdicllpdDM4?=
 =?utf-8?B?WjdTUlBPNGM1Mkt0dENWKzlHNkl3NVhwQmlkd2o5WUVDclpqYWtMUmk0UE5a?=
 =?utf-8?B?b25qei9Ja2YxY3NncmNwcGtXdnZSaWJLRmMrQ003QTdYTTYzMjZpeVF1MVZN?=
 =?utf-8?B?ZTg5My92aitIVDVGUHZVNWlKT216a1phYmF3MnFDQkIvRTliamx2UFFMTjYw?=
 =?utf-8?B?VVA0WVY4b3JSSnZ6MTFvYktaZnBKalZQT1NQQlU5OUlaZ283Q09pTFp6Qjd6?=
 =?utf-8?B?c2hPN3RFb2xmSkl6aWptOU1UTUFpMENXdzVXQ2pDV0F0NTU4VitWOWEzQ0Vl?=
 =?utf-8?B?M3ppbFgvRFd2cERyUmhLMUd5c3JBZG9wZkkvSWNhQy9sTHFOK0I2YXFNRkNm?=
 =?utf-8?B?R291V050bGRhU1hwN09aUXZaaEtsc2p0NzVDdlRCR0lDY1A0Y1JDVnVwNDJV?=
 =?utf-8?B?cWJnWWhSUzlnREc2ZllsOFVwUzIxWFdNUjB5NXJudE1MWlpCbDdsbE00WXQw?=
 =?utf-8?B?R2VpdEhpVTh6cjJKSE9zbkJQWVp2UXM0V2ZnOEdjcTlwdUt4cVA5NFVYWnR3?=
 =?utf-8?B?bkV6dHFIOUhXYThhSFNMS1pBbGR6ZTk5SWJZRzlBUlNKZlovNnB4eWg3eWVl?=
 =?utf-8?B?bGlpb0d4aldNT2htTmNpWlRjeGN2WldiVTJJZ2szWDAvZWlvWGJ2anloNXZr?=
 =?utf-8?B?cEJHVVhQaGVzblV1NEdXc3VBZUFScTBGSUhrb216OU1sc2IxeG1oYWpoRDMv?=
 =?utf-8?B?K0lZUFU4NFBMNDZDNGgrSGxnN2ZzY3Z1NUJIUnErVnVJYnIzYmJBcTBXNEh6?=
 =?utf-8?B?dFhiUVVzdHZyM1JwY2NvTUZIQ3U0TFpMR2hEZUsxUVRmQ2cwVjNJQzdyekkw?=
 =?utf-8?B?UzM2VHVlVXRxcDl4dVhEMXFWVm9TTitnWksxL2FhYjhHWGVYT2gyY2xRa3lp?=
 =?utf-8?B?MTBIZDVUT2FSbmpjd3ltUVFOVjZjcVZhYXVqaVBCbDdmcDR3d0ZQSDZueDZE?=
 =?utf-8?B?d2QxcytVd3c2ZnNMNjZ6Mm9oaW5IU1ZodWVUZkVkdTZFVTZTNW1rWkNhQXNQ?=
 =?utf-8?B?bzhPZVEraXRQbUVYZDdGKzdiR0pNM01LNlNMcCtxZ1JQT2E1Rk1tUmZmT0Ex?=
 =?utf-8?B?dzRmS016eUpKelpzNmdlMzZTZEhCQWhOR0pZMVZqV3RpQ1d3OFJ4Y3Z6SXpE?=
 =?utf-8?B?MmNBUlJNWnhVT242Vm82UFhEQXM2aDZpNHZKV0JVNWdRdDBua3prbU02aXUv?=
 =?utf-8?B?MTcxMHVncHRNdjlOanl4MVNaWm9nMndQWithNVVZN0tOYlYvNHpIOU5vdVlS?=
 =?utf-8?B?K0RZbG9hVlNjUXgxL2F2MCtjUXZmTnlRZVZvMmcyRDVOV3liOGhCSlpuQmRN?=
 =?utf-8?B?THJRZDEvQ1daeXhQazFMSnAxSWRRcjhZYS9jT2EzcmMvdndPdFJDRlBmRXh6?=
 =?utf-8?B?V1RWWGUrem1PS3hiZXh4NENRYVUxNTN2dW1LbS9TWXlWak14Q1pnSTM1akdw?=
 =?utf-8?B?OGZyM3VNYjBkNDB0Z1IzWURZOXcvbm1JN1F5TWpqUVhDM29YemZha1A2cy94?=
 =?utf-8?B?SEFvNGVpQ2NpR1RjN1k3Q3hCbEsrZEJFcXY3OFo3Y3ZsTXlzcGU3TDJoS0lH?=
 =?utf-8?B?U3VXRGxBWDV1cnp1ODUyemZPT3JtR1hXOThMODJNSWNxeWdURkQ4Ym9uVHpB?=
 =?utf-8?B?TmsydUFNeXkrUkZEOFQ0VmF4U0pQamxPN1M3Q09JYzdBekl1c29aOGkyRy9X?=
 =?utf-8?B?TU9kZnpqR0daeVB2WU10WHRqSHowTnIzTytUMHFiUGQraTUydjJXU0ZLeHVY?=
 =?utf-8?B?dUd2bWpEaHliVFQ2ODh5c3dMaVVXcGJEbExMcGJNRUpaaDFkcm5OVFhjakpy?=
 =?utf-8?Q?WxW4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12c6888-457f-4ca9-dbbf-08dda478dd0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 21:35:16.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PTzBBGfSDN6oyAKjMDjr+nkjHAyIrk/va+aP/IZDttOL6VQ1073hFW0vWailDe8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 21:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218088

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDMganVu
aSAyMDI1IDIzOjEyDQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVk
dEBheGlzLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIdjJdIHV0aWwtbGludXg6IEltcHJvdmUg
dGhlIHBhY2thZ2UgbGljZW5zZXMNCj4gDQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZy
b20gbWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tLiBMZWFybg0KPiB3aHkgdGhpcyBp
cyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0
aW9uIF0NCj4gDQo+IE9uIFR1ZSBKdW4gMywgMjAyNSBhdCAxMjoyMyBQTSBDRVNULCBQZXRlciBL
amVsbGVyc3RlZHQgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gVGhl
IGRlZmF1bHQgbGljZW5zZSBmb3IgdXRpbC1saW51eCBpcyBHUEwtMi4wLW9yLWxhdGVyLg0KPiA+
DQo+ID4gTW9zdCBvZiB0aGUgYXBwbGljYXRpb25zIGFuZCB0aGUgbGlicmFyaWVzIGFyZSBhbHNv
IGxpbmtlZCB3aXRoDQo+ID4gbGliY29tbW9uLmxhLCB3aGljaCB1c2VzIHRoZXNlIGxpY2Vuc2Vz
Og0KPiA+IExHUEwtMi4xLW9yLWxhdGVyICYgQlNELTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlICYg
TUlUDQo+ID4NCj4gPiBTZXQgdGhlIGFib3ZlIGxpY2Vuc2VzIGZvciBhbGwgZHluYW1pYyBwYWNr
YWdlcywgdW5sZXNzIGV4cGxpY2l0bHkNCj4gPiBzcGVjaWZpZWQuDQo+ID4NCj4gPiBJbiBwYXJ0
aWN1bGFyLCB0aGlzIGF2b2lkcyBzZXR0aW5nIEJTRC00LUNsYXVzZS1VQyBhbmQgRVVQTC0xLjIg
b24NCj4gPiBwYWNrYWdlcyB3aGVyZSB0aGV5IGRvIG5vdCBiZWxvbmcuDQo+ID4NCj4gPiBMaWNl
bnNlLVVwZGF0ZTogU2VlIGFib3ZlDQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0
ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gLS0tDQo+ID4NCj4gDQo+IEhp
IFBldGVyLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCBidXQgSSBiZWxpZXZlIHdlIGhh
dmUgc29tZSBpc3N1ZSB3aXRoIHRoZQ0KPiBsaWNlbnNlcy4gSGVyZSBpcyB0aGUgZXJyb3Igb24g
dGhlIGF1dG9idWlsZGVyOg0KPiANCj4gRVJST1I6IHV0aWwtbGludXgtbGlidXVpZC0yLjQxLXIw
IGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOiBMSUNFTlNFOnV0aWwtDQo+IGxpbnV4LWxpYnV1aWQt
ZGV2IGluY2x1ZGVzIGxpY2Vuc2VzIChMR1BMLTIuMS1vci1sYXRlciBNSVQgQlNELTItQ2xhdXNl
KQ0KPiB0aGF0IGFyZSBub3QgbGlzdGVkIGluIExJQ0VOU0UgW3VubGlzdGVkLXBrZy1saWNzXQ0K
PiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVp
bGRlcnMvMy9idWlsZHMvMTgxNA0KPiANCj4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGUgaXNz
dWUgcGxlYXNlPw0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+
IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQ0KDQpJIGhhdmUgc2VudCBhbiB1cGRhdGVkIHBhdGNoIHNlcmllcyB0aGF0IHRha2VzIGNh
cmUgb2YgdGhlIGZhY3QgDQp0aGF0IHV0aWwtbGludXggYW5kIHV0aWwtbGludXgtbGlidXVpZCBy
ZWFsbHkgZG9uJ3Qgc2hhcmUgbGljZW5zZSANCmluZm9ybWF0aW9uIGFuZCB0aHVzIHRoZXJlIGlz
IG5vIHBvaW50IGluIGhhdmluZyBpdCBpbiB0aGUgY29tbW9uIA0KdXRpbC1saW51eC5pbmMgZmls
ZS4NCg0KLy9QZXRlcg0KDQo=

