Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432C6C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:57:17 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.4922.1655971034885913789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 992A832CD;
	Thu, 23 Jun 2022 09:57:12 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.42.157]) by fwd74.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o4HiC-0kBfJx0; Thu, 23 Jun 2022 09:57:12 +0200
Message-ID: <291f23ad-b932-e3ed-ca7a-f0f29fd576ba@t-online.de>
Date: Thu, 23 Jun 2022 09:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH 1/2] llvm: make LLVM_HAVE_OPT_VIEWER_MODULES
 optional
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220622173251.478588-1-f_l_k@t-online.de>
 <20220622224440.658ff65c@booty>
 <e74c83db-d4fd-8696-d00b-b19c19f9b42e@t-online.de>
 <20220623094037.2204a89a@booty>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220623094037.2204a89a@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1655971032-0143D1EA-B2F42D81/0/0 CLEAN NORMAL
X-TOI-MSGID: c6f55e4e-45a9-4509-a309-45275d63fc09
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 07:57:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167263

Hi Luca,

the reason i made the switch working manually both sides was that i 
wanted to remove those python modules from build dependencies as i 
thought they would only be needed at runtime. But this should work as 
well and I'm of course OK with it.

Markus

Am 23.06.22 um 09:40 schrieb Luca Ceresoli:
> Hi Markus,
>
> On Wed, 22 Jun 2022 23:03:47 +0200
> "Markus Volk" <f_l_k@t-online.de> wrote:
>
>> Hi Luca,
>>
>> your commit message is way better than mine.
>>
>> One suggestion on your patch. I guess to be working on the target it
>> would be needed to add python3-pygment and python3-pyyaml as runtime
>> dependencies as well.
>>
>> PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
> Good catch. So if you are OK I will take care of this, send v2, test it
> on the autobuilder where it did fail and if there is no surprise send it
> to Richard.
>
>

