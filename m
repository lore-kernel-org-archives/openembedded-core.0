Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1126DC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:56:19 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by mx.groups.io with SMTP id smtpd.web11.3831.1742465101163273856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 03:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=cIG0lVIe;
 spf=pass (domain: toradex.com, ip: 194.104.109.113, mailfrom: max.krummenacher@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1742465099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PA8xfJpS70tkWbrxoZAFMmrp8he36zrqxLwlQ9jDlME=;
	b=cIG0lVIeM2CHBl4P2RJtjpHQ/hGo+ZRZl/5TXQ3l0kUv2/aYorGh+BImLefhcMaMzVrnZy
	dvEq69JoJlQ/mAzaQ6ls96VIky6bMwE/teoZN653fbKA+mSJGEtCFQvdCHPHEprXlZIEiD
	GgbZ/8WlPpP0DKv/q7Qt1AWud2J9AxY=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazlp17010003.outbound.protection.outlook.com
 [40.93.86.3]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-73-rSMi9xI9PqqOOpoztMf9WA-1; Thu, 20 Mar 2025 11:04:58 +0100
X-MC-Unique: rSMi9xI9PqqOOpoztMf9WA-1
X-Mimecast-MFC-AGG-ID: rSMi9xI9PqqOOpoztMf9WA_1742465097
Received: from ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::13)
 by GV0P278MB0113.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:27::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 10:04:56 +0000
Received: from ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3e28:e686:94b7:cb5b]) by ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3e28:e686:94b7:cb5b%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 10:04:56 +0000
From: Max Krummenacher <max.krummenacher@toradex.com>
To: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "oss@ew.tq-group.com" <oss@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH] Revert "git: git-replacement-native: depend on ca-certificate"
Thread-Topic: [OE-core] [PATCH] Revert "git: git-replacement-native: depend on
 ca-certificate"
Thread-Index: AQHbmXrg1BXkAkf/ek65IrWPxliwUrN7xe0AgAAC6YCAAANBAA==
Date: Thu, 20 Mar 2025 10:04:56 +0000
Message-ID: <ea08ce84695ea9568b9dafe25a08387b775edc42.camel@toradex.com>
References: <20250320092959.563213-1-matthias.schiffer@ew.tq-group.com>
	 <87a48eb28f555495e48fe2b68001b502f2ff860a.camel@linuxfoundation.org>
	 <09b5e53a03892d24392293a19aef326d73d10acb.camel@ew.tq-group.com>
In-Reply-To: <09b5e53a03892d24392293a19aef326d73d10acb.camel@ew.tq-group.com>
Accept-Language: en-GB, de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZRAP278MB0237:EE_|GV0P278MB0113:EE_
x-ms-office365-filtering-correlation-id: 9d18fbf3-6b40-480f-90aa-08dd6796aa9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018
x-microsoft-antispam-message-info: =?utf-8?B?K0dyN1Q1a3VuZEdqM09hMDRHV0MrRzVEeDNBNWN3TjlHUVBIWXFJTXVoaFc1?=
 =?utf-8?B?VVFsc2d0TkQrQmFBaWkyeFpkL2lEV2wrbzZRNDl4R1lhTkZ6OW1GRGJtQThJ?=
 =?utf-8?B?dzh0dC9hZms5MkI1T3RjcFpKb0U2L3JGVEMwUWc3KzN5MGtXQWpkdnMxNnhx?=
 =?utf-8?B?TWNTS24xdUFJcUxGbEJGenJFZDFPUUlzN2x1QWZPb3ZWVUdkOVlvQzAyWDk2?=
 =?utf-8?B?ay9iOG1rRnBxRWdhMzlWRERxWjFFV2pRTUJCSng2dm1IUUZySGI4REo0K2lG?=
 =?utf-8?B?UUMxSW80dkhVaFBMbHppSGVtQldMVTVnVWhwR1pTamZvVUV2QjNOQ1JvTXZV?=
 =?utf-8?B?T0NaQmF2M2huOWhDanB2c1NFb1hvSVhDYXhlbDhsMzJEYmFBY3liT0hPdDll?=
 =?utf-8?B?YS8xdEhWN0VlcEdQWkZMMHREdE1zamlrVTlDNlRSK3MvTi9oejZVOXZtZUMw?=
 =?utf-8?B?YTFOUTNGM2pmQ2wwdGZmTno2S1RLTDYwbVVVeXhMWkxpcXZEUUIyN3AwYlhI?=
 =?utf-8?B?WVVYQTdla2JzRWFaQ25MTDd1Zy8vZVN3Lzl0bGVxSVd5V1JMT3ZyTWR1UkU0?=
 =?utf-8?B?eFRDcHRiajFSNVlWaVVkbzJFZnpWZWM0VUpBNFBkL0RwRit3aEVCTXkvVjhj?=
 =?utf-8?B?UHpHdlk2NkNiQmh6cmtKRHo0eWNwMXV2QUNOWWlvS3c3enJXcjRYZTh1dy95?=
 =?utf-8?B?WmdYMzNpaUJzazlHdC9FRTF6S3VZdzdMNXc4Y0ZVVGVXK1l6eGdLTDVRZlJ1?=
 =?utf-8?B?VkM1QlJPQXp6TWdCejNRUEUydmZqMTQxc3lab1hRSjZ3aUVOajJaclBUVS9Q?=
 =?utf-8?B?NHgzaWZTUXYwRHlhMS9ORDdDNFdNSWNVYVFPaTlVZXNHS3ozRVl5aUlSdW5p?=
 =?utf-8?B?RUFzSHFRQlMyTzExb1l2dVgwcE1aZ0JEZndlY3h0YnRMaTJyZUxYUlhpSmlG?=
 =?utf-8?B?YnpWRkxyY3BTMDN0bi9OREFRWlA0SWNDZW5JL25YejNzRGpqSjhFamVlaG5P?=
 =?utf-8?B?SkdaUTd2NVhzTEdVMm9EVnRwQ0FQSFlzQzJabG9vR1ZvM1NMcldsWmphZHNJ?=
 =?utf-8?B?UmY2Qk1jQUtJL2NyUlNVRmU0aStmaTAzRGZXTS9zQktxZFNyKzRtV2ZBbEpI?=
 =?utf-8?B?WHIyaGRPbDNCbWJ3S0dDa3c5MFNoQ3czcDZOYkt3U2VCeWhmN1FnWW9nVzFa?=
 =?utf-8?B?OE9lWWFCMTU1bjM4ZHBsdDZNNDRJNHJGaUVmYWxEV2VYckIxbXF0dFZTREFU?=
 =?utf-8?B?cUcrNzhDSzljUWd0aDRIeVlTeklqYURxUWEwQVIxNFBmQWRmUTZFVXUyVUNC?=
 =?utf-8?B?aGdaWWRxZEwwVVRnc2FKNm9kaDFiNGFqeUlzOFByWk92OWFzcURZSmVvaGx5?=
 =?utf-8?B?ZWZ6WTUvb2VXdDk3VUJIODNxc0hTdU9vSVFBS3BWTncvekwyNW41RjU3emIx?=
 =?utf-8?B?ZW1adE9WdFYyL3E3NFUwa2dmd0loSDN2TzV3dll3Tm96VE9WQ2wxMnYvc2li?=
 =?utf-8?B?Z3dqNG5QNUxuY0tvMG1sOEk2emZ2QlQwUndJb0R6OHNaY3pCc0Y2K0tlS0Iy?=
 =?utf-8?B?TGF2cTBsWlFHNUNVTU43NkpYRTJMcmY4Q2NxTzN1dE5DTkhjY1lDblAybnBw?=
 =?utf-8?B?K3Y2eFNFT3hqN0pWSlkvaVdIWW9KUlBGa2dQSi9Lb3FoUXZZVHZaaU93Q2pH?=
 =?utf-8?B?RGhVZlYxd2RMZnFuWnV6N2JSVGJSckp2NHMrY2VodHBmL2pnN2FVcE11NkFk?=
 =?utf-8?B?eGQ0NEdmVVNQV050QmhkTU92c1U2TklRdXlYKzU0d0lmU2ZvY0VKa1g4bnhB?=
 =?utf-8?B?SU8xazh5UEUvNUVDYUNNNUIydXJXTU01c0R1Z2dERWdoMDlTZXU4M3pNOHlw?=
 =?utf-8?B?TFdUdEp4VmYyYmpLTlIwWENaYThtYXhqM3c1djJ2aXJmY0xiZUhCK3pCTEc0?=
 =?utf-8?Q?EnX3QqqoRGXdu0xFfTqLNjIi5x5iUENw?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXIrbEtnVEg2Wi8vcE1vMExpSnNyejVkS0t1aVhTMFFBczA1Y3E1aTlmSnB2?=
 =?utf-8?B?TDN1UGtmMmlweDlUWE1pZURueDNiMUE3Z2c2dFVkTGtiSHAzR0htS0R6MjZ2?=
 =?utf-8?B?ODRzVGdQbEJMYUFtZ3hIWGxhQTNzcEFpNWdjREsvTXkzbWJjcjlyeVpEK0Jo?=
 =?utf-8?B?ZllDMll2ekw4ZjhBcC9EdWozZ3J3VlU1TC8rVldyYUIzbHRXcldGWFVUb2pG?=
 =?utf-8?B?a00vZi9XUWZwWFBibVZydnZkSVJCRGJaaGZlOGMraU0wcmxLMTFyNVlDWllz?=
 =?utf-8?B?WEE2aVFhUVRMeHVGUGlrcFo0bDN5MUlLM0RXT0RKU2JJeEs0anljVmpCVGtr?=
 =?utf-8?B?NEQ2SGVOdnE4MWMxenhuakdqUGpYSVhaMDBuNHBsY3lWZVd3RVgzWnEzUjN1?=
 =?utf-8?B?dG03V1gvUVg5VEZ1bW5CMm12SUpmR2ZMc09DWndNa2VvbzI1QTFLYmM3KzZT?=
 =?utf-8?B?NjhDU0JTWTl3bk9vTW1zZG43USt6NU1RSTVPWk1JWGpsNnR6RU04dkFCTnpj?=
 =?utf-8?B?UlpJKzNjL1ZvdFgxNi9HN3JTWmxXUWoxQnF0RlN1aHlHdGhxMTd4SjJPMGds?=
 =?utf-8?B?NnZVV1B3UjhrM3FCZTdJK2YrS3pDUnhYWlZDdzR5YTBKS0dOR0Q3cjJuMjJx?=
 =?utf-8?B?eC9ad3BnMHJka1pZZm9sRFR1dGloUm9CNjluMkczYjBYcEhOMHZxYThrTzVs?=
 =?utf-8?B?aFFPc2phOC8yMHpIS3VpMHhPeElLZnI2QXZYVzdJS3N6aWlaSnBxdHUySTRm?=
 =?utf-8?B?UENwK1FMK1BDRHBmbEkxRkNrdC9TWDRtODlMbWpZeWF5QWwwK0ZIUXE0eVZO?=
 =?utf-8?B?MXFhckdZYk5UdDF0RmsweDk2Q0NGaTBJdG05a0JmdXpML0ZIcmFpU3dxbTRt?=
 =?utf-8?B?RzZOWkpNcEZObkZLYUNUNWF5QS9VYWZ0b2E1YUp4YzZUdWh2TWswVFNiTnpu?=
 =?utf-8?B?SldjL3RHQ1Y2cllOVFA0akI5azdJSElaaisxeWI3SWJtK0dlYUFvUVZBdTNz?=
 =?utf-8?B?N2d0ZEYxY3ZBMWV1MVc3NndxUWtIRTRQRXZqcWc5cXMxVTBLL0VsVktkNGJ3?=
 =?utf-8?B?N0MxdHZQK1hRb21LdmJEOG1ub1RrMElxUWFHTEdKWStCSjQzNjcrTjYyRkNZ?=
 =?utf-8?B?U0tTQUZmcHlMbGd1Nzgzd1Ntd3JwMEtXK3FON0hWbkttRFNNZFdHOUVMZlFv?=
 =?utf-8?B?Um43SUFnQ2I4UlJLQlVDUGszMXZYYjd1ZVgxRm9lOEZVTXVqN3drRHJNd29o?=
 =?utf-8?B?MzI5YkZzWXpNQTZqbU1Ncjk5MytUQzVlSUluTkJzc0svUVg1Y1hZOVhUU0h1?=
 =?utf-8?B?RUtpS1hGRUlCSHdQalI4c0owaXVQZnF3ZGttODBlbkNzZTdnYkFTcUhNcklY?=
 =?utf-8?B?cE41MXg1RXI1OXVabTBhZU52QkcvVWMwTStHRm1acXF0SnVEdkt4L2RTMlUx?=
 =?utf-8?B?dXJnSjd5OXlNN3VwVnFqWXdveUhuVXV4eTBrMXMzQjFxdEpYUFRZWTE4VkZS?=
 =?utf-8?B?N3Uxb2pEWUUrZ0p2YVpNeUFSemI3eGc4eVNPNHBXUm1kUTVkcXdSWEVUYmt1?=
 =?utf-8?B?OE9ReGtGYy9xZlBpanNkb0JncE5lZW1Qa2wrZkl0VENkc0p0UzA4ZXFpS2F1?=
 =?utf-8?B?MXVEV1JIZTlvcy9HSkUzMCtmUjdzNUxpRE9zdmdUbzBVN1paS2ZLNlJ3Z2Jj?=
 =?utf-8?B?aE1HR0FxaXllYUlRR1FLQkJKd3F2Mnl3ZlZkNHJpNWhwRzRLVy82YUg5UWZW?=
 =?utf-8?B?VlVNMGZJb2NOMEc4a3QrM3RGcnBoMGtBR1JDdWQ1cmhiSWpHekYvcWt2RGgz?=
 =?utf-8?B?emo3Tmp4YkI3TEJQL3MzMm5JQnNkd0RVc2ZWMSs0QmhjV3N0MmFFbGhYWHBJ?=
 =?utf-8?B?WEEzanc2YWlPVzE3c0ZWVE45Q2JzRU5nSzBOZm41RFA2N3c5eGcvaDZndXkz?=
 =?utf-8?B?TXl4ejcvUmNQRW5Xc3B5QUZqTVc4VHNtdndXUHVqUWIwMnE1OW1DdnByRUpM?=
 =?utf-8?B?Tk5ydGNtSU9WTWFiaWpxTUliZ1B3eXZ6aGNsVjlXNkI3dU1IZGxJTG9jcTBZ?=
 =?utf-8?B?ZWtMd1F1TjZoaVdHQkZETDlhQkdMQll2RWUrWlhEd0xPZmZJTXlIN214akJv?=
 =?utf-8?B?eFlhcjJubUM0R0JZNEJCSkdWd21NbGpjMDYycFB1eUo3SmxtNmRnL2RzVWJQ?=
 =?utf-8?B?UVE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0237.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d18fbf3-6b40-480f-90aa-08dd6796aa9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 10:04:56.1201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZXyr7M57DSdmoV+ynzDzK45gydmMaBUwkJldImC60HoUirEqiw68DQNOWaz79YHoDBZt7bmK51LFpjO3bll9NbwAlWWc2Z3c0Zocghp6+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0113
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w_xQzgrfPJF3w1bnH3rHWpLcrTu6QCZWAZbnRztyzAg_1742465097
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <CDCFB83BC1304C42B6B2FDCA32610DE9@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213401

SGkNCg0KT24gVGh1LCAyMDI1LTAzLTIwIGF0IDEwOjUzICswMTAwLCBNYXR0aGlhcyBTY2hpZmZl
ciB3cm90ZToNCj4gT24gVGh1LCAyMDI1LTAzLTIwIGF0IDA5OjQyICswMDAwLCBSaWNoYXJkIFB1
cmRpZSB3cm90ZToNCj4gPiANCj4gPiBPbiBUaHUsIDIwMjUtMDMtMjAgYXQgMTA6MjkgKzAxMDAs
IE1hdHRoaWFzIFNjaGlmZmVyIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+
ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAyZTk5ZmZkYTcwZmQ5NWI1ZWFiM2RlNDcwNDgwMzIzNDlj
ZDY2ZjRiLg0KPiA+ID4gDQo+ID4gPiBnaXQtcmVwbGFjZW1lbnQtbmF0aXZlIGlzIHVzZWQgb25s
eSB0byBwcm92aWRlIGEgbmV3ZXIgdmVyc2lvbiB0aGFuIG1heQ0KPiA+ID4gYmUgaW5zdGFsbGVk
IG9uIHRoZSBzeXN0ZW07IGFwYXJ0IGZyb20gdGhhdCwgaXQgc2hvdWxkIHdvcmsgbW9yZSBvciBs
ZXNzDQo+ID4gPiB0aGUgc2FtZS4gSW4gcGFydGljdWxhciwgaXQgaXMgdXNpbmcgdGhlIGhvc3Qg
c3lzdGVtJ3MgL2V0Yy9naXRjb25maWc7DQo+ID4gPiBpdCBzaG91bGQgYWxzbyB1c2UgdGhlIHN5
c3RlbSBDQSBjZXJ0aWZpY2F0ZXMsIG90aGVyd2lzZSBpdCB3aWxsIGJyZWFrDQo+ID4gPiBIVFRQ
UyBjb25uZWN0aW9ucyBpbiBlbnZpcm9ubWVudHMgdGhhdCBuZWVkIGxvY2FsIGNlcnRpZmljYXRl
cywgZm9yDQo+ID4gPiBleGFtcGxlIGZvciBhIGNvcnBvcmF0ZSBIVFRQIHByb3h5Lg0KPiA+ID4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBTY2hpZmZlciA8bWF0dGhpYXMuc2NoaWZm
ZXJAZXcudHEtZ3JvdXAuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9naXQvZ2l0XzIuNDkuMC5iYiB8IDMgLS0tDQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAz
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IFRoaXMgaXMgZ29pbmcgdG8gdHVybiBpbnRvIGEgYmF0
dGxlIHdoZXJlIHlvdSBhbmQgTWF4IGJvdGggYWx0ZXJuYXRlDQo+ID4gd2l0aCByZXZlcnQgcmVx
dWVzdHMgYXMgeW91J3JlIHNlZWluZyBkaWZmZXJlbnQgYnJlYWthZ2UgYXMgZmFyIGFzIEkNCj4g
PiBjYW4gdGVsbC4NCj4gPiANCj4gPiBUaGUgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2Ugc2F5czoN
Cj4gPiANCj4gPiAiIiINCj4gPiBnaXQgaXMgZGVsZWdhdGluZyB3ZWJhY2NlcyBmb3IgVVJMcyB1
c2luZyBUTFMgdG8gbGliY3VybC4NCj4gPiBIb3dldmVyIG91ciBuYXRpdmUgbGliY3VybCBidWls
ZCBkb2VzIG5vdCBmaW5kIGEgY2EtY2VydGlmaWNhdGUuY3J0DQo+ID4gdW5sZXNzIGl0cyBjdXJs
LW5hdGl2ZSB3b3JrIGRpciBzdGlsbCBleGlzdHMgYW5kIHRodXMgZ2l0IHdpbGwgZmFpbC4NCj4g
PiBJZiBhIHJlY2lwZSB1c2VzIEFVVE9SRVYgd2l0aCBhIGdpdCByZXBvIHVzaW5nIGh0dHBzIGFz
IGl0cyBwcm90b2NvbA0KPiA+IHBhcnNpbmcgb2YgdGhhdCByZWNpcGUgd2lsbCBmYWlsIGZldGNo
aW5nIHRoZSBsYXRlc3QgSEVBRC4NCj4gPiANCj4gPiBGaXggdGhhdCBieSBkZXBlbmRpbmcgb24g
Y2EtY2VydGlmaWNhdGUgYW5kIGdpdmUgaXRzIGxvY2F0aW9uDQo+ID4gdG8gbGliY3VybCB2aWEg
Z2l0J3MgZW52cmlyb25tZW50IHZhcmlhYmxlIEdJVF9TU0xfQ0FJTkZPLg0KPiA+ICIiIg0KPiA+
IA0KPiA+IHNvIHRoZSBxdWVzdGlvbiBpcywgZG9lcyBjdXJsLW5hdGl2ZSBub3cgdXNlIHRoZSBz
eXN0ZW0gY2VydGlmaWNhdGVzPw0KPiA+IA0KPiA+IENoZWVycywNCj4gDQo+IFVnaCwgSSBoYWQg
dGhvdWdodCBJIGhhZCB0ZXN0ZWQgdGhpcyBwcm9wZXJseSwgYnV0IHRoZXJlIGlzIGluZGVlZCBz
dGlsbA0KPiBzb21ldGhpbmcgd2VpcmQgZ29pbmcgb24gd2l0aCBjdXJsLW5hdGl2ZSdzIGNlcnRp
ZmljYXRlcy4gUGxlYXNlIGRpc3JlZ2FyZCB0aGlzDQo+IHBhdGNoIGZvciBub3csIEknbGwgaGF2
ZSB0byBsb29rIGludG8gdGhlIGlzc3VlIGFnYWluLg0KPiANCj4gQmVzdCwNCj4gTWF0dGhpYXMN
Cg0KSSBkb24ndCByZWFsbHkgcmVtZW1iZXIgdGhlIGFjdHVhbCBzZXQtdXAgSSBydW4gaW50byB0
aGUgaXNzdWUgd2hpY2ggd2FzDQpzb2x2ZWQgYnkgdGhlIGNvbW1pdC4NCg0KSXQgZm9yIHN1cmUg
aW52b2x2ZWQ6DQotIEEgRmVkb3JhIGhvc3QNCi0gQSBTUkNfVVJJIHdpdGggZ2l0Oi8vIHVzaW5n
IEhUVFBTIEFORCBTUkNSRVY9QVVUT1JFViAod2hpY2ggd2UgdXNlIGZvciBvdXIgbmlnaHRseSBD
SSkNCi0gYElOSEVSSVQgKz0gInJtX3dvcmsiYGluIGxvY2FsLmNvbmYNCg0KV2hpY2ggdGhlbiBm
YWlsZWQgdG8gcmV0cmlldmUgdGhlIGhhc2ggb2YgbGF0ZXN0IEhFQUQuDQoNClBpbmcgbWUgaWYg
eW91IG5lZWQgbWUgdG8gdHJ5IHRvIGdldCBpbnRvIHRoZSBmYWlsaW5nIHNldC11cCBhZ2FpbiBh
bmQgdG8gdGVzdA0KZml4ZXMgd2hpY2ggaGVscCBib3RoIG91ciB1c2UgY2FzZXMuDQoNClJlZ2Fy
ZHMNCk1heA0KPiANCj4gDQo+IA0KPiANCj4gPiANCj4gPiBSaWNoYXJkDQo+IA0KDQo=


