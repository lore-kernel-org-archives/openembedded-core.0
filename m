Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.71])
 by mx.groups.io with SMTP id smtpd.web12.4778.1590107792673962027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 17:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BEmJSNmx;
 spf=pass (domain: windriver.com, ip: 40.107.223.71, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOzpo2PoceR3akscw9jOYT+GZofKJIsNCd3zSXa409Apuw7EYGVJ3lnCVtix/5z6q+UQg1ro9N8dwrNPaGsywbZ1bSmR5i6KvkrBGYoSxAdz0FavnufGZJRyTm/2u309zzA0jPwhTtxp+jfZJrvfVe7rMsQoiJmdYGAXIM/srvVs2gisAdVxtrKLgABBfXqSFGLeLf+UevDCxbtk9Duu4XIgpyok90QmtvW9d0zzIMcBY6FID3aQwkLYrJgFcNVXsqfcrt8KbR0SDC4oAf945pCByHW9o4y4xPkFYkOZGPiFy1VZVWwt3jZ1lxe0prayHa4Ng8ABwAXjPUz1/H45Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfnntdhQBcmChru2SHe13aTRADNkIsRvvJcQ8RdGIXs=;
 b=IG7et6I3kQMgeRYcSGyPn2Gz905NgVW7XE2PEOAs2MkX/Nc7xhqccsQKPziYzH9ap6IR88NRaE695rd2W16lBKpufVNLptBBzLSz/1pHOr5Bzu/7JWpG6zhRdN1Pvr4wKWusUtExup9DZooWlXbYeo7fNiBibNEGwKrgALG0iecLya9vHrz9n7HVAAXUxHYoTfWXEko7pQRuWqfrmbgiJvXfvc+iC7gdRNLv3HWKqprXgSMHerkdMWGYhlTYBlgjybbKCIiDOIwkrUFUr0R918UP+UuWgF5jEvmmQ8ytRi3S2x8JuYYcmR8v/aHfFvfNHCUnqGYQGXp7gJOg/TeTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfnntdhQBcmChru2SHe13aTRADNkIsRvvJcQ8RdGIXs=;
 b=BEmJSNmxy63TEbYOKe5fk90XsqGbJSZo3Sa/DudAVMHCocP5W8Ed6UhGtNHRekWvvCeUxfqtxPwo60q2Mll+RXYT41PrVwooKayY0fwWcF1F4G31sZy2PRkIqpAQiWNvz84fih+JHt1uw8mUgXX/eX8zYckxn5P1uIz3tMYc5x4=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 22 May
 2020 00:36:31 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::2c89:3733:2dbb:3a8d]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::2c89:3733:2dbb:3a8d%4]) with mapi id 15.20.3021.020; Fri, 22 May 2020
 00:36:31 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/1] terminal.py: do not stop searching for auto
Thread-Topic: [oe-core][PATCH 1/1] terminal.py: do not stop searching for auto
Thread-Index: AQHWL59tEIbmhl7FqEe+ujG0stItyqiy83uAgAARh4CAADyoQA==
Date: Fri, 22 May 2020 00:36:31 +0000
Message-ID: 
 <BY5PR11MB399207B3FA9D0E47A943970B88B40@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20200521184107.103889-1-joe.slater@windriver.com>
	 <b10310e2-e33e-eef9-d070-a3bbab96a8a1@windriver.com>
 <784e607801a9c3f0acfbcaeb1634872ef5ab5f80.camel@linuxfoundation.org>
In-Reply-To: 
 <784e607801a9c3f0acfbcaeb1634872ef5ab5f80.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccbe6f15-6da1-46a5-9d0e-08d7fde82c3b
x-ms-traffictypediagnostic: BY5PR11MB4071:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BY5PR11MB40716BF7FE157A40FF3A4C4688B40@BY5PR11MB4071.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J0BJ/wBuypy1g3mf9gP+myVyhREKeEfChbTfTdGBj9YJV0YReasg5oRUNLo1eoPJjb4qFn0FMLovL/zMbiQvpTtkYgxDFo/N5B6w63frcgzFgXedRNdrpmQBmL2PD5Z+GMCDgtmBPjRbToDbdLOjAPgt1dHrbVdNNZqIOLF2N0/XGI/bMkEYUFiuX9kkSkVyDzPoiomCCva78KITVbMbRo30mYyLFTM1UV3kfw1vFa3sZ5EAcF1XY5nJzfj98noy3gH7a/KKBDSTWzJztQ3D803BwbX7EZQnvRUppc4t7gu5s4+p1mF620xPfVw9hXFdWclpqXznvhJrfIw3lK55PLmjqvxq0L/9PeC0TldrqhZ4a7SQ9eruph5wzgRuwChV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(39850400004)(366004)(8936002)(64756008)(66446008)(66946007)(66476007)(76116006)(186003)(8676002)(110136005)(478600001)(66556008)(52536014)(316002)(5660300002)(55016002)(7696005)(71200400001)(9686003)(26005)(86362001)(2906002)(33656002)(6506007)(53546011)(51383001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Ei+U4lQHdNWwZeqHC9dVTBBHD3EpYuh0afeO2WMZVyllqlcQrgFJx8mVb79cfK5Ww3gTjsKdLXcKltbkNYMG47jpw4pPOt2VmYVeuk5LWxBCGp6zr8tdXVu2h8YOxbxt3q+iIqFR3TTdhmp7PD/tWWPMA/7Y5HlHC/i9TcCEYLnREEm2T9QmeGBRaVV/ROKGTsIRB5pi8D5pGcu254cWiSNvE33FQe8IgyKgNPcgrUl8fTBCoYpMudLtB1B/fgNhVvFJTINnF0pqoUAAOxWQkaeShED3gxPFoaqU8uiSqbP2alDasZHnQDmmgnq5cZ+qY4VY3MaLKiEZUn+M1vXA4U/Kbjw7De27msEYv2sGRsaCFDbBCuCld/JF+LUEx+BpcEcqBSz4x2Hoi6J34p1ygzyptgCASFRICPhFYUYxjrq5d6EcxF/bivkx952d21KkEojHUPwVzlfbQytKGIdevg6abbl/YPobMjD8k+csKk4=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbe6f15-6da1-46a5-9d0e-08d7fde82c3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 00:36:31.1679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eZR76uvxzPTjlYy7SG4ebrIvGA+O1CJ/BgwX4IdvhCna/M/6oJ1MnsTr4AEmST3tj5O6QU6enqa1sg/RvcVzQ5SoBRegs1CqhI09yYH2zTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4071
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBJIHRoaW5rIGl0IGlzIHdoYXQgUmljaGFyZCBzYXlzLiAgQnV0LCB0aGF0J3MgYSBzcGVj
aWZpYyBjYXNlLCBhbmQgSSB0aGluayB0aGF0LCBpbiBnZW5lcmFsLCBpdCB3b3VsZCBiZSBiZXR0
ZXIgdG8gbG9vayBmb3Igc29tZXRoaW5nIHRoYXQNCmRvZXMgd29yay4gICBMaWtlIG15IGdsb3Jp
b3VzIGxlYWRlciBzYXlzLCAiV2hhdCBoYXZlIHlvdSBnb3QgdG8gbG9zZT8iDQoNClRoZSBjaGFu
Z2UgZG9lcyBwcmludCBvdXQgYSB3YXJuaW5nLCBzbyB5b3UgY2FuIGNoZWNrIG91dCB3aGF0IHRo
ZSBwcm9ibGVtIGlzLCBpZiB5b3UgY2FyZSB0by4NCg0KSm9lDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgTWF5IDIxLCAyMDIwIDE6NTUgUE0NClRvOiBN
YWNMZW9kLCBSYW5keSA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPjsgU2xhdGVyLCBKb3Nl
cGggPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2UtY29yZV1bUEFUQ0ggMS8xXSB0ZXJtaW5h
bC5weTogZG8gbm90IHN0b3Agc2VhcmNoaW5nIGZvciBhdXRvDQoNCk9uIFRodSwgMjAyMC0wNS0y
MSBhdCAxNTo1MiAtMDQwMCwgUmFuZHkgTWFjTGVvZCB3cm90ZToNCj4gT24gMjAyMC0wNS0yMSAy
OjQxIHAubS4sIEpvZSBTbGF0ZXIgd3JvdGU6DQo+ID4gSWYgYSB0ZXJtaW5hbCBmYWlscyB0byBz
cGF3bigpIHdlIHNob3VsZCBjb250aW51ZSBsb29raW5nLg0KPiA+IGdub21lLXRlcm1pbmFsLCBp
biBwYXJ0aWN1bGFyIGNhbiBiZSBwcmVzZW50IGJ1dCBub3Qgc3RhcnQuDQo+IA0KPiBEbyB5b3Ug
bWVhbiB0aGF0IGl0IGRvZXNuJ3Qgc3RhcnQgb24gdGhlIGZpcnN0IHRyeSBidXQgdGhhdCBpdCBt
YXkgLyANCj4gdXN1YWxseSBkb2VzIHN0YXJ0IG9uIHN1YnNlcXVlbnQgdHJpZXM/DQo+IA0KPiBT
aW5jZSB0aGUgdXNlciBoYXMgc2V0IHRoZSAgcHJlZmVycmVkIHRlcm1pbmFsLCB0aGlzIGNoYW5n
ZSBjb3VsZCANCj4gY29uZnVzZSB0aGVtIGFuZCB0aGVyZWZvcmUgc2VlbXMgd3JvbmcuDQo+IElm
IHdlIGtub3cgb2YgZmxha3kgdGVybWluYWwgaW1wbGVtZW50YXRpb25zLCB3aHkgbm90IGxvb2sg
Zm9yIA0KPiBzcGVjaWZpYyB2ZXJzaW9ucywgaXNzdWUgYSB3YXJuaW5nIGFuZCBlaXRoZXIgcmV0
cnkgb3IgdGVsbCB0aGUgdXNlciANCj4gdG8gdHJ5IGFnYWluPyBJbiBhIGZldyB5ZWFycywgd2Ug
Y2FuIGRpc2NhcmQgdGhlIGNvZGUgd2hlbiB0aGUgZmxha3kgDQo+IHRlcm1pbmFsIHZlcnNpb24g
aXMgbm8gbG9uZ2VyIHVzZWQuDQo+IA0KPiBJcyB0aGVyZSBhIGJ1ZyBvcGVuIHdpdGggZ25vbWUt
dGVybWluYWwgdG8gdHJhY2sgdGhpcz8NCj4gV2hhdCBkaXN0cm8vZ25vbWUtdGVybWluYWwgZG8g
eW91IHNlZSB0aGlzIHByb2JsZW0gaW4/DQoNCkkgc3VzcGVjdCB0aGUgaXNzdWUgaXMgbW9yZSBs
aWtlIGdub21lLXRlcm1pbmFsIGlzIHByZXNlbnQgYXMgYSBiaW5hcnkgYnV0IG5vIFggZGVza3Rv
cCBpcyBydW5uaW5nLi4uDQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=
