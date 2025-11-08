Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D2DCCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 07:52:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1684.1762588365084658469
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 23:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Pm1HZXPM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A9AF1A1947
	for <openembedded-core@lists.openembedded.org>; Sat,  8 Nov 2025 07:52:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC4E060710;
	Sat,  8 Nov 2025 07:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6063A118514CD;
	Sat,  8 Nov 2025 08:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762588362; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ljv2COrjLR7L/RUR3+2HPJ1HF754BETf/nBpRxYHVC8=;
	b=Pm1HZXPMmvrtBe1eaAZ34mDUrJJagik5iiA7iHDqXD+rG+iPcstQxovj3eWOTaCLbvIyLe
	HFlngulqsxY8l1mKbi1XYFEPamrnR3j3vm2gvvjZU/sjZOTNP/4sLiDvY3guEU2SOJ6GbY
	9xR/w9U1ilfrWg6GKH4Qi74WLjSbPELgJblvVD1lKj25rV5oJJotOYOg3NkwB9hDeeY4qU
	kgZCitfAqzum643dMxiAcJ95bI/kBbFbXBwa544yo6GOsxCas4OzfMbNgjxU9eDLHwrkss
	VtLjNeHJl4q6f1yVnSeH/nXTyG4qqX3+4otj0Gmpqnxz72RSIEz7ipwEwibDUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 08:52:40 +0100
Message-Id: <DE35FEGOLJK5.C1B3O2A9MVY7@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/4] nghttp2: upgrade 1.66.0 -> 1.68.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 07:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226074

On Thu Nov 6, 2025 at 9:45 PM CET, Ankur Tyagi via lists.openembedded.org w=
rote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
> https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
> https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for your patch.

It looks like there are some new installed files that are not shipped:

ERROR: nghttp2-1.68.0-r0 do_package: QA Issue: nghttp2: Files/directories w=
ere installed but not shipped in any package:
  /usr/lib
  /usr/lib/cmake
  /usr/lib/cmake/nghttp2
  /usr/lib/cmake/nghttp2/nghttp2Config.cmake
  /usr/lib/cmake/nghttp2/nghttp2Targets.cmake
  /usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake
  /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2701
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2533
https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/2683

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


