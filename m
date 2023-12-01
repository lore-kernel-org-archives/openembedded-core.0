Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497E5C10F04
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 08:16:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.18114.1701418563521059086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 00:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RyIeMvUY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53B5060006;
	Fri,  1 Dec 2023 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701418561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOtMqAXThjZrReJREYZkWfb2uo4ED65cU+c9hDUmWRk=;
	b=RyIeMvUYTZGkNtILVX4J51bhHqZTAxc4hwUrV85Cl1kAvWK58vprjPYhS4xm4Ho8zjxIfg
	iXqA5Y3Udo+njzGIG7srt8rW9LMGcppQAkJqC9keiHsEkhmwyv9ZB8mtbNSMipSDeIJZXZ
	4xBoM0MGfV3ps3/YQg0rFlF6+IjoBhAzyRZDvsIlDCo4pruDrUo0Ar4VD8k+rjwwyPCxRd
	bXWYPNox+3Y2AdPTJSOzG4BQu3uYYb/Rr6n72/4hbFL39nVEF3N7cjZ+TIemFQQXeofvlT
	Z+KhCM4/Re1y8w5whKR/hwJNGep+SuQrwEwOCMlf+5a64Y5o5b1jaXU/hT1YIg==
Date: Fri, 1 Dec 2023 09:16:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] gnu-config: Update to latest revision
Message-ID: <202312010816005c17f058@mail.local>
References: <cover.1701157879.git.liezhi.yang@windriver.com>
 <7701bc572c2df6c9fb52f2a699b48b3afbafd343.1701157879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7701bc572c2df6c9fb52f2a699b48b3afbafd343.1701157879.git.liezhi.yang@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 08:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191561

Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

On 27/11/2023 23:55:06-0800, Robert Yang via lists.openembedded.org wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> index 2a0e6f8e41..718f798a00 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> @@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> -SRCREV = "63acb96f92473ceb5e21d873d7c0aee266b3d6d3"
> -PV = "20230216+git"
> +SRCREV = "28ea239c53a2d5d8800c472bc2452eaa16e37af2"
> +PV = "20231127+git"
>  
>  SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
>             file://gnu-configize.in"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191338): https://lists.openembedded.org/g/openembedded-core/message/191338
> Mute This Topic: https://lists.openembedded.org/mt/102846999/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

