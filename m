Return-Path: <mike.looijmans@topicproducts.com>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60055.outbound.protection.outlook.com [40.107.6.55])
	by mail.openembedded.org (Postfix) with ESMTP id 64BFA7FBB3
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DAIuf8YxBguG4qieMLxgWg7oSbdRnEws+FpZnvys7LI=;
	b=teF/jxCGiF0qeETGuyt9gJ/vFJf6Y5/8Hld3CFDculpv7YMJ9lgwS03u81Q6ryV85aXHv61vu3+suQf7nF1Xk97YLNwTkRtG1QXkmmqkdEbbzfRm3a8OKHK13CDM4iQwMJj7elfbWwdfsKge+/Ha8FjkhcyAxn9yGquC0Pq84RY=
Received: from AM6PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:20b:92::28)
	by DB7PR04MB5545.eurprd04.prod.outlook.com (2603:10a6:10:37::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20;
	Mon, 11 Nov 2019 14:49:43 +0000
Received: from HE1EUR01FT043.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::208) by AM6PR04CA0015.outlook.office365.com
	(2603:10a6:20b:92::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.22 via
	Frontend Transport; Mon, 11 Nov 2019 14:49:42 +0000
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
	HE1EUR01FT043.mail.protection.outlook.com (10.152.0.207) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2430.22 via Frontend Transport; Mon, 11 Nov 2019 14:49:42 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (104.47.10.55) by
	westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Mon, 11 Nov 2019 14:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KaWX74uNs8FojuPAxZ1UmZht5kyHlXP0erFJUIJhxPERzqZjkfTLor0gulti8wYcMDhwfyBUO6QhtjRcrtA634WRKQ47gEHOm9g+IMAf5Cy9MPaA26SzfPrS3UCGa8NHB/60NK46QmQEGQzhu/IU1Ut6oxxEdAErFBWEwBGO/qULi95+IFQnz2vUtob5BTomk3UNyV7xoxZn+GMmYDlVDqza1iSYp3wx/dFuAxSwACsY33G4ncE4iU/cebpipwbtNsJ85oZjZh0FFCCbdeVkJD7M71FNG6+ipdYI9ZzPb29epdvjZ72sAZu8WjspUF4IszuRikAAa0EEYVIhJ3aRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DAIuf8YxBguG4qieMLxgWg7oSbdRnEws+FpZnvys7LI=;
	b=OxiEh5nmKtqvlHWU3cxOzpdG9g0omW7RLmaFkqjR8vDVS7H9EOiphXY13xTcpQEx9NC0OBoo4xx00DbwqcG5WIJpckNsJc3622KZaX8f9pZDEE4HsO3ztZD83rF9Eq2YmDdAyEzOWPn49LXM20+/FDT7vr42RHe04YpyzyU3IaMImqu38ZUOYDZmQqa2CRPeGueHMy0Rsr//kZdB6v2rSnD/GvggEo+l9RBiqL+PzsTS5CL/HDB0FQJPrMqNXZsnwQWCOHF7i4QIe+5QF0dqEHp4rZhptgn1s8QLsPbee2sNtehpw8wOL/Vy/JzpWwzchciW5SuwSVH4HVA/r5OQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=topicproducts.com;
	dmarc=pass action=none header.from=topic.nl; 
	dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DAIuf8YxBguG4qieMLxgWg7oSbdRnEws+FpZnvys7LI=;
	b=teF/jxCGiF0qeETGuyt9gJ/vFJf6Y5/8Hld3CFDculpv7YMJ9lgwS03u81Q6ryV85aXHv61vu3+suQf7nF1Xk97YLNwTkRtG1QXkmmqkdEbbzfRm3a8OKHK13CDM4iQwMJj7elfbWwdfsKge+/Ha8FjkhcyAxn9yGquC0Pq84RY=
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.174.88) by
	AM7PR04MB7000.eurprd04.prod.outlook.com (10.141.172.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.20; Mon, 11 Nov 2019 14:49:39 +0000
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::81d1:90db:da68:3643]) by
	AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::81d1:90db:da68:3643%6]) with mapi id 15.20.2430.023;
	Mon, 11 Nov 2019 14:49:39 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Getting "File name too long" errors in warrior for sstate-cache
	names
Thread-Index: AQHVmJ8+sq/McOBGvUC4wJmWTlBW8Q==
Date: Mon, 11 Nov 2019 14:49:39 +0000
Message-ID: <25f98f5a-1d22-918b-29d5-6a381844631a@topic.nl>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
x-clientproxiedby: AM0PR06CA0058.eurprd06.prod.outlook.com
	(2603:10a6:208:aa::35) To AM7PR04MB6934.eurprd04.prod.outlook.com
	(2603:10a6:20b:10d::24)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 826c34b1-b602-4525-83d8-08d766b662ea
X-MS-TrafficTypeDiagnostic: AM7PR04MB7000:|DB7PR04MB5545:
X-Microsoft-Antispam-PRVS: <DB7PR04MB5545C64C0D446BC9368DC01E96740@DB7PR04MB5545.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 0218A015FA
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(39840400004)(366004)(396003)(376002)(136003)(346002)(199004)(189003)(66946007)(66446008)(66556008)(66476007)(476003)(99286004)(6916009)(52116002)(42882007)(186003)(64756008)(305945005)(6506007)(386003)(71190400001)(71200400001)(7736002)(31696002)(44832011)(486006)(5660300002)(102836004)(65806001)(65956001)(66066001)(256004)(508600001)(36756003)(58126008)(316002)(3846002)(6116002)(25786009)(14454004)(2501003)(6512007)(2351001)(5640700003)(2616005)(4744005)(31686004)(6486002)(81166006)(81156014)(2906002)(8676002)(8936002)(26005)(6436002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR04MB7000;
	H:AM7PR04MB6934.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qHJpllA+s0z4pkITsRcJ4ovOdBcXbP4DXh+vweBuX5nSG2lSrPzYOiDCoNflph4L00I2hPUJ/NbpSgM3ldIb9mE3v2WJinXxyuX6yNYiL5xYz1CSQ2jm+ohDz7Wcr/QS/D0C92ncjjSO83k10BbZSXD36jCBtxvRgjatPDfuEczzqqUJjYG9Jl7Jjg0JSmvHb9jgJZE4H9ZhVh7fVDfsUStGgw//dcLP+M0gowR3flzhDhcI1PWCSd9ql9dP2ZHzPSP5fmj94SY+C2nxK+EZ31m6htVqjzXbmGbJQheChqyX27c2Cqjr22HWlsK4jGiDlwOAX8W2nnzOAcL99/JDo2TFwreFFBUJYbgQO9gmuBko6eQPNJEfYXdAYdUnfZKSXU6+i5X4+dxygf+xA2hMjAlsU8GBGoqLrKkgLRwug+Od3XY/Bpjk9Rh9ZzadVTsp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7000
X-CodeTwo-MessageID: 329027dc-bdbd-4996-b305-75f574aa32e0.20191111144941@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT043.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.166.56.231; IPV:NLI; CTRY:NL; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(136003)(39840400004)(346002)(396003)(199004)(189003)(6486002)(42882007)(6512007)(23676004)(6916009)(36756003)(186003)(102836004)(106002)(6506007)(44832011)(99286004)(5640700003)(25786009)(386003)(7636002)(7736002)(436003)(26005)(508600001)(336012)(7596002)(486006)(305945005)(476003)(316002)(2486003)(31696002)(58126008)(126002)(2616005)(14454004)(3846002)(356004)(4744005)(8936002)(2906002)(2351001)(5660300002)(47776003)(2501003)(65806001)(65956001)(66066001)(8676002)(246002)(70206006)(31686004)(50466002)(70586007)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5545;
	H:westeu11-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu11-emailsignatures-cloud.codetwo.com; A:1;
	MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf5623f9-b34a-4a4c-24f5-08d766b66105
X-Forefront-PRVS: 0218A015FA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJSCX+o2T+Btv2i2+jEm9vVuH+naDaDCOZEj/do1wYRkKDKtyU/uo3PLXhFY/wPwjmRdoN1M3MQPeKSKN1magqcIASZv6AGFlw5yqeB19gCRGKdetS0nc3EfqpYg7x10CO1bXxEd7rlSi5Hv3dVE1AbXfjE8ppmXuPDnFR8pWYJVfWFv+n/NwZ57ay/uVqpSmY/StR3SX7IGdQZWxF+xND89A2styA2CEf55/7DwXhnkSMsOL1EBrYsod5y1wKKOsUbtsIH7IMjotEZuVujymKYfVxLwteSoASteiozPLGx6tOuZ9e4eTBD6B/ZnaPUGrDsZ+VF8oDgPgontpPFUJNK5pV7qQnSzM4ORiqlJIWLU3uLcSjUFi8Ic7/5Ge+shxNmrd+0evkNcC2I0XBS7HemUchPYvhphHD2Znt01CD6Pm82bGV+Llrit1YMyAs5c
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2019 14:49:42.5241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 826c34b1-b602-4525-83d8-08d766b662ea
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.166.56.231];
	Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5545
Subject: Getting "File name too long" errors in warrior for sstate-cache names
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
X-List-Received-Date: Mon, 11 Nov 2019 14:49:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC81D0FC449EE3409F7FFDF9CF1EB451@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

U3RhcnRpbmcgd2l0aCB3YXJyaW9yIGJ1aWxkLCBJJ20gZ2V0dGluZyBidWlsZCBmYWlscyBkdWUg
dG8gIkZpbGUgbmFtZSB0b28gDQpsb25nIiBpbiBzc3RhdGUtY2FjaGUgZmlsZW5hbWVzLiBUaGlz
IGlzIHByb2JhYmx5IHJlbGF0ZWQgdG8gaGF2aW5nIGxvbmcgbmFtZXMgDQpmb3IgbWFjaGluZXMs
IGJ1dCB0aGlzIGRpZCBub3QgaGFwcGVuIGluIHByZXZpb3VzIHJlbGVhc2VzLiBGb3IgZXhhbXBs
ZToNCg0KT1NFcnJvcjogW0Vycm5vIDM2XSBGaWxlIG5hbWUgdG9vIGxvbmc6IA0KJy9tbnQvLi4u
L3NzdGF0ZS1jYWNoZS81Mi9zaWd0YXNrLjl1X3I0eXYyJyAtPiANCicvbW50Ly4uLi9zc3RhdGUt
Y2FjaGUvNTIvc3N0YXRlOnUtYm9vdC14bG54OnRvcGljX21pYW1pbGl0ZV9mbG9yaWRhX3Rlc3Rf
eGM3ejAxMC1vZS1saW51eC1nbnVlYWJpOnYyMDE5LjAxLXhpbGlueC12MjAxOS4xK2dpdEFVVE9J
TkMrZDg5NWFjNWU5NDpyMDp0b3BpY19taWFtaWxpdGVfZmxvcmlkYV90ZXN0X3hjN3owMTA6Mzo1
MmNiMjljZWYzOTIyZGE1M2E3NTJmMzhlOWJiZmRlZjg3OGFmNTE4MTNkYzA5NWQ5YzE0NTFkNTcy
ODQ0ZjkzX3ByZXBhcmVfcmVjaXBlX3N5c3Jvb3QudGd6LnNpZ2luZm8nDQoNCg0KV2hhdCBjYW4g
SSBkbyBhYm91dCB0aGlzPyBUaGVyZSdzIG5vIGhpbnQgaW4gdGhlIGVycm9yIG1lc3NhZ2UgYW5k
IHNlYXJjaGluZyANCmZvciB0aGUgbWVzc2FnZSB0ZXh0IGRvZXNuJ3Qgc2hvdyBtdWNoIGV4Y2Vw
dCBpc3N1ZXMgd2l0aCBjcnlwdG8gZmlsZXN5c3RlbXMsIA0Kd2hpY2ggZG9lc24ndCBhcHBseS4g
VGhlIGZpbGVzeXN0ZW0gaXMganVzdCBwbGFpbiBleHQ0Lg0K

