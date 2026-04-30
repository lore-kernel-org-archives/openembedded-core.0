Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48664FF886F
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 07:28:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14885.1777534101032554307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 00:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FwQeDlmv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 37FD64E42B73;
	Thu, 30 Apr 2026 07:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 067F660495;
	Thu, 30 Apr 2026 07:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D82271072B6F2;
	Thu, 30 Apr 2026 09:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777534098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6ZM6Do65Qwib6YQSpu0XOKAtiJhObhUbSkZzorxwEh8=;
	b=FwQeDlmvAjN2ujEdv5Ie4diewn8SNtJCnnatfy89CcBUV3QJzKZiRHwmd1fma894al10Fq
	KUimKdf+2n7ZjRi6XvaWuRRi11wANGe3wn9sdMx1fBsi0B1EexS3WvS8iIs01IQQB+3fbZ
	elsR3dpoJXtSBDPWqPYwg3Ko6TdUml6tNl4GJ/QNHpR7g+G12YlRmgL3tKPlK/BxgakNHL
	wmypAurObDhYEqTL/cMqf1UJaG/PI2BICEOFanbjHNT1/tXSzWtuRE/Ux1xT6W1vlJw75h
	gtHOZ9bnoEHfwp2QO3Ml21p++TsxnAQLICW39DIDSFfUz5x6BjhAVL30Wf7agg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 09:28:17 +0200
Message-Id: <DI6B8Z1L4R7N.FUR3IC2PYJWU@bootlin.com>
Subject: Re: [OE-core][PATCH] libfwumdata: add new recipe
Cc: <linux-amarula@amarulasolutions.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dario.binacchi@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236142

On Wed Apr 29, 2026 at 4:51 PM CEST, Dario Binacchi via lists.openembedded.=
org wrote:
> libfwumdata is a lightweight C library for parsing, validating (CRC32),
> and manipulating Firmware Update (FWU) metadata, allowing tools such as
> RAUC or SWUpdate, and in general any application, to modify the boot
> bank selection.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Hi Dario,

Thanks for your patch.

In addition to Alex comment, I note build is failing on the autobuilder:

ERROR: libfwumdata-0.1.0-r0 do_unpack: Recipes that set S =3D "${WORKDIR}/g=
it" or S =3D "${UNPACKDIR}/git" should remove that assignment, as S set by =
bitbake.conf in oe-core now works.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3709

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


