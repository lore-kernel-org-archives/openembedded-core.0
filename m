Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7C3C9EC9B
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:17:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36446.1768234652371602261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sEsT/Y6s;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5AB0DC20860
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:17:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D56F0606FA;
	Mon, 12 Jan 2026 16:17:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 919C7103C827F;
	Mon, 12 Jan 2026 17:17:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768234649; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QT7wR86Ubf4N3S/61GympG2jFvcjZpRozJjMQsN5AO4=;
	b=sEsT/Y6sERLCaB6ZQAGKjOaR9T18EPVEas4g5VGxM7/B+Ob5dlbXHm6oYaFWmBOIQMn1dj
	66Rdwuc0AabjbqQJyF5/z6neJiuAxoffnUYkI96FeUNzUqUmdx3LJl9YPwKYDtAuKWcymj
	yirvVdZsIbHCLYgvojENSBZ1ScOYpRjpbj8fjl//ijVYKyWP5OG+LsxO5AUqNY9GmaLI0z
	LhYfrzRWqP4VKujYz8awQbv2sEmO5ZPnhaRVV7lrhW3+Q/muwwcnqut9wHhFQb9dixBwi3
	4pFn41PVmHy9vxhEYBz4cUK9FOULyNGiwS59pIeGy0PN1qnDhujoeUV2N/+GTw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 17:17:27 +0100
Message-Id: <DFMQVB547HXI.37E1WAP5SSS5Q@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libarchive: upgrade 3.8.4 -> 3.8.5
References: <20260110122753.381844-1-peter.marko@siemens.com>
In-Reply-To: <20260110122753.381844-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229212

Hi,

On Sat Jan 10, 2026 at 1:27 PM CET, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Fixes regression of fix for CVE-2025-60753
>
> Release notes [1]:
> Libarchive 3.8.5 is a bugfix release.
> Notable bugxies:
> * bsdtar: fix regression from 3.8.4 zero-length pattern issue bugfix (#28=
09)
> * various small bugfixes in code and documentation
>
> [1] https://github.com/libarchive/libarchive/releases/tag/v3.8.5
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libarchive/{libarchive_3.8.4.bb =3D> libarchive_3.8.5.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb =3D> libarc=
hive_3.8.5.bb} (96%)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb b/meta/=
recipes-extended/libarchive/libarchive_3.8.5.bb
> similarity index 96%
> rename from meta/recipes-extended/libarchive/libarchive_3.8.4.bb
> rename to meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> index e89638f5c6..fcfaf5d231 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
> @@ -32,7 +32,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
>  SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
> =20
> -SRC_URI[sha256sum] =3D "b2c75b132a0ec43274d2867221befcb425034cd038e465af=
bfad09911abb1abb"
> +SRC_URI[sha256sum] =3D "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b=
7eaa2102f03b7ffd"
> =20
>  inherit autotools update-alternatives pkgconfig
> =20

After bisecting, I identified this patch to trigger errors on the Autobuild=
er,
such as:

  Exception: subprocess.CalledProcessError: Command 'tar --exclude=3D./sysr=
oot-only -cf - -C /srv/pokybuild/yocto-worker/genericx86-64-alt/build/build=
/tmp/work/all-poky-linux/wayland-protocols/1.47/image -p -S . | tar -xf - -=
C /srv/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/all-po=
ky-linux/wayland-protocols/1.47/package' returned non-zero exit status 2.

  Subprocess output:
  got *at() syscall for unknown directory, fd 4
  unknown base path for fd 4, path share
  couldn't allocate absolute path for 'share'.
  tar: ./usr/share: Cannot mkdir: Bad address
  got *at() syscall for unknown directory, fd 4
  unknown base path for fd 4, path share
  couldn't allocate absolute path for 'share'.
  ...

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4904276/raw_inlin=
e
https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/3005

Full build:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3034

Can you have a look?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


