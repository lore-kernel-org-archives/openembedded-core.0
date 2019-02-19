Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 18064 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Feb 2019 16:54:53 UTC
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8BB97C9B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8TTVSFCPsiFSvH8/fVetQZvVSAPxvnO+IyHaFv3rO8U=;
	b=gOiMnHiCm9uJO7N8xKYwempZmdCxaIa3IDkvGukTCatI2ohlQlFxz9LlW8RsOpym/cMLSlqKXD1jOebRYFDB/jx6jSbd6JwwHo7cOfGLcwGXmEn6S5ni4q4xJbcjWnY5Z+XRsBCHiC0MhvNdgq2v6n0ohRPgV0VtLOCPJNQbeC4=
Received: from AM3PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:207::30) by
	DB7PR04MB5482.eurprd04.prod.outlook.com (2603:10a6:10:86::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.19; Tue, 19 Feb 2019 11:20:39 +0000
Received: from HE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::209) by AM3PR04CA0146.outlook.office365.com
	(2603:10a6:207::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1622.16 via
	Frontend Transport; Tue, 19 Feb 2019 11:20:39 +0000
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
	HE1EUR01FT031.mail.protection.outlook.com (10.152.0.177) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1580.10 via Frontend Transport; Tue, 19 Feb 2019 11:20:39 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (104.47.4.53) by
	eu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
	(TLS12) via SMTP; Tue, 19 Feb 2019 11:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=8TTVSFCPsiFSvH8/fVetQZvVSAPxvnO+IyHaFv3rO8U=;
	b=gOiMnHiCm9uJO7N8xKYwempZmdCxaIa3IDkvGukTCatI2ohlQlFxz9LlW8RsOpym/cMLSlqKXD1jOebRYFDB/jx6jSbd6JwwHo7cOfGLcwGXmEn6S5ni4q4xJbcjWnY5Z+XRsBCHiC0MhvNdgq2v6n0ohRPgV0VtLOCPJNQbeC4=
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com (20.176.236.92) by
	DB7PR04MB4044.eurprd04.prod.outlook.com (52.135.130.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.19; Tue, 19 Feb 2019 11:20:34 +0000
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::6d60:d2ab:9dc6:42b]) by DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::6d60:d2ab:9dc6:42b%6]) with mapi id 15.20.1643.014;
	Tue, 19 Feb 2019 11:20:34 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: wic creates ext4 images that read really slow in u-boot
Thread-Index: AQHUyEUhsy1Bylny30iv3ZodHjtW5w==
Date: Tue, 19 Feb 2019 11:20:34 +0000
Message-ID: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
x-clientproxiedby: AM6PR0502CA0050.eurprd05.prod.outlook.com
	(2603:10a6:20b:56::27) To DB7PR04MB5260.eurprd04.prod.outlook.com
	(2603:10a6:10:21::28)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8c6c399b-2c38-4d5d-30e7-08d6965c471f
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4044; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB4044:|DB7PR04MB5482:
X-Microsoft-Exchange-Diagnostics-untrusted: =?utf-8?B?MTtEQjdQUjA0TUI0MDQ0OzIzOnR2QWRFRjJxR3E0K212YjRVLzdDOFBuWlNx?=
	=?utf-8?B?b0hsbHdFUkJycGhTR0xvd01lV3hzd3NMZjIyeUhaSVJBL2pyOUxTTmJuOU15?=
	=?utf-8?B?bW1zYmxveHJjOVNyb2NCT2Z1RlVzMjhRQ2VGZkJ5NTM4Q2VnR25rWlBUQXpJ?=
	=?utf-8?B?bitTQU9BdElERkFIQzFSS0RrLzB3VXhsZGJuaFUzNno3WmhYU0g5NzZZTmFm?=
	=?utf-8?B?Y3BJc1h2R3FjMW5NVzRrU1RCV09tQWpkbVo4UURlOUovYXFzQWljaW1ZRWdU?=
	=?utf-8?B?RDBXeW9jOTVBejJVVTdZWkpvRU1jdzVGdzhzWmlLei82YW93VVNGbHNYVjVJ?=
	=?utf-8?B?QjE5Uzk5MXpFVEh5L1JhTXVvT29TdVlNdnF2azNUTHRUb01tT0dDMjRzcHo1?=
	=?utf-8?B?RTMxSHkxeTFrWlR0YXRqbEZ3WEt2NHIvQjFiS2lPMURaejhZdzdoSXJFT0RW?=
	=?utf-8?B?aVcrUmN3Unl1NUdFLzRkbzBiVXl0ck5PUDAzRTBYUzRYUzRFV3gwbFJCYXhS?=
	=?utf-8?B?dUlFbTFJeldreTlKQ0tlOXVndFVReFVUU092L0I1cUdMajF2MG9vbzR6NVpR?=
	=?utf-8?B?bVZ0WWhZbnl1a1FveFYvRC9NNk15SjNkc0RUZm9STFo3cDBOZlFvblNGY3c3?=
	=?utf-8?B?M0h6ems3NGoxRTVKbnNxUWFRQUFZYS9QZUpvTjlJeHF3M3A3TVR4aStCbmxW?=
	=?utf-8?B?N3RieEFrOEtEYkJ3ek9oVGwvT21hVlhCeFEyTTAyWE8xdlpCS3pDNGZjSXkv?=
	=?utf-8?B?NG5yRzc4dzZBN0pIenZJdVZYVGRNWmV6SzRZVE1CS3ZDNUNKbWhsNFZyV2xT?=
	=?utf-8?B?S3ZhY3JBRG5PVTc5M2l1NnRBWXlvb09yN21sdDkySEtBZHA0bTkxV0lmWjk0?=
	=?utf-8?B?NTNDYjlWaXBFM0FRUjg2MjJYTXVsc0xJcmlmbjVrN3FnZEsrQnIrK1kxdEFY?=
	=?utf-8?B?bVBzd1BSTHhZYVA3cVY1MlFhb1QxL0RRSFpzMkRyaDF5WSsya0lCT3VUeUdK?=
	=?utf-8?B?WTJaWVJaa2xYRzFUYnVnb1E4aTR1anVBeEYzc2RIWGdGWk9TSWFRNUVKclBr?=
	=?utf-8?B?K0RPK3RrK24rRFExamp2b3hZUVVjQ2hGTm1lVnhibVcwckxDbUpXMmdLQ29H?=
	=?utf-8?B?dXNCdG43WHV3QTB6ak9FVExPbExoMlFlUlZrS082Q1J5NitBUnBxMzRzZmFB?=
	=?utf-8?B?NUZ3TU5RQ2s1TkJ1SU9JSmxNclJDam1FN0I0b05Ta3VXL2x5bEFkWWtzTHJq?=
	=?utf-8?B?ckc2dG9id1F3Y3BpNW1qSW51VzRhMzVqNmN4YzIzb2UvRTNNcWRFa2Q4N2FC?=
	=?utf-8?B?QlNnSWl6NVlGcXBIcTlmMFFFb044aS8zTFcwM2pieFBzWEZpSll3SnhRZHJh?=
	=?utf-8?B?Rit1UmtzT2tPUTN0U0k5REdwVDQxOVBpMk9FQS81ZTNQK3Y1cmE2OW1hb0g3?=
	=?utf-8?B?dDQrdVBxVE02UkplSG8vdUZQa2dmemU1R2NVS0dUbW5uUk1BKzVvcmwrNHF1?=
	=?utf-8?B?bE5YdWhMTkMyRU5XTFdxdW5wZDhMdVJ3TmdUWjBSTndLSlRyaG5Hc2ZDdjQ1?=
	=?utf-8?B?ZmdtaGp4L1ovU1FaQ0FRQVRhZmU2c1ppVHFKc3NGalNqOFJYQnNpMktZN1pl?=
	=?utf-8?B?VUpmZW4rbXV3anhsbGlqMWF2REk4YWpzQlR6S1hrbXpIU2hmNDNoZUoxTEVj?=
	=?utf-8?B?Ykg4SlM4c1dFZm9VQklqNnVZTzB5OWl4MVl5K1JFcXpNL0UzRE8xdTc1L24z?=
	=?utf-8?B?R2IzT0ZjWWppSHhuN2tRUVgwQkl6MnJsYXZqQUhDcUUrdkNFanhNOGZqOTU3?=
	=?utf-8?Q?v/7+Ld14sgIWh?=
X-Microsoft-Antispam-PRVS: <DB7PR04MB5482699CDE4FEF1F918B467D967C0@DB7PR04MB5482.eurprd04.prod.outlook.com>
x-forefront-prvs: 09538D3531
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(376002)(396003)(366004)(136003)(346002)(39840400004)(189003)(199004)(68736007)(71190400001)(74482002)(6512007)(65806001)(6486002)(186003)(52116002)(64126003)(25786009)(31686004)(44832011)(8676002)(256004)(486006)(81156014)(81166006)(71200400001)(476003)(6506007)(2906002)(386003)(4744005)(508600001)(99286004)(316002)(65956001)(102836004)(66066001)(6436002)(58126008)(5660300002)(2616005)(53936002)(2501003)(31696002)(105586002)(7736002)(42882007)(106356001)(2351001)(3846002)(5640700003)(6916009)(26005)(97736004)(6116002)(8936002)(305945005)(36756003)(65826007)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4044;
	H:DB7PR04MB5260.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 9rwhVK5RxmUGGYVJKoIIhavCCgqVAxOkZgzauLzDTrJG7JWR/3Pu01v9a2qYWipco5Xb8FLmdEXHo/bYKyvmMdfc0C+REJ8Nc1lkTBDQO+ud4RCD2dUrVc8Xa7BlfSYthQ9qfPHjb7bElA7E9GqzUit0nTl+onZvHjFZmbf03MMo12Zl57PKpRdCbjnUXlZaStgkhOOeXfOxmzHeuyvoFZvad6b5z1XVVJEUwxmn8nGEFZXt82rDIkqp7PxZC6J2EVqJBn3+t4m87AfUWe5Lo9o+4dUfbUbfcN4ObAKq+ZHUPM+W2gLKAnjkYp0KnDq5TF+zvuld8DIhLQnwoI49mgtZusawW25q1VEadRK0nuDZwcGAQ+33qze0IbGK0KFjJ/7VAtBHPiU+o9I7Fu4lcwdUUS2gUG528fuTz6sf50c=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4044
X-CodeTwo-MessageID: 20190219112035.8a33417a-e6b4-44f8-b23c-2b18bf82ad76@eu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.236.92.113; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(396003)(136003)(39840400004)(2980300002)(199004)(189003)(316002)(6512007)(5640700003)(23676004)(4744005)(31696002)(14454004)(508600001)(356004)(2486003)(65826007)(6486002)(6916009)(99286004)(25786009)(64126003)(66066001)(65806001)(65956001)(47776003)(3846002)(6116002)(186003)(2351001)(26005)(106466001)(6506007)(31686004)(50466002)(8676002)(2906002)(2501003)(102836004)(246002)(106002)(486006)(2616005)(44832011)(126002)(476003)(5660300002)(7596002)(305945005)(74482002)(7736002)(7636002)(336012)(8936002)(42882007)(36756003)(58126008)(386003)(436003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5482;
	H:eu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass; LANG:en;
	PTR:eu2-emailsignatures-cloud.codetwo.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2d57efec-f860-41cd-42d2-08d6965c43de
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(710020)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB5482; 
X-Microsoft-Exchange-Diagnostics: 1; DB7PR04MB5482;
	20:5uYcMxE5PkMElxR4G5w6usydbTiWWVGv17j96V6NThu/TZ0ARhfSvkys0oWpT2pwAB5D/sjGrLfQvoK+0IORapttNsdUEBZZNnfh+E2ctCKd2fQ88MdY3WQSayEmEyRUyw/Ps0VVUKavq65eoY3CuEQdt/xMlEd2sQNl+y1sK0c=
X-Forefront-PRVS: 09538D3531
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjdQUjA0TUI1NDgyOzIzOjc5UWJnZmdabTMxQWJseDFDVXJnc2YrWW1p?=
	=?utf-8?B?cEtHZURKcWwrY3lkZlpGRFlod2Z5NXFjOUY4dnlsd0pJY01MQ0xzNnJtU2hj?=
	=?utf-8?B?c1A3UDlJb2tlQU9qSW1CL1lrRXNRTHNIZ29XWVp3TlY0cmp6TTd5b1RWbzc3?=
	=?utf-8?B?MHg3QWVTekU4ZU4zQWJwQ3B2a3oraUkwbE1UM3dLMTduWlJodWkvK0RpZUY0?=
	=?utf-8?B?UUV2SkpWZ0N2WTZPMHNpb3FBK0VIZDR4Y0ZJSkFxc2dNOU05Z1NNVmNPVFpo?=
	=?utf-8?B?TVhvZ0xORXVKUGdhWldLVzQwQVNRL09tbngwV2lZRHFjWmdjRG9aRnJYUEZX?=
	=?utf-8?B?Vjlob3BJOXhMb2dPTEEvd0RyUnFFc3ltN0trYlJ4RS9zb2FMbmVZVnZXZ2tj?=
	=?utf-8?B?REN3cEVOcmFaZy8zZHE4emRPM2h4VHQxRElBL0FlQkhqZnkrWFhSbm5Gek9w?=
	=?utf-8?B?WTF4SGM2aEpQUnNZSVVlNjcySnFJU2RUZTBvc2VpNDFHQ0VGeFFEUG5YK3kz?=
	=?utf-8?B?a2YvOGJGSlVRM1VKZGlSb2ZreFJWdXBoNUUvYXU0OGZrekg0OHJqTnVlR0JQ?=
	=?utf-8?B?akFON3hMVkJ6Snk2UlZqUTFHa1dYMHgxY2VFZC9JQjBrRE5xaUpxVzl0UjFw?=
	=?utf-8?B?cElXNVdiY1g0clVUdklrbG5INW1haGY5bXNlNVkzZTROaGFYQW13Wk5PMy9z?=
	=?utf-8?B?cGlYYlJjMlk5WmU5Qk9mZFBaTmNuR1FURXh3NjIxMHpFOGtqVmhYQ2kvWEFq?=
	=?utf-8?B?VFRsRGdESG82TndadVBpTkp2WTh5bWcwRGtWN1VVOFFNdzEwUDdvL0J4WThz?=
	=?utf-8?B?Wk5YUDNmY3NNSlNDUEM4UWFFY0NjUDR0SUFmdVA4ekpleUlNMG5iRDVjbmlB?=
	=?utf-8?B?aVZPejIvVUxWM1krZjduUnZ4RzgvazJSd1MrLytDMzdQMDJNaDdpc1pqbktn?=
	=?utf-8?B?ck04QUE4SVJ0UmtUUmk2YkZuSVErWklZUWRnSC9LOE01djdnWG9nV1FBNjBi?=
	=?utf-8?B?ejZaN1FTZmpqT2I4Q0NFOW45ckNORm85N0c3bDBDUDMyNGg1V1d6Nk5WcXE5?=
	=?utf-8?B?c0E3L1EzZkhnUE1pWVF5dm9uWUJnMTZWaEZXeFZjZkpReFZtcWtSTGYrd1BE?=
	=?utf-8?B?RWY0aXV5cDR1MFlmTzBkZVdmaXIzNGVuc2orcHVHTndXRm8xZzlWVExLZ1dr?=
	=?utf-8?B?eWUxaFlCOWM3UXFUMnphaUpBZUpxdXprbCtlUGRpcm1FRTM3RUk0bjZEUjFn?=
	=?utf-8?B?Rmk5VFVVdXFacFZzMGM5empFNDZiaDFPWGlqUExEQXUvZ3gwcFdpSnhIUFRr?=
	=?utf-8?B?aXplNlZ2NDFVY1pqL3ppSngxaUxXUU5KZ2E4a3dVQmd1bFp6TkRKZzlXN3Bt?=
	=?utf-8?B?RTBlanF4NTZIVGIwZDdDa0dHd2hwTlV6UUNMZ2RBRTBhb05qVG1Qc3FSaHQ1?=
	=?utf-8?B?cm9jd015QjNlV0YyU1N2VC9KNWdUcExzL3lTNjNjd2ZNUWQ5WWNla3NCNGFz?=
	=?utf-8?B?UEF6MlhqMy9yaFhmMHNpNTI2UHM1Rm5tSEFuQlBCUUFIckVjTzhVQW5JWlZ2?=
	=?utf-8?B?U3JEYk1Oa0VBdlNia1poNUJpSk1IbXovNGxaeGZhUFJmTStBTTgvRTc5STRC?=
	=?utf-8?B?V09zMnM5SmZ4YzRRZG5aVXc3YTZ2U1BCazFWV2ZPdGlTSklHaDVoWmNjL05s?=
	=?utf-8?B?VVlpNEJEME5kQVZkTE9BMGUxelYyMHFRTmpUUy9TQTA5STFvY3VRZGUyZjVX?=
	=?utf-8?B?VHRqR2JNSVFsZGFPWE4wbFJJZ2tUNTMvbGJJTExxdmFJSG1YN0tldndHcGdJ?=
	=?utf-8?Q?GTpRJBicEP1aO?=
X-Microsoft-Antispam-Message-Info: eCWcMRI2HHtdoAJclaOK9OHonzrArXFOI/QBRdh6Gok/sxxVwSsfZzBY3k0i0aWiyzBhD64ui9xYDiYORhDXJ8dhWACL39Yg2OTqYHCX6rd6rvc+i/Lu9qLZ3B1GaAlAqCXJlRYm9nwJIf6SK7NaN1m0eODRHSVf0kdOdinMn8RWa/kNbv6mjJZgzwsrWOiI/KxZlcwaqHO+j9+71EHn+/F1Ywtgd0CdDUdlnOfTrj+7L66OuLsITSPhYe/t6WWsknZbh6TC0QTt2e/5OL8SjcErYa4Z0RIWgwl1NryoQS+vSRE3XWS1LU97lJSrcHrjLE/01TDErJO+WjQi2WT3nphPiOr2wHIzfeb69VYRVEx8mSKMoJqvdr7ZNbEob/ImPjmY47GPeGtF59q9EfoHBVrc6HCBD+kZdefVSUjAjx0=
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2019 11:20:39.2406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6c399b-2c38-4d5d-30e7-08d6965c471f
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.236.92.113]; Helo=[eu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5482
Subject: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Tue, 19 Feb 2019 16:54:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2975704E6A64AB468075B723602524B8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

VG9vayBtZSBhIHdoaWxlIHRvIGZpZ3VyZSBvdXQgd2h5IG15IGJvYXJkIHRvb2sgOTAgc2Vjb25k
cyB0byBib290IHN1ZGRlbmx5Lg0KDQpUaGUgaXNzdWUgdHVybmVkIG91dCB0byBiZSB0aGUgZXh0
NCBwYXJ0aXRpb24gY3JlYXRlZCBieSB3aWMuDQoNCk9uIGEgIndpYyIgY3JlYXRlZCBleHQ0IGRp
c2ssIHRoaXMgaXMgd2hhdCB1LWJvb3QgZG9lczoNCg0KWnlucU1QPiBsb2FkIG1tYyAwOjIgMHgx
MDAwMDAgL2xpYi9maXJtd2FyZS9mcGdhLmJpbg0KMTkzMTEwOTIgYnl0ZXMgcmVhZCBpbiA4NTUy
OSBtcyAoMjE5LjcgS2lCL3MpDQoNCg0KTm93IGlmIEkgYm9vdCB0aGUgYm9hcmQgcmVuYW1lIGFu
ZCBjb3B5IHRoYXQgZmlsZSBvbnRvIGl0c2VsZiwgdGhlbiBpdCdzIA0Kc3VkZGVubHkgbm9ybWFs
IGFnYWluIHdoZW4gSSByZWJvb3QgdGhlIGJvYXJkOg0KDQpaeW5xTVA+IGxvYWQgbW1jIDA6MiAw
eDEwMDAwMCAvbGliL2Zpcm13YXJlL2ZwZ2EuYmluDQoxOTMxMTA5MiBieXRlcyByZWFkIGluIDE0
MjYgbXMgKDEyLjkgTWlCL3MpDQoNCg0KSSBjaGVja2VkIHdpdGggb3RoZXIgZmlsZXMsIGFuZCBp
dCB0dXJucyBvdXQgdGhhdCBBTlkgYmlnIGZpbGUgd3JpdHRlbiBieSB3aWMgDQp3aWxsIHJlYWQg
dmVyeSBzbG93IChhdCAyMDBrL3MpIGJ1dCBpZiBJIG1ha2UgYSBjb3B5IGZyb20gYSBydW5uaW5n
IHN5c3RlbSwgaXQgDQpzdWRkZW5seSByZWFkcyBmYXN0Lg0KDQpJJ20gbm90IGtub3dsZWRnZWFi
bGUgb24gZXh0NCwgc28gYW55IGlkZWFzIHdoYXQncyBiZWluZyBwYXNzZWQgb250byB0aGUgaW1h
Z2UgDQpjcmVhdGlvbiB0b29sIHRoYXQgY2F1c2VzIHRoaXM/DQoNCg==

