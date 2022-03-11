Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB0EC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:01:53 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.7783.1647018111752487368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id B818312441;
	Fri, 11 Mar 2022 18:01:49 +0100 (CET)
Received: from [192.168.178.83] ([84.163.46.97]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nSieD-26hSFd0; Fri, 11 Mar 2022 18:01:49 +0100
Message-ID: <a15e9ff3-75c7-9038-e9b8-5b28c4802aca@t-online.de>
Date: Fri, 11 Mar 2022 18:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [meta-oe][PATCH] mesa: update to 22.0.0
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220311151836.1541579-1-f_l_k@t-online.de>
 <b3e2f344391a1d4d409d903dc3b8793d0a30b728.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <b3e2f344391a1d4d409d903dc3b8793d0a30b728.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647018109-000116DC-390DFA3A/0/0 CLEAN NORMAL
X-TOI-MSGID: 3a956d57-14f7-4804-9eb3-d53bacdc5d8f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163064

https://gitlab.freedesktop.org/mesa/mesa/-/commit/d16263cdee95ec48864ad7a0f90275e8a4fd374b

As far as I can see , this was the only change.

Am 11.03.22 um 17:54 schrieb Richard Purdie:
> On Fri, 2022-03-11 at 16:18 +0100, Markus Volk wrote:
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index 2f79e8b34d..c9dab15f4f 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>>   BUGTRACKER = "https://bugs.freedesktop.org"
>>   SECTION = "x11"
>>   LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=17a4ea65de7a9ab42437f3131e616a7f"
>> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58"
>>   
>>   PE = "2"
>>   
> Thanks for the patch, what changed in the license?
>
> We require license changes to be noted in the commit message just to show that
> someone checked the license hasn't changed.
>
> Cheers,
>
> Richard
>
>
>

