Return-Path: <chris.laplante@agilent.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0084.outbound.protection.outlook.com [104.47.41.84])
	by mail.openembedded.org (Postfix) with ESMTP id 040AA77BC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=c7oj5dfoTRFswQR0nLJvHo9NTyqoEKyzYgjOn3u1n94=;
	b=EttOUBK5d8JKnnjwOzLiP6fKlYCktR630Sbwsc944F3VDnDUrE3PqL7z00MiNuSwofzedw1gi1nqApjP2tbvJvwt6liw2D7dMlUlzfV+/Ld+Z0fiWYrkyD/Uv7T8NjcAscUDtJjzt8jQnd+ezEf+n6629yP44Bhz0vcKHHW+Y8c=
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com (10.174.115.15) by
	BN6PR1201MB2465.namprd12.prod.outlook.com (10.172.105.151) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.755.16; Mon, 14 May 2018 13:05:08 +0000
Received: from BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0]) by
	BN6PR1201MB0195.namprd12.prod.outlook.com
	([fe80::3909:7346:7f5c:68a0%4]) with mapi id 15.20.0755.018;
	Mon, 14 May 2018 13:05:08 +0000
From: <chris.laplante@agilent.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Thread-Topic: UNVERIFIED SENDER Re: [OE-core] Running BitBake multiple times
	without rechecking upstream AUTOREV versions
Thread-Index: AdPpVGUCuqEJeD5cQVOT+z6gc+ZaNgCB/hcAAAkDOoA=
Date: Mon, 14 May 2018 13:05:08 +0000
Message-ID: <BN6PR1201MB019568D1F8B405A49C7121CA8B9C0@BN6PR1201MB0195.namprd12.prod.outlook.com>
References: <BN6PR1201MB019576F9685E3FFFC5E183E08B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
	<1526286006.5720.113.camel@linuxfoundation.org>
In-Reply-To: <1526286006.5720.113.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [104.129.200.114]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR1201MB2465;
	7:JyKOMYlWGMMTGzDB+vv8vQCKQwH3fY9XGPyONJbY2HJIfqqZ/xDlwNki8N6Q5VIAiYKoVoSd8At2fdbD+4q7aTC5D7k/kgyPfYJI+Y9aNnLr0ssFzW4o6nqoa7XqAg7kK7aBV/jrhZ0H/Gnh5UPjvDOZqCabHZzKBK8Lr4+e7vCKZKI9L7ZWxaxLg1OReNw+2QwSZdENFoaUZwYgM74qJUm96ZLcFJt51vnzN8vxxvY7xZ5H2XVKqBOqS7kixrRS
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR1201MB2465; 
x-ms-traffictypediagnostic: BN6PR1201MB2465:
x-microsoft-antispam-prvs: <BN6PR1201MB246589028604FE588D7696768B9C0@BN6PR1201MB2465.namprd12.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231254)(11241501184)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:BN6PR1201MB2465; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR1201MB2465; 
x-forefront-prvs: 067270ECAF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39380400002)(396003)(39860400002)(366004)(29502001)(377424004)(53754006)(199004)(13464003)(189003)(8936002)(2501003)(55016002)(55236004)(5250100002)(53546011)(9686003)(53936002)(11346002)(446003)(6116002)(3846002)(229853002)(105586002)(316002)(5660300001)(66066001)(110136005)(7736002)(106356001)(3280700002)(76176011)(305945005)(59450400001)(6506007)(81166006)(81156014)(7696005)(26005)(102836004)(186003)(74316002)(3660700001)(97736004)(68736007)(99286004)(8676002)(486006)(478600001)(14454004)(2900100001)(6436002)(2906002)(86362001)(476003)(33656002)(6246003)(25786009)(217873001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB2465;
	H:BN6PR1201MB0195.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: krT2geZr0/uUnnVQysLsnu6Yuy/rKesJSeJhsYgX82XFeWt1eUvbPRLpbHbU5w6ZcXXKrvg1GasoLwGdtamMwoJ3II0SV1LTRZQR57VASDlB9qoe/5f6ZCn528JWniFGHXSO+vjlArxSqdTo2neBzNC6njqwwfGc10mLnYGpVmW7rQwYExIULoqEhtQU7AimcCLDI7JHPPsikt+gorgR2A==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: cbd227d7-1b9c-458a-342c-08d5b99b51b7
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd227d7-1b9c-458a-342c-08d5b99b51b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2018 13:05:08.3261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2465
Subject: Re: UNVERIFIED SENDER Re: Running BitBake multiple times without rechecking upstream AUTOREV versions
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
X-List-Received-Date: Mon, 14 May 2018 13:05:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhhdCBsb29rcyBwZXJmZWN0LCB0aGFua3MhIE9uIGEgcmVsYXRlZCBu
b3RlLCBpdCBzZWVtcyAiYml0YmFrZSAtLXJldmlzaW9ucy1jaGFuZ2VkIiBpcyBicm9rZW4gaW4g
U3VtbzoNCg0KRVJST1I6IENvbW1hbmQgZXhlY3V0aW9uIGZhaWxlZDogVHJhY2ViYWNrIChtb3N0
IHJlY2VudCBjYWxsIGxhc3QpOg0KICBGaWxlICIvaG9tZS9sYXBsYW50ZS95b2N0by9zb3VyY2Vz
L3Bva3kvYml0YmFrZS9saWIvYmIvY29tbWFuZC5weSIsIGxpbmUgMTE2LCBpbiBydW5Bc3luY0Nv
bW1hbmQNCiAgICBjb21tYW5kbWV0aG9kKHNlbGYuY21kc19hc3luYywgc2VsZiwgb3B0aW9ucykN
CiAgRmlsZSAiL2hvbWUvbGFwbGFudGUveW9jdG8vc291cmNlcy9wb2t5L2JpdGJha2UvbGliL2Ji
L2NvbW1hbmQucHkiLCBsaW5lIDcyMywgaW4gY29tcGFyZVJldmlzaW9ucw0KICAgIGlmIGJiLmZl
dGNoLmZldGNoZXJfY29tcGFyZV9yZXZpc2lvbnMoY29tbWFuZC5jb29rZXIuZGF0YSk6DQpUeXBl
RXJyb3I6IGZldGNoZXJfY29tcGFyZV9yZXZpc2lvbnMoKSB0YWtlcyAwIHBvc2l0aW9uYWwgYXJn
dW1lbnRzIGJ1dCAxIHdhcyBnaXZlbg0KDQoNCg0KTG9va3MgbGlrZSBjb21taXQgOTc2MTdmZDY3
NTVmZmEyNWMwNTgyMTVmZmIwNjBjYmI4NjI0MGI0NCBkcm9wcGVkIHRoZSAnZCcgYXJndW1lbnQg
ZnJvbSB0aGF0IG1ldGhvZCwgYnV0IGNvbW1hbmQucHkgd2FzIG5ldmVyIHVwZGF0ZWQgdG8gcmVm
bGVjdCB0aGF0Lg0KDQpTaGFsbCBJIHN1Ym1pdCBhIHBhdGNoIHRvIGNoYW5nZSB0aGUgbGluZSB0
byBiZSAiaWYgYmIuZmV0Y2guZmV0Y2hlcl9jb21wYXJlX3JldmlzaW9ucygpOiIgID8NCg0KQ2hy
aXMNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIFtt
YWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50OiBNb25kYXks
IE1heSAxNCwgMjAxOCA0OjIwIEFNDQpUbzogTEFQTEFOVEUsQ0hSSVMgKEEtTGl0dGxlIEZhbGxz
LGV4MSkgPGNocmlzLmxhcGxhbnRlQGFnaWxlbnQuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogVU5WRVJJRklFRCBTRU5ERVIgUmU6IFtPRS1j
b3JlXSBSdW5uaW5nIEJpdEJha2UgbXVsdGlwbGUgdGltZXMgd2l0aG91dCByZWNoZWNraW5nIHVw
c3RyZWFtIEFVVE9SRVYgdmVyc2lvbnMNCg0KT24gRnJpLCAyMDE4LTA1LTExIGF0IDE4OjIzICsw
MDAwLCBDaHJpcyBMYXBsYW50ZSB2aWEgT3BlbmVtYmVkZGVkLWNvcmUNCndyb3RlOg0KPiBIaSBh
bGwsDQo+IMKgDQo+IEnigJltIHdvcmtpbmcgb24gdXNpbmcgSmVua2lucyB0byBob3N0IG91ciBZ
b2N0byBidWlsZC4gT25lIG9mIHRoZSANCj4gdGhpbmdzIHRoYXQgd291bGQgYmUgbmljZSBpcyB0
byBiZSBhYmxlIHRvIGRvIGEg4oCcYml0YmFrZSBvdXItdXNlci0gDQo+IGltYWdl4oCdLCB1cGxv
YWQgdGhlIGFydGlmYWN0cyB0byBvdXIgbmV0d29yayBmaWxlIHN0b3JhZ2UsIGFuZCB0aGVuIGRv
IA0KPiBhIOKAnGJpdGJha2Ugb3VyLXVzZXItaW1hZ2UgLWMgcG9wdWxhdGVfc2RrX2V4dOKAnS4g
SeKAmWQgbGlrZSB0byBkbyB0aGVzZSANCj4gc2VwYXJhdGVseSBzbyB0aGF0IGRldmVsb3BlcnMg
YXJlIG5vdCB3YWl0aW5nIGFyb3VuZCBmb3IgdGhlIGVTREsgdG8gDQo+IGJlIGdlbmVyYXRlZCBp
ZiBhbGwgdGhleSBjYXJlIGFib3V0IGlzIHRoZSBrZXJuZWwsIGZvciBleGFtcGxlLiBNeSANCj4g
Y29uY2VybiBpcyB0aGF0IHRoZSBzZWNvbmQgYml0YmFrZSBpbnZvY2F0aW9uIGNvdWxkIGVuZCB1
cCBidWlsZGluZyANCj4gZGlmZmVyZW50IHN0dWZmIGlmIHNvbWVvbmUgd2VyZSB0byBjaGVjayBp
biBjb2RlIGluIGJldHdlZW4gd2hlbiB0aGUgDQo+IHR3byDigJxiaXRiYWtl4oCdcyBhcmUgcnVu
LiBUaGlzIGlzIHByaW1hcmlseSBhIGNvbmNlcm4gd2l0aCByZWNpcGVzIHRoYXQgDQo+IHVzZSBB
VVRPUkVWIChhcyB3ZSBkbyBmb3IgZGV2ZWxvcG1lbnQgcHVycG9zZXMpLg0KPiDCoA0KPiBJcyB0
aGVyZSBhIHdheSB0byBlc3NlbnRpYWxseSDigJxmcmVlemXigJ0gdGhlIEJpdEJha2UgZGF0YSBz
dG9yZSBhbmQgcmUtIA0KPiB1c2UgaXQgYWNyb3NzIG11bHRpcGxlIGJpdGJha2UgaW52b2NhdGlv
bnM/DQoNCkhhdmUgeW91IHRyaWVkwqBCQl9TUkNSRVZfUE9MSUNZID0gImNhY2hlIj8NCg0KQ2hl
ZXJzLA0KDQpSaWNoYXJkDQo=

