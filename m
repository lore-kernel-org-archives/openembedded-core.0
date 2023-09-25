Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12093CE7AA4
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 16:47:14 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.66352.1695660431728186632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 09:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e9QQgESW;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ae2896974bso3546173b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 09:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695660431; x=1696265231; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqjlTUDgfHFw1nUpZu8JF1mDPZtBzaSYIVZo7QBSUbE=;
        b=e9QQgESWzlEjcmaP5+XSAJChENrglbU+MI/9uBhiIJSfslbDl+DyFZDeReN8tvsO+s
         UcnNt6Zkmb6nQN4atz1q0xkMc3Xt//9tBUdbVJPnYjbqOqifiNKGTVpbcpqpdHCnMfPn
         hUkZTLt29OKSWaFvaUdyWb8ITVMTVDvcXAw8WrF1gol9PkR6y0ZjJWDdqFLezK1mILV6
         L1qDIQ4wybY7ktKWyFsw8n9jAh4K8lpbQFAKyTzTFkxMkJuUIz69Y40FF4zXEh1VhD6I
         EgODk2Vxw/rGWFJzhGv3973neX/zar5WN4eHDXndG5/2VnpAVM1OuwQqe9ZXUBn3mvgi
         PcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695660431; x=1696265231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqjlTUDgfHFw1nUpZu8JF1mDPZtBzaSYIVZo7QBSUbE=;
        b=vTeEeZIjTj9oO81FR9jSVE/19q3FjGdZmlrQ2EL+Xq2Vl5Zws7plTMPtYw/4lqIuCT
         zKiC563ulAL0cPTmxwqi7+LIz7n78jbIENbwHeWvkgXW23Fkn6WyTZL83NYATH99/1kL
         1grjOTcPKTeQOIGLYa+C4TQhtNY/Cbhi8mcEEzUXHSqgCD76kaiMAa5w6rdO8rJ+S8YC
         9fJB4h/b6cACCigE5y3JggJxyJqQZqT0ug5nQmyGK9UHsgftRN3+kDpN2uEa3qgqE6GV
         empTUSDefEHmXKf0BenoBFh9S49uMl9qfk7fpQS3YMzamv2w8FSkDlWLDGbjFStenXop
         eBBw==
X-Gm-Message-State: AOJu0YxnFrwhx8iA5jH3VXClXbhaM7nrgnhtBRrpvdvLxHjNSgZCSfSC
	FTehzTDqDvTtoUKiRDn44wtjmgrUt6UZAPH2UdM=
X-Google-Smtp-Source: AGHT+IG6kLJid8J6gIu/SjHAmvKmwPTlttYiR662Wpjyfe953r6nGbTkewjy4HWiwZdrzOUkcgjP6V8fuUqi0lQI+ow=
X-Received: by 2002:a05:6870:e99a:b0:1d0:f5bd:6fe with SMTP id
 r26-20020a056870e99a00b001d0f5bd06femr9127178oao.50.1695660430733; Mon, 25
 Sep 2023 09:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230922072431.1481743-1-alex@linutronix.de> <20230922072431.1481743-25-alex@linutronix.de>
In-Reply-To: <20230922072431.1481743-25-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 09:46:44 -0700
Message-ID: <CAMKF1sprXm-xWCYGVbtQTt7y5ons1Of4ktDHMq0HYBE0+2A+JQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/40] meson: upgrade 1.1.1 -> 1.2.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 16:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188195

gnupg failure seems related to this -
https://errors.yoctoproject.org/Errors/Details/738191/

On Fri, Sep 22, 2023 at 12:25=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-Make-CPU-family-warnings-fatal.patch | 32 +++++++++----------
>  .../meson/{meson_1.1.1.bb =3D> meson_1.2.1.bb}  |  2 +-
>  2 files changed, 17 insertions(+), 17 deletions(-)
>  rename meta/recipes-devtools/meson/{meson_1.1.1.bb =3D> meson_1.2.1.bb} =
(98%)
>
> diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warni=
ngs-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-wa=
rnings-fatal.patch
> index 848dccfbe72..8fbcb5a0a23 100644
> --- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
> +++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
> @@ -1,4 +1,4 @@
> -From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 2001
> +From fcd3260c03f313676720e6219c5953d412fb0a2c Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 3 Jul 2018 13:59:09 +0100
>  Subject: [PATCH] Make CPU family warnings fatal
> @@ -7,15 +7,15 @@ Upstream-Status: Inappropriate [OE specific]
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>
>  ---
> - mesonbuild/envconfig.py   | 2 +-
> - mesonbuild/environment.py | 4 +---
> - 2 files changed, 2 insertions(+), 4 deletions(-)
> + mesonbuild/envconfig.py   | 4 ++--
> + mesonbuild/environment.py | 6 ++----
> + 2 files changed, 4 insertions(+), 6 deletions(-)
>
> -Index: meson-0.60.2/mesonbuild/envconfig.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- meson-0.60.2.orig/mesonbuild/envconfig.py
> -+++ meson-0.60.2/mesonbuild/envconfig.py
> -@@ -266,8 +266,8 @@ class MachineInfo(HoldableObject):
> +diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
> +index 7e0c567..a180065 100644
> +--- a/mesonbuild/envconfig.py
> ++++ b/mesonbuild/envconfig.py
> +@@ -284,8 +284,8 @@ class MachineInfo(HoldableObject):
>                   'but is missing {}.'.format(minimum_literal - set(liter=
al)))
>
>           cpu_family =3D literal['cpu_family']
> @@ -26,13 +26,13 @@ Index: meson-0.60.2/mesonbuild/envconfig.py
>
>           endian =3D literal['endian']
>           if endian not in ('little', 'big'):
> -Index: meson-0.60.2/mesonbuild/environment.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- meson-0.60.2.orig/mesonbuild/environment.py
> -+++ meson-0.60.2/mesonbuild/environment.py
> -@@ -354,10 +354,8 @@ def detect_cpu_family(compilers: Compile
> -         if any_compiler_has_define(compilers, '__64BIT__'):
> -             trial =3D 'ppc64'
> +diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> +index e212c7a..9d2bff3 100644
> +--- a/mesonbuild/environment.py
> ++++ b/mesonbuild/environment.py
> +@@ -345,10 +345,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
> +         if compilers and not any_compiler_has_define(compilers, '__mips=
64'):
> +             trial =3D 'mips'
>
>  -    if trial not in known_cpu_families:
>  -        mlog.warning(f'Unknown CPU family {trial!r}, please report this=
 at '
> diff --git a/meta/recipes-devtools/meson/meson_1.1.1.bb b/meta/recipes-de=
vtools/meson/meson_1.2.1.bb
> similarity index 98%
> rename from meta/recipes-devtools/meson/meson_1.1.1.bb
> rename to meta/recipes-devtools/meson/meson_1.2.1.bb
> index dd97f93aef6..fe452662029 100644
> --- a/meta/recipes-devtools/meson/meson_1.1.1.bb
> +++ b/meta/recipes-devtools/meson/meson_1.2.1.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
>             file://0001-Make-CPU-family-warnings-fatal.patch \
>             file://0002-Support-building-allarch-recipes-again.patch \
>             "
> -SRC_URI[sha256sum] =3D "d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca=
35fadb5400727b1c"
> +SRC_URI[sha256sum] =3D "b1db3a153087549497ee52b1c938d2134e0338214fe14f7e=
fd16fecd57b639f5"
>
>  inherit python_setuptools_build_meta github-releases
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188068): https://lists.openembedded.org/g/openembedde=
d-core/message/188068
> Mute This Topic: https://lists.openembedded.org/mt/101516872/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

