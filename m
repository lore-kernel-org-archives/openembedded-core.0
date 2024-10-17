Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C39CD37489
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:19:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.48142.1729171178054802055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fdZ5FJk7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A65A3240009;
	Thu, 17 Oct 2024 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729171176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Oj7fUigzufzV7M74ZnxgTBEopVVlG4X0Y154iGqJw0=;
	b=fdZ5FJk7LiWT9f2AOMcjkcKu+B3nzTREaX+WPgyendb7ZaA6FDsYA49i+DXqZuRw1yJt4G
	UDT9hDc/kXznLGi5rUcBYKLSC7J5UmZ5YAy2b4iAwx8o3kI/o0UG3xYuGBXnQVEFcIQh4F
	fZbiM1qPFPYwMBDm5lt0tdf4bezPyygd6sZ2iKYQ0i9JG1mfyIWEOImG1k7M1YZBdgNdF+
	foUM+4CwW1pNX9Sg6Dfp1TFoNL/T+sM469lDwJ35jAh9sTiAaa+X08jxMvFzYvmuKL27pa
	xUZcDjkfrrg2LMC8qm92NM3iBtlx6FpPGgZyUWKvj3eRe0CjMEp2KXfOScqxrw==
Date: Thu, 17 Oct 2024 15:19:31 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, marex@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH RESEND] u-boot: upgrade 2024.07 -> 2024.10
Message-ID: <ZxEO4yJA4VVLQdsN@bootlin-mathieu>
Mail-Followup-To: Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org, marex@denx.de,
	Fabio Estevam <festevam@denx.de>
References: <20241014113549.1594444-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014113549.1594444-1-festevam@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206018

On Mon, Oct 14, 2024 at 08:35:49AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Upgrade to U-Boot 2024.10.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Hi Fabio,

I tried to apply your patch, and I got the following error on the
autobuilder:

ERROR: u-boot-1_2024.10-r0 do_patch: Applying patch
'0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch' on
target directory
'/srv/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/u-boot/2024.10/git'
CmdError('quilt --quiltrc
/srv/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/fvp_base-poky-linux/u-boot/2024.10/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch
0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch
patching file arch/arm/include/asm/system.h
Hunk #1 succeeded at 163 with fuzz 2 (offset 9 lines).
Hunk #2 FAILED at 376.
1 out of 2 hunks FAILED -- rejects in file arch/arm/include/asm/system.h
patching file arch/arm/mach-exynos/include/mach/system.h
Hunk #1 FAILED at 36.
1 out of 1 hunk FAILED -- rejects in file
arch/arm/mach-exynos/include/mach/system.h
Patch 0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch
can be reverse-applied

https://valkyrie.yoctoproject.org/#/builders/75/builds/249/steps/12/logs/stdio

Can you have a look please ?

-- 
Mathieu Dubois-briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

