Return-Path: <stefan@herbrechtsmeier.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6A7C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 19:26:01 +0000 (UTC)
Received: from dd43212.kasserver.com (dd43212.kasserver.com [85.13.165.135])
 by mx.groups.io with SMTP id smtpd.web11.10129.1640460359362153907
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: herbrechtsmeier.net,
 ip: 85.13.165.135, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (i5E86B5ED.versanet.de [94.134.181.237])
	by dd43212.kasserver.com (Postfix) with ESMTPSA id 1B74643C05A7;
	Sat, 25 Dec 2021 20:25:56 +0100 (CET)
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <5db8fc83-05e2-c3f7-ad65-b73b3fb4c68e@herbrechtsmeier.net>
Date: Sat, 25 Dec 2021 20:25:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Dec 2021 19:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160004

Hi Richard,

Am 24.12.21 um 09:30 schrieb Richard Purdie:
> On Thu, 2021-12-23 at 22:00 -0800, Khem Raj wrote:
>> is this list of failures due to this patch ?
>> https://errors.yoctoproject.org/Errors/Build/137579/
> 
> Looks likely, yes. Recipes shouldn't be attempting downloads in do_compile :(

In this case the go and especially go-mod class is broken by design 
because it downloads all its dependencies after do_fetch.

Regards
   Stefan

