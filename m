Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.103])
 by mx.groups.io with SMTP id smtpd.web11.9320.1613054863941687215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 06:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=ioIPAqdp;
 spf=pass (domain: outlook.com, ip: 40.92.68.103, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7Fz1Ahq0PzkfQDIMMJSuQJtAu9UAJpWglb3oMuznTdD2/b9O0WEkds83+B/r18LTjWPDVyLrAtkAteN1IV/14sSt4VLDv6jOHStVBUlWRS1o+HQ2Jx3o+jfn8HiHlLuPy3250UfpIrSd2SHx1FpaHOqELTfr6S2mblNmqUy6U24WMBx3lt44hf4pGQ6PgR+OYzI/p4KYmSWqetuXOrIlCjpWSDAr3CFW1ArofLiGPaOlBNJoQM0/H+mk81GHesIIHl9tGyWjcMdeXqkGmNigiMcsAliKsYGGTQ58L34Gfn2weOpa2V1QjYG0RBk1d3fo7KcTvlmrMzLpzLgUlp/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+MxrMaV4btaELoaTBkxRAlxYRPhDPwrxCKvtAFEupE=;
 b=Z/wIpTzjGcG3lAcjlYIUCpVwc2nUhU/7gxcLhZb8rrCy+1ici+m9R+xiRNQM7mPm0So9mFxXy8OY71AYV8Gk54UvXsz3Kjrhy8F3LF+U1cVgQ7qtRiTVfIh68DbgHaVKXg2K7ZFXjJ08EQ2dmvkdHZwRXJBPFlKH9XWWdtbaZBeM0w7loZhF4P9wHzavPUKrHDVAuXfxbyj+DI0KKcfFKWNgm2/pbQkz4UbAmG0jGcvLtPbL85VJ1O/VuUnv0EB7gzxOQshhqqvgPC3ZKh3663AzxFUje2rvXcyv00dti8vISD+N0+/+Qy23JfzKuNwvi4e0prAUq6gRhdyntznPhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+MxrMaV4btaELoaTBkxRAlxYRPhDPwrxCKvtAFEupE=;
 b=ioIPAqdpOLHcaTg48kR0BnPZAbTZ+1kJiFd0HZaLlENQUOH9NsIbvUhyza5SB6BYOyHXCfzlNarWtrcsyz9wnXuK8z3QJqtH/nRv/tCX+oTrzEC1v9H181aqjTDop/z0u2D12z84rzeOaqKgMT+5t+V9wUNYlDZ2Hy3H1VdfQAX22xQJ3rWT1bZOeWJbl+2Y+FLBpD99+VL/0+DJFBOHkMhRghQ5F6CyV9JFJmn+pd4RRCS50zK9VIOMsk05G52RGLYeQvI9YDxGwuRAChBxC1LkM+3j/jQkV9SHpqdvLpk3RnEISSMhPpGZZBo4C5bV3uYtTGJwPwD1FSIBKjFtmg==
Received: from AM5EUR02FT043.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1c::42) by
 AM5EUR02HT027.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1c::491)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 14:47:41 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1c::4d) by AM5EUR02FT043.mail.protection.outlook.com
 (2a01:111:e400:7e1c::358) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 14:47:41 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:E7299A573B57F4557606F2C4B26BCA6C638FD67BD3905B14DC9C9BA5272F39DF;UpperCasedChecksum:916B335F0F4D434F3509170622BED4BCBA2790C132BC8160AC6EC91EFF33EA67;SizeAsReceived:9072;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3846.029; Thu, 11 Feb 2021
 14:47:41 +0000
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, tomasz.dziendzielski@gmail.com
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
 <AM9PR09MB46424CCD4DD40C8DC3F59403A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <df38a497ef1c31b72445d7ae2361d3d6db676f6e.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642F1B612B2BC92D05BC20AA88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 11 Feb 2021 15:47:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <df38a497ef1c31b72445d7ae2361d3d6db676f6e.camel@linuxfoundation.org>
X-TMN: [uA3iv4BSdDMbENebOprJZsH/sqQX32iT]
X-ClientProxiedBy: AM6P191CA0096.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::37) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <cc029699-a0d9-2f48-4964-26c5766883cc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.90.166) by AM6P191CA0096.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 14:47:41 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4a1ad0e9-0d6f-4c88-ecf8-08d8ce9bfbc8
X-MS-TrafficTypeDiagnostic: AM5EUR02HT027:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uiUtxqWwLWaRTqH67zKoYtU30O9oqCUaajZoQYduAjfT6USj8ReI0Fp+WLdz3sujBGqfhd7mldQ3WoEq7C9xwKdAQgBKeYErlB3wi41pzswqi8f6TNFwbKkhjx8Dqf6YpoKrwQH0qikOAQXm71/qws9h3gaJkXujJDXl5j3zmIHuHvbt20dcybV4lVQZdl1woXObTF35NQgHr0/yY9/zGZQGjtjfDJyRfvtfK8uqrPzg/LNWbZBSPSqlSmCtSd+QRP0MbHuG1itNZSjfm/TtmLrW61Xkq5wN85AG+WBwhjDxM3af1W4KJXD1Lgygi8EfiAo52e5FdIr8gW6pTt+v2LFejqhV41LCvRhjH36Sj6VdObcpoDoDBSCnsru/WaV+keOhRvf+7GEMVI/G24xQfA==
X-MS-Exchange-AntiSpam-MessageData: 
	IQGoF5FVPhTJzN198f0r+Z71FotbbxGgoTEHOGUNpgH7x+AYnqB1x+FWdVYsSwMK1vuwr0E0qXRlWobzvM6VT01P4MxW5t135lMex7ZDIsnyrao0iSTevU0UkGy1AcBJQyRY6DEWKV9Zz6k0TMLFfg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1ad0e9-0d6f-4c88-ecf8-08d8ce9bfbc8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 14:47:41.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT043.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR02HT027
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11.02.21 14:04, Richard Purdie wrote:
> On Thu, 2021-02-11 at 13:10 +0100, Konrad Weihmann wrote:
>>
>> On 11.02.21 12:43, Richard Purdie wrote:
>>> On Thu, 2021-02-11 at 08:21 +0100, Konrad Weihmann wrote:
>>>> After this patch got merged I notice some "noise" in my builds.
>>>>
>>>> For bbappends which inherit unrelated classes I get a lot of warning like
>>>>
>>>> Issue: nativesdk-openssh: native/nativesdk class is not inherited last,
>>>> this can result in unexpected behaviour. Classes inherited after
>>>> native/nativesdk: my-custom-class.bbclass [native-last]
>>>>
>>>> First it doesn't give any hint that this is caused by the bbappend and
>>>> secondly I have no idea how to fix that (if that is even possible).
>>>>
>>>> So I would like to have at least an option to ignore these warnings for
>>>> classes I'm sure don't cause any conflict - something more granular then
>>>> just to deactivate this pretty useful check.
>>>>
>>>> Thoughts?
>>>
>>> This shouldn't be too common as most recently use BBCLASSEXTEND which
>>> would ensure they're last. Which recipes are you running into this
>>> with?
>>
>> Sure, it does only affect recipes which are manually inheriting native
>> (I got a bunch of them, that's why I noticed).
> 
> Any reason they don't/can't use BBCLASSEXTEND?
> 
>> A (unfortunately) common pattern I face is that ppl share variables
>> between recipes using bbclasses - which to my understanding shouldn't
>> cause any issues when being inherited after native.
>> And the same pattern is applied to recipes only being appended.
> 
> You could use conf files for variables. That is something I'd like to
> try and encourage more of, I've been meaning to look at that for the
> core too.
> 
>>> You really don't want your class coming after native/nativesdk, if you
>>> understand what that code is doing you'll realise it is rather risky :(
>>
>> Totally, that why I'm absolutely in favor of this patch.
>>
>>>
>>> You could turn off that warning for a set of recipes if you really
>>> don't care but I'd prefer not to make that too easy.
>>
>> But that would turn off the whole feature, which is bad IMO.
>> What I see (once that will be used by a wider audience in the wild) is
>> that this will lead to questions (consuming my time as an integrator) or
>> to the fact that this check will be turned off completely.
>> Either way not the best choice if you'd ask me.
> 
> I'm hoping that people might fix the underlying issues.
> 
>> That's why I asked for a more granular configuration, so that a person
>> who's able to understand the implications of a bbclass in relation to
>> native could turn it off on a distro/site config level.
>>
>> And just to be clear I wouldn't want that to be used widely, or even
>> being promoted.
> 
> I can guarantee that making any such option available will just have
> people reach for it and use it. You clearly want to here when the
> changes needed to avoid it are probably not that difficult.
> 
>> If that's not what the project wants, I'm also fine with it, but then it
>> would be really helpful to point to the bbappend as a culprit and not
>> the base recipe
> 
> I understand why you'd want it, I'm just not sure if would encourage
> the right behaviour :(.

Fair enough - guess I will go with the educating ppl (including myself) 
path then

> 
> Cheers,
> 
> Richard
> 
