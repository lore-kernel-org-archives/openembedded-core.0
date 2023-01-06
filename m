Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDBDC4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 16:27:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.18062.1673022423816010503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 08:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DANECzvs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 95AE6C000B;
	Fri,  6 Jan 2023 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673022421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6IGYJZzC72RTun0vr7S1lnfuLNX+1a8h6S/47aUfmD4=;
	b=DANECzvs9eRMOPPOA4tvpG9IneMWWecNXx6lIK2KigdOSgoSsHIBfxa2QYGNcW5+HPH150
	bVFQ4UMX2ROa9u2wM/Ar8aKOoLJxMa2b/KZQsxwdv/Jv7KSQaAdywg66hoC3Behyau3tGM
	lnbcAKsi9zRJhJG+wnWTDMaBJsxg0E0o7xD0dG4O5/3KOtkovlhubEF2t2UgM0ioo973uu
	oMYsFHntWf1abw2muR0sSzRqAE4Z4bobHh+wU/XSCO8JWY4Aanb9ZpWBcxG3SQjI549YVv
	XxlYkDo2CLC6zoqUM62qpCdB/urXUX/sFLACGor/quZuJo0+UxChZkIAuOiAzA==
Date: Fri, 6 Jan 2023 17:26:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv3] gcr3: update 3.40.0 -> 3.41.1
Message-ID: <Y7hL0YQK00Cdva/T@mail.local>
References: <20230106133300.2762884-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106133300.2762884-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 16:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175600

Hello,

On 06/01/2023 14:33:00+0100, Markus Volk wrote:
> diff --git a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> similarity index 63%
> rename from meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> rename to meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> index 5318768db6..6cbf8671f5 100644
> --- a/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> @@ -17,27 +17,30 @@ CFLAGS += "-D_GNU_SOURCE"
>  
>  GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
> -inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> +inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"

This part still doesn't apply on top of master, did you pull?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

