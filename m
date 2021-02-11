Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.92.72.32])
 by mx.groups.io with SMTP id smtpd.web12.7532.1613045457595727233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 04:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=B96AVAQz;
 spf=pass (domain: outlook.com, ip: 40.92.72.32, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3tjklZ0H1roJLV1IX7gDkfcG0pqVBXmiFmTk4zu8IgN0B5d+vcNFt3Vxz2uIN5uX8iMAouyq8QlIo6t+eulVFAWFq3NDRYhS92aRiI+rEzCjJDd16nmUjCknooYQaVbZNXiNO/jZ4WQZKcytRxDqIIhkh22FaLDwIMFUSPNMgmZEkBly0b5TJ8Uqx4ddFcgsbKATJ6c58U6tmSmEWnFdb4hnHUzOznRJVGKSw9ONL9p+Asvj0g3HOtc1I9ocb3UqvvdrCIXLp8bFERvGmFi8IiigPqnbQF7wX2esRV9Q85DxjwjwreUFz5s5Pu/3isqhbkfLnD/kRz8rdkd3gUSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVuJWjGJXvPOozC3fUomQM9SwLZXBvxTtV+5DoqIwOI=;
 b=nFQY3DNUATpb7/X6qIW9N+RBbHRbhql+ZX+thBXjBaU5EjCuauAX/daCLOAFrKbsnHPkk7OGcmH41gyoNIxQdBU1uK1n2n+ZEo0eKlTd32dPk1hueTcdWrrFluQch8bd1yPK6/Dd6e06bR3iZ9XHXZHwePXTl2yTfQH0pkFkjYjpGOJz4lMj2YsvJCLuJVYyMcrk32NilwDozfTAWgYR9da745XUGXMWbhWUbE7A01+cZCXGyS6oxjqJWWYH2Y9d2+tdkh40I1QBlB+Miw/nrJn0AMXpks+/o0ZdBH3HUMOc57wsPn/A3Bw2P9H5RJk7wAZymOnhalrcL6fTWasbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVuJWjGJXvPOozC3fUomQM9SwLZXBvxTtV+5DoqIwOI=;
 b=B96AVAQznBjUUVrZlx0O9Z8DSe2wCCQeAhC4URmSgM8ynmpiCjBzeCO+k3btfZntYnhJf8WY0qmbRfdXnY4NrLI0XF9PWrNWFRwoe6GfPPAuFD1fV6/1NTV7kVjaXS7bMfX8j1kXdqbQ3K+iwEZNXQ4AHvYfkt7ZpxgH4qlML+bAPGdPGtnstA4RcM68kUQ4PbWjPq1u5NLokPwNBXkjs06TJmS2PmKoY+6Y+XhSbb0zWbWo5ykmmnJL5JlRsYSKnIq2c8tO/M3vDWH74Ab1ucQjeGFgT2j/S5a6SbYs/IUaL4qgn4KS5vpLS+T5j8RXEPrivXZq+gS9mDzG2qCeMg==
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e0a::50) by
 DB5EUR03HT008.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e0a::246)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 12:10:55 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0a::53) by DB5EUR03FT015.mail.protection.outlook.com
 (2a01:111:e400:7e0a::145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 12:10:55 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:F48A56D6AE7AC6E974027991E014B34BFCCB711292FA753C3A71A5D2086753B1;UpperCasedChecksum:C28A2111A75E4985BABFE3D359CEB9DD91014F395FA0D464EFC6940AE12EB494;SizeAsReceived:8925;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3846.029; Thu, 11 Feb 2021
 12:10:55 +0000
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, tomasz.dziendzielski@gmail.com
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46424CCD4DD40C8DC3F59403A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 11 Feb 2021 13:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
X-TMN: [G8Ygov/o1iUfTeQ0dyX5UXKuLIlNK/xC]
X-ClientProxiedBy: AS8PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::14) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <5ef82bf2-34ff-9ff4-b363-3d277f270995@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.90.166) by AS8PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:20b:311::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 12:10:54 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 88743a4b-2a6b-462d-8127-08d8ce861502
X-MS-TrafficTypeDiagnostic: DB5EUR03HT008:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1bdLdwmf5tzzV/+CKkB4PGz4E+a1x4dbFVgZzZjii0srmT+RoVvXJrwsYCJDA9yZsBa88DdESHgQ9C6WQPT/Gm5zSAY2wcfIMv+5hX+1fGDz1iWFX5v2Mt3b94A8lJ4jbLNAHZNa5ZfJoQedejMm4BTrfknyd2r2h6aZ2oHkH6qcqsClUAPEHk4tNACDkQEUrI1nvhwk5le3OVuxlga+Lq9muV+C14z8l9joTCC609+wKRfZOjorLtwvnCdnoHjk/gsoom0XGz8OcQlN/lDTwhvjaG4pGI456y3H7mwCCfyg1APqezerJDDHI6Lkoa7WTd4rl7+bKOslqLGhU8sH199tFfGz3ZOcBC91eFJ+ySjEO281I2FkMw3yUfjEujn/6BeJqh1A5faiOrcMaiYrYQ==
X-MS-Exchange-AntiSpam-MessageData: 
	usKWF6yKv6B/k9SC645oTnt7q7Q8ndNGoZN64KGR9CCREkWT3O2/r7obAcwjjGZ06/q2blmataGqD0Dh5xRRhujDvfMdP90ANr6ExOQCP08HrVg8jr/keO2eLQh7fT96UBW57+Iu3Aeg3Vy5+bjUqQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88743a4b-2a6b-462d-8127-08d8ce861502
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 12:10:54.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT008
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11.02.21 12:43, Richard Purdie wrote:
> On Thu, 2021-02-11 at 08:21 +0100, Konrad Weihmann wrote:
>> After this patch got merged I notice some "noise" in my builds.
>>
>> For bbappends which inherit unrelated classes I get a lot of warning like
>>
>> Issue: nativesdk-openssh: native/nativesdk class is not inherited last,
>> this can result in unexpected behaviour. Classes inherited after
>> native/nativesdk: my-custom-class.bbclass [native-last]
>>
>> First it doesn't give any hint that this is caused by the bbappend and
>> secondly I have no idea how to fix that (if that is even possible).
>>
>> So I would like to have at least an option to ignore these warnings for
>> classes I'm sure don't cause any conflict - something more granular then
>> just to deactivate this pretty useful check.
>>
>> Thoughts?
> 
> This shouldn't be too common as most recently use BBCLASSEXTEND which
> would ensure they're last. Which recipes are you running into this
> with?

Sure, it does only affect recipes which are manually inheriting native 
(I got a bunch of them, that's why I noticed).
A (unfortunately) common pattern I face is that ppl share variables 
between recipes using bbclasses - which to my understanding shouldn't 
cause any issues when being inherited after native.
And the same pattern is applied to recipes only being appended.

> 
> You really don't want your class coming after native/nativesdk, if you
> understand what that code is doing you'll realise it is rather risky :(

Totally, that why I'm absolutely in favor of this patch.

> 
> You could turn off that warning for a set of recipes if you really
> don't care but I'd prefer not to make that too easy.

But that would turn off the whole feature, which is bad IMO.
What I see (once that will be used by a wider audience in the wild) is 
that this will lead to questions (consuming my time as an integrator) or 
to the fact that this check will be turned off completely.
Either way not the best choice if you'd ask me.

That's why I asked for a more granular configuration, so that a person 
who's able to understand the implications of a bbclass in relation to 
native could turn it off on a distro/site config level.

And just to be clear I wouldn't want that to be used widely, or even 
being promoted.

If that's not what the project wants, I'm also fine with it, but then it 
would be really helpful to point to the bbappend as a culprit and not 
the base recipe

> 
> Cheers,
> 
> Richard
> 
