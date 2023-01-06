Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B86CC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 12:37:20 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.12365.1673008638569128676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 04:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jxgWfxaq;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E1A40100009;
	Fri,  6 Jan 2023 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673008636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iN50ykiiJNqz/OyB5nnGSreKhucYpgUnB2hJwvj4Yfg=;
	b=jxgWfxaqkvkheCBW0uZcoZDpymtQZgcEgLI64eRk960c0meLl+a6Cwrxarh7DUDZK1LmPE
	qpItU0TI7bLSdFNgDMDRqRseeh6CeIdlOX6SREmWVtXt1S4lEdh6Y7mbZDTUZ9qObKTj+d
	l/RMrnXEa5bqh/04AMe/T6X0DqhVl1MToA+kU1k8NVlbQmXtfc2FF5poaFcsZ/tmNjgf1R
	Qarf/6Vh5ZvdTe5vRxzVhp0gWdIaH7q0njfq7Mda8j5/RTrgxg2+eAeyD/ctmpIjOtv/0Y
	gy40WrO8pt52jPrVOKwRECQmsETCw7iYC+4hzgaG4700/4/6RCAy3voPI9qhaA==
Date: Fri, 6 Jan 2023 13:37:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: karn.jye.lau@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] freetype:update mirror site for package
 download.
Message-ID: <Y7gV+y+kGjNBA74W@mail.local>
References: <20230106090045.32131-1-karn.jye.lau@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106090045.32131-1-karn.jye.lau@intel.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 12:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175582

Hello,

This doesn't apply on master, can you rebase?

On 06/01/2023 17:00:45+0800, karn.jye.lau@intel.com wrote:
> From: KARN JYE LAU <karn.jye.lau@intel.com>
> 
> update SAVANNAH_NONGNU_MIRROR to SAVANNAH_GNU_MIRROR
> to resolve package fetching issues.
> 
> Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
> ---
>  meta/recipes-graphics/freetype/freetype_2.11.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
> index 5b464d3d70..d425e162bc 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
>                      file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
>                      file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
>  
> -SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
> +SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
>             file://CVE-2022-27404.patch \
>             file://CVE-2022-27405.patch \
>             file://CVE-2022-27406.patch \
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175563): https://lists.openembedded.org/g/openembedded-core/message/175563
> Mute This Topic: https://lists.openembedded.org/mt/96090237/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

