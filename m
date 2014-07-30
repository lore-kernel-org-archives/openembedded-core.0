Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0183.outbound.protection.outlook.com [207.46.163.183])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6EB707BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:22:19 +0000 (UTC)
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB153.namprd03.prod.outlook.com (10.255.201.15) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Wed, 30 Jul 2014 07:22:19 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.89]) by
	BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.89]) with mapi id
	15.00.0995.014; Wed, 30 Jul 2014 07:22:19 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH] base-files: set dynamic COLUMNS via
	resize command
Thread-Index: AQHPqwuihbX4NzFewUaRdBxrfcHTFpu4IAOAgAAXHSA=
Date: Wed, 30 Jul 2014 07:22:18 +0000
Message-ID: <19dbe2a74545440b8260f9c7e5513aac@BN1PR03MB156.namprd03.prod.outlook.com>
References: <1406624623-25774-1-git-send-email-ting.liu@freescale.com>
	<CAMKF1sqhHngoBV2G7NnGjQTYDY4QRA+hCm8HF3VKxk0K4Qj1sg@mail.gmail.com>
In-Reply-To: <CAMKF1sqhHngoBV2G7NnGjQTYDY4QRA+hCm8HF3VKxk0K4Qj1sg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(24454002)(51704005)(189002)(199002)(377454003)(13464003)(76576001)(79102001)(105586002)(77982001)(101416001)(31966008)(74662001)(46102001)(4396001)(86362001)(74502001)(99286002)(21056001)(77096002)(95666004)(85852003)(85306003)(76482001)(92566001)(99396002)(33646002)(76176999)(83072002)(54356999)(81342001)(19580395003)(106356001)(20776003)(110136001)(83322001)(50986999)(2656002)(19580405001)(107046002)(74316001)(81542001)(87936001)(64706001)(106116001)(80022001)(66066001)(108616002)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR03MB153;
	H:BN1PR03MB156.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: set dynamic COLUMNS via resize command
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
X-List-Received-Date: Wed, 30 Jul 2014 07:22:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJh
ai5raGVtQGdtYWlsLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDMwLCAyMDE0IDE6NTcg
UE0NCj4gVG86IExpdSBUaW5nLUIyODQ5NQ0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMg
YWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbb2UtY29y
ZV1bUEFUQ0hdIGJhc2UtZmlsZXM6IHNldCBkeW5hbWljIENPTFVNTlMgdmlhDQo+IHJlc2l6ZSBj
b21tYW5kDQo+IA0KPiBPbiBUdWUsIEp1bCAyOSwgMjAxNCBhdCAyOjAzIEFNLCAgPHRpbmcubGl1
QGZyZWVzY2FsZS5jb20+IHdyb3RlOg0KPiA+IEJ5IGRlZmF1bHQsIENPTFVNTlMgaXMgc2V0IHRv
IDgwLiBJZiBwb3NzaWJsZSwgcnVuICdyZXNpemUnIHRvDQo+ID4gZGV0ZXJtaW5lIHdoYXQgdGhl
IGN1cnJlbnQgZGltZW5zaW9ucyBhcmUuIFRoaXMgYXZvaWRzIHRoZSBmaW5hbCBwYXJ0DQo+ID4g
b2YgbG9uZyBsaW5lcyBvdmVybGFwIHRoZSBzdGFydCBvZiB0aGUgc2FtZSBsaW5lLg0KPiA+DQo+
IA0KPiB3aGF0IGFwcHMgYXJlIHNob3dpbmcgdGhlc2UgaXNzdWVzID8NCg0KUHV0dHkgdG8gbG9n
aW4gYm9hcmQgdmlhIHNlcmlhbCBwb3J0Lg0KDQo=

