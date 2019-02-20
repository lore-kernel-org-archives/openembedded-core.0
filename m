Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 35291 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Feb 2019 10:17:05 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150052.outbound.protection.outlook.com [40.107.15.52])
	by mail.openembedded.org (Postfix) with ESMTP id D920D7CA56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RcldneRKCsC1+IQDC5Og/67GxUyEHMItCvCd2pINs+c=;
	b=t5qWWhIkUhPJjORaNK+hWhitsyXtW8mjSZ7Flmw5IHS6m6Dl/fB6reyAWGphL1QmhvRkKnnIR1TU4cRuNXed36DiHHhS7eibYZCOQX6ugDzDLsg1t/xlWPRcW0oAlh7sNHyRYWbUvAgNfRLF6UKK8wp1h/s3douFdutXYUFxQ1A=
Received: from DB6PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:6::24) by
	AM0PR04MB5476.eurprd04.prod.outlook.com (2603:10a6:208:11d::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.15;
	Wed, 20 Feb 2019 10:42:47 +0000
Received: from VE1EUR01FT003.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e01::208) by DB6PR04CA0011.outlook.office365.com
	(2603:10a6:6::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.15 via
	Frontend Transport; Wed, 20 Feb 2019 10:42:47 +0000
Authentication-Results: spf=pass (sender IP is 52.236.92.113)
	smtp.mailfrom=topicproducts.com; lists.openembedded.org;
	dkim=pass (signature
	was verified) header.d=topicbv.onmicrosoft.com; lists.openembedded.org; 
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.236.92.113 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.236.92.113;
	helo=eu2-emailsignatures-cloud.codetwo.com;
Received: from eu2-emailsignatures-cloud.codetwo.com (52.236.92.113) by
	VE1EUR01FT003.mail.protection.outlook.com (10.152.2.118) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1580.10 via Frontend Transport; Wed, 20 Feb 2019 10:42:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.56) by
	eu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
	(TLS12) via SMTP; Wed, 20 Feb 2019 10:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RcldneRKCsC1+IQDC5Og/67GxUyEHMItCvCd2pINs+c=;
	b=t5qWWhIkUhPJjORaNK+hWhitsyXtW8mjSZ7Flmw5IHS6m6Dl/fB6reyAWGphL1QmhvRkKnnIR1TU4cRuNXed36DiHHhS7eibYZCOQX6ugDzDLsg1t/xlWPRcW0oAlh7sNHyRYWbUvAgNfRLF6UKK8wp1h/s3douFdutXYUFxQ1A=
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com (20.176.236.92) by
	DB7PR04MB4089.eurprd04.prod.outlook.com (52.135.130.30) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.15; Wed, 20 Feb 2019 10:42:41 +0000
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::6d60:d2ab:9dc6:42b]) by DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::6d60:d2ab:9dc6:42b%6]) with mapi id 15.20.1643.014;
	Wed, 20 Feb 2019 10:42:41 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Leon Woestenberg <leon@sidebranch.com>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] wic creates ext4 images that read really slow in u-boot
Thread-Index: AQHUyEUhsy1Bylny30iv3ZodHjtW56XnXEKAgAAlsYCAABWTAIAA6e+A
Date: Wed, 20 Feb 2019 10:42:40 +0000
Message-ID: <7ff71b82-b17b-99c1-407c-82692094054a@topic.nl>
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
	<CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
	<CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
In-Reply-To: <CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
x-clientproxiedby: AM6PR0202CA0072.eurprd02.prod.outlook.com
	(2603:10a6:20b:3a::49) To DB7PR04MB5260.eurprd04.prod.outlook.com
	(2603:10a6:10:21::28)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fa1a1cbb-1615-49d1-68b3-08d69720270d
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4089; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB4089:|AM0PR04MB5476:
X-Microsoft-Exchange-Diagnostics-untrusted: =?utf-8?B?MTtEQjdQUjA0TUI0MDg5OzIzOkNwQjlYdUZ1UVVzU21nN0tWZDdMb0pFMW5D?=
	=?utf-8?B?ajQ2RjdMRmJzT0NacFZ3S2tMUi9ZWE9xOGtPa0ZoNURwdklXcm5sL3RmY2Fm?=
	=?utf-8?B?SE5RSWpSZm9uaEd6MFVXWXcyZVlDUmN4NmJwaGx2ZzFVYlZsblNkVlI5eVMx?=
	=?utf-8?B?UHFNRGhMVDlaUi96TXVGZDFDSjM4dWQrZTc4dy80RmN6ak9GamE2d0FmZlBC?=
	=?utf-8?B?Mi9DNXlMUE02a1JzNkhpS2Zhd2pMdUx6bnlPWFp0eG5rdWpmSis3V3liUXoy?=
	=?utf-8?B?Q1R5RFM0TEpNOVk3RGFZcTZiSGlQMUV2TnRyd20zRHZvT0lTbitiNm56ZmM2?=
	=?utf-8?B?elZ3aHIwZ3E3a0NXcDJNd1k0U2JON0l2ZjJ2QVpaRWMyNFl1TXJVNFNOUEU4?=
	=?utf-8?B?Y0pNQm1LT2VtMmRTYUtISGRmWDBaSHlvcFlONjljYzJ5TVJLamtFTS9aRHk5?=
	=?utf-8?B?amk3RnpXZkFjbXR5ZmFmNFUwcVRkQ1BvaHhuYXV5NFpOalBETElockxyd2tq?=
	=?utf-8?B?dVdob05tdWRZanFnMUI1VWRnVHZwYzk5YTVXMWZSdjFVTUw4a3BOSTBXcWsr?=
	=?utf-8?B?emZWWkJ2d1lwcjU5R1Bzbk5nTzRtbWwyVGVUZkFWM2JFQTFKbWZ0RXhkcEts?=
	=?utf-8?B?SWE1NUhRMDcyYzdiY2xqR0wzeW1vWWhoMEJBQVVLWjBnMTFCNWZDdmhkV0Rz?=
	=?utf-8?B?MEZPK3dIUi92QXBlRFV5QnBTY1FtRENSN0ZoRXVyeElSMHkyUndpTUpNYk5o?=
	=?utf-8?B?VXN5RXEvdldWd2FxaTg1NG9ZcVZ1azhnTWtEOUg2UW1ObVUzcWJjWmdmaHZ6?=
	=?utf-8?B?cGdGWGtvZG1ZUWVQVFdma0NkRTJYOE8rdkZBMkRhRTRuNlpNaXRuRFZwRDVM?=
	=?utf-8?B?OWxDd0gybUEvWW43L2lsUGtObitSalZ1T2xIVmFyRUNPaVpzUUVZOVA4eVpi?=
	=?utf-8?B?UkNHNElmbWk1anFqdGxuZVB4MWI1T3I5VGg2a0k4RXUzRk8rQm9XTEpGNENk?=
	=?utf-8?B?aWt3d2RLREplWjdxL2NHb3dFYlYwZnlrWWg1bDhoTVBneExXaFBwbU5OUzR0?=
	=?utf-8?B?emlDMXFhaDZiVUlOZVMvUG02K3dnNFhCUjQ3SzhGTEptRFRSNjQvbjRpQy9D?=
	=?utf-8?B?eVowdG5uV25vb1FLZTNta0RiNThEKzlpMHFDN3hVam9mbVh6Ukw1YzNJZ29S?=
	=?utf-8?B?NW43NzZYUEQrN2h5dnFSN3VYdVlGZDl6djlucWRycmVDK2d0NlFNWU5veisz?=
	=?utf-8?B?UW9YN2NGV0dwcjNXaDFPSHRZWTh0RnBSMjRYelozeGl3QktFS2h4NG4yQmUw?=
	=?utf-8?B?N1BPU0xjWmd6TkU3aGtRYmNXbFBmNnRDQUZWVW95a3dINmZISEg3R0R0Y2hs?=
	=?utf-8?B?K0luWi93aVZkK2tZeTUxRERzczAwa2x2TDNReEptSVVMa00rc094ZitFdjBE?=
	=?utf-8?B?ZWFHQzlkUzZjVkt6NWlPWFMrdXFDWlZxQTBMWTVJSWx3c2x0NWdTa3o3QlAw?=
	=?utf-8?B?SkpscXYzQnlITHF3QkpGN2MxUzVqa2d6amlCWlRNT3dpVUNseEtyWXBXM0o3?=
	=?utf-8?B?bzJndzAxRWdsWWxrYTlVWWQzYUU0cmpBMDhQRGJNTmJKK0ZuK0prUzVnZW96?=
	=?utf-8?B?TzBLVzN4cDNSNmk2TjRmVWorcTVzSGE4V0Z5RUJlV3A4VXE5eVFsSkhnWWQv?=
	=?utf-8?B?RXRWTDM5R3VSWEpGVGlLcU5uRDRxbzJnVFNGY3k5NmJyTGh3LzZlQjkwNHJI?=
	=?utf-8?B?LzQ4VUxmYm5mY1Nqd2Q2N2VKTDdnWmdiSXhNWHVkSTQ2SVk3VWlQU3luUnFl?=
	=?utf-8?B?MlgxeDYvOFRKb2RWbnoya2U0OWVPN2xleXlXSkRXcTFKU2RYbFQwb0JGbVRr?=
	=?utf-8?B?VU1ZNkk3Mmd3ZWhCSC9VaG5HU21ZbGlEYmZtdkNZWWQ3TU9FZkJUWHR4N3Fl?=
	=?utf-8?B?RldQWDhwQ1ozRFFmZ05uUWN0aU94Unh2YzFTTXlaNEQxM1FHUDNNNUs3Z28x?=
	=?utf-8?Q?kDq3oq?=
X-Microsoft-Antispam-PRVS: <AM0PR04MB5476858285B6AFCA099E622E967D0@AM0PR04MB5476.eurprd04.prod.outlook.com>
x-forefront-prvs: 0954EE4910
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(376002)(136003)(39840400004)(346002)(53754006)(199004)(189003)(36756003)(31696002)(106356001)(8676002)(316002)(508600001)(81166006)(81156014)(58126008)(110136005)(105586002)(93886005)(14454004)(8936002)(305945005)(99286004)(64126003)(68736007)(65826007)(7736002)(31686004)(52116002)(76176011)(6246003)(97736004)(256004)(14444005)(74482002)(4326008)(3846002)(476003)(102836004)(2616005)(53936002)(6486002)(2906002)(71190400001)(71200400001)(6512007)(26005)(44832011)(6436002)(42882007)(66066001)(65956001)(65806001)(25786009)(229853002)(6506007)(53546011)(386003)(186003)(486006)(446003)(11346002)(5660300002)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4089;
	H:DB7PR04MB5260.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: euGdbfXBKx6qYzyz3QvQTHB57LNAhggzS6lXtHMd34B/1rVjQlePw50AZ9JxG9iZtUi6AfY556kMf+0bWOiEsdN6FzXwywCKqf+SLFqHPDRT3ofw+29IleLGc5JDHqMzQeVXydAjTwFjv9r1Li14ayoXOXTTJ6hzXXjW7evkmOFN5wicGUcNc9vpZMx9nhJU+euWX4Un3S2NQJuezidm/FRG6h9/CpaPJ9J7+O2k+C/FYcFDm+AetnRXdKAhIUg8LQtDI5IT60RrRPrkgK1q3/CGDDxWEK8Oa9nNW1Mi7pbEEVRJ4U0G4cyyrB1MA/FxpKss8OF5v4W35UfEGcMz4QLAitOFsfX9H9uyAirKeMlsKP2l+/cMe1bG0/9rIXjqvHeMBduBIyfCsyPWMKqSJtMCET14bWabpIam44B5aRM=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089
X-CodeTwo-MessageID: 20190220104243.1727ac11-0088-46a8-b93f-a040ee715710@eu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT003.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.236.92.113; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39840400004)(346002)(396003)(136003)(2980300002)(189003)(53754006)(199004)(65806001)(2906002)(74482002)(65956001)(66066001)(7636002)(7736002)(93886005)(102836004)(65826007)(44832011)(64126003)(5660300002)(31696002)(486006)(305945005)(7596002)(246002)(8936002)(47776003)(8676002)(446003)(6486002)(4326008)(25786009)(126002)(53546011)(106002)(316002)(6512007)(6116002)(229853002)(3846002)(50466002)(76176011)(31686004)(476003)(2616005)(11346002)(14444005)(58126008)(110136005)(356004)(508600001)(2486003)(436003)(23676004)(99286004)(42882007)(36756003)(26005)(336012)(6246003)(14454004)(6506007)(186003)(106466001)(386003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5476;
	H:eu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass; LANG:en;
	PTR:eu2-emailsignatures-cloud.codetwo.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f51d3f96-c8d6-4ff7-1c4a-08d697202342
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600110)(710020)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR04MB5476; 
X-Microsoft-Exchange-Diagnostics: 1; AM0PR04MB5476;
	20:cO0XZ/I1ZVRxDUHY9BjrN9F9JeLtG2KQdNyfs4twLgqDO7V8KhL6sPDiRzILpFD3lRM4WSRR+HQu+xC4R0UnJyxHYt7KSyvhZizLxaSYYl0FuOtdRbUahgBTvO9k+qFr0F8ihuNIS22d0PC5+3Nd8oPrYmy+UKMhGWP/3H/Sq80=
X-Forefront-PRVS: 0954EE4910
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTBQUjA0TUI1NDc2OzIzOm0yclVKRFhlNEhJMnpaR2NKYXhwelpwZUtX?=
	=?utf-8?B?Vm5lT1I1TEZnVWRZdmpBL3AreHhJNjM3Y1lvV2Y4ZUV5U1Y5ejdQeHRzS1Ri?=
	=?utf-8?B?MTB5TzBLdXoxeDl4OWFzem1XZUl0eUVWWWpOVDhxdTlCNjlndlcyY0tnRHFZ?=
	=?utf-8?B?OUNFYVB4RFRPMUZzem82YjZJRkIySXBpWDVjYUlzU2wwZkJOd1BzQ3oyYVJu?=
	=?utf-8?B?ME5CdERmUXI1R2hBQjVSNTkzK0IvR0pUR09seXFiRWJBRzNpZ2IwZUx0bzhC?=
	=?utf-8?B?eC85WHdrQzdnRVhTRDZaN0FXajZmc3BNL29pSk5KQittakZLRTVTc3h1OWtJ?=
	=?utf-8?B?Z2Q3OE9NaUV4STZTUTBwMDJsSWg4NzdvOGpXdDRMaWg2Wm5XNE8xSEVDL21Z?=
	=?utf-8?B?blVWKzQreldVMWZGS2RtMmRjL3VvRThNTllUeDZYYVNzbFVUQUdrVEsvdmZx?=
	=?utf-8?B?N0Z2TXVDSG10V2Fvd0FaWXA5Z2Ftek1UTHVYVVgzbUVoS1VCWU9YVVdKUkNL?=
	=?utf-8?B?SlBQLzJYNHp6eExyZk16QkxRTHQ3ektFY2d3WmNJZXcyUGNnMTJqSm9qZHVp?=
	=?utf-8?B?WUFES2VnQmFQUHY2TEFhczJiY09QQWovUURkdEEyMTRwTzVJVlNkckhCZml5?=
	=?utf-8?B?RllDKzF2dTNBeFp0OXRMN2VJcmNVV3V4UkN1TmFuWXpBbzRyc2dLVUJCd3Vk?=
	=?utf-8?B?OUoyb1ZNTUFBN3pJL3NTUmxWTkMvSnZDbHhkVGQ3ZlgyL1JSYXBJYWpMWUtX?=
	=?utf-8?B?Z0NMQzkrWmgwc0JOcCtYN3AyZHZvNmptRUlzZHdYbUp6TFh4bEtxRmpuUTF3?=
	=?utf-8?B?V1lUSU5peHBoM290UTlGMC9sZDZHOC9SbGRKY2hGRS9pUnJMUGlKeVdpOHJO?=
	=?utf-8?B?NTg4OU5Bb3c4SFNsMUxFZ3cvRUExRGVIUC9keGFYbWsydnV5ekk4QUN0ZFl6?=
	=?utf-8?B?UjZVa3VXT3VMN1dCSVhIYmR4S3hnT2RZdGxqTDBBa2Vhb2hseHhMcENBSjRR?=
	=?utf-8?B?ZXdhRG5LSXltSUR5L1pqQlJKTEFoLzRMbnVtUDhFN0FmWXdwaTBKcDJxeXlF?=
	=?utf-8?B?N2xtZ1JJcmZJelArYVhmd04vTmROa25NbW50WVcyeDdFSHd5a1lEMTVZUFRL?=
	=?utf-8?B?elF2RFBpVjlrcm5EMDkvc1RXZzYvNklOMFEzOXg5N040K2YrQzVIOEw1QXRH?=
	=?utf-8?B?emJ4T2wzeWFDeEJVdWFOQlpkL1BaalRqdGMrWDBpVTcyclpGWU8rS25sVTNX?=
	=?utf-8?B?MkJGMUZEc1NZQ2RxejhhL1ZQTEFOWjNxcVBZWTJ2SzVWSVdROFZ3bm51WkZy?=
	=?utf-8?B?SWs1ZzhtMTdCZUM2WHh2YVdSMzNobFo4aUxVZUUrT3RrRnJzMjdxRHNybFBZ?=
	=?utf-8?B?c0ZNbzZxZnM5UW53b25tbnFNSVgwcGQyby94dXFVeWl1Rm9jTkhKWE9FV28r?=
	=?utf-8?B?aWU4Rk1jaU9JdmIrUFBGR3JBKzVnNS81RXVuYmpZblE4MkFDeHZqRXZwaytW?=
	=?utf-8?B?aDlDK0RBTUJQS3JoOVhvNkpySXJENC90bVVna3UyNi9RcHl5emlpUU92WW9U?=
	=?utf-8?B?RVhMWnlzWHZWLzFLMVNDbGo1Vk5xVDFvcXB0V3Boc1l3OGNSdGRsNTRhMjlE?=
	=?utf-8?B?dU0xM3RjclRoSU1PRzZVL01kWXZkWk9qYTkvaTRhQTdCNkFrVlRMSnk4U2g2?=
	=?utf-8?B?VDVpQTE2SzdtV3o5bWxkei9Mb244NHFIc1RERW8yS2U3eUptOFBhK3hjMnFl?=
	=?utf-8?B?THBMZXU3UXVaWjlaU0kreDdEMU56c2E4SHhOUmMzbUJnMDFURmFHZFREVUls?=
	=?utf-8?B?ci9GbTVkUWNFNmxONldMMHZjQVpKWXBQNElKOGZ1eDVielVKeTlVNXgzVEcr?=
	=?utf-8?B?ZGZPSHZOcVRVT3kreVNlbW1pUzBsMG1kQ1lmTUNwOFUyMnFLYXcyVTZXd3M2?=
	=?utf-8?Q?54aw9W1OjzeMbxbB9KQWzAQeigGaIs=3D?=
X-Microsoft-Antispam-Message-Info: 6DpWNm19ahnc2fuICq0CR4dM6t7Hp0awZw/ImjyK3w6tjzsz010kcF36dpgen+0+PfZpa2SquR5q5tq/UO/Odct5FAxKqicngz2nJeMFOxOamx+JgXZ/FH0JCc/0HI4MhPn6RL3vjKlOGzQa3m/vTrR7gj2p2aj9fUuTYlScg1djiNb0XM+D8dmW4YkfVr+Tm6+gqoYdCjk+REu/tfHKNXyVQQX/hyl8UNXpeHa1ODoQ04uaHdqu0C4lvgryXL2ojend+saawkvKxpTxppxGPB11NrG4yNo6wasFDRRZucjSaybmTRDnFs0LGIf6QV4LLpVgQMeVMS4HHwdNh6LhLjbWlW+VDuu8XeStO5w8IIKwg1p8ZZN7uyMSBh+3NhxgK84HICxukVTc3Tm8XwnvayAp5BRYODNGmktb3fd2MGk=
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2019 10:42:46.6509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1a1cbb-1615-49d1-68b3-08d69720270d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.236.92.113]; Helo=[eu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5476
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Thu, 21 Feb 2019 10:17:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <312CC21AB1D8F242B7F93855449EA7EC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMTktMDItMTkgMjE6NDUsIExlb24gV29lc3RlbmJlcmcgd3JvdGU6DQo+IEhlbGxvIGFsbCwN
Cj4gDQo+IE9uIFR1ZSwgRmViIDE5LCAyMDE5IGF0IDg6MjggUE0gQW5kcmUgTWNDdXJkeSA8YXJt
Y2N1cmR5QGdtYWlsLmNvbT4gd3JvdGU6DQo+PiBPbiBUdWUsIEZlYiAxOSwgMjAxOSBhdCA5OjEz
IEFNIExlb24gV29lc3RlbmJlcmcgPGxlb25Ac2lkZWJyYW5jaC5jb20+IHdyb3RlOg0KPj4+DQo+
Pj4gSGVsbG8gTWlrZSwNCj4+Pg0KPj4+IHNvdW5kcyBmYW1pbGlhci4NCj4+Pg0KPj4+IE9uIFR1
ZSwgMTkgRmViIDIwMTkgYXQgMTc6NTUsIE1pa2UgTG9vaWptYW5zIDxtaWtlLmxvb2lqbWFuc0B0
b3BpYy5ubD4gd3JvdGU6DQo+Pj4+DQo+Pj4+IFRvb2sgbWUgYSB3aGlsZSB0byBmaWd1cmUgb3V0
IHdoeSBteSBib2FyZCB0b29rIDkwIHNlY29uZHMgdG8gYm9vdCBzdWRkZW5seS4NCj4+Pj4gVGhl
IGlzc3VlIHR1cm5lZCBvdXQgdG8gYmUgdGhlIGV4dDQgcGFydGl0aW9uIGNyZWF0ZWQgYnkgd2lj
Lg0KPj4+DQo+Pj4gSSBzdXNwZWN0IGl0J3Mgbm90IFdJQydzIGZhdWx0Lg0KPj4+Pg0KPj4+PiBa
eW5xTVA+IGxvYWQgbW1jIDA6MiAweDEwMDAwMCAvbGliL2Zpcm13YXJlL2ZwZ2EuYmluDQo+Pj4+
IDE5MzExMDkyIGJ5dGVzIHJlYWQgaW4gODU1MjkgbXMgKDIxOS43IEtpQi9zKQ0KPj4+Pg0KPj4+
PiBOb3cgaWYgSSBib290IHRoZSBib2FyZCByZW5hbWUgYW5kIGNvcHkgdGhhdCBmaWxlIG9udG8g
aXRzZWxmLCB0aGVuIGl0J3MNCj4+Pj4gc3VkZGVubHkgbm9ybWFsIGFnYWluIHdoZW4gSSByZWJv
b3QgdGhlIGJvYXJkOg0KPj4+Pg0KPj4+PiBaeW5xTVA+IGxvYWQgbW1jIDA6MiAweDEwMDAwDQo+
Pj4+IEknbSBub3Qga25vd2xlZGdlYWJsZSBvbiBleHQ0LCBzbyBhbnkgaWRlYXMgd2hhdCdzIGJl
aW5nIHBhc3NlZCBvbnRvIHRoZSBpbWFnZQ0KPj4+PiBjcmVhdGlvbiB0b29sIHRoYXQgY2F1c2Vz
IHRoaXM/DQo+Pj4NCj4+PiBJIHN1c3BlY3QgeW91ciB2ZXJzaW9uIG9mIFUtQm9vdCBkb2VzIG5v
dCBoYW5kbGUgZmlsZXMgc3ByZWFkIGFjcm9zcyBtdWx0aXBsZSBmaWxlc3lzdGVtcyAoYWxsb2Nh
dGlvbikgZXh0ZW5kcyBlZmZpY2llbnRseS4NCj4+Pg0KPj4+IENvcHlpbmcgdGhlIGZpbGUgbWFr
ZXMgdGhlIGNvcHkgYmVpbmcgbGF5ZWQgb3V0IGluIG9uZSBleHRlbmQgcHJvYmFibHkuDQo+Pg0K
Pj4NCj4+IElmIFdJQyBpcyBnZW5lcmF0aW5nIGZpbGVzeXN0ZW0gaW1hZ2VzIGZyb20gc2NyYXRj
aCB0aGVyZSdzIG5vIGV4Y3VzZSBmb3IgZmlsZXMgdG8gYmUgdW5uZWNlc3NhcmlseSBmcmFnbWVu
dGVkLg0KPj4NCj4+IEV2ZW4gaWYgc29tZSBvZiBhbGwgb2YgdGhlIGJvb3QgdGltZSBjYW4gYmUg
cmVjb3ZlcmVkIGJ5IGEgcGF0Y2ggdG8gdS1ib290IHRoYXQgd29uJ3QgaGVscCBzeXN0ZW1zIHdo
aWNoIGhhdmUgYWxyZWFkeSBiZWVuIGRlcGxveWVkIGFuZCBkb24ndCBoYXZlIGEgd2F5IHRvIHVw
ZGF0ZSB0aGUgYm9vdGxvYWRlci4NCj4+DQo+IEkgYW0gbm90IHN1cmUgaWYgImZyYWdtZW50ZWQi
IGlzIHRoZSByaWdodCB0ZXJtIGluIHRlcm1zIG9mIGZpbGVzeXN0ZW0NCj4gZGV0YWlscy4gRmls
ZXN5c3RlbSBhbGxvY2F0aW9uIGV4dGVudHMgKG5vdCAiZXh0ZW5kcyIgYXMgSSBtaXN0eXBlZA0K
PiBlYXJsaWVyKSBhcmUgZGlmZmVyZW50IGZyb20gaGVhdnkgZmlsZSBmcmFnbWVudGF0aW9uLiBI
b3dldmVyLCBJIGFncmVlDQo+IHRoaW5ncyBjYW4gYmUgbWFkZSBtb3JlIG9wdGltYWwuDQo+IA0K
PiBTbywgd2l0aCBhZGRpbmcgdGhlIGFib3ZlLCB0aGVyZSBhcmUgKnR3byogaXNzdWVzIGF0IHBs
YXkgaGVyZToNCj4gMSkgTW9zdC9vbGRlciB2ZXJzaW9ucyBvZiBVLUJvb3Qgbm90IGFibGUgdG8g
ZWZmaWNpZW50bHkgbG9hZCBmaWxlcw0KPiBmcm9tIGV4dDQgZmlsZXN5c3RlbXMsIHRoYXQgY3Jv
c3MgbXVsdGlwbGUgZXh0ZW50cy4gSSBhbSBhd2FyZSBvZiB0d28NCj4gZml4ZXMsIHNlZSBiZWxv
dy4NCj4gMikgV0lDIHVzZXMgbWtleHQ0ZnMgaW4gc3VjaCBhIHdheSB0aGF0IGZpbGVzIGNhbiBj
cm9zcyBtdWx0aXBsZQ0KPiAoYWxsb2NhdGlvbikgZXh0ZW50cy4gVGhpcyBpcyBzdWItb3B0aW1h
bCBhbmQga25vdyB0byBjYXVzZSBpc3N1ZXMNCj4gd2l0aCBtYW55IFUtQm9vdCB2ZXJzaW9ucyAo
ZGVwbG95ZWQgb24gZXhpc3Rpbmcgc3lzdGVtcyBpbiB0aGUgZmllbGQpLg0KPiBUaGUgcHJvYmxl
bXMgc2hvd3MgInJhbmRvbWx5IiB3aXRoIGxhcmdlIGZpbGVzIGJlaW5nIGRlcGxveWVkIHRvIHRo
ZQ0KPiBleHQ0IGZpbGVzeXN0ZW0uIFdlIChPRS9Zb2N0bykgbWF5IHdhbnQgdG8gZml4IHRoaXMu
DQoNClRoYXQnZCBiZSBiZXN0LiBPbmUgd291bGQgZXhwZWN0IHRoYXQgY3JlYXRpbmcgYSBmaWxl
c3lzdGVtICJvZmZsaW5lIiB3b3VsZCANCnlpZWxkIHNvbWV0aGluZyBvcHRpbWFsIGluIHRlcm1z
IG9mIHRoZSB3YXkgZmlsZXMgYXJlIGFsbG9jYXRlZCwgc2luY2UgDQpldmVyeXRoaW5nIGFib3V0
IGFsbCBmaWxlcyBpcyBhbHJlYWR5IGtub3duIHdoZW4gaXQncyB3cml0dGVuLg0KDQpNeSBjdXJy
ZW50IHdvcmthcm91bmQgaXMgdG8ganVzdCBtb3VudCB0aGUgZGV2aWNlIGFuZCB1bnBhY2sgdGhl
IHJvb3RmcyB0YXIgDQpvbnRvIHRoYXQsIHdoaWNoIHlpZWxkcyBhIGZpbGVzeXN0ZW0gdGhhdCB1
LWJvb3QgY2FuIHJlYWQgYXQgbm9ybWFsIHNwZWVkLg0KDQoNCj4+PiBJIGFtIGF3YXJlIG9mIHR3
byBmaXhlcyBmb3IgVS1Cb290LiBJIHdpbGwgbG9vayB0aGVtIHVwLCBhbmQgcmVwbHkgYWdhaW4g
dG8gdGhpcyB0aHJlYWQuDQo+IA0KPiBHb29nbGUgZm9yIHRoZXNlIHR3byBjb21taXRzLiBJIGNo
ZXJyeS1waWNrZWQgdGhlIGZpcnN0IG9uZSBmb3IgbXkNCj4gcHJvamVjdCBhbmQgY2FuIGNvbmZp
cm0gaXQgYnJpbmdzIGJhY2sgdGhlIGRlc2lyZWQgcGVyZm9ybWFuY2UuIChTdGlsbA0KPiBhc3N1
bWluZyB0aGlzIGlzIHRoZSBpZGVudGljYWwgY2F1c2UgYXMgZm9yIFRPL01pa2UuKQ0KPiANCj4g
Y29tbWl0IDg1NWI4ZTRmOWYyNTU0MTVhNzc1MzgxOWUzOTJlNGI1ZDk4NGYzNWMNCj4gQXV0aG9y
OiBNYXR0IE1hZGlzb24gPG1hdHRAbWFkaXNvbi5zeXN0ZW1zPg0KPiBEYXRlOiAgIFNhdCBBdWcg
MTkgMDg6NDY6NDYgMjAxNyAtMDcwMA0KPiANCj4gICAgICBleHQ0OiBjYWNoZSBleHRlbnQgYmxv
Y2tzIGR1cmluZyBmaWxlIHJlYWRzDQo+IA0KPiAgICAgIEEgc2ltcGxlciBhbmQgbGVzcy1lZmZp
Y2llbnQgYXBwcm9hY2ggdG8gc29sdmluZw0KPiAgICAgIHRoZSBwcm9ibGVtIHdpdGggZXh0ZW50
IGluZGV4IGJsb2NrcyB0aGFuIHdoYXQNCj4gICAgICB3YXMgaW4gZmMwZmM1MGYzOGE0ZDdkMDU1
NDU1ODA3NmE3OWRmZThiMGQ3OGNkNSwNCj4gICAgICBidXQgb25lIHRoYXQgZG9lcyBub3QgYnJl
YWsgd3JpdGUgb3BlcmF0aW9ucy4NCj4gDQo+ICAgICAgU2lnbmVkLW9mZi1ieTogTWF0dCBNYWRp
c29uIDxtYXR0QG1hZGlzb24uc3lzdGVtcz4NCg0KSSdsbCBnaXZlIGl0IGEgdHJ5Li4uDQoNCllv
dSBtZW50aW9uZWQgInR3byIgY29tbWl0cz8NCg==

