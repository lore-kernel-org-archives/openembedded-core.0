Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.82])
 by mx.groups.io with SMTP id smtpd.web09.3880.1615455840444942358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 01:44:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=gun9ineb;
 spf=pass (domain: topicproducts.com, ip: 40.107.0.82, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj7wevIOYN8/CNjgYlqdlBHfKyCGU0FAMurHd/31dMI=;
 b=gun9inebxtIHKDIetNBAp/619EnVVnGeir2dJR+e0wZ0IFBahOjXAfOTTfXRyyqOVw3OdPgSVCXlvP9XqsHiScJHMb7efD769sYaSfbOeBxw9pUTbsmc4H/mMUZA3d8arLF0wCJVJz5m75VzHMD1FEAg2DeihRZiaM8vzW8wp4g=
Received: from AM6P194CA0051.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::28)
 by DB7PR04MB5946.eurprd04.prod.outlook.com (2603:10a6:10:82::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 09:43:57 +0000
Received: from VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::f2) by AM6P194CA0051.outlook.office365.com
 (2603:10a6:209:84::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 09:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT046.mail.protection.outlook.com (10.152.3.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.30 via Frontend Transport; Thu, 11 Mar 2021 09:43:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.51) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 11 Mar 2021 09:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuM+pUEhyZUAG2YYmmgIsHIeTrbVdj4nP9mBgJZip+dvAAEyEF15Tz8jeS8VdZQ4Z432zqqgob0HohzejxNmyv/nE+AR1Euas3rhTqmojVF0qB7LPF9XlICWZ9xpNl+cM5OM564Ge96kjybhjrLtuJ509hMfucIWDiEa9M2XgXyXChJIlvAWImcVPhLNidRicjfel6c+i+Z+yF+ah5D3B8kKPMpbqWT5AO9+vY6SJBI0/S19SwFj4APJGtCxRNQipx/sNs6Xk9Dfcf7E1ejgVLlWvuj1wrhiUQdg1opch5nyHkbIlCWv2vCSSZ33wod85Fm6l5+yMrk957vftEqJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s5pUthIiT1kJxm9mqRmfgLbTCMV2Izb+gp7+XMDrrI=;
 b=dA0G2NyyhAhYARKnleYta7OFYvIH0MWEiUDjGEqujkeyLR5mxbzKATpaqtlQbfrLS7Qz9wFj4QhsG2b6iEPIjElfHrNst7NMvAuhgdxmv2h55aN/+SjcSlnszKLm2ChCWJJR9j+FTGae1oCRD77es4s39C/lfhvHX+lFKWqZ1btxuew1Tl8ncRnmm3E0CTPvKIKTMaCn1J3tktaS2HyS9ScCC7TY2Y/sX/T4WXCvgpI4kYW4q3fsd7vGEGMqkN0IxnN9gIqnROYHU1gl6yj15zIzIpz8qGJQ3xTaJVUHQFDS31ftEVPrkphBUtM3U3/PF6+rtf8Br+WzLlV7JBRRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB4252.eurprd04.prod.outlook.com (2603:10a6:5:22::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 11 Mar
 2021 09:43:51 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3933.031; Thu, 11 Mar 2021
 09:43:51 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
 <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
 <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <4a1bc66d-f5d1-a781-3488-32da37f503de@topic.nl>
Date: Thu, 11 Mar 2021 10:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM3PR05CA0101.eurprd05.prod.outlook.com
 (2603:10a6:207:1::27) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.80.121] (81.173.50.109) by AM3PR05CA0101.eurprd05.prod.outlook.com (2603:10a6:207:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18 via Frontend Transport; Thu, 11 Mar 2021 09:43:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95b20073-58ef-4b3c-7bc5-08d8e47230cb
X-MS-TrafficTypeDiagnostic: DB7PR04MB4252:|DB7PR04MB5946:
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB5946806394D8CCCA14EC8FC096909@DB7PR04MB5946.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 I8Pb4dE7RdUqh6Mbty/q9JO+sA5YiimQjpf5A94TDIu/BCvDKJH+413X8FdqYj4LEBJSs/qGa4Fjn65mKYtbYfXrCozvYq192ch2izbDrxT8+hwpSqgZC5/pSfb64JAD2OHZf2CzBRWTZ09wlb7Zj8fGlDRVEYA/BwO5wXXhBVQ991fyTVhOkAVX2TBxgXBvHmXss/egNpmfLX9xJ1q5Y6IBK3AaNPVdZAeH64IGnRGDwBZE+IhfZYVr+35dR6SKJCLjBjIaTvQlwQPR/Vhef5uw1n0hAVcd4gJ6kjy4x2DPlVNiOtRM97qA+frPFwv0FfbN3ebUKhlEgvBJSwE98N4hS+gto7qd0hstihH3P2lrQ1dJiD5tTMO/XC73wdF/AtnO7uEk0W7EJ7jYwYK92A+TI9AZ9l20zFeIJloDWd79iLMOJEPzxesJmy4acRBqLGlMJIArpqtZAXuqJ7l56UmKBu2jJsAqF0PvM6OVU7tXyIzNltBNjU7KwYfhAmu/hZaVnnSSInJ/3iCL70FS/GxbYwhCCZkcMg5nXPC2nqlDTv2+PiUgk0zC6tVaecWDcSnOz2Z0spyUkLzHHLgTG+0q9+6VFyzJmQKlxv3wMIIMw6nAclMblq60nGKI0OWxgWPiPJV9GtOd6ptPJULM3CeLHYDeCAWbrTVlBlsQs2LaA23zWQjZySSgYPtZuTCa
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39840400004)(346002)(376002)(136003)(44832011)(31686004)(36756003)(15974865002)(956004)(83380400001)(2616005)(83170400001)(2906002)(53546011)(66476007)(26005)(966005)(5660300002)(16526019)(316002)(8676002)(6486002)(36916002)(8936002)(52116002)(66946007)(66556008)(478600001)(186003)(31696002)(16576012)(42882007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N25sOWxhUThkV3pwRXBMcnQrMVMwWDEzN3ZWU3BlMFNlaFM0eWxtYUllai8v?=
 =?utf-8?B?MzA5a2NEMVhLbkwxSTFwbFl3bmx4dHpxTEg3WERmK0tLSm9TZUNmQkNSb2hB?=
 =?utf-8?B?VXBQbkVwcTQwcEpna0JCUDhMSmg4Y1d5amNwVm9vYlFCY1NnWFFlZTV1VHY2?=
 =?utf-8?B?TmZ0cWlhUUJZaVlnRUtPYmtkMklKT3FqMmFUZ294UlpQSXpRb1h2OUJUWTAr?=
 =?utf-8?B?L0NuaUh2N1d6cTRNOHRmbUtQN0xLWHdEUjZXVHY1cStqcXFqNDYrVUNUdnlC?=
 =?utf-8?B?dzFIWjNUN0JOMTQ3YXE2NWdIbzkvQk14OHNxYk84WmNjeVgxUnh2c29NWEpN?=
 =?utf-8?B?NWJGVlVkTzlQQ2NCdE5sbFpWVzBEbUNwcU9VdnB3eks0TDhYVmh0TTNRVUhQ?=
 =?utf-8?B?YTZqelZwa1ZoVDlUaDBFdUZ6ZXFQSURURlg1bDFueEwxOUdqNndWRzhFRGRR?=
 =?utf-8?B?S2ErNEE5V0wyN1FlWEVJUzdxVlpoTk9ZNTl5dWpnL24xbzgrVkJTWHFEMG1Y?=
 =?utf-8?B?M1E3WnlQY3VGSUhJVXQyTWtZRVM0U1Y4NkJLZ1k5emlwZTM0K2lyQUQ0MUpW?=
 =?utf-8?B?OWwzOGJ4UjArS3BubUV5R2dsVFJnUFh3TFhUa2JvSmVaNnBIQm5LQUxTNkJG?=
 =?utf-8?B?bTV5THZUTURjVmd2S3B3Q2hHZ3JZRkhTeFFKV3dJOUtQTkdkTnlLRGlvMHI1?=
 =?utf-8?B?TlBzSkhzc3ZLVUtLRld3THdHVm12SXdWNzZicXRUTVIzLzBLcS83aXJQVGJr?=
 =?utf-8?B?R291ZGp3UFRCY0orOCtrSjZlUndYT3ZBUmV5SmVvNnFtSk40bldLWXVsdVBQ?=
 =?utf-8?B?N1BpZzdmOUFmMTgrcVFBUkM3NlVlQWtVN2lvMDJSSFltS3FiWG1TNEZaNE1K?=
 =?utf-8?B?aWU1R2ppYVhHQVgyc0ZjcnRvcDVNdWFGUDFlUll2bkozdjgvcU0vN1QzOWU1?=
 =?utf-8?B?ZDQxZTBraDMrczBsQmloS0dVOEFzam1CR0cxT2lkYTVUQ2FucmdKdXE5dFRw?=
 =?utf-8?B?OG5HamEzNmVxcnU0N1lJZVZObXkxL0JQNVBJV1ptYUxJUTdHRTJVT0pFSXJD?=
 =?utf-8?B?MklzQXIyUTZ4TGRSaFlsb0cvS0V5dkVZNkpNT2p4cXpqSmoxR2pZcVM1azZ4?=
 =?utf-8?B?Qk1sM1MrdXJlUGE5Q1NlSE1XUkMzMThRU296ZDMrTFlocnFxSHR5bUNyUXJY?=
 =?utf-8?B?ZVZxRVpWdUlmeVlFRm5jRnF0RXNlS3hTTmRBVDgydE8xcmZvWUZBVEIvQlI0?=
 =?utf-8?B?QXc4ZGtBbXdodG15VmhOYldiRXZXSmQ4QjFscTZzYnZybHpmS3BhSTZYaGtX?=
 =?utf-8?B?MzViOXdtWUp3ZTQ2d3lRSk5XazlGWGhWR1VxVndXQ3FXZEdmbm43a3drWlh2?=
 =?utf-8?B?ZElrZzB1UFhHN3hjaGUvbThSWWNRV0M4MG54Q1BHbVpwdDV6VWVaTXA5cjhk?=
 =?utf-8?B?T0JsbTlGZXdQLzk0b09TN3BRY3dHb0g5T1REcCs2VHBJT1BwNlNLRUtSdUpo?=
 =?utf-8?B?QVN5Ylllc3dWamxVVkphQmVZYUpucjEweWR0NzZMUFRKVC95aURVU25md1ln?=
 =?utf-8?B?eXlhYlN0WDhoOExFZ0VyNTNxNWdCOEc0U3lwLzlCcjRWdVFOY25qUS9kcFB0?=
 =?utf-8?B?c1BzaXYva0VTbXlmdGpQRHZqK1NlS0d4M2p0cGNiV3dIalczaURnNnQxTmRG?=
 =?utf-8?B?U1pKRm5ra2Ura01kbTFud2NyYlJtU0gzdEN2czdibEsvUkRab2pRWXQvOCto?=
 =?utf-8?Q?jkZIpOPFQ07q+x0sloEMz5iyZacq2lyrZRbJsgW?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4252
X-CodeTwo-MessageID: 8b99d680-201a-48c4-8491-7068cd72e89d.20210311094355@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1297542a-8860-4bf5-ec0f-08d8e4722d5e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NGWEEfRfnXKsBhRTcWgQPlGce4Lradvx0/gDrdYf5VU1ohKgqNkXKsAq9PKNFDl8HWNQHmpjxZKMQJFA5DEJD/clomWOvG+6GJNgV2pScSI2YHagnRlJE/lYuIkI4/ouMqJ11soyhMLEwq9p1OKKMTVBvTei+MJlD0CiczXs3Lh6dbV/4p6jxmNTOs5+apMKJBs8B8RPZUmrblA9dHz6cCEqHdAPwD5OHuoWCC/U91Y7ZCDfnopEzduUV2Ty1+wRiLZZhFrKlo4en0GFjP2sbGzn6gAsabK7rjGg3IEjcGn2g/zQHaUqRcrrG4CupQ22y0SaFMm+/fbokdrb+dRs3g1M0RGdoAB+JUQCRQaKv4SPnjoAPJZZ4z6tMLzSc8HqPubrDDSF6LQwWMRXK516pgaJ5RUVVMGV5mz5IX/w3s0CgcKoJqZ8xrHLYC60CuV9Y8XRblcvVu8TE10AfYFAMvCvvYcYz+rhndbecEV4qefr5/Sc345VBrE1u0cYh00XkWj1K/oe4r5xWpZMdIaeldENdBjLj1xPJzHl7kTIM9hVZcAj3pt2EkD11/B6FswiZk/zwS6BJS2Q1NjiNjrLXKTm5WmDFrYoZZGuPZRq2J4lPW/zdPaoE8pijMHjsa2kjZOIb2nMeGYrBUfS5qQj/Ez/FBEGYtLvinKtlYXUXqX3XBrhXKWZa89Sgek9i7OflebuzqjrkTTYGpRp0fkfVwBwYAtQsFqIGCP2PyrEEdcx9FnuEUiN4mHbJp9QlZU2BhqwUUJlNMhUrPNNjXCYzA==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(376002)(136003)(39840400004)(396003)(346002)(36840700001)(46966006)(336012)(186003)(31696002)(8676002)(7596003)(15974865002)(44832011)(31686004)(7636003)(478600001)(2616005)(356005)(53546011)(16526019)(2906002)(83380400001)(16576012)(83170400001)(42882007)(966005)(36756003)(26005)(36916002)(5660300002)(956004)(47076005)(70586007)(6486002)(316002)(70206006)(36860700001)(82310400003)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 09:43:56.7972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b20073-58ef-4b3c-7bc5-08d8e47230cb
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT046.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5946
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topicproducts.com

Please consider the environment before printing this e-mail
On 05-03-2021 00:32, Randy MacLeod wrote:
> On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
>> I've been doing quite some tests and things last week, my conclusion so=
 far=20
>> is that the latest gcc seems to trigger a bug particular to this CPU. M=
aybe=20
>> even this particular batch.
>>
>> Hours of testing found no issues with RAM.
>>
>> I've also done huge amounts of builds with zeus, no problems.
>>
>> Then googling for "illegal instruction gcc ryzen 1700" reveals quite a =
few=20
>> threads on something that sounds suspiciously similar. Though it makes =
me=20
>> wonder why I never encountered it before, since these are all many year=
s=20
>> old. I did try a bunch of the suggestions done there, but so far no luc=
k.
>>
>>
>=20
> Any update on this bug Mike?
> Have you opened a YP bug? If not please do.
> I'd like to see if the problem still happens on master.

So far I've discovered that this only happens when compiling for an aarch6=
4.=20
When targetting 32-bit ARM the compiler crash does not occur.

I've contacted AMD for an RMA for my CPU, but it's out of warranty now. I =
plan=20
to borrow a compatible CPU to see if that makes the problem go away. If it=
=
=20
does I'll just buy a new CPU...

As an example, if I take the current gatesgarth branch and meta-raspberryp=
i,=20
then building for "raspberrypi4" runs without a hitch. If I chose=20
"raspberrypi4-64" as MACHINE, the build will crash multiple times, typical=
ly=20
on large components like the linux kernel, qt and boost. It happens on bot=
h=20
plain C (kernel, u-boot) and on C++ code (boost, Qt). The same applies to =
e.g.=20
the Xilinx Zynq, building for the 7-series (cortex A9) is fine but buildin=
g=20
for the MPSoC (cortex A53) will crash.

A silly workaround is to run "while ! bitbake ... ; do echo again; done" w=
hich=20
will retry until it succeeds.

I'd be very interested if there's anyone with Ryzen setup who can reproduc=
e=20
this, or fail to, which is also interesting to know.

I also tried building in tmpfs and on a different SSD to rule out the NVME=
 as=20
a cause.

I'll try the master branch too, and report back on that (tomorrow probably=
).


>=20
> ../Randy
>=20
>=20
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
>> On 27-01-2021 16:10, Mike Looijmans via lists.openembedded.org wrote:
>>> When doing large builds, the GCC compiler tends to crash on random spo=
ts in=20
>>> the code. There are a few common denominators though.
>>>
>>> It only happens when compiling for aarch64 (cortex-A53), not for 32-bi=
t arm=20
>>> (cortex-A9)
>>>
>>> It's random and usually happens on "big" sets like kernel, openssl, bo=
ost,=20
>>> u-boot etc.
>>>
>>> It always reports "during GIMPLE pass: ealias" in the error, for examp=
le:
>>>
>>> | during GIMPLE pass: ealias
>>> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function 'do_x509_check=
':
>>> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler e=
rror:=20
>>> Illegal instruction
>>> | 1239 | }
>>>
>>> Compiling the same thing again usually goes fine.
>>>
>>> I've never experienced this with the zeus and older branches of OE.
>>>
>>>
>>> I've already tried upgrading to the latest gatesgarth status, and clea=
ning=20
>>> out everything and start from scratch. I've also run "mprime" test on =
my=20
>>> machine (over one hour) just to be confident that the system itself is=
=
=20
>>> really okay.
>>>
>>>
>>> Ideas to diagnose, fix or reliably reprodruce are more than welcome.=
=20
>>
>>
>>
>>=20
>>
>=20
>=20

