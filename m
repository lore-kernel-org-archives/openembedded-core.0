Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.860.1620239316478256349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltV1CaRa;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id dl3so1756146qvb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NujRrsQSh70r/jYvJmL/H4Heup9D0ujr7V2l8XOUQMU=;
        b=ltV1CaRazmWzm9NxxeGEQA2UIGuY6d+cCc52J/Tk+nhByxpJtxzE8PkDIzg+wSG2Ac
         rntVV0nqQCxKtz/JBfh8Y7F2IwTYbIX5LQnphXkdBej//hNy4yoSZuCfPjTWwYR5kxzw
         prTdVb7+dvyfc1pHb6HgKwBr8FhFiGMadNte+RYBcmuypg7PybkoMiToWc/VaWwE11zq
         4ACYv1VbOlrdhGDrBvIjHdT9cbmS6lyL/mPS+NLycROOlxVBpP9/PKvtqMAp5Ifi0508
         EMcMth0a6giBZMBAky2DkdyFg2JBC3MPust+Wa64apsaG+YhZtUF0JYh35b8bspZ8roI
         /95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NujRrsQSh70r/jYvJmL/H4Heup9D0ujr7V2l8XOUQMU=;
        b=erltqvKf3xKaQpGaYkVvCmuHXsUFPsog7geEXqTidpwFOYpx9NUAlhKJq1hIjYD2vS
         4CxigWv2SORifnjUnW3KpOV8CF3eRfgRVuiHnrv8eWPS1mAcirq1DNCkVnAvsyp3RXqo
         1fGAS6+rNsB200V0c5IyRJGNCKtP+q8PB9UZ2S3TfniT3OLka2Oy5/wGPuazHjgLlWPp
         unbR+nKh1cGUv3iZKR43tDhGHUYWvkJ2Umd7z22ftfEEFutyxQu3CCQMlhbpYUv4b2f/
         ejw0zgTSlAwzR5M9eM/5bynkyz+Tc4W4FtJEbhetynbPA4EkvpaZHuxs+sfjsheY1DIa
         Patg==
X-Gm-Message-State: AOAM532od25YSYveGVBiMlD7RY4laEBAvSS0E+3R5O52RPFTb/dUEeZJ
	p6aoyH3/ce7GcAJlMSCgQuzsiHytqCB3LE8MLOc=
X-Google-Smtp-Source: ABdhPJxIyLrFHeTSIKqBObeJFtDjjUyUoQbw8gK8qx51WX1vvPk80MHn/gSEaF00Zz9Ol7Pu3fRBvLNbJvC6Gyy1rQ0=
X-Received: by 2002:a0c:b218:: with SMTP id x24mr33083214qvd.55.1620239315650;
 Wed, 05 May 2021 11:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-15-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-15-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 11:28:09 -0700
Message-ID: <CAMKF1sobYs1KisJyP+c=67dWwTEKeuXOPVAaHokHDwzuimqP=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/61] bluez5: upgrade 5.56 -> 5.58
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ....am-add-missing-mkdir-for-ell-shared.patch | 25 +++++++++++++++++++

see this https://lists.01.org/hyperkitty/list/iwd@lists.01.org/message/SYX6Z7SUQHU7UWM6ECZTTJ6SPODIS6KB/


>  .../bluez5/{bluez5_5.56.bb => bluez5_5.58.bb} |  3 +--
>  3 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.56.bb => bluez5_5.58.bb} (91%)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 74b59e406c..635cad813e 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -53,6 +53,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>             file://0001-test-gatt-Fix-hung-issue.patch \
>             file://0001-audio-Rename-pause-funciton-to-avoid-shadowing-glibc.patch \
> +           file://0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch \
>             "
>  S = "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
> new file mode 100644
> index 0000000000..03b42f73cb
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-add-missing-mkdir-for-ell-shared.patch
> @@ -0,0 +1,25 @@
> +From d341ba650af1b7068d9ad034732b4f41b91bb2c1 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Sun, 25 Apr 2021 18:56:41 +0200
> +Subject: [PATCH] Makefile.am: add missing mkdir for ell/shared
> +
> +This addresses build errors out of source tree.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index be5d5c7..72ad425 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -623,6 +623,7 @@ lib/bluetooth/%.h: lib/%.h
> +       $(AM_V_GEN)$(LN_S) -f $(abspath $<) $@
> +
> + ell/shared: Makefile
> ++      $(AM_V_at)$(MKDIR_P) ell
> +       $(AM_V_GEN)for f in $(ell_shared) ; do \
> +               if [ ! -f $$f ] ; then \
> +                       $(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
> similarity index 91%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.56.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.58.bb
> index 676cb2dbb2..186a621c44 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
> @@ -1,7 +1,6 @@
>  require bluez5.inc
>
> -SRC_URI[md5sum] = "e6c51b2aefa7c56ff072819a78611fa5"
> -SRC_URI[sha256sum] = "59c4dba9fc8aae2a6a5f8f12f19bc1b0c2dc27355c7ca3123eed3fe6bd7d0b9d"
> +SRC_URI[sha256sum] = "c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1"
>
>  # noinst programs in Makefile.tools that are conditional on READLINE
>  # support
> --
> 2.31.1
>
>
> 
>
