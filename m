Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 18143 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Jun 2019 17:45:00 UTC
Received: from APC01-HK2-obe.outbound.protection.outlook.com
	(mail-oln040092255070.outbound.protection.outlook.com [40.92.255.70])
	by mail.openembedded.org (Postfix) with ESMTP id 9358F7E684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 17:45:00 +0000 (UTC)
Received: from HK2APC01FT008.eop-APC01.prod.protection.outlook.com
	(10.152.248.59) by HK2APC01HT004.eop-APC01.prod.protection.outlook.com
	(10.152.248.104) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.13;
	Tue, 25 Jun 2019 06:10:02 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM (10.152.248.56) by
	HK2APC01FT008.mail.protection.outlook.com (10.152.248.117) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2008.13 via Frontend Transport; Tue, 25 Jun 2019 06:10:02 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::b8c4:a082:8a02:5f9]) by PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::b8c4:a082:8a02:5f9%4]) with mapi id 15.20.2008.014;
	Tue, 25 Jun 2019 06:10:02 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] mesa: Add support for the lima PACKAGECONFIG
Thread-Index: AQHVKxyffCI9nwMuP0iZW5SOexruNw==
Date: Tue, 25 Jun 2019 06:10:01 +0000
Message-ID: <PSXP216MB027790589FE21D3ADF93F65FDDE30@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0023.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::36) To PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	(2603:1096:300:a::18)
x-incomingtopheadermarker: OriginalChecksum:FC844BAB9C935A533DF64158C6C8357985F2D077B4FC7B0A26A74D235587DC9A;
	UpperCasedChecksum:653F8DE5544DAA6722A07148BB6B91F0AF320821AF26DF346B8FE3F31865654C;
	SizeAsReceived:7452; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-tmn: [R0+D8Ph51ziyca36KarE23ZX2JALattlCbEnmwBpymLDsQj2CqBdh/LUSd6B7qMr]
x-microsoft-original-message-id: <20190625060945.15303-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
	SRVR:HK2APC01HT004; 
x-ms-traffictypediagnostic: HK2APC01HT004:
x-microsoft-antispam-message-info: xd077VdYNS2WOavUHqEnej5rZTqkM+7njRikxgXGUfyxhqPJHk9dvCregCwoMrE/G3EPD391egevYWs6DynqwlO6ofGGZwVXVcD7SObkgy0hTlLqrfNBWNtQGHwyzxZhl4A1fofIpgNQs/bA6MhxIn94lc2Iub/LfOFoml82Ai9icGlkwDmIaAVTCNXj/BQG
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bc1c66-8025-4e85-b9bf-08d6f933c1fc
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 06:10:01.9182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT004
Subject: [PATCH] mesa: Add support for the lima PACKAGECONFIG
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
X-List-Received-Date: Tue, 25 Jun 2019 17:45:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4N
Ci0tLQ0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jIHwgMyArKysNCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9tZXNhLmluYyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2Eu
aW5jDQppbmRleCAzZWNmYjg1MDZjLi41YmJkMTNiY2EyIDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMNCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL21lc2EuaW5jDQpAQCAtMTEzLDYgKzExMyw5IEBAIFBBQ0tBR0VDT05GSUdbZ2FsbGl1bS1s
bHZtXSA9ICItRGxsdm09dHJ1ZSAtRHNoYXJlZC1sbHZtPXRydWUsIC1EbGx2bT1mYWxzZSwgbGx2
DQogZXhwb3J0IFdBTlRfTExWTV9SRUxFQVNFID0gIiR7TUVTQV9MTFZNX1JFTEVBU0V9Ig0KIFBB
Q0tBR0VDT05GSUdbeGFdICA9ICItRGdhbGxpdW0teGE9dHJ1ZSwgLURnYWxsaXVtLXhhPWZhbHNl
Ig0KIA0KK1BBQ0tBR0VDT05GSUdbbGltYV0gPSAiIg0KK0dBTExJVU1EUklWRVJTX2FwcGVuZCA9
IiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2xpbWEnLCAnLGxpbWEnLCAn
JywgZCl9Ig0KKw0KIE9TTUVTQSA9ICIke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJ
RycsICdnYWxsaXVtJywgJ2dhbGxpdW0nLCAnY2xhc3NpYycsIGQpfSINCiBQQUNLQUdFQ09ORklH
W29zbWVzYV0gPSAiLURvc21lc2E9JHtPU01FU0F9LC1Eb3NtZXNhPW5vbmUiDQogDQotLSANCjIu
MjEuMA0KDQo=

