Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADE4C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 07:12:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.8859.1635232335001260556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0A3441BF20F;
	Tue, 26 Oct 2021 07:12:12 +0000 (UTC)
Date: Tue, 26 Oct 2021 09:12:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] vte: upgrade 0.64.2 -> 0.66.0
Message-ID: <YXeqTKfLanapV1cn@piout.net>
References: <1635172130-18376-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635172130-18376-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 07:12:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157374

Hello,

This failed with:

./vte-gtk3-scan: error while loading shared libraries: libpango-1.0.so.0: cannot open shared object file: No such file or directory

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2249/steps/11/logs/stdio


On 25/10/2021 22:28:50+0800, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-support/vte/{vte_0.64.2.bb => vte_0.66.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/vte/{vte_0.64.2.bb => vte_0.66.0.bb} (95%)
> 
> diff --git a/meta/recipes-support/vte/vte_0.64.2.bb b/meta/recipes-support/vte/vte_0.66.0.bb
> similarity index 95%
> rename from meta/recipes-support/vte/vte_0.64.2.bb
> rename to meta/recipes-support/vte/vte_0.66.0.bb
> index a79f2e4451..3b9c359507 100644
> --- a/meta/recipes-support/vte/vte_0.64.2.bb
> +++ b/meta/recipes-support/vte/vte_0.66.0.bb
> @@ -20,7 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
>  
>  # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
>  SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
> -SRC_URI[archive.sha256sum] = "2b3c820b65a667c1d8859ba20478be626d1519cc3159dac25f703330c6d07e18"
> +SRC_URI[archive.sha256sum] = "d0813ac00fb1d74d88851e765f755d496c83e097097358ea1baadb38b37b7b33"
>  
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157348): https://lists.openembedded.org/g/openembedded-core/message/157348
> Mute This Topic: https://lists.openembedded.org/mt/86578294/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

