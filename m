Return-Path: <catalin-dan.udma@nxp.com>
X-Greylist: delayed 34529 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Mar 2019 23:11:51 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50077.outbound.protection.outlook.com [40.107.5.77])
	by mail.openembedded.org (Postfix) with ESMTP id 02A3F6C397
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 23:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bHwgvmvACHs8OAzTeYp8yjAYGRdPOtsjVDpEltlh8CI=;
	b=VKkKDs/9kjbtYUEAPM9V1sOnZDmhBN1dWTg2WhN6LL239v3Qr2kYiFkHdftWyCj8gQ35rPVBjnZjWfoVTGvvWbieFTgAwh8jduF3a7BTCVQPBWhDPyWR4z70KanVlbQUzHCWtteds+DDpwlwR0+zEFbhcmw/KtEZgOZ7hpl3HuE=
Received: from VI1PR04MB5565.eurprd04.prod.outlook.com (20.178.123.19) by
	VI1PR04MB4110.eurprd04.prod.outlook.com (52.133.14.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.19; Tue, 5 Mar 2019 13:36:19 +0000
Received: from VI1PR04MB5565.eurprd04.prod.outlook.com
	([fe80::59ab:7691:ef45:6982]) by
	VI1PR04MB5565.eurprd04.prod.outlook.com
	([fe80::59ab:7691:ef45:6982%5]) with mapi id 15.20.1665.020;
	Tue, 5 Mar 2019 13:36:19 +0000
From: Catalin Dan Udma <catalin-dan.udma@nxp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] insane.bbclass: fix QA-check to consider the
	PREFERRED_RPROVIDER for RDEPENDS
Thread-Index: AQHU01hqHgZ7Hp2xJEeaJNrTv59NIg==
Date: Tue, 5 Mar 2019 13:36:19 +0000
Message-ID: <1551792970-1216-1-git-send-email-catalin-dan.udma@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: VI1PR0202CA0024.eurprd02.prod.outlook.com
	(2603:10a6:803:14::37) To VI1PR04MB5565.eurprd04.prod.outlook.com
	(2603:10a6:803:d4::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=catalin-dan.udma@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.34.165.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f86c3bc7-c09b-4443-2319-08d6a16f8cbd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB4110; 
x-ms-traffictypediagnostic: VI1PR04MB4110:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtWSTFQUjA0TUI0MTEwOzIzOldic3JWUktXVVdsNFd6R3F5ZWU5WndUbUxx?=
	=?utf-8?B?RjFTcU82M0szZWFqN2ZLcjUxakhHandiRXZXVVk0Z2o4Umg2SWlURytPUUdo?=
	=?utf-8?B?WUViVXBhYkc4TWI3YkdsYjVKTHFtS0ZuTCs5MG4xL2VnUHVyVWQvTWxaV09U?=
	=?utf-8?B?dGVGNGUrb0lvelAycXgrbjdyU3ZUNVRxNWR1TlNrRFZBRnZySmpzUUw5d1Za?=
	=?utf-8?B?MGlrZGI1OEUyaS9ncnpGY3hURkNPSnJrUHdyMCtmVGViUE9ZdkF6SXpPSzU5?=
	=?utf-8?B?WGZ0QWZ0bktFS2Zrd0hldzdVQkt4a21NQ1ppKzl6dlRoUmo2Z2FSTUMwS28y?=
	=?utf-8?B?a3czdUp2ck9wY1NCWEdKN1dvZERVSVFEaDR2YVRYbEVscEIrTVFRb3RIVGlY?=
	=?utf-8?B?b1VmRmoxaU1pZjVtRHJyaU9YL3pRNWpqMElSbXZwUS9Td3VlaXBWS29QQWhX?=
	=?utf-8?B?MGE1citBMytNanJzd3pacS9mS3AzZi9KdjR5bDBLRkFtVzYrVnM1RUxTOUha?=
	=?utf-8?B?Ri90Qm1lLzhrRkdXWUZxNFdVM3o3aEQzMWt3ZEloT3FaMnZORjdMbGUza29q?=
	=?utf-8?B?SlZ4dk9GRmNiak16UmFaaHVzSEEvcE1MN0pRbDB0M3lGdVljM2ZpbjlhVUJI?=
	=?utf-8?B?WmRwNmVvZFJadG1PYlBvdE1oQ0E3N1JPY01CMmNDdUVUTC9FL1lDbUlpY0Zo?=
	=?utf-8?B?WXk0R3FuRDN1cmNWcDMyUmYyT3QvTHI2TzlDWlNnc2cxam1aWWxhRjA3YkxO?=
	=?utf-8?B?bXdPNC9HMXYybmM3a0FQVW9KMGRjZ0hsYXJKcjkvN0x2NEFqRXhTOHVQKzhX?=
	=?utf-8?B?Z1hWL1ZEcEtwMVQ2akFHcDlUTzlUT1ZLUkNubC9SMEZkOFdOK3hkQ1NIMGZT?=
	=?utf-8?B?Yzh3ZW40cmlWUE15d0NEN20wOUVGWGZnc3ltbGpXNVpPRkVrYURCM0VMWHZz?=
	=?utf-8?B?Sno1ZGJuOERmZXhyNGg5aHdVczZFQzBjMVJValUySDlvQno2WGhLM2QzdSt2?=
	=?utf-8?B?bldXcFpqeW02djhVSUUwRzhFeUdoTHk2TlVQVCtsamdZMGU1MTRSMFRoamRI?=
	=?utf-8?B?ckFaamloN2d4SkFDR28zOVprYURFUCt6c3RPcnd3ZVhlL2hmSnZWcENXZ05w?=
	=?utf-8?B?bEo0OFp4WGNxTlZEWUgxVDJqMDkxaDhYbkh3VXkyYk1WSXVVVC9oQkZOMkpV?=
	=?utf-8?B?N0JqWW1MYkZ5L3hNUVdTMjB4VmlzK1owSnMybWNiTy9IN0Z6VnNZa1FJbVZu?=
	=?utf-8?B?N2xRdkRpNU9KZnFmQytodEFuT05NQWJVRk5Yb05XN2tzanowb3RmMGl3QU9O?=
	=?utf-8?B?R3hnUytuS0Jodjh4YkQrTXpEZmQrVURHL1pCVDVVU0IrM0pKU0ZYNDIwWUVX?=
	=?utf-8?B?VFRJQXpGRjBLMk9vU2Q5aDFYeUhLem9KcFYwTUx4aUR6VEU5SmFIUXVCU1Bm?=
	=?utf-8?B?SkpMS1U5MEowS1FZenBjb1dBYlhqMHNHb2pIT0VlKzl4em1iMTRSWEtXbDBo?=
	=?utf-8?B?SG9Tbjg0dVN0bUppNlNib0xOQkFRQnNJMEVtc1FnaUlLWGhkUG5aYkpuMjR1?=
	=?utf-8?B?a1hDZHh5Y1ROM0hOSzJIc3g4Q2kwZVE9PQ==?=
x-microsoft-antispam-prvs: <VI1PR04MB411024DA16467A11ACEFB780DA720@VI1PR04MB4110.eurprd04.prod.outlook.com>
x-forefront-prvs: 0967749BC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(136003)(346002)(366004)(39860400002)(396003)(199004)(189003)(102836004)(478600001)(26005)(99286004)(50226002)(256004)(186003)(14454004)(6916009)(52116002)(68736007)(8936002)(386003)(66066001)(71200400001)(6116002)(6506007)(2906002)(3846002)(5660300002)(36756003)(316002)(81156014)(81166006)(106356001)(105586002)(2351001)(6436002)(6512007)(4326008)(7736002)(25786009)(5640700003)(97736004)(8676002)(53936002)(86362001)(2616005)(6486002)(2501003)(476003)(486006)(305945005)(71190400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4110;
	H:VI1PR04MB5565.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WcwdfadwvZyux8GHgNBGHsgKYF4v4pANbWKYfyr2bbDAEE9fbf9DthGhP0tXViADoXtYfi/uiW78/eHKWRgy5gIIkjotCU1yW/UJeznQaKPvRPBHJiCOddgtxTZAUKJtGcwtF8BoQOzIuxaNpLty41Qi4jkHr9ZlTFT3H9KTsx/LlH43yHT3QndZJGVMqnA9ktwcBJYUyPGKYCXrISlLxdjM+EayNEUF6A4c8naLq6n+DbSWPEu6iYX0VALmmF2UjINW2j8+xTGjVRvTWbDnR7F/beIkURg9KRH0YbO+mKMPdNO3tII6QkF0wEXDP1kU4xemR+xZxk4eXoARiXLIaBbpX1RYXG5mQwaZk/Ej1BKjRskF6q+XiiQsI5Dqm2N4CbIyolchwZRq5UEZ0ZpMahMvGxUNEFhmNgpYP+SS5Os=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86c3bc7-c09b-4443-2319-08d6a16f8cbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2019 13:36:19.6773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4110
Subject: [PATCH] insane.bbclass: fix QA-check to consider the PREFERRED_RPROVIDER for RDEPENDS
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
X-List-Received-Date: Tue, 05 Mar 2019 23:11:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E858414D59D45344A4D46625F6775A98@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

UUEtY2hlY2sgbG9va3MgaW4gdGhlIFJERVBFTkRTIGxpc3Qgd2l0aG91dCB0YWtpbmcgaW50byBj
b25zaWRlcmF0aW9uIHRoYXQgYQ0Kc3BlY2lmaWMgcGFja2FnZSBtYXkgaGF2ZSBhIFBSRUZFUlJF
RF9SUFJPVklERVIgZGVmaW5lZC4NCklmIFBSRUZFUlJFRF9SUFJPVklERVIgaXMgc2V0LCBRQS1j
aGVjayB3aWxsIGlnbm9yZSB0aGF0IHNldHRpbmdzIGFuZCB3aWxsDQpjb25zaWRlciB0aGUgb3Jp
Z2luYWwgcGFja2FnZSwgcmVzdWx0aW5nIGluIFFBLWNoZWNrIGVycm9yczoNCglFUlJPUjogZG9f
cGFja2F0ZV9xYTogUUEgSXNzdWU6IDwuLi4+LCBidXQgbm8gcHJvdmlkZXJzIGZvdW5kIGluDQoJ
UkRFUEVORFNfPHBhY2thZ2U+PyBbZmlsZS1yZGVwc10NClRoZSBmaXggaXMgdG8gcmVwbGFjZSB0
aGUgb3JpZ2luYWwgcGFja2FnZSBpbiB0aGUgUUEtY2hlY2sgd2l0aCB0aGUgbmV3DQpwYWNrYWdl
IGRlZmluZWQgaW4gUFJFRkVSUkVEX1JQUk9WSURFUiwgaWYgaXTigJlzIHNldC4NCg0KU2lnbmVk
LW9mZi1ieTogQ2F0YWxpbiBVZG1hIDxjYXRhbGluLWRhbi51ZG1hQG54cC5jb20+DQotLS0NCiBt
ZXRhL2NsYXNzZXMvaW5zYW5lLmJiY2xhc3MgfCA2ICsrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9pbnNhbmUuYmJjbGFz
cyBiL21ldGEvY2xhc3Nlcy9pbnNhbmUuYmJjbGFzcw0KaW5kZXggNjQxMTg4NC4uMTY1MjMzYiAx
MDA2NDQNCi0tLSBhL21ldGEvY2xhc3Nlcy9pbnNhbmUuYmJjbGFzcw0KKysrIGIvbWV0YS9jbGFz
c2VzL2luc2FuZS5iYmNsYXNzDQpAQCAtNjg5LDYgKzY4OSw5IEBAIGRlZiBwYWNrYWdlX3FhX2No
ZWNrX3JkZXBlbmRzKHBrZywgcGtnZGVzdCwgc2tpcCwgdGFza2RlcHMsIHBhY2thZ2VzLCBkKToN
CiAgICAgICAgICMgTm93IGRvIHRoZSBzYW5pdHkgY2hlY2shISENCiAgICAgICAgIGlmICJidWls
ZC1kZXBzIiBub3QgaW4gc2tpcDoNCiAgICAgICAgICAgICBmb3IgcmRlcGVuZCBpbiByZGVwZW5k
czoNCisgICAgICAgICAgICAgICAgcHJlZl9yZGVwZW5kID0gbG9jYWxkYXRhLmdldFZhcigiUFJF
RkVSUkVEX1JQUk9WSURFUl8lcyIgJSByZGVwZW5kKQ0KKyAgICAgICAgICAgICAgICBpZiBwcmVm
X3JkZXBlbmQ6DQorICAgICAgICAgICAgICAgICAgICByZGVwZW5kID0gcHJlZl9yZGVwZW5kDQog
ICAgICAgICAgICAgICAgIGlmICItZGJnIiBpbiByZGVwZW5kIGFuZCAiZGVidWctZGVwcyIgbm90
IGluIHNraXA6DQogICAgICAgICAgICAgICAgICAgICBlcnJvcl9tc2cgPSAiJXMgcmRlcGVuZHMg
b24gJXMiICUgKHBrZyxyZGVwZW5kKQ0KICAgICAgICAgICAgICAgICAgICAgcGFja2FnZV9xYV9o
YW5kbGVfZXJyb3IoImRlYnVnLWRlcHMiLCBlcnJvcl9tc2csIGQpDQpAQCAtNzM5LDYgKzc0Miw5
IEBAIGRlZiBwYWNrYWdlX3FhX2NoZWNrX3JkZXBlbmRzKHBrZywgcGtnZGVzdCwgc2tpcCwgdGFz
a2RlcHMsIHBhY2thZ2VzLCBkKToNCiAgICAgICAgICAgICAgICAgd2hpbGUgbmV4dDoNCiAgICAg
ICAgICAgICAgICAgICAgIG5ldyA9IFtdDQogICAgICAgICAgICAgICAgICAgICBmb3IgcmRlcCBp
biBuZXh0Og0KKyAgICAgICAgICAgICAgICAgICAgICAgIHByZWZfcmRlcCA9IGxvY2FsZGF0YS5n
ZXRWYXIoIlBSRUZFUlJFRF9SUFJPVklERVJfJXMiICUgcmRlcCkNCisgICAgICAgICAgICAgICAg
ICAgICAgICBpZiBwcmVmX3JkZXA6DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJkZXAg
PSBwcmVmX3JkZXANCiAgICAgICAgICAgICAgICAgICAgICAgICByZGVwX2RhdGEgPSBvZS5wYWNr
YWdlZGF0YS5yZWFkX3N1YnBrZ2RhdGEocmRlcCwgZCkNCiAgICAgICAgICAgICAgICAgICAgICAg
ICBzdWJfcmRlcHMgPSByZGVwX2RhdGEuZ2V0KCJSREVQRU5EU18iICsgcmRlcCkNCiAgICAgICAg
ICAgICAgICAgICAgICAgICBpZiBub3Qgc3ViX3JkZXBzOg0KLS0gDQoyLjcuNA0KDQo=

