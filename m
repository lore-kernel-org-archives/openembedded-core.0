Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web10.6326.1606403431036021507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 07:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=mtwN+9Tw;
 spf=pass (domain: siemens.com, ip: 40.107.8.41, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCsqLVvFyC3REtfSGP0Yv234LF9YEdbnVt7PotfIgn2SHU014NTHQrIlAQpNQApaiw8UTK0hjY9BtrxYll5TEDeWl9bmeM8cvpjCxZOK58xkqyL15cKjRaPQzWdusr8XlW/46nmRV9h0pYF2ry1l9nqCSD9J2Iovq7BFwsXXnGxq7nVP5Am5OK+Ke1GR3MQZPZ70gDuly6JXsxx0Eqvo0cj0dJJ9o0oLpE/oJHW39avv/U5wavEdUnHlxfOC7RgJrklIoBdUXcGn8XGt5sB4BmYfKpsA/p+tSCtOr2NBLtus/pr+/HRVKivfe+84G2LxJtpQHAFLVxUisDeSrzABwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja7D87TGi59IJECxo2w6xnB9j/aQeqxFfoXFSlkp2zw=;
 b=CAmiuMLKLI8pfY+EqgUDcAk+y+2iKeiBpHQWXlxb8gPu9DJMWgyl94LqDeVs+gelh64+nOHn/H2N9qC4SKFVGvu+A9JkwbrQe6omRrzEPHBiUvMSpaHLbMDfJxOH9Ip1MUSjTpQatjhqbkc5VfApZe5TK83Vuk/vYEfyaptQwCdpoyGXq3g3owSVkh1izr+i5pjbcj+pYxCNQrzfIBnciXjNYg/y+cOZhYqYukMbXvaNZeT1RKNUYGp13dzf2VNYWIpIfAol/tVHle9bjadls+EoejOXttMFH+vpVsK7F9HMDvqW00m+IBYZfK6wT2vITF7z/w0X2G/AotVNNlDcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja7D87TGi59IJECxo2w6xnB9j/aQeqxFfoXFSlkp2zw=;
 b=mtwN+9TwRa+PxOd0vr0NYkrcOcBilIQTk+iRZv2Tos1F1eelkSQjsm9vNLTzOQJOgVE6kQ8BMEx0qABOq+7DPzROn2dkpz7zrSvcmFCas42c+h3QgYs35K8/c+emizqv7YDO2pSNG/XIzKwFWCatBWvHQ8RzMBXRqXZFiRsCVnk=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB6PR1001MB1351.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Thu, 26 Nov
 2020 15:10:28 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb%3]) with mapi id 15.20.3611.025; Thu, 26 Nov 2020
 15:10:28 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
Subject: Re: [OE-core][PATCH v2] kernel-dummy: fix executing unexpected tasks
Thread-Topic: [OE-core][PATCH v2] kernel-dummy: fix executing unexpected tasks
Thread-Index: AQHWxAG3vXtJfSTiVEy+l36TOwSWD6nafCGwgAADJACAAASX4A==
Date: Thu, 26 Nov 2020 15:10:28 +0000
Message-ID: 
 <DB8PR10MB3977D9120E03F33422C0A75992F90@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201125165417.29781-1-andrej.valek@siemens.com>
	 <20201125172045.8697-1-andrej.valek@siemens.com>
	 <ef5e35d36905471304587803bd685ce2297ae889.camel@linuxfoundation.org>
	 <DB8PR10MB39775710E456F17F2FAE85A792F90@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
 <2c0da7ad07d9339449faa6842740edc5471ecf83.camel@linuxfoundation.org>
In-Reply-To: 
 <2c0da7ad07d9339449faa6842740edc5471ecf83.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-26T15:10:26Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=bd6072eb-32ec-4b65-b766-3f35edee6176;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19fb0fbb-3cff-446e-407a-08d8921d68d1
x-ms-traffictypediagnostic: DB6PR1001MB1351:
x-microsoft-antispam-prvs: 
 <DB6PR1001MB1351256AD1936F800C84BA4D92F90@DB6PR1001MB1351.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5mzB0enIfdDVmq59Bs/gQI1rHRW10QZhcLz7u9FSRPPDEMWeiIbK1Osm4HUm0Ov+ZGqbUj1m1ZrE8r5rINwcfPB0oTkk9lF8i98aixkeKnMHQS/TzI5e8TOyyqo2V4OpftkIfISMewC8RDs28husVEOC91vVMs2PhEW19nSupdxGJiqszI4FKlfl2IL9gIcTEoBb/EtmjOTQsBj/HvazBqLlxyc7Mdf1s2VrorJenZq6Q36PiubbdLvALaqxMMOPaWA7qX5LNIv5qcr2q1FhBPvB527pRrkgD+/tHoqAD0KZeULfPRWuKw4DQrTiOJxL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(55016002)(316002)(7696005)(76116006)(66946007)(186003)(66556008)(66446008)(64756008)(52536014)(66476007)(9686003)(8676002)(33656002)(26005)(4744005)(5660300002)(2906002)(110136005)(71200400001)(86362001)(55236004)(4001150100001)(6506007)(478600001)(8936002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?QmtBMTllMXUzeDVCUUQ4UUkxSFJDWHlpNEVlMEZHeFgyd2NHUU1BdjVvZWFJ?=
 =?utf-8?B?QVMyZFRiVE9GNjNZWjZORkFFYy9aUTNXYytCNXE5cDVVT0hRUUtxWnpGUXdK?=
 =?utf-8?B?d1plbGIySTZ1VWpMUUhvaW9WNEw3MjZHeWNYeVQzd2crMnZJZGEzZU1mcjZq?=
 =?utf-8?B?OE5ma09nV05LZG9RTzZvcmRhL1VFbi9KZFAwZExaWFBvRUpYbzdBRW1MVHNV?=
 =?utf-8?B?elBaUlF5VGY5QXY3SUFiSUdnWHR2WjBGeWY3aWJxTWl2eGRGWVd3N2grR1Jw?=
 =?utf-8?B?RS9XbGdFMTVOSlkwY2M3VFZ2NXZGTGtYRUR1ZDFuRUJtOVRONG55emdYaVV4?=
 =?utf-8?B?OVZFVkd6MkVuc3dNWkk3Zm5EeXA0bEw1MmI2NzArM2MxY21TTEVtU3Zkellz?=
 =?utf-8?B?OFhSOTRuUmo2L1JXTlY0aitleERsRS9Pd2pJa0R5VUFQa2F4YlZhYnc2S0FL?=
 =?utf-8?B?SWRVMEdNd0NIYnlScDhaQ20ycDJkNytlZTRhd2FhWVlKRmdYRXJjQ0FBMFU0?=
 =?utf-8?B?YU1uYXFBcXRBcXA4UVdxbkJiQ1ZIYjZydEl5bFVMbWpTb2xsNk8zTTRoMTNG?=
 =?utf-8?B?U001b3Bwc3pFL1hCUG9wVGdHb1E1OXZ3WE00K2VibWkzSWhUZVJHcngvSWgx?=
 =?utf-8?B?U1Z0TFd4R0grUW5IMTJsYTNBcm0yZDVheGhDWDcwWXRRaUZyR2lxRHE0QzdC?=
 =?utf-8?B?Z0FNSHpLSk1HV3dNNXNzWVlGcUM5S2RkUGF3aEZUbUJRRkpjRWNvMXBwTW10?=
 =?utf-8?B?TWk0ZUhVcC9vdE05RWNGTmlTa3RML0Uza0Yycis2YzB5VmtPaUY5dnN1dTJr?=
 =?utf-8?B?OXJucHYvT2FqZ1JDejhnVXk1M3ZzR0NPaitpTEZDTEtNNUZDR2ZLaXZKWHNT?=
 =?utf-8?B?SFNLUHhZU1BkVFZ6QVJXYlExa09iSTRheGI2Uy82WnA5aGhhTCtpbTE0V3ZN?=
 =?utf-8?B?Uis2bXQ5Q0cvY2tVbFJLTmxtNFhhTHdQQWRKU1pZbkI0S2RsZGphN2RMRzJO?=
 =?utf-8?B?Um5TYmgzMGhYemt1V2xkU1RXdngzWEd5Yml0dDNvaGZCc2hhNTB5Tkx6UTRr?=
 =?utf-8?B?TmtzUlo1ekQrMkFIT2ZSQWgyR2I1cXBFODJ3Uy9Hb2dOUDYxYUl1Sm5nY0dM?=
 =?utf-8?B?YS81dTFsY3hYRTAvWXVSNXg3UEtPcnRMWExvVTgvRmpGMkxPNk0zRnpRMGNu?=
 =?utf-8?B?THVST0pCa3YyUC8xS0FHOThCMlIzNU0xWXA5NHJJeGZ4ZDdVQWJCcDdkQWJR?=
 =?utf-8?B?bUE3TXNkWVF0MHJIVU5SZHZxbENxL2lhR1JWV0RzWitTM2sxZGRLbXRzc3hI?=
 =?utf-8?Q?9A/l8tB9XhwhQ=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fb0fbb-3cff-446e-407a-08d8921d68d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2020 15:10:28.2568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: euNsf5L0eEido/vovtd82gJknbrIDzWmWtwNe2s6YKfSJ7yRjhM/shdHdf3KcONWAsOSgwH2xerLMFspOp+wQx+VJLeZAJclL5/MyiuHlw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1351
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8gcHJvYmxlbSwgeW91IGNhbiBrZWVwIHRoZSBkZXBsb3kgdGFzayBkZXBlbmRlbmN5LCBsaWtl
IGl0IHdhcy4NCg0KUmVnYXJkcywNCkFuZHJlag0KDQo+IE9uIFRodSwgMjAyMC0xMS0yNiBhdCAx
NDo0NCArMDAwMCwgVmFsZWssIEFuZHJlaiB3cm90ZToNCj4+IE5vIGl0J3Mgbm90IGEgbGVmdG92
ZXIuIEkndmUganVzdCBjb3BpZWQgaXQgZnJvbSBrZXJuZWwuYmJjbGFzcywgd2hlcmUgDQo+PiB0
aGlzIHRhc2sgaXMgd3JpdHRlbiBjb3JyZWN0bHkuIEJ1dCB5b3UgY2FuIGNoYW5nZSBpdCB0byBw
cmV2aW91cyANCj4+IHZlcnNpb24gSSBndWVzcy4NCj4NCj4gSSdtIHRyeWluZyB0byB3b3JrIG91
dCB3aHkgd2UgbmVlZCB0aGUgZXh0cmEgZGVwZW5kZW5jaWVzIHdoZW4gdGhlIHRhc2tzIGFyZSBl
bXB0eS4NCj4NCj4gSSBjYW4gc2VlIGhvdyBhZGRpbmcgdGhlIGluaGVyaXQgd291bGQgaGVscCwg
SSdtIGxlc3Mgc3VyZSBob3cgYWRkaW5nIHRoZSBkZXBsb3kgdGFzayBhZnRlciB0aGUgb3RoZXJz
IGRvZXMgdGhvdWdoLg0KPg0KPiBDaGVlcnMsDQo+DQo+IFJpY2hhcmQNCg0K
