Return-Path: <mike.looijmans@topicproducts.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00081.outbound.protection.outlook.com [40.107.0.81])
	by mail.openembedded.org (Postfix) with ESMTP id C097D7F3B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 05:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5u7ubxhK/n178er2Op86bLm9AatwurKo28Qf/UBcMVI=;
	b=ie5VQKuyOhqbgxpPhoJrZ+9ilQMlQuHILcbhpzVItJ3RXgFVSCKoGZ7cAtUhxV4IKJ9MIfHjlnmRU6rloCb4iTuLe74Vdu1/gKchC59y7tGJeowUrFgiKSmRA1jnaUtK7eMwJm2lek6/sxFbBodII1GAeHZHqXjO9kINvA5qobs=
Received: from VI1PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:803:64::35)
	by AM5PR0401MB2579.eurprd04.prod.outlook.com (2603:10a6:203:37::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15;
	Wed, 31 Jul 2019 05:47:11 +0000
Received: from DB5EUR01FT035.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e02::203) by VI1PR04CA0100.outlook.office365.com
	(2603:10a6:803:64::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15 via
	Frontend Transport; Wed, 31 Jul 2019 05:47:11 +0000
Authentication-Results: spf=pass (sender IP is 52.166.56.231)
	smtp.mailfrom=topicproducts.com; lists.openembedded.org;
	dkim=pass (signature
	was verified) header.d=topicbv.onmicrosoft.com; lists.openembedded.org; 
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.166.56.231 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.166.56.231;
	helo=westeu11-emailsignatures-cloud.codetwo.com;
Received: from westeu11-emailsignatures-cloud.codetwo.com (52.166.56.231) by
	DB5EUR01FT035.mail.protection.outlook.com (10.152.4.243) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.14 via Frontend Transport; Wed, 31 Jul 2019 05:47:10 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (104.47.4.50) by
	westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Wed, 31 Jul 2019 05:47:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oFsZ1C9xwf/99ViTlrJDFooXwCkuxokA545jy1DS1eTlMGm3ICtlaMqiGHH77ETjb0zUyVlJn6b2DHPTk8iurdSToAjJkY0v8Fgjg9jmlDjq8f8t4Q0Yk6a5+lrxLPULfJN03G87ZndHEojN2Nvd185Et0CzB7FRtAeXQO7MKT+kgeffl1IlU2rce55KHkwvkeBxKDB/t/phNVdpEuAUxzh9Kr1whRUAnpoaAFXdBfpbVnv6W+dmmiHqHlvfFu3JJQiG+JktfiVh1iS1BDg89in+f/1cK+KVbw0najjCf7jii+84fB9/65aELvsHiZgB4Z8A+FtS2ijwx4nCi73T/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5u7ubxhK/n178er2Op86bLm9AatwurKo28Qf/UBcMVI=;
	b=Aw0oj9fpDAmYnQazZTZlAfdK/h5OnhcBo+U8Udlt2KO5IYPZ8f95dgjjh1jOJ3OGKO/r3QpnJECmtQGKRdjwbSaysc3BaGfcCipsiCuQIbCJ2iImkwHzj40NBVj4lxS2/MUaifU6lbPeQDLfSf6zrMsmH/t2XeWEjVDoVcoLskQyymzjDdV0q7mpkaLg2QSBzTCHn6s9cb0R8+W6D6HGePR94/iRGmWvFTWsipNBXPdkvZhZK4qWo6gLl3yvhsRIQurxKLpmErkltPRDxF02VTRKBd9rJr268UV75m+4AbNZlNTxfwLM5RzsUkKWwr4wMO+1fWtKk2XVJA7WP7sdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=topicproducts.com;dmarc=pass action=none
	header.from=topic.nl;dkim=pass header.d=topic.nl;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5u7ubxhK/n178er2Op86bLm9AatwurKo28Qf/UBcMVI=;
	b=ie5VQKuyOhqbgxpPhoJrZ+9ilQMlQuHILcbhpzVItJ3RXgFVSCKoGZ7cAtUhxV4IKJ9MIfHjlnmRU6rloCb4iTuLe74Vdu1/gKchC59y7tGJeowUrFgiKSmRA1jnaUtK7eMwJm2lek6/sxFbBodII1GAeHZHqXjO9kINvA5qobs=
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.174.88) by
	AM7PR04MB7093.eurprd04.prod.outlook.com (52.135.58.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.14; Wed, 31 Jul 2019 05:47:07 +0000
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::b9ee:2fbb:bd36:514c]) by
	AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::b9ee:2fbb:bd36:514c%3]) with mapi id 15.20.2073.012;
	Wed, 31 Jul 2019 05:47:07 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: SDK does not contain pkg-config files
Thread-Index: AQHVR2Njc80gtQeYw0K3PX3gQGd5og==
Date: Wed, 31 Jul 2019 05:47:06 +0000
Message-ID: <6ce08045-fb67-aab4-9ff5-9f8d511eeb78@topic.nl>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
x-clientproxiedby: AM0PR0102CA0043.eurprd01.prod.exchangelabs.com
	(2603:10a6:208::20) To AM7PR04MB6934.eurprd04.prod.outlook.com
	(2603:10a6:20b:10d::24)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2072c7dd-c461-4cac-5715-08d7157a8809
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
	SRVR:AM7PR04MB7093; 
X-MS-TrafficTypeDiagnostic: AM7PR04MB7093:|AM5PR0401MB2579:
X-Microsoft-Antispam-PRVS: <AM5PR0401MB257934A086DAD2E0C2084D9196DF0@AM5PR0401MB2579.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(396003)(39840400004)(136003)(346002)(189003)(199004)(316002)(6512007)(7736002)(81156014)(68736007)(81166006)(186003)(6436002)(6486002)(256004)(66556008)(66476007)(64126003)(476003)(25786009)(486006)(2616005)(58126008)(14444005)(44832011)(65806001)(66066001)(65956001)(31686004)(65826007)(66946007)(52116002)(42882007)(66446008)(6916009)(64756008)(8936002)(26005)(71200400001)(53936002)(14454004)(5660300002)(71190400001)(8676002)(2906002)(36756003)(386003)(508600001)(305945005)(99286004)(3846002)(6116002)(31696002)(6506007)(102836004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR04MB7093;
	H:AM7PR04MB6934.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: MS5JEK35sLTtC8R1eGdXteztuso6fiAMsR22+6l0jK4bD9OvJkJD1OYda4+kW0HeK0Uw5jZG5rJkW6QeobxA6gtMg+Ybh8gnqqiPbUW7Xxn9jVJPbU1YwehgIpxKLWRkhdjyotoK5fayVgIq4RIA0nAZkRukqQf7jU8Ek7GkHNOIq3oRRUUzAX8YLIfseRiE8oJ0BsuJWsGK4RheyOxtpOm1FRekkvY6l66L56ZRGX8jRBPKUotxeybR14s83oE1zbgEXOLncPuA03KashfBy4A9SVC61DGgr7ZTIPb+0BL+TBKUKFq9mEQASxYxPpiyG8e8zufNvlyllO/W+TQ8V4iyfXwDSSpxHObSX+mlWYBrQkAGP8vpFzLhEyU5BXze+5+8IWLAoASnTvi97ieGjlYB8D5fRfOREzhwsiL76mQ=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7093
X-CodeTwo-MessageID: 7c30f2ee-0d40-4ebf-a0ef-a6d30f14a0be.20190731054708@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.166.56.231; IPV:NLI; CTRY:NL; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39840400004)(396003)(136003)(2980300002)(189003)(199004)(36756003)(50466002)(8676002)(6512007)(508600001)(65826007)(5660300002)(70206006)(42882007)(70586007)(65806001)(65956001)(58126008)(23676004)(25786009)(64126003)(106002)(246002)(316002)(7636002)(6486002)(7736002)(31696002)(6916009)(305945005)(14454004)(126002)(2616005)(66066001)(186003)(31686004)(2486003)(6506007)(26005)(7596002)(8936002)(336012)(3846002)(486006)(476003)(386003)(47776003)(2906002)(356004)(6116002)(436003)(14444005)(99286004)(44832011)(102836004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2579;
	H:westeu11-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu11-emailsignatures-cloud.codetwo.com; MX:1;
	A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e907a185-5488-4c16-fd8c-08d7157a8592
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM5PR0401MB2579; 
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: IG7IRSdEQp/yCUHJ6j1Uxra2bWGVH0NM/TNil96+cKyP45sKlci4JtMN8ro1d2DDFKqrzyxIi8WSvzo+ayP9oRO9JZNP4xiZk2XU39lukgpJ5Tu3yTF5RvQzxFc0JWkIM9sef6xEPaVeWvFyWPwFgJiaYk6CYO+GfiVeVLZ/248dNvYxIp/n0ocEpiuGIFRhbq5JdkHblTTgsixmnNiwp2fh1VuUjnLjwK2c/qVUYnAoEAwFhW71T7PTsnrlWuXQlePNg6gXEbpI+wJoQZD5jRP/ME68QDcxYZ11hqQU+nkDK2NUVYn6ee9AnSkReK81tLCO2LUl9GQnbE1GL27DVO5/po+k1t2B83w8aJ5CHyI6Svj/Ml07zU/HdyXm5wH0B4Pi70CsPcquiU/L0mYUDKqmRr5bGI27uWATYZH8QbA=
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 05:47:10.8150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2072c7dd-c461-4cac-5715-08d7157a8809
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.166.56.231];
	Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2579
Subject: SDK does not contain pkg-config files
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
X-List-Received-Date: Wed, 31 Jul 2019 05:47:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBFBFEF6CA56964F9CFA516159434C0D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

SSdtIHRyeWluZyB0byBnZXQgdGhlIFNESyB0byB3b3JrLCBidXQgbm8gc3VjY2VzcyBiZWNhdXNl
IHRoZSBTREsgYXBwYXJlbnRseSANCmRvZXMgbm90IGluc3RhbGwgYW55IHBrZy1jb25maWcgZmls
ZSwgcmVzdWx0aW5nIGluIGF1dG90b29scyBhbmQgY21ha2Ugbm90IA0KYmVpbmcgYWJsZSB0byBm
aW5kIGFueSBsaWJyYXJ5Lg0KDQpCdWlsdCB0aGUgU0RLIHVzaW5nICJiaXRiYWtlIC1jIHBvcHVs
YXRlX3NkayBpbWFnZSINCg0KSW5zdGFsbCB0aGUgcmVzdWx0aW5nIFNESywgYW5kIHNvdXJjZSB0
aGUgc2hlbGwgc2NyaXB0Lg0KDQpCdWlsZGluZyAiaGVsbG93b3JsZCIgd29ya3MuIEJ1aWxkaW5n
IHNvbWV0aGluZyBzbGlnaHRseSBtb3JlIGFkdmFuY2VkIGZhaWxzLCANCmJlY2F1c2UgcGtnLWNv
bmZpZyBpc24ndCB3b3JraW5nOiAicGtnLWNvbmZpZyAtLWxpc3QtYWxsIiBpcyBlbXB0eS4NCg0K
VGhlIGNhdXNlIGlzIHRoYXQgdGhlIHBrZ2NvbmZpZyBmaWxlcyBzaW1wbHkgYXJlbid0IGluIHRo
ZSBzeXNyb290Og0KDQokIGVjaG8gJFBLR19DT05GSUdfUEFUSA0KL2hvbWUvbWlrZS9wL3N5c3Jv
b3RzL2NvcnRleGE5dDJoZi1uZW9uLW9lLWxpbnV4LWdudWVhYmkvdXNyL2xpYi9wa2djb25maWc6
L2hvbWUvbWlrZS9wL3N5c3Jvb3RzL2NvcnRleGE5dDJoZi1uZW9uLW9lLWxpbnV4LWdudWVhYmkv
dXNyL3NoYXJlL3BrZ2NvbmZpZw0KJCBscyAvaG9tZS9taWtlL3Avc3lzcm9vdHMvY29ydGV4YTl0
MmhmLW5lb24tb2UtbGludXgtZ251ZWFiaS91c3IvbGliL3BrZ2NvbmZpZw0KbHM6IGNhbm5vdCBh
Y2Nlc3MgDQonL2hvbWUvbWlrZS9wL3N5c3Jvb3RzL2NvcnRleGE5dDJoZi1uZW9uLW9lLWxpbnV4
LWdudWVhYmkvdXNyL2xpYi9wa2djb25maWcnOiANCk5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkN
CiQgbHMgL2hvbWUvbWlrZS9wL3N5c3Jvb3RzL2NvcnRleGE5dDJoZi1uZW9uLW9lLWxpbnV4LWdu
dWVhYmkvdXNyL3NoYXJlL3BrZ2NvbmZpZw0KbHM6IGNhbm5vdCBhY2Nlc3MgDQonL2hvbWUvbWlr
ZS9wL3N5c3Jvb3RzL2NvcnRleGE5dDJoZi1uZW9uLW9lLWxpbnV4LWdudWVhYmkvdXNyL3NoYXJl
L3BrZ2NvbmZpZyc6IA0KTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KDQo=

