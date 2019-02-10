Return-Path: <Diego.SantaCruz@spinetix.com>
X-Greylist: delayed 129436 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Feb 2019 15:51:29 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
	by mail.openembedded.org (Postfix) with ESMTP id B7E866D523
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=diIbrSiFXoSB630E4xMKCcqKrbkIyu4pBDy1lhAPPjQ=;
	b=ttv+YKAlWE+QEFZyQB/zXKc1PRPqBsbEcpX6aXDZ7FHqfNEK7CJHoC2+Lrjow1eM2iYro60u3jp3Nb+AR8CGW7xTstAcMHgbXKOi/oh8snl9ri0chm7r+8aPOuSvJg9ZEuDerA4Vp6iFnpR2e7aSgcs1Ik6HJl5uXNjFx8qHg38=
Received: from VI1PR01MB5167.eurprd01.prod.exchangelabs.com (20.178.120.225)
	by VI1PR01MB5343.eurprd01.prod.exchangelabs.com (20.178.122.97) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1601.19;
	Sun, 10 Feb 2019 13:18:54 +0000
Received: from VI1PR01MB5167.eurprd01.prod.exchangelabs.com
	([fe80::f933:d84e:cb4c:71be]) by
	VI1PR01MB5167.eurprd01.prod.exchangelabs.com
	([fe80::f933:d84e:cb4c:71be%5]) with mapi id 15.20.1601.023;
	Sun, 10 Feb 2019 13:18:54 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] Problem with blocked signals in daemons started from
	rpm postinstall scriptlet
Thread-Index: AdS/67mdnLMJ4wCyS5atu3K3O4lGXgAwTpQAACVwA6A=
Date: Sun, 10 Feb 2019 13:18:54 +0000
Message-ID: <VI1PR01MB5167533CA48B792978BEFDBA886B0@VI1PR01MB5167.eurprd01.prod.exchangelabs.com>
References: <VI1PR01MB51675AC59E6B6C4D17536D3F88690@VI1PR01MB5167.eurprd01.prod.exchangelabs.com>
	<CANNYZj8NRcP=bFqy1oHY106V2=8d--HOFypBTWrpRnsnZe0kpw@mail.gmail.com>
In-Reply-To: <CANNYZj8NRcP=bFqy1oHY106V2=8d--HOFypBTWrpRnsnZe0kpw@mail.gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Diego.SantaCruz@spinetix.com; 
x-originating-ip: [2a02:1205:5076:2250:89a1:d17:cd88:f509]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR01MB5343;
	6:RYRIbCnleOsO1HRC2t0QBQQ8pkq0giPXEsR3fZvPEBX457GymaIY/A4L9uTtg+dnB6T/XoQSnl3HQxH3bKpdq8J2RllohOtodi5+hYKjg47UPyUzHwhrp1wMEap+GoiNkNjHFKAByG/vXAxnWqW75c5OjgUSQVH/MYR1JRo4P1sjWv1W0OFMtQ/IrUAluon0xc9bWWW+/5uDpfTnUDvbP/XGJooRwB7MPAhZ46/CIwhyBaJUNcRz1rzLP19dBb5bIlP3+3faQ8j9Rl9rDrAYnEE/PAJZMwjdqDjs5587jIYdy0K/jK+KPCqCupdX5a3s/x0Wc1iTE8IaLxj230dHXV9neRlIBzfij51KAj8R+zC6jYghxFWm8BB8ytXO5htPNkXUY0TGCcqzX5RI6J68QptXZw3IRBJLR4iOXzHDQAf1u6AFRNrg9kYed0alggesdUkxk3XPywyInb7cQBzH5w==;
	5:eXSzbHY2Dh6AYlJM6RHhkwZxyv0rHuhD+TbaU0bFhj6huWQSVHw8x4WgnQVanoTXRg1hAT0tlNrDs4V1vlydIz1ULtOWKGuvLURse8qrWO2lR2rJOxCF0aiOrzLgbwY8+wpNKFavO6I+dx0rt8T3axZKENAqOdIF/eRt4wFDZQ1dKjgJ4zYci9XY9N+mZlRLUv7/m/Yp1XpmmEjO2mPfHg==;
	7:UTZ0LigVIJ8b1HoAHXU7YG+ku8D6NE1Y0K3tgKFPbF0BZbcnFfvOKmoS8Do5K8VI1snYGUwsedmLHjHQNmDtoRY2lX9MnOiBlfmdSJLEv693QFqlMVWrxsR/3/sagn/OGLmvxmjZCmskiCKKjjl8lg==
x-ms-office365-filtering-correlation-id: 69aa06d2-f55f-4a0f-70e4-08d68f5a4e6b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR01MB5343; 
x-ms-traffictypediagnostic: VI1PR01MB5343:
x-microsoft-antispam-prvs: <VI1PR01MB53431F0667B4CFE9506DB5EE886B0@VI1PR01MB5343.eurprd01.prod.exchangelabs.com>
x-forefront-prvs: 09443CAA7E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39830400003)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(13464003)(316002)(74316002)(25786009)(33656002)(186003)(46003)(102836004)(86362001)(15650500001)(105586002)(53936002)(14444005)(106356001)(256004)(99286004)(6506007)(7736002)(305945005)(6116002)(6246003)(7696005)(76176011)(53546011)(97736004)(486006)(4326008)(446003)(55016002)(81166006)(81156014)(6436002)(11346002)(6916009)(229853002)(68736007)(9686003)(8676002)(8936002)(476003)(71190400001)(71200400001)(508600001)(14454004)(2906002)(72206003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR01MB5343;
	H:VI1PR01MB5167.eurprd01.prod.exchangelabs.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: spinetix.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gfDDSLPuAP/LxkKdXQA1Y9QnIYdPnSNhDOcLNCC+UHrYO8CB9raibUVWJ+JpN7DlGJJzY5lVHPnjXKQMLALM6mE2zYFk76OiP7Z8UMk19L0eAh1Wd5P257yj9ndKHunRZqVTT7i6/MbjH2Tt2LGlN7f9e1Bn71Gqo4wipxPg2nlwUiaTGhRiZwKHlsZJSqj5PGWNLweg75qURWdPPO5NppKlFssJyfBcvZ2tXhFu7gIKO15nXnqtQD6O6bMsH8QOGuoWdDX1V/jDw3o0O9YzhHcapkfwDlUtGfgiQ2al4FiF2mDLW03cP9EyT00UN95nO8JtR1XqQMiPRQAtFfx6ny+m3i+OWKt29uwPSJ2ekKXM0dAwlB3gLGWebEY0xdLaQXy4CDULGc6xDJmpC5C5Y2cZQXTfl+fADWdLHQQT5Gg=
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69aa06d2-f55f-4a0f-70e4-08d68f5a4e6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2019 13:18:54.3845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB5343
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with blocked signals in daemons started from rpm postinstall scriptlet
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
X-List-Received-Date: Sun, 10 Feb 2019 15:51:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIEZlYnJ1YXJ5IDksIDIw
MTkgODoyNCBQTQ0KPiBUbzogRGllZ28gU2FudGEgQ3J1eiA8RGllZ28uU2FudGFDcnV6QHNwaW5l
dGl4LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBQcm9ibGVtIHdpdGggYmxvY2tlZCBzaWduYWxzIGlu
IGRhZW1vbnMgc3RhcnRlZCBmcm9tDQo+IHJwbSBwb3N0aW5zdGFsbCBzY3JpcHRsZXQNCj4gDQo+
IE9uIFNhdCwgOSBGZWIgMjAxOSBhdCAxOTo1NSwgRGllZ28gU2FudGEgQ3J1eiB2aWEgT3BlbmVt
YmVkZGVkLWNvcmUNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiA+IEkgYW0gaGF2aW5nIHByb2JsZW1zIHdpdGggZGFlbW9ucyB0aGF0IGdldCBz
dGFydGVkIGZyb20gdGhlIHJwbQ0KPiBwb3N0aW5zdGFsbCBzY3JpcHRsZXQsIHZpYSB1cGRhdGUt
cmMuZCwgdGhhdCB0aGV5IGNhbm5vdCBiZSBraWxsZWQuIEludmVzdGlnYXRpbmcgSQ0KPiBkaXNj
b3ZlcmVkIHRoYXQgdGhleSBoYXZlIG1vc3Qgc2lnbmFscyBibG9ja2VkLiBNeSBndWVzcyBpcyB0
aGF0IHJwbSBibG9ja3MNCj4gYWxtb3N0IGFsbCBzaWduYWxzIHNvIHRoYXQgc2NyaXB0bGV0cyBk
byBub3QgZmFpbCwgYnV0IGFzIHRoZSBzaWduYWwgbWFzayBpcw0KPiBpbmhlcml0ZWQgYWNyb3Nz
IGZvcmsgYW5kIGV4ZWMgdGhlIGRhZW1vbnMgZW5kIHVwIGJlaW5nIGJsb2NrZWQuIExvb2tpbmcg
YXQNCj4gdXBkYXRlLXJjLmQgaXQgaXMgYSBzaW1wbGUgc2hlbGwgc2NyaXB0IHdoaWNoIGRvZXMg
bm90IHJlc2V0IHRoZSBzaWduYWwgbWFzaywgc28NCj4gYW55IGRhZW1vbnMgc3RhcnRlZCBmcm9t
IHRoZXJlIGluaGVyaXQgdGhlIHNpZ25hbCBtYXNrLg0KPiA+DQo+ID4gRXZlbiB3b3JzZSwgdGhp
bmdzIGxpa2UgbnRwIHdoaWNoIHJlbHkgb24gU0lHQUxSTSBmYWlsIHRvIHdvcmsgcHJvcGVybHkN
Cj4gd2hlbiBzdGFydGVkIGZyb20gdGhlIHBvc3RpbnN0YWxsIHNjcmlwdGxldC4NCj4gPg0KPiA+
IEFueSBpZGVhcyBvbiBob3cgY291bGQgdGhpcyBiZSBzb2x2ZWQsIEkgYW0gY29uc2lkZXJpbmcg
dHdlYWtpbmcgdXBkYXRlLQ0KPiByYy5kIHRvIGlnbm9yZSB0aGUgLXMgb3B0aW9uIGFzIGEgd29y
a2Fyb3VuZCwgYXQgbGVhc3QgaXQgYXZvaWRzIHRoZSBpc3N1ZSBhbmQNCj4gYW55aG93IGluIG15
IHNldHVwIEkgYWx3YXlzIHJlYm9vdCBhZnRlciBpbnN0YWxsaW5nIG9yIHVwZGF0aW5nIHBhY2th
Z2VzLg0KPiBBbnkgb3RoZXIgaWRlYXM/DQo+IA0KPiBJJ2Qgc3VnZ2VzdCB5b3UgdGFrZSB0aGlz
IHRvIHJwbSB1cHN0cmVhbS4gT2J2aW91c2x5IHJwbSBpcyB3aWRlbHkNCj4gdXNlZCBpbiBGZWRv
cmEsIFJIRUwgYW5kIG90aGVyIGRpc3Ryb3MsIHNvIHNvbWVob3cgcGVvcGxlIGNhbiBmaW5kIGEN
Cj4gd2F5IGFyb3VuZCB0aGlzLg0KPiANCg0KSSdsbCB0cnkgdG8sIGJ1dCBJIHRoaXMgaXMgYSBu
b24taXNzdWUgb24gdGhvc2UgZGlzdHJvcy4gVGhleSB1c2Ugc3lzdGVtZCBhbmQgaW4gdGhhdCBj
b250ZXh0IHRoZSBkYWVtb25zIGFyZSBub3Qgc3RhcnRlZCBieSB0aGUgcnBtIHBvc3QtaW5zdGFs
bCwgYnV0IGZyb20gc3lzdGVtZCwgc28gdGhlcmUgaXMgbm8gaXNzdWUgd2l0aCBkYWVtb25zIGlu
aGVyaXRpbmcgdGhlIHNpZ25hbCBtYXNrIChub3Igb3RoZXIgcHJvY2VzcyBzZXR0aW5ncyk7IHRo
ZSBwb3N0LWluc3RhbGwganVzdCByZXF1ZXN0cyB0aGF0IHN5c3RlbWQgc3RhcnRzIHRoZSBkYWVt
b24uDQoNCi0tIA0KRGllZ28gU2FudGEgQ3J1eiwgUGhEDQpUZWNobm9sb2d5IEFyY2hpdGVjdA0K
c3BpbmV0aXguY29tDQoNCg==

