Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.82])
 by mx.groups.io with SMTP id smtpd.web10.120.1591746365663812436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 16:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lEKkSKJ9;
 spf=pass (domain: windriver.com, ip: 40.107.237.82, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB0VpxBf9S3DtFmnul27KJ2n3qNRoc0Dx+fjZ46Jhe/B0G1MPCcWa5t7U4SzBgx576/wR1mKGF665LioBcMljGw2qb626swEX7ZygQXWuaX53OWw4SvbGPsZvdASV0/IKoWAUqDjwA4hm913ywK5g73TRaZVn6ocOMlXE+advHDYAKGtMvpeF8YboNVsX+Tx8cAj88bLqgHTxX539jAkhmeRx3+oEg0FSRm0zAKrdFyRxD3EZYHL6Ew5kO1frt0+ar4oHNTWT+u277RMMQtys012bjt06KnAdA2j5ViUcRp5I2sGW+1AI+q9IUgamGa+p9fRqWw2jTuPuufqmo921w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynaUQc8D2gkuU3oX4Qan3s99r1qM3e4oyNXcTzjsz04=;
 b=B4zliKg3m6lmIOAWWsbvOKdsL/844yBbtWt0lfZpiLfreXqZLPXHNXV5Sd4BHLdYxjuimzLO9LHHsBTrPWkTjYglqvZ0byhocs1eQvFoWtkLK46TY9ao93CILPUMUm/aI6CmWpKfakfjFphITpPD8AbaUL7Ue1lzix854uhBJwOsGhFmqQW+yXNTV+wFNmuAc0J5FdEB6DIrXy9ehvCzZy7WzZ5zndOHKTnp8o/+kHl6hpm3fqje4ZYx3FgsogkqRenX1ag0L+zVP8es8TGJ4R97WNW+AWwWBXPfyniiUC1lT7HxhyP0lVladNm2Pl5UPLRWgE9kbPoj0aoRwRDO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynaUQc8D2gkuU3oX4Qan3s99r1qM3e4oyNXcTzjsz04=;
 b=lEKkSKJ95qyFS/H6HqOU7NBI2aGnX2GG77GbBCmBKrM7wTF4ArLmgxAKU9Sq6391xXjfJAusTzQGKI/vanadNzvhxc4ff5GVJVIVWbYyn1eooIFjtZs5bfJIfSv/0Y8ugw3fLNH1jyw8Bck+x4XRZqUudqmYn+QTeNxCqSJL4Ec=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4212.namprd11.prod.outlook.com (2603:10b6:a03:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 23:46:03 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::2c89:3733:2dbb:3a8d]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::2c89:3733:2dbb:3a8d%4]) with mapi id 15.20.3088.018; Tue, 9 Jun 2020
 23:46:03 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>, "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [V2][oe-core][PATCH 1/1] vim: _FORTIFY_SOURCE=2 be gone
Thread-Topic: [V2][oe-core][PATCH 1/1] vim: _FORTIFY_SOURCE=2 be gone
Thread-Index: AQHWPq/CpjNc1J9pOkqV8+jkIFN4T6jQ5dmAgAALKzA=
Date: Tue, 9 Jun 2020 23:46:02 +0000
Message-ID: 
 <BY5PR11MB3992B5F35F26DC203A9DA1A188820@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20200609224602.195758-1-joe.slater@windriver.com>
 <CAJ86T=W23pyx+KVb6nXj6AVUuzGpGP08xDOX0AT=rR74oDg3eA@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=W23pyx+KVb6nXj6AVUuzGpGP08xDOX0AT=rR74oDg3eA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b8ed10b-2c99-47b8-883e-08d80ccf452f
x-ms-traffictypediagnostic: BY5PR11MB4212:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BY5PR11MB42126CF3012AFF46C806ADC988820@BY5PR11MB4212.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 042957ACD7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ABCXZVqQrM+waOuiz+D+GUZozYAHtVZlo7KpZZMzRjJRd4pLzvedMlr4WAerKnyQTrhkFiyqQ02bk/5N9lb+zkgxNlbCurNnNs7WM5EbFr4WCaBNMikkzcMKCt++tbtcovmBbbcB/NKZMlGXFx7JC0QpM01MFTd3s9QTrykWPIIhpojNHPISro9K75WJ5CexibAaAQfQd04IKYZ/wkBT25plP8oYtKJV5hixiXDbjOLDpDlc1on8gk4lUc/UZG2s0YRY0ol+3ttLUzWXspVqEeKlroKneKmwQq82yXdbpohz2bBPakPZ9Thz4CAQQFLe2FNQ+p6HAAXsG9IaLjAypw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(396003)(39850400004)(346002)(376002)(26005)(55016002)(316002)(186003)(66476007)(66946007)(478600001)(66446008)(66556008)(76116006)(64756008)(9686003)(5660300002)(54906003)(86362001)(4326008)(2906002)(33656002)(8676002)(107886003)(6506007)(71200400001)(6916009)(8936002)(53546011)(83380400001)(52536014)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 PUbJiaK/zaVZa0HywasRtJEXSxEXPFkdXik2ijOt1TvyVOqqXnSuZnZZOTEecXLLY8mEAeTKoGA9yLjHlFmFr0uw/cBrHfntS4J/CvjzMc8ipgT/58Vz+xkDTU5/It0H8ua+6LWaWSThhgwQDUNu/siPeZTp5GxVvh14IgW6Ajq4lNQatAtDqWTSX1xaLQgsS889oZ6BO5thcNlBdJwGovNwgnHSLotYsdBWN8pm/0YCjTxaydNK1ZdPhA9jD/u86iZYJUle38Sl/xjF6oNE3elL8ZiRU7oPeFuER2lDMbI9OF/4KlypYslUNMbsXdLvBDHWA7LmXWWUjK20AQG9SBRkl0OvuqQl2cGJWdKfesYUXO2P7wOEtT6QVVbHhG5nv5VGvlLVrDZ5lZYKuMNR+jOIqBix+Z5QPc90vVqGIJB/o+4ouYGjBLaIQgt1nTAyaVRx8+PYnWtNymTCFwufkKDHL+/phZZmpSlV3b4bPB8=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8ed10b-2c99-47b8-883e-08d80ccf452f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2020 23:46:02.9992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hos/udE0EYqUrlnf/6M4R2xVV6wVPouZ9VmCbU6yJiQsr3PPcNc4jhzV40iSg8dh9mc2fV3y4mFjny2ZfD03QGMeIG5gGgsH8o6N0Gctrps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4212
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBhcyB0byBsY2xfbWF5YmVfZm9ydGlmeSgpIGJlaW5nIHZpc2libGUsIGJ1dCB3aHkgdGhl
ICI/PSIgPyAgTWF5YmUsIHRoZSBzZWN1cml0eSBmbGFncw0KU2hvdWxkIGhhdmUgYSBwbi12aW0g
ZW50cnkuICBJIGRvbid0IGxpa2UgdGhhdC4gIE1heWJlIHRoZSB2aW0gcmVjaXBlIHNob3VsZCBt
b2RpZnkgbGNsX21heWJlX2ZvcnRpZnkoKQ0KYnV0IEkgcmVhbGx5IGRvbid0IGxpa2UgdGhhdCBl
aXRoZXIuICBTdGlsbCwgdmltIHNob3VsZCBiZSB1c2VhYmxlLiAgV2hhdCBJIGRvIG5vdCB1bmRl
cnN0YW5kIGlzIHdoeQ0KdGhpcyBoYXMgbm90IGJlZW4gcmVwb3J0ZWQuICBJcyBldmVyeWJvZHkg
dXNpbmcgdGhlIHZpIHByb3ZpZGVkIGJ5IGJ1c3lib3g/DQoNCkpvZQ0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4g
DQpTZW50OiBUdWVzZGF5LCBKdW5lIDksIDIwMjAgMzo1OSBQTQ0KVG86IFNsYXRlciwgSm9zZXBo
IDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+DQpDYzogT0UgQ29yZSBtYWlsaW5nIGxpc3QgPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBNYWNMZW9kLCBSYW5keSA8
UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPg0KU3ViamVjdDogUmU6IFtWMl1bb2UtY29yZV1b
UEFUQ0ggMS8xXSB2aW06IF9GT1JUSUZZX1NPVVJDRT0yIGJlIGdvbmUNCg0KT24gVHVlLCBKdW4g
OSwgMjAyMCBhdCAzOjQ2IFBNIEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4g
d3JvdGU6DQo+DQo+IHZpbSB3aWxsIGFib3J0IGluIG1hbnkgcGxhY2VzIHdpdGggdGhpcyBzZXR0
aW5nLiAgUmVwbGFjZSBpdCB3aXRoIHRoZSANCj4gYmVuaWduIF9GT1JUSUZZX1NPVVJDRT0xLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+
DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbV84LjIuYmIgfCA1ICsrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltXzguMi5iYiANCj4gYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92aW0vdmltXzguMi5iYg0KPiBpbmRleCA2MDk0NmExODFmLi43MDliNmRkYjU1IDEwMDY0
NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltXzguMi5iYg0KPiArKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltXzguMi5iYg0KPiBAQCAtOCwzICs4LDggQEAgQkJD
TEFTU0VYVEVORCA9ICJuYXRpdmUiDQo+ICBBTFRFUk5BVElWRV8ke1BOfV9hcHBlbmQgPSAiIHh4
ZCINCj4gIEFMVEVSTkFUSVZFX1RBUkdFVFt4eGRdID0gIiR7YmluZGlyfS94eGQiDQo+ICBBTFRF
Uk5BVElWRV9MSU5LX05BTUVbeHhkXSA9ICIke2JpbmRpcn0veHhkIg0KPiArDQo+ICsjIFdlIG92
ZXJyaWRlIHRoZSBkZWZhdWx0IGluIHNlY3VyaXR5X2ZsYWdzLmluYyBiZWNhdXNlIHZpbSAobm90
IA0KPiArdmltLXRpbnkhKSB3aWxsIGFib3J0ICMgaW4gbWFueSBwbGFjZXMgZm9yIF9GT1JUSUZZ
X1NPVVJDRT0yLiAgU2VjdXJpdHkgZmxhZ3MgYmVjb21lIHBhcnQgb2YgQ0MuDQo+ICsjDQo+ICts
Y2xfbWF5YmVfZm9ydGlmeSA9ICIke0BvZS51dGlscy5jb25kaXRpb25hbCgnREVCVUdfQlVJTEQn
LCcxJywnJywnLURfRk9SVElGWV9TT1VSQ0U9MScsZCl9Ig0KDQoibGNsX21heWJlX2ZvcnRpZnki
IHdhcyBzdXBwb3NlZCB0byBiZSBhIHByaXZhdGUgbG9jYWwgdmFyaWFibGUgaW4gc2VjdXJpdHlf
ZmxhZ3MuaW5jLiBJZiBpdCdzIG5vdyBhIGRvY3VtZW50ZWQgZ2xvYmFsIHZhcmlhYmxlIHdoaWNo
IHJlY2lwZXMgYXJlIGFsbG93ZWQgdG8gbWVzcyB3aXRoLCBpdCBzaG91bGQgYmUgcmVuYW1lZCAo
ZS5nLg0KY2FwaXRhbGlzZWQgYW5kIHRoZSBsY2xfIHByZWZpeCByZW1vdmVkKS4NCg==
