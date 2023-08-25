Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B87C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:24:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9135.1692951884297072701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PzybMOZN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C2C91C0006;
	Fri, 25 Aug 2023 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692951881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pkyRRZ+V1sL4LusJsLK+fKty1BRPCVdWXUUt1OdSN5k=;
	b=PzybMOZNuh+ide4e1GmwPmgx9z+OYahSukkGwQGJuC4QI2W4r0UMhRzNNUWqAdKiklkH8h
	MXj+f1gxhtdUidfZfD75Od2+nX//4mpZyVHguWSPdnBxx3zhFMy51edloedvo2AgdYEEP3
	6GD3Fi9jgDdFgxWzinVDuUBsdB8CJuodA4GsAeWKCqtA5xyUUoM8oXRJHw8wEGf1tTZmyT
	nGCNr1qUxZxR8HU11KSv5m+u0pkhfmz2AlmokfZh2pJSKBxlIs6l3O5LtI+mjECjbQbnN8
	F6lGZXUkhYhZwPHTDFD2tIFW5BfHESnTs/4cT4KjGcuM7msN7Mss7pC4kevc5g==
Date: Fri, 25 Aug 2023 10:24:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Emil Kronborg Andersen via lists.openembedded.org"
 <emkan=prevas.dk@lists.openembedded.org>
Cc: emkan@prevas.dk, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH 0/3] add missing CVE_PRODUCT
Message-ID: <20230825102439.10f9f041@booty>
In-Reply-To: <20230824140747.45594-1-emkan@prevas.dk>
References: <20230824140747.45594-1-emkan@prevas.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 08:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186700

Hello Emil,

On Thu, 24 Aug 2023 16:07:44 +0200
"Emil Kronborg Andersen via lists.openembedded.org"
<emkan=prevas.dk@lists.openembedded.org> wrote:

> Some recipes does not have 'CVE_PRODUCT' set, and will thus pass a check
> against the NIST database with 0 CVEs, even though there could be
> several.
> 
> Emil Kronborg Andersen (3):
>   libopus: add CVE_PRODUCT
>   lcms: add CVE_PRODUCT
>   snappy: add CVE_PRODUCT
> 
>  meta-oe/recipes-extended/snappy/snappy_1.1.9.bb   | 2 ++
>  meta-oe/recipes-multimedia/libopus/libopus_1.4.bb | 2 ++
>  meta-oe/recipes-support/lcms/lcms_2.15.bb         | 2 ++

These patches should be sent to the meta-oe mailing list.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

