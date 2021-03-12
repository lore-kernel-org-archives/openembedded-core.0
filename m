Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.47])
 by mx.groups.io with SMTP id smtpd.web12.5246.1615533744294238271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=sa+vcjPy;
 spf=pass (domain: topicproducts.com, ip: 40.107.14.47, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRVpYhEDOmRNffQbCmEgkHtwhBFLKXCz/3cFjw5Wus0=;
 b=sa+vcjPykRGPXvnvUhI+HBS2cYTBUZnrRLOcDqdWNuRfWtN7fZsgXkziVYC9WDHi9o9K4/cjle8+zoc4IgU+C8nbtUqRh0ddqdnHuCuI3GRtmAQbx6KcaYzIEAAKQBEDsltpnH40KdDB9qTO/V5wkzfyqrbK9bzP/hY3Jl1BSPM=
Received: from AS8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:310::17)
 by VE1PR04MB7293.eurprd04.prod.outlook.com (2603:10a6:800:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 07:22:20 +0000
Received: from HE1EUR01FT034.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::b4) by AS8PR04CA0012.outlook.office365.com
 (2603:10a6:20b:310::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 07:22:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 HE1EUR01FT034.mail.protection.outlook.com (10.152.0.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 07:22:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.53) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 12 Mar 2021 07:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZQJRR8k14gCm+FHNrrGCrsKNStxAyifFpvuAnkSfg+GIxsdgm0+N30vsJLNL1NTyXQIVI0uTTe2+s03sAT6XP8cxpVTyQW3iC1loXtFKCG4do5bkLRC3pgYYtdncF71vCqdVCRfRuwZn4Wn39cbumzEfISJPbVR9FxLdkL5R9D4BLWFfePJS8xbqckSCj99vFDDE/ibAv25SKxAoysn3G/CF0iQZdngInij8B7PKEORJVu2vSZhxJ5qEjavMIEzpUX2iLTV7CxIqYkTOLtV6CZ+svZxPAYTEI8/ZaTfz8YXxtQQ6PDoHK+hsJsgPml0B5H7p4sVYqjzh7OXmaAjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4IvW7E30IeqooQpyT/TZ37XHPMFbZVfJFNNaMCw81o=;
 b=mlaE2T14We3zbPu4Ijl1jVFX6X2K4mzn0paFnxCNnPTHKddfyD96j+SWJIscZKGAAsPObPh1mQtonwNfn2KkFW/s8IDeP91NNod4BSnNrrRPkzVNyJD/ZAMnt72G4zDYLI03flz50aOQw7AokeKNqdshvqBS122Gfd8snlakPi0vAyjdBqjzZI0JmxHtl/SH5GetYf59artM1ggjK/+BWFnugSTRQAMr2v9Rl75V826N9yiaVXzV8l8FnKLF1JtI/w25Jz9pl3PaLwciR6wPTEMAaOMnisjjNEtGFBEOjrRVh+vgKXxhqPA2uiFAduv4xC2FQUF2Zj5ubbx8KJmvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6427.eurprd04.prod.outlook.com (2603:10a6:10:10a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Fri, 12 Mar
 2021 07:22:13 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 07:22:13 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
 <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
 <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <9af0d495-c07f-2ea4-4084-bb24fad59747@topic.nl>
Date: Fri, 12 Mar 2021 08:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR10CA0049.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::29) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR10CA0049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 07:22:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2255980-94e9-4a58-9066-08d8e5279221
X-MS-TrafficTypeDiagnostic: DB8PR04MB6427:|VE1PR04MB7293:
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB72939C2B94F2F19E6105A5A4966F9@VE1PR04MB7293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /YYz38C6FgDsPqR4wNiqSW+VJqajr/Xln6FreAbidPO65jbT+zT7zpWefsSlTtM9Ib5AmIV7yqOB8qbY9LlNrxhUN/dqjZuCiBYxGox7XqY6MY0bUE4jSv9RARnAwzADXX5xkldCbXrgBeEXHEHZ27Xhzp8wAoSTNjQAvBNi1hKYQkQ4r4sP8dKonkbQPFCe0jtVKB8m6pCICHGJzFMUuCHxCZLYxNvOZP6tXlHTDRP+mRIU3jYFLgsKeBc13tqdfWauFMIMAM5jyqbshLNDlZAh45PKYFvY1vXK0jBEsDfvvz0tglepOGPPj633dq3U2HsYts9qU28Dfboc6dyTOUlk34f96eCMNtn77MA3ORZfjk8DFpgdIP5so5Jqho/gDF4ZEVz+q1TQxXQkdGDXxz6mOniGCN4FVcl8qLl1r25tczVNwq1yKOEZUXr39D6SFij7mh/6TimJgIMHWh0nTXR1yHB0eOnahnv1ZP2ggZbJJuwaewagtQU3iirqNPj7HwponKHoK+6TdmvEnnZ/uFtxg71zm5HZohuIhnPEJf2hEV3s6cIhWpn86HRogVgxsbNn9ZTwhhBrIkNRcEBd/fDeEP1FfrqZYAPO9cbjauI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(39830400003)(396003)(346002)(8676002)(31686004)(52116002)(6486002)(8936002)(44832011)(478600001)(53546011)(186003)(42882007)(31696002)(36916002)(16576012)(26005)(316002)(36756003)(16526019)(66946007)(66476007)(66556008)(2906002)(83380400001)(2616005)(5660300002)(956004)(83170400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VC9nZm5nOXlNSmFMTnFwWVc5TnExSGlOd2pmaXlNQUVPT0lEdUV0WmhqcXM1?=
 =?utf-8?B?eGcxbUFXUUNxQnBZTHkvbXBtWS81eUs3L1NrQ3hoT05kYTJRSHFSNklNOTBB?=
 =?utf-8?B?UHl3QVdxMGlIQk81MlBMb2pSMWtkNnEzVVRlK0FURmJBK1hQMU05eUNTaHEy?=
 =?utf-8?B?aEhia0k1U3VsM3pWR1lRWXFlL092N1B1aVR4Q2ZkRXd2VDUwYUFJSGllQlFj?=
 =?utf-8?B?R0xEOWIyeDFkdUZ3L1NYZGRCUEdUQy9RZDNpYk84a3h6cUZoVW1wSTlsM0ls?=
 =?utf-8?B?eTZvREJKdjJoaHNuNlJaM2tucU1uSnJVYjU2bzFMaEpUZHJvR1JNbFBZbTlX?=
 =?utf-8?B?S2FHTjVlM1dBY3QzRmtOVTVRQjNKaTIvTEt2dDlwNG5ydGRUWUZkeGxCdkls?=
 =?utf-8?B?eExtSXFrNWJrVzhDT0I2d0JRbTRZWHVrSXBzbG53QmtKNlpwSjdXQ2t5Wlhv?=
 =?utf-8?B?U3JVdHMwcFBkdkl3UGtvbXZUSHJuMEd3Qy95SjRWKzhYRWNMRm5kaUd1NFdF?=
 =?utf-8?B?RFRjMU9yMVVIUlBDTDV3VTYyWnZNdjhSWjU1MEgyeTUvMnRUMlk2R3N6VUpB?=
 =?utf-8?B?RzJQYittWnJzN2E2Qjh5UHhjNUdFM0pYR203Z043MFlYZHVEQU9mb0dIM1dn?=
 =?utf-8?B?djlwNFVHZC9DRHNXMFN3TW4vM1ZvVDNlb0JmWmRGN1FLRTFULzJnR0ZOQzdq?=
 =?utf-8?B?SVlzTFVhN3NJMGhqYlRNZWcrUWwrcWQxQXJIVlUrUHh5YVJtcUQvUnJRYVFu?=
 =?utf-8?B?azBtZHBrTXViRWd4aVA3cHFIYmhmS2ZLQjZnalUyaXdlQmNzWUFRUXV0eFlM?=
 =?utf-8?B?TDJLVVNBdUJRblVtN2RYVDltc1lpaVh3N1dmYUFvaTNKNHZxOXhXNzFDM1pi?=
 =?utf-8?B?cjcycnRSSnYzb0Rtelk4YitrUnkxWmRRNlRVQlBvby91TS9NdW9RbVJIdzFJ?=
 =?utf-8?B?TFFwVC9VYW13ZTFnN0x3UXFZbUM0djAyTXJ3d2ZTUlRzVzVMazFQWU1QY2cv?=
 =?utf-8?B?QytoQ3hrTW55MW9aN292Z0szUSt4c096YXJodnlnYWxybkV6TGVaVkg3bVBF?=
 =?utf-8?B?NTBVTGwyQlZ5QzY2dEoxbGw0Y2ppQTE1MTlKc3ZDTFVLemx0cmNIdk1sbWsw?=
 =?utf-8?B?blBXcnlXVzc2dzFPOHVYR0tCdmJ5U1lObkRMQXVidlJwQW1kTmczdHYzdjRi?=
 =?utf-8?B?N1I0VE0vWHE1K2VCZjhmM2RHUFVRVzNnRnFyejMzUHJHMXo0dW05bHJ5ZmtL?=
 =?utf-8?B?d0tpWmw1Y21YZkFvaVB4MFVESld5bEE0UUZZM2F3ZVFVYU4vS1I5TXNKRkRv?=
 =?utf-8?B?U0M0ZW5wclhIZmV2M3B0RXUwWlowRGYyeUVZSmN6UFd2NlZFczBPdEF0ZDI2?=
 =?utf-8?B?QVRHMzV0TEU5OXg5VjdxbVdkaDBjV2g0R1p6dmQwQ1Npc3Z5SmU2U1RaL3Nj?=
 =?utf-8?B?aHM2bkFOS1Z3SE9IYkt4bVpJcUhQeTlNK04xejhMZ3JyT0U3ZHZLRUEyY2dI?=
 =?utf-8?B?Y2ZMbjI2Zkduc2ZXOGJDZm9KcmIwR3VvZ05mWktsRWNvQ1F5YkhkMkZWTFJS?=
 =?utf-8?B?UER1eU5kanB2V0FIUm1ianBrWTk4ZS9SYkhTQ0huZ2RvK1d5aGFzd3gwaHNX?=
 =?utf-8?B?WFVMRkJqdm9sNjd3Sm9GNXB1NHhBTHdPaVFJdkxYdlhJZ281MHRHaVN1Zy80?=
 =?utf-8?B?d2RZc04zMmZJc29DMkxSaXFSOGdtZ3k0UEJJU3dlTmYwMCtKbXlBeHZDaFBZ?=
 =?utf-8?Q?SKofwp8aSq5+k349H02A7vgwg2ya7dEJ32NgPJ/?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6427
X-CodeTwo-MessageID: 50470349-bc00-4bf2-baf5-447d360248ed.20210312072216@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR01FT034.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd13cd81-59d9-434e-3c06-08d8e5278e90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yaC3xZoxjTQGyYBBX7htLhpj99FtdHomNkKi+oa+P7b5w+ycZ19vSnsb6m7vxdw+uSCBECUP2YBDmK3H6PbVsTUOfxxoFblyPj1HRVApNCG8Mlocqb61QUIBKcrVeiZGSZEzSDNKirCFOEjzwB8WIdwwGbgVKqYm3gRFAMg0Z2SZIXA/LWt/dm/Z2ibLulNsG2lW2Xrxo7iktbSGv4zjcGW5/t8k3ZBEL2hDffFnqQXqHVQLtt2o5nySEgTEdwARFsIz9DH5/ctp2+LyrfKh7UC71tDi7Lya+Q/43ji/SvTpOOtFMMToafkN74vK2UVYpappQzrHb7KPG8D1FtcQ07ZEQ9nggHFJ8f6hupD3MS8uJSh0yLvRUsRLgE/dK3tFK/BFfd9tl4Vw5bVNMtCQLwmqKsQMG6FpZgMi55qJQEbgPskXWlp80uZcM/H4UZ5u7UGt0KxCc10hkux46dcejJlCvZ8cixYtu85+JvbNg1x8N6kOF3i2C/fzrJ+O31Y3tOf/7cXrHBN7QBC/h/shIeHF6OHbc+P5cJiEpKD5IKhnK5odOBVtpEWRp8PDlN/DRpUhhz89/LD5TJfL9XWAh97Q0yrOS6ILOSwmtfYx9gBVRgbAqHsguB0QWnIzv0rP9m0tvWoFc0IHst+lKjSl9Ije1W+iUBkbdG6MNWxnB4Nno5enGm1KsBiO/MDYV3yHWKTeTYkkIph/64GovssuwA9C13FLQswxKRjXIABoQZZs5iH5AXs+58/Kq8ttNwFSCFwHdBaWg+QJK9ixkHo3uQ==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(376002)(346002)(136003)(39830400003)(396003)(46966006)(36840700001)(7596003)(6486002)(36756003)(83170400001)(356005)(8936002)(2906002)(36860700001)(31686004)(7636003)(26005)(47076005)(16576012)(186003)(956004)(36916002)(336012)(53546011)(83380400001)(16526019)(70586007)(31696002)(8676002)(5660300002)(70206006)(2616005)(478600001)(44832011)(42882007)(15974865002)(82310400003)(316002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 07:22:19.0254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2255980-94e9-4a58-9066-08d8e5279221
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT034.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7293
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
On 05-03-2021 00:32, Randy MacLeod wrote:
> On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
>> I've been doing quite some tests and things last week, my conclusion=20
>> so far is that the latest gcc seems to trigger a bug particular to=20
>> this CPU. Maybe even this particular batch.
>>
>> Hours of testing found no issues with RAM.
>>
>> I've also done huge amounts of builds with zeus, no problems.
>>
>> Then googling for "illegal instruction gcc ryzen 1700" reveals quite=20
>> a few threads on something that sounds suspiciously similar. Though=20
>> it makes me wonder why I never encountered it before, since these are=20
>> all many years old. I did try a bunch of the suggestions done there,=20
>> but so far no luck.
>>
>>
>
> Any update on this bug Mike?
> Have you opened a YP bug? If not please do.
> I'd like to see if the problem still happens on master.=20

Interesting.

I just built the 64-kernel using OE master and no crashes, everything=20
went fine. With the gatesgarth branch, it'd crash at least two times=20
during kernel compilation.

So something has been fixed since then?


--=20
Mike Looijmans

