Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5A0D49C74
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 08:28:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6407.1769761725935588973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 00:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UdOcwgCa;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 48162C22F5A
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 08:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E93436075A;
	Fri, 30 Jan 2026 08:28:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA3A7119A885C;
	Fri, 30 Jan 2026 09:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769761723; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rvMmtfU6Saoz4/Vuj2Cbi5OleOr9FTmTpNqO37tCbjs=;
	b=UdOcwgCa1E1iSvmUENQHXlE0T/die4wlruaTUREe9M63tTUIhSBVIMcXXlOwHecm+hjw/k
	m7wd6eSZT26uYXRxtTatw1FJqMc4laAZFZdBg1WzCT7VeLgs2o7rElHA0RfQr0u8JPXyeB
	lSSneoMUXj5DAcDb/6Hl0JbCFVqvrp4zog9xRyJ5vE4b9U5myshLxdZGtHiYs0qlzGeBU8
	bXFX5NLsH3eqzMZLnn8n/itfWwTg3p4CGeXMt53yv9oLPh+gO1rqoDVKAPC9x6o9Gly6AY
	uvtcvPb7e9wtEDUdmG9yIbN23RCjLM9GXZsQqpHnkKZuHJxQ228s1xW7ZXPn0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 09:28:40 +0100
Message-Id: <DG1S66FXLIDL.1NND6ZNKZUEOY@bootlin.com>
Subject: Re: [OE-core][PATCH 1/6] python3-appdirs: Add new recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
 <20260129035353.8982-2-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260129035353.8982-2-liuyd.fnst@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 08:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230186

On Thu Jan 29, 2026 at 4:53 AM CET, Yiding Liu (Fujitsu) via lists.openembe=
dded.org wrote:
> Move it from meta-openembedded to openembedded-core as it is required by =
hotdoc 0.17.4.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---

Hi Liu,

Thanks for your patch.

>  meta/recipes-devtools/python/python3-appdirs_1.4.4.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
>
> diff --git a/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta=
/recipes-devtools/python/python3-appdirs_1.4.4.bb
> new file mode 100644
> index 0000000000..bee0b7d815
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "A small Python module for determining appropriate + platfor=
m-specific dirs, e.g. a user data dir."
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D31625363c45eb0c67c630a2f7=
3e438e4"

You will also need to add an HOMEPAGE line in there.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


