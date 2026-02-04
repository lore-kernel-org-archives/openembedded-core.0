Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C83E9D3FB
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:10:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22576.1770217815202006282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wmhqpti2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1D64C1A2BE2;
	Wed,  4 Feb 2026 15:10:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E715E60705;
	Wed,  4 Feb 2026 15:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46171119A8891;
	Wed,  4 Feb 2026 16:10:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770217812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QBFkryK9Ijd1/pUpDzV35BZKJL/AvoONJGO0cNZD6PI=;
	b=Wmhqpti2KsBa05z14t+LWFG7BSL/tAZik6P09XbYm26GWCTEIGe9lqmLTV+n/ls17svz2t
	gmemKmi+ahDY2eM8er0s4TyAIseDGGVyjLkWK7sbMvJXI35ymnGQMAUE9j+Ddm1UJhG0VM
	tmPG4AExwaf68eH1lWEzgdS4s2pfExNr/ihUnyyXDnSVJbhk5W+F74kzjtqYfEcwa8hX4x
	jpucVYCYX4kNx5JMaJWNzoKnvnvrkZT5hdthFryX/QXWGYNKUaqfWgEw+Wds1JHNlpKGlQ
	vxd+Ze2SS6MkFl/6v3I3ulCJo1bFm96XWQJsrI6LPdAj6bvcB1LyBNLSZzQ8wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 16:10:10 +0100
Message-Id: <DG69UBJXDGAR.2NFG8DOW45A61@bootlin.com>
Subject: Re: [OE-core] [PATCH] alsa-utils: fix packaging of alsabat
Cc: "Ross Burton" <ross.burton@arm.com>, "Max Krummenacher"
 <max.krummenacher@toradex.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <max.oss.09@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260126093655.2552127-1-max.oss.09@gmail.com>
 <CAEHkU3XDAvdfwd_kwiCxDDq8A7Dz3gcRsEfF=pK028qg9Ua7oA@mail.gmail.com>
In-Reply-To: <CAEHkU3XDAvdfwd_kwiCxDDq8A7Dz3gcRsEfF=pK028qg9Ua7oA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230541

On Wed Feb 4, 2026 at 10:50 AM CET, Max Krummenacher via lists.openembedded=
.org wrote:
> Hi all
>
> Gentle ping.
>

Sorry, I'm pretty sure I confused your patch with another alsa-utils one
at some point, and so dropped it by error.

It will be back in my branch soon.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


