Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0188.outbound.protection.outlook.com [207.46.163.188])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA296EABD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:52:45 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB090.namprd03.prod.outlook.com (10.255.241.158) with Microsoft
	SMTP Server (TLS) id 15.0.908.10; Fri, 28 Mar 2014 09:52:44 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Fri, 28 Mar 2014 09:52:42 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) with mapi id
	15.00.0898.005; Fri, 28 Mar 2014 09:52:42 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] coreutils: fix search paths for libstdbuf.so
Thread-Index: AQHPSE/DnrNg3i8bM02ctiEgKC+FbJr2RLZw
Date: Fri, 28 Mar 2014 09:52:42 +0000
Message-ID: <66397b1727f84069b9fe88c64166d2b3@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1395743836-17276-1-git-send-email-B40290@freescale.com>
	<1395744951.24890.25.camel@ted>
	<CAMKF1srOdzitgUsHD69DLij2MofhNgOkQ9d04DGH-14iS1Lx5Q@mail.gmail.com>
In-Reply-To: <CAMKF1srOdzitgUsHD69DLij2MofhNgOkQ9d04DGH-14iS1Lx5Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(51704005)(377454003)(199002)(189002)(164054003)(24454002)(13464003)(97186001)(4396001)(15975445006)(74706001)(74876001)(97336001)(76482001)(19580395003)(19580405001)(83322001)(81686001)(85306002)(74316001)(47446002)(81342001)(74662001)(53806001)(33646001)(56776001)(74502001)(54316002)(98676001)(92566001)(94946001)(95416001)(49866001)(93516002)(47736001)(85852003)(90146001)(56816005)(93136001)(87936001)(2656002)(95666003)(94316002)(46102001)(86362001)(74366001)(51856001)(47976001)(80976001)(54356001)(83072002)(81816001)(50986001)(87266001)(575784001)(15202345003)(69226001)(80022001)(20776003)(63696002)(66066001)(31966008)(65816001)(76796001)(77096001)(81542001)(76786001)(77982001)(59766001)(76576001)(79102001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB254;
	H:BY2PR03MB254.namprd03.prod.outlook.com;
	FPR:E5CFCCD6.2F125C29.9ED9BAA.42A9FD6D.202A0; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: fix search paths for libstdbuf.so
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
X-List-Received-Date: Fri, 28 Mar 2014 09:52:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkkgc2V0ICItLS1saWJleGVjZGlyPSR7bGliZGlyfSIgaW4gYmIgZmlsZS4NCg0K
SSBzdWJtaXQgbmV3IHBhdGNoIGZvciB0aGlzIGlzc3VlIC4NCg0KUGxlYXNlIHJldmlldyBpdCAu
DQoNClRoYW5rcywNCmNodW5yb25nDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29tXSANClNlbnQ6IFdlZG5lc2Rh
eSwgTWFyY2ggMjYsIDIwMTQgMToyNCBBTQ0KVG86IFJpY2hhcmQgUHVyZGllDQpDYzogR3VvIENo
dW5yb25nLUI0MDI5MDsgUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUg
bGF5ZXINClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBjb3JldXRpbHM6IGZpeCBzZWFy
Y2ggcGF0aHMgZm9yIGxpYnN0ZGJ1Zi5zbw0KDQpPbiBUdWUsIE1hciAyNSwgMjAxNCBhdCAzOjU1
IEFNLCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4g
d3JvdGU6DQo+IEtoZW0gYWRkZWQgdGhpcyBiYWNrIGluIDIwMTE6DQo+DQo+IGh0dHA6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9wb2t5LWNvbnRyaWIvY29tbWl0L21ldGEvcmVjaXBl
cy0NCj4gY29yZS9jb3JldXRpbHM/aD1ycHVyZGllL3QyJmlkPWVlZTBiNWFhZGJhMzQxMzAwODBk
ZjhhZWJjN2U4ZGQ1N2M3ZDVjYw0KPiBiDQo+DQo+IEtoZW06IEFueSBpZGVhIHdoYXQgdGhpcyB3
YXMgZm9yPw0KDQpjb3JldXRpbHMgY2hhbmdlZCB0aGlzIGJhY2sgaW4gOC4xMyB0aW1lZnJhbWUg
dG8gYXBwZWFzZSBhdXRvbWFrZSB3aGljaCBzdG9wcGVkIGFjY2VwdGluZyBwa2dsaWJfUFJPR1JB
TVMgYW5kIGl0IHdhcyBtb3ZlZCB0byBwa2dsaWJleGVjX1BST0dSQU1TIGxpc3Qgc2luY2UgdGhp
cyBsaWJyYXJ5IGlzIHNwZWNpYWwgd2hlcmUgeW91IGRvIG5vdCBsaW5rIHRvIGl0IGRpcmVjdGx5
IGJ1dCBwcmVsb2FkIGl0IHRvIGRpdmVydCBzdGRpbyBidWZmZXJzIGNvcmV1dGlscyBkZXZzIGRp
ZCBub3QgY2xhc3NpZml5IGl0IHRvIGJlIGluc3RhbGxlZCBpbiBsaWJkaXIgYnV0IGluIGxpYmV4
ZWNkaXIgaW5zdGVhZCBhbmQgaWYgeW91IGxvb2sgc3RkYnVmIHByb2dyYW0gd2hpY2ggc2V0cyB1
cCB0aGlzIHByZWxvYWRpbmcgaXMgaGFyZHdpcmVkIHRvIGxvb2sgaW50byBsaWJleGVjZGlyIGFu
ZCBtb2RpZmllcyB0aGUgcHJlbG9hZCBzZWFyY2ggcGF0aCB0byBpbmNsdWRlIGxpYmV4ZWNkaXIg
aW4gc2VhcmNoIHBhdGgsIHNvIGlmIHdlIHNwZWNpZnkgLS1saWJleGVjZGlyPS4uIHRvIGNvbmZp
Z3VyZSBhbmQgbWFrZSBzdXJlIHRoYXQgdGhpcyAuc28gbGFuZHMgaW4gc2FtZSBkaXJlY3Rvcnkg
b24gdGFyZ2V0IHRoZW4gd2UgYXJlIG9rLiBkaWQgd2UgY2hhbmdlIGdsb2JhbCBsaWJleGVjZGly
ID8NCg0KDQo=

