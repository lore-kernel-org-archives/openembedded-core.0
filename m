Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E4DCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:49:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.18342.1757512164990908916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kGJYboaj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A35534E40BDD
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:49:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C00B606D4;
	Wed, 10 Sep 2025 13:49:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB9A8102F1CC2;
	Wed, 10 Sep 2025 15:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757512163; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2iwY4bEYlKkWTvcuOBaIvRluNr2ViApuqU7XxbY1P+w=;
	b=kGJYboajpuU2v+Xg3ZRlW7vE9lnXZu/u4zJ8SJnqUoZ30aBPzd2IXOwNl8N/NAPaEkEYRL
	Uijo7Q8WIVpBCNlf4qC6CB1/b+K0BenUj+5WrQ4P6KBrGKX/63hQx+4J/kTnC5zL0VlQfq
	H48xKrGChpykXJtalv7mLoXzdR+wsYj0v15wdkB+FDUoeJGUUDXioHXr+3poc5jvAY9Sab
	afhG6YmtgdU4JBGhO/pX3RnKEq5GwJvzeTNoFvtFAHO5T2L3dOx29oR/XfO7fuaoy0vqSc
	P7R8WdarjQyCeMSj+mvGLILTZQsffZOosjxKOgv4sW+k5vX38lGS8F0466ixPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 15:49:21 +0200
Message-Id: <DCP62CVLCT1K.1AX5H575NJQOI@bootlin.com>
Subject: Re: [OE-core] [PATCH 21/40] meson: upgrade 1.8.2 -> 1.9.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250910091646.998-1-wangmy@fujitsu.com>
 <20250910091646.998-21-wangmy@fujitsu.com>
In-Reply-To: <20250910091646.998-21-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223216

On Wed Sep 10, 2025 at 11:16 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/meson/{meson_1.8.2.bb =3D> meson_1.9.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/meson/{meson_1.8.2.bb =3D> meson_1.9.0.bb} =
(98%)
>
> diff --git a/meta/recipes-devtools/meson/meson_1.8.2.bb b/meta/recipes-de=
vtools/meson/meson_1.9.0.bb
> similarity index 98%
> rename from meta/recipes-devtools/meson/meson_1.8.2.bb
> rename to meta/recipes-devtools/meson/meson_1.9.0.bb
> index bfeaab0a79..6f5a623dc7 100644
> --- a/meta/recipes-devtools/meson/meson_1.8.2.bb
> +++ b/meta/recipes-devtools/meson/meson_1.9.0.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
>             file://0001-Make-CPU-family-warnings-fatal.patch \
>             file://0002-Support-building-allarch-recipes-again.patch \
>             "
> -SRC_URI[sha256sum] =3D "c105816d8158c76b72adcb9ff60297719096da7d07f6b1f0=
00fd8c013cd387af"
> +SRC_URI[sha256sum] =3D "cd27277649b5ed50d19875031de516e270b22e890d9db65e=
d9af57d18ebc498d"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
> =20
>  inherit python_setuptools_build_meta github-releases

Hi Wang,

Thanks for the package update.

I believe this one is responsible for a weston configure error:

ERROR: weston-14.0.2-r0 do_configure: meson failed
...
| ERROR: Subproject display-info is buildable: NO
| Message: Required by DRM-backend.
|
| ../sources/weston-14.0.2/libweston/backend-drm/meson.build:5:22: ERROR: A=
utomatic wrap-based subproject downloading is disabled
|
| A full log can be found at /srv/pokybuild/yocto-worker/qemux86-world/buil=
d/build/tmp/work/x86-64-v3-poky-linux/weston/14.0.2/build/meson-logs/meson-=
log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2357
(same build as the nghttp2 build error)

Can you do something about it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


