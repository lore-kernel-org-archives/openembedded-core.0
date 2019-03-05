Return-Path: <catalin-dan.udma@nxp.com>
X-Greylist: delayed 10761 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Mar 2019 20:50:32 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
	by mail.openembedded.org (Postfix) with ESMTP id 04BF06BCD6
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bHwgvmvACHs8OAzTeYp8yjAYGRdPOtsjVDpEltlh8CI=;
	b=wE+TJR60q3NqodyKrOtFUYhWjL12I396WIv11IzUHj26rcF9cCEwtGtjhnVvZMD1drnk3WIFxWzAjjWoQRKjJfdAANh4/vpN8LQ8sHHaxD3ZJaQeaKs15FdrJN9amTkikPiMLJwnLnSf5QDSMrHnbl/+q3/h+5yvdomzIabeYvg=
Received: from VI1PR04MB5565.eurprd04.prod.outlook.com (20.178.123.19) by
	VI1PR04MB4864.eurprd04.prod.outlook.com (20.177.49.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.19; Tue, 5 Mar 2019 13:17:09 +0000
Received: from VI1PR04MB5565.eurprd04.prod.outlook.com
	([fe80::59ab:7691:ef45:6982]) by
	VI1PR04MB5565.eurprd04.prod.outlook.com
	([fe80::59ab:7691:ef45:6982%5]) with mapi id 15.20.1665.020;
	Tue, 5 Mar 2019 13:17:09 +0000
From: Catalin Dan Udma <catalin-dan.udma@nxp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] insane.bbclass: fix QA-check to consider the
	PREFERRED_RPROVIDER for RDEPENDS
Thread-Index: AQHU01W8DCPmdMeQKk++6d+btIBzdA==
Date: Tue, 5 Mar 2019 13:17:09 +0000
Message-ID: <1551791816-1060-1-git-send-email-catalin-dan.udma@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: VI1PR07CA0204.eurprd07.prod.outlook.com
	(2603:10a6:802:3f::28) To VI1PR04MB5565.eurprd04.prod.outlook.com
	(2603:10a6:803:d4::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=catalin-dan.udma@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.34.165.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c7248de-950c-4ff7-7d71-08d6a16cdf0f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB4864; 
x-ms-traffictypediagnostic: VI1PR04MB4864:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtWSTFQUjA0TUI0ODY0OzIzOmtZaG5rSjJtQVEzS1dQb0N2T09TNmpTSnhi?=
	=?utf-8?B?UURoV2lRdU5YSU8xTGdBdVBlRkxWV3FrUWpLQU9yZnFmQlAxdWhtOHVjeHBQ?=
	=?utf-8?B?eVJtbllEQmtCSDBic0p1YlNzYllXMm14S0RlcFJ1eGpFZHg1cThZTWxYYVkr?=
	=?utf-8?B?QWlwUlZ1d0hoeGxvaTluNlZGeE5sK21ENFhkanRyNy9FcWJqaGJnNTM1TTNG?=
	=?utf-8?B?T3ArRGpxa00wd3RuVlNsbEZwQXVkN2ZQdTl2YXFYZXZsT1ZreFk1V3VPU3Bn?=
	=?utf-8?B?aUZVMzBTbHZaYkU2eU1KdjJBZXEydFlyZmRzM0s1SkswSFpiUzFzVWNjUTBr?=
	=?utf-8?B?NVFSdUdFR242dTkwMTBiK1lPcldpRWhxME4rUXZqZUs3S3JSV1RoNm54Q3FH?=
	=?utf-8?B?WlRGdjk1dzFFRUFJTmt0V213M2tud01MWkxYMjVLUVJvdmgyOGxtSGdvRUFH?=
	=?utf-8?B?bFNCNWc4cVI5WlptUzdEU3pEYTJaNkgrQmR0RXJPd1RqRzZKWEppVndJSXBr?=
	=?utf-8?B?U083NVM4cHYrT2hLYnRPM2Q0dE5DaTRVWWdDcSsvSVFnZUR2UmlRd1puRFE0?=
	=?utf-8?B?cnpYYTNnSTJ3SWdjRDlyeVp6TmM3WktaVC9UZlFEK0VlMXVoNXh4cVMzeUZI?=
	=?utf-8?B?dnZmK3N2QUhaaGdIUGRlWWxOZXVKNC92TGpCOThoTmNrMFovclJtWVVLY1Yr?=
	=?utf-8?B?UWM1NlZ1WUZHU1Z0Ymh1dTYyU1BlRkxHTnpFQVNHUkdSL1lxUGFJZ0hMd0dB?=
	=?utf-8?B?SlIybnNvQWZKRXYxRGFxdENZamk5SzhtUkVqZXMzUWlUM3FwcTlIMlVaM3hB?=
	=?utf-8?B?QkUrK1Y0Wk40aUt4Z01zamdLdlBDVUgwdmxQQ0JCUHhhamFIRzZ1SFp6VWdO?=
	=?utf-8?B?NzF0Rm9VclZyMWNiWng3Uk1kUjh1NTY1NXBqUTdHSHd1endPYzlIQzJ4dmQx?=
	=?utf-8?B?cFlwMW96MUZ0TWxCVmJRcFNLUHJEQ0hsUnFCUU5oRFRDRWtJQWcwamgrU2Rq?=
	=?utf-8?B?dzNHaUlUblIvMWpGTHNnTFlKR2dPdWoreFYralNiWTF4dDltVnhydzBtR201?=
	=?utf-8?B?OWtzc2JWdWhvbXRFK01BSVAwUkdCT2V5US9zNTJpb0xicEVIQmtYTk5zVHlp?=
	=?utf-8?B?RkUwR3J5Z3A2T1NLQVZmOGtOWlRXS2JhaVMyeElnTzZrYnJKemgxSTZLbFNo?=
	=?utf-8?B?Uy85R1JUWGxmRW5kSkRvRGRLekVhdnhSRWVINzZRbys5TXNBSU8zRi9vWGNu?=
	=?utf-8?B?VThYMWovQmprd0Q2U2JPYjRqdi9ZMmFKQkVsbGhVcldrZ25lWHpXSGtwbHdW?=
	=?utf-8?B?dndxb0k1YXlFejlIUGRHQnVhdERnK3RwaXVQRjQwV0Z3WmFNTTNvblZkMTh6?=
	=?utf-8?B?Mnl6VXBOSzluemVjMmxxbEdpeEJOMHUrOVZyVEMxZUl1ZGp1MjQvRjlXZHZQ?=
	=?utf-8?B?WUhFY1B0eFh3dHNjU2RGL29pcTg0b3FNU3hsOWorZWIxZFBCNU9ZbkMxRUFE?=
	=?utf-8?B?Rzl5N2hHUXRZNTVTT2FHeGpJSS9vRXk1OHgweXBEeHNqZThOS3llR21jdEs0?=
	=?utf-8?B?bUdKTlNHckg4M2VieVY0aHJuMituemc9PQ==?=
x-microsoft-antispam-prvs: <VI1PR04MB48645C4791F72873F2356D24DA720@VI1PR04MB4864.eurprd04.prod.outlook.com>
x-forefront-prvs: 0967749BC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(2616005)(186003)(4326008)(476003)(26005)(97736004)(486006)(25786009)(6916009)(6512007)(5640700003)(6436002)(71190400001)(14454004)(316002)(71200400001)(256004)(478600001)(53936002)(81166006)(2351001)(6486002)(105586002)(106356001)(66066001)(305945005)(36756003)(81156014)(7736002)(3846002)(6116002)(52116002)(102836004)(2501003)(8676002)(6506007)(386003)(2906002)(99286004)(86362001)(5660300002)(8936002)(50226002)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4864;
	H:VI1PR04MB5565.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nPE2mQvM7A89IfeZXSTeCSOxs12T9tsEcm2VG/95fFamEGqt5T63Cty10TlWCBvX0wAHiIV9nJfxP4qBTonRFR28rae9I2kU6vtjHAAX7nZacLcMhRm6H4Z0ZnVN6HtMOZPsXw9qsI2gRKzQWl1VJBi++ERnUfaLEpHLdD09JEkfMyI1we2pheG56Kqe69xDutLKUm7+/Q5fmWlH4XiAzKrB0UBhBTuImhgM9xXbdneqk7y5TLnt/2/afECQ2XTJEfxNKaX4KOvkqYp5a/yHPCwSx6Q8pLHXp41ekGZXWbJKJ1ZVWenkQCyczXKHDRZJ9Yp2eA6IC4Z8qsjNoaTniAMEEuGT+jNz/DI5fjZWicMaKASwT6x9qsbXD3PCVJzDLhhpxVakgPDz6NaX2Zc8ZbuslxTsWLrUsOQsj/DJ9v0=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7248de-950c-4ff7-7d71-08d6a16cdf0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2019 13:17:09.3370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4864
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
X-List-Received-Date: Tue, 05 Mar 2019 20:50:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E79B79C84C4D894CB1518E814F1E3F04@eurprd04.prod.outlook.com>
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

