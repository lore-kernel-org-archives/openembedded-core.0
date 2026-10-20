Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9809.1792508569650977627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=DepfwsnY;
 spf=pass (domain: axis.com, ip: 52.101.84.39, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bImWUdCUQWULr4q+lvxsgl5DbiwOLirEVoZ2ftpyQMZ3i3j1+vtXe3xehTRMJ6Em0Or2JPvIbq+pCiMH+2khuFxlPQj6yKIDIsryapQa8um/1GDu85NXkbhwpo1cVWvq6fBbUhx66HpuFXcviCOh/9KwP38FnmzbNKGar+hqG3pSOFeUossC8sl5Il+amIIbc2svgytumZyZrXLVmwmZy7LZazla1tAxSEl2phd3e6IzkeU+iaPBGjsJUH01IH/1DLSjwKNzK6efyyp5urcFPZd3cDReeLAJWgHfcaoMh019uRdEnqcUkaqn3VDdcgx+NJXaZVfRBnJhmAIb9oiZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/w67LbAnWcXULtbPyBeMtymDZlMBKMlqFgpfT0YuVw=;
 b=MFF+a7jQahM/qMI7Cug1HjW4oX27YjJkJyZ+aucm2YLrxC+VN91apbLSUHZjsiyZDn7opG8DqUMKizZqTw8bHlq5r/oM8uoNaTmDL0rPi7mf+bwA0vVCbP03wUv1CU7TYfRJhYg+Yb9ywMj7Akn6Cnq5e9Fp8nsdYy46Zu4FHNGY0C4GRn8w2Z3xDq46PL73HNQ8V/2fR/tfpW4khtT6y69QcMYDRqOQDTmx+xL3wSUTgS5ynBRHwrcb8snm3DekzBTC2MDgYObtQCuq5LpAUVcM/YNvId9coWNJt4KVj2BkfpjiOq013Iq84ZyDYvDSDlX1RKLkkWh66E0loxI4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/w67LbAnWcXULtbPyBeMtymDZlMBKMlqFgpfT0YuVw=;
 b=DepfwsnY05/VHPdiOr2l3n53IDM+eVi+lZfsRhYmOnoEjVuVp3pe9IJoYaKagxZaGKN/jfrGvq8EcpEUha3BzWyVuBcgVLjP3MfyXeccrAS/wI/DCOks4+XtnxO9tN+vSbjAr8i8YvXjBLYjiVipkZWxN4V/8Pb0Tpt+vAd0A2Y=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB7961.eurprd02.prod.outlook.com (2603:10a6:10:33a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 15:02:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 15:02:43 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [master][blacksail][PATCH] stress-ng: Inherit pkgconfig
Thread-Topic: [OE-core] [master][blacksail][PATCH] stress-ng: Inherit
 pkgconfig
Thread-Index: AQHdX8y9JrEw5VeAw0mhAYBVBGTKcbcFCXywgAAE0wCAAXn3sA==
Date: Tue, 20 Oct 2026 15:02:42 +0000
Message-ID: <DB5PR02MB10213B99E2C05F588F47AF679EF672@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261019125142.3407486-1-pkj@axis.com>
 <DM8UGZKR7J6J.1VNILIXTWOKFX@smile.fr>
 <DB5PR02MB10213A79139833095C2138813EF982@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <DM8YGQD3JEF9.38I4XOG3YVEX6@smile.fr>
In-Reply-To: <DM8YGQD3JEF9.38I4XOG3YVEX6@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB7961:EE_
x-ms-office365-filtering-correlation-id: c6aa7c77-c41b-4ccb-8255-08df2ebb3142
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|10067099003|22082099003|4143699003|261009223027099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: 4juczgSb24e9X0kbzmuU42FRFHDkqe0Q9bHVIDneSdG58ZxLUNgEA14MSEt5vDBAqaKwqiYzh31/T11djySdGVPgeTNDJ7eW63GzqOcW6aNtZ1lPG3A8ynjESbex3K0x8xPx+PA95imx8n07GCiyxlLMKubFsc00IkFN76Hw7xIvQ24qZOOv/OJ6l/vA5BeVJM+DPryEqrhsjzb+v4Uahss2kGMLGEQlCeXyDUuzH11RM2gFIfMdV2xZFPNLvz/+CCG4UF2IdB9v3nFX7GVNkX+SmP/mhp1PYwSeGLyuqFAbgFj9rsl7lggrkYt2VByBxfrg8QHC2cTABaQJ78pBzPzN88uAvuFsfg46GpxQV8TqEHir3OY2bt15j2Fdge+hxRrwsBq+VDKQWKS/zYyq6R9JYAgX4jhQtBKUtgHSAlD5wCGAskaKmQIDBvL6tsnVwftXbJv0JdKllwCNLu9D0LCEvanGD4Shxy8oX5tMFPjdj/D2J1hKXDjcvm3kCR+KHvtaJ1GCQB4IANCjgLH4PhFr8c5HyTvTpvYftvbDGdr3FeAjQ4YPOQDK6YW+ND+efklykf+3yGP8eXxVyF21eaGIbVUTbJUzwhGKKq79adioLVUKPNTCYQctb+oOmpNGkVp+woXnx3u95fssvv9T55r/5QWLvck52E7kJeaTdwuAMl269tR0rP35CkTvOZch8PoAdLu/j35o0W0XQSWurzpjec5fr+XkTBJX3m7/LnY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUh5WGFZL1czVkxCdDlUL3ZZN2xQdGJMRTJLb09oeSsxZWkvMWwzdVJMbnpN?=
 =?utf-8?B?UmxZZFhMQlJ1NGplRGdpaEtBQVhyRWdSUmZsbTV0UXpTR2xKZ1UwOGZiVzVT?=
 =?utf-8?B?YVV5bU5jbFp2MjNDYllkT0cwaUNENWlkcDNqTUZBS0ExWWhqUTk5TWtvNitH?=
 =?utf-8?B?cWtEZVdva0pBUGw2T3IrYTBBMVNtV2RUeUxhK2tnZHJpMmozUGVGR3ZPaFlj?=
 =?utf-8?B?bFdnUm9sQTYyVHQrTkdqR3IxUFJ1cXhiSndHTE9IMTVNN1N3OTdnY3ZaVFZr?=
 =?utf-8?B?alF3NGFCb3R5cE0vSzlKZ3g1TGl4Y0l3UVY3YnhLVVBXM2t5aDhmTEsrOElz?=
 =?utf-8?B?TTBFK043M0svK1U0ZnFHdUtidDJvNW8rdjhxY2Y0cUM5eGRFcnVFUWhIUDcy?=
 =?utf-8?B?TEZCd2NDUkdMUkFBajAveFBmT2xTNnltSWl2TmdHeGVvTklzVW5KMXlQdng2?=
 =?utf-8?B?TEhvR2NsVnNpcW14RVZXYXM2NVArWVM3VkNGSW5aSXZCZ0FJUUgwYnBXcHEr?=
 =?utf-8?B?ZGQycGwzQWNqaFRSbTZ4M3p1L0FYaU5GUGNEaHNka2xrWEpBQUtTcGpteTVM?=
 =?utf-8?B?K0hXR3k3VnpZUE9WZjNwd0hPZVBYZXUrS1duQ3AzRm9FSVFlWjV6Q01GaXRw?=
 =?utf-8?B?RU9YdlFRT2hHb2lSaS9IOVhMc1hjYmhyREN2ZTR1N2VjUWI2Qk9Oby9aTmZs?=
 =?utf-8?B?S1N1S2l2RUVGVzYwZi9DTzVRSzc0clB2d1VWd0k2WXpsZVBySTNkb3c1Nnps?=
 =?utf-8?B?Q3ZXOHNMMHJMYytlWVVmTHpuVEhaUkdNUHdmcC9hK3ltM0dOcnlvWEdmV1R1?=
 =?utf-8?B?VXdWYVdiZTIzZ215ZHZyRGVQYUg2OG10dE5LZFlCYVdNZHpybnRCdTcvbWta?=
 =?utf-8?B?UHJxcHYvQ21JeTFwMmVCMXJwYmIrQzVBMVJKMDNqR3B2WDc2V3ZpZHUrZ05V?=
 =?utf-8?B?T0xxTHBJdENEMTNMd3NZQmE4TUN6bWNhYlBLU05YelNiZ0QrdVhNUWRLV0FY?=
 =?utf-8?B?S0FIYzJPcTk5NVRUWDhPWXc3My9yQkhQbTEyM1FzbDRWdVltRU0xZVlscFdX?=
 =?utf-8?B?S2wrQmlicnV4bzg5RWwyRDRuWjExSDlNZDErZDBBekh2MXN5bDdjdVlNejJa?=
 =?utf-8?B?dU9PY3lEbXZrUUxtQXRQRmFLL09aeGJ0aWlkcEpjU0daM2ZVTGRDd2dwRGJs?=
 =?utf-8?B?T21qK0orQnBLUnRZSXo5eXVaRzRSUzdlWkFrTkl3U2tFR1pjS2hrZVlSdlVD?=
 =?utf-8?B?V1hrbFlzVkNzYXVlbU9KdTE1M0k4emRWSTdmSXpJMVV3dXpqS0dWS2tWL3FR?=
 =?utf-8?B?Z0hUZDJ5Yy80YzJ0UFB4UUxFZjZTOGNxd0xPZ2dybC9nekxrS3g5dXkwWHFR?=
 =?utf-8?B?THZzT3YzSE43RGw2dkhpOXhQdUpINnZIWCtvUW54TFZpRDJVSmQzdHhEU0gy?=
 =?utf-8?B?aW9qN0JIUm5Uc25wVnZzR2hvYkVhVVgyOHlONjdmQUxybExVREpVODVqZEIv?=
 =?utf-8?B?ekdDdWxhck5iTEc5YVZBRWI3M0w2UGk0bDZSaW9wcHRGc0NhalZUY3RHNC85?=
 =?utf-8?B?YjMrVVFJMFdwenN3UjE4ZVc2eFRzRzJIdEVEMDUxZDQrUjUrVEFhUFZQZmpB?=
 =?utf-8?B?dVhrcXVhU2JIN3FVU1BvdFBzMXYySkIvcXpwRkxRN2pxcmdhM3hKYndpTExF?=
 =?utf-8?B?R2xZMFNCamFNdTZVSmsxMmMrbWNvU3RNVDBtVDVrVHhCR1Nsem43MW4rZUdy?=
 =?utf-8?B?NFFVSVJ6aWUrVWFFT24wbndGazNhSDZTZmVKL1JmMXNIL2swbzBFSEk2ekdh?=
 =?utf-8?B?WjF3blFZSmRsWTNkV0huanhTVSttWEhSVmhjMUVFZmY1VTdjbVBFYkp4VzNw?=
 =?utf-8?B?bDVaaUNKT1owYzl3WXRUbCs3QWs1RGZaSnNjSmJDZ0RWSlRFV2tQQ2laVUU3?=
 =?utf-8?B?NzQ3cWNnZ3VLd3pyVkRxZ0FLZU9nSExGOGF6dVhhWjRmSmFmcWlLd3ZQUklS?=
 =?utf-8?B?eTY3ck9VaWI5MWltS2hVakFJSzk0TkxlZEtBVGZBV0lDZDhya05Ba2hvK2pF?=
 =?utf-8?B?QWRVOEdFaitJYnpKZVh5N0RvcVJhcnUzeDEvaW1pS3dKdXRWTUliVWtFOEZo?=
 =?utf-8?B?UjRLWmE5eTVnL2V1Y0twcThhMGh3Wi9uV1p1MVhNWno3dXVNU0VuMVlaZ3I3?=
 =?utf-8?B?VTJoUGtoQ1J6UkQyRWlGZzJoV2pUNEhGazZmWnBmaCt2a3FrbVR1M1lpWEFk?=
 =?utf-8?Q?pDLwYjR0B86fC7iMHVxIbg2gcGT5AbkhKabJvw2axM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6aa7c77-c41b-4ccb-8255-08df2ebb3142
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 15:02:42.9964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zf2SIfj0dsTW+rh3fxa5WLOf6nMYM6sgJcEEKF6PpTYT5cYFBc/RMeGtfy2YbSjN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7961
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248299

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZb2FubiBDb25nYWwgPHlvYW5u
LmNvbmdhbEBzbWlsZS5mcj4NCj4gU2VudDogZGVuIDE5IG9rdG9iZXIgMjAyNiAxODoyOQ0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gW21hc3Rlcl1bYmxhY2tzYWlsXVtQQVRDSF0gc3RyZXNzLW5nOiBJbmhlcml0IHBrZ2Nv
bmZpZw0KPiANCj4gT24gTW9uIE9jdCAxOSwgMjAyNiBhdCA2OjE3IFBNIENFU1QsIFBldGVyIEtq
ZWxsZXJzdGVkdCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogWW9hbm4gQ29uZ2FsIDx5b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+ID4+IFNlbnQ6IGRl
biAxOSBva3RvYmVyIDIwMjYgMTU6MjENCj4gPj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0
ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFttYXN0ZXJdW2JsYWNrc2Fp
bF1bUEFUQ0hdIHN0cmVzcy1uZzogSW5oZXJpdCBwa2djb25maWcNCj4gPj4NCj4gPj4gT24gTW9u
IE9jdCAxOSwgMjAyNiBhdCAyOjUxIFBNIENFU1QsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPj4gPiBUaGUgdXNlIG9mIHBrZy1jb25maWcg
d2FzIGludHJvZHVjZWQgaW4gdmVyc2lvbiAwLjIxLjA0Lg0KPiA+PiA+DQo+ID4+ID4gU2lnbmVk
LW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+ID4+ID4gLS0tDQo+ID4+ID4gIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3Ry
ZXNzLW5nXzAuMjIuMDEuYmIgfCAyICstDQo+ID4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+PiA+DQo+ID4+ID4gZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMjIuMDEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjIyLjAxLmJiDQo+ID4+ID4gaW5k
ZXggNTQ4ZWRmMjkyYi4uYWRmOTMzMWNkNyAxMDA2NDQNCj4gPj4gPiAtLS0gYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjIyLjAxLmJiDQo+ID4+ID4gKysrIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4yMi4wMS5iYg0KPiA+
Pg0KPiA+PiBIZWxsbywNCj4gPj4NCj4gPj4gbWFzdGVyIGFuZCBibGFja3NhaWwgaGF2ZSBkaXZl
cmdlZCwgYmxhY2tzYWlsIGlzIHN0aWxsIG9uDQo+ID4+IHN0cmVzcy1uZyAwLjIyLjAwLg0KPiA+
Pg0KPiA+PiBJJ2xsIGlnbm9yZSBbYmxhY2tzYWlsXSBmb3IgdGhpcyBvbmUuDQo+ID4NCj4gPiBU
aGUgcHJvYmxlbSB3YXMgaW50cm9kdWNlZCBpbiAwLjIxLjA0IChhcyBtZW50aW9uZWQgYWJvdmUp
LCBhbmQgdGhlDQo+ID4gZml4IGlzIG5lZWRlZCBmb3IgYm90aCBtYXN0ZXIgYW5kIEJsYWNrc2Fp
bC4NCj4gDQo+IEFncmVlZCBidXQgdGhpcyBwYXRjaCBkb2VzIG5vdCBhcHBseSBvbiBibGFja3Nh
aWwgKHdoaWNoIGlzIGF0DQo+IHN0cmVzcy1uZyAwLjIyLjAqMCopLiBDYW4geW91IGNoZWNrJnNl
bmQgdGhlIHVwZ3JhZGUgc28gSSBjYW4gYXBwbHkgdGhpcw0KPiBwYXRjaCBvbiBibGFja3NhaWw/
DQoNCkR1aCwgb2YgY291cnNlLiBQYXRjaCBpbmNvbWluZy4NCg0KPiANCj4gVGhhbmtzIQ0KPiAt
LQ0KPiBZb2FubiBDb25nYWwNCj4gU21pbGUgRUNTDQoNCi8vUGV0ZXINCg0K
