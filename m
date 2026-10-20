Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3736.1792488792196476981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=lnMY72yD;
 spf=pass (domain: ericsson.com, ip: 52.101.69.69, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTrxix5sTUIxGZrVXsmPKjg+9134EqcW2mlhOtACoiQ08o1NkAdclnO0MsMI+RglJ+xP2tsnEaBFQvuEvjAOHeleXXV3ynwOPLbWBiSSjfqNbp08s1qfOPfaWXnMAZLw/Eide/WrX+VDR4JgllwHOrTngUwxOskNYA/9oIyYoJSMxilZXmtb6JGV0DxUuN2lrVEqPovnOhj5iY3GQq0ejuhLQYZcXLcGHiikbM7aU/Vq3B7ia6Tr6Qb9pz66oEuPgE/WRy5PuTzZkKuFoSDvwQPeOmt1eBCOkDe45wln/fXevO121SzvVGn6k+dZgGHcjZqzrZPz8zwNyBnFOQc6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9DGjteLDP8P7VoMcq/YckubL83DbC4TkQOaLF+AYS0=;
 b=OXWm34LNkVhqd3yT0YX49Dauu3jfa8D4NsQay5jX5ar3+uEUhzeVkz1CsotmmXCIK1t78fizrBWn3Ks0aAbitVRDB5CS2zK9iuKoAV+73K4e2TvIluQfDuQnbFKa0zp9qNQ5OEvGpeaIfwOXx+Zl5WQACvGProBs2NJXZZZaXrJ+0fNOI+83MmEhpZnBcLRCE81JkvbkQ0FRLCuwy2SPMtwzCUMJtNbykp67MhG4HcTRnX95gMOWF7BW6L9jnA3T/5K1ZQfbbNBW06nsLBEHNJQFNexqtyT8OBGw5xDw12kiYYDnNKBPAzx7Sf44sBoF5HmvxeN2giKHZaLhkIbifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9DGjteLDP8P7VoMcq/YckubL83DbC4TkQOaLF+AYS0=;
 b=lnMY72yDSAk5e51m1Ymifs0QMi7zq4z7pxoWzHA5IrAjeF2RfPqM2lzlUAeC7831KGLdKbnd4hjiDL7EriWGvc7eEvDpaNw/WGuZq0jzjfrghROYVdGoPSVy5EGWQ4VJak1P8GRohUDG3o1sEBn5+JtlMA3Od2WhyoeY68aPzi19sUI1ThtYO35R2y34oSo+uJXytncZRyit2fkaGRzXTEbEzRqpE8Bqe/iRR5kNRiL6YnPMJsf2PY3k5t6ZBt5KImj1Mx64DevWv0zOlQ1+/mdzWrNRgveY/Hg9u10p0sKB0ePybPtCyEDmD5IQ6WxrHzV1wp0mvrFxnUIMXgNniw==
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com (2603:10a6:20b:140::11)
 by VI0PR07MB11578.eurprd07.prod.outlook.com (2603:10a6:800:307::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:33:06 +0000
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0]) by AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:33:06 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 2/7] glib-2.0-initial,glib-2.0: upgrade
 2.88.2 -> 2.88.4
Thread-Topic: [OE-core] [wrynose][PATCH 2/7] glib-2.0-initial,glib-2.0:
 upgrade 2.88.2 -> 2.88.4
Thread-Index: AQHdYGyxN0+lLvEtaEeAbIABLFRRZ7cGJ/AAgAADOoA=
Date: Tue, 20 Oct 2026 09:33:06 +0000
Message-ID: <042f5e1f0c971a7d0d59cb68ebaad06bae0bf856.camel@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
	 <20261020082611.3115623-3-daniel.turull@ericsson.com>
	 <DM9JZXVWJ4V4.3EQ568QELLLBR@smile.fr>
In-Reply-To: <DM9JZXVWJ4V4.3EQ568QELLLBR@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR07MB6437:EE_|VI0PR07MB11578:EE_
x-ms-office365-filtering-correlation-id: 4e92ec9b-33d7-42b4-dbf9-08df2e8d2555
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|4022899009|376014|1800799024|10070799003|6133799003|22082099003|18002099003|4133799003|38070700021|4143699003|11063799006|261009223027099003|261009221227099003|10067099003|56012099006;
x-microsoft-antispam-message-info: aJqqDmKdwboy+j0NGMuN7BiqY2lFcDZEl/jlwD6hFDVrsVPVUW6V2AZ+PrSvYFQybY1vcELUCnj9XoMErmywRYgNFVCuxcDdif1rILD4xlE+pVxDUVRvvKK/v4wwiCWQJP9dhS5+As98pZYbGgnIpPFy2wEENa/BqAPi242ShYlDfxCINclujOwnqvay4lC+uX1hYd+FsxehMlI/+rEem3aQ4Hw4yWGupR4ERvLbzPlXeyZM928sF1udxaX684rCk8d6Euy9Z1xTypO6MHZxQ2oCDhRMWOosypmCe1W74WoCeyNwm9InmhuTACiNM4kB0XmagEFubyaNO7AruD2YoHFcd0EPdRwUAYr5SZt3/a8196sN/b0s5b3r4nEybWvZgzrPfAahfg5xZCMHPyDabF3lJ6cGwZc1JDyLRLSvxpi+2bbaGME2JsLbG7T6waHvrZojmhCkQbYkBFALAwb6SvjB+73krCg4Y0ZOic1oKLKHcK/ib43xViLDyNPnl1FoB8t5V3w6BtTRBn3PshOWGunUQ2r8ULm0cO+mXhh0U+jrwfJ9IQvQVMlg/FG9qViFYm4Ya7EsP9Px/uAWSnW1S0p6lXRXm2Im3JNR6ALUiKd+y6I8hR7VqTuxm/i9G7bVurRdOUXkv6UWscPo3b7DYbC+1VIR0qX9ZzFLljNGjhk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6437.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(4022899009)(376014)(1800799024)(10070799003)(6133799003)(22082099003)(18002099003)(4133799003)(38070700021)(4143699003)(11063799006)(261009223027099003)(261009221227099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzVSMTUvQlBuM21oTVBueWhqdGEzZlY2VmpoejBRWHVNOXhHZENVR1BsM3d1?=
 =?utf-8?B?anVwb3grbW9ENnhaVTFuVlJxakk5aDNrSFpSZjV3T3IwZXBkOG5HZjFPK0xx?=
 =?utf-8?B?cHg1Rk9ab1VOR2NNWVZHTmxhd3QwSi8xRk5Fdy9Qdm00VlJTYysvTkJNNy9l?=
 =?utf-8?B?WVV5WVo5cFhoeXBHL1hMaG5HblVYQ0xqME9PaXFmOVhLTnhrRHNYOFpaR0o2?=
 =?utf-8?B?YUlWeHNKelY0cFFBRzVoUXBTV1pSWE1DWll0NzZ3dEdkdWlEL2lzWE9HMytt?=
 =?utf-8?B?dnM2VXlBTExvT3J0T1FaSTY4dnYvbDA0ekFuSjBONCsyNVJ4SzlRaXBmaTFB?=
 =?utf-8?B?TUZTbWlrSi9NS0YrQXc2R3BFZ1J4VDk1djUwUERZUW1GVmFnRkxCWStxdWFQ?=
 =?utf-8?B?NXNGVUNLZmMzTFhYSVBsN1B3NnQ2RzJFbGNwQUNXRmViUURLeGpjV3N6SnNM?=
 =?utf-8?B?ZFRHaEFWYTZpcitvSlFzN2NteDYxc2hEYWpuWVRPdlpOaVArQWk1R2cvN2Y0?=
 =?utf-8?B?cXFrRzJjTzA3dHFwLy9lcS9rMW1GUURGSXVXMngwbVQvTmszUkhIYjl6Z1py?=
 =?utf-8?B?dEsyOEpQUFZZc000ZEJKWC81NEI0T3VzN2szNTRmSnFYMm14KzVacUk1R0JW?=
 =?utf-8?B?d2NhSnRDOEswZTBGRWc5NURzcGkxSVRNVGkzTFR5VUxqQXpkelNORXFFVmtp?=
 =?utf-8?B?SzcvaGRkUDVnNzBBejB2SmtpTW91NVNOSUZQdXl1TU1XeWo3bUlRUW9hdTZG?=
 =?utf-8?B?NHlROEJjOFhrYnhBQlhWS0pTWHVrS3VRb21QSUpKdnR0NmlBN214U2JxVUgw?=
 =?utf-8?B?V3BzUGQ3VWxqNVBCaklndnZJSFJzR2l1dlNVNnBLdzducnJJWkhyb2VPZzFs?=
 =?utf-8?B?aDU2T0EzWW9BUFpUcFNMY1ZycEFNQlZCSkpjVUh4VlFOdVlqd1VjcjBNYU16?=
 =?utf-8?B?bGNsS01YK1Vhc0lCNmRRSEhocW40WUx6dUxmR3g0MGFHcFN2VE03V1JDajIy?=
 =?utf-8?B?UTRqOFZDT0gwWVRrYVV6bmg4M25YZ3lNRWFocnFIRFBqdHBZTUQxUmVMbmtM?=
 =?utf-8?B?U3U3cWM2d3RiRFBzeEdBeE55WDM0UkJWWlhSNHFmMU0vSENNbnRRdjBDMzVm?=
 =?utf-8?B?T2FoWjM1MFd3VFp2ckIydWRjNlpxTkxTaXZZVVJ6ZEdTMFB4VVd4bktJb3lw?=
 =?utf-8?B?TytRaWJ6QVlSTE94dWphMGxuMTZCNkRHMURFcVRTbGxBYjRXWTI0Mm1neC9l?=
 =?utf-8?B?RjdURHgrcVFBM0hEdlR0bUpjSUJUb29JM0VUL0lPWFN3NWMwNlYvdkJsbTRm?=
 =?utf-8?B?dFY5TFR6OURlNFhaVFVKSHZIaHBtZE43VHpwZ1pXL214WVY3dXAwNTB6QSts?=
 =?utf-8?B?QlpTc1NWUzVMWWVjOVF4RllwbGVrZWV2YWR5dnJ3cDl1czVSS2trU2t4UHJT?=
 =?utf-8?B?Z2pJa0hpTWpjTWF1WU5kRVhKbzBobXdVMGxreTBFaW44SWlhTFRQbmRnWHF0?=
 =?utf-8?B?WXZIM2FmdkE2bWEwVThHdWQxZ0hRR2cyTzVEZ2RIdVNLRzgxUkR5VXlsV1NJ?=
 =?utf-8?B?Q0xldll1V2FONHAyd0xXcHhrZDFiZnBkc2hqdHZUUGlBMlNrYithSzdjcUlU?=
 =?utf-8?B?VUhkYWdNWTN6TG94RlZKaXQ5Wk1jRGhZTTB0WTUyYWNzajBsekcwZ1BycVFR?=
 =?utf-8?B?T2hUVm1YSW1GTjkraEw0dGdXYVlZMzNjS0RuRjQ5RmhpalV1SEE1MlpneEhh?=
 =?utf-8?B?UTJsUjlaRFErLzhOcmRqbFdjMFIzS2FoSW1ReHFQWVd5ZFlHcTRXUlQ2MzMr?=
 =?utf-8?B?aDJjdEx1NS9tSGYvWkFLeDcyKzN4N2lGVWwzeEMzTU1YSHBEQnFaVkhETVk4?=
 =?utf-8?B?b3ZCMWpHWGxIMDJvTEszb0I3bmVkSXdqZzZEV0VKcmZNcmhUeXUyTTFxY3U1?=
 =?utf-8?B?RFltTHNLNCt4RTVDakUzNkpCdnRocDNmOGMvUU1tblhPSHI1MlNSS2ZuK2hE?=
 =?utf-8?B?SkF5YlN4YkNJckdSZFdwZzlwZ1N5bnY0Tm9EVjVoZitSNWlUdXhXbGN3b2Mw?=
 =?utf-8?B?emxTUUx3M0FTR05nLzNOSHBRWXpONERTaVVsZitzeTM5cDhSWmUzY1R6U1Ra?=
 =?utf-8?B?Q2QycmNQTWxSdWdCVng2Y1pUTFJEcVVEWSt1YUZtVFhSeFh3VmZVMm5LTHRG?=
 =?utf-8?B?WEpkSnpoaSt3M0Erc1BtbFFBNE5uSTVnd2ZmelFvSXlYRSt0MUVyT0g3MVhR?=
 =?utf-8?B?OStFWTJsYTZzODJ3TTlreFhITVV3TmlvY1NPUUU0TnZCM3FhcVFsbzNEZG1R?=
 =?utf-8?B?K1BKSUxydnp5QkVjYWJjNEtHeG1TamhWOXFJV0xSdzFJMi9SaVQ5WkN0TkQr?=
 =?utf-8?Q?6Pa6uMGSLOcTnoLHrncai/GCjydfrwuw1YCx8nmvd17xA?=
x-ms-exchange-antispam-messagedata-1: kHnNRI2T3C1zZVlBUsiliVk5JRF7BAm3Auc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11CFAD67D716474D975EBF057A973362@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6437.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e92ec9b-33d7-42b4-dbf9-08df2e8d2555
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 09:33:06.1396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4WkITYPaMKvTBB8ObIvgUoRck8UWR1i3RN4wnymcsTpAdYrsTCEsxHs3gsQEpIelUlINAxWxdTZ3hEiv94cu4Neo49t+fLDdSRqGiyxftbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB11578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248265

T24gVHVlLCAyMDI2LTEwLTIwIGF0IDExOjIxICswMjAwLCBZb2FubiBDb25nYWwgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCndyb3RlOg0KPiBPbiBUdWUgT2N0IDIwLCAyMDI2IGF0IDEwOjI2
IEFNIENFU1QsIERhbmllbCBUdXJ1bGwgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6
DQo+ID4gRnJvbTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+
ID4NCj4gPiBDaGFuZ2VzIGluIDIuODguMy0yLjg4LjQgKHBlciBORVdTKToNCj4gPiAtIENWRS0y
MDI2LTE1NTg4OiBHREJ1c1NlcnZlciBwcmUtYXV0aGVudGljYXRpb24gRG9TIHZpYSB1bmJvdW5k
ZWQNCj4gPiAgIFNBU0wgbGluZSBidWZmZXJpbmcNCj4gPiAtIFNlY3VyaXR5IGhhcmRlbmluZyBi
YWNrcG9ydDogb3ZlcmZsb3cvYm91bmRzIGNoZWNrcyBpbg0KPiA+ICAgR1NvY2tldEFkZHJlc3Ms
IFVuaWNvZGUgbm9ybWFsaXphdGlvbiwgR1Jlc291cmNlLCBHVmFyaWFudCwNCj4gPiAgIGxvZ2dp
bmcsIGFuZCBHTWFya3VwIGVycm9yIHBhdGhzDQo+ID4gLSBGaXggbWlzY29tcGlsYXRpb24gd2l0
aCBHQ0MgMTcgY2F1c2VkIGJ5IEdfR05VQ19DT05TVCBvbg0KPiA+ICAgZ2V0X3R5cGUoKSBmdW5j
dGlvbnMNCj4gPiAtIEZpeCBoYW5kbGluZyBvZiBsb25nIGZpbGVuYW1lcyB3aGVuIG1vdmluZyBm
aWxlcyB0byB0cmFzaA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFR1cnVsbCA8ZGFu
aWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi97Z2xpYi0yLjAtaW5p
dGlhbF8yLjg4LjIuYmIgPT4gZ2xpYi0yLjAtaW5pdGlhbF8yLjg4LjQuYmJ9ICB8IDANCj4gPiAg
Li4uL2dsaWItMi4wL3tnbGliLTIuMF8yLjg4LjIuYmIgPT4gZ2xpYi0yLjBfMi44OC40LmJifSAg
ICAgICAgIHwgMA0KPiA+ICBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL3tnbGliLTIuMC1pbml0aWFsXzIuODguMi5iYiA9PiBnbGliLTIuMC1pbml0aWFs
XzIuODguNC5iYn0gKDEwMCUpDQo+ID4gIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC97Z2xpYi0yLjBfMi44OC4yLmJiID0+IGdsaWItMi4wXzIuODguNC5iYn0gKDEwMCUpDQo+DQo+
IEhlbGxvLA0KPg0KPiBJIGFscmVhZHkgcmV2aWV3ZWQgUGV0ZXIncyB1cGdyYWRlIHRvIC4zLg0K
PiBDYW4geW91IHJlYmFzZSBvbiB0b3Agb2YgaXRbMF0/IE9ubHkgdGhpcyBzaW5nbGUgcGF0Y2gs
IEkgdG9vayB0aGUgb3RoZXJzDQo+IG9mIHRoZSBzZXJpZXMgaW50byBteSByZXZpZXcgYnJhbmNo
Lg0KPg0KPiBbMF06IGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNv
cmUtY29udHJpYi9sb2cvP2g9c3RhYmxlL3dyeW5vc2UtcmV2aWV3DQo+DQoNClllcywgSSdsbCBz
ZW5kIGEgc2luZ2xlIHBhdGNoIHdpdGggdGhlIHJlYmFzZSBmb3IgZ2xpYg0KDQpEYW5pZWwNCj4g
VGhhbmtzLA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUg
YWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMy
NDgyNTYpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS9tZXNzYWdlLzI0ODI1Ng0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9tdC8xMjE4NDU5MTcvNjMzMDUyNg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVk
ZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW2Rh
bmllbC50dXJ1bGxAZXJpY3Nzb24uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPg0K
DQo=
