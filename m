Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web11.7080.1613733575632766779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 03:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=E8bdmhVi;
 spf=pass (domain: siemens.com, ip: 40.107.21.88, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYFBl94gxmPd4wsiRQGQ9vK9VP0cr4cyspHGV70D3uNcsjUZnnu8bMTUGSauZfI3i/HZvwyR3U24kVRrlST8fSw+aq6pbx2huNq08jND7nzYVEDr9JJQWQss3UDy/EF1u33fsK+st3iA6I+hFsOEo5CnlTXI6384RhBNYOTuVwRObcd0xwtD+W3B9vs6XX0WSe98eVIih/ctwepvHlH7me4N2U5y9rsR5dZuxJH181JFVDoTfiX08mfrXqw+uxUeZ1zvOKGbIIjQnsgawiFut65EsAfs3k/w2A3tQAAq0hwHjOl/0e+P1wu58Fxs019iDqKaCVRWlBo5vwIFCPtGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGowmi86Dsga/N6jgnq4DtZDA4/lQOXO4ATl2Ky472U=;
 b=bFr6H1/VQPu0PuEZ8pzWTt0yciUM2lYTvpqOK+3rIupOjTWlrgdQhNwQuuqGh0F/AwwOJjVXfwXrCejNnquHifxu3VyFFjpp3Im46qsqLIqFlxPIaB6jLn4wQPAqAEMZhmDJ6CXgK0bVTnoRk+41crzRWVMPYBJZfvl31eBCKJaUnx7ugQoBu25lhzUccmBp4iDI3D9GKD6auoYE3DS1317irJodyGI7fawHbkTFWrGnMWkhpM30fEbOYHZ/vwFRLhXA4daDhiBD8AtbmKV9iSB7cUScoTGF+nnmcuinosgbhdxecWzPUhsWzfwAr3tVL2Wxv5Ar2XlvYflMPUqi7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGowmi86Dsga/N6jgnq4DtZDA4/lQOXO4ATl2Ky472U=;
 b=E8bdmhVizvi/Hb70vxlwllAO/eZ70+0CvPtC3B0OiYGFRYfV0W9iDVybqD0A+NdkLeL4jpIPg2vRbfUs7XrGeo84eVozeggc6tbI1w8yl1L2WmCFUAkF1vJhHVtvSc3CvOfYrypuVkivtjyyHMXw7rEO3z1/syg40GgXAmqhaxo=
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM8PR10MB4209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 19 Feb
 2021 11:19:33 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc9b:2590:a1cf:3301%7]) with mapi id 15.20.3868.028; Fri, 19 Feb 2021
 11:19:33 +0000
From: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
	"henning.schild@siemens.com" <henning.schild@siemens.com>
Subject: Re: [OE-core][PATCH 0/1] wic: warn on usage of Y2038 affected file systems
Thread-Topic: [OE-core][PATCH 0/1] wic: warn on usage of Y2038 affected file
 systems
Thread-Index: AQHXBfbXdapzdhrNREqjjctgPRwPHqpfT5gAgAAGqoA=
Date: Fri, 19 Feb 2021 11:19:32 +0000
Message-ID: <63367642579f08f14d87cfcb8212483aaabf1ba1.camel@siemens.com>
References: <20210218130559.43404-1-florian.bezdeka@siemens.com>
	 <6e28620fe97ac6c3363ef47c12d7333b2c4b1511.camel@linuxfoundation.org>
In-Reply-To: 
 <6e28620fe97ac6c3363ef47c12d7333b2c4b1511.camel@linuxfoundation.org>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 68672998-62d1-437a-5807-08d8d4c83ba8
x-ms-traffictypediagnostic: AM8PR10MB4209:
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM8PR10MB4209D27C0D66590C25E4DFFAF6849@AM8PR10MB4209.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kaq8X07+mq4s5FonHoxf+BjkrP9r916c9hDV89/1lVg5+cYQ7JdF9h5/kwbUd4qHdZLTffSuV5BtvtEJdOtmVD/bLpUUnYBMeHBA0FAt8xFTPnR48N2oDpJEeVA4/73/YPoGwgzrz4PihfFvNZY+/osVP5GQMozsnJyI5aLxW9J0itHD3LOpFcd/wP87TRrgl3tt9dcf95lJS9uZcZN63ACNllLxb4otWGjw3FpvQ6n1Nu3sPSP1aIwNlGHmi5Waq+Bb3J4tIwPVfBtczBY7dcyGzITlteheJstX0C6YBO4bi5fkMdf5mc+v6qY0aNB9W3hDtupjuA7BBJj0xNBuNWl1dzmNoFhVngvQe/etADKwf+Kjp3BApHArgFpD7pLl6bikZMEqa7+h7aLKzLi335UiQX3J3b93v3sJPEKLyKnGsfteivEpOePyOVqKKx6AL5ltYgils9YQO+e+qws2fLEJq329SHEn2c71cjUFYueNuet16vaS60D5WF0Y/xYYmPRV04C3dA7wvuyKpDppXh1DGBnPgdRiATf9ztwnSnti/wyZVTviqEs7o50NGKuL26RmnFs9rngxoiG/129TK/qxlkjQt6mYiFR/WlillQc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(66446008)(64756008)(66556008)(5660300002)(66476007)(91956017)(76116006)(186003)(66946007)(71200400001)(86362001)(83380400001)(2616005)(54906003)(8936002)(6486002)(966005)(45080400002)(8676002)(4326008)(36756003)(6512007)(478600001)(107886003)(2906002)(110136005)(6506007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?NDFrS3JQQUZOOU04V29GQXpZRUVHQ1NVcGkrbEZpWTZ5blhnZDhLN1Z6dHhN?=
 =?utf-8?B?azRpS29VTjFTQmFIZ3VXdGI0aXFqV29zWEo2KzlTSy9xd0pueVM5dDdjUEdL?=
 =?utf-8?B?QjlxZU1DcEI5ejBjZmZhUE5IQXovbTZZYzhRbEhLNUlia1hFck05UjdrUWhY?=
 =?utf-8?B?dG5pTHZ2Vk5LaVhYWE9WVmFSVTVwb0xLMHFvVm9SbTM4R25ra2FGN3hVb05k?=
 =?utf-8?B?NkJHa3dmdXJpQUxNZ1RDZ21OdVZPMHhSc3ZmaWNtekp6aisxSVNzMTVTTTcw?=
 =?utf-8?B?b0tNYzE2K29xa3ZuakU0VEFONS9MeThCTWJEWVRoL0FLMUFkT1N4OWhiYWZj?=
 =?utf-8?B?aDZGM2lSa2x4V1AvaXA4ZEhCZXVyVkM4Ti9JaGFQU1J6czdXbzQvaERJUyta?=
 =?utf-8?B?M3R5R2ZBSkJnbFh4eE8xYVNrYkZDV21rV0NpNThBMk9oQ0NhNTk0WTdCNWR1?=
 =?utf-8?B?T093bFhXZWFOS2g5LytIL2pTSzd3TlM4Wm01L1pwQ1VmRHFwVk5TNjZ6VE12?=
 =?utf-8?B?UU50cEsvRFlXamJQdHZBemNzNmFyR0tFZlJTaDBqZCszQ2U0UTJ4cnpGTUhM?=
 =?utf-8?B?YWRDcloyYzBwVkU1a0xNbStSdXFtWVRMQ2xvVEowMUJiUkQyb3RDMVVUWk45?=
 =?utf-8?B?Z2ZCTktNeEFsSDlBNnp5a2lPQVltclVTMG9UTStUaXpQTkpEckNhcHhOejJo?=
 =?utf-8?B?QVFlclV0SWtOa3FBYWtjR3VJMUpLd1ZFSGRhR3RXV3M4bWZyOXpYMlB6TkIv?=
 =?utf-8?B?dHcwd1kyOG1zMmR3N0xvUVUzS2lUeEpkYUR6WHFTQnYvS3JkRDQzMlpmMVdk?=
 =?utf-8?B?Tm5nSnpPNEQ4dTFKY0ZxOFNRTHpQTFAvZXpoV3Z6TVovZ3FPblZyNjdsbEFz?=
 =?utf-8?B?R1JLUzdmcmdEcDBWNnJYcllOdlh3bE56cHp2WDZQaDBkeTRwcUdEa25NMzY2?=
 =?utf-8?B?RmN4YWJ5MkpuVHJsaVlRbjhSSmpyZXI2TmN3STZmYitvWExYS1ZDQjJLaGZ6?=
 =?utf-8?B?VnZSV2toUTJrZGQxdUVCTW95dnl4OWljb3ZidmFvOVRSMlFIdnlTQlo0V3ox?=
 =?utf-8?B?MXBoN1BGNUdzc1N5NjExcE9RQWIrd0syWXZQci9MaXVVV21yRUhwTGdUU2gw?=
 =?utf-8?B?TFE1WGk4bmtlalZWa0dXaVhwTTZkdENFMXBYZkJDUHBkVmU5ZG8zaEJBeWJO?=
 =?utf-8?B?K2t1dldXcE1tbytGeWN3SW1tN0N2d3hMckdKSXFSaTJhejJ2UlZVNWhlSXVP?=
 =?utf-8?B?OUFhTXBiQVRKRm9qa1FoblU4VFRNcFNYbC9pU0J4eGFLUUpDSEJsTWdtRDZY?=
 =?utf-8?B?MTd3dFQ2OVpRTlcrL09KdldaVGpYUExlbmFpbnZTMDRaZi9OdXRJRW5LY0Jh?=
 =?utf-8?B?QUdDL3YvVDgzVHlnRkl0SGVCNzhIRHJ3RmVONkowMGJHN0EwRktMN05mNnZH?=
 =?utf-8?B?Q0ErWGkvRWFWTjZmMUdpbVBjMVo4anFCOUo0ckdycE1MdGZYQlErZGJpMkdL?=
 =?utf-8?B?SldJRTMwN0JRc1pFd2pKTzZUOTJETHRuRmZPa2FnM01mR1BMWTcwTnAzOGNQ?=
 =?utf-8?B?ZkZ0ZjMvN3g0U0JXd2V0R25DSkMwbEQzdTAycnJndGxlU0R4RzVzQWdIWkNj?=
 =?utf-8?B?bVBLU004S053aVJnaGxrMDYxU20yWk5TR0wyenRleE83NEF1Q3h4aEdiOTZy?=
 =?utf-8?B?L3hnUkFUbWxrMEdiQVRFODU2WlJlQk90cU9HQWZ4Z0toSTU4ZjFwdjVsTjZZ?=
 =?utf-8?B?clE0NmUrZ0RzYnV1RFdzeUd6QjlCVENGaXRMN21WbGVNK3lMRUE3cUZzTGRK?=
 =?utf-8?B?YkJIRVRrNU4yZkdaRGNjMXFGV0JpUkNndWpPRXVSc0plWStuUENOOE9NNWgx?=
 =?utf-8?B?dUZKVSt3NHNYTldrMnBpZUJoaVRvMEhMbVZjNEJETlAzYkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68672998-62d1-437a-5807-08d8d4c83ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 11:19:33.1161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtWDG7LmU9/cyR39k1TsOgasiD2BADJVWFEVHU3kmS1Fi4zCIS1l//SDrG7bqGtA/wY97V01lG5YzvNsV3tDiNhmkpHZr0vWLj4xL7+lYAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4209
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFF88A54FFCEED45A36F8A55C67DB4FE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KT24gRnJpLCAyMDIxLTAyLTE5IGF0IDEwOjU1ICswMDAwLCBSaWNoYXJk
IFB1cmRpZSB3cm90ZToNCj4gT24gVGh1LCAyMDIxLTAyLTE4IGF0IDEzOjA2ICswMDAwLCBmbG9y
aWFuLmJlemRla2FAc2llbWVucy5jb20gd3JvdGU6DQo+ID4gRnJvbTogRmxvcmlhbiBCZXpkZWth
IDxmbG9yaWFuLmJlemRla2FAc2llbWVucy5jb20+DQo+ID4gDQo+ID4gVGhlIGZvbGxvd2luZyBw
YXRjaCBpcyB0aGUgc3VtbWFyeSBvZiBhIG5pY2Ugam91cm5leSB0aHJvdWdoIHRoZSBmaWxlIA0K
PiA+IHN5c3RlbSBqdW5nbGUgcmVnYXJkaW5nIFkyMDM4IHByb2JsZW0uIEl0IGFsbCBiZWdhbiB3
aXRoIGEgd2FybmluZyB3aGljaCANCj4gPiBpcyByZXBvcnRlZCBieSBrZXJuZWxzID49IDUuNDoN
Cj4gPiANCj4gPiBleHQ0IGZpbGVzeXN0ZW0gYmVpbmcgbW91bnRlZCBhdCAobW91bnRwb2ludCkg
c3VwcG9ydHMgdGltZXN0YW1wcyB1bnRpbA0KPiA+IDIwMzggKDB4N2ZmZmZmZmYpDQo+ID4gDQo+
ID4gV2hlbiByZWFkaW5nIHRoaXMgd2FybmluZyBJIHdhcyBzdXJwcmlzZWQuIFNob3VsZG4ndCBh
IG1vZGVybiBmaWxlDQo+ID4gc3lzdGVtIGxpa2UgZXh0NCBiZSBZMjAzOC1zYWZlPyBBcyBpdCB0
dXJuZWQgb3V0IGl0IGRlcGVuZHMgb24gdGhlDQo+ID4gaW5vZGUgc2l6ZSBpZiBhbiBleHQ0IGZp
bGUgc3lzdGVtIGlzIHNhZmUgb3Igbm90LiBTbyB3aHkgd2FzIHRoZQ0KPiA+IGlub2RlIHNpemUg
bm90IHN1ZmZpY2llbnQgaW4gbXkgY2FzZT8NCj4gPiANCj4gPiBUaGUgaW5vZGUgc2l6ZSBpcyBj
aG9zZW4gZHVyaW5nIGZpbGUgc3lzdGVtIGdlbmVyYXRpb24gYW5kIGRlcGVuZHMgb24NCj4gPiB0
aGUgc2l6ZSBvZiB0aGUgZmlsZSBzeXN0ZW0gdGhhdCBpcyBnb2luZyB0byBiZSBjcmVhdGVkLiBG
b3IgZGV0YWlscw0KPiA+IGxldCdzIGhhdmUgYSBsb29rIGF0IGBtYW4gbWtlMmZzYDoNCj4gPiAN
Cj4gPiAtVCB1c2FnZS10eXBlWywuLi5dDQo+ID4gwqDCoMKgwqBTcGVjaWZ5IGhvdyB0aGUgZmls
ZXN5c3RlbSBpcyBnb2luZyB0byBiZSB1c2VkLCBzbyB0aGF0IG1rZTJmcyBjYW4NCj4gPiDCoMKg
wqDCoGNob29zZSBvcHRpbWFsIGZpbGVzeXN0ZW0gcGFyYW1ldGVycyBmb3IgdGhhdCB1c2UuIFRo
ZSB1c2FnZSB0eXBlcw0KPiA+IMKgwqDCoMKgdGhhdCBhcmUgc3VwcG9ydGVkIGFyZSBkZWZpbmVk
IGluIHRoZSBjb25maWd1cmF0aW9uIGZpbGUNCj4gPiDCoMKgwqDCoC9ldGMvbWtlMmZzLmNvbmYu
IFRoZSB1c2VyIG1heSBzcGVjaWZ5IG9uZSBvciBtb3JlIHVzYWdlIHR5cGVzDQo+ID4gwqDCoMKg
wqB1c2luZyBhIGNvbW1hIHNlcGFyYXRlZCBsaXN0Lg0KPiA+IA0KPiA+IMKgwqDCoMKgSWYgdGhp
cyBvcHRpb24gaXMgaXMgbm90IHNwZWNpZmllZCwgbWtlMmZzIHdpbGwgcGljayBhIHNpbmdsZQ0K
PiA+IMKgwqDCoMKgZGVmYXVsdCB1c2FnZSB0eXBlIGJhc2VkIG9uIHRoZSBzaXplIG9mIHRoZSBm
aWxlc3lzdGVtIHRvIGJlDQo+ID4gwqDCoMKgwqBjcmVhdGVkLiBJZiB0aGUgZmlsZXN5c3RlbSBz
aXplIGlzIGxlc3MgdGhhbiAzIG1lZ2FieXRlcywgbWtlMmZzDQo+ID4gwqDCoMKgwqB3aWxsIHVz
ZSB0aGUgZmlsZXN5c3RlbSB0eXBlIGZsb3BweS4gSWYgdGhlIGZpbGVzeXN0ZW0gc2l6ZSBpcw0K
PiA+IMKgwqDCoMKgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvIDMgYnV0IGxlc3MgdGhhbiA1MTIg
bWVnYWJ5dGVzLCBta2UyZnMoOCkNCj4gPiDCoMKgwqDCoHdpbGwgdXNlIHRoZSBmaWxlc3lzdGVt
IHR5cGUgc21hbGwuDQo+ID4gDQo+ID4gVGhlIHJlbGV2YW50IHBhcnRzIGZyb20gL2V0Yy9ta2Uy
ZnMuY29uZjoNCj4gPiBbZnNfdHlwZXNdDQo+ID4gLi4uDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHNt
YWxsID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYmxvY2tzaXplID0g
MTAyNA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW5vZGVfc2l6ZSA9IDEy
OA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW5vZGVfcmF0aW8gPSA0MDk2
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiAuLi4NCj4gPiANCj4gPiBTbyB3aGVuZXZlciB5
b3UgY3JlYXRlIGFuIGV4dDQgZmlsZSBzeXN0ZW0gd2l0aCBsZXNzIHRoYW4gNTEyTUIgaW4NCj4g
PiBzaXplIHlvdSB3aWxsIGVuZCB1cCB3aXRoIDEyOCBieXRlIGlub2RlcyBhbmQgeW91ciBmaWxl
IHN5c3RlbSBpcw0KPiA+IG5vdCBZMjAzOC1zYWZlLg0KPiA+IA0KPiA+IFNvbWUgd29yZHMgdG8g
dGhlIG90aGVyIGZpbGVzeXN0ZW1zIHN1cHBvcnRlZCBieSB3aWM6DQo+ID4gwqAtIGV4dDIgYW5k
IGV4dDMgd2lsbCBvdmVyZmxvdyBpbiAyMDM4LCANCj4gPiDCoMKgwqBUaGUgdXNlciB3aWxsIGJl
IHdhcm5lZCBhcyB3ZWxsDQo+ID4gwqAtIHNxdWFzaGZzIHdpbGwgb3ZlcmZsb3cgaW4gMjEwNg0K
PiA+IMKgLSBidHJmcyB1c2VzIHU2NCBmb3IgdGltZSByZXByZXNlbnRhdGlvbnMsIHNvIFkyMDM4
IHNhZmUNCj4gDQo+IA0KPiBUaGFua3MsIHRoaXMgaXMgcHJvYmFibHkgc29tZXRoaW5nIHdlIG5l
ZWQgdG8gZG8uIEkgZGlkIGFwcGx5IGl0IGluIHRoZcKgDQo+IHRlc3QgYnVpbGRzIGFuZCB0aGV5
IGRvIHNob3cgYSBmZXcgd2FybmluZ3M6DQo+IA0KKHNvcnJ5IGZvciBicmVha2luZyB0aGUgbGlu
aywgYnV0IGhvcGVmdWxseSBvdXIgaW5mcmFzdHJ1Y3R1cmUgaXMgYmVpbmcNCmZpeGVkIHNvb24p
DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmF1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmclMkZ0eXBob29uJTJGJTIz
JTJGYnVpbGRlcnMlMkY1OCUyRmJ1aWxkcyUyRjMwNTImYW1wO2RhdGE9MDQlN0MwMSU3Q2Zsb3Jp
YW4uYmV6ZGVrYSU0MHNpZW1lbnMuY29tJTdDMzVlZDUzMmIyY2YxNGEzZmI5OWUwOGQ4ZDRjNGVh
ZTUlN0MzOGFlM2JjZDk1Nzk0ZmQ0YWRkYWI0MmUxNDk1ZDU1YSU3QzElN0MwJTdDNjM3NDkzMjg5
NTA1NDY2OTIxJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENK
UUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3Nk
YXRhPTFmWklSJTJCRk9GalRMJTJCWGFJalpKQVZnZzZ4MlljVjZVTjZ0ZTFBa3V2aiUyRkklM0Qm
YW1wO3Jlc2VydmVkPTANCj4gDQo+IEJlZm9yZSB3ZSBjb3VsZCBtZXJnZSBpdCwgd2UgcmVhbGx5
IG5lZWQgdG8gZml4IHRoaXMuIEFyZSB0aGVyZSBwYXJhbWV0ZXJzDQo+IHdlIHNob3VsZCBhZGQg
dG8gb3VyIGRlZmF1bHQgZXh0NCB0byBtYWtlIGl0IFkyMDM4IHNhZmUgYW5kIGF2b2lkIHRoZSAN
Cj4gd2FybmluZ3M/DQoNClNvcnJ5IGZvciB0aGUgd2FybmluZ3MgaW4gdGhlIENJIHN5c3RlbS4g
SSBkaWRuJ3Qgbm90aWNlIHRoZSAud2tzIGZpbGUNCnRoYXQgaXMgdXNlZCBmb3IgdGhhdCB0ZXN0
LCBidXQgdGhhdCBpcyBhY3R1YWxseSBkb2luZyB3aGF0IEkgd2FudGVkIHRvDQphY2hpZXZlOiBX
YXJuIHVzZXJzIHRoYXQgdGhlcmUgc3lzdGVtIGlzIGFmZmVjdGVkIGJ5IFkyMDM4IHByb2JsZW0u
DQoNClRoZXJlIGFyZSBhIGNvdXBsZSBvZiBwb3NzaWJpbGl0aWVzIG5vdzoNCiAgLSBBZGRpbmcg
YC0tbWtmcy1leHRyYW9wdHMgIi10IGV4dDQiYCB0byB0aGUgYWZmZWN0ZWQgcGFydGl0aW9uDQog
ICAgVGhpcyB0ZWxscyBta2UyZnMgdG8gdXNlIHRoZSBwYXJhbWV0ZXJzIHVzZWQgZm9yICJub3Jt
YWwiIGV4dDQgZmlsZQ0KICAgIHN5c3RlbXMgaW5zdGVhZCBvZiB0aGUgIm9wdGltaXphdGlvbnMi
IGZvciAic21hbGwiIG9uZXMuIChUaGVyZQ0KICAgIHdhc8Kgc29tZSBhZGRpdGlvbmFsIGluZm9y
bWF0aW9uIGluIHRoZSBjb3ZlciBsZXR0ZXIpDQoNCiAgLSBBZGRpbmcgYC0tbWtmcy1leHRyYW9w
dHMgIi1JIDI1NiJgIHRvIHRlbGwgbWtlMmZzIHRvIHVzZSB0aGUgYmlnZ2VyDQogICAgaW5vZGVz
Lg0KDQpJIGRlY2lkZWQgdG8gbm90IGFwcGx5IG9uZSBvZiB0aGlzIG9wdGlvbnMgcGVyIGRlZmF1
bHQuIERlcGVuZGluZyBvbg0KdGhlIHRhcmdldCBzeXN0ZW0gYW5kIHVzZSBjYXNlIHRoZXJlIG1p
Z2h0IGJlIChwZXJmb3JtYW5jZSkgc2lkZQ0KZWZmZWN0cy4NCg0KU2hvdWxkIEkgY29tZSB1cCB3
aXRoIGEgdjIgYW5kIGFkZGluZyBvbmUgb2YgdGhlIG1lbnRpb25lZCBvcHRpb25zIHRvDQp0aGUg
LndrcyBmaWxlPyBJbiB0aGlzIGNhc2UgYm90aCBvZiB0aGVtIGFyZSBwb3NzaWJsZS4gT3Igc2hv
dWxkIEkganVzdA0Kc2VudCBvdXQgYW4gYWRkaXRpb25hbCBwYXRjaD8NCg0KQmVzdCByZWdhcmRz
LA0KRmxvcmlhbg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQoNCg==
