Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2D8C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 13:56:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.108])
 by mx.groups.io with SMTP id smtpd.web10.11658.1639058174777596098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 05:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=QLKl15OK;
 spf=pass (domain: outlook.com, ip: 40.92.89.108,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMDmDRwpDsnBMbzA8Iz9mI8TMHORgdSkQpgUFWl0kcnA+q4keSAf2jKyVoWlOJdSwFMXSmzrl2uMMYo//r4I+yBWz1vhwQ5IYOnLm7CqVE5ZQqNqCGv9Fff50G1uI4OyOTQrse2hBw1k4SKXKYvKRZSpZMQyhwkhaW/etw4MhBhRLZ2BcZ2c/EUCNEkBYNJ65gCl5EH1idw6mJ42qpxXyVE7atf9HFa2ho0W2yFrlELoJWCiOf1eBaeQxrZ5oJE8zAPqNvYzZIgcYaVmMU9cCGU9vVSER4gZhI/Fvo+JaeMc4E6H0iV1ErqwpiBPIhGvDS2Wf6/dTnGg2enF9LQDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RylE7yocFJ72zXK0dvHBSL9FsJ0z3jTqpBjaiqORbhI=;
 b=OzskNK/D4O6bhU/LKdgMGIvQr5FnYV2rk9RVxAvQyRITOD6UgB+NsPCl5LGBOfM+IYsnTCVqA539Is6avm6XLdOdDjX7Eb+WNtYXUY1xhDPfBPnpuC4FORPs0tR1wsbg+nB2X/JNnMIKFPBvsj+/6ORASoYtgnZ5oudaogiC3a+A1OZONkNy2zGTIOmoYouuUXJpUPy9O2VUmOgUxYpISd5NnK6l7Pg3hsvN6FzZ5ZP4kAV6eaVj6WjxrhVaQ2lz2A5bfrPsRI/88udnJ0zsDSVTRBSyLqxu7LPdnlRxNZBuHqhTBk8Zb4a/zXEMv/n4IKfhul6DEdfXmlpEWh+vJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RylE7yocFJ72zXK0dvHBSL9FsJ0z3jTqpBjaiqORbhI=;
 b=QLKl15OK6htVGJItcz+HBgicfFq/oiSTI9dwnPnIKAGDdHNFMyXfSWIQCHgssHZciUOri2QekRX6flEeH5bZsR91QodrKpquVBqcM63boUiRuB7U3smTEqKj3Ujz5Ig2KOuSZVFQIP98sRHregFtOT2Mo2Vm6fxeAq8YMO+bYAbbjaQ0cPvnbVFiszcdDsjdyXqPQYGDZaVNHnOfZXs0Scgt69WhcsiRnESY+m558SoCYZH1HU4r5ZyuORPMDcn/O0rYKvLb7X+mWfs32DtkqtaTyWEeJY9J3Za+x7dDsi+R+iF5aphU/fUDHHjD6LCFEoS8kk/7CGIpK+BFpTHR2A==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2769.eurprd09.prod.outlook.com (2603:10a6:208:12b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 13:56:12 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 13:56:12 +0000
Subject: Re: [OE-core] [PATCH 05/29] serf: mark patches as inappropriate for
 upstream submission
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Ross Burton <ross@burtonini.com>
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-5-alex@linutronix.de>
 <2b5536624c6324dd6f73dd6fa3d53e05c33eb64f.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46422CD393A3298518687FF7A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 9 Dec 2021 14:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <2b5536624c6324dd6f73dd6fa3d53e05c33eb64f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [kYkl+J9hte1RqdPoMd69JCp6NcVkLw8dxoZRHLmOr0gLMN2ja11cdc8D4oXo5N1o]
X-ClientProxiedBy: AM6P195CA0080.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::21) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <c315546a-b6c0-bcd2-57df-825738043748@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72b71b44-c901-4687-5339-08d9bb1ba8c4
X-MS-TrafficTypeDiagnostic: AM0PR09MB2769:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j8fLl/D+wPtAXZXQOp3jPYB+fZfx4oXwxqozMFQ5PqzM5HQV8J6Zsnn6V9/hXSClF4RL3WAAS8ysBSz5VUGqgp+bSe9pk175FmhX63aKV46xg4kmxtjoXIcN+MuAA2RbR9OC1MjyCoJufQRqGa4NnmiOUqDRqNrgVg8xq9viefB6PhZYS1HGspeRDF1+sD+wIxtlSXaQSWySzkqBvQrtiWuIpNTt5ftjkwr0oEOvjMTDyyd9/iDzz0afOjLwwuiLPywNP4S+iGydgZF5lvVSwNoUpkInJ6qR4trzQ47HRPYUVLv9CuGRjlAZkdFyTT+U+xnMr3g/XuOuK+SAK8GgRRWDu2fV3LaJNxjiBfCK+AXnJ+NRmniQ6ef7sI6N/uJNMmk6dPeBRsk2dlxTai4UAJ/EwSusZawNkGLA+CWX9mMPaSSgSRcUxwUfwQ0fN2p3iEboPk4ovcamJOLP6VffDmTXoKJdCfNTs4+z3i2XuIwq+SeGw+zUXpBClB824GjoPQMkcBzCX2x+9NJLuBCUXnuQ39mRBsd10BtNzNVuGCpr9jjAr/SSGWiAbtA8CLcekkwofAjPqqlXEMmG4wFUtbNTsCsI1MpTfiYV19LWPquZnXmly1JUb9xVx8Nojo4hf9JWlCiBR20q61nP7TEJlieLAsJ2msEX4tgDQSFPmhQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NjdnczR3TlBZS3BybmdpUUdSZGlVa0lYZEtLZEpVNTJVZWthRUhwYW1pK0Q5?=
 =?utf-8?B?QlJjRjFWR05DaHBQQVByOW9HVHVUUEtUTUpNcUQvVUNBNUVnQi82eFhjYi94?=
 =?utf-8?B?ZGl1Rm11bU9BZmY2dlRzVS9WZ0c5UGQ1TEdBQnR6NUVqck1tVXZqVGhmU1R1?=
 =?utf-8?B?SDQ4WXd3ODJBYktiSXZvMmRHQXAzZXN4TWRLYWdNUU15R2lTdExtVUFFRnJw?=
 =?utf-8?B?akdES2c5UXRpcG9tZW8wUzdmY3NvMVdiRkRlc2Z0dSt6N3RzM0dnRDNzUk4x?=
 =?utf-8?B?eWVaVS9YU0VDWDN2aEZkNlBVcnFQUkJ6bnBYSHRjWXkwQUY1ZlA3VUEwSm1l?=
 =?utf-8?B?UjBSWWRLNlRjQ2dkcklLL2RpYUVYclU3Mm51eUN4QmMrSXVISHJiNHN2K084?=
 =?utf-8?B?bUhmR3RtUEdqNG5WenZUMmZCSmtSRjBkUTVsNnJkN2VuQzE4enlYbDZaYXJK?=
 =?utf-8?B?Qk5iOTk1cHV4cmRjUHl6ZXdZZS9la24veHlHdkc2aG1vK2VkT29ia0NJcEdG?=
 =?utf-8?B?SDlZamswNEMzQzZVRW5iY1JzTXcvVkR0VkFCVzFxRGd6aGFGRzZVUkNCNzF0?=
 =?utf-8?B?aTY3RGN1U1ZwZHoyQmQ1OUhXMGJ4ZmkrZ2tIcnBtRm1hZkM4R0VrcWY4R3RE?=
 =?utf-8?B?RHNTdFh6TlJKOER5LzZQWFdjQ01kcUJUSnoyK214bDhsQmFqazJhMk5seitF?=
 =?utf-8?B?MGhzWkRtN0d4SC95MjlWNnRlSkdvckdib0dRWno3bWpacVc3MVlueWdmYzE3?=
 =?utf-8?B?OGtmdjViSFBURkpnNXc3amxpUHllWkVvd2pkZmgrYnViWGtJMStCTG1nWHRN?=
 =?utf-8?B?SjdSK3ZDN09Pa1AwK2M4TG5VTHRuTWZBZkdYTjRMRXBIT3lMSjZodGlpeW42?=
 =?utf-8?B?OXNEZVZEWnljNTdWWmNOZ25kVERyNnFjd2cxQzBYRGdQTXpXb1NHc2srenRX?=
 =?utf-8?B?d1NMMXhVN2ZhU0o0QnZGUEFjMDZvckxPUko5RUZsODdKbVJHNmNxL3l4TzZ2?=
 =?utf-8?B?VUxFSEVQSVptc09DN2FkWHcvRlVtRGk3MGlBWFNRQ3EzSFI3Z0h0Z0VleGJS?=
 =?utf-8?B?empFcVhRQmYzRXJUaGhXR2prRXBVNUlscmlYOVVYSjdnSG5oV2I5WmVNVVVH?=
 =?utf-8?B?eXRhZHdnRDBPZUtNR3YwWmordFN3d3RpTmNXdGsrVlFBdzVqU0NRUUFmSDA2?=
 =?utf-8?B?cG9Kb21pMERGa0NibG1nTys5MXB3RUlzTzFRNjBIdXh4b2tlaFNpeThmOHVL?=
 =?utf-8?B?QWZja2cxQ3RNeUVIK0V4MExIWlZHRlBDbjFRcG0rNDU2SWVqT2lpNkV3Q003?=
 =?utf-8?B?VUVWSDVGUmRSSE1keGNYOEJ1T3QxSTE0aUZQUFNzcWtrb0tsZHMrUXh5QzFM?=
 =?utf-8?B?VDZ2UjcyUDBEQkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72b71b44-c901-4687-5339-08d9bb1ba8c4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 13:56:12.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2769
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 13:56:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159449



On 09.12.21 14:45, Richard Purdie wrote:
> On Wed, 2021-12-08 at 22:59 +0100, Alexander Kanavin wrote:
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>   .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch   | 3 ++-
>>   ...p.creating.directories.without.sandbox-install.prefix.patch | 3 ++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
>> index e6172ef5aa..5b8fb70639 100644
>> --- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
>> +++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
>> @@ -6,7 +6,8 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
>>   Upstream removed it in
>>   https://github.com/openssl/openssl/pull/16004
>>   
>> -Upstream-Status: Pending
>> +Upstream is defunct: last release in 2015, last commit in 2019.
>> +Upstream-Status: Inappropriate [no upstream]
>>   Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>   ---
>>    buckets/ssl_buckets.c | 3 +--
>> diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>> index 91640d6044..cf00dbf5ac 100644
>> --- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>> +++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>> @@ -31,7 +31,8 @@ ERROR: scons install execution failed.
>>     and the installed paths (including the paths inside libserf*.pc)
>>     look correct
>>   
>> -Upstream-Status: Pending
>> +Upstream is defunct: last release in 2015, last commit in 2019
>> +Upstream-Status: Inappropriate [no upstream]
>>   
>>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>   
> 
> I'm still not convinced this is the right thing to do. I appreciate what the
> docs say but I also think we may need to evolve.
> 
> Let's imagine we do have an "Inactive-Upstream" status for a minute and this
> patch changes to:
> 
> Upstream-Status: Inactive-Upstream [last release 2015, last commit 2019]
> 
> If you now happen to be changing the recipe due to a new release, this is going
> to trigger some kind of thought/action by seeing that status in that we might
> now be able to upstream the patches. If it just says "Inappropriate", it won't
> trigger the response we'd like.
> 
> We're also going to eventually end up with a whole pile of "Inappropriate"
> patches, it may be useful to keep an open mind on whether any subdivision of
> those would be helpful.
> 
> Does this make sense to anyone else?

It would makes sense, but then the support and the docs has to 
backported again, otherwise cherry-picking won't be easy for older 
releases. But yeah I'm with you that Inappropriate looks odd in this 
context - still this is stated in the docs, we always refer to, so a doc 
update needs to come in first IMO

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159448): https://lists.openembedded.org/g/openembedded-core/message/159448
> Mute This Topic: https://lists.openembedded.org/mt/87599630/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

