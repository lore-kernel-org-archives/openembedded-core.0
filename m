Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0E0E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 10:55:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.11251.1733309712303319021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 02:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WJkF9V65;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C0B01C0004;
	Wed,  4 Dec 2024 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733309710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VPWT8HqOKk8BX+2C8XiZphgnlBV2i+udv0B60IO/h20=;
	b=WJkF9V65tvB7XJPim6ZfCpr1wG+nPFpi9veOJA12L2xKaMzn52aSJtL40qLlRh/RJW5Lvq
	8t8GXDse+Jy/jZBtKIBq/29qT4QPpI9d6PT0g21SmmLJQZqXzbxR1jvDz4ZLyUAkaPAKTZ
	leUKNrcKUqIu4IcurLKd6p9m9BzkmAH0N5TkDE//RjbfPxo0Twj9FbqSyruvPfaLRevV+6
	5A1Bc5Stg4QRReyoBxLdrKxVX3jT1PuT6s7m1qgvB24LWkL2/fgGk2778ug6Fgs1VBckVm
	rZzWbhrhVXJwX0r5H9JjBQDYjjgIDFI6Za5PTpr8dJBWtk1Uza1O04w6UPW6pg==
Date: Wed, 4 Dec 2024 11:55:09 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 35/37] librsvg: update 2.58.2 -> 2.59.2
Message-ID: <Z1A1DRlmtB8eR7bk@bootlin-mathieu>
Mail-Followup-To: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
 <20241204064920.817016-35-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204064920.817016-35-alex.kanavin@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 10:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208276

On Wed, Dec 04, 2024 at 07:49:18AM +0100, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> Upstream has moved from autotools to meson, which requires a substantial
> amount of tweaks to the recipe.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Hi Alexander,

I believe this rsvg update is breaking builds on the autobuilder,
because of a failed patch apply:

ERROR: librsvg-2.59.2-r0 do_patch: Applying patch '0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-pi.patch' on target directory '/srv/pokybuild/yocto-worker/genericarm64/build/build/tmp/work/armv8a-poky-linux/librsvg/2.59.2/librsvg-2.59.2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/genericarm64/build/build/tmp/work/armv8a-poky-linux/librsvg/2.59.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-pi.patch
patching file gdk-pixbuf-loader/meson.build
Hunk #1 FAILED at 36 (different line endings).
1 out of 1 hunk FAILED -- rejects in file gdk-pixbuf-loader/meson.build
Patch 0001-gdk-pixbuf-loader-meson.build-do-not-look-for-gdk-pi.patch does not apply (enforce with -f)

https://valkyrie.yoctoproject.org/#/builders/60/builds/584/steps/11/logs/stdio

Can you have a look at this issue, please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

