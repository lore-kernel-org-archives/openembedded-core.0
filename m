Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2866.1794948792096363046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 12:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XVrZsQDX;
 spf=pass (domain: siemens.com, ip: 52.101.69.38, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGdaJppSGpYRrQC1i9UKMmaVwvYgFsp2ppQbbo97VMD8DKghVrUm37VV2Ozr0fDJ7dFYzbHPWGf6mMDMxNbMNBuDUSvl/1DRanOFUAvQT3yAkNgT/Ddy07wRJQR4q29FIjURtc8U2U6wEsBo5ENMGaXG3azsFDtM+k2UDeODT/LPRqpDRI8UiskPC8sD9+SmJEi7GP9o8P+sc2/78wHcaNmx83wSNRa/s3CK63paux9PIrDzqjihSUWg5fKdimM73truo0ebtr7UNYTt/mEMnilCxMQXNsgIQHEXFY4idSh8iacURVpdFpAhwzZhGsNJtTXjI1lpxAYziYTdVvhWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCzi2lzg35ykT392B/xOEVTnGwG7wjPnv+aDpI7itKU=;
 b=iRGNQyanEHgqUvL30sEDjxHrNvp/BWCFO3a/wOWoaBivWK47HufEsLbRxiGu7rIDrhji8+dNYp9FbZSIpZkcqXzhpVK3sVKZ2NTGVqrppQtaH5UhBGyxcL/0dngqyFasD0bCT9o3mp6b3mYm1zw12p3covZkakTRxqDrRRVFaWsZHGSncaz0nFIkbpUFmuyBPjnXplVBwTcgkadJMstq6oT1PoTMoLRiI3+f323Qze2+8YLTknSPt6EQcKjPZ5YTEN2xoPScED4SHMaPY+9GCoXuNrRptTLSsW9My8gZCFxRqQrVL1geU0MiFQlc3Z6s2ZX+ZO2erXE5cbs/iMDMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCzi2lzg35ykT392B/xOEVTnGwG7wjPnv+aDpI7itKU=;
 b=XVrZsQDXZg/YqN4Dqcs8BE/w2VSnnvjVZCdLhal0w/cazZ4nz24vZiJ/NE2ed/k2CZhfSZl6REQqtJayz4OoZQY2M0AX7spC3VNBRNodVnKCZ6ZtRIGXx51wOC+Kw8zMHt8WXQsxyNG8vJAC+yxG596DrEsJuaSz+uOkEHOFTMvYkveAi5gGGbmtUw7cn6mz59gFeccGImL/iTOWDrUxXLHTMDiujTLC218rEWqlM8wKdpskTanOlhYqo5MxgZnDEhBapwM/OXHS/DkeXkilFMu7kGyPWQmDci6g3Q+ohzL8V8NDYqbaWiE5ikDROor96N5ieWIrqB63FroZu2xO0g==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PA2PR10MB8819.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.4; Tue, 17 Nov
 2026 20:53:08 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0639.006; Tue, 17 Nov 2026
 20:53:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton <ross.burton@arm.com>
CC: Jon Mason <jon.mason@arm.com>
Subject: RE: [OE-core] [PATCH 1/2] grub: update upstream-check
Thread-Topic: [OE-core] [PATCH 1/2] grub: update upstream-check
Thread-Index: AQHddhzYU7Yll4BxpkeSnw4YJ0uuTrcymqWAgAAgkDA=
Date: Tue, 17 Nov 2026 20:53:07 +0000
Message-ID: <AS8PR10MB5073C3B1CE0C6A89575674ECFD7B2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261116224959.197150-1-peter.marko@siemens.com>
 <DMXPGW66H9CP.1ATNO2XD1FDS3@bootlin.com>
In-Reply-To: <DMXPGW66H9CP.1ATNO2XD1FDS3@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=da87c92d-f21f-4cc3-8067-b23cb62347a0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-17T20:39:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PA2PR10MB8819:EE_
x-ms-office365-filtering-correlation-id: 969674a7-4ecb-4ff2-ae61-08df44ecc8b4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|261009223027099003|55112099003|11063799006|56012099006|10067099003|4143699003|261026121527099003|261028144727099003|261026140227099003|261021135927099003|261021121427099003|261022105027099003|261022075727099003|38070700021|261102123227099003;
x-microsoft-antispam-message-info: pn8jj7rC4hmw01Yvi5gAVFAYL3yYApmKZ0NwxdOzvMnxqMNwiRbBxtEnzU+jwth80VtMQp4hYCNOBWz3BDRkDLR1IrGzFeuTb0WC7msSEXztPVNUUwY0BENFLyaVbfQ8dguiy0blQayW20rSEB1c5qT8ckPviOXq/RMsBzX0riDyiU9XpoWYs9uFfoLDP4ENCQcf4oAvfJGUwtx2JIBtVHL9Q1TLZUpGucPlsufPQjCvb4rh9oapfr2A09ZDZWzB0mna9myXhUZU8+oTd9RHWOPCO3Yhgv29kMAafKTzozpaPA92ox27jTw8ADosXyrPK4IhsrqSfmAs1gv077lzAy+t6ARpFOOYtzZk8a0Gjlq4qQ+G+p9TQIx2gOMHO9n433gfFQGUnHbiUqd9hyro+Y2GFlwUiTMucF6t6uk8mdNdm0QlV9c4qGGlirfmfVAc6Q0xrF5IhUKB0inv7ifTlLDPDWJv1X4lHrfjj0jLFJTvCtiBCW1FAjX7l7VWkdSEIcZ/ka+WIKpqC9OMsEZZ8QFPy92G+cD4O3BSatHyTy+n41CUzgyiIv60sQ7j7XEFyA9huvczk9Q3vIjVUJa0SQrXmHH5Jej6E11MKcd9dbOp9ErqR2dW24BDMTL32BcjNRWrF2c+h5dwDuj5wKVwhMJOcbv7KIsJ0I73Q3Yua8w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(261009223027099003)(55112099003)(11063799006)(56012099006)(10067099003)(4143699003)(261026121527099003)(261028144727099003)(261026140227099003)(261021135927099003)(261021121427099003)(261022105027099003)(261022075727099003)(38070700021)(261102123227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2FQSUJnVzFsV3hiRjI0bjJQSkRRWVQwbDF2MHFQQjNqMCtMNHdNbURTVzhO?=
 =?utf-8?B?WkxGRm9wTVRrcFJPay9KdUZtbXdpb0Z2NEk1dFdGWnBFcnl4Z0NpZGJSM3py?=
 =?utf-8?B?c3ZFc3JJVjlWd0s3dkd5R29XeFJTVERCTkFqQUk0d1NkRDZXdkh4QTZoV05O?=
 =?utf-8?B?dVBIWmJwSUFuZ1RjOW9tQUQyaUhIaDZGZzN5ZFE1b2VNQ2gzMlFiY1RYMzhF?=
 =?utf-8?B?N1NOLzZjQmg4MUc2NTNMSWhocEpxSWFwUFpNNnBDVkhwbjMxOGdaV3VXdHBP?=
 =?utf-8?B?QzRoNUMram11SzhjY0F4aC9TajhaeFhwTWQxV2QrVVY3QkxXWlc1ZmdBMysw?=
 =?utf-8?B?TnJpKzdrU1Y3M0gxNkFvRGszeE5JVGpVRTYwZmhycWlFdEszNU1kZXJqeHZo?=
 =?utf-8?B?UTlXZ3hoNWFlS29pZjNYeVNGRFdHSjk1aXcwTWd2dFljZ2RWT0RaVWJBUWFy?=
 =?utf-8?B?NG9vZnd6YXQ2UVBsaGY5ZjN4RGtiQlFJT1JuNjZnaGpTOXkycWpmV3hYWHd5?=
 =?utf-8?B?SlVkTzJTTGRETlVzQklLa3k5OERlWGsrRUNja240cnlJcXo3clJMZUFYTC9Z?=
 =?utf-8?B?bU90MUZuWmppYXlVd3AxL1FwblhnUW9zQXgxV0V4elN1V1JneFoyWFI4aE83?=
 =?utf-8?B?Skd5NkdoYkhnL2VaQk40Qi9SN2ZENkVhMCtJeE14VDVCazE4TkRNdy96Z2U0?=
 =?utf-8?B?clVVV0tsWUtTUVBrSzR2NU0xdlpLNkUxWStSeExBWFJyNStPTndxUkZRMjl2?=
 =?utf-8?B?b2NNYUZjbGtubjk2QzFpb0U5NlNmWjVsUGRCMUtTZndZQ1QvdDdtN3A5blhj?=
 =?utf-8?B?ZXJRRTIxZUNTY2FkMzQvbXo4c3hZd3hDRXVPUjZ3NHBBV1EzMEg1TVUrSDh1?=
 =?utf-8?B?SGpsU21PUUlVaDhtZjBFZGdhU3pqRDVDa2ZQQzJTOWhDZDNXbkhBcFJCcGpr?=
 =?utf-8?B?c0RzT2pCOEpyOFEyaFZVNEVqUTZRTks2bmFHbVBZYmU3U3dMbWlEQUVzOStL?=
 =?utf-8?B?THZHbnRlaEl6blJIMnRRYXRhNnR2ejJNSytDMVdzMklMYkhVYlc5c1dEY0lG?=
 =?utf-8?B?Q2Z6SEttY2Rsc1V3bUU2bzJpS3NEZFZoNjBxRHhCOGMrQ2VBbFFPUlE2SXIr?=
 =?utf-8?B?Q3RmdzFGMFlYbkdlcXZ3MmIzMFJ6Y1NmNnRUb0NJOUM3NlZWbmNkS0Yxa29K?=
 =?utf-8?B?SEQ3K25tZjk2K050LzRTTDlnb1p5OXZ6bVUwYUVxZUI2Q3J3U0VPek05UWY4?=
 =?utf-8?B?WEQ3aE1MVEx0T1VnQnpXam9BVHZ5WTBOeHZzY29HQlRlSUNhR0J2N1NtbVdj?=
 =?utf-8?B?N09vNFEwdjhHaWlocXVUK1pMMG8xbTNmZkV2OSt4UnBFeXgyT256cGtZT2RE?=
 =?utf-8?B?Z3A3S3dTUS9hS0RiQys1aUp1MWF0ZDVJcm5IWFY3R2ttMmVHUURmRG02bTd6?=
 =?utf-8?B?d2V5WWRncVlnTFg3NnQ0dUhuV1EzQzJHL1J6Vk8xWUJHa3VCWlVPMkxaTzB1?=
 =?utf-8?B?OXpYK2QzVVRXVjQyWElPajJjSWxDaFErVENlU25lSWJ3Q3FJWk8rMnRvZDV4?=
 =?utf-8?B?eVo4bmcvcDJybGtET3ZEY0dla2dNczdNNERwL2VwR09jbnR0QkFOREcwM1Zt?=
 =?utf-8?B?NUQ5NGE1RDFuVXdPdmFUeElsV2kvM0pVc2JDc0Y5UWRNOTMxSFNTbDFYL0Zu?=
 =?utf-8?B?YWRRRmhDOWN6UG9nTnpETXVQUEt2RFdrTjZ4MWNPM2grd1dSME55emNzR1FR?=
 =?utf-8?B?aUNiWVFRakJSWllDWTFwYldkVUZwVVRKdklSUjQ1ekZydG5TMlVEeFNUWm0v?=
 =?utf-8?B?dDhFeEtDTklnRjNCZW9yMStUaVhVRmxhYUlRanpTTHYzKzJTZlg3cHc2Ykpj?=
 =?utf-8?B?UjJSRk5wU0UzYVBYdndoRHpoZkRlQXJ3VFdNYk1icDVKSmtrTTFPaC9MbitG?=
 =?utf-8?B?UXh6bTVPdzMvWi9IcEkzV2E0ZDRpQUNlZGNyOEFqT01TU2JzRmVndzZWeFZB?=
 =?utf-8?B?ZERUOEt2YVpqMXpRQ2tJZVNLSHhJN2J3SFBzYnd6a0ZvUnQwanpPbkJKdEIy?=
 =?utf-8?B?THl4dU05QmlUd0Z3QUNJMElYd1BvN0M3cjVvU2N0KysyakpObzJoTERZL1Rn?=
 =?utf-8?B?MnprNldTNVhGZGZuUmw5Z0s3MGdxeFNQWWpTczMzU3FJNjFGeUVYS2xqNkZk?=
 =?utf-8?B?N0xrQUtXNW5ER2sxNXg5NTZzRlZrTUsrSDRvNDN4SlRySjhwZG5RTlBLc3F1?=
 =?utf-8?B?MXJabzdTMkJwa2xKenR3dWdxeGd6Z3UwMnFtWjBiSzNaK2JwV2dGalFTaE5M?=
 =?utf-8?B?V3JwaUxtRjlIOWNxdG1hbUxjRkUycjV4REpVbFkyMGd3Z1NSajZkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 969674a7-4ecb-4ff2-ae61-08df44ecc8b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 20:53:07.9838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7eUSbazZYeAR9RPzdf4EV2YcxXIgKvbztVyWXEy5pDaZh9yVaIHrdtCzLWQoJUQIzQ+266U2XL5cgg2BaUyWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 20:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250491

SGVsbG8sDQoNClRoZSBwcm9ibGVtIGlzIGluIHRoaXMgY29tbWl0IGludHJvZHVjZWQgaW4gZ3J1
YiAyLjE2Og0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dudS1ncnViL2dydWIvLS9j
b21taXQvMWNhZTg2MTMxNGY0MzU0MGNkZTc3M2ZhYjhiNmVkNzY5ZGM1ZjEwNg0KVGhpbCBsaW1p
dHMgbWVtb3J5IGxheW91dCB0byA0R0IuDQoNClRoaXMgY29uZmxpY3RzIHdpdGggcWVtdSBSQU0g
bGF5b3V0IGRlZmluaXRpb24gZm9yIFNCU0E6DQpodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11
L2Jsb2IvdjExLjEuMy9ody9hcm0vc2JzYS1yZWYuYyNMMTQ1QzEtTDE0NUM3MA0KVGhpcyBtZWFu
cyB0aGF0IHNic2EgUkFNIHN0YXJ0cyBhdCAxVEIsIHNvIHdhYWFhYXkgYWZ0ZXIgdGhlIG5ldyA0
IEdCIGxpbWl0Lg0KDQpXZSBjb3VsZCByZXZlcnQgdGhlIGdydWIgY29tbWl0IGZvciBub3csIGhv
d2V2ZXIgaXQgbmVlZHMgdG8gYmUgZGVjaWRlZCB3aGF0IGlzIHRoZSBjb3JyZWN0IHdheSBmb3J3
YXJkLg0KUHJvYmFibHkgcWVtdSBuZWVkcyB0byBiZSBwYXRjaGVkLCBvciB3ZSBjYW4gY29udmlu
Y2UgZ3J1YiB0byBhZ2FpbiBzdXBwb3J0IGFybTY0IG1hY2hpbmVzIHdpdGggPjRHQiBsYXlvdXQ/
DQpNYXliZSBSb3NzIG9yIHNvbWVvbmUgZWxzZSBmcm9tIEFSTS9CU1AgdGVhbSBoYXMgYW4gaWRl
YSB3aGF0IHNob3VsZCBiZSB0aGUgcmlnaHQgd2F5IGhvdyB0byBzb2x2ZSB0aGlzLg0KDQpCZXN0
IHJlZ2FyZHMsDQogIFBldGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5j
b20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE3LCAyMDI2IDc6NDMgUE0NCj4gVG86IE1h
cmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0K
PiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT47IEpvbiBNYXNvbiA8am9uLm1hc29uQGFybS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMl0gZ3J1YjogdXBkYXRlIHVwc3Ry
ZWFtLWNoZWNrDQo+IA0KPiBPbiBNb24gTm92IDE2LCAyMDI2IGF0IDExOjQ5IFBNIENFVCwgUGV0
ZXIgTWFya28gdmlhIG9wZW5lbWJlZGRlZC1jb3JlIHdyb3RlOg0KPiA+IEZyb206IFBldGVyIE1h
cmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFJlcG9zaXRvcnkgaGFzIG1v
dmVkLCBzZWUgWzFdLg0KPiA+IE9sZCBsb2NhdGlvbiBkb2VzIG5vdCBjb250YWluIG5ldyByZWxl
YXNlcyBhbnltb3JlLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vd3d3LnBob3Jvbml4LmNvbS9uZXdz
L0dOVS1HUlVCLVRvLUZyZWVEZXNrdG9wDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBN
YXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+IA0KPiBIaSBQZXRlciwN
Cj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaGVzLiBJdCBsb29rcyBsaWtlIHRoaXMgaXMgYnJl
YWtpbmcgbWV0YS1hcm0gYnVpbGRzLg0KPiBUZWNobmljYWxseSwgdGhpcyBkb2VzIG5vdCBwcmV2
ZW50IGZyb20gbWVyZ2luZyBpdCBpbnRvDQo+IG9wZW5lbWJlZGRlZC1jb3JlLCB5ZXQgSSdtIGEg
Yml0IHN1cnByaXNlZCBieSB0aGF0Lg0KPiANCj4gSWYgYW55IG9mIHlvdSBoYXMgYW4gaWRlYSBv
ZiB3aHkgcWVtdSBpcyBmYWlsaW5nIGhlcmUsIEknZCBiZSBoYXBweSB0bw0KPiBoZWFyIGFib3V0
IGl0LiBUaGUgUUVNVSBib290IGxvZyBqdXN0IGNvbnRhaW5zIHdoYXQgbG9va3MgbGlrZSBhIGZl
dw0KPiBhYm9ydGVkIGJvb3RzOg0KPiANCj4gTk9USUNFOiAgQm9vdGluZyBUcnVzdGVkIEZpcm13
YXJlDQo+IE5PVElDRTogIEJMMTogdjIuMTQuOShyZWxlYXNlKTpsdHMtdjIuMTQuOS1kaXJ0eQ0K
PiBOT1RJQ0U6ICBCTDE6IEJ1aWx0IDogMDY6NTk6MjEsIFNlcCAyNSAyMDI2DQo+IE5PVElDRTog
IEJMMTogQm9vdGluZyBCTDINCj4gTk9USUNFOiAgQkwyOiB2Mi4xNC45KHJlbGVhc2UpOmx0cy12
Mi4xNC45LWRpcnR5DQo+IE5PVElDRTogIEJMMjogQnVpbHQgOiAwNjo1OToyMSwgU2VwIDI1IDIw
MjYNCj4gTk9USUNFOiAgQkwxOiBCb290aW5nIEJMMzENCj4gTk9USUNFOiAgQkwzMTogdjIuMTQu
OShyZWxlYXNlKTpsdHMtdjIuMTQuOS1kaXJ0eQ0KPiBOT1RJQ0U6ICBCTDMxOiBCdWlsdCA6IDA2
OjU5OjIxLCBTZXAgMjUgMjAyNg0KPiBVRUZJIGZpcm13YXJlICh2ZXJzaW9uIDEuMCBidWlsdCBh
dCAwNjoxOToyOSBvbiBTZXAgMjIgMjAyNikNCj4gRVNDWzJKRVNDWzAwNERFU0NbPTNoRVNDWzJK
RVNDWzAwOUROT1RJQ0U6ICBCb290aW5nIFRydXN0ZWQgRmlybXdhcmUNCj4gTk9USUNFOiAgQkwx
OiB2Mi4xNC45KHJlbGVhc2UpOmx0cy12Mi4xNC45LWRpcnR5DQo+IE5PVElDRTogIEJMMTogQnVp
bHQgOiAwNjo1OToyMSwgU2VwIDI1IDIwMjYNCj4gLi4uDQo+ICh0aGUgd2hvbGUgYm9vdCBzZXF1
ZW5jZSBpcyByZXBlYXRlZCA1IHRpbWVzKQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNzUvYnVpbGRzLzQ4ODMNCj4gDQo+IFRo
YW5rcywNCj4gTWF0aGlldQ0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290
bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9i
b290bGluLmNvbQ0KDQo=
