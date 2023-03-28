Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CB7C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 01:17:23 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.55784.1679966242038264743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 18:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout02.t-online.de (Postfix) with SMTP id D00011C333;
	Tue, 28 Mar 2023 03:16:16 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.35.166]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgxwc-0lgKno0; Tue, 28 Mar 2023 03:16:14 +0200
Message-ID: <f1a3f863-2e42-b0f4-c563-5ef7ad4f4163@t-online.de>
Date: Tue, 28 Mar 2023 03:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe-core][PATCHv2] webkitgtk: update 2.38.5 -> 2.40.0
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230326164557.27827-1-f_l_k@t-online.de>
 <20230327194727d709fd64@mail.local>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20230327194727d709fd64@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1679966174-EB7FDC73-CE76D181/0/0 CLEAN NORMAL
X-TOI-MSGID: 719a8139-802e-4bdd-9d5f-31cee4cde103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 01:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179193

As a

Am 27.03.23 um 21:47 schrieb Alexandre Belloni:
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.

This would require that I automatically register here as a maintainer, 
since everything else would have to be discussed first?
Or should I simply enter the previous maintainer of webkitgtk. But that 
also feels wrong without prior discussion.

>
> Could you run the oe-selftest when submitting?
As addressed by Alexander Kanavin, this would take several hours. Since 
my technical equipment is limited, my build environment is blocked 
during this time. If this is a prerequisite for commits in oe-core, I 
can understand that, because time is always a factor, but I would rather 
stop sending commits to oe-core, simply because the hurdles would be too 
high for me.

