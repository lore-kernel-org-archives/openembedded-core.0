Return-Path: <cbugot@sierrawireless.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0057.outbound.protection.outlook.com [104.47.40.57])
	by mail.openembedded.org (Postfix) with ESMTP id E5A3578942
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=SierraWirelessInc.onmicrosoft.com; s=selector1-sierrawireless-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=In5aDrtrmxCx6fSilx1n/lOhqmPO01B89fsvbEib1lA=;
	b=x68vY9OisYHc9/ALXcEyta4evbdd1jb3xjFfJugGW44OuLYVXWrqVfCqrD9OEyG5ZGl2ZkngqeGeePC5VGwc9d3Sk1cl8bgMFwvodvGd3u19Rsduznbv/iFoMmqwj3Ei2mhmV84dVzYcm6tnQY4QfjZlaaEPC9axA/jSROFJ1fQ=
Received: from CY1PR02MB1152.namprd02.prod.outlook.com (10.163.15.154) by
	CY1PR02MB2090.namprd02.prod.outlook.com (10.166.190.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.588.14; Mon, 19 Mar 2018 13:57:55 +0000
Received: from CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3]) by
	CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3%13]) with mapi id 15.20.0588.017;
	Mon, 19 Mar 2018 13:57:55 +0000
From: Cuero Bugot <cbugot@sierrawireless.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] uninative: add variables to the whitelist so
	that it does not re-triger recipe parsing
Thread-Index: AdO9TH9RHM3TjEkGRgOC2+RK0UYmKwALiVWAAIPGOEAAAAwkgA==
Date: Mon, 19 Mar 2018 13:57:54 +0000
Message-ID: <CY1PR02MB115212269AF12AA9BC2963DBA3D40@CY1PR02MB1152.namprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=cbugot@sierrawireless.com; 
x-originating-ip: [84.14.163.134]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB2090;
	7:nD9T3abFsDKfhBRWiVm0tnJCB/wvb1DZn07SPyARrY7dZARe5NLb7MuzQBuw6j1xEmMK7vg0tREgtGebS/r/98XE6XVAfp6zyma7PjrGpXSMTVoOPUaMy5DhZsVuAQ8D4Q7Zn7zy/ChxQWi4CtjPEPwq8+NRQc/XlTfFQVXIJStRqimp3XPATLdBt0Y9CRCKq0LzzfllEDjtS4KuToSf6az9X4ZsBooeRMQkA0JyBBxnYlnjzggTMItMOZ/eoeVW
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 21e139a6-ef45-4f07-05da-08d58da16a06
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR02MB2090; 
x-ms-traffictypediagnostic: CY1PR02MB2090:
x-microsoft-antispam-prvs: <CY1PR02MB209094E01C32A006BA65DB08A3D40@CY1PR02MB2090.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231221)(944501300)(52105095)(10201501046)(6055026)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY1PR02MB2090; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB2090; 
x-forefront-prvs: 06167FAD59
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(376002)(396003)(366004)(39860400002)(346002)(199004)(189003)(6916009)(33656002)(478600001)(53936002)(6246003)(26005)(316002)(55016002)(5250100002)(86362001)(106356001)(9686003)(66066001)(3846002)(6116002)(6436002)(68736007)(7696005)(8936002)(229853002)(5660300001)(99286004)(81156014)(81166006)(97736004)(8676002)(25786009)(7736002)(4326008)(305945005)(53546011)(105586002)(6506007)(74316002)(14454004)(102836004)(186003)(2906002)(55236004)(3280700002)(39060400002)(2900100001)(3660700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB2090;
	H:CY1PR02MB1152.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: sierrawireless.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: c4huS/TmUCduxgxtSPEGCmvT3Qpr4AlXhzJsfRvz39BJOGf6iCvsmeePLaxpwbKfCBj3lv1cWKYhL2c7RO43vMyngr5eUo0X21LAhx4uL4QE0wtlIa+jb7OLIcbX1Y+bmadejvnyJsRk6sjui8bNqNzgNfBIEucMyWQyGaZTAPBU6m0Er4xWKkF/iE+X4QiT1sgYyDAbsdTH77ggQzlEdROp2kiBrsosK9lSVh5fVm337Il3IbM4d1p1ZR5bFH/s1o8xJEYcNjb3vghsoJOVzP5UTJfsjuqv3+QnhOuO/wwAQ4uH0ZFQxzm7MsARS/ZBaD+h8zmaVV0vtwKytUQlJw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: sierrawireless.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e139a6-ef45-4f07-05da-08d58da16a06
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2018 13:57:54.8479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 08059a4c-2486-43dd-89e3-3a747e0dcbe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB2090
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Mon, 19 Mar 2018 14:31:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IE9uIEZyaSwgTWFyIDE2LCAyMDE4IGF0IDEwOjMxIEFNIEN1ZXJvIEJ1Z290IDxtYWlsdG86
Y2J1Z290QHNpZXJyYXdpcmVsZXNzLmNvbT4gd3JvdGU6DQo+ID4gV2hlbiB1bmluYXRpdmUgaXMg
YWN0aXZhdGVkIChwb2t5J3MgZGVmYXVsdCkgaW50ZXJuYWwgZGF0YXN0b3JlIHZhcmlhYmxlcyBh
cmUgbW9kaWZpZWQgKE5BVElWRUxTQlNUUklORyBhbmQgU1NUQVRFUE9TVFVOUEFDS0ZVTkNTKSB0
byBlbmFibGUgdW5pbmF0aXZlDQo+ID4gc3VwcG9ydC4gVGhpcyBpcyBoYXBwZW5pbmcgYWZ0ZXIg
cGFyc2luZyBpcyBkb25lIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGJ1aWxkLiBPbiB0aGUgbmV4
dCBiaXRiYWtlIGNhbGwgdGhlIHJlY2lwZSB3b3VsZCBiZSBwYXJzZWQgaWYgdGhlIHR3bw0KPiA+
IHZhcmlhYmxlcyBhYm92ZSB3ZXJlIG5vdCBhZGRlZCB0byB0aGUgcGFyc2luZyB3aGl0ZWxpc3Qg
QkJfSEFTSENPTkZJR19XSElURUxJU1QuDQo+ID4NCj4gPiBUaGUgZml4IGlzIHRvIGFkZCB0aGVz
ZSB0d28gdmFyaWFibGVzIHRvIHRoZSByZWNpcGUgcGFyc2luZyB3aGl0ZWxpc3QgQkJfSEFTSENP
TkZJR19XSElURUxJU1QsIHRoaXMgaXMgZG9uZSBhdCByZWNpcGUgcGFyc2luZyB0aW1lLCBvbmx5
IHdoZW4NCj4gPiB1bmluYXRpdmUuYmJjbGFzcyBpcyB1c2VkLg0KDQo+IEl0IHNlZW1zIHlvdSBo
YXZlIGEgY2FzZSB3aGVyZSBkYXRhIGlzIGFscmVhZHkgcGFyc2VkIGFuZCB0aGVuIHVuaW5zdGl2
ZSBpcyBlbmFibGVkIGFmdGVyIHRoaXMgdGhlIHJlcGFyc2UgaXMgaGFwcGVuaW5nLiBPciBpcyBp
dCBhbHdheXMgaGFwcGVuaW5nIHdoZW4gdW5pbmF0aXZlIGlzIGVuYWJsZWTCoA0KDQpJdCBpcyBh
bHdheXMgaGFwcGVuaW5nIHdoZW4gdW5pbmF0aXZlIGlzIGVuYWJsZWQgKHdoaWNoIGlzIHBva3kn
cyBkZWZhdWx0KS4gVGhlIDIgZmlyc3QgdGltZXMgeW91IGJ1aWxkIHlvdSB3aWxsIGhhdmUgYSBm
dWxsIHJlY2lwZSBwYXJzaW5nLg0KVGhlIHJlYXNvbiBpcyB0aGF0IHRoZSBkYXRhIGlzIGVmZmVj
dGl2ZWx5IG1vZGlmaWVkIG9uIHJlY2VwdGlvbiBvZiBCdWlsZFN0YXJ0ZWQgZXZlbnQgdGhhdCBo
YXBwZW5zIGFmdGVyIHRoZSBwYXJzaW5nIGlzIGRvbmUuIE5leHQgdGltZSB5b3UgcnVuIGJpdGJh
a2UsIHRoZSBkYXRhc3RvcmUgc2lnbmF0dXJlIGlzIGRpZmZlcmVudCBhbmQgdGh1cyByZXRyaWdn
ZXIgYSByZWNpcGUgYXByc2luZy4NCg==

