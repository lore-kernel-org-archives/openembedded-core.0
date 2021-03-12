Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web10.5232.1615534666869216706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=NDBBR5Mu;
 spf=pass (domain: topicproducts.com, ip: 40.107.20.63, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6MpBoXedUIW15ZU0XQa5/0Xe27eavUZTKunwm1nPWg=;
 b=NDBBR5MuUKzWQfPliWs8sSf8OBky21bTNMVKeXgBFsShFwgP9cV14bm7tzkGZFijoLm75CBH+VZM5YVFbT6uAs7QEvAIlMLZ7Qx3zd+Q4n1MEuC34548rBGovP5/eaSI+FLbkSeGqCYFLz3QqCVkYfUj4y2JLSDxZw6a+01a+qQ=
Received: from DB6PR0301CA0014.eurprd03.prod.outlook.com (2603:10a6:4:3e::24)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 07:37:44 +0000
Received: from DB5EUR01FT009.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::3b) by DB6PR0301CA0014.outlook.office365.com
 (2603:10a6:4:3e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 07:37:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT009.mail.protection.outlook.com (10.152.4.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 07:37:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.107) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 12 Mar 2021 07:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSC5nMllpmNktQKUKc/tDxUlWqPGkXCxcIZb/EXcwWFfbd1Ym2v/miCXUVOflfGaWh84B6ZBfgGW9+6mrZP+DIpbgpeL4H6WJwOWWGB+a4vlWl+icWLNLtVGSSN9ghq7fSpR3SZro/Oyh6cb7MUnF8IjFQEmQGxRCRcv3nggC0kw703BOCeLUtrgx7i+JgUDHKaBuc7S79TIOxyrpGdUjvZ+OcrGGmSY8A9jhVd0R9j82xrKAlzVVnRY3rDlz4qyPeMHfshs6GbCm8EUyd8aCEnQvXpjHW5qADIIBfaSUpb0zC/X6d5zAIH3Cjq79mWMzc+KeyJgpG8gLC7Femahhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkUALDFVYZRYXfL1uiPH8I0apNx4Y/CprCR61QOjMSk=;
 b=Qf8zPhbrIvxVZFyCkZmgM8q7orAkwaX21Mg2HLD14WLAWWEHI3/TsUGgBK7dwoz6iT8zaxURNcaIoTdYJ8dEaMjnt74jVtJXHwlsSesiyCSZrp6vhQqMAsN8KIzJuHUh2CesGa2RgwjWeNFadMdrRhGbT9zSaqXhhNgvYLwguTST5ACgrXWmlfDFzeonCxUfSGflQfqjyfCf9dzrC0vTOInHaNix/0Dbg7UJ4zHV5Ar+eDLBeG16lZ57CPdD3SnFq7qQrLPUv8Pj4YGAXxTfJiso3p8wV+PZ0pCYTd+IsmN3tcFlKEgXafwD15d6Xrnk23nvfrXQjgpYHYv8m9lcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DBBPR04MB7963.eurprd04.prod.outlook.com (2603:10a6:10:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.28; Fri, 12 Mar
 2021 07:37:42 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 07:37:42 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Khem Raj <raj.khem@gmail.com>
CC: Randy MacLeod <randy.macleod@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
 <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
 <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
 <9af0d495-c07f-2ea4-4084-bb24fad59747@topic.nl>
 <CAMKF1sqj+tfjzHDeJbaNjeg139CQgNKvhrb0gejDbuxk4TN-LA@mail.gmail.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <bffa6d6f-2620-889c-a984-46ac00d7ffef@topic.nl>
Date: Fri, 12 Mar 2021 08:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sqj+tfjzHDeJbaNjeg139CQgNKvhrb0gejDbuxk4TN-LA@mail.gmail.com>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR01CA0101.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::42) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR01CA0101.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 07:37:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa12f6fa-1c54-4929-cb6a-08d8e529b97a
X-MS-TrafficTypeDiagnostic: DBBPR04MB7963:|DB7PR04MB4875:
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB48752987DD79930D83B02255966F9@DB7PR04MB4875.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K6bb7R31BtGjD29rkkFAhOsi5WzyITGXF/f4LkSb7ZfTUa40PrPWyJu8kgXCojIInLtw40oLR4rkCWEBD3IerrmjemSjpCQRkXb7ntE3/vU7zR4t2lEVnv2y61+4dhrnk5OTOi8KrnKsXRxI0s/SOWfx4pN4cBfkR2xHyjGOTC1pGa82hmbHZ2ivlHC893NPlYka4BS/03DyInP7aYjRFNcrHHREa3dE4IUSfrr5SREJTb3T2fvfOuBNSE4/uXB5UfRbR0XPAds3XM3mL+RbT+EDJOt6F/W7XWdoxkhajvctEZJ8pLFBWJ7hz1+dW6MJ+3GTvw87Mzi3tGbQ0tFB8iUXovnNX5Ud1gfgZFdzaxgqLFNqdwsRCEw3POtsmJerWzRpMhpJsMZT7BBh/BIpJ02rWJjPZnSj7ntEOQwXlTphyijwQArjkNrsjbyvrstUGKh/LZYGXqVxnUDNNYl/HRDSTeNAqxtcEQ8WqMixvSLJOG8e0y2x+SyKsQjJv1LxWBAnibFRTjk9y7s2VU6dQmzBuZv54MI3cBmfraqAloWjirjfabwDtMjxdSxTbWCydjn1FhQ9aDluaKuqJ0YrVZGH9f2SihbV0+dWusJHwgGEVE9T2w5iSbIScZcllk8PZ3P+BUF+DGfXtn7c7YwiNqGRyzIzx0AOmiSLvW546pA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(39830400003)(376002)(136003)(956004)(6486002)(5660300002)(16576012)(66946007)(31686004)(31696002)(53546011)(15974865002)(36756003)(36916002)(52116002)(66476007)(66556008)(478600001)(16526019)(4326008)(42882007)(26005)(186003)(316002)(8676002)(44832011)(54906003)(8936002)(83380400001)(6916009)(83170400001)(2906002)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VlJVWEovV0xnYnVuK1I5MmJrZTJqL0poZ0dBUTBxZWN4UFQvMEVmd01BT2Uv?=
 =?utf-8?B?NTFlV2h0bWx4cmVxRTZwajVhU3ZCK2tEOHRYRUZmYXhId1IrRktsNS9FQ3Vw?=
 =?utf-8?B?NFFuWG9CbWorQ1EwTFZUck93bUoyRHBRN2p6QWZIaCt3V0VXV0pSZlV5UDhJ?=
 =?utf-8?B?cUwyemQybW9CTTY5eStueGpRNEJqdktkaWNZb2E3ZlZ2UW53bUkrcVVvdmM2?=
 =?utf-8?B?eE1Lc0plZjdiemhLcXd0Y3dsd2FmYTdUeUwyZlVlN3g5UE03dHEzcml6QUJy?=
 =?utf-8?B?ako4RTdzNGoxZ21XVWNMUGh3UGRIY3R6V24vUWVZWmVKZDRlMjJONkRwR2pT?=
 =?utf-8?B?QXFlbEZLVDh3MVFCcTFmSXIwcFFtWmdQd1VIb2N4d0ZoNmFKMk4zeU8xcnRn?=
 =?utf-8?B?Z3VRNjVLdmNvK25jZm51V0xLRWF6WUlwRGsvbElTcW5pZXB1UUVtZEx4V2dB?=
 =?utf-8?B?YUJIaThBLzRMeDQ5WFZkdDV6c2RyLzRRUjJ6a0dZckU2b1l1Y2V3Mzh4SnpE?=
 =?utf-8?B?bVhYL09yc216ZXpPSkpzcTd3aEpwTXlMWGNWYnMzVGJVa1FoY1gwS2tPQVB0?=
 =?utf-8?B?Um1mMjZpWFErVGU3YkFjSFBsQzYwOHFUYWZXaFN1WnhiRmhoZ1pGanhLc2pE?=
 =?utf-8?B?cmUrYUUzMU5OeXoyaE9aRm1jazNkL3NOTVpvR3NadlA2ZGI0a05pODZiRVNZ?=
 =?utf-8?B?bFZRcWZVem5XRVhZUEU1cTlOOFF5WFdicld4d1hKck11ZDl6MWVWME5yc2ln?=
 =?utf-8?B?UFc1VUhVQUNJRXEweG9QOWozY0lMb3haQmRESDFCMy8wYm9sRm4yMVVLbDJr?=
 =?utf-8?B?SmxLd1c3emxWT0IyUFBtUm5mUUloREtVczF5bHpKVk8rUW1ocXBFWkZzRk50?=
 =?utf-8?B?b3pGUVp0T0daVVRXN0JYdXVZVEdCOHNPZUcvQjQ1NWNnSUd4RTZuM0dCaHRC?=
 =?utf-8?B?RHhOdjFpblF1TGd1bkpRdWlmMU51MkxZTVlnTjgvOGVrTXZhYk83NGVKU2Va?=
 =?utf-8?B?c09VZ3lsdWozY1V5YkY5SUZZb2VxOEl0Tmdmeno3cDlhVDZJVGJFQzFjYUxU?=
 =?utf-8?B?Q1NGLzRqRVhacGFNQlJzWGRKNkV6YzdORWtRZk1MS1RhM1dDajIwbnEzamFO?=
 =?utf-8?B?VVA5TmZCQ3NNOUZoZlp5VVVwY3JoSkN6TTFRYVlWQ3lmTE5mdWpqNDNWeWdp?=
 =?utf-8?B?d0laSktXT3ZTVk1ZeWVlZWRYSWRFREhTRmpwdWM3VGpGanZtemc3cWR3ZGpN?=
 =?utf-8?B?ZmFHQ2ZsVkR4a0I2R09oZXBoTWI2MGU1L3FsN0JVZDhRVGN6VDh0Wld1L3B0?=
 =?utf-8?B?emZrLy85K2tRam9XbDVTZ0R1eGtHQlVCanpaMklScXdUZG5YeVpsQ28yaGwz?=
 =?utf-8?B?ekYvcWI5VVdtQTd0UFk0L3M0bk44ZEI3YnZRVTZ5MDlmUXhxMXZPdEpKRjNQ?=
 =?utf-8?B?QWxBL0hYTVVVNGM2N29JWDlhakxVbFVFbUNHT3Q1ODJ3SjVhVVgzMitQcjlP?=
 =?utf-8?B?SnNyZGJ0YnNoS0ZEbFd6V0dqOFlFS2RRRFVmU1dkejRrWjhtRlRsd2VjamRy?=
 =?utf-8?B?M1FQYVRXMWJtVm4rZDM5M3BLM2VlSjlkQmdQcmZ4MnZiRFM4WG8ycHJXdmpx?=
 =?utf-8?B?eGtwNWdTZXRTRHFUbnlRT1ZtbWdoWmZET1BrbU1WUXdWbmg2cjQzZWliNHpH?=
 =?utf-8?B?WmttK0cvYlZHYW5QWjVCUWhZZ2dic2tOVjJwTEFuaVIyU1ZQSWUvMk1ta3ZM?=
 =?utf-8?Q?ki6UWTbV4nHT04V9vlqs/e3zYz6N9pUQ72VFAOg?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7963
X-CodeTwo-MessageID: bc4f5ed6-2ddb-4231-9e3b-5352b71dae82.20210312073742@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT009.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9556f431-b6aa-428b-dff7-08d8e529b833
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9FdiF/DzGetapsBmIqFvjeWjxbzMJEDr2v76ZcPoWDIyVC9gAq4LaISTB8A+VO/IaDYAff3or9p9qV96KXRtBLGUgkZoSKzznv2/E71TbhUz3jJMaYI9IM+Zfo+oqOGMK404hzteRSZOhtEyLMFDnon69lAbwcXxgdroj3B7mxjni9lJC5FYo6Ucms00dcDzbkdISlViOctr7nQOzKjVk51ubFAsRoEFcASrVTF9beQS0cIDQDA+6mjjEzREHEtAR4waPB6PMOyr2AO6S8o4XUxRGPRt33vpmQwvhTePpNO0J9VvGY9w/jRGp8JqN2l/cikkhGokRqFDbetRxAhYn3AbSbYB79DeCr1vAN8UnWhVOVBkF+tBWazd28XAjXVW71tvoEKfy2CzNjgPqp/273KEt9F5NpeO1YUowIdmc1sBT1GhNBJTtTtXHyAgsQZi0ZI35fqRl1rO8EXVGTvaylJvFDpgTU/BlKIut1jQ5zIfubgv9gwB67kd3cDAxg6h/UpGK399kHaSME2WAq9d7+UV9SNwMYcO//A3JDW2jsaZ2fPTTI8PkVVT6s3Dg24GHba6XGo/p3YuCp4sw+i+G3xqBgllEwXIgii6MOblOxWr5yR6ty77g7Im8nS4MnOl2gRLgjZT/v6YkLb6jefjV9P8JhyIyjssYM1lkU8Fgi0PAgUokATDeIXP834a09o/l85siXTbwxJkqkcfiHoIMHXkU7CM4hbyci9HaAa80jL+9OHgSaMcJwkhohoFaBZNqVlhfjyg2KFmYtSRdwMuMA==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(376002)(396003)(136003)(39830400003)(46966006)(36840700001)(83170400001)(36756003)(336012)(6916009)(70586007)(15974865002)(8936002)(478600001)(70206006)(2616005)(4326008)(186003)(42882007)(2906002)(26005)(83380400001)(36916002)(16526019)(7636003)(316002)(8676002)(82310400003)(47076005)(6486002)(36860700001)(31686004)(44832011)(31696002)(53546011)(356005)(956004)(5660300002)(16576012)(7596003)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 07:37:44.0387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa12f6fa-1c54-4929-cb6a-08d8e529b97a
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT009.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topicproducts.com=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 12-03-2021 08:33, Khem Raj wrote:
> On Thu, Mar 11, 2021 at 11:22 PM Mike Looijmans <mike.looijmans@topic.nl>=
 wrote:
>>
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>>
>> TOPIC Embedded Products B.V.
>> Materiaalweg 4, 5681 RJ Best
>> The Netherlands
>>
>> T: +31 (0) 499 33 69 69
>> E: mike.looijmans@topicproducts.com
>> W: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>> On 05-03-2021 00:32, Randy MacLeod wrote:
>>> On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
>>>> I've been doing quite some tests and things last week, my conclusion
>>>> so far is that the latest gcc seems to trigger a bug particular to
>>>> this CPU. Maybe even this particular batch.
>>>>
>>>> Hours of testing found no issues with RAM.
>>>>
>>>> I've also done huge amounts of builds with zeus, no problems.
>>>>
>>>> Then googling for "illegal instruction gcc ryzen 1700" reveals quite
>>>> a few threads on something that sounds suspiciously similar. Though
>>>> it makes me wonder why I never encountered it before, since these are
>>>> all many years old. I did try a bunch of the suggestions done there,
>>>> but so far no luck.
>>>>
>>>>
>>> Any update on this bug Mike?
>>> Have you opened a YP bug? If not please do.
>>> I'd like to see if the problem still happens on master.
>> Interesting.
>>
>> I just built the 64-kernel using OE master and no crashes, everything
>> went fine. With the gatesgarth branch, it'd crash at least two times
>> during kernel compilation.
>>
>> So something has been fixed since then?
> can you try by disabling uninative ?

Probably, if only I knew what you mean by that?

What do I have to configure where?


