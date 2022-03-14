Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20ACC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:43:03 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web09.24333.1647247382312632142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 54770179CD
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:43:00 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.243]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nTgI6-0FSrXV0; Mon, 14 Mar 2022 09:42:58 +0100
Message-ID: <2e351c11-071f-6f75-eb60-6a8880444d33@t-online.de>
Date: Mon, 14 Mar 2022 09:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe-core][PATCHv2] cairo: update to v1.17.4
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220314071037.3702941-1-f_l_k@t-online.de>
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
 <74c5d185-8abe-6afe-724c-8cc7b6529997@t-online.de>
 <CANNYZj9wcs9-XFD_zXob3i6WiwqMedeaC9qu7cuhGBcaqLyeGw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CANNYZj9wcs9-XFD_zXob3i6WiwqMedeaC9qu7cuhGBcaqLyeGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647247378-00010BFA-DAA2BE7C/0/0 CLEAN NORMAL
X-TOI-MSGID: e9e88c22-9161-4b6b-959b-2428c73f9bc9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 08:43:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163133


Am 14.03.22 um 09:27 schrieb Alexander Kanavin:
> On Mon, 14 Mar 2022 at 09:21, Markus Volk <f_l_k@t-online.de> wrote:
>> https://gitlab.freedesktop.org/cairo/cairo/-/tags
>>
>> https://www.cairographics.org/news/
>>
>> That was not mentioned here. I just thought because 16.0.0 is from 2018
>> and some things might have been improved since then.
> The SRC_URI prefix changed from http://cairographics.org/releases/ to
> http://cairographics.org/snapshots/, that should've given you pause.
>
> i've rewritten this recipe some months ago and was using it since without knowing that this was a snapshot
Thanks for the input.

I have been using this recipe for months now without knowing about it. I 
was using gitlab for SRC_URI

and just switched to tarball before sending this patch to the mailing 
list. In fact I was paused for a short

time, but since it is called release on gitlab and without the input you 
gave, not long enough


