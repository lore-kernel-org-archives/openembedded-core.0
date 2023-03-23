Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03727C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 19:10:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.82149.1679598623996497804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 12:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ECNpBmb/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96F2020007;
	Thu, 23 Mar 2023 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679598622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKQE6xTAKzGytGK8loNR3mgI1cFED8pmHG9tN9r8H2o=;
	b=ECNpBmb/4djb2771i1MLESRKI3zPq2D83cZUXetcoC+0eG+2BvlyBtOSmIYY1jxdT7+HUH
	BeqAEp8IKbP3+dc8DlOrsy1fARwi3IShpVFisart8NZjzXXxdV7UVVcLxqrybRp5v0D4cd
	+NZEEotRmA6jfbu6BsyVRw1YQUDurjePWRSFe5Kh0JJFo00y4vFI2xXzxpe+znmEFDW4VH
	4IoKGFDgngculWQGaTvY/V9wYzw620KXKYrcrm+94xkYwAtCVss94PI6I0K9Khbp03LpJT
	eGqM+XYZSfH6CBDr3lQaXm6e5CjzNY82SuLQbkjpSuMtve6kZdLv0Q/nxh/jHA==
Date: Thu, 23 Mar 2023 20:10:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] maintainers.inc: add debugedit maintainer
Message-ID: <20230323191021df528b78@mail.local>
References: <20230323083504.3628-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323083504.3628-1-Qi.Chen@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 19:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178990

Please squash this one with your v2 so this is bisectable.

On 23/03/2023 16:35:04+0800, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index c76447a25d..682ec2cfdf 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -135,6 +135,7 @@ RECIPE_MAINTAINER:pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-dbus-wait = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
> +RECIPE_MAINTAINER:pn-debugedit = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
>  RECIPE_MAINTAINER:pn-depmodwrapper-cross = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178971): https://lists.openembedded.org/g/openembedded-core/message/178971
> Mute This Topic: https://lists.openembedded.org/mt/97796827/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

