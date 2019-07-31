Return-Path: <mike.looijmans@topicproducts.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40047.outbound.protection.outlook.com [40.107.4.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA977F45E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/hzgsMPAnKS2Q0ulhhZ45alZyV87Xpj3aBkgTynFgNI=;
	b=JfaSkvnpImwcjepqDCXRIv9QrDbOdCTVmpqEXB3b/qemhJpA7jredIgxiuPLDLrtzkk5WER/jKoOTRk9ddR/eJMA+M5bgEhE0Z1rjeKx98t0QrlRFrh2vYz5BEGwy9QfmGBp2e0E1NcejV41ARWHKupVJyt+7Ddmt+ryHaDZ+Ow=
Received: from AM5PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:206:1::34)
	by DB7PR04MB5484.eurprd04.prod.outlook.com (2603:10a6:10:86::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14;
	Wed, 31 Jul 2019 13:22:23 +0000
Received: from HE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::201) by AM5PR04CA0021.outlook.office365.com
	(2603:10a6:206:1::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.10 via
	Frontend Transport; Wed, 31 Jul 2019 13:22:23 +0000
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
	HE1EUR01FT013.mail.protection.outlook.com (10.152.0.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.14 via Frontend Transport; Wed, 31 Jul 2019 13:22:22 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (104.47.9.57) by
	westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Wed, 31 Jul 2019 13:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SmABv3J3BsudGml0cXDE28OixvuW0I/B1yQa9+NRP7MhLpMFNq/Rxi0XPOOgMIweeJvOCI6URtTspqG9LUz/QbVbLZL7Db0QJX+TZe72Ue9B2pwoyzBDzw/UMQB2y+3u8ziMJ76WQUrbl6oauSt996Xc2g25uGeDbN1NdGOelpxeTI46nLh3BaO4I/3Lu12+0Udsab+d5nZTqeudPTsQBKe8R548IC0osJwu5BuOkENgE6eLKxpOjeyAn1Yxj8LshlIffGeJ9OS7G20Jk05hseKrVa54aQ55JtHRnbuYjRjkiym8YTS0taDS8j4r6jA9pGyDpbiWIeeB7Gc7oxRNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/hzgsMPAnKS2Q0ulhhZ45alZyV87Xpj3aBkgTynFgNI=;
	b=S52nmXiG1IEPmzfL/Et6MAm22vr5dzkF7dpOP+1Gk2lOCPDEWOBGydjOcKkyVMJcAnHQFMlWitpaBhSf36HHPJ6IQ2kwbJB3lyi1De50ZS0e8VbDv350nIwCDrVb/6oTZpDiqWOTmDRGt33QHwdtSMzpgtIuncgWbz+oy29ZSchgSNuyAi4e8TtTGaCk7a/cD1d2msPeAPCqNYf8k627uglXRwcT3Lrg438zG5DNIMMPRMUVkMvf85VytqBJ63UBvVrF/ZVq04cg1TWjTD1Hx4fI4ORtDt3BgumG4eHqXpNWRAVof26VcpkEPt5vNVs26cG9wwIUUvqDiEsYQvclCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=topicproducts.com;dmarc=pass action=none
	header.from=topic.nl;dkim=pass header.d=topic.nl;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/hzgsMPAnKS2Q0ulhhZ45alZyV87Xpj3aBkgTynFgNI=;
	b=JfaSkvnpImwcjepqDCXRIv9QrDbOdCTVmpqEXB3b/qemhJpA7jredIgxiuPLDLrtzkk5WER/jKoOTRk9ddR/eJMA+M5bgEhE0Z1rjeKx98t0QrlRFrh2vYz5BEGwy9QfmGBp2e0E1NcejV41ARWHKupVJyt+7Ddmt+ryHaDZ+Ow=
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.174.88) by
	AM7PR04MB7046.eurprd04.prod.outlook.com (52.135.56.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.14; Wed, 31 Jul 2019 13:22:18 +0000
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::b9ee:2fbb:bd36:514c]) by
	AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::b9ee:2fbb:bd36:514c%3]) with mapi id 15.20.2073.012;
	Wed, 31 Jul 2019 13:22:17 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] SDK does not contain pkg-config files
Thread-Index: AQHVR2Njc80gtQeYw0K3PX3gQGd5oqbkqoaAgAAMpAA=
Date: Wed, 31 Jul 2019 13:22:17 +0000
Message-ID: <63da8199-4e73-70e2-bcea-60f7e53a2e16@topic.nl>
References: <6ce08045-fb67-aab4-9ff5-9f8d511eeb78@topic.nl>
	<99ef1d9c-c642-92b3-33b0-aafc38c8e62b@intel.com>
In-Reply-To: <99ef1d9c-c642-92b3-33b0-aafc38c8e62b@intel.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
x-clientproxiedby: AM0PR01CA0024.eurprd01.prod.exchangelabs.com
	(2603:10a6:208:69::37) To AM7PR04MB6934.eurprd04.prod.outlook.com
	(2603:10a6:20b:10d::24)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d0ba054d-18ab-47f2-5696-08d715ba1f30
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM7PR04MB7046; 
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:|DB7PR04MB5484:
X-Microsoft-Antispam-PRVS: <DB7PR04MB54844FDCD7A6855932EFE71C96DF0@DB7PR04MB5484.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 011579F31F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(366004)(136003)(346002)(376002)(39840400004)(396003)(189003)(199004)(229853002)(58126008)(71190400001)(66446008)(65956001)(316002)(8676002)(256004)(2501003)(66946007)(71200400001)(53546011)(68736007)(31686004)(5660300002)(26005)(76176011)(7736002)(25786009)(81156014)(110136005)(64126003)(65806001)(66476007)(99286004)(66066001)(52116002)(6506007)(386003)(66556008)(8936002)(102836004)(64756008)(14454004)(446003)(53936002)(2616005)(2906002)(14444005)(36756003)(186003)(6246003)(81166006)(31696002)(508600001)(65826007)(476003)(305945005)(6116002)(3846002)(11346002)(6436002)(6512007)(486006)(6486002)(42882007)(44832011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR04MB7046;
	H:AM7PR04MB6934.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: IKoueo/gnPq3Uc1N33vyjrWzZ/kK53+KljKDcBpjRlLUx//YH/CPMNqCT40ppbHqSfiV13UkUSAunON3lBfhlR/qNzZMUA83RhOCTZ3XptYCqn73oVU1EbZDM9O5UiMH/6MnKePyU1Ijtdu5xOxgWpy7Q1400vAlOwAnsw/SunUxxvuL3/E9cbNHkKdOq2oVCm68B/tMzA/uQ3QztsITEW3MZEt0YW2HiYOFGJTXbL3TZ+1d3uwARxPHIfJ+GW6Qou7vpN7ZoDMh000+Xv2TI4QeW78edql7Ieyz8w4Y6idUjGnFfVH3pp021tFCZdokF/ygTJEah188UAoR/DbCw0K9DWniSAH8eUwMgmP4c5FAhC3vN7667COWEqNI9A6iGooNbOWVRQ8xAXlsIb0oEWZUSZn4Te1HpluV00A+2z4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
X-CodeTwo-MessageID: e8d232b9-7b3e-4726-926f-a9b5019b860a.20190731132220@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.166.56.231; IPV:NLI; CTRY:NL; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(136003)(39840400004)(376002)(2980300002)(189003)(199004)(7596002)(316002)(44832011)(2501003)(186003)(50466002)(486006)(110136005)(508600001)(436003)(126002)(356004)(70586007)(65806001)(8936002)(26005)(47776003)(6506007)(386003)(53546011)(66066001)(65956001)(102836004)(99286004)(65826007)(36756003)(70206006)(6486002)(336012)(42882007)(2486003)(64126003)(229853002)(5660300002)(2616005)(2906002)(31696002)(106002)(305945005)(6116002)(6246003)(3846002)(7636002)(76176011)(246002)(14444005)(6512007)(8676002)(31686004)(7736002)(446003)(23676004)(25786009)(58126008)(14454004)(476003)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5484;
	H:westeu11-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu11-emailsignatures-cloud.codetwo.com; MX:1;
	A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ca29e65e-423f-4e42-38a9-08d715ba1c25
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
	SRVR:DB7PR04MB5484; 
X-Forefront-PRVS: 011579F31F
X-Microsoft-Antispam-Message-Info: v4uvn2gVesckhC2/ldc4uNX6B10rTvDTTeSwivaAcY9CWkX+/u0Rqgv3lBkPOV7IaS+eOGuOymcslKRMFV2nD65xdOPchlEcYfrunsnLs3KquwvS5rsQurQ2E/9k35Au5r7G4o/lmME/F5IusEqti2hbA7kU03+70Vr/Dd/kqHI5moiZAoqzGfhegRBRmx/sAztbTWjkHlOIhicJW3hZgaI9/9IJA68w2h2QKDWE5vGaLpwMI2Nmviow+yRQoUgsVJpChRmL+q5M4jHudKpTeLRaXySagEwi49gQEXI2jqWmRfdA+LjVQ07lpj83wN9hsvhKXMAgkKZ4LjBVGi/DQgnCR8GBpOFJSZh21hFW+HpRNX3t8zJXDuj6svWYAzZRDZTh1tcOfiT+JMgCf/DsDpH1CQIhP+3ifaGraMdY1iU=
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 13:22:22.4884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ba054d-18ab-47f2-5696-08d715ba1f30
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.166.56.231];
	Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5484
Subject: Re: SDK does not contain pkg-config files
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
X-List-Received-Date: Wed, 31 Jul 2019 13:22:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC06B20E992ADB42B5B6D36F775685B5@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMzEtMDctMTkgMTQ6MzcsIFJvc3MgQnVydG9uIHdyb3RlOg0KPiBPbiAzMS8wNy8yMDE5IDA2
OjQ3LCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4+IEknbSB0cnlpbmcgdG8gZ2V0IHRoZSBTREsg
dG8gd29yaywgYnV0IG5vIHN1Y2Nlc3MgYmVjYXVzZSB0aGUgU0RLIGFwcGFyZW50bHkNCj4+IGRv
ZXMgbm90IGluc3RhbGwgYW55IHBrZy1jb25maWcgZmlsZSwgcmVzdWx0aW5nIGluIGF1dG90b29s
cyBhbmQgY21ha2Ugbm90DQo+PiBiZWluZyBhYmxlIHRvIGZpbmQgYW55IGxpYnJhcnkuDQo+Pg0K
Pj4gQnVpbHQgdGhlIFNESyB1c2luZyAiYml0YmFrZSAtYyBwb3B1bGF0ZV9zZGsgaW1hZ2UiDQo+
Pg0KPj4gSW5zdGFsbCB0aGUgcmVzdWx0aW5nIFNESywgYW5kIHNvdXJjZSB0aGUgc2hlbGwgc2Ny
aXB0Lg0KPj4NCj4+IEJ1aWxkaW5nICJoZWxsb3dvcmxkIiB3b3Jrcy4gQnVpbGRpbmcgc29tZXRo
aW5nIHNsaWdodGx5IG1vcmUgYWR2YW5jZWQgZmFpbHMsDQo+PiBiZWNhdXNlIHBrZy1jb25maWcg
aXNuJ3Qgd29ya2luZzogInBrZy1jb25maWcgLS1saXN0LWFsbCIgaXMgZW1wdHkuDQo+Pg0KPj4g
VGhlIGNhdXNlIGlzIHRoYXQgdGhlIHBrZ2NvbmZpZyBmaWxlcyBzaW1wbHkgYXJlbid0IGluIHRo
ZSBzeXNyb290Og0KPj4NCj4+ICQgZWNobyAkUEtHX0NPTkZJR19QQVRIDQo+PiAvaG9tZS9taWtl
L3Avc3lzcm9vdHMvY29ydGV4YTl0MmhmLW5lb24tb2UtbGludXgtZ251ZWFiaS91c3IvbGliL3Br
Z2NvbmZpZzovaG9tZS9taWtlL3Avc3lzcm9vdHMvY29ydGV4YTl0MmhmLW5lb24tb2UtbGludXgt
Z251ZWFiaS91c3Ivc2hhcmUvcGtnY29uZmlnIA0KPj4NCj4+ICQgbHMgL2hvbWUvbWlrZS9wL3N5
c3Jvb3RzL2NvcnRleGE5dDJoZi1uZW9uLW9lLWxpbnV4LWdudWVhYmkvdXNyL2xpYi9wa2djb25m
aWcNCj4+IGxzOiBjYW5ub3QgYWNjZXNzDQo+PiAnL2hvbWUvbWlrZS9wL3N5c3Jvb3RzL2NvcnRl
eGE5dDJoZi1uZW9uLW9lLWxpbnV4LWdudWVhYmkvdXNyL2xpYi9wa2djb25maWcnOg0KPj4gTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPj4gJCBscyANCj4+IC9ob21lL21pa2UvcC9zeXNyb290
cy9jb3J0ZXhhOXQyaGYtbmVvbi1vZS1saW51eC1nbnVlYWJpL3Vzci9zaGFyZS9wa2djb25maWcN
Cj4+IGxzOiBjYW5ub3QgYWNjZXNzDQo+PiAnL2hvbWUvbWlrZS9wL3N5c3Jvb3RzL2NvcnRleGE5
dDJoZi1uZW9uLW9lLWxpbnV4LWdudWVhYmkvdXNyL3NoYXJlL3BrZ2NvbmZpZyc6DQo+PiBObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IA0KPiBMb29rcyBsaWtlIHNvbWV0aGluZyB3ZW50IHdy
b25nLg0KPiANCj4gTXkgaG9zdCBoYXMgbWluaW1hbCAtZGV2IHBhY2thZ2VzIGluc3RhbGxlZDoN
Cj4gDQo+ICQgZHBrZyAtbCBcKi1kZXZ8Z3JlcCBpaQ0KPiBpacKgIGRwa2ctZGV2wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxLjE5LjfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFs
bMKgwqDCoMKgwqDCoMKgwqDCoCBEZWJpYW4gcGFja2FnZSANCj4gZGV2ZWxvcG1lbnQgdG9vbHMN
Cj4gaWnCoCBsaWJjNi1kZXY6YW1kNjTCoMKgwqDCoMKgwqDCoMKgwqDCoCAyLjI4LTEwwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYW1kNjTCoMKgwqDCoMKgwqDCoCBHTlUgQyBMaWJyYXJ5OiANCj4gRGV2
ZWxvcG1lbnQgTGlicmFyaWVzIGFuZCBIZWFkZXIgRmlsZXMNCj4gaWnCoCBsaWJnY2MtOC1kZXY6
YW1kNjTCoMKgwqDCoMKgwqDCoCA4LjMuMC02wqDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kNjTCoMKg
wqDCoMKgwqDCoCBHQ0Mgc3VwcG9ydCANCj4gbGlicmFyeSAoZGV2ZWxvcG1lbnQgZmlsZXMpDQo+
IGlpwqAgbGlic3RkYysrLTgtZGV2OmFtZDY0wqDCoMKgwqAgOC4zLjAtNsKgwqDCoMKgwqDCoMKg
wqDCoMKgIGFtZDY0wqDCoMKgwqDCoMKgwqAgR05VIFN0YW5kYXJkIEMrKyANCj4gTGlicmFyeSB2
MyAoZGV2ZWxvcG1lbnQgZmlsZXMpDQo+IGlpwqAgbGludXgtbGliYy1kZXY6YW1kNjTCoMKgwqDC
oMKgIDQuMTkuMzctNStkZWIxMHUxIGFtZDY0wqDCoMKgwqDCoMKgwqAgTGludXggc3VwcG9ydCAN
Cj4gaGVhZGVycyBmb3IgdXNlcnNwYWNlIGRldmVsb3BtZW50DQo+IGlpwqAgbWFucGFnZXMtZGV2
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNC4xNi0ywqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
bGzCoMKgwqDCoMKgwqDCoMKgwqAgTWFudWFsIHBhZ2VzIA0KPiBhYm91dCB1c2luZyBHTlUvTGlu
dXggZm9yIGRldmVsb3BtZW50DQo+IA0KPiBCdXQgaW5zaWRlIGEgY29yZS1pbWFnZS1taW5pbWFs
IFNESzoNCj4gDQo+ICQgbHMgc3lzcm9vdHMvY29yZWk3LTY0LXBva3ktbGludXgvdXNyL2xpYi9w
a2djb25maWcvIHwgaGVhZA0KPiBibGtpZC5wYw0KPiBjaGVjay5wYw0KPiBjb21fZXJyLnBjDQo+
IGRidXMtMS5wYw0KPiBkYnVzLWdsaWItMS5wYw0KPiBlMnAucGMNCj4gZXhwYXQucGMNCj4gZXh0
MmZzLnBjDQo+IGZkaXNrLnBjDQo+IGZvcm0ucGMNCj4gDQo+ICQgcGtnLWNvbmZpZ8KgIC0tbGlz
dC1hbGwgfCBoZWFkDQo+IHpsaWLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHps
aWIgLSB6bGliIGNvbXByZXNzaW9uIGxpYnJhcnkNCj4gZ2lvLXVuaXgtMi4wwqDCoMKgwqDCoMKg
wqDCoMKgIEdJTyB1bml4IHNwZWNpZmljIEFQSXMgLSB1bml4IHNwZWNpZmljIGhlYWRlcnMgZm9y
IGdsaWIgDQo+IEkvTyBsaWJyYXJ5DQo+IGxpYmR3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGliZHcgLSBlbGZ1dGlscyBsaWJyYXJ5IGZvciBEV0FSRiBkYXRhIGFuZCBFTEYgZmls
ZSBvciANCj4gcHJvY2VzcyBpbnNwZWN0aW9uDQo+IGxpYmttb2TCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxpYmttb2QgLSBMaWJyYXJ5IHRvIGRlYWwgd2l0aCBrZXJuZWwgbW9kdWxlcw0K
PiBhcHBsZXdtcHJvdG/CoMKgwqDCoMKgwqDCoMKgwqAgQXBwbGVXTVByb3RvIC0gQXBwbGVXTSBl
eHRlbnNpb24gaGVhZGVycw0KPiBnaW8tMi4wwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBH
SU8gLSBnbGliIEkvTyBsaWJyYXJ5DQo+IGRidXMtZ2xpYi0xwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGJ1cy1nbGliIC0gR0xpYiBpbnRlZ3JhdGlvbiBmb3IgdGhlIGZyZWUgZGVza3RvcCANCj4gbWVz
c2FnZSBidXMNCj4geGY4NmRnYXByb3RvwqDCoMKgwqDCoMKgwqDCoMKgIFhGODZER0FQcm90byAt
IFhGODZER0EgZXh0ZW5zaW9uIGhlYWRlcnMNCj4gcnBtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFJQTSAtIFJQTSBQYWNrYWdlIE1hbmFnZXINCj4geGNiLWNvbXBvc2l0ZcKg
wqDCoMKgwqDCoMKgwqAgWENCIENvbXBvc2l0ZSAtIFhDQiBDb21wb3NpdGUgRXh0ZW5zaW9uDQo+
IA0KPiBTbywgd29ya3MgZm9yIG1lPw0KDQpXZWxsLCB0aGF0J3MgYXQgbGVhc3QgZ29vZCB0byBr
bm93Lg0KDQpJJ20gb24gdGhlICJ0aHVkIiBicmFuY2ggY3VycmVudGx5LCBzbyBJIGhvcGUgdGhp
cyBpc24ndCBzb21ldGhpbmcgdGhhdCBnb3QgDQpmaXhlZCBvbmx5IHJlY2VudGx5Lg0KDQpJJ2xs
IHRyeSBzb21lIHNpbXBsZSBpbWFnZXMgZmlyc3QuIEkgZ2F0aGVyIHRoZXJlJ3Mgbm8gcGFydGlj
dWxhciBtYWdpYyANCmluY2FudGF0aW9uIEkgbmVlZCB0byBwdXQgaW50byBteSBpbWFnZSByZWNp
cGUgdG8gZ2V0IHRoZSBwa2ctY29uZmlnIGZpbGVzIA0KaW50byB0aGUgU0RLIHN5c3Jvb3Q/DQoN
Ci0tDQpNLg0K

