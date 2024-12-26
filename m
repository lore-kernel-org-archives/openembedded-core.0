Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F40E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 09:42:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.19476.1735206145659990934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 01:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XJAqdKFi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 149C060007;
	Thu, 26 Dec 2024 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735206143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jB/UWWSQ11J44l9R9UVPSqpLWpUW+Qs/5OG+++jOXk=;
	b=XJAqdKFiRuUfh/Hc6WrdGKGYugRiA0vcMuE7Pgu7eO+4q7M2QqoDr1GCQaSym/66xvpUwM
	Axo02KggRjnqQdbmOmr8BRYBfcwpeLAtaQrrAQyuSZaJju1hzazKCGwjMUPVoUYRAZlULD
	jYiEkrvlkwTGnXE+7lGtgv+3jN59amljcVvHnwXjQxOmVMVwXZF3+kQNWDXJ72U0KwnoOd
	32ayE0DA9czQlk1Dfa81WCkAcHK+hi5FRF6Opmf9H4gSvyOM6t1GTmmasBm0pX9HsUFTZL
	PVhWXYh0kgZW2R2mVtNUnT9Qw07tPotuIkZScXsy1W8LqobMmm4QHrTlYwnwfg==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 10:42:22 +0100
Message-Id: <D6LJ8P97UJIR.2ZV3G9G2APPTE@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] gettext: upgrade 0.22.5 -> 0.23
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>,
 <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241225103244.3514559-1-marcel@ziswiler.com>
In-Reply-To: <20241225103244.3514559-1-marcel@ziswiler.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Dec 2024 09:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209087

 On Wed Dec 25, 2024 at 11:32 AM CET, Marcel Ziswiler wrote:
> Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> ---
>

Hi Marcel,

I'm taking this patch in my branch, but just a quick note: it looks like
you setup is breaking the patch format while sending it, so picking it
is a bit painful. Particularly, it looks like it drops spaces on line
ends, which do mess the changes on patches.

Can you fix this for your next patches please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


