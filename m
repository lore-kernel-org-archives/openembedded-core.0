Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494C9C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 11:12:46 +0000 (UTC)
Received: from smtp6.emailarray.com (smtp6.emailarray.com [65.39.216.46])
 by mx.groups.io with SMTP id smtpd.web10.133160.1700824361214397159
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 03:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: balister.org, ip: 65.39.216.46, mailfrom: philip@balister.org)
Received: (qmail 25089 invoked by uid 89); 24 Nov 2023 11:12:34 -0000
X-Orig-Sender: philip@balister.org
Received: from unknown (HELO ?192.168.0.31?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0AxNzQuMTA3LjE3My45Nw==) (POLARISLOCAL)  
  by smtp6.emailarray.com with SMTP; 24 Nov 2023 11:12:34 -0000
Message-ID: <8498fc58-f51c-b629-e2e8-8c5578864ddb@balister.org>
Date: Fri, 24 Nov 2023 06:12:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH] Revert "lzop: remove recipe from oe-core"
To: Martin Jansa <martin.jansa@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20231123004605.82598-1-marex@denx.de>
 <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
 <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de>
 <CANNYZj_XG4nxLOqOq=aeYOZBNuDMoOdYF8G2LWVUDbe+gYNEQQ@mail.gmail.com>
 <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
Content-Language: en-US
From: Philip Balister <philip@balister.org>
In-Reply-To: <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 11:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191180

On 11/24/23 03:18, Martin Jansa wrote:
> On Fri, Nov 24, 2023 at 8:52 AM Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
> 
>     On Thu, 23 Nov 2023 at 22:07, Marek Vasut <marex@denx.de
>     <mailto:marex@denx.de>> wrote:
> 
>      > The lzop is called in oe-core and I was under the impression that
>      > oe-core shouldn't depend on anything except bitbake . So either this
>      > stuff should be moved to meta-oe too (which would be unfortunate
>     growth
>      > of dependencies) or the lzop should be reinstated . I would
>     obviously be
>      > in favor of the later.
> 
>     There are plenty of recipes in oe-core that have optional features
>     (enabled via PACKAGECONFIG) that depend on recipes that are not in
>     core. If you enable them, bitbake will say that the needed recipe is
>     missing and then you need to figure out which layer to add (typically
>     something in meta-openembedded tree). This is not that different:
>     optional feature, disabled by default, and the error will be the same:
>     missing lzop recipe.
> 
> 
> I think this case is slightly different as this optional dependency 
> might be "enabled" by MACHINE config in some BSP layer and BSP layer 
> depending on meta-oe just to build the kernel (with BSP preferred 
> compression) isn't great - compared with some DISTRO config enabling 
> some additional PACKAGECONFIG in some other recipe the DISTRO uses.

It sounds like enabling the option forces the addition of another layer 
to an existing project. I understand the need for that if the 
PACKAGECONFIG added so additional package to the image, but in this case 
the option just needs an additional tool to create stuff needed for 
booting a board

Philip

> 
> At least if Marek agrees to maintain it instead of restoring Denys as 
> maintainer :).
> 
> Cheers,
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191178): https://lists.openembedded.org/g/openembedded-core/message/191178
> Mute This Topic: https://lists.openembedded.org/mt/102759947/384425
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

