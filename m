Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0041.outbound.protection.outlook.com [104.47.2.41])
	by mail.openembedded.org (Postfix) with ESMTP id 70D177449E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2018 03:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RdrRKmactetlotwDnIhAeFZTkw4fh8PrXSSKZDMJ5IQ=;
	b=S+ELoWDSdBRCgZq7TMs4q6rIeTjt6AOxNdfCGNszH9+Lkh6uXTSVJMDeAH/I/autChvaxtmZzd+Ig4TGj4/WduD9e9ahq8ec/oWoxrzcBqTHi5Ul4OdHTQPfDwroUV/ruV78re3wZyx/xaikTIkObpy0c3yqloN8WKEvijYtXwU=
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136) by
	AM5PR0402MB2899.eurprd04.prod.outlook.com (10.175.42.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.653.12; Sat, 7 Apr 2018 15:37:07 +0000
Received: from AM5PR0402MB2817.eurprd04.prod.outlook.com
	([fe80::c0e7:a573:efad:aa60]) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com
	([fe80::c0e7:a573:efad:aa60%10]) with mapi id 15.20.0653.012;
	Sat, 7 Apr 2018 15:37:07 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] python3: Add recommended modules to nativesdk
	install
Thread-Index: AQHTzErQXzrF0DXcIkuUqt2RNuRsoKPyMwqAgAM7HxA=
Date: Sat, 7 Apr 2018 15:37:07 +0000
Message-ID: <AM5PR0402MB28170F53C366ED380DB78674E2B90@AM5PR0402MB2817.eurprd04.prod.outlook.com>
References: <1522869935-31522-1-git-send-email-tom.hochstein@nxp.com>
	<1522936553.11431.425.camel@linuxfoundation.org>
In-Reply-To: <1522936553.11431.425.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [192.88.168.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2899;
	7:fYj+YP/ezkDsfM4GYUQUv8MmXu1Q9e3KZGGNM+1CrqVnrI+gB9TP9Gl4F6wDOrJSK+7wbe+Q932syHiJUag2YGxqNXCDcWy8S7mC7IUdQm0ugaQsnmBTcG3V82e9N8mtl1WIAk2NoYCcxaRO+1Uu2nuC58jKuroyvipwPyUg6JSsG7ks9LgtzdshMX1svG8CP5caHU81G34r/JmUD2ueJLNnctaayZ+nVeW/ieGJ//ZPsDdws378Z06aFC1W+T3r
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a2ed7f01-fa03-491d-75ef-08d59c9d6bde
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0402MB2899; 
x-ms-traffictypediagnostic: AM5PR0402MB2899:
x-microsoft-antispam-prvs: <AM5PR0402MB2899AC7C5271385900512F22E2B90@AM5PR0402MB2899.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231221)(944501327)(52105095)(93006095)(93001095)(10201501046)(6055026)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:AM5PR0402MB2899; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2899; 
x-forefront-prvs: 0635D5275E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(39380400002)(366004)(396003)(346002)(376002)(377424004)(199004)(189003)(13464003)(102836004)(3660700001)(3846002)(26005)(2900100001)(14454004)(11346002)(476003)(8676002)(68736007)(7736002)(86362001)(81156014)(305945005)(6116002)(229853002)(186003)(3280700002)(446003)(486006)(81166006)(478600001)(99286004)(106356001)(110136005)(5660300001)(6246003)(2501003)(74316002)(76176011)(5250100002)(66066001)(25786009)(53936002)(8936002)(2906002)(6506007)(55016002)(6436002)(53546011)(7696005)(105586002)(33656002)(97736004)(316002)(9686003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2899;
	H:AM5PR0402MB2817.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 0UtpNEMPrfWjEo+tCcE8b6wzjXtv0KgJyeMm2M7mPXNNgkxi5trCc/eEo7MkZkGfzVibDW+ukmB9AedlIxtIChybocqt84Lu8DiH2L3Ofha3Y/H07aEw6xYV5Kg+BiT+DJJ+Co1wvaLfQr8csm1RMxWh0O7fvoWEjeG9z8fM21DxQaN/jl4eqa8ZT2z5Tj+s4+gvCMdqvsA8/de+6LM/VMg86IsiDk+YofvBsHJ8PKpdmxD88YOr1g06gzaWjfs0zJlmllJx0C6jMNL5aQ6Xnf4OJlWseuoL3ijIkZs1yjGlnngJodmcxQmeahvyRtcOmNJQdPcwbbV20X3ukqgpdWNDP7ivo2IRidPbfpglFpQaSnMe/zCuncVTuFkjt0C5sh1wsBkQlOGTdh9be/cPydZf/ttNc9WlZ4eEe94KeoI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ed7f01-fa03-491d-75ef-08d59c9d6bde
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2018 15:37:07.4741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2899
Subject: Re: [PATCH] python3: Add recommended modules to nativesdk install
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
X-List-Received-Date: Sun, 08 Apr 2018 03:12:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QSBjb2xsZWFndWUgcG9pbnRlZCBvdXQgdGhhdCB3aGF0IHdlIGluc3RhbGxlZCBpbiB0aGUgU0RL
IGZvciBweXRob24gMyB3YXMgbm90IGZ1bmN0aW9uYWwsIGFuZCB0aGF0IGEgbWluaW1hbCBzZXQg
b2YgbW9kdWxlcyB3YXMgcmVxdWlyZWQuICBJJ20gbm90IGFuIGV4cGVydCwgYnV0IEkgZm91bmQg
YSBzaW1pbGFyIGxpbmUgaW4gdGhlIHB5dGhvbiAyIHJlY2lwZSBhbmQgdGhvdWdodCBpdCBtaWdo
dCBiZSB3aGF0IHdhcyBuZWVkZWQgaGVyZS4NCg0KVG9tDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmddIA0KU2VudDogVGh1cnNkYXksIEFwcmlsIDUsIDIwMTggODo1NiBBTQ0K
VG86IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT47IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBweXRob24zOiBBZGQgcmVjb21tZW5kZWQgbW9kdWxlcyB0byBuYXRpdmVzZGsgaW5zdGFsbA0K
DQpPbiBXZWQsIDIwMTgtMDQtMDQgYXQgMTQ6MjUgLTA1MDAsIFRvbSBIb2Noc3RlaW4gd3JvdGU6
DQo+IFRoZSBweXRob24zIGluc3RhbGxhdGlvbiBpbiB0aGUgU0RLIGRpZCBub3QgaW5jbHVkZSB0
aGUgbWluaW11bSBzZXQgb2YgDQo+IG1vZHVsZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUb20g
SG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54cC5jb20+DQo+IC0tLQ0KPiDCoG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjUuNS5iYiB8IDEgKw0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uM18zLjUuNS5iYg0KPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uM18zLjUuNS5iYg0KPiBpbmRleCBkNDU4ZDMyLi5mODkzYjg0IDEwMDY0NA0K
PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy41LjUuYmINCj4g
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuNS41LmJiDQo+IEBA
IC0yMTEsNiArMjExLDcgQEAgcHlfcGFja2FnZV9wcmVwcm9jZXNzICgpIHsNCj4gwqANCj4gwqAj
IG1hbnVhbCBkZXBlbmRlbmN5IGFkZGl0aW9ucw0KPiDCoFJQUk9WSURFU18ke1BOfS1tb2R1bGVz
ID0gIiR7UE59Ig0KPiArUlJFQ09NTUVORFNfJHtQTn0tY29yZV9hcHBlbmRfY2xhc3MtbmF0aXZl
c2RrID0gIiBuYXRpdmVzZGstcHl0aG9uMy0NCj4gbW9kdWxlcyINCj4gwqBSUkVDT01NRU5EU18k
e1BOfS1jcnlwdCA9ICJvcGVuc3NsIg0KPiDCoFJSRUNPTU1FTkRTXyR7UE59LWNyeXB0X2NsYXNz
LW5hdGl2ZXNkayA9ICJuYXRpdmVzZGstb3BlbnNzbCINCg0KVGhpcyBkb2Vzbid0IGxvb2sgY29y
cmVjdCwgaWYgeW91IHdhbnQgdGhlIFNESyB0byBjb250YWluIGFsbCBweXRob24gbW9kdWxlcywg
c3VyZWx5IHlvdSdkIGp1c3QgYWRkIG5hdGl2ZXNkay1weXRob24zLW1vZHVsZXMgcmF0aGVyIHRo
YW4gZm9yY2luZyB0aGlzIGV2ZXJ5d2hlcmU/DQoNCkNoZWVycywNCg0KUmljaGFyZA0K

