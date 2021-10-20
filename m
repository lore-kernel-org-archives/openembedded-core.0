Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF49C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 07:42:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.4743.1634715754176044610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 00:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 27D7220007;
	Wed, 20 Oct 2021 07:42:31 +0000 (UTC)
Date: Wed, 20 Oct 2021 09:42:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Randy MacLeod <rwmacleod@gmail.com>, alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com, Vinay Kumar <vinay.m.engg@gmail.com>
Subject: Re: [PATCH v3] Re: [OE-core] [PATCH v2 2/3] Rust cross testing file
Message-ID: <YW/IZh8+WQlBWSlw@piout.net>
References: <YVTwuSLx+HyyIDkV@piout.net>
 <16A988E1BC842A91.3292@lists.openembedded.org>
 <CALY49845oK2-9FQz0Qo5GM0eZ35FePWhuB_Baa=_tK8TC99a=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CALY49845oK2-9FQz0Qo5GM0eZ35FePWhuB_Baa=_tK8TC99a=A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 07:42:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157252

On 20/10/2021 12:38:54+0530, pgowda cve wrote:
> Hi,
> 
> Gentle ping on this patch set.

There are still issues with that series and I replied the following a
while ago:

https://lists.openembedded.org/g/openembedded-core/message/156655


"I got the following (cryptic) failures today:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/4100/steps/18/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4094/steps/18/logs/stdio"

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

