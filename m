Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1740C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:56:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2933.1787910969768022415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 02:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=OSc8SPeB;
 spf=pass (domain: axis.com, ip: 52.101.66.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5EzX8kMTq6NAdBGfNm9voJcmuLn8zU/2tdwSGx+3PN6hFlDCuJtzbH9bKOMgYPgdXxYfWOgROLBMhv/aXPxoeL9wtcO45lzSwH72zQ1dd9ub/bsXkH9iBN5/xZqJi45D7FuTr4pdmL5lIUG30A9QgBQ+Q6r+xiOBN3o/yEPYuDptjV8PvPvOAeg+ouJ7i3zUbjq0MKpiPIpWnlP0uhhWIH0hSZMKad4abShDtzxOlLVCrKw/CM7DA4PCzJH1ghExCY6/QXNJzrVI+ry+npS4NxK4Ot2K9t5yz7DLllE7e4W4rSGmbjM4DVP1PMlKEYVywskYlraFsPVBtCIDCqCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NDOpdgk5MgtSVVJtkII5X/M13BQReoHZexGeXXSPCE=;
 b=AFo0nAJ62vVBkWyzB18nfXnmujK3smIJ1Kc0FmmwbFKK7zTek6Eh7H/Qj7SLpk2cTKEjLw5lphoWoAZ1pi3ieM32TFUNZzNMokaCcatcn469wyr6QYAOxYd+nmg9uecvEpO2MwJhCVcsPuhlHxRaz9pZuIJKwxKQS4QzteKicWfw+b9IZDJEfpmTEudrSztQbS/+b5navE8GLETRZx1KudDd41/LTqhuE4v/d6obhzx22tIRD5XHSexZlnOZyXWHDjCeyHmjeH4LdLIKIT2jv48fQVMSgh8oCvScnQq2rn610NZHl5JOxc2o4uQbIqv5Vs0os7wLisRaXMulfOH/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NDOpdgk5MgtSVVJtkII5X/M13BQReoHZexGeXXSPCE=;
 b=OSc8SPeBe4Nraeb6jh0cVrqLY/CBnlSdNcyvQYXif6pzgaHl8Ztl2VNtl3/2GZaFdiKLQiXJTXuSc/fn/Q9oUjrSnfwFNncF7kae0OqJlSOBxF2CKjRTbJ68QYGJWGkVriRXukPhGQuC7T3G6KAXO24Vout6q8VvQD1dt5qvhmg=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by DB9PR02MB7051.eurprd02.prod.outlook.com (2603:10a6:10:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 09:56:05 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::670:3815:35f6:ba2c]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::670:3815:35f6:ba2c%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 09:56:05 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 5/5] documentation.conf: Remove the
 documentation of GROUPMEMS_PARAM
Thread-Topic: [OE-core] [PATCH 5/5] documentation.conf: Remove the
 documentation of GROUPMEMS_PARAM
Thread-Index: AQHdNgXADDtrXKI8V0qpHdk+rzs9b7azOTtA
Date: Fri, 28 Aug 2026 09:56:04 +0000
Message-ID: 
 <AS8PR02MB10201E685F801F98E13931D59EFAC2@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20260825180805.2990506-1-pkj@axis.com>
 <20260825180805.2990506-5-pkj@axis.com> <DKZM86VB7FTW.37NETKKH4808Q@smile.fr>
In-Reply-To: <DKZM86VB7FTW.37NETKKH4808Q@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|DB9PR02MB7051:EE_
x-ms-office365-filtering-correlation-id: d93c8391-a36f-42d6-e7a2-08df04ea9361
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 HDBwERIeULi9ottivfdsKQYGnTK41uhnorxFIxHR/Lxzk0hV1AC0FWri93AVpnHa5dsFj0fDLqeCy1nOv0FvYLPl+CwrpWy8uRIPZVetPS47QBAEpneWVyHJC6T0b8/NH/BcqcwWo6qqLAoaZnPy6CWG/d/Bq2JeXlhMKoyTmUNe8tGYBormYvciKPAVacsGaaig/TwKMRK2RnOPaPS9fSc803fVSQ0ZmQLot+QMWZqiZaIubRruhiV6xEPizgvluUVu1iUNtsIcYqkoKRGYrl0iUz0Ly4OXDi7k5Vh1ZpP9Sc9JsiBtWthjI5mpepNAm8lgrJEoRDb7h+pwTNgZOPBsqYFsBxRRPyykniR0SqwRbAQFesjkWyivDeWBplCU2ofMLaKzZ5DXxeckkJOMxBOSawqrUcNTCWvN2CciLQktM/O4C3hoLuDKUqq65KWPuNZBxFj7R2CDE3MjuDqnDNUS7rMokFFoRuPLP0LGLHgD6WutrPlI7w7uw341mWcfdQq5xNIVwld/8AOgUpJuxldEsiMaIziaj2JokqcXQGwWVP85fGU5jRjzuiO3l4RP0HrzjyKjFvr8v3rIgVwZW0rynyctmm9cAClCb0FHlDaAT5/+GqaRT+lxN6HAywsVv5SCtTHDvso1Y2yg1bDj0gZEDPjdPCDv77OPvTmTSwOE4SXIxsZppI1la7p0Phhp5CrolmXoXMgu+pwjtS9TTv/fz14wINGMBwSv1GvykkI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWh0Wmg2b1R4d0dCcFRkM2xJYm4wV1RnQ0JDMC90bmZiNXpVWFZvb1V0NGlt?=
 =?utf-8?B?NDAzenExRDdWWmpWd1pLWVBqTnQ0R0VnQmRhaC94ZUZVMW1qdTRlZjFWdEt1?=
 =?utf-8?B?NXFmRDN0bkJYSmNuUmtnNUJJZG9sY05pVUNLMkJSSUFJMEZDMHpJTG54L1lP?=
 =?utf-8?B?ZFh2WTA3UVh4b1FIM29aMXdiMWdJc2V2VTZ6Nnh3MnRuTVc0YVZZSFkvMmxR?=
 =?utf-8?B?SnhYREMrR0g4N2ZqeS9kSndKN2FkYlVDUlZNTTdiWlRPQUZ1ODAxRFdNYnR3?=
 =?utf-8?B?Z2JHcWtQNkI2cndWdzJKNGdoVUlkd1ByMzBuTWk0ZGEySzlQenUyTmIvN3Vy?=
 =?utf-8?B?WkN0aGx0QkZCNCtPV21RNmF5Kyt6cDJoTjduVUpHZERvQTFnUGVCZlZ6d1ho?=
 =?utf-8?B?aEFsOVF1cjdESUpHdytSRHBKRFBWWGxWWGdFR081SVFPRytPb0FjRXdSNjNs?=
 =?utf-8?B?M1ZydGlwREJrd1FnRDU3MDRGNkx4alA1RUpWbGo0ZzhxMmFWODVacEovamtD?=
 =?utf-8?B?amRrYk1nKzlGbTJTVHJNOUJtRWExWi9ic0hVTVlNSENhTzRmbXFub0syUEV3?=
 =?utf-8?B?cGtSSjlGUFRtMjhDNXJhK2NjNUt3ZDhXc0lsbGVTOUo1V1BsREMzU1ZYMHVy?=
 =?utf-8?B?MFlFT3podm4rYVp0L2ZET1k3YmJMM0dLSzZsWldKQjlUMEJSNVROTHdkN2Fh?=
 =?utf-8?B?L0t3ckcwRld5V3RzSGpGYWhlVDYrcExJLytEaStHT3pvNEJudms0U05mSnVY?=
 =?utf-8?B?cmxUdlJXdkI1YVpWQ3BpRFN5aGw0N0hRVXFCRjRoMzk4cUhGZlNMYTRycEdq?=
 =?utf-8?B?VmN4U2dOeG5oOUo5MHZhZkFrY014QWR0blJ1dE1EMVVqQTZrQkg0WmxQUXk4?=
 =?utf-8?B?NXppbXVlN2RUbk05M1hySG1LdU5iWkg0MTFGRmIyY2xHK3BtUWZ0UGNWeG8v?=
 =?utf-8?B?UW1OcVRtdUdDR2RpcmZ3ak81bC8rbHRwNXdMMXE2eXZZM2JXclRHcXBBQW0x?=
 =?utf-8?B?ZytILytYeUVuNWFCenZudnJsUW5MYzRWT1JXK2Z2ajltUUd1RGVNOGcvVTlh?=
 =?utf-8?B?WitRMWhRbjBkbTZsRnRVRkxSNmRGQ3R3ZzA1MHN0cXNFZnhaT3YwSWdzbHJL?=
 =?utf-8?B?UkwwOVFFN3BHNGJNdzhVZSttYmVKbUd3amtaekVudUg4UDRtR1NET2lZOFl0?=
 =?utf-8?B?YkJkc0N0QmRwR2dXT3REZGMxR2RSZHVod2UzaGZaZ3pMUGE3L2VNU0VER3Q1?=
 =?utf-8?B?TDd3bHQxUmg0YXRnSTU4VXp0cCtRMHZxRHNZU3RSK28rVnE3Z1I1dnZOQS9P?=
 =?utf-8?B?RnNaUU90SXczdlJNVXZ6Q3RrdCtlZ0Y2d2hrNWFjam5Sd2VoZ05uVmhkdHZu?=
 =?utf-8?B?T2ZLbUpiU0JIWWtEUWF3dk5DSlZJeXVjVWZKekIwWFVZTGVrb1kyZ2ZhNGNK?=
 =?utf-8?B?OGhWR0pVMUliakt4SGQwNS9IT0ZUZWU0RzJXYlhDQlBuS2Z4c2Q3TUxLMUdJ?=
 =?utf-8?B?QnRrNVBEZzA2NGg1VWExelgzWUw1TjlqNmhwdnV0UXhjS0tkUEtxS2IweVRl?=
 =?utf-8?B?SGxEMXAzay9WM2lVUnlWd1I2NVBNUm1OSXBDTXJMRjAwZE9HcndYL0orMERW?=
 =?utf-8?B?MGhVZUFBT2JuaTJ2MjFDdTQ2SzdtcjYzR1czaENjbHBMb1oyK0hpRld0eVBF?=
 =?utf-8?B?NVJyUnV4MWZaWmlqcm1iSGNlTUNHSEtZZEhvZjVmQUEvYWg2bG9sS1VMdEpW?=
 =?utf-8?B?TmxFNzdmZERtLzBSRlZwL1NSaDNIMjcyTElJSEdDNDEyVUdCRzBtaEZLTU9x?=
 =?utf-8?B?OHpDbVZ4T1BUcnJucVVmeE1SV1ZyZHg1c2hyWDJHUEdwMlZuR0Q2U0hWVmpI?=
 =?utf-8?B?RCtOdEhCREY3SVJsMTRFU3ZCeEg4K2VNZzJXam5rNUhrV2NVVzc0UnFrL21K?=
 =?utf-8?B?V1Z6SVdlQUpzdFhPRnNENzRDZVRkZ0pRVmJuVk5pNGlGVGRJeTBvRkdjR0d5?=
 =?utf-8?B?UnovbTlqNmtBWkRwYVovTjBjd2ppaitNYm5LS05GZ2J6dW1XUTBSUW4xZmFp?=
 =?utf-8?B?Z3lzTUt4ZCtYbjZVNzFhaUxBOUlOZFVISlpaV2ozaldQQlBCOCtwZWVucWhw?=
 =?utf-8?B?eG15NUhjZ05za0JJMEc2VXJ1KzBUckttMEJ1bDF5SHZBdDZMbDhFZXhPbFlB?=
 =?utf-8?B?SkdjRlN4MGZrOWdnd1ljbGJsTHhWVTBOQWRQdmV0Sjloc0krRlphVUlEanlm?=
 =?utf-8?Q?GaENIX8z3h8XjOnvZtBx383CDBoEo/Qhf7N2ziJPdU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93c8391-a36f-42d6-e7a2-08df04ea9361
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 09:56:04.9903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYp78H7BjwcQ+ouwe4PKYQtqhGxls9e/heAIsJIwfdRg8df73qLDVs2BilW8ZTVJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 09:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244528

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZb2FubiBDb25nYWwgPHlvYW5u
LmNvbmdhbEBzbWlsZS5mcj4NCj4gU2VudDogZGVuIDI3IGF1Z3VzdGkgMjAyNiAxMToyNA0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVu
ZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSCA1LzVdIGRvY3VtZW50YXRpb24uY29uZjogUmVtb3ZlIHRoZQ0KPiBk
b2N1bWVudGF0aW9uIG9mIEdST1VQTUVNU19QQVJBTQ0KPiANCj4gT24gVHVlIEF1ZyAyNSwgMjAy
NiBhdCA4OjA4IFBNIENFU1QsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj4gPiBUaGUgR1JPVVBNRU1TX1BBUkFNIHZhcmlhYmxlIGhhcyBiZWVu
IHJlbW92ZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBl
dGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jb25mL2RvY3Vt
ZW50YXRpb24uY29uZiB8IDEgLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0K
PiANCj4gSGVsbG8sDQo+IA0KPiBJIHRoaW5rIHRoZXJlIGlzIG9uZSBsYXN0IHJlZmVyZW5jZSB0
byBHUk9VUE1FTVNfUEFSQU06DQo+IOKdryBnaXQgZ3JlcCBHUk9VUE1FTVNfUEFSQU0gb3JpZ2lu
L21hc3Rlci1uZXh0DQo+IG9yaWdpbi9tYXN0ZXItbmV4dDpzY3JpcHRzL2NvbnRyaWIvY29udmVy
dC1vdmVycmlkZXMucHk6DQo+ICJwa2dfcHJlcm0iLCAiUlJFUExBQ0VTIiwgIkdST1VQTUVNU19Q
QVJBTSIsICJTWVNURU1EX0FVVE9fRU5BQkxFIiwNCj4gIlNLSVBfRklMRURFUFMiLCAiUFJJVkFU
RV9MSUJTIiwgIlBBQ0tBR0VfQUREX01FVEFEQVRBIiwNCj4gDQo+IFRoaXMgd29uJ3QgaG9sZCB0
aGUgc2VyaWVzIGJ1dCBtYXliZSBjb25zaWRlciBhIGZvbGxvd3VwIHBhdGNoPw0KPiANCj4gVGhh
bmtzIQ0KPiAtLQ0KPiBZb2FubiBDb25nYWwNCj4gU21pbGUgRUNTDQoNClllcywgSSBrbm93LiBJ
IGNvbnNpZGVyZWQgaXQgYW5kIGZpZ3VyZWQgaXQgbWFrZXMgbm8gc2Vuc2UgdG8gbW9kaWZ5IA0K
dGhhdCBzY3JpcHQuIEkgdGhpbmsgaXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHJlbW92ZSBp
dCBhbHRvZ2V0aGVyIA0KYXMgSSBleHBlY3QgZXZlcnlvbmUgdG8gYmUgdXBkYXRlZCB0byB0aGUg
bmV3IG92ZXJyaWRlIHN5bnRheCBzaW5jZSANCnllYXJzIGFnby4gQW5kIGlmIHlvdSBhcmVuJ3Qs
IHRoZW4gSSBkb3VidCB5b3UgdXBncmFkZSBkaXJlY3RseSB0byANCkJsYWNrc2FpbCBhbnl3YXku
Li4NCg0KLy9QZXRlcg0KDQo=

