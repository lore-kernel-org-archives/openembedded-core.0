Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.89])
 by mx.groups.io with SMTP id smtpd.web12.4714.1614900774868891352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 15:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BJ6AMKXc;
 spf=pass (domain: windriver.com, ip: 40.107.76.89, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrDH/drrp3QXHHFd5R+Gr1yTRq60kKQ0g8hHB7l1yDlaecz6o5vShjRbgE2XoIVt1lGFvzOv3351asPGCYcft+SK/+vf52LnQd9CyrGb+x5OQ1cKVGuJtA4KZTBni45UYdBlqVlmWsDp0YirUyRe9qYEUm3TJk26QRx2/u2/SNtkWuM6LHdg/FGQZe1r8KekEU1Zct61uA5Wh8Udi3xSxpdxHCNnJ/f5/lp2rewUEsf6V4+iU1//iccaMpB6NzwUQbymvqgz2bvVG6NaOrWP5doJ5BeK+LyChUt8Th0I/2Z6cSpB43ad/GNLvzghnFawppQf79bFoKJqOwdKJSLJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYkvapmRVzEuqM65uWkDZKTJSwrge5WqPZ5JLSPWtFo=;
 b=QXipkqNn4BJGh7ESftoEkwtntrtBotPBgSKxwMDgy6XogICiNqA5kPempRkQpMT66SK1ZnBo0Viokl7o6xRAiaqhzMPF7EN5Na+dGy7cYmEvr5zMwKC33y5qY+G33AylmV9ptPvxpBRL9wZzDoJdwMWatduHDUFNiOpZDvoyIID66iRTyeHwIP/RiuQeHkPavRufQiGohpGrRzavAkiKJNx3oDIiXzC7ImZ3U7HNxMAs7rAjvpBdh/FNmfkSJl8UD2XfNU8OUqnPYAUl+gtDvupWIe3nP8/UCPEOUfK1JW5PUwbLS9Lbd3xxtgX/QgWfT2l9BOX08kGjYDThLwmWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYkvapmRVzEuqM65uWkDZKTJSwrge5WqPZ5JLSPWtFo=;
 b=BJ6AMKXc+D/fKzvBNXdCoOMgk1C5tF7HRZ0XRESckNrZC6LQbzLwkv7h0fJ/kF1KEYS7ejmv3E0nybV5frHd5C7Q8fi4jvODzWZpuVwxfUtW6tS97mNLnwPNXPQ8MCeK7PdkR6PZutTOHz7lM85GSs6KVCIdBnBSZdBwauvSHjo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3290.namprd11.prod.outlook.com (2603:10b6:5:59::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 4 Mar
 2021 23:32:52 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3890.032; Thu, 4 Mar 2021
 23:32:52 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Mike Looijmans <mike.looijmans@topic.nl>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
 <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
Date: Thu, 4 Mar 2021 18:32:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend Transport; Thu, 4 Mar 2021 23:32:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9770cf-6d25-44d0-357b-08d8df65d457
X-MS-TrafficTypeDiagnostic: DM6PR11MB3290:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB32900315FA56DC4EE38C4F55F8979@DM6PR11MB3290.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6YB5A6jDuYnwXyEoATKGqlZnfJV2FJZk0Ow2BE0+HX6nbjdYG02GiFKGXr7wyLzwRIYxlKsvan1aVLDIFHgiyVx2vPXbEZOuLu0xo/P2dnL72BpCE9cMGPlxqn8kIbWToHrzBtG6VnQEHva8kibTclK+Gurk8vKL3gGFSGNFxABlEzr8Cl8iyFncLDFXHldc7HNaveHww+oLhglgk9az632X+v1Kz//W5x2GsW6srRS/yurzxO49Uqa+3+eYM4SqgRQ1AUB4Dsh+I/UqxM70+fu+8pFYA1t8eWV8UcqL5jEi9WpxzqJrbgL01SpLcciETqqZLp8qJJ/Pltc3xhalxeRgpy4qLBLX5Ic3s3xVdWIXfcinJgTfjOV74OM/o8GpZJ70LlVHKr1rB49RrVkURHJ1ZB8r1l+qmzL+zKS7KWPzgR5EmNDXzVF9urF4UIcv8IG/o6KzP46J2bjRGXdHOkPOpde8YrKiiMZDqiyoWB5jFbOVnbqJtPNWEKj2R50eeKdTgZc797g1XmVR0E4/V08TpxfTj6QZe3IJTkzX7N9JHn0s5LXzDR8yeAB1cuZYFUEfqSWRQK+t4/T5sAvnDoRM+Cvu4UadvfJiLkEdAgIFGRYMRAcsvYUdJ67DTNVKKaB9H+4GJS/ycmdqi87Qxmt8Y8qs9SIW3/QXOfwZsotGjg9mMPfceP9GyFa7AJeT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(136003)(396003)(376002)(478600001)(2616005)(52116002)(31696002)(6666004)(36756003)(8936002)(8676002)(966005)(66556008)(6486002)(2906002)(86362001)(5660300002)(956004)(31686004)(66946007)(66476007)(53546011)(316002)(186003)(26005)(16526019)(16576012)(15974865002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TFZ0UEVHYVM5QnZCYzVsdWk5bzd0ZjlzUStlc1U4Mk5ESzhrVG9OdkQxenBJ?=
 =?utf-8?B?bGU0bW1ILzBRRXFTQVVEdGtZcXpxM3FGMytPTE5kVk1DNitYYnpXTCtLcGJn?=
 =?utf-8?B?MUlEMFlqNFU3eSs2TE5NNXBoNWttWGF0MXQzRTBnUFRSaEd1WUJGVWdsZy9h?=
 =?utf-8?B?RGtqMkF3YURzTHd6QTdHVGd0bnBYNUhYRnk5N2N4MUFMQjQxRStucmNJNnNU?=
 =?utf-8?B?TWE4MGxSSU5vRkpCdGZvQS9ORlNENmQxai90dFcxZ3RmTUhCajhVTktRa1hp?=
 =?utf-8?B?ejh3TVNHc29tMEVKR0R5UlZwRStsWTRHQWZ2amVyZENsYkFwdU1MVGd4dGI4?=
 =?utf-8?B?K0JKbThMcjhvSExVbzdKV0VPTTZmZnZ5NXJ6cEIrMVl6OGwzU1FkbVFWOW1x?=
 =?utf-8?B?OTFNc3pCajdNdUZERnVVNlhzcUhnZ25PRG1ncnpIcGRSSTh1SDhCQllYNmVV?=
 =?utf-8?B?NWQ1VkJWMTVoaEI2bkJNWTg5N3R6V3dhM3ovZC9WMG5xL2xCNTQ1WnF6Zllj?=
 =?utf-8?B?ZWg3NFRMV2tlQnZNWm9FVEQvR2xGWEJENVhLSDlnUUEzYlNlK05jVUFYNU0y?=
 =?utf-8?B?a0NRUGdmaFJHMUdJVXUwVTlBNDBLL0dpTUY4dnY2UUF6WXJyYXVxTmF1ZUNa?=
 =?utf-8?B?Q1pVV01FN21FUThkaVR3SDdJbzVuaFBPZHFSSXkvRVBkRnhsL2RJY2pxRmRi?=
 =?utf-8?B?b3dxa04xRXcxTzVQb3NvNVptMkhHSjhPNytYeExMSjhOTDhkRWR5OHowS0VR?=
 =?utf-8?B?WG92OEpKYWJWS3FQQm5Sa2srZXpCY2RiMEp5N0MxWjMwUTNhVDc4UWtZRVda?=
 =?utf-8?B?WUI2SXVqQS9UWGlSb1AzazVyUzdLSURaYUdXRkZ4cmd5U3BpWTQwWkdSUThw?=
 =?utf-8?B?eFpUbmFJaFFGTE1abXkvcXg4d1pGdWRoZGx0VGZ6OTJERHYzaUZrNEUzYXdt?=
 =?utf-8?B?L3BEOWJOaEVqQnJKVyswUjUvV3ZsOFpkZEZKNEVDeEQ0OVVyZk5OVUNUMlAx?=
 =?utf-8?B?TjJYVFhiRU45aU94dXJkRW5HK09ZODFYNy9KaFY5QzVKTXk5TGcvRnJ2ZHZU?=
 =?utf-8?B?cEJObzR0YU85UkpjOGFkOTVBK0VabWRMS0tHZVB1YTFqbWJzUDB0MzRFRFQv?=
 =?utf-8?B?SVZiWXpYNnN6OUxNQ3BwU1V2b1FMbno3OHBvL3haQm5TVE5uOURoWGNNdjIx?=
 =?utf-8?B?M0l1RUlzeUpnODhZaU04MTdHWUhyMUtEYm1PVnFDVUJtb1VuK0RLVGoyYTc1?=
 =?utf-8?B?ZWNtTGtnbEVwRHpJMUNOcW5leEx3WE45VCtwZEZwclBvYXJZQ0NlSEs0VFVK?=
 =?utf-8?B?WGtES0ZFWWw3cWJ2T0h0TVRubjJzdCtKNEdlY0NMRCtXK2IvS2dGeUhPeWlt?=
 =?utf-8?B?T0NSMlV1cnBUdVI3VVFOVEk5UnpSNEt6UWtsRDlYeEZJVUpFRHZHNGZkcHJo?=
 =?utf-8?B?OTFpblEyb1Z3S1VqTHZOQjZhUVcxMmJYT1VFZ2txcmZ4R2Rha3JNY2NvaUxh?=
 =?utf-8?B?T3ZRV3kxd2ZHVmNERUFaZDFBb2FDMnRGMUxaVnJpYWQzTGlTOEdOVVZ6TEVS?=
 =?utf-8?B?bjhQcjF0YWw1a1c5OXp0dlRNTFRXY1YxaCtzUlVHdDNqK1FMQm16Z2RpY1Az?=
 =?utf-8?B?cVBHNktCMnpSREU2UHdka2p3Mll5QnpUMmVsV3hJcDVweHJtbkJsZVdIcFcr?=
 =?utf-8?B?cFM5QndjOGJHdE1hN3pnRlRGMnZZQnNYWUx2MEZLZHNiVmQxRTB0akxNaVBR?=
 =?utf-8?Q?5XIFR8lHjbbm5iK/PhSwfMDTA8F2myr6NVQ4GWS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9770cf-6d25-44d0-357b-08d8df65d457
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 23:32:52.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yI9JhR+f0E29bTGJmTMBd5QtfmtPpsUQgCoEDXEBVxwaBQMNvwZhRoaT+U4igcaOGJUEUYjwJTlWa85W40WyJM217NONyoo64lbY2dXW0kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3290
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
> I've been doing quite some tests and things last week, my conclusion so 
> far is that the latest gcc seems to trigger a bug particular to this 
> CPU. Maybe even this particular batch.
> 
> Hours of testing found no issues with RAM.
> 
> I've also done huge amounts of builds with zeus, no problems.
> 
> Then googling for "illegal instruction gcc ryzen 1700" reveals quite a 
> few threads on something that sounds suspiciously similar. Though it 
> makes me wonder why I never encountered it before, since these are all 
> many years old. I did try a bunch of the suggestions done there, but so 
> far no luck.
> 
> 

Any update on this bug Mike?
Have you opened a YP bug? If not please do.
I'd like to see if the problem still happens on master.

../Randy


> 
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> On 27-01-2021 16:10, Mike Looijmans via lists.openembedded.org wrote:
>> When doing large builds, the GCC compiler tends to crash on random 
>> spots in the code. There are a few common denominators though.
>>
>> It only happens when compiling for aarch64 (cortex-A53), not for 
>> 32-bit arm (cortex-A9)
>>
>> It's random and usually happens on "big" sets like kernel, openssl, 
>> boost, u-boot etc.
>>
>> It always reports "during GIMPLE pass: ealias" in the error, for example:
>>
>> | during GIMPLE pass: ealias
>> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function 'do_x509_check':
>> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler 
>> error: Illegal instruction
>> | 1239 | }
>>
>> Compiling the same thing again usually goes fine.
>>
>> I've never experienced this with the zeus and older branches of OE.
>>
>>
>> I've already tried upgrading to the latest gatesgarth status, and 
>> cleaning out everything and start from scratch. I've also run "mprime" 
>> test on my machine (over one hour) just to be confident that the 
>> system itself is really okay.
>>
>>
>> Ideas to diagnose, fix or reliably reprodruce are more than welcome. 
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
