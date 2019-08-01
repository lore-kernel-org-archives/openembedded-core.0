Return-Path: <mike.looijmans@topicproducts.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40076.outbound.protection.outlook.com [40.107.4.76])
	by mail.openembedded.org (Postfix) with ESMTP id E254D7F57D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/WxQBoClJxH8czqsH9WqK5feWQc/Wm4twI4v2OnMrDw=;
	b=NDsqNriApPHkw5n6M3/7XkxnGojNEgMPKNNpa4fqectkoCkcJnat3QQ5ZFFL9OCvRnZ+EwE/KhKImi6oXpqIJQlJZdPQB5Gnj1y8BQ16dMZUijPC8WMzMCwJtGeiQ8W72IqltVzE1tCsqcadxBxjJ5IhDO+nDLCPyZs1ju/BgqM=
Received: from AM3PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:207::23) by
	VI1PR04MB5485.eurprd04.prod.outlook.com (2603:10a6:803:d0::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.15; Thu, 1 Aug 2019 11:17:07 +0000
Received: from HE1EUR01FT042.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::206) by AM3PR04CA0139.outlook.office365.com
	(2603:10a6:207::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via
	Frontend Transport; Thu, 1 Aug 2019 11:17:06 +0000
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
	HE1EUR01FT042.mail.protection.outlook.com (10.152.0.228) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 11:17:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.52) by
	westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Thu, 01 Aug 2019 11:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=S2BvZUa6ujUFE+XAH0/E70j2pyZ7v4HswP+vq0BL0qHARSPZy1kYiBxt2dcTf9oSm+nxVs0eqjzFL9QA6gDTY6aidBAsfO0FtdBGCmFg40DpUdtvXey0GqaKVfjZqms7Zv9MOLq5nUZZlyJ5NsaKdPHlpx76apstxsUQrGVL40TW98zchYLClib7vM1NpgvJbfP7sPrppjy9GiuSxb8OvTau9NvbDejGjJdOR9D6rGZAtjXZx8Bh0hpp0KrdKB0h71eQUU9n4wflqrsJF0IvSFq9TTvA7diV0tjmAyI3l9/e1ZwU+D5mEURO2SmA6P+EGM9HH2KiaAxM08fYBxINfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/WxQBoClJxH8czqsH9WqK5feWQc/Wm4twI4v2OnMrDw=;
	b=gMhpxIYiEbyGxjAKoErzoBtEak5a8RnBBVSfnbzSJQekgRsNqj529AINeHlDsHxudue9jqQCDlmHAh6Udd6EkMmN75GoY4E/GQJQGpffNlI1+Ey41iCmpRrBCBbQF7VvJwZg2pTI5TM2UGpO04QyA6e58a89UdqlYFjCQTCKiC7duzfB4XsTvFPZtkeRX84dzPpgS4Mz1UHtlP8GQWVy0DhS8DtA5WZGutEGmsxjVKF/y2dCTfap3CyhBRUL4Zw23eXCbTxpGcHEJ0cZP0JPsLUB7oVUcyk635rSh+6bpa8iSDbB/vvdBsPHcO/IFb3Ww6XZTNPiX1daAtkP2uXtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=topicproducts.com;dmarc=pass action=none
	header.from=topic.nl;dkim=pass header.d=topic.nl;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/WxQBoClJxH8czqsH9WqK5feWQc/Wm4twI4v2OnMrDw=;
	b=NDsqNriApPHkw5n6M3/7XkxnGojNEgMPKNNpa4fqectkoCkcJnat3QQ5ZFFL9OCvRnZ+EwE/KhKImi6oXpqIJQlJZdPQB5Gnj1y8BQ16dMZUijPC8WMzMCwJtGeiQ8W72IqltVzE1tCsqcadxBxjJ5IhDO+nDLCPyZs1ju/BgqM=
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.174.88) by
	AM7SPR01MB0002.eurprd04.prod.outlook.com (10.141.171.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.14; Thu, 1 Aug 2019 11:17:00 +0000
Received: from AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::b9ee:2fbb:bd36:514c]) by
	AM7PR04MB6934.eurprd04.prod.outlook.com
	([fe80::b9ee:2fbb:bd36:514c%3]) with mapi id 15.20.2073.018;
	Thu, 1 Aug 2019 11:17:00 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] SDK does not contain pkg-config files
Thread-Index: AQHVR2Njc80gtQeYw0K3PX3gQGd5oqbkqoaAgAAMpACAAAIagIABbTqA
Date: Thu, 1 Aug 2019 11:17:00 +0000
Message-ID: <b2880fb2-75a4-825a-6bbf-8a07df8cce55@topic.nl>
References: <6ce08045-fb67-aab4-9ff5-9f8d511eeb78@topic.nl>
	<99ef1d9c-c642-92b3-33b0-aafc38c8e62b@intel.com>
	<63da8199-4e73-70e2-bcea-60f7e53a2e16@topic.nl>
	<487ea47b-1db4-8c95-c0ad-661a56ccc07a@intel.com>
In-Reply-To: <487ea47b-1db4-8c95-c0ad-661a56ccc07a@intel.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
x-clientproxiedby: AM4PR08CA0045.eurprd08.prod.outlook.com
	(2603:10a6:205:2::16) To AM7PR04MB6934.eurprd04.prod.outlook.com
	(2603:10a6:20b:10d::24)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a50b6e4b-f8e4-42e7-a91a-08d71671c996
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM7SPR01MB0002; 
X-MS-TrafficTypeDiagnostic: AM7SPR01MB0002:|VI1PR04MB5485:
X-Microsoft-Antispam-PRVS: <VI1PR04MB548548B469627676E5B37E6496DE0@VI1PR04MB5485.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01165471DB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(136003)(346002)(39840400004)(376002)(366004)(396003)(54094003)(199004)(189003)(6486002)(53546011)(14444005)(3846002)(2906002)(11346002)(2616005)(2501003)(31686004)(6116002)(6506007)(256004)(446003)(65806001)(65826007)(110136005)(186003)(58126008)(64126003)(6246003)(476003)(65956001)(66066001)(26005)(386003)(316002)(486006)(68736007)(305945005)(229853002)(102836004)(31696002)(7736002)(8936002)(25786009)(6512007)(81156014)(76176011)(81166006)(52116002)(36756003)(6436002)(66946007)(53936002)(71190400001)(71200400001)(99286004)(44832011)(508600001)(42882007)(5660300002)(66556008)(66476007)(64756008)(14454004)(66446008)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM7SPR01MB0002;
	H:AM7PR04MB6934.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 6GM7WfgMy1yVUJVj73e1M6Sw7rp6AlaUUtCCkZYzbFiUmG3D9e7zv9tIrOxBieNrZ7PzOGDNE4MZIi2mFfonoaKh1p6vq2KaCOYpJtinDWVHv/H8PqGtm1gbEZ59bnZwm/GOdm+tjcZ6bdTFjmkWJLaQAJBPnHUFEHXmuDGmC0yZLpb/GSnU/9SJyIZqeg/pbV3ZQwV1YNzgt07/q/7eb8ksmiGDsB/RZfUptHMt0UUQlGXn9EtF4LYKTjX9T4KetN2D2Pj9dgY2NrrV0hV2EYFg8kgJnKGfWQq5fx+8p6Xq+Rgg/BVmi3RpBWRO8mrcs/yam83tqXJUsJnnA6VD7hywHId/dyNbxUsJAglp1qDxBguA3f+DYUvmfck4Dz2puGfLNJwb2WVy33YukW6yw6sFUXZL+FU/PAljcfg80zk=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7SPR01MB0002
X-CodeTwo-MessageID: 6ca43407-5d16-46dd-abe1-f32b9bcc4b8b.20190801111703@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT042.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.166.56.231; IPV:NLI; CTRY:NL; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(136003)(39840400004)(396003)(2980300002)(54094003)(199004)(189003)(2906002)(356004)(14454004)(6486002)(229853002)(6512007)(31686004)(50466002)(186003)(2501003)(102836004)(26005)(6246003)(53546011)(6506007)(386003)(99286004)(42882007)(76176011)(14444005)(2486003)(23676004)(305945005)(7736002)(476003)(7636002)(126002)(7596002)(3846002)(6116002)(508600001)(336012)(65826007)(64126003)(8936002)(44832011)(25786009)(446003)(11346002)(436003)(246002)(486006)(2616005)(58126008)(36756003)(106002)(70586007)(31696002)(8676002)(47776003)(66066001)(70206006)(65956001)(110136005)(316002)(65806001)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5485;
	H:westeu11-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu11-emailsignatures-cloud.codetwo.com; A:1;
	MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d4c80198-b680-4041-0694-08d71671c5f5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:VI1PR04MB5485; 
X-Forefront-PRVS: 01165471DB
X-Microsoft-Antispam-Message-Info: r7LpGrcDXj+DbFND/HeI44Eqh4ubg+U8XXihdPNDK4uLT7pb6mFuNTDMbjYWkJ+A0S5TIjW0UeumetZo3fXShoGXN5O17aR61o30krGkJ5rDGPxMyC02lMKq/J6wzlFI5UYIxRx0oboPJgevLH1fqryxR3TshAasdkne9NPm14rT4mUSJyUEKcmSNbVYU8ORnAGClyJ2zw7PVETnLD+ZCeCYS8jxLVk5qFw3n8FaHlPpkfxjsrKeY7wbVaSSNS/Ai0Nm4DQfQUC+hklIZcGwpVvWCnoOdIseVN/lTqsPnqesFhuLzFCxESRgbdLfTNKuyEWm4uYSYwID/3hFsmpFTfM3514nXgdwlEjU7TfDe2fn+LjJSeY9o3kkApigRNU4m+/Vk2Dispemw5HEFtKidUdUpbvrs51ePcIEvfD7j/I=
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:17:06.3432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a50b6e4b-f8e4-42e7-a91a-08d71671c996
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.166.56.231];
	Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5485
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
X-List-Received-Date: Thu, 01 Aug 2019 11:17:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA43A64B1817394ABAB51078E832DAC6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMzEtMDctMTkgMTU6MjksIFJvc3MgQnVydG9uIHdyb3RlOg0KPiBPbiAzMS8wNy8yMDE5IDE0
OjIyLCBNaWtlIExvb2lqbWFucyB3cm90ZToNCj4+IFdlbGwsIHRoYXQncyBhdCBsZWFzdCBnb29k
IHRvIGtub3cuDQo+Pg0KPj4gSSdtIG9uIHRoZSAidGh1ZCIgYnJhbmNoIGN1cnJlbnRseSwgc28g
SSBob3BlIHRoaXMgaXNuJ3Qgc29tZXRoaW5nIHRoYXQgZ290DQo+PiBmaXhlZCBvbmx5IHJlY2Vu
dGx5Lg0KPj4NCj4+IEknbGwgdHJ5IHNvbWUgc2ltcGxlIGltYWdlcyBmaXJzdC4gSSBnYXRoZXIg
dGhlcmUncyBubyBwYXJ0aWN1bGFyIG1hZ2ljDQo+PiBpbmNhbnRhdGlvbiBJIG5lZWQgdG8gcHV0
IGludG8gbXkgaW1hZ2UgcmVjaXBlIHRvIGdldCB0aGUgcGtnLWNvbmZpZyBmaWxlcw0KPj4gaW50
byB0aGUgU0RLIHN5c3Jvb3Q/DQo+IA0KPiBSaWdodCwgdGhleSdyZSBqdXN0IGluIHRoZSAtZGV2
IHBhY2thZ2VzLsKgIEknZCB0cnkgYnVpbGRpbmcgYSANCj4gY29yZS1pbWFnZS1taW5pbWFsIFNE
SyB0byB2ZXJpZnkgdGhhdCB3b3JrcywgYXMgSSBzdXNwZWN0IHlvdSd2ZSBkb25lIA0KPiBzb21l
dGhpbmcgaW4geW91ciBpbWFnZSB0byBicmVhayB0aGUgU0RLLg0KDQpJIHRoaW5rIEkgZm91bmQg
aXQuDQoNClRoZSBpbWFnZSBpbnN0YWxscyB0aGUgZHJvcGJlYXIgU1NIIHNlcnZlciwgYW5kIHRo
ZSBvcGVuc3NoLXNmdHAtc2VydmVyLiBUaGVzZSANCnNlZW0gdG8gY2F1c2UgYSBjb25mbGljdCwg
YW5kIHRoZW4gQUxMIHRoZSAiLWRldiIgcGFja2FnZXMgZ2V0IHNraXBwZWQuDQoNClRoZSB3YXJu
aW5nIGxvb2tzIGxpa2UgdGhpcyAoSSByZW1vdmVkIHNvbWUgc2Vuc2l0aXZlIGluZm9ybWF0aW9u
IGFuZCBhIGxpc3QgDQpvZiBhIGZldyBodW5kcmVkIHBhY2thZ2UgbmFtZXMpOg0KDQoNCldBUk5J
Tkc6IHByb2xpcmEtZGVsaXJpdW0taW1hZ2UtMS4wLXIwIGRvX3BvcHVsYXRlX3NkazogVW5hYmxl
IHRvIGluc3RhbGwgDQpwYWNrYWdlcy4gQ29tbWFuZCAnLi4uLy4uLWltYWdlLzEuMC1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9vcGtnIA0KLS12b2xhdGlsZS1jYWNoZSAtZiAuLi4g
LS1mb3JjZV9wb3N0aW5zdGFsbCAtLXByZWZlci1hcmNoLXRvLXZlcnNpb24gICBpbnN0YWxsIA0K
Li4uIGJpbnV0aWxzLWRldiBsaWJsem8yLWRldiAuLi4gbGliYWlvLWRldicgcmV0dXJuZWQgMToN
CkNvbGxlY3RlZCBlcnJvcnM6DQogICogU29sdmVyIGVuY291bnRlcmVkIDEgcHJvYmxlbShzKToN
CiAgKiBQcm9ibGVtIDEvMToNCiAgKiAgIC0gcGFja2FnZSBvcGVuc3NoLWRldi03LjhwMStnaXQt
cjAuY29ydGV4YTl0MmhmLW5lb24gcmVxdWlyZXMgb3BlbnNzaCA9IA0KNy44cDErZ2l0LXIwLCBi
dXQgbm9uZSBvZiB0aGUgcHJvdmlkZXJzIGNhbiBiZSBpbnN0YWxsZWQNCiAgKg0KICAqIFNvbHV0
aW9uIDE6DQogICogICAtIGFsbG93IGRlaW5zdGFsbGF0aW9uIG9mIHBhY2thZ2Vncm91cC1jb3Jl
LXNzaC1kcm9wYmVhci0xLjAtcjEuYWxsDQoNCiAgKiAgIC0gZG8gbm90IGFzayB0byBpbnN0YWxs
IGEgcGFja2FnZSBwcm92aWRpbmcgZHJvcGJlYXItZGV2DQoNCiAgKiAgIC0gZG8gbm90IGFzayB0
byBpbnN0YWxsIGEgcGFja2FnZSBwcm92aWRpbmcgDQpwYWNrYWdlZ3JvdXAtY29yZS1zc2gtZHJv
cGJlYXItZGV2DQoNCiAgKiBTb2x1dGlvbiAyOg0KICAqICAgLSBkbyBub3QgYXNrIHRvIGluc3Rh
bGwgYSBwYWNrYWdlIHByb3ZpZGluZyBvcGVuc3NoLWRldg0KDQoNCg0KSWYgSSByZW1vdmUgIm9w
ZW5zc2gtc2Z0cC1zZXJ2ZXIiIGZyb20gdGhlIHBhY2thZ2VzLCB0aGUgd2FybmluZyAod2hpY2gg
c2hvdWxkIA0KaGF2ZSBiZWVuIGFuIGVycm9yPykgZGlzYXBwZWFycyBhbmQgdGhlIHJlc3VsdGlu
ZyBTREsgcHJvcGVybHkgY29udGFpbnMgYWxsIA0KdGhlIHBrZy1jb25maWcgZmlsZXMgYWdhaW4u
DQoNCkkgd29uZGVyIGlmIHRoZXJlJ3MgYSBwcm9wZXIgZml4IHRvIHByZXZlbnQgdGhpcywgaS5l
LiBicmVhayB0aGUgbGluayBiZXR3ZWVuIA0Kb3BlbnNzaC1zZnRwLXNlcnZlciBhbmQgb3BlbnNz
aC1kZXYuDQo=

