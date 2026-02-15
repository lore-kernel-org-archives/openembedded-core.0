Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327F3EF586E
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 16:32:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1422.1771173126928535934
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 08:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lxNBenKe;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 131A9C19D3D
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:32:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C1C1606CD;
	Sun, 15 Feb 2026 16:32:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89C4D102F1D19;
	Sun, 15 Feb 2026 17:32:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771173123; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8IbdcPeY99T0IzOojFiIDj9KeY/vGWAJUGImbBBxcEQ=;
	b=lxNBenKe6bM2/5BNhD/vkwSkxUtHV514ZUtjf6psBmlqmTezNpcPiGO+56Vl3UbzKkaP/0
	NhPzqC7KlsEsETMPe/MP8tAwuFavMqpecY5vaExImJV1y88nhbrcRXNyCj3LZ/KK6QnOAJ
	Qf4+lRSl8wairTviznRQJeMidIML6f2Pi36lrgZIzCuhLP+L2q8YS/R/+h0aWM62AclAI3
	XAd/UL0L3O+L6h6NhJjaLMrFB78dIuibidH31nllRyXOCUgE4CjRFnq/dZ3c6r67a3qVxU
	wa9TXsU5Jr73m5iGplHywQ7+amMuGhjIrz5CE+oBlWV39pbkAm2MUaQCoGDN3w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 17:32:01 +0100
Message-Id: <DGFOGZFG9RCO.2210182JJUNRG@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: Stop supporting sysvinit
 compatibility
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260213175618.1801591-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260213175618.1801591-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231159

On Fri Feb 13, 2026 at 6:56 PM CET, Richard Purdie via lists.openembedded.o=
rg wrote:
> Systemd has worked with sysvinit compatibility but upstream plans to remo=
ve
> this and hence we will no longer be able to support it. We need to remove=
 this
> before the LTS since the support will certainly not be there for the life=
time
> of the LTS.
>
> This patch disables that usage mode and removes some of the compatibility=
 logic.
> There is more that can be removed, this is meant just to signal to people=
 it is
> no longer supported and start that process. Further cleanup can be made o=
ver time
> in later commits.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hi Richard,

I suspect we also want to remove the "Systemd with sysvinit compat" and
"Sysvinit with systemd" steps from qa-extras2:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3165
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n156=
2

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


