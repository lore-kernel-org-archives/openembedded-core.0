Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A68FC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 17:21:49 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.352.1652721701379405797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 10:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IEvpplyg;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id t25so27020376lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c1QyZhmJMwEzu3JIhAk7SPNEzLJ51uoWd0N/wsI6wFw=;
        b=IEvpplygAZVHKzA6/ERIU8Y7XFLY/bTsBMwB+qlP6mHNBfwvTw+76Wl5OCKzSZi5yy
         3dfRK84ZaBd7hcugc19vBiZqQbbQX9JLxSQex0pM94ZtT/hjm7gGntMwDE6vHhagqD4w
         X4fzFCjecHzWo0C6n58MJHGe1s3IDSmoJpX8CVJvpddAUYoWjA0LZEe2iYTclRORMfiA
         H+kN6mr8mlJmSSYLAUwNvT6sEK9JFv2AvVKR8gk11HNxZgw+qA4PvMTX186QSZ8yGlIQ
         ZjwCEB7mMpj76LVsk2pxJDf24qY3Ajjv3JIz1hMihjuD66dCjfG2uCNyPFjNJVn8Ppc5
         7USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c1QyZhmJMwEzu3JIhAk7SPNEzLJ51uoWd0N/wsI6wFw=;
        b=CWHB89U2HN5H6UfTaT9JSp4THp3Xr3S8rved3h2WQL5U48iRRxNPgZsuweJG/roKqK
         eJ8hnC3QSKnhTPODPy1TNyiqExZJ2LrYozimo+px97XwPGyNGSJCGjaXmKpfzNWkLqwx
         u7o4qBYxo09NNPgMG9aZW6wwLDtfG9Bha6E95argFIBU/5p9oJnQtG102YZh/ggegYkd
         KOps5hp/GaSDhFI0ceCIQRbG3AY/6LAdZHAu2bjRctdmved//AfWJ65WsWZoBJReTZs5
         xQ0xycq3+Gx9r7CGAM42fQYtcqP9Da7FsGUk1B7WbIdo8iP6zX7IFvTiSsPtL3UnuUoa
         k+3A==
X-Gm-Message-State: AOAM530WWkqwgfdlic45mCI0hcyc5AKJKS2CzRKJvMenHJL5h0fLjW1o
	Qzz3lmDJMwGC8XPADwDakzPCao9XRIY2LcTG0gc=
X-Google-Smtp-Source: 
 ABdhPJxa5MwmntcEliyq/e5/+LRv2M/Ohta0/bN58Q9RDmle1fVpF5GDqV1jTA4fNUF/bV7HP4TS1mTMRnecbahuacU=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr13503077lfo.358.1652721699198; Mon, 16
 May 2022 10:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220516171045.3049978-1-ross.burton@arm.com>
In-Reply-To: <20220516171045.3049978-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 May 2022 19:21:27 +0200
Message-ID: 
 <CANNYZj-FuTqsQYUt-tEpqAxXDOHYXO_R-R8bQPQDJMU2g=ERzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-setuptools: upgrade to 62.2.0
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 17:21:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165691

I'm afraid a bit more fixing is necessary (specifically the
side-porting of the (in)famous 'mikey special'):
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-vers=
ion-updates&id=3D847bfe3baf5a6117ca9e7053502335d0edc68ed6

Alex


On Mon, 16 May 2022 at 19:10, Ross Burton <ross.burton@arm.com> wrote:
>
> Drop 0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch as
> the in-tree copy of sysconfig now simply calls the one in Python, so this
> is not needed anymore.
>
> Drop 0001-change-shebang-to-python3.patch as it is patching a file which
> never gets executed directly, so is pointless.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...nfig-append-STAGING_LIBDIR-python-sy.patch | 35 -------------------
>  .../0001-change-shebang-to-python3.patch      | 25 -------------
>  ...59.5.0.bb =3D> python3-setuptools_62.2.0.bb} |  7 +---
>  3 files changed, 1 insertion(+), 66 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-=
_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
>  delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-=
change-shebang-to-python3.patch
>  rename meta/recipes-devtools/python/{python3-setuptools_59.5.0.bb =3D> p=
ython3-setuptools_62.2.0.bb} (87%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distut=
ils-sysconfig-append-STAGING_LIBDIR-python-sy.patch b/meta/recipes-devtools=
/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-=
python-sy.patch
> deleted file mode 100644
> index 3150187951d..00000000000
> --- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sys=
config-append-STAGING_LIBDIR-python-sy.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 1ff575308248b183639c8cb14afee7c8572bd2b8 Mon Sep 17 00:00:00 2001
> -From: Tim Orling <timothy.t.orling@intel.com>
> -Date: Wed, 20 Oct 2021 17:38:10 +0000
> -Subject: [PATCH] _distutils/sysconfig: append
> - STAGING_LIBDIR/python-sysconfigdata to sys.path
> -
> -When python modules set SETUPTOOLS_USE_DISTULS=3D'local', this uses the
> -vendored _distutils in setuptools rather than distutils in the Standard
> -Library. This is needed so that target configuration can be used with
> -python3-setuptools-native.
> -
> -Based on python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-s=
ys.patch
> -from Alex Kanavin <alex.kanavin@gmail.com>
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> -Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> -
> ----
> - setuptools/_distutils/sysconfig.py | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/=
sysconfig.py
> -index d36d94f..616eb91 100644
> ---- a/setuptools/_distutils/sysconfig.py
> -+++ b/setuptools/_distutils/sysconfig.py
> -@@ -484,6 +484,8 @@ def _init_posix():
> -             multiarch=3Dgetattr(sys.implementation, '_multiarch', ''),
> -         ),
> -     )
> -+    if 'STAGING_LIBDIR' in os.environ:
> -+        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfig=
data')
> -     try:
> -         _temp =3D __import__(name, globals(), locals(), ['build_time_va=
rs'], 0)
> -     except ImportError:
> diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-change-=
shebang-to-python3.patch b/meta/recipes-devtools/python/python3-setuptools/=
0001-change-shebang-to-python3.patch
> deleted file mode 100644
> index 6dcf52771b2..00000000000
> --- a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang=
-to-python3.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From c39d0896930e25c224cc897660fc8511ccae30c8 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 23 Apr 2020 10:01:12 +0000
> -Subject: [PATCH] change shebang to python3
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - pkg_resources/_vendor/appdirs.py   | 2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/ap=
pdirs.py
> -index ae67001..933e398 100644
> ---- a/pkg_resources/_vendor/appdirs.py
> -+++ b/pkg_resources/_vendor/appdirs.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> - # Copyright (c) 2005-2010 ActiveState Software Inc.
> - # Copyright (c) 2013 Eddy Petri=C8=99or
> ---
> -2.24.1
> -
> diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_62.2.0.bb
> similarity index 87%
> rename from meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_62.2.0.bb
> index f2810e18d31..452ccf73251 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_62.2.0.bb
> @@ -8,12 +8,7 @@ inherit pypi python_setuptools_build_meta
>
>  SRC_URI:append:class-native =3D " file://0001-conditionally-do-not-fetch=
-code-by-easy_install.patch"
>
> -SRC_URI +=3D "\
> -    file://0001-change-shebang-to-python3.patch \
> -    file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.pat=
ch \
> -"
> -
> -SRC_URI[sha256sum] =3D "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb=
77573f6e2fa4fad0"
> +SRC_URI[sha256sum] =3D "ca6ba73b7fd5f734ae70ece8c4c1f7062b07f3352f6428f6=
277e27c8f5c64237"
>
>  DEPENDS +=3D "${PYTHON_PN}"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165689): https://lists.openembedded.org/g/openembedde=
d-core/message/165689
> Mute This Topic: https://lists.openembedded.org/mt/91144879/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

