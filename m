Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4607C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 09:30:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.5379.1655976627465877227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 02:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iXFjjuyV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9ED7340003;
	Thu, 23 Jun 2022 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655976626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwuVYY8sVxCgDkZMNJKVQaYWYfbzZcUJbHhSVqsMaFY=;
	b=iXFjjuyVtBQgBAXgOxysvNuIlRCDPveWMP83hewxHoNebblckf+09fdNC1Pigv63Um70PR
	tK8f6PX0PpwKEKmX9z8GA5pzEUpoUxFtT2LL5nXY04BHboDNzMLDrjbcEg948zmPsnN1nI
	5KRilG1dO7Vep9cOJ76vj4Mqo/dtoxbfTyYqa8JodPDfcxcXcSYEjI6uQx77KQKfE7ir29
	WlG9da1lD6cG3Eo7ATavRPYQPd+S6aSZ1/L0smq6tsIvq5eoP4+djh3xX5cM7x1PpaSrUu
	ptUK4FxfUBukZPGpxR/YY4Xq7jELGSCvntd8MtcEl0Wv0WoAJJWdlJ0O1n0b5w==
Date: Thu, 23 Jun 2022 11:30:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "niko.mauno@vaisala.com via lists.openembedded.org"
 <niko.mauno=vaisala.com@lists.openembedded.org>
Cc: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] strace: Drop redundant oe_runmake
 parameter
Message-ID: <20220623113024.5a49c120@booty>
In-Reply-To: <20220622191615.10168-2-niko.mauno@vaisala.com>
References: <20220622191615.10168-1-niko.mauno@vaisala.com>
	<20220622191615.10168-2-niko.mauno@vaisala.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 09:30:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167265

Hi Niko,

On Wed, 22 Jun 2022 22:16:14 +0300
"niko.mauno@vaisala.com via lists.openembedded.org"
<niko.mauno=vaisala.com@lists.openembedded.org> wrote:

> PARALLEL_MAKE is now honored in ptest.bbclass, so drop redundant
> parameter from oe_runmake call.
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-devtools/strace/strace_5.17.bb | 2 +-

Thank you for your patches!

Unfortunately this patch does not apply as strace has been bumped to
5.18 by a recent commit. Could you send a v2 series with this updated
please?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

