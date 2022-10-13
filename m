Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF8EC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 07:31:11 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.4886.1665646263053186287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 00:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bMgxxgK8;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9114A100003;
	Thu, 13 Oct 2022 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665646261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8cUG+b8LdPv9k/0JxyQfpauj2YHAOBS4Mf99v+lo0e0=;
	b=bMgxxgK8tEJuohbdNiWz17Ssih947m0VrWNQGUWo6fNOCEP+5/IrCF+g9fcD7od61rJKQc
	OEzUIHrpsXdAfiWdA74Q4chf/eeuip8x+mdbooNF9utalg2xd8Qp5gdk45vQlX+TdxUbJa
	9i7eK6a18NrvIV6RQssLF5Hz145YW05Y/hxWXhsQkMdm6fqU+karSiHrAm5x36Rn3YZg10
	P2piO3dXV4PY130FarVuljia9L642Zq6roZ8QTR97uSh65J+UN+LvbzzRUYlhGsGXqhPhN
	qskK/rw4qdup0rKQFrVh4nuyyEqBrfLKPCzqLGfMqhIChTnLGNshN4sIv3os5A==
Date: Thu, 13 Oct 2022 09:31:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.50.10 -> 1.50.11
Message-ID: <Y0e+tHIDlUmpmsuj@mail.local>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
 <1665475558-16409-4-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1665475558-16409-4-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171683

This causes ptest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4115/steps/12/logs/stdio

 'pango': ['pango/test-no-fonts.test']}

On 11/10/2022 16:05:57+0800, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../pango/{pango_1.50.10.bb => pango_1.50.11.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/pango/{pango_1.50.10.bb => pango_1.50.11.bb} (94%)
> 
> diff --git a/meta/recipes-graphics/pango/pango_1.50.10.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
> similarity index 94%
> rename from meta/recipes-graphics/pango/pango_1.50.10.bb
> rename to meta/recipes-graphics/pango/pango_1.50.11.bb
> index 95209889a8..1120e053b8 100644
> --- a/meta/recipes-graphics/pango/pango_1.50.10.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
> @@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
>              file://0001-Skip-running-test-layout-test.patch \
>  "
>  
> -SRC_URI[archive.sha256sum] = "7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966"
> +SRC_URI[archive.sha256sum] = "8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae"
>  
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171603): https://lists.openembedded.org/g/openembedded-core/message/171603
> Mute This Topic: https://lists.openembedded.org/mt/94254215/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

