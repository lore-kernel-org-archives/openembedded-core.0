Return-Path: <chunrong.guo@nxp.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10040.outbound.protection.outlook.com [40.107.1.40])
	by mail.openembedded.org (Postfix) with ESMTP id BAFF37CA82
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=innj7zN3gPzdphOobLt7CGinuEM6xADoAuCl4UzsYQQ=;
	b=e1SPBp6TNY6+HzwbVanr2p2LCUeJdTUaY/VXhFU4sDLAEQ4Ykbm3qM4lOBownRsRCkxLc4uJ3uCmpu+nDwgGpAbGfjo5mieb8fRE1szjv+2mnGniGjlZIGOW6dFLt2SLLYJjV+9E8lWNlD4mdcHcxcq9O00x32a9UWp9skWa0Ds=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4282.eurprd04.prod.outlook.com (52.135.131.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.19; Wed, 20 Feb 2019 08:25:58 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4]) by DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4%4]) with mapi id 15.20.1643.014;
	Wed, 20 Feb 2019 08:25:58 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] glibc: support powerpc e5500 and e6500
Thread-Index: AQHUyBcGSl/8OVwP+kqgbWHbs1UL4qXnUgkAgAAFUoCAAQQTcA==
Date: Wed, 20 Feb 2019 08:25:58 +0000
Message-ID: <DB7PR04MB5068C00B01DFBAD510E6ECBD847D0@DB7PR04MB5068.eurprd04.prod.outlook.com>
References: <1550555410-24852-1-git-send-email-chunrong.guo@nxp.com>
	<6ddad18f22efe93d86c8ead0bbb0114e861fe9e9.camel@linuxfoundation.org>
	<CAMKF1soq_rQ5WcQuAStm+RZ+C1FEhM0jJC=6S9QKreB4jXauSw@mail.gmail.com>
In-Reply-To: <CAMKF1soq_rQ5WcQuAStm+RZ+C1FEhM0jJC=6S9QKreB4jXauSw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00abd8a6-24f9-478c-35b9-08d6970d0a58
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4282; 
x-ms-traffictypediagnostic: DB7PR04MB4282:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtEQjdQUjA0TUI0MjgyOzIzOlNIMm1jcjNsZmFCcThrcGJTRmlFR3pxWmJK?=
	=?utf-8?B?WWhTMm9QMFZwTDRuekIrUUl5QjhpNXRRc0t5TE54RzM3MExtY2l5WFRMeWNF?=
	=?utf-8?B?dnZ3cnI0em9NRWljRFE2czdGNm1WS3J2TkhERXZFa24zRGc3TkpQaUgwaXox?=
	=?utf-8?B?SUtDTElCdllpMzloa3hqbUJJaHJFTURZUG1ESUorSDFwZWZhUG4xYVNzRWRw?=
	=?utf-8?B?a21mUklZRkxocWc0Z3owK1JuNTBhc01TMjQwTVRDbGprYWJESHNGa1ZBSjBM?=
	=?utf-8?B?aGRaeU52OUU0ekVwMUY2Vk5UNzJqMDg2QUh0Z2NKYlV4T1JnalJsdVNld3ZI?=
	=?utf-8?B?a1JZMXJGVXdqNmxBdjNIbnF1TGExcUQ5N2xWTmNOblFoU0I2dUlna3QvRHcv?=
	=?utf-8?B?S3FYMDBjYXhHQ3ZZVHFtendWTTR4T0s5bldUMGNNbEhLV09GMkttYVhaNlUr?=
	=?utf-8?B?MERHcUpuRGhtdEc0NkNlU243UXZrWGs2bmVidFRmNjkyTmx0QkdGTUg2Sy9z?=
	=?utf-8?B?bFBrczVrWmpJTFIwRkU2UVNvNGh3OGhGVFQyOGFpNTY4T2lZeVhLNXNNcUpW?=
	=?utf-8?B?MGZuRm45VGwxQlUwYlFrdE51TE5XcWg5TzJIeDk5T1VLNmJlVHdwZzNhZDdr?=
	=?utf-8?B?bm44Y2NReWNkcnk3NHByeDI3TWo5cWdmclVrNmJrQnBUQVFqVWxwbkhURHhI?=
	=?utf-8?B?STRSSVdKajZUaXo0S2hZbk1jbFN4Mjc2KzhlcGlQQnBsS09ubXFtL3l6dnN4?=
	=?utf-8?B?VzEraU9kbWU0V1dkL3pJdmhmc2ZlQ0FnQzZUdmM2OFlPNTJqNXFUa0JKS3hX?=
	=?utf-8?B?UU1JcDZFVk8zMWZCRm9tR0xNSFViZms0dUd5aXlZSGNkNjJpUno3NVg1M2w5?=
	=?utf-8?B?RXRmTERkWjZWSCsyK0dKdkFZbGVITlFKOWpjL05IdmV0bWZDQU9PMGRWUWx0?=
	=?utf-8?B?UXZ4NDZCVThhRDk4cVJ3UTNwdmlmMU9pclQ1bzl5MlAzbVUvSWZqZFZWVUpi?=
	=?utf-8?B?blprNkFXcE1wYXY3K2dHSGRsT3hGTlF1Z2hmZU8vb2UxVEp5WmtoSE9VS3p6?=
	=?utf-8?B?Tmc5VEdLSHc4RzBTTmZCbHozeTdEVWRHa3ZvemxIb2YrS3Fjclg1bG4wSUVP?=
	=?utf-8?B?MUs2K0lMWTBGdXVYVWYwTVZLNDJsQWtBQ05qU3JkdlhCYkg2cmtNVlp0aHVT?=
	=?utf-8?B?YXJOMCtiLy9VbmlRVlNkajQrZnI2SlpoWnE0TnF2MFlHL3R0RE85UW1EVHls?=
	=?utf-8?B?Ym8wZlFWM3lLenVTRlprQllraGVzMEdGVzg5U2hRMk83OXFmbDJHSDdoR1c2?=
	=?utf-8?B?bk0wWkViNVlkRzY1bk1tUFVTR1pKdmo3ek1jWkV2TTVvTVAyTW9xRjYzeWor?=
	=?utf-8?B?TnUxZDFFT0N4R0NCbkZ0amkyTUJYM0tBTzlnRjRMeHJjU3RuaEFFN3JRSm5s?=
	=?utf-8?B?bk41RnNjMUNiRXpXem5yL3dINkJ5eW5QaGJlak9HNFFhMG83RDYzSkRYVlV3?=
	=?utf-8?B?Z3RwQWFBVjE4YnBJSHdCZ1luSDN3anZzdTJpSkh2cCtjeUQ1VmJnYnlFUFFh?=
	=?utf-8?B?WnZVMEJ1RWhWMzBqeGlyeVJvekNXaVhBakM1c1ZLSDExMHM3ejFkVG03VnBn?=
	=?utf-8?B?M1BsUktyKzk3b1ZONmhJeHpTVWgwL2c1VWN4d1g3cWgvVnhKdkxHMDlzZHh2?=
	=?utf-8?B?eldjTUV4RE9FRy9BYWN6elVkQnB4cVhXMFR3dkdWMjZLQk12d3NkaGFJQnlk?=
	=?utf-8?B?ZEJrNFdPaDJrejVGYjg3Zz09?=
x-microsoft-antispam-prvs: <DB7PR04MB4282DC852804BC0BD62E623B847D0@DB7PR04MB4282.eurprd04.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(136003)(346002)(396003)(376002)(39860400002)(199004)(53754006)(13464003)(189003)(25786009)(305945005)(5660300002)(106356001)(86362001)(6506007)(45080400002)(478600001)(71190400001)(71200400001)(102836004)(105586002)(9686003)(316002)(68736007)(4326008)(55016002)(110136005)(74316002)(3846002)(6436002)(256004)(6306002)(6246003)(53936002)(6116002)(53546011)(7736002)(97736004)(7696005)(2906002)(11346002)(446003)(33656002)(76176011)(66066001)(486006)(81156014)(26005)(8676002)(99286004)(14454004)(81166006)(476003)(966005)(229853002)(186003)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4282;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vBMQ5WVis/QfWGXCk4JbbvbPoDzzydlhFlpBbF7KkH6cBIMbElSgr/RkKgwe7nkexs+OfGUlmlNSaq1tmx2d8hzRk0GVGxTutfyGUGcK/Bolc1bL0A5IVeRGRO7Hx+3ipJz60fn9SdaJZNCxWHjwjy2phpvZiEzAi00lOh9IaGn/LIMCkmweMwSX7znL92Wyl2wFcwjPHrrY/LekRIc+YEoPP9DQU0ZfHYUSxywvAvLc5hgYf278l2kXOTeNbnQjNhy9KDpsBMFwS0fzOaG6cT9elurIwx1+XIPnKzbdoJdqrPIJbmc1ViVUxL6PO1ml6mipeK2VJ763IH80hVCbUSo7JpZ0Mj7OctA/xCBx0jbj+wA7vhHBnk3+ZjQZKlDY8Xsq2YyYXK2RKr6yDiUGNDA3KebkkQsZ+ahZ5AThhFc=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00abd8a6-24f9-478c-35b9-08d6970d0a58
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 08:25:58.3005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4282
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: support powerpc e5500 and e6500
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 16:01:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLA0KDQpJIGhhdmUgc3VibWl0dGVkIHBhdGNoIHRvIGdsaWJjIGdpdCAuDQoNCmh0
dHBzOi8vcGF0Y2h3b3JrLnNvdXJjZXdhcmUub3JnL3BhdGNoLzMxNTMxLw0KDQpUaGFua3MNCkNo
dW5yb25nDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIFtt
YWlsdG86cmFqLmtoZW1AZ21haWwuY29tXSANClNlbnQ6IDIwMTnlubQy5pyIMjDml6UgMDo1NA0K
VG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0K
Q2M6IEMuci4gR3VvIDxjaHVucm9uZy5ndW9AbnhwLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnbGli
Yzogc3VwcG9ydCBwb3dlcnBjIGU1NTAwIGFuZCBlNjUwMA0KDQpPbiBUdWUsIEZlYiAxOSwgMjAx
OSBhdCA4OjM1IEFNIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPiB3cm90ZToNCj4NCj4gT24gVHVlLCAyMDE5LTAyLTE5IGF0IDA1OjUwICswMDAwLCBD
LnIuIEd1byB3cm90ZToNCj4gPiBGcm9tOiBDaHVucm9uZyBHdW8gPGNodW5yb25nLmd1b0BueHAu
Y29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bnJvbmcgR3VvIDxjaHVucm9uZy5ndW9A
bnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2dsaWJjLzAwMzEtZ2xpYmMtc3VwcG9ydC1lNTUw
MC1hbmQtZTY1MDAucGF0Y2ggfCA1NjQNCj4gPiArKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4yOS5iYiAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDU2NSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCANCj4gPiBtZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy8wMDMxLWdsaWJj
LXN1cHBvcnQtDQo+ID4gZTU1MDAtYW5kLWU2NTAwLnBhdGNoDQo+DQo+IEknZCBsaWtlIHRvIHVu
ZGVyc3RhbmQgd2hldGhlciB0aGlzIGlzIGxpa2VseSB0byBtYWtlIGl0IHVwc3RyZWFtIGFuZCAN
Cj4gd2hvIGlzIHVzaW5nIHRoZSBwb3dlcnBjIHN1cHBvcnQgaW4gdGhlIFlvY3RvIFByb2plY3Qu
IERvIHlvdSBoYXZlIGFueSANCj4gaW5mb3JtYXRpb24gb24gdGhhdD8NCg0KVGhleSBhcmUgZmFp
cmx5IHVwc3RyZWFtYWJsZSBwYXRjaGVzDQoNCj4NCj4gQ2hlZXJzLA0KPg0KPiBSaWNoYXJkDQo+
DQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHBzOi8vZW1lYTAxLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmxpc3QNCj4gcy5vcGVuZW1iZWRkZWQu
b3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGb3BlbmVtYmVkZGVkLWNvcmUmYW1wO2RhdGE9MA0K
PiAyJTdDMDElN0NjaHVucm9uZy5ndW8lNDBueHAuY29tJTdDM2FjYjE3NWYwOGJjNDE4MzFiYWYw
OGQ2OTY4YWY3ZjAlN0M2DQo+IDg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdD
MSU3QzYzNjg2MTkyMDkzNTg5MDY3NCZhbXA7c2RhdGENCj4gPVhIQmFkS20yd0JINXNjaVlxYUFx
cW1pYXBHV0FvNlM0Yk81ZUdPJTJCMVlDOCUzRCZhbXA7cmVzZXJ2ZWQ9MA0K

