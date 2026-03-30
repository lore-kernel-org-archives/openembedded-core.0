Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1513D1061B05
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 14:36:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52879.1774881394840488279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 07:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1+4+xxhX;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso27974165e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 07:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774881393; x=1775486193; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5IxUe8jNjVm96lOnHnlzbMOrSxlDwNd9TI8EURqtNo=;
        b=1+4+xxhX+t5+zsZ+TKwJ28GeUDvVDtOrs7x4y2Z0NPxqQlxzASqzcgwjLl9ie9vw22
         vXrWa/pqBVA1FnnuSqwCwtv4hzvRB/30vK/kLAPsBI/Gd6qtlY8zrcQgP00EgoMPukku
         75FRiPZ+/Hg2LyDiF5Mq2wIwdaiEV5Sm9qBHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881393; x=1775486193;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5IxUe8jNjVm96lOnHnlzbMOrSxlDwNd9TI8EURqtNo=;
        b=GKC7uYU7es+8iUCKfNcinjBF18yZmEefnQCzRStGqfbcOg+cCThRRM/ArdQW6YSt32
         W0OcSsX0WHzvRWp8dRJQ0niCWkDbSnzjkgEPR0o7Gw1K2i20A3+vcdcYomQTTfjf1Kw0
         X6BjV9jU34cHD2F9m3eUec6T6WuH3dThqoQSV1iQiBrp6dOxWVS64EWEFcuhmpriFVud
         6e5/NnedADsDtuk+bBRhEwBJbkoKbvn4d4mTdL+ZKRem+9p0LE8/NDBYWyg9Lq7Mbeac
         oZoqUEz2p61AtPd0J/7zydeWQHwTDP7SRvGOlXGkGiCKEC0cju00g9QCUrwMsBPX7pWR
         L4yw==
X-Forwarded-Encrypted: i=1; AJvYcCWieCQ38+mTxuxIC0q6EAcWEZ9c+EtWoJrtQ6Gn+wjkhA3QTNSSu5w9eiOxKLW+odyAq3FIn9umpCbExoj/CCxrng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyGGwKEjFWHR2vSlJ/JBKDRszcMK/oo5gyjQpQen6kgfC19yuj+
	fZCADsetmKV7NYldJsrzSr+oCDDmvp8bi7YFUbu5DTQ8bzRUuwtek+xZs9YjYf7owBQ=
X-Gm-Gg: ATEYQzyCiJ1b6/gCElPrdphMmvrBMwvZjRpH9QPRNqDavKcro7HIWWdTQVGnCKmqPy0
	bS5KkvPqSjQSPddPBpPZnZs0qqWLza7eXmVxSkAsMKTSZjY1i/UOh/hVE7ZyDTQnbi2Rg+0W6Bb
	A35DX+kGXSWOGzHfjtj+IM+pDNAyT4ianxb2v6gl0zRS0g6RzX088ZW5SSHjPBOGFeRe0b+ViNx
	pmEpmYqCrtZFaz6o85qZJDxi1C7Iarv9vVHy34cgldo2rWotcoyFd1SoIA1EAIHpP2qzxtb9V2+
	zRzUlgAqYBszBCox+9DprX+tzMM7vahW+95Xta4lviLOaHiWri/suYf14/+t2Qw4iU3jwnA0SjV
	C+mihoKeNwO5ZBquxHRTWF9NcIjGT05F6mTJdON0Wg0ac/7CqFsJj8S2YuaFBOJNxEDkGcahkJf
	iv14UafON2m8XUh3wky0Q4yrgL36/T6YemqNxfYIuRtMtvNr54Eadr1Ev4HGbhSCx5/RewbZBQZ
	LYBn0pNkGw=
X-Received: by 2002:a05:6000:2507:b0:43b:5091:39db with SMTP id ffacd0b85a97d-43b9eb10f23mr21439597f8f.13.1774881392442;
        Mon, 30 Mar 2026 07:36:32 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e24sm18275913f8f.10.2026.03.30.07.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:36:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 16:36:31 +0200
Message-Id: <DHG6XYWYS20G.3GXDCN07SKIGJ@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 04/11] dtc: backport fix for build with
 glibc-2.43
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Martin Jansa" <martin.jansa@gmail.com>
X-Mailer: aerc 0.20.0
References: <cover.1774824253.git.yoann.congal@smile.fr>
 <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774824253.git.yoann.congal@smile.fr>
In-Reply-To: <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774824253.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 14:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234239

On Mon Mar 30, 2026 at 12:46 AM CEST, Yoann Congal wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
> https://errors.yoctoproject.org/Errors/Details/903983/
>
> ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overlay_f=
ixup_phandle=E2=80=99:
> ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment disca=
rds =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Dd=
iscarded-qualifiers]
>   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
>       |                     ^
> ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment disca=
rds =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Dd=
iscarded-qualifiers]
>   434 |                 sep =3D memchr(name, ':', fixup_len);
>       |                     ^
> cc1: all warnings being treated as errors
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> [YC: upstream commit 28552a7b6c94060c7ab3899619ab8afb74124d02]
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---

Hello Martin,

FYI, while it looked good, this patch and your whole series about glibc
2.43 support:
* [scarthgap 04/11] dtc: backport fix for build with glibc-2.43
* [scarthgap 05/11] pseudo: Add fix for glibc 2.43
* [scarthgap 06/11] yocto-uninative: Update to 5.0 for needed patchelf upda=
tes
* [scarthgap 07/11] yocto-uninative: Update to 5.1 for glibc 2.43
* [scarthgap 08/11] elfutils: don't add -Werror to avoid discarded-qualifie=
rs
* [scarthgap 09/11] binutils: backport patch to fix build with glibc-2.43 o=
n host
... will be put on hold until I can test it: So, not until Ubuntu 26.04
is released and the autobuilder gain an Ubuntu 26.04 worker (most likely
after Wrynose release).

Thanks!

Regards,

>  .../0001-Fix-discarded-const-qualifiers.patch | 85 +++++++++++++++++++
>  meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  1 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-=
qualifiers.patch
>
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifi=
ers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers=
.patch
> new file mode 100644
> index 00000000000..c643410ae9b
> --- /dev/null
> +++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.pat=
ch
> @@ -0,0 +1,85 @@
> +From 861cb43eb53afff83e28ba0e0f88ffa464ebe8ca Mon Sep 17 00:00:00 2001
> +From: Stephen Gallagher <sgallagh@redhat.com>
> +Date: Tue, 6 Jan 2026 14:19:30 -0500
> +Subject: [PATCH] Fix discarded const qualifiers
> +
> +It's unsafe to implicitly discard the const qualifier on a pointer. In
> +overlay_fixup_phandle(), this was probably just an oversight, and making
> +the "sep" variable a const char * is sufficient to fix it.
> +
> +In create_node(), however, the "p" variable is directly modifying the
> +buffer pointed to by "const char* node_name". To fix this, we need to
> +actually make a duplicate of the buffer and operate on that instead.
> +
> +This introduces a malloc()/free()  and an unbounded strdup() into the
> +operation, but fdtput isn't a long-running service and the node_name
> +argument comes directly from argv, so this shouldn't introduce a
> +significant performance impact.
> +
> +Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.=
git/commit/libfdt/fdt_overlay.c?h=3Dmain&id=3D9a1c801a1a3c102bf95c5339c9e98=
5b26b823a21]
> +---
> + fdtput.c             | 8 +++++---
> + libfdt/fdt_overlay.c | 3 ++-
> + meson.build          | 3 ++-
> + 3 files changed, 9 insertions(+), 5 deletions(-)
> +
> +diff --git a/fdtput.c b/fdtput.c
> +index c2fecf4..8deec7e 100644
> +--- a/fdtput.c
> ++++ b/fdtput.c
> +@@ -230,19 +230,21 @@ static int create_paths(char **blob, const char *i=
n_path)
> + static int create_node(char **blob, const char *node_name)
> + {
> + 	int node =3D 0;
> +-	char *p;
> ++	const char *p;
> ++	char *path =3D NULL;
> +=20
> + 	p =3D strrchr(node_name, '/');
> + 	if (!p) {
> + 		report_error(node_name, -1, -FDT_ERR_BADPATH);
> + 		return -1;
> + 	}
> +-	*p =3D '\0';
> +=20
> + 	*blob =3D realloc_node(*blob, p + 1);
> +=20
> + 	if (p > node_name) {
> +-		node =3D fdt_path_offset(*blob, node_name);
> ++		path =3D xstrndup(node_name, (size_t)(p - node_name));
> ++		node =3D fdt_path_offset(*blob, path);
> ++		free(path);
> + 		if (node < 0) {
> + 			report_error(node_name, -1, node);
> + 			return -1;
> +diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> +index 5c0c398..75b0619 100644
> +--- a/libfdt/fdt_overlay.c
> ++++ b/libfdt/fdt_overlay.c
> +@@ -431,7 +431,8 @@ static int overlay_fixup_phandle(void *fdt, void *fd=
to, int symbols_off,
> + 		const char *fixup_str =3D value;
> + 		uint32_t path_len, name_len;
> + 		uint32_t fixup_len;
> +-		char *sep, *endptr;
> ++		const char *sep;
> ++		char *endptr;
> + 		int poffset, ret;
> +=20
> + 		fixup_end =3D memchr(value, '\0', len);
> +diff --git a/meson.build b/meson.build
> +index 8952e8a..ecb0ae0 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -14,7 +14,8 @@ add_project_arguments(
> +     '-Wstrict-prototypes',
> +     '-Wmissing-prototypes',
> +     '-Wredundant-decls',
> +-    '-Wshadow'
> ++    '-Wshadow',
> ++    '-Wdiscarded-qualifiers'
> +   ]),
> +   language: 'c'
> + )
> diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/d=
tc/dtc_1.7.0.bb
> index 0702fc16dfa..a2f41197fda 100644
> --- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
> +++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D " \
>      git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;protoco=
l=3Dhttps \
>      file://0001-meson.build-bump-version-to-1.7.0.patch \
>      file://0002-meson-allow-building-from-shallow-clones.patch \
> +    file://0001-Fix-discarded-const-qualifiers.patch \
>  "
>  SRCREV =3D "039a99414e778332d8f9c04cbd3072e1dcc62798"
> =20


--=20
Yoann Congal
Smile ECS


