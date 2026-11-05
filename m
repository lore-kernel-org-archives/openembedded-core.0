Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36611.1793891321685754924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 07:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rQ5DjaCF;
 spf=pass (domain: siemens.com, ip: 52.101.69.59, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz/ms7fc0oLEGSDoAVlGhGPZpn0lHJq/Bp0L8tHDAujPNuenyianb1hIALmYvLNKZDI7y1zKuSNI2oM0Vt4mKneZ35ZBuYTNtmmaI/OhThHyVZx69x3hSHehPy4h1K33TB0dX8Evqd9JFQpDkMHOPLp3FjkYp1pfHIjIFnHEZv7cPdsh0q4Qj+o9WWEr9hYnIbWBC3aU52WmaixZabeROT4BxaS5vExYE+dmEQtE8wYqSX5na5SUzCPoUc32eOH9RDl7bJhp/ZmkaS1ocg7t2NCCOhahbz0nOqliuiIWqEiG3thmjYbQq0PC/dfSzx1S6BDTdtpRmMUAtbJPTE9pSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LC2T2JkaZ+z6b045wAaWePpesSmMzTWy4Gaya9jSOP4=;
 b=SF9trEJkXpoVN8cbB8KfKkMBX97mmPnfI71AHZ9Rjs1n8Tj4uhxL427VBHvz2gu7iAjyzigM8A+yWYe0IUrzYJNsfkqBHWCAOBsQ/XAIgCP0ZUr8Cv1b9kx1f64F5Y4n2JG7ytcKyUBDZVKXhMzlFIAFnhtSlSstB3ciMQQPWkJu9HVzEP2LgWTUUHYepDA/49ANS65Z1hlE2g75ALd3KqXtkx9KF2IKz+oGDeuM+T3zizvWBeWgJjqUVql3N9V4wj7OBfKYcN0VldGZVhIPZCk7uUh0XtMtBeQPN+UKMyhcO2BsYQQUJf6G4JPx3Iv4sqwfcprJtC6h5hOG1VymDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LC2T2JkaZ+z6b045wAaWePpesSmMzTWy4Gaya9jSOP4=;
 b=rQ5DjaCFDowWJ4mUJEca+pNUtpuYwXaz5kLPkVBZkfKedFVl5gz2pyEseOk9JeFEDIq22kGyiXWBjraVDze/LVEENAZRuA1Eykz8NvuTZvQZan5lD+qYNlAjnMlBA2W3nhAiY8Hkwp9EclMwtuOWihwkayoVxmq8Qeu652FNSdE9b4apY9VKGdffZ+7YiAc5d4X9pTbvFm3J0JKuAsDqOPKOPXxQGKPbxxq7A1r8M/0bbEXbTZ+xx0D1FtbKkhX2UWCKEQPVxOkUD1ePUXjOY/6DBq5gcb/X7Ji2EzxUgP35U8678pSpN5zEOkrU9bzs8owF4g7YK6ZzdZABtFfUNA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB9PR10MB7241.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:456::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 15:08:34 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0615.003; Thu, 5 Nov 2026
 15:08:34 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Paul Barker <paul@pbarker.dev>, Prasanth R <ragaprasanth@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Prasanth R <prasanth.r@lineo.co.jp>
Subject: RE: [OE-core] [PATCH] zlib: patch CVE-2026-85091 and CVE-2026-76844
Thread-Topic: [OE-core] [PATCH] zlib: patch CVE-2026-85091 and CVE-2026-76844
Thread-Index: AQHdaCxhrOQE6wRNkEyV1HlEPtrWvLcfnSsAgAABJSA=
Date: Thu, 5 Nov 2026 15:08:34 +0000
Message-ID: <AS8PR10MB50736C390B00B646F697DCB2FD772@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261030050531.720920-1-prasanth.r@lineo.co.jp>
 <DMNDA5FMY9UQ.1GQQ7M7RMMVH4@pbarker.dev>
In-Reply-To: <DMNDA5FMY9UQ.1GQQ7M7RMMVH4@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9a6287f5-1432-45ba-b604-33a8cf56fce8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-05T15:07:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB9PR10MB7241:EE_
x-ms-office365-filtering-correlation-id: e56cb761-5e57-4cfc-c746-08df3b4ea959
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|55112099003|38070700021|56012099006|11063799006|4143699003|261009223027099003;
x-microsoft-antispam-message-info: pAmzO0YJjh14YXOA5AlECsZqlr258thSy4eSzeAzGv1uDEZr0Npe/szzyHW+wLConwdrDSObOxnUF+pnmYXH3G2FN5DrwalXYc/ifJmyF2lnb7o8r4SzOKxhf6MHL///hV8+GuKsQQjlTgu5qcoafNPvKuFwuOXeCRnNvbumuHM3J4QcAFa4Xj6Ve5Kte5NPyRQYu/3RmTrFQ/SwpZpqD5Wk9QXz1LiJk9A+8AQXY41iv3fb8MEUEbQGO9ZR5PewKvt3XToDBOY7FvuZ3A0fDZ8PML47ym1t8lR7iuqIqUqYs0/svxJt2J1mCeHeJMnhXKpe3yLNupfqFM/CO2EpBHkXCTZuWdUHQ6Jby+uBB1/gkjbN0lwwfrnCmNpXZlM7zNGXZ18dEoIhfxwX0QjyQYwUy0Sv7twAj8VGFXN8n3L1vcJDVCqxTT8l7WdiZqyEhyVSVSnKDPJZzntSSfle7Mee5EjQF1sryVX1d+1YJ0RmHVz11Sqekd9uWAjkSh+dRNIhIW/ucQHm0MHUr801D3E9D0h5lTFJTYwENMAMSRE3yL4fO5zy4iYxKP7fIZsaj55uuTOOkeF2L01uB9PzdaYZmTrsloTdFeFw6b3mWsBN4QQ7/hb9JLLB1sjj/wtV7V+5kDdaLQ4yJ3TTf1ylVKt27Ovsuf8nePsvbKoOyi8zidqjTZV9RQz9ViUfEND1TP+VVBUe8fy2sXdYuRyECFq7mZQy8pzsSRGfLH6IWeI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(55112099003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0J0RW5jd2V4TVRlbkZabFNTeHQraGpmZ3RPNk5yNWY1R01uYzQwKzQ0UVZn?=
 =?utf-8?B?dmpSRUxOWHhQSTUvcEJ0d3BEUmxHTU51TmZHd3k5Y1RlS1R4NDRDRHBJWmtk?=
 =?utf-8?B?MG80MHpVVjNBT2NVNUZhTjZKdzdiSUovK29XTXJES3BBMnY2bWt5WkkrNGc1?=
 =?utf-8?B?Rno0VFlhSnNjTEcwVERXek1QUVN6WlBrWURGc01iSzNXREc1QmM0UHdBMmxN?=
 =?utf-8?B?K1JpZGEyUEZ3RG4rK2k1dUovMkU3MkNnUFk3RDhMKzJ6RmFSSHJvNCt3WEEr?=
 =?utf-8?B?amJnb2t2dVJlelpNOXhVaVdDNktNQVJvUHNQblVsU1MveGtyTEFXU3ptTDdN?=
 =?utf-8?B?MGQrb0NxWU9nVEdCUUo0L0s1R1k4WjJldjRNNDFrRkd0VGtPK1R4TEp4Uit5?=
 =?utf-8?B?QTBhVHAxTE5IWnNNeTlJYkUwNWVLVmFCYjVOSnRVWmhQdDJMK0FmUk9RbkVm?=
 =?utf-8?B?azlXR1ppWnVCMHB3MkFxeWY3NzJBRTZETEV2RVBwUWRTbkFOODBqYjhQT2Uz?=
 =?utf-8?B?Qmg2NVc2WTR6ckU1NExvR0xXTllWcTJMVUZSeURTQVhJa3hPYmFkZkVSRzVB?=
 =?utf-8?B?RXNmMlFNU2ZhSFEzR0tnTnoyamhQQm1lM1ZBNVJBOTVHY2lFeEQyRUZXSjRs?=
 =?utf-8?B?SUtaNnRPcitua0EvaEg4dU5Ba3NXMEh3bWQ0RzF6N2VJeGhVbzIzRVU0NERK?=
 =?utf-8?B?bVA2c2hiSnRmR3lwMmpFV3Zpa0QyTi9EV2NLQy9LSDIwYTRMQVpndG4zRHVi?=
 =?utf-8?B?WHE3M2NhRk01VVFCZVNuMDU5WFBxcU5aWXJYMHJTQ3JtZDgxZVFHczJjUldJ?=
 =?utf-8?B?L3FYQnZRYnhNUTl5eERDU1VqbVV5cEJTYnRCYW50V2dDbDRFZ3JObGE1UFJL?=
 =?utf-8?B?TWpuZHRHbFBqT3RwUlEyUzh5M1BQOCtnYWs0NTQvOVJzRENjR2NWZmFJY3hB?=
 =?utf-8?B?cjJpNjVBWlJxbmRtNGg0WW4vY0tFL1Z1V2hRNTR2TEVZMDR1REdaaGthcHdZ?=
 =?utf-8?B?SElScHVSdGcyZVFhZ2VSU2lVWnhDTmcra3hOejZPcGlhT2E4QlpFTnY3UTB1?=
 =?utf-8?B?dTJnbkN6eTNRNHJVbGxQdEhoZDJDOUZidTZHMzJaamlJYU4yNGtIR09WR3Fw?=
 =?utf-8?B?N2pEL0RtMUljMzVpa3BYK0JVK3R6c2JZRzF3QXNyV0JkYVVNVmhhc1ppTXE1?=
 =?utf-8?B?T0hmMG5GTU10V29aSWlVRTFGUElSTkpBdng3LzBsVFdRdm5kWkwvRnRkQ1Jw?=
 =?utf-8?B?dS9RS1VRL1F4ZlhzSEsycEpKTnJZemExSURXL1A3dG9ieE9pVlpNQk9zNXUy?=
 =?utf-8?B?UHdRbW9DUi9qWXNTMWdBeDRmL3BUVTRuVGZiem16Sk1Bd3JBUTU0UzNqUzQ5?=
 =?utf-8?B?REUxN0diSVV3bEN0cUpnaWVhRk44Q3VQS25VNUNUVWJTSGRkQVNIaThnTGdq?=
 =?utf-8?B?R3dlaG0xNllMT2g0ODF6eUhHdTdMU1pwVW9Ob0JqcXd2ajk2Z2pZOTNETmFU?=
 =?utf-8?B?azhWRUg2QWVVaStBWGxHY3oxTlhpMEE5aTBvTTBXdFQ5UUgvdkZDc3krOEFT?=
 =?utf-8?B?ZnNsWlhMRVE4b3FqSnJwM2M3dUc2OGd6NzRac0VyaFluNWhQQnRSbkJWUnNm?=
 =?utf-8?B?bnNpZ0RpYU5iUUpDRFJMdUY2QUNvMllqeXh5dGtPMFQyUEREMTA3TEhGWWsw?=
 =?utf-8?B?c0grSlI4V0xKMVQ5bXV4R3Zja1hBSXRuNi9vTW1pNVJQZFRNVjRqVlQvaWtr?=
 =?utf-8?B?VTlsd0t3MnZMOGRzaVdZeTZMbEMxcEY3OGdJOStjdGZZRlV0d24xZHgrTHBJ?=
 =?utf-8?B?Rm5mc1NYczFmTlBzZDNmdjZtTDNqVFJsRFBpajdESTg1OTQ2cXdzMk82TjVx?=
 =?utf-8?B?cFc4bXFGZHkycmZJak40Y05qbHQ5MlNpV2RHSktKZkxWM2w5VEVaSjlSdmlp?=
 =?utf-8?B?b0dWQ0tOeWFmZmRXWGFpREVPWkFEeTI0am9iSEh5TUFDaVFMVWpMdWlaOHdU?=
 =?utf-8?B?UDFxUnZyNGZWZS96M2owSUhWM0hXVWdvQnVJYUZ0NG5pNkJUbWhiUytCWW0r?=
 =?utf-8?B?MFA0KzdTSENYTnpQdEQxMTlpUFhkYmJ4bTRzZkM5WkxEaDZ0eVVqV1lUWFZJ?=
 =?utf-8?B?OHVwd01ZSGpDM3VlZzl2NWJhMmNRM25YS012YlFyNWZvNDVnQmZrSHB4Y01I?=
 =?utf-8?B?WnQxQXBGS0NrdWs4Y2xnY2xUc21WMFF2Z2M1b0xRclZtU2RhU1JHYlI3em9Z?=
 =?utf-8?B?bFdyNXUzanNNVjNtSUVoRE1qbHUzRVh6a2FhamJSS1hSYk5nRzRvWk5lTHZk?=
 =?utf-8?B?QllUUzk1YU05ZUNianpXWUsyeVlsUmhMU2VZNFhEZk5qVjRiUHdzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e56cb761-5e57-4cfc-c746-08df3b4ea959
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 15:08:34.4249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObkU2Lf36VhmId7qqiulpfN3U8PP2jICHDI0gz9tA47kwA4Flx7bTMuk0kkHO33zhBTRpVmWNsl4vHaQHhoSyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7241
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 15:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249563

QWxzbyBub3RlIHRoYXQgZm9yIG1hc3RlciwgdGhlcmUgaXMgYSBuZXcgdGFnIHNpbmNlIHllc3Rl
cmRheS4NClBhdGNoZXMgYXJlIHRoZW4gb25seSBmb3IgdGhlIG9sZGVyIHJlbGVhc2VzLg0KDQpQ
ZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBCYXJrZXINCj4gU2VudDogVGh1
cnNkYXksIE5vdmVtYmVyIDUsIDIwMjYgNDowMyBQTQ0KPiBUbzogUHJhc2FudGggUiA8cmFnYXBy
YXNhbnRoQGdtYWlsLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IENjOiBQcmFzYW50aCBSIDxwcmFzYW50aC5yQGxpbmVvLmNvLmpwPg0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gemxpYjogcGF0Y2ggQ1ZFLTIwMjYtODUwOTEgYW5k
IENWRS0yMDI2LQ0KPiA3Njg0NA0KPiANCj4gT24gRnJpIE9jdCAzMCwgMjAyNiBhdCA1OjA1IEFN
IEdNVCwgUHJhc2FudGggUiB3cm90ZToNCj4gPiBGcm9tOiBQcmFzYW50aCBSIDxyYWdhcHJhc2Fu
dGhAZ21haWwuY29tPg0KPiA+DQo+ID4gQmFja3BvcnQgdGhlIHVwc3RyZWFtIGZpeC4gSXQgY292
ZXJzIGJvdGggQ1ZFcy4NCj4gPiBDVkUtMjAyNi04NTA5MSAmIENWRS0yMDI2LTc2ODQ0DQo+IA0K
PiBIaSBQcmFzYW50aCwNCj4gDQo+IFRoaXMgdHJvdWJsZWQgbWUgYXMgdHdvIENWRSBpZHMgc2hv
dWxkbid0IHJlYWxseSBiZSBwb2ludGluZyBhdCBhIHNpbmdsZQ0KPiBzaW1wbGUgZml4LiBTbyBJ
IGxvb2tlZCBpbnRvIGl0IHNvbWUgbW9yZS4uLg0KPiANCj4gQ1ZFLTIwMjYtNzY4NDQgY3VycmVu
dGx5IHBvaW50cyBhdCB6bGliIGluIGVycm9yIFsxXSwgc28gdGhpcyBvbmUgc2hvdWxkDQo+IGJl
IHJlc29sdmVkIGJ5IHNldHRpbmcgQ1ZFX1NUQVRVUyByYXRoZXIgdGhhbiBieSBhc3NpZ25pbmcg
dHdvIENWRSBpZHMNCj4gdG8gdGhlIHNhbWUgcGF0Y2guIFBsZWFzZSBjb3VsZCB5b3Ugc2VuZCBh
IHYyIGZvciBDVkUtMjAyNi04NTA5MSwgYWxvbmcNCj4gd2l0aCBhIENWRV9TVEFUVVMgYXNzaWdu
bWVudCBmb3IgQ1ZFLTIwMjYtNzY4NDQ/DQo+IA0KPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9t
YWRsZXIvemxpYi9pc3N1ZXMvMTMzMA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiANCj4gLS0NCj4g
UGF1bCBCYXJrZXINCg0K
