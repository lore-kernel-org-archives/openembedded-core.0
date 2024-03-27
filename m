Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D00EC47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 12:45:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.36600.1711543550913584836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 05:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FPPgQRqm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C1B81C0003;
	Wed, 27 Mar 2024 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711543548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBCQFklJfb4dCSv7kKsPdKwDGafpwhuUjxk3WAI0nGA=;
	b=FPPgQRqmbwNqM/o2c6KcC4O6OStrC9fTxGHL5srztt+uDKbY5YuCF2zidF6a48zoMg3RRF
	1YA9IS6DinVKD3i8J4uikEHHGmbPR7Fk/x8wOsIEYLFAhTeDGhtUdZc4XycP6t8Q4LxhM2
	N64h2hgkMa7nm/TWfNact66vFsQ73U8s5aBjckW3hetk7HIFCbxHixjc0fbLeUxjbzFSsA
	DaHbDou6iyU1pSgbkbu2+9tOe1cGZlNxIRECr54SxkK4Z1+VPdEuTiklSwA+vF3ft7ntYn
	A8dmyIZIPSUQpEan2ueTjrhYF5tWwYAR5SRo6kqe4f7tahgBZqsLVL6eCQBcwg==
Date: Wed, 27 Mar 2024 13:45:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core] [PATCH 31/34] spirv-tools: upgrade 1.3.275.0 ->
 1.3.280.0
Message-ID: <20240327124547d0f35755@mail.local>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
 <1711413292-3025-31-git-send-email-wangmy@fujitsu.com>
 <CANPvuRm4rOYNstWRR1d+koEigLJvnzCsnNrBhEOU-naEx70TuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANPvuRm4rOYNstWRR1d+koEigLJvnzCsnNrBhEOU-naEx70TuA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197556

On 27/03/2024 11:34:42+0000, Jose Quaresma wrote:
> Hi Alexandre,
> 
> I see this is still on
> https://git.yoctoproject.org/poky-contrib/log/?h=abelloni/master-next but
> it should be dropped
> because it is included in the vulkan v2
> https://lists.openembedded.org/g/openembedded-core/message/197546
> 
> This spirv and glslang recipes should be updated in lockstep with vulkan as
> printed by AlexK on
> https://lists.openembedded.org/g/openembedded-core/message/197529

Note that I took the spirv patches only once there was the vulkan
update so it is not *still* there.
This is super frustrating because the vulkan upgrade commit changelog is
not a replacement for the spirv upgrade commit changelog.

> 
> Jose
> 
> 
> wangmy via lists.openembedded.org <wangmy=fujitsu.com@lists.openembedded.org>
> escreveu (ter�a, 26/03/2024 �(s) 00:37):
> 
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Changelog:
> > ==========
> > - Add tooling support for SPV_KHR_maximal_reconvergence
> > - Add support for SPV_KHR_float_controls2
> > - SPV_KHR_quad_control
> > - Fold 64-bit int operations
> > - update image enum tests to remove Kernel capability
> > - Support operand kind for SPV_INTEL_maximum_registers
> > - SPV_NV_shader_atomic_fp16_vector
> > - Support for SPV_QCOM_image_processing2 (#5582)
> > - Fix access chain struct checks
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../spir/{spirv-tools_1.3.275.0.bb => spirv-tools_1.3.280.0.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-graphics/spir/{spirv-tools_1.3.275.0.bb =>
> > spirv-tools_1.3.280.0.bb} (96%)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> > b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> > similarity index 96%
> > rename from meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> > rename to meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> > index 05c6de1b50..d2b6acf946 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> > @@ -7,7 +7,7 @@ SECTION = "graphics"
> >  LICENSE  = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >
> > -SRCREV = "f0cc85efdbbe3a46eae90e0f915dc1509836d0fc"
> > +SRCREV = "04896c462d9f3f504c99a4698605b6524af813c1"
> >  SRC_URI = "git://
> > github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
> >  PE = "1"
> >  # These recipes need to be updated in lockstep with each other:
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197520):
> > https://lists.openembedded.org/g/openembedded-core/message/197520
> > Mute This Topic: https://lists.openembedded.org/mt/105150547/5052612
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > quaresma.jose@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
> 
> -- 
> Best regards,
> 
> Jos� Quaresma

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

