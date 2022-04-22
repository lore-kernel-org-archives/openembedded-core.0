Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE1EC54EFE
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.7675.1650629996722767311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 05:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O/a9+OX8;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 49E1E240002;
	Fri, 22 Apr 2022 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1650629994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJ65fzY+e7y6VX5qBIDeEDGdIvhBaJkp9pyVj1bLhDY=;
	b=O/a9+OX83AHE0/6SUC7eCnu32YJVVWbbiP3ZrO8eDYRMbvTSA8ilmN1u33+HvezXzZNafV
	nPx+xgI6o3dfG7LpAboaKm5+tFEB9MBYTeMrnjKDG29OuiDokUEOuFgf+DzglFGsLKdolY
	8IBV/o1rDkj+QnCeUDQzIJlJqaEQhAE9deaHWs8Mu9o4+Gs/vTldIOmCqGKNDmsFTF6tWa
	TUfiKAJ8UPqLorZsl3sfGEewId5ymAExGBOb2x2OcFLoGbhwEIJw5pLfxDLJbUfHszjZ8I
	yp9RW8yLg8w/FBlgiKub8otjOBML4UaA/geUgAqf5toVBhGw9p59BfKs+sV7jg==
Date: Fri, 22 Apr 2022 14:19:52 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] musl-locales: Add package
Message-ID: <20220422141952.7ea98580@melee>
In-Reply-To: <20220422061052.2577710-1-raj.khem@gmail.com>
References: <20220422061052.2577710-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164789

Hi Khem,

Il giorno Thu, 21 Apr 2022 23:10:52 -0700
"Khem Raj" <raj.khem@gmail.com> ha scritto:

> This package will provide a limited set of localedata for musl based
> systems. It will fill in into images when IMAGE_LINGUAS variable is
> set however the choice is limited to the given 13 locales as of now.
> 
> e.g.
> IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> 
> would work fine
> 
> Default locale can be set by exporting LANG=<locale> in /etc/profile
> or some such file e.g.
> 
> export LANG=de_DE.UTF-8
> 
> This will also help in ptest coverage with musl where some test
> packages expect locales e.g. pango to name one.
> 
> Do not empty out IMAGE_LINGUAS forcibly for musl anymore
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This patch is triggering build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/5401/steps/13/logs/stdio

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

