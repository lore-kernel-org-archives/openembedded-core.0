Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.78])
 by mx.groups.io with SMTP id smtpd.web10.9672.1606323530449600250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 08:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=ZSVnEXo2;
 spf=pass (domain: siemens.com, ip: 40.107.3.78, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoRGx8ExUda7Pj4eQ5SaVf7VtFSpz3ZFkMat8m8Fx0YIdhiZpsdd2hWbIqFeRFb/xOxrpzCfSYZkMu+bApf8EK2fmT9mVWgNkWGyKiIIRr/DLvi86Pmk7+Bg7SmXedG006NnKQyw+nJ4rLYB8PeCc33XYI9/GezJgJXVDG/2whklP8NqFjb0zBEG3gDacauIeQ020Gb13qBL4N47prZDR61gZ2XjLuB1a3x5WniaHw4XOmDOflWRN1qWzuImxeLdtXYiNivdraUryj6rWMIunPJH+ri3P5jFDlfSckjvfaUIs1wgLwdH8CVPl2gbhx5aRu6c2Hi1Eascq3g1/YvkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kPIJkBNq42r0UI0+s7DB4Of2NJPhvlb81kQMXdYa1U=;
 b=MJk23N8um2MHp7suWBzU1jf6vxaZeS99Xi422VRqzCG587iPeX1hqTFh+9zlGZHuhOJffMdN1byrvUTlI3OtuVDRYj/sOcJfRKplOrId+IK9xwdb1sRvA+++X5I81niraUXzHQ0EOlOSCBT59kU+4/5Cpz6Dt6uzMEKgbnx02krUGvPEpQ+BbzGsd34sJNWGAfBRLvBI6x03dOPg0tOZzvBij2yRbEUl8fEfudeazqNPcLLsbPfreDp7uMlUU3Smt2MWzKLWhbXLEPU7+s2gSAgNVkCQv9suCa8dGG7BXIorS4iHtxWT1GRLADd5lg+BbwCgezVh7EgOnOjjS6+RRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kPIJkBNq42r0UI0+s7DB4Of2NJPhvlb81kQMXdYa1U=;
 b=ZSVnEXo2+CBVxeImLnG0kY91jAK2XJxmrD6y32qcEjO103lcPyBgP0BrHwW+hKsjjaIekyBmvtLCsd1Z0gz2kRQvK22R//0nivWG2LuFOZn7kIqcsqMoSFe5c1jvZtaMHC5kloXKTLMK2It3PfWQLA0LbZEPmRj/266UVT8nmc0=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB6PR10MB1735.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:38::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Wed, 25 Nov
 2020 16:58:48 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb%3]) with mapi id 15.20.3589.025; Wed, 25 Nov 2020
 16:58:48 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Bach, Pascal" <pascal.bach@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into common part
Thread-Topic: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into
 common part
Thread-Index: AQHWwxYIofT9NPccPEqgzUZHxvddV6nZEeCA
Date: Wed, 25 Nov 2020 16:58:47 +0000
Message-ID: 
 <DB8PR10MB39776000A00DDE1504F4B1FC92FA0@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201122124853.30262-1-andrej.valek@siemens.com>
	 <20201123190029.13811-1-andrej.valek@siemens.com>
 <32812d8ef3f7b29686e3a591e29315e82a80ead5.camel@linuxfoundation.org>
In-Reply-To: 
 <32812d8ef3f7b29686e3a591e29315e82a80ead5.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-25T16:58:46Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=2d307c3b-a65f-470c-8ef4-cbd1b22c4dda;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7cb51f2e-3bd1-43db-01d7-08d891636090
x-ms-traffictypediagnostic: DB6PR10MB1735:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DB6PR10MB17350BE895E795A7EF9446A992FA0@DB6PR10MB1735.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rToQmbYvXUZY7j2EH6439052acP+rD5GxfMKBI+uBQYmDGKwVX0G32tHpoZo5pqxh4a5snWKKAn0zx1hmf6SPKK++kaoPqFa8rgeI1JaqbMLLDgOWLt3RmjjaFeQyBpvP33xWFKtbR1oWIyCFlhlBa4nlOTYcHGgJT9zpBwSS6qYMav/TMVHM5eJeaxjit/l5zf2GAm3GxN/XCQhbJMR62hrpY+Tr1ljWLcCPUg5qtj/g8omsg3UpMBApJ3juuiQjyAwl1FTMwT77v3wQgK2QbHikxId2GgEi1Oh4CvVvNNRCNEn8wOUGdfR+NMcOVz0N1bBom/4DIsgi8/YOc/03g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(107886003)(66946007)(83380400001)(66476007)(8936002)(86362001)(4744005)(9686003)(66446008)(64756008)(66556008)(7696005)(2906002)(8676002)(71200400001)(478600001)(76116006)(55016002)(316002)(6506007)(110136005)(54906003)(33656002)(186003)(26005)(5660300002)(52536014)(4326008)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?TWhPcy9Fa0FLOW42YXJqVm94bjJXemFmbEZPSEoyNHg5Y2RqRmp3Zks5RGVz?=
 =?utf-8?B?TkM4STRFcGtRZzlrdHNOaDBpZy9mZ3BrWVd4aHowN2UweHFVekFpODRjQ1ZJ?=
 =?utf-8?B?dVdkbXdVblhrVWtWeE94SnNXc2h2bzUrdWNpSDMya2xCVnVLbkY4eDhIR3ZJ?=
 =?utf-8?B?eGdpNWNrOWFJNjdoajBCK2ZBRUtMQXdUSjM4OG9zL0FTTXZBOTd5VGlRcjVF?=
 =?utf-8?B?ZVg4VG0wZjZIUHA3Z1Z2Z3NObGFha0V2cDk5NGU1aGdTSjZDaHc4ZXJvajRT?=
 =?utf-8?B?NzhjaEUrdjhpN0pLTXNwZllvL2JiSFZIUHhReUV0U01WYUNqN2xlbFJiNXJR?=
 =?utf-8?B?NU9Gc1VnKzhSdldYTld5Nm01NDd0REN6amF1L2xrbTJ5UStBelk3bkIzejgy?=
 =?utf-8?B?YXlGYi9EeU8zOC9nNjNMR1lxWGxMZzVjYTg4aVA1MWkxU3FRVERVYnVWMXRt?=
 =?utf-8?B?aksreTdRZEdRQ0xmQ09iMXRDT01wbjVHWVIrMkh6QnMxWEJDT3FnOTVLZG0v?=
 =?utf-8?B?WG5sM202MC9IOWRyc2lJWXhhNll3aHRheCtCT0lYdFV5QnRlOEk4WUc3cm1P?=
 =?utf-8?B?aStWS0FpTW1qNEd4Z3FUdmQ1MzRQMTg4NFovaUc4SmdQRCtUc3FCbGY2NC9p?=
 =?utf-8?B?cnFMNVB6QVNHOWNBanVndHFmSmQ3MnRsckt0eTJTUlRTczV0cVZpcmd5K0ht?=
 =?utf-8?B?NGpwRGFYWTJ4T3Z4N0xXUWxaVTh0NWxEUEtlczBPL3BCSmpva1Z1cVVCTW1y?=
 =?utf-8?B?Y2FjYWNJdG9semdBempJWTBPcUY0TVFnUUxkU1dFMGJ1cjdteXMyS1NJVWk1?=
 =?utf-8?B?SjNkOFhnRDViNzh3VWYzS0pmdlEydm9oVzkvOU1aVGZDMzdTZGxwU0oxSERM?=
 =?utf-8?B?Z3l1bU00dWM5MC90YzFka3NPRlJZaUZxNVJoL1JFZ2JlTWk0SmVDNkJwMW1i?=
 =?utf-8?B?TGp6ZFFxcUd3bm5UTVk3dmR3NjdySjNTNDZPZnRjZkZZdUF6akp0cDF1V08z?=
 =?utf-8?B?dmFqTndLY3dEM1VjdlZzS3lSK2dVeUFmWldLK2JMVm5MWXNGbTBqYnUzKzgv?=
 =?utf-8?B?TkF4TExwTE5CL2owREZNWkVmM0FNV3NzdlNRMjhHS3VheFhvS1BJd2JsRzNV?=
 =?utf-8?B?ditMdHpJeGV1aGlUMkE4ajZIc0JROXE4SWczenIwUnExUFVBZ3NHS1k5czRT?=
 =?utf-8?B?dFZJTFdzbXFnOWRpNVJsNHh0QnhoWVp2ZWFGeHJoL0VNK3lhc0dxdklIV0pj?=
 =?utf-8?B?by9jd2ZxNXBtbEZWSkN3ZG9TYy85SDJPSlFZOTFxd0dPMXAwV0VHaWJwc1ND?=
 =?utf-8?Q?6ETCVipR0ior0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb51f2e-3bd1-43db-01d7-08d891636090
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 16:58:47.9540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E2l4iQZ5Ih4yCB2ikf3yyy4V32mGzSr7nWZ7meg6co0t4KePKii8piahtRoL/ZISHA51R15xSQ3wUku6Mkcr2CkxXR8mugFAgG5oIDe6WuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1735
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T2sgZ3V5cywgSSBnYXZlIHVwIGZvciBub3cuDQoNCk1heWJlIEkgd2lsbCB0cnkgdG8gZml4IGl0
IGluIHRoZSBmdXR1cmUsIG9yIHNvbWVib2R5IGVsc2UgY2FuIGRvIHRoYXQgLi4uDQoNCkNoZWVy
cywNCkFuZHJlag0KDQo+PiBUaGlzIG9wdGlvbiBhbGxvd3MgY29ycmVjdGx5IGhhbmRsZSB0aGUg
cmVsZWFzZS9kZWJ1ZyBmbGFncyBzZXBhcmF0aW9uIA0KPj4gaW4gdXBwZXIgcmVjaXBlIGxpa2Ug
Y21ha2UuIEFkb3B0IFNFTEVDVEVEX09QVElNSVpBVElPTiB1c2FnZSBpbiBvdGhlciANCj4+IHJl
Y2lwZXMuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVr
QHNpZW1lbnMuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogUGFzY2FsIEJhY2ggPHBhc2NhbC5iYWNo
QHNpZW1lbnMuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEZyZWlob2ZlciA8YWRyaWFu
LmZyZWlob2ZlckBzaWVtZW5zLmNvbT4NCj4+IC0tLQ0KPj4gIG1ldGEvY29uZi9iaXRiYWtlLmNv
bmYgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsrKystLS0NCj4+ICBtZXRhL2NvbmYv
ZGlzdHJvL2luY2x1ZGUvc2VjdXJpdHlfZmxhZ3MuaW5jICAgICAgIHwgOCArKysrLS0tLQ0KPj4g
IG1ldGEvY29uZi9sb2NhbC5jb25mLnNhbXBsZS5leHRlbmRlZCAgICAgICAgICAgICAgfCAxICsN
Cj4+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4xNi4xLmJiIHwg
MSArDQo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQ0KPg0KPiBJIGFtIGEgYml0IHdvcnJpZWQgYWJvdXQgdGhpcyBhcyB3ZSdyZSBlZmZlY3RpdmVs
eSBsZXR0aW5nIGNtYWtlJ3MgaWRlYSBvZiBmbGFncyBzZXBhcmF0aW9uIGRldGVybWluZSBob3cg
d2UgaGF2ZSB0byBzZXQgPiB0aGluZ3MgaW4gT0UuIE9uY2Ugd2UgZ28gZG93biB0aGlzIHJvdXRl
LCB3ZSdyZSBnb2luZyB0byBoYXZlIHByb2JsZW1zIGFueSB0aW1lIHdlIHRyeSBhbmQgYWRkIGEg
bmV3IGNvbXBpbGVyIGZsYWcuDQo+DQo+IFdoYXQgZG9lcyB0aGlzIGJ1eSB1cyBpbiB0aGUgZW5k
Pw0KPg0KPiBDaGVlcnMsDQo+DQo+IFJpY2hhcmQNCg0K
