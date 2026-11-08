Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.382.1794156715035137619
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 08:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=kDPh2Muz;
 spf=pass (domain: axis.com, ip: 52.101.66.38, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gr5EI/CNJFbsViku3NHRCKZBJL+AYfRM9lnOLRaC9s58l8mkTZC3oAs7ms8DlBklPBgRBcEvgG3ed+0tc7AVlqkrGtPl+jW7rLuH/ZZ+r96jy605jkWrvkpjgSaNXDVZPBOwxdsGVGcAKfw+618EoF5Iz0jgVKyvk8eV/Qek9qEPZ3J9Fmk9a8EwIYD13JnW1Ny3GcVddVkvgz9QaDuJzhdfA+CUPELga1jGiaDsaSyfViANNR41HMLIshFL/PsFgZXvO0ZkQw3LWmol0+BTkqH8LcVA6yOPOi4upyQEn7iQ5pxYBwcRNNQraYwlfzgRmHhVFfjXh/DRh27PlLT1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=016+ziRDrT5FcibHfv1H1NTCh2kpaKCERT2CxfcHlEU=;
 b=sTyYIK5vEErA35kFCnuNnNkVZa9WUS7eRroEBmt0RM1wO1Az6KrKTeD2y9LoaSWDHDSRncZBKrcILRzFla5Y0mDmbjGWZQ2cNPGXpNVYYznPrUxfKk6/uMsFxwUJNO2TCs5GVA7FfJxK+P3n3f9cpjAZC233fzHQ3wwSjLd91xbxTYy7IxnEwP+y4SIApc1HMZcEDaqXtSgt2rWE6taOkKYwSmrn6ViV3n6KbhVH5wjr2g73qSskNzPqg7NOltDjnGoCm9EYblvxgi16pIN8XUhqpKTM/qi2yolIC3kPKdyDVJrhgngl4cv10D9YLcMGNGu/YmsZ+1YGndTwefQD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=016+ziRDrT5FcibHfv1H1NTCh2kpaKCERT2CxfcHlEU=;
 b=kDPh2MuzbEaOfRJ8HTSec/+PUgibC014JeOrsvJYlMqCrsTH4mHSS7vZLbS39Yv5dC6N7xILaCvv7JODI4rX0JLDwKecV30/ZZBqxkJ/nQY+Md+vfJ3bT4BDwuAxhOYEfm7kfEnsWdYdnAQI3MiwHxQtcf1VH/UhJQK7Y/f22OE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB8PR02MB5945.eurprd02.prod.outlook.com (2603:10a6:10:11f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 16:51:50 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 16:51:50 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] libzip: Allow support for bzip2 to be
 disabled
Thread-Topic: [OE-core] [PATCH 1/3] libzip: Allow support for bzip2 to be
 disabled
Thread-Index: AQHdatODOjUNc57lVEGvGeoHE5Rwi7cfh66AgATkXjA=
Date: Sun, 8 Nov 2026 16:51:50 +0000
Message-ID: <DB5PR02MB10213425AAD6C58E8D300C49EEF742@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261102140700.2707257-1-pkj@axis.com>
 <EB395024-F1FA-4B28-92FF-25772374910D@arm.com>
In-Reply-To: <EB395024-F1FA-4B28-92FF-25772374910D@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB8PR02MB5945:EE_
x-ms-office365-filtering-correlation-id: 434884fd-cc7a-4f1e-e1dc-08df3db89594
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|4143699003|56012099006|261022105027099003|261026135527099003|261026140227099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: s6VJoYMLeDkhHAtmiKMWGiiQeV+/KJT91IZx3g3WlggD/1jxmn+ezsSkcJqG4n1mmZBTSDPwu4hP4MhCvVvqDg9EUylQV+FLmFBdJ4Y8UdVG53I4QofuWmcjlK3a6YN3CiD209FEivesD1INqLcvVIMTJ8ldVKHvlyMoqr56jgjW3294smiEPHG5oyPoh3Ugzjy6Ut9XJR5UAJJHtnrJtSZVNAkxmXu/TRctqu4TNUu0K12X1Pv0Aain2BO4npMfNc6Q4N9fOsqiaHOM9Uw+ON8CrdRzuG59jZ/c0krZC+ZIa/i0VXRv8DfIX3YyOObKSXEx/gVEdhi9W6rX1Y2LffVMyFdD4g9zeVMYPk+U8uHdzHD8fhZL0thjhtvv81lxc55FNCC2gCngXvRz38s5i6xWPOUhXQV8FKqblezjZbVgJSd3paWwuYR2Pqf3gvsXoQgZYoUZKHCGYK0GH/Wr0Fj0Z1QtFlmPL6WIeleXQeDozdMqFXwLKyFR7QbQznl/5Vz3zRxgoh+1TUKXqPcxfHIUgrkyLyiAkEezek+gRKLTrvlj/ge0i6MKuirOUB4w3jaFrIGK8u4YyzuEXGSwNLZjaIXc99gj3RlDDYdyf61cnQKR/MEVmNCj/3/ERt7aeffyapqHXRRmi8TKCI8AjHbZyoypV4fkdKMiY9ajrXfAGcPYBvDRNFPY96zybvdtvqZTbZ5T0ujBQHvZr/NHt6V7jChYqR8Z67/Wv3ntnUk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026135527099003)(261026140227099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjhmcHFrVFJOMEhHRkZjLy9QRWdBdm4vUTVqOE9LS2JYRVpvcXluY1dTN0dT?=
 =?utf-8?B?cWEyWk9GMktFNGVaNVVTTWNKOXJDOVBlSHQxL1IvOXpOOXhyN085WWtsRXBU?=
 =?utf-8?B?dnJsTlVvWk5ranF4M0p4Zmg3TFF2MGJBdGdWd3MwY1ppMjVsUUMwVU82NXF6?=
 =?utf-8?B?ZDRDVXg3NDIwUFUrVTBqMEtzQ1NVV1o0aUxORXprTGF1dkJPR0duVE1pRmxH?=
 =?utf-8?B?RUcyY0RINWVreHozV0gwemZsRmtSdmNKenVKbGZENDU1MWRwWm0zaFRyU1Jk?=
 =?utf-8?B?Tmw4QmlHMjU1TGk2QlUrRDdFcmJEUlkrZTJmZ200NEVtT3RSaHVSdWdkLzVN?=
 =?utf-8?B?bk9HaVpHczFSQTdZd2NzdEVIaEo1NGNaRE10YWRvQUc2anZnSnpMcEN6TXJR?=
 =?utf-8?B?MHdES29JRFEwMDAxZHhCY0tBTWEySm53eHhZZ3h0QkU1YVIvcGpiR2ZqRTlx?=
 =?utf-8?B?ckZvZUp6azFqNzNjc1V0aDRVcUQvMGFFZlR1b0RjYWcyWFhnV1JjSXpKYldJ?=
 =?utf-8?B?TnFpdVJ5T3FuMkZwbWZ6R2pYUTJ0aHJqQ3hXeDFUVkg0R1Z2OE5nZzkrRWtv?=
 =?utf-8?B?eTlrWW05QUQ4UTZtRk96c0xOSjdZRE9qdXY5WTl0MWFHaXM5VDJTSTg4bGdZ?=
 =?utf-8?B?ekRzUjZmR2dBNUEwZG85YXRWYm5wb05IYjBVbzBpdkVMUjhKcUNCUkZKYmVV?=
 =?utf-8?B?aUJhVHp0RmlJNXVoN3c0ZDhlUFF6N3M5RUo3cHk5WFZ3QlRFaWtXa2tqNEl2?=
 =?utf-8?B?WTkrZDVMcldGMnFidlVXWEN4KzU1bFp1RlZQNm1FWGNlZm12SGlNbGYySEJD?=
 =?utf-8?B?ODVKUE1yNld4R1BQbDM3QStGWDBVa0JuY0hpOU9zUUV1NTlkTmcreTdMZWlB?=
 =?utf-8?B?Qkd0MHBVNlNHWVhaSXJtdWRiRzNOaXVMWm1oQWloTDhTUmpOZVp1a2xRdWR2?=
 =?utf-8?B?V0lQeGI5c0FiRHBCTVZKaTFvMTNxR1BZd1dWOHdVR2NydVU3TzJsWXZjWUE5?=
 =?utf-8?B?S1RmVnNubzBaQVhKazZFSHdpcHZnTDdUaDhDQ0Rvb1N2K244NEFUcVh0QzQ4?=
 =?utf-8?B?RDVpdFBMVEF6ZHVvZHJNT2U0NXBhWDkwVWp4Ylg1L2syNjBBN0RtcUsyN2R6?=
 =?utf-8?B?UnZlK2FEV2RNS0lybmFXZTVLOG5XdXpMSTNPWSszYzVZOGZ0QlNxN2tYMW8z?=
 =?utf-8?B?dFdyNGdsOWxyWERFVlNqQ0hEcmhZd1pac21KN3dlV3VSYnJPWWJtZnZxQXRy?=
 =?utf-8?B?Y1YyMUpKekhYRGxQNEJ4WEFXS2xPUzhGZ1F6aWRHSXFsUDdDSWEzNHpEWnlp?=
 =?utf-8?B?QkxpRTFxeSswSkRWcU54MVlCVnVIYmNLTmRJUnRiMDNCUWgwM05YaEJqc3RP?=
 =?utf-8?B?TG5IaWJVVUFlNTVFTEMrd0k0dXdGeGRwc3VJWW1FWUNOQzFEamIzODFKeHZm?=
 =?utf-8?B?b0dhNHNpYWJkS2krV1Job0hBU2tGdmlaNGsrWktnUGFGd0QzdGhxMjBBS0Ry?=
 =?utf-8?B?RjJGQ0NCZEtEQzZDOHhCZTZDUFBORE5lMkxCZWFkSERoaWxYbHg4ZWQ2ZjVG?=
 =?utf-8?B?VmlWcEJ0bEZ4YzMyN2pzelFBQ2VXOHg5WWxlVHJiaExHdGRaNytIVzFnVE0v?=
 =?utf-8?B?Y20rSUpMUno4WHFUbXE5TTBtQ1l3UGFXRnVJdUJVeUdNNDR6NFR5T1FUaWNz?=
 =?utf-8?B?NmFnY2R1UmtsTVNEWmVKZzhiRnpubDNpUU9EQVEzYndSbldQTTduaFZFcCtR?=
 =?utf-8?B?VG1Fd0pjZG5Xdmg5cmZZaVNuQ2xDKzVoWklJUWNUajRqeC9ieTZYVVFONmlW?=
 =?utf-8?B?YkR5QW44SWwrMXgxMkpNMlY1MHdvRERqODVnVXZJeW9JZWlYSXBGbWRhYlpJ?=
 =?utf-8?B?cGtjL0ZXSHZmM0pzRTZOZHRJN0ZzMThrbVF0ZDlZR1RmWDVrZnd2dnhlQmNU?=
 =?utf-8?B?d1hDcUlGZWdJaURWcERsVnFCbDJZbTJ4ZVl3bTMwU1BCSTY5YU1NYzZoRWwr?=
 =?utf-8?B?bnFoKzRaUjRrL1RqQktCVDNpQmE5ZnorcVV0QjVKVUFVZzZJL2Q3cG9QQVZx?=
 =?utf-8?B?ZlprUXhyZFo3eU9uVFE5S29hVVluM3JkUys3YU9yRitPWDdtek0rRHBlU0tE?=
 =?utf-8?B?eWRjakxmWDdVaWZIbDFGUmJ6UGUwdEZBZnJ5UHZLY3c4VDI2aEpITE1BTWNr?=
 =?utf-8?B?a0xRcnhXcEd3Y0kwVWZJSXlBM01MN0txZ1E2aFRkZDlEalhycTh5ZXB2a3pR?=
 =?utf-8?Q?ksHUyWAL8hGYzSwn6noccNeZt+SSvaKFy0YV279Ooc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434884fd-cc7a-4f1e-e1dc-08df3db89594
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2026 16:51:50.2546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2AMkgyVQ68dUQwfkaZ4f9K+iiCLpot0UiM1/ak8VvERlTQb3/l/SzkLYwkIUh9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 16:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249758

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogZGVuIDUgbm92ZW1iZXIgMjAyNiAxNTowNQ0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDEvM10gbGliemlwOiBBbGxvdyBzdXBwb3J0IGZvciBiemlwMiB0byBi
ZSBkaXNhYmxlZA0KPiANCj4gT24gMiBOb3YgMjAyNiwgYXQgMTQ6MDYsIFBldGVyIEtqZWxsZXJz
dGVkdCB2aWEgb3BlbmVtYmVkZGVkLWNvcmUgPHBldGVyLmtqZWxsZXJzdGVkdD1heGlzLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiArUEFDS0FHRUNPTkZJR1tiemlwMl0g
PSAiLURFTkFCTEVfQlpJUDI9T04sLURFTkFCTEVfQlpJUDI9T0ZGLGJ6aXAyIg0KPiANCj4gRG9l
cyB0aGlzIHdvcmsgaW4gbmF0aXZlIGJ1aWxkcz8gIGJ6aXAyLW5hdGl2ZSBpcyBpbiBBU1NVTUVf
UFJPVklERUQgKGZvcg0KPiBub3figKYpIHNvIHdvbuKAmXQgYmUgcHVsbGVkIGludG8gdGhlIGJ1
aWxkLiBJIHN1c3BlY3QgZWl0aGVyIGJ6aXAyLQ0KPiByZXBsYWNlbWVudC1uYXRpdmUgaXMgYmVp
bmcgcHVsbGVkIGluLCBvciB0aGUgYnVpbGQgd2lsbCBmYWlsLg0KPiANCj4gSSBkbyB0aGluayB3
ZSBlaXRoZXIgbmVlZCB0byBlbnRpcmVseSBkcm9wIGJ6aXAyLW5hdGl2ZSBmcm9tDQo+IEFTU1VN
RV9QUk9WSURFRCAoYW5kIGp1c3QgYnVpbGQgaXQgYXMgcmVxdWlyZWQpLCBvciBkbyB0aGUgc2Ft
ZSAtDQo+IGRlY3J5cHRpb24tbmF0aXZlIGRhbmNlIHRoYXQgd2UgZG8gd2l0aCB4eiBhbmQgenN0
ZC4NCj4gDQo+IFJvc3MNCg0KSSBoYXZlIGJ1aWx0IGxpYnppcC1uYXRpdmUgd2l0aG91dCBwcm9i
bGVtcywgYm90aCB3aXRoIGJ6aXAyIGVuYWJsZWQgYW5kIGRpc2FibGVkLg0KDQovL1BldGVyDQoN
Cg==
