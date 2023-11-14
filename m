Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF4CC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:05:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10298.1699959915842287102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P7KbQwd3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF6A8C0007;
	Tue, 14 Nov 2023 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699959913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+2d459wk3XnnAVrcvjviV6V5ChKj9ZFMdTqRbJnPwU=;
	b=P7KbQwd3aOVQIJQnE2NuizXf4VIDtZSycC1gnONV95iBS6dKmzrWcnAzEkZ3x7iBfI8teb
	K33F1GfFy828piDUdinGNT4p1mMJ3dbEw28dTIyTlyVjjrBCDMH534bLxnnpcCh3+dci+C
	f9aMrFKNu1q+XQ/wB6mdSGORiQQwXLFLF3JVeh6mXAVPeKnD1EruW7NWv0JYVTKxBNTeH1
	eu5sFMbTHoROwzys//hx/5Psy7TAcTPaQtDNTB5BGNam8hc7L+HiQ9/JKVpqsmnio9O0s6
	3bj49uuAMgQXhixfT4pJpxkimmIgNVthsXcA2Rz2F8W6RtEQxr4f4jiZhny/iQ==
Date: Tue, 14 Nov 2023 12:05:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: Re: [OE-Core][PATCH 1/2] patch: extract patches without diffstats
Message-ID: <202311141105125d3dde5e@mail.local>
References: <20231113135746.1047416-1-lukas.funke-oss@weidmueller.com>
 <20231113135746.1047416-2-lukas.funke-oss@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113135746.1047416-2-lukas.funke-oss@weidmueller.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190499

On 13/11/2023 14:57:45+0100, Lukas Funke wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Extract patches without diffstats to reduce changes during patch
> refresh.
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

This also need your SoB
> ---
>  meta/lib/oe/patch.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 4ec9caed45..71cd193afb 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -464,7 +464,8 @@ class GitApplyTree(PatchTree):
>          import shutil
>          tempdir = tempfile.mkdtemp(prefix='oepatch')
>          try:
> -            shellcmd = ["git", "format-patch", "--no-signature", "--no-numbered", startcommit, "-o", tempdir]
> +            shellcmd = ["git", "format-patch", "--no-signature", "--no-numbered",
> +                        "--no-stat", startcommit, "-o", tempdir]
>              if paths:
>                  shellcmd.append('--')
>                  shellcmd.extend(paths)
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190471): https://lists.openembedded.org/g/openembedded-core/message/190471
> Mute This Topic: https://lists.openembedded.org/mt/102561450/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

