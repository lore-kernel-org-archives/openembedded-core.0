Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317BAC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:03:08 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web09.50516.1654009378488279425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 08:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id 385301186C;
	Tue, 31 May 2022 17:02:56 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.125]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nw3OY-22nTDF0; Tue, 31 May 2022 17:02:54 +0200
Message-ID: <4e844184-370f-77a4-2500-a4fd9367496d@t-online.de>
Date: Tue, 31 May 2022 17:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCHv2] libva-initial: unbreak do_populate_sdk
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20220524155021.416611-1-f_l_k@t-online.de>
 <ca1c9481a03622d6dc3136db5f59c8602b0722dd.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <ca1c9481a03622d6dc3136db5f59c8602b0722dd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1654009374-0143C329-671B9A11/0/0 CLEAN NORMAL
X-TOI-MSGID: 153c0ada-25df-41a7-b281-11a770d2ccf0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 15:03:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166318

For my build libva-initial is empty but libva-initial-dev contains 
headers and .pc files

Markus

Am 31.05.22 um 16:23 schrieb richard.purdie@linuxfoundation.org:

> On Tue, 2022-05-24 at 17:50 +0200, Markus Volk wrote:
>> Error:
>>   Problem: package libva-dev-2.14.0-r0.corei7_64 requires libva-initial-dev, but none of the providers can be installed
>>    - conflicting requests
>>    - nothing provides libva-initial = 2.14.0-r0 needed by libva-initial-dev-2.14.0-r0.corei7_64
>> (try to add '--skip-broken' to skip uninstallable packages)
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta/recipes-graphics/libva/libva-initial_2.14.0.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb b/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
>> index 453096822f..b234797efb 100644
>> --- a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
>> +++ b/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
>> @@ -6,3 +6,4 @@ do_install:append () {
>>   	rm -f ${D}${libdir}/*.so*
>>   }
>>   
>> +RDEPENDS:${PN}-dev = ""
> Should libva-initial be creating any packages at all?
>
> I'd have thought they should all come from libva and we should disable
> the packages from libva-initial entirely?
>
> Cheers,
>
> Richard

