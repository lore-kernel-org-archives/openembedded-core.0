Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E848BC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:05:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5963.1788329109766088362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 23:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c10jSqM7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9F4F1A1948;
	Wed,  2 Sep 2026 06:05:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF4DF6053C;
	Wed,  2 Sep 2026 06:05:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD45A11C792A0;
	Wed,  2 Sep 2026 08:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788329103; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0diwYMkkUnNP9QM8Ke9FIBTXHUOf+eiapqgESz9WLfQ=;
	b=c10jSqM7GNPomtkgxAxK//grlbk63XJsg/t/53s7k0JeNl+8svSM5p40NnJRjZqIbzP5bv
	Sj04aoCUbeSYUEYXk3CSLq7BC8RVIFGmieRexOpQy2ywZHNe7zm+drfzGv6dYj4Ra7lDtL
	GHtz/bokgMxvbsKemOvfCvq2DdcjP/X+4mkGveGU9/K9vtKK3usRq2qFDln4m3Zb21Y+A6
	YHbNU4qJYVorbjjbM7zoSkgYVTh5ouL12zuabCcCevaYpoaK1SwT5CzCx+zjW1N/Oa5Uv1
	i4JIKHvzgL/Zx7bqqrmhuKhl3eSB3V5QQzpJ2SUO6Czns5GVb1owZZ6gBJRgQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 08:04:52 +0200
Message-Id: <DL4LR7AUVO90.17P2E4E677Q7V@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-spdx-python-model: : relax shacl2code
 version constraint
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828092357.1248-1-wangmy@fujitsu.com>
In-Reply-To: <20260828092357.1248-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244888

On Fri Aug 28, 2026 at 11:23 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> shacl2code has been upgraded to 1.2.0, but spdx-python-model 0.0.6
> still requires shacl2code=3D=3D1.1.0. Temporarily relax the version
> constraint to allow shacl2code 1.2.0 until upstream updates their
> dependency requirements.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...acl2code-dependency-to-support-1.2.0.patch | 28 +++++++++++++++++++
>  .../python/python3-spdx-python-model_0.0.6.bb |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-spdx-python-mode=
l/0001-Update-shacl2code-dependency-to-support-1.2.0.patch
>
> diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-=
Update-shacl2code-dependency-to-support-1.2.0.patch b/meta/recipes-devtools=
/python/python3-spdx-python-model/0001-Update-shacl2code-dependency-to-supp=
ort-1.2.0.patch
> new file mode 100644
> index 0000000000..3da9f6766b
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-Update-=
shacl2code-dependency-to-support-1.2.0.patch
> @@ -0,0 +1,28 @@
> +From 45efed593eaed035dbcc9888d45e362cdbc6ec28 Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Fri, 28 Aug 2026 05:22:57 +0000
> +Subject: [PATCH] Update shacl2code dependency to support 1.2.0
> +
> +Upstream-Status: Inappropriate [needs proper upstream upgrade]

Is this really a valid Inappropriate reason? I feel that either
python3-spdx-python-mode works well with this version and we should
submit this patch upstream, or it doesn't and we shouldn't use this
patch.

Github is done now, so I can't check bug entries. Did you open a
discussion upstream?

> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + pyproject.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index 94b511c..6255f25 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -49,7 +49,7 @@ issues =3D "https://github.com/spdx/spdx-python-model/=
issues"
> + requires =3D [
> +     "hatchling >=3D 1.27.0",
> +     "hatch-build-scripts >=3D 0.0.4",
> +-    "shacl2code =3D=3D 1.1.0",
> ++    "shacl2code =3D=3D 1.2.0",

Also, there is a shacl2code 1.3.2 now, so if possible, we should
probably use=20
+-    "shacl2code >=3D 1.1.0",

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


