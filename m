Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E05C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:24:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.48875.1695036283087455127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WqgZfVgY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40472f9db24so43447785e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695036281; x=1695641081; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag0WnjEbCuOD+H8JYKlz/JomvQpX5YQ/2Yb69DufQyM=;
        b=WqgZfVgYDnR5+I669Mdnzjsm5C6aRPEEiQ6yCSHxsC0S+E8xU+0zS4uLLlquFc5uip
         TdKBotkgZQ7cmYORPDIPviaD8rL178RxLC+fFBwTvRUmQ8AjacUBqKOavgTQdooFpIWR
         bi9uEB5srRLJqmxxKbGp+L09V/OUk/21csOT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695036281; x=1695641081;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ag0WnjEbCuOD+H8JYKlz/JomvQpX5YQ/2Yb69DufQyM=;
        b=QsxkHAczvRtbfgXJ4vCgDTYFoiZjXlVdIabagDwdwwytMY84nvyi13iyTeuHVszPg7
         Z3eWltDaLIDSnJRc272LZhA2Di6EfA9vOSQr98pcGalAXaqAwcUCJzQUd9usMbr//eoP
         Ba8TZxnBTnb31y3LKLymaNH0G8yd8Z3C1MabkhTviRFsMjwOtHHRs63/wV8VL1dBKUjT
         fS8/inFrsTgVt40RO367ZuF9SCfm/9LFsxAiLUJNkP+oH++0H/QH/GsLncLBRv56kb0u
         1Bx+VEoa4QN2bt+NhDb3lxsBX8tf40u/35BVJ+hT2iYdCUcVrkReDYtqIOes3qpi8mfB
         TvLQ==
X-Gm-Message-State: AOJu0YxRP/gn/tsGvj1vqeNDbS0nu/XF/BUdREVY0Yb9hLiCtSEuf8eb
	2ABEYst5po6Yzw3rc0U0wzpPSQ==
X-Google-Smtp-Source: AGHT+IEKuxRsTrdj3emeZuD2hbJWs1DBW9qLp7lmYLlrYMCCL0rFDhKsRXo5QV8/gVw2TRYj/wZqUg==
X-Received: by 2002:a1c:720f:0:b0:3fe:89be:cd3 with SMTP id n15-20020a1c720f000000b003fe89be0cd3mr7145180wmc.22.1695036281433;
        Mon, 18 Sep 2023 04:24:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c207:9dee:97a6:8348? ([2001:8b0:aba:5f3c:c207:9dee:97a6:8348])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c220600b00402dbe0bbdcsm14965468wml.28.2023.09.18.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 04:24:41 -0700 (PDT)
Message-ID: <64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/4] libxmlb: import recipe from meta-oe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2023 12:24:40 +0100
In-Reply-To: <20230917182829.2153680-1-f_l_k@t-online.de>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 11:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187823

On Sun, 2023-09-17 at 20:28 +0200, Markus Volk wrote:
> appstream has a dependency on it
>=20
> - add a patch to fix a reproducibility and runtime issue with ptest
>   ptest completes without error
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 35 +++++++++++++++++++
>  meta/recipes-gnome/libxmlb/libxmlb/run-ptest  |  3 ++
>  meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb  | 25 +++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c=
-hardcode-G_TEST_SRCDIR.patch
>  create mode 100644 meta/recipes-gnome/libxmlb/libxmlb/run-ptest
>  create mode 100644 meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
>=20
> diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardco=
de-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftes=
t.c-hardcode-G_TEST_SRCDIR.patch
> new file mode 100644
> index 0000000000..da8ce68df9
> --- /dev/null
> +++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TE=
ST_SRCDIR.patch
> @@ -0,0 +1,35 @@
> +From dc208bafc57c1ccaa0ca260f99c8b4c976271ebc Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sat, 16 Sep 2023 14:02:57 +0200
> +Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
> +
> +This avoids:
> + libxmlb-0.3.14-r0 do_package_qa: QA Issue: File
> + /usr/libexec/installed-tests/libxmlb/xb-self-test in package libxmlb-pt=
est
> + contains reference to TMPDIR [buildpaths]
> +
> +and also fixes the runtime for the ptest.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + src/xb-self-test.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/xb-self-test.c b/src/xb-self-test.c
> +index 47d9728..8b3dd0e 100644
> +--- a/src/xb-self-test.c
> ++++ b/src/xb-self-test.c
> +@@ -2870,7 +2870,7 @@ xb_speed_func(void)
> + int
> + main(int argc, char **argv)
> + {
> +-	g_setenv("G_TEST_SRCDIR", SRCDIR, FALSE);
> ++	g_setenv("G_TEST_SRCDIR", "/usr/libexec/installed-tests/libxmlb", FALS=
E);
> +=20
> + 	g_test_init(&argc, &argv, NULL);
> +=20
> +--=20
> +2.41.0
> +
> diff --git a/meta/recipes-gnome/libxmlb/libxmlb/run-ptest b/meta/recipes-=
gnome/libxmlb/libxmlb/run-ptest
> new file mode 100644
> index 0000000000..6d0bb95d3a
> --- /dev/null
> +++ b/meta/recipes-gnome/libxmlb/libxmlb/run-ptest
> @@ -0,0 +1,3 @@
> +#! /bin/sh
> +
> +gnome-desktop-testing-runner libxmlb
> diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb b/meta/recipes-=
gnome/libxmlb/libxmlb_0.3.14.bb
> new file mode 100644
> index 0000000000..1d3b0de29a
> --- /dev/null
> +++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "A library to help create and query binary XML blobs"
> +HOMEPAGE =3D "https://github.com/hughsie/libxmlb"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
> +
> +SRC_URI =3D " \
> +	git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=3Dhttps \
> +	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
> +	file://run-ptest \
> +"
> +SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "glib-2.0 xz zstd"
> +
> +inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgc=
onfig
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)}"
> +PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
> +
> +GTKDOC_MESON_OPTION =3D "gtkdoc"
> +
> +FILES:${PN} +=3D "${datadir}"
> +
> +BBCLASSEXTEND =3D "native"

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7823/step=
s/11/logs/warnings

(and I suspect warnings from other targets will follow)

Cheers,

Richard


