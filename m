Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA81EA810A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 12:44:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18606.1770727447606698256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 04:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kljmUch0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 89C6B1A0D08
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 12:44:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59901606BD;
	Tue, 10 Feb 2026 12:44:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3E37119D114E;
	Tue, 10 Feb 2026 13:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770727444; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q03SWuPD+SDl1su8ieipvG1wBUYjeEGIGVz/Q70kxdA=;
	b=kljmUch0SWtbKsZtYG43LGHOtgZl8atIuvPWVSJVHKSfkUBK4gNRhX6j/FuYp+1UamW2LL
	f/3rzOniA9vizylYKvz0rmb948vuiJhqHUTiTHkNYDK4NQ/r5mt6obJu3dcmLLQuWVQqHc
	HlfYvRHgmOsBrS5YvgwygURAitJlhQVFn5G5emmBfGP4U1We/ONHSOt/TLseKUTdJIs3UW
	cZS3E9PuDatmcmNCnOzgcH42Poyjg3FmT6/LP1glRuAjw86+NijOhdfnCvzLoFjeC8eEZ2
	uUp/6u+7Yca0iqRXGGYK9I9ijuBGVIyFwXw9cz4SRGmOve/cJ02qlXrr8eCQoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 13:44:03 +0100
Message-Id: <DGBAHPIIQHXZ.1LY6EAM6X7Y2P@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] python3-pip: Backport fix
 CVE-2026-1703
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260209212506.51439-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260209212506.51439-1-adarsh.jagadish.kamini@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 12:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230893

On Mon Feb 9, 2026 at 10:24 PM CET, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch.

> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
> =20
>  inherit pypi python_setuptools_build_meta
> =20
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \"

There is an extra backslash before the ending quote.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


