Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.45])
 by mx.groups.io with SMTP id smtpd.web10.3737.1603857307273662961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 20:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ml348+F6;
 spf=pass (domain: windriver.com, ip: 40.107.93.45, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBI9WXbXfZ32XhnqYMRYJ/sPKODLPuTUK6dDpNHwkULRvt/3Vgyh/7crvWbUos022dRFjUiLfvrmB8sjgBSDwy0MMf0El2272v+lPjz37fO8NIKtht6Wj4+qipTVU+daT1JIMbifLndQfzPsS0NSQFd2Cti06tvTnQO+lG3hUhhLo/wJ2iEQKmW7P5CNuBVWAQyD5yG0vKVIIxeyHwnzYXmKoBbm9THo3pBQREZ0YYP04Db+XEPdqUZXHGHDdngSb2dlVquswEtSS0P+Ik4H5x9cJaA6kp2QQ/7vG0vaoqZG20eSdiKFaRhhxuHM5Pkcdjs77byzq1CERfum+aGb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqkQk6yBvNLn9D+rSqZhIEBWAsM2ZlUkN6b74qYq0A4=;
 b=HS7QfCACDJABszuPWZ/Vm6Mmoyo0Pj1/wYSZPtJ5xXbJto1eHe+OKBOb4N1BSlBYH+5yyXyUKfK6HgdlxAFg3ggl0mdFeKU2GrfP2vm7zmKNrwz+FD7DseRuugJbETHLzeDRAU5C/Vg4x4s1TtYOeM2eVTR/86B6dp2GafwmFjt9vl3Hcio3Qvg2rvL6EoAqWIRHgDRHQeA2GcIbW1V98I0S5MolU9/9ffANYvYU7GHd3hvCLQEXEnDz+m1uiNkoDqX+IytpWSAnpVBfdctlkIxth3b4zP4rIIlcb6TjM2vLl/okkz+Nc5PS1L9lzTZQ0hKI3SwxD6wP30qtjx8jbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqkQk6yBvNLn9D+rSqZhIEBWAsM2ZlUkN6b74qYq0A4=;
 b=Ml348+F6OtJUk7gIVigFdfcRw0pmP3GhMyi1w6bXvfnB9caKSeKPSeKCOBJtt2KY8OVh4hK8t/Sx6XSFiNKlGYnj8Pwi+4zbZqv1RAG/78P+z6B9tFzATRRL/3nQ8TJR+YYSpzO7zbd0HTHZsNrkWCgwHn5hMikBotDB6Gvo2qU=
Received: from BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15)
 by BYAPR11MB3670.namprd11.prod.outlook.com (2603:10b6:a03:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 03:55:05 +0000
Received: from BYAPR11MB2600.namprd11.prod.outlook.com
 ([fe80::9c3a:15e0:fe83:ffd9]) by BYAPR11MB2600.namprd11.prod.outlook.com
 ([fe80::9c3a:15e0:fe83:ffd9%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 03:55:04 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman
	<steve@sakoman.com>
CC: "anuj.mittal@intel.com" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core][PATCH] grub: fix several CVEs in grub 2.04
Thread-Topic: [OE-core][PATCH] grub: fix several CVEs in grub 2.04
Thread-Index: AQHWlH7JygdGYgmq20a18tNxCARVyamrHeSAgACTZoCAABhngIAAyUcw
Date: Wed, 28 Oct 2020 03:55:04 +0000
Message-ID: 
 <BYAPR11MB2600076BCAA0679D61206A9DE5170@BYAPR11MB2600.namprd11.prod.outlook.com>
References: <1638867317AD6658.17423@lists.openembedded.org>
	 <BYAPR11MB26006BAF0A30835DD46D6475E5160@BYAPR11MB2600.namprd11.prod.outlook.com>
	 <CAOSpxda2BNPNBt1sa260DbLQBFj-W8Q_2HcSmQkRXah1WXx=iQ@mail.gmail.com>
 <9a94719a551dc12209b57d8500c1a28b9639f45d.camel@linuxfoundation.org>
In-Reply-To: 
 <9a94719a551dc12209b57d8500c1a28b9639f45d.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 812c74e2-5aed-4958-ca34-08d87af54106
x-ms-traffictypediagnostic: BYAPR11MB3670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB3670113784B68445C1E6B55AE5170@BYAPR11MB3670.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lKDM/T9or/SoeWtHY2xnHYAA3za9SIFZPadfri7qk2u+hqp4BTiBCjOoWFfU4geywNkjnET1npiLXXaYTeWF5YHmXYLgUMcOEDgTTHauMhXabDPgjByaCSS8H0cLzkh8ehrR2rsWV2SFPVMbDR+95S3ttGfSnwxegWlZYDAJoEYcHA8pUGIJz/RvPlHPV1tWQYEoAmYursBPlbdA0HdlTIBfmLee2ZZ255jxZ0ZkEfMgLxJvZc8by2sxvE1pDSOTW6PlBBJpUL1UyTwrktVPrW9fnrTZNnbh62yxokS6HosVVUTgX8J5pSxVQsN0KaRZS2KBtqEmlKS6N5wQTt7L2nqn6nrodscYqW+QXKpaMrdAArolooBc+COwZacDbKDlkWAaw9Zg7wjODLicqrK7Ng==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2600.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(39830400003)(346002)(66446008)(64756008)(6506007)(53546011)(66556008)(66476007)(76116006)(66946007)(71200400001)(52536014)(83380400001)(8676002)(7696005)(55016002)(86362001)(966005)(9686003)(54906003)(110136005)(478600001)(26005)(5660300002)(4001150100001)(2906002)(186003)(4326008)(33656002)(8936002)(107886003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 MCokix35Y1QY15ZUiTGSjcPjbd9IiRELWHLB6y9/0FGojTI1ynicM74BU0NCbGMTuEOEhyteGQVJCe5DMPngGZCxGiMRHJrx6VXVjHPpsA9tVvesPftl9lm/jPpi6kOciFoqfJdfvyx7Q3afGRdomQ/iG9REzKBEDaNeMNxBDxg/TZD9AfnLQPJBlTDDRaGpVGHQ8Jl3jttdBQSXr57qj7tAyOkhRGMoLkbWXHOoqwitKLlwkVy/a83vN9Sv53xNgEKDjlCZTM29LKjmtNaAe3GMxvG4pKn+gvgkuXQM8+cLXbTSlza3Nbl8wKNITomr9VnOPbuefTM08QjmRUpBIgKLyHPr37ll4RLhrkvUJFdBLXE79GNUbWLxvwA78W60uopH5CetpQcX2Zlj1p0Dgzx9PSImHokPe2e/4jBR4OBPzSO/hEX2RpjsglaSmU/5HjKTWF/aUHvsxkeTU18HSzxIcl5ICenxEA4Q2LcUQctb/HiaLKiIDEn7N7T7U1/nPDUPP4aV51DCrhPo0FlHp8HYjEwq8S8IrdJn2yUf/Scl4qsf12Utzwv2KT3oKB2ySLJm1qGyZmoTQOal7/6gn1i2jnepHzYAxRt4aEJ54tV0chGtOy03s8JVCopR4qgO6yyD7/DaCt/NXfKGMbf2Ow==
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812c74e2-5aed-4958-ca34-08d87af54106
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 03:55:04.8865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUsE7Vc1War+wFR+fFekEW/CzEWG6xc7A5gZ9V0Fwhx9RU6uw1fbQJFp06uG6ofMc4juZ3Tu41a6gzdzcNQp/9KcPVfNEckrRGgJ7yBXCYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3670
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVHVlc2RheSwgT2N0b2Jl
ciAyNywgMjAyMCAyMzo1NA0KPiBUbzogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+
OyBMaXUsIFlvbmd4aW4NCj4gPFlvbmd4aW4uTGl1QHdpbmRyaXZlci5jb20+DQo+IENjOiBhbnVq
Lm1pdHRhbEBpbnRlbC5jb207IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc7DQo+IE1hY0xlb2QsIFJhbmR5IDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIGdydWI6IGZpeCBzZXZlcmFsIENWRXMgaW4gZ3J1
YiAyLjA0DQo+IA0KPiBPbiBUdWUsIDIwMjAtMTAtMjcgYXQgMDQ6MjYgLTEwMDAsIFN0ZXZlIFNh
a29tYW4gd3JvdGU6DQo+ID4gRmlyc3Qgb2YgYWxsLCB0aGFua3MgZm9yIGhlbHBpbmcgd2l0aCBD
VkUncyENCj4gPg0KPiA+IEkndmUgYmVlbiB3YWl0aW5nIGZvciB0aGlzIHRvIGhpdCBtYXN0ZXIg
c28gdGhhdCBJIGNhbiBhbHNvIHRha2UgaXQgaW4NCj4gPiBkdW5mZWxsICh3aGljaCBhbHNvIHVz
ZXMgZ3J1YiAyLjA0KS4gUmljaGFyZCBtYXkganVzdCBoYXZlIG1pc3NlZA0KPiA+IHRoaXMuDQo+
ID4NCj4gPiBIb3dldmVyIEkgbm90aWNlIHRoYXQgaW4gdGhlIG1lYW50aW1lIGFub3RoZXIgcGF0
Y2ggaGFzIGhpdCBtYXN0ZXINCj4gPiB3aGljaCBhbHNvIGZpeGVzIENWRS0yMDIwLTEwNzEzOg0K
PiA+DQo+ID4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9j
b21taXQvP2lkPWVjNmEyMjU4Y2EyNw0KPiA+IGQ1NzA5ZGY0ZmUxOGQ5NDg0MTMzMjM5NWJjYjIN
Cj4gPg0KPiA+IFNvIHlvdSdsbCBuZWVkIHRvIHN1Ym1pdCBhIHYyIHdoaWNoIHRha2VzIHRoaXMg
aW50byBhY2NvdW50Lg0KPiA+DQo+ID4gSSBsb29rIGZvcndhcmQgdG8gdGFraW5nIHRoaXMgaW4g
ZHVuZmVsbCENCj4gDQo+IEkgdGhpbmsgdGhlIG90aGVyIHBhdGNoIGNhbWUgaW4gZmlyc3QgYW5k
IHdhcyBhbHJlYWR5IHF1ZXVlZC4gQXMgU3RldmUNCj4gc2F5cywgY291bGQgeW91IHNlbmQgYSB2
MiBwbGVhc2Ugb24gdG9wIG9mIHdoYXQgd2FzIGFscmVhZHkgbWVyZ2VkLiBJJ2QNCj4gYWxzbyBs
aWtlIHRvIHNlZSB0aGVzZSBmaXhlZCwgdGhhbmtzIQ0KDQpWMiBoYXMgYmVlbiBzZW50LiBQbGVh
c2UgaGVscCB0byByZXZpZXcuDQoNClRoYW5rcywgDQpZb25neGluDQoNCj4gDQo+IENoZWVycywN
Cj4gDQo+IFJpY2hhcmQNCg0K
