Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE02C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 16:05:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.99.1678896310296566611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 09:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WlUbSoBl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 90D1240008;
	Wed, 15 Mar 2023 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678896307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+VtHfbMz+pDbgQaaUoZ9ZCaZ8ZZrzM/n13OvttqBmhM=;
	b=WlUbSoBlJZciBSjiOBMUtOEA6Q2ZmGPIJZB3QYDgEmWhL9sS2ketvKY1NdXY3gBKmjJaYy
	En0Ct97JzMndmO6SLSFx8llqZsH+JCAehyBjRZlvAhQkbEUBot62suSsOILjY72g8aKDic
	dZjB/X/CV5s88r5WkWU9Eoc8tWqoY1ojsBTsj5gM5YFBx9whuPX8W9LrZg82/H19LYk2FN
	ujabRlk8t4AsIjn7ar4hgsTqQ2WfX1O4HDrbkk8IqoJWQcr2pmnkXcUkQVXDPWPLz4e0+3
	MNWaJnQYS8FLUxw7HzN6k+wLVLVnEsSf1pGU/GQXgM2nyfU+Ny6lU7yKPwH+2w==
Message-ID: <73453b19-b700-be9d-a972-09585c682011@bootlin.com>
Date: Wed, 15 Mar 2023 17:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] libpng: Enable NEON for aarch64 to enensure
 consistency with arm32.
Content-Language: en-US
To: leimaohui <leimaohui@fujitsu.com>
References: <1673321469-27718-1-git-send-email-leimaohui@fujitsu.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1673321469-27718-1-git-send-email-leimaohui@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 16:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178648

Hi Lei,

On 10.01.23 at 04:31, leimaohui wrote:
> NEON is enabled for aarch64 by default, so, to ensure consistency with
> arm32, reference to libpng-1.6.38/configure, added
> enable_hardware_optimizations option for aarch64.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>


Many thanks for your contributions to the project!

However, for future commits, we'd need you to do add one thing to your 
git configuration, so that your patches are given an "Author" field 
which matches your "Signed-off-by" information. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity 
for details.

Don't hesitate to send a patch test directly to me, if you wish.
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


