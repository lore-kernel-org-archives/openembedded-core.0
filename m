Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67737C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:52:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4796.1783504370343906096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aXnVhPEd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 136C11A0ED6;
	Wed,  8 Jul 2026 09:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D58D560337;
	Wed,  8 Jul 2026 09:52:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C85E711BC32D0;
	Wed,  8 Jul 2026 11:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783504367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TWl/lLg/Z2Yjbs0CFlTFiQ2hO/Ep/YJqtaxanPdqaSw=;
	b=aXnVhPEd+8ByXDj68eFFA/RyLTyIi0htpZEt9xDkgcQd/7ay6z+1J4gfXTFNBovuiv+lFf
	zSDpznd2fiz086jg8iE/s9nJFuD4g0m2h8TCojXb9iOHm4D2VK+TXo/RSacUUJWvigZbal
	OPwExrAUTWyK1k4PboEkHuaGkrqynqLeRX6eA2A9vxS9JbMort+bpgf8bazeCHQov8t+XY
	Ww/G1LcKA+fp1QQT+qZGqBfYh2xzeKmQm15CAMz7mMOVx9azW69VUa2LazOLyN9xGvZEet
	pg0Pp/FZEpDWpV/lCWpxhBkwBvEnhfF7V/YI3ch1Z0wHGo05yZG2FV2lTr4GyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 11:52:43 +0200
Message-Id: <DJT3J5GX38YG.338OF4LLBVU92@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptools-scm: upgrade 10.0.5 ->
 10.1.2
Cc: <tgamblin@baylibre.com>, <randy.macleod@windriver.com>,
 <Shiva.Komati@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260708092252.1211669-1-HimaniRamesh.Barde@windriver.com>
 <20260708092252.1211669-3-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260708092252.1211669-3-HimaniRamesh.Barde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240453

On Wed Jul 8, 2026 at 11:22 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---
>  ...etuptools-scm_10.0.5.bb =3D> python3-setuptools-scm_10.1.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb =
=3D> python3-setuptools-scm_10.1.2.bb} (89%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.b=
b b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> similarity index 89%
> rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
> rename to meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> index 58eb963910..824758e3ee 100644
> --- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
> @@ -6,7 +6,7 @@ argument or in a SCM managed file."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D838c366f69b72c5df05c96dff79b3=
5f2"
> =20
> -SRC_URI[sha256sum] =3D "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb=
52ae26813d4838c3"
> +SRC_URI[sha256sum] =3D "24079818acc46e99aae0d65b8d511fafe965970d9cbd060c=
7b9f7275ded520fb"
> =20
>  PYPI_PACKAGE =3D "setuptools_scm"
> =20

Hi Himani,

We already have an upgrade to version 10.2.0 on the list:

https://lore.kernel.org/openembedded-core/20260706171701.70536-31-alex.kana=
vin@gmail.com/T/#u

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


