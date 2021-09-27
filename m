Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D81C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 19:47:34 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.4250.1632772053063425191
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 12:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=48446 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mUwb4-0007EH-C1
	for openembedded-core@lists.openembedded.org; Mon, 27 Sep 2021 15:47:30 -0400
Received: from [136.2.33.161] ([136.2.33.161]) by crashcourse.ca (Horde
 Framework) with HTTPS; Mon, 27 Sep 2021 15:47:29 -0400
Date: Mon, 27 Sep 2021 15:47:29 -0400
Message-ID: <20210927154729.Horde.VRxccp3KcUe_ET_rGPAqNW9@crashcourse.ca>
From: rpjday@crashcourse.ca
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] simplest use of SSTATE_MIRRORS?
References: <d8be7242-c7e5-7893-a3ed-649d894230f4@crashcourse.ca>
 <CAJ86T=WBSRGamDSsDeBrsgSH=SZiehi7_rxT=FSRRjytoLx+hA@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=WBSRGamDSsDeBrsgSH=SZiehi7_rxT=FSRRjytoLx+hA@mail.gmail.com>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 19:47:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156399


Quoting Andre McCurdy <armccurdy@gmail.com>:

> On Mon, Sep 27, 2021 at 9:13 AM Robert P. J. Day  
> <rpjday@crashcourse.ca> wrote:
>>
>>   colleague asked me how SSTATE_MIRRORS worked, so i had to check,
>> followed the section here:
>>
>> http://docs.yoctoproject.org/overview-manual/concepts.html#shared-state-cache
>>
>> and in one of own builds, i moved the entire sstate-cache directory
>> to ~/SSTATE as is, then added the following to my site.conf:
>>
>> SSTATE_MIRRORS = " \
>>         file://.\* file:///home/rpjday/SSTATE/PATH \
>> "
>
> The example in local.conf.sample uses file://.* rather than file://.\*

   i noticed that a bit later, made the change and all good. so i guess
i'll submit a patch for the manual.

rday


