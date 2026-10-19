Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38675.1792426671733927516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 09:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Wx4WkEv3;
 spf=pass (domain: axis.com, ip: 40.107.162.12, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/hMfw8Qb+ov9pBOfgV4cqdtWCv4qMnzWjlZp9V3U8QTx8lHDqqyQ+/jDh6aW1p7w5ZA/dEFbil0CzALcJ0XNvz3nMHJ6L2P53gdIaH7sGMeQ52vpCJYLGb9YX0PpdCa4388vGZpSvZNmyos0Cu1Grpywn0ZEosYh74+V75/1bwkoTe/DSwizAbfrQSE4n7a/XtqTdA0MAvPLQGCGyBVXrP6jA+GveQTkFy+wBVLKI2sEhN7tij9S25bl37LXrs7bJ0S91jQLMEl2HiU7cWevCXpfs0CVmBYHh9WAFoPpjf6Ks5iDQWlwXcP1QeDuDiJivEn+QBHM5icWqYo/VprRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0W8Gxcrnoa4tjj4UV7RW0dTDF9lz3yHGe9Vs+roVwU=;
 b=m0D9dP3zggs0w7An+O2Lg/viv0G4q7JG5hJeWU5xHf+ZrlBqcfwA68MM3RtMQBc/sSQA6VLH42NXfqTxYnkwaNF02OFn6HGsK9tKMmbzFdN/mCii9Shg+R98LbRvUSe7WaYAlalyuchmRwX98POWLCvF10etMvz5+CqTP32R6swXPn+m5K+IrPjcXoXsOHirtnF1uX5OZCAWffQiz2zB9VKPP+4SbC0AfGxSZ3Is25o4WZEOyEkfkDapW97OSqQ72c764Tbfj6qwDWs1EabTHLeKrQWUdgUiesOjX0e+Oh8x0wW5/rGGpaT4dKI4wqJZRSefy+rxe4UCl9LBF22GzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0W8Gxcrnoa4tjj4UV7RW0dTDF9lz3yHGe9Vs+roVwU=;
 b=Wx4WkEv3pMPQxJlCcp3YQdyO15wHk22FR1820EGSPJCITqcCRjhFKvtwMY8PV5jCJVq+/5s0bZhpazoethKedjdo7mgDLMe7bR582q6uxCZC0q7Cqs7Nf0My48topn+oaeHaDXRxkyYg/JZ5INGdURKnDVRv3Wo2bdYtO6cVYCk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by MI7PR02MB949035.eurprd02.prod.outlook.com (2603:10a6:290:107::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 16:17:47 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 16:17:47 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [master][blacksail][PATCH] stress-ng: Inherit pkgconfig
Thread-Topic: [OE-core] [master][blacksail][PATCH] stress-ng: Inherit
 pkgconfig
Thread-Index: AQHdX8y9JrEw5VeAw0mhAYBVBGTKcbcFCXyw
Date: Mon, 19 Oct 2026 16:17:47 +0000
Message-ID: <DB5PR02MB10213A79139833095C2138813EF982@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261019125142.3407486-1-pkj@axis.com>
 <DM8UGZKR7J6J.1VNILIXTWOKFX@smile.fr>
In-Reply-To: <DM8UGZKR7J6J.1VNILIXTWOKFX@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|MI7PR02MB949035:EE_
x-ms-office365-filtering-correlation-id: 459d051a-e116-470d-09fe-08df2dfc83b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: Xw/yiI9Faa9w1LjHysSPSFPdaGbHoSi55TLeSUkAfRNIiieSkvuXLVNOPR9FTezEdDt9K0YMdJZAy0GztzFSmw7+xaZdfFrzsvaMLhwcqAzEdqwi/Nvi2UGC8/+VQWY5rFxcQbOiwYq5yqq9VgyAlJ6OdCuAGrK1HnXgfiOD98/wMBguv/HUA4LGN2fJkI+V867XeViHiXTXCLTsx08h4bbQLvOuynyxUwQANHlnz1d2b6Xzy23gvQaDQyaO+MXNAeTtV3r8cxvtBP9SCpdk0vxfX9ngo/Ood+OMlFRRtcO8MJSxaS9QSMR0IMYs2zT/5deaSE3IUNY3MRekHIFCq54k2OmDp24t2ch5Ax8vVCUl8QddkD0L9uupbF57GdnOB2+x7VnWpy0JK+DztI6tM4Rt0NmBaRnNz4wWBJGWbr2bwacAg/rP5mnKJpM/UK/4HpIOY5wGDNwO1y7tS0EGO20sk8EbzSVm3MDYVyrc/8JqW4Xo1SatHXr4w+tg8at2QVsXPU0hi8TTZsuuIOYV63ZegaB91iVKZxrm3lgJ84lX8y+uAan9srSZDkNevrL4wNe6+Vj/OLJIpc1REDJRPdbL4kw4Z552JOrzboKYLsBogn+9NAvlBGdiyzwCCUY/8ZNfzxQzW3j88M4C21NCSS7Ub3JcmQ2olf5JUf7IJ+oUMMqP/siI+T9IEQqF5fJ5GObIc60Aapht1HW2eb2gdK0NmOUbHIwIxHEyJtkE4Z0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2N3RDA2OEl3ZkxZM29TTHJMd1NPUS90Z3BJdEwrWjlaZmR5Uy9YVlRIek9t?=
 =?utf-8?B?bDBzVEVIMmN0NVY4UC9OMWRHMythdWVQU3VnRHd2L2dBWWo0NjlXMkNGbi9B?=
 =?utf-8?B?NzBsK0dWZmI3TGFndWEyM1Y1MWlWcllVVjZDcW42ckJLWGVFN01kZ2toVE5F?=
 =?utf-8?B?Vmpxa0NnU290Zk9vNC9VaWtEbnhKYmoyQTdySm1BblhSS0lCQ3BKZVlBVmVo?=
 =?utf-8?B?VVVtUElsSUo2ZUVSYzloU2RBUjgzRGFyc2pUaGZqMUJkS1hIT28xMUpmRGc2?=
 =?utf-8?B?NHNScmpZeU9hQVYxbGMwejBGM3ZEOUtXRjVXR2R4Q0k2YW8zTmF6MGp6Nkpp?=
 =?utf-8?B?SWx4TVlzZGdyWFI5alozalZSK00va1hCbFhTeWd1L2FXSG54NW5sTmZuZ1hv?=
 =?utf-8?B?QlNGZmd5WXBMT0pHTjVCN2pwSjF2NVgyOFlGSnNIQnlVR0VhNWdFWUhEVEFH?=
 =?utf-8?B?cEdFRjBPREh5SVdQVGJkNW1IbW1HNVpjMzhCd1BhOFllQit2UzdNVnlQSFNE?=
 =?utf-8?B?QVQ4WnJlNDhRZ3FLTnRML1Y4bm9ENFQ4ZFhOWnFoRlIrUW5ycVlCV05ZTzlW?=
 =?utf-8?B?Y01veGN5bFhjaVRIdFJVQUtEdWlJbVR1cDY1emJyS1RyNmk0YU83Y0VsTkZn?=
 =?utf-8?B?dTkwODBsZWFsVi90NVMxL2RRYW5wSHpEM3g1VW9sVVNvekxuQitRWkNlY1ZV?=
 =?utf-8?B?ajdxMUtCNWw3dUhndS9taGxIUnNGSUNuNWViTWVMSFBJQ2c4RlhTL3hlWTE1?=
 =?utf-8?B?ZmRtR0U5dlpycDlZVk9JclZWamlNZzU3c1E1ZnQveFdvZkVJdWRuVDlibTQx?=
 =?utf-8?B?MUVFNHFpazJzamFFUFBOZ2V1RTNsWk1mdlBwN1pibDB2VDJoUVJLQWw2bWZm?=
 =?utf-8?B?MnRoZmNRYVo0amxOWVBqRzhiNllDWHlsa1IvektHVmhQd0tuVjJDY1hRODRa?=
 =?utf-8?B?OGIwbXJmY3FWRDhKeWxBQW54ZSticVloVXI5VWpYT3VFNUs4Qm55NFJ6blZB?=
 =?utf-8?B?VE1qaGpFL2pRREN3M1hCbWY2THMrNXB6QkdFbFU0WGpybWN0eklLNjhwZlhB?=
 =?utf-8?B?M0NTSFBwa01RaFFEbkNsWlNVOTJTRThtaHhtTWpXVDhuOHNwSUFYOUxKcXFo?=
 =?utf-8?B?NFplamJMN0pvK2tpL2liWlN6MzBUejJTL2dwajRvRnBQNlR3VHNPa0FmaExt?=
 =?utf-8?B?VkN0anE0TXdoVVkwU3FsSHBGUTVPQTI1cjE1R0lDUm1wU1JFeEg3a2RydzBD?=
 =?utf-8?B?UTNCSHk4Ui9UQ3hDQmJFZ3IwTURPYWNpc3lxWXNSSWVBYi82MlVGYUllOWY4?=
 =?utf-8?B?S0wrb3RHeHdENVpBS0pIMkozb3BPWXVZSDJKUFp0U3hYSVY2dHp1TjV4a0dJ?=
 =?utf-8?B?aEduSlNIQldFcllxR2xoTE5lTDZFQUpGMkRGSHlWRGtTRmI0UjM3MWJUd0R4?=
 =?utf-8?B?UCtmeHl6cDBpcm9QNzFSQlpENnVyQVBzbWxVY1ZRVUFNY1BSdytRZGRnbXhr?=
 =?utf-8?B?em9NNXZQVHMwN09IM2NDL1NUNkQ1M2wwVVNnVmRXWkpDNW8wVyt4RVJGVmRD?=
 =?utf-8?B?MWNuYS9yRzBHenhWNm5JMWFEb0JEYjVNRW1jdTdtQlhJYkprSThSZElsaVZ2?=
 =?utf-8?B?ZXo5MDVUdUhJMVJtMXhkRTdaM1ZVRFM0NmhYbVJ6ejNiWTlNOXZwdGJBV1Rh?=
 =?utf-8?B?aU96UXNuaVNjdEdXVWlJSjM4enhWbkszOFJiTmIvMEttRUxnYTBMckQwRXRl?=
 =?utf-8?B?QXJMeW9XMjQ5U1dyNHFLS1VLb1ZYSDhQWGdkTHllN3NSbGJMQmNRYmdrU3Mx?=
 =?utf-8?B?K0JmUFh3YWFPZ2FmcVFxVmV5SmozTGFnN01aeFVkWUVjVGt6bGRPY1UwcU5F?=
 =?utf-8?B?VU1UTzYxWWVPTmdhN2xSb0NxeTNlMTdweU5PUVM0RC8yYXlhcEsxcEM3ZVRk?=
 =?utf-8?B?V21Rd3RNTFQwQythMEI5R1VWcXBERytpMk5zbDBsdFBqQ1Q2WkpVMTlGaCtu?=
 =?utf-8?B?K2V2MC92M253ekhEU3htZWl2aWFlcHBxYXMxWlZ4QXRVOGlYbHFJOEgvQ1Zv?=
 =?utf-8?B?aVdkWGI4aVI0UFExOWRlQUZ2d1VtQVhMSVFhSlZVL3BDSDJuZ012ejZzcGpz?=
 =?utf-8?B?cmhsS2xBby9GcDdwVjVSaXY1a1kxa2h5SWF1V1NGMVNsYUJHM3NaQ0d0V284?=
 =?utf-8?B?SWhWZzFJRWszblU2SDF0NEY1MFo2dXhZM3NWaldsMEZORWV5Vmo0NjdNdGY1?=
 =?utf-8?Q?Q0vCTSBVXEVrIdz7QEsoFPpUHuRTtN5XJoFJl1uiLk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459d051a-e116-470d-09fe-08df2dfc83b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 16:17:47.4067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vg8G4n789HhxhJI8S4870FJIUP35nxZCw7ELLSswViVMPae1wj0Wd+egnSCUMV5V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR02MB949035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 16:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248196

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZb2FubiBDb25nYWwgPHlvYW5u
LmNvbmdhbEBzbWlsZS5mcj4NCj4gU2VudDogZGVuIDE5IG9rdG9iZXIgMjAyNiAxNToyMQ0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gW21hc3Rlcl1bYmxhY2tzYWlsXVtQQVRDSF0gc3RyZXNzLW5nOiBJbmhlcml0IHBrZ2Nv
bmZpZw0KPiANCj4gT24gTW9uIE9jdCAxOSwgMjAyNiBhdCAyOjUxIFBNIENFU1QsIFBldGVyIEtq
ZWxsZXJzdGVkdCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBUaGUgdXNl
IG9mIHBrZy1jb25maWcgd2FzIGludHJvZHVjZWQgaW4gdmVyc2lvbiAwLjIxLjA0Lg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcv
c3RyZXNzLW5nXzAuMjIuMDEuYmIgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMjIuMDEuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjIyLjAxLmJiDQo+ID4gaW5kZXggNTQ4ZWRm
MjkyYi4uYWRmOTMzMWNkNyAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3RyZXNzLW5nL3N0cmVzcy1uZ18wLjIyLjAxLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4yMi4wMS5iYg0KPiANCj4gSGVsbG8sDQo+IA0K
PiBtYXN0ZXIgYW5kIGJsYWNrc2FpbCBoYXZlIGRpdmVyZ2VkLCBibGFja3NhaWwgaXMgc3RpbGwg
b24NCj4gc3RyZXNzLW5nIDAuMjIuMDAuDQo+IA0KPiBJJ2xsIGlnbm9yZSBbYmxhY2tzYWlsXSBm
b3IgdGhpcyBvbmUuDQoNClRoZSBwcm9ibGVtIHdhcyBpbnRyb2R1Y2VkIGluIDAuMjEuMDQgKGFz
IG1lbnRpb25lZCBhYm92ZSksIGFuZCB0aGUgDQpmaXggaXMgbmVlZGVkIGZvciBib3RoIG1hc3Rl
ciBhbmQgQmxhY2tzYWlsLg0KDQo+IA0KPiBSZWdhcmRzLA0KPiAtLQ0KPiBZb2FubiBDb25nYWwN
Cj4gU21pbGUgRUNTDQoNCi8vUGV0ZXINCg0K
