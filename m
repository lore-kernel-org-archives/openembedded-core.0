Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A29C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 04:21:32 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.3295.1645762890787211729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OGAPDexR;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id d84so3608917qke.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a17XzAitKyRUjc8m4GWPxlw71v7mEVYjHuYiHWl8rH4=;
        b=OGAPDexRrT4+BJIQqD2S5As2nS4XmQGPcQrzKGXukBqFCLVLouwRB19h3rFeORbhIH
         qjLRVAcl0gZGDFxswP4nSpQqgtSPuVhqwypIIMEXX92zAUyJAnJOkJav/7jIhEoTGvUn
         rW85cT12qVMRPgi6GOv+DnkQDw1TeC4wrn6qp5VJ+g8wH0UIhTmlCkPZUl035lHKFCPt
         A2IXGWTLB2gV0+w9TJ5Czstpyn+7/4RlYKH/KjJoKvzF2e2xYmhLJH290rtH93O7iHg9
         VHfbvMZ1s/O6wavWzupdMqGdKI5wv9Ou02WK99ivElTy+VV5YXhbihGZqjYT27RhZVdI
         R4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a17XzAitKyRUjc8m4GWPxlw71v7mEVYjHuYiHWl8rH4=;
        b=dH3xaiX4Qw73Qcs7X4QNBeledihNegwLagGMISeLtV3A7I3yNLfbXNYTOzhSv+rYvg
         Jxibj8qbLDTEan25DIIyKmNOTSBu3q5CAVegMwHHePg1BM752qXUlau1OgxvgWwg/bEf
         64EXP4+gFTQoWX+Y7LreMBzpMLDgJrVZS/yj2OZveZ18se0t7BFJ7r0ESIaKzNIs2Rhv
         cFjx6Dprh0butRj/Ic6V5oH/ZEpk8aQDdsR1lrN840+Qi1P3IR6bePS+cqd8u0jscHfV
         uYZBZgKVzEJ5FIbRnMbyUj6+oQbQUAjLhFqGYv8fnSU6dHru6Sm9aWA60bRd6KcZBaaA
         ckIA==
X-Gm-Message-State: AOAM530h4ZVf7K3E2B7crvGSXyH4KwUPntSJeStp9dgoR4UdXar63fSj
	T7YnaW0cOGBhPdTLtK2iLLkM0o9DTWlNNIGHLN0lNlkcU4ht6A==
X-Google-Smtp-Source: 
 ABdhPJycYTwvEi/9C585VEcn3B8+EedtW9CTzqbdcZjfaXv6dWoUmUfSI1CtPSLP82zlCkZcDH73IwCOGFdomkxpr4o=
X-Received: by 2002:a05:620a:1593:b0:60a:b223:893a with SMTP id
 d19-20020a05620a159300b0060ab223893amr3799795qkk.72.1645762889531; Thu, 24
 Feb 2022 20:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20220225024751.21765-1-joe.slater@windriver.com>
In-Reply-To: <20220225024751.21765-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Feb 2022 20:21:03 -0800
Message-ID: 
 <CAMKF1spmDUY46J8EjSdi1=LxAdkZ0sEVjbSroKPUTeQqENAjcQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] zip: modify when match.S is built
To: Joe Slater <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 04:21:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162336

On Thu, Feb 24, 2022 at 6:48 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Use the correct $CPP to test if match.S is buildable,
> and do not build it if QA checks require PIC code.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../0001-configure-use-correct-CPP.patch      | 47 +++++++++++++++++++
>  ...002-configure-support-PIC-code-build.patch | 34 ++++++++++++++
>  meta/recipes-extended/zip/zip_3.0.bb          |  3 ++
>  3 files changed, 84 insertions(+)
>  create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
>  create mode 100644 meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
>
> diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
> new file mode 100644
> index 0000000000..02253f968c
> --- /dev/null
> +++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-use-correct-CPP.patch
> @@ -0,0 +1,47 @@
> +From 7a2729ee7f5d9b9d4a0d9b83fe641a2ab03c4ee0 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Thu, 24 Feb 2022 17:36:59 -0800
> +Subject: [PATCH 1/2] configure: use correct CPP
> +
> +configure uses CPP to test that two assembler routines
> +can be built. Unfortunately, it will use /usr/bin/cpp
> +if it exists, invalidating the tests.  We use the $CC
> +passed to configure.
> +
> +Upstream-Status: Inappropriate [openembedded specific]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + unix/configure | 15 +++++++++------
> + 1 file changed, 9 insertions(+), 6 deletions(-)
> +
> +diff --git a/unix/configure b/unix/configure
> +index 73ba803..7e21070 100644
> +--- a/unix/configure
> ++++ b/unix/configure
> +@@ -220,13 +220,16 @@ fi
> + echo Check for the C preprocessor
> + # on SVR4, cc -E does not produce correct assembler files. Need /lib/cpp.
> + CPP="${CC} -E"
> ++
> ++# We should not change CPP for yocto builds.
> ++#
> + # solaris as(1) needs -P, maybe others as well ?
> +-[ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
> +-[ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
> +-[ -f /lib/cpp ] && CPP=/lib/cpp
> +-[ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
> +-[ -f /xenix ] && CPP="${CC} -E"
> +-[ -f /lynx.os ] && CPP="${CC} -E"
> ++# [ -f /usr/ccs/lib/cpp ] && CPP="/usr/ccs/lib/cpp -P"
> ++# [ -f /usr/lib/cpp ] && CPP=/usr/lib/cpp
> ++# [ -f /lib/cpp ] && CPP=/lib/cpp
> ++# [ -f /usr/bin/cpp ] && CPP=/usr/bin/cpp
> ++# [ -f /xenix ] && CPP="${CC} -E"
> ++# [ -f /lynx.os ] && CPP="${CC} -E"
> +
> + echo "#include <stdio.h>" > conftest.c
> + $CPP conftest.c >/dev/null 2>/dev/null || CPP="${CC} -E"
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
> new file mode 100644
> index 0000000000..6e0879616a
> --- /dev/null
> +++ b/meta/recipes-extended/zip/zip-3.0/0002-configure-support-PIC-code-build.patch
> @@ -0,0 +1,34 @@
> +From b0492506d2c28581193906e9d260d4f0451e2c39 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Thu, 24 Feb 2022 17:46:03 -0800
> +Subject: [PATCH 2/2] configure: support PIC code build
> +
> +Disable building match.S. The code requires
> +relocation in .text.
> +
> +Upstream-Status: Inappropriate [openembedded specific]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + unix/configure | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/unix/configure b/unix/configure
> +index 7e21070..1bc698b 100644
> +--- a/unix/configure
> ++++ b/unix/configure
> +@@ -242,8 +242,9 @@ if eval "$CPP match.S > _match.s 2>/dev/null"; then
> +   if test ! -s _match.s || grep error < _match.s > /dev/null; then
> +     :
> +   elif eval "$CC -c _match.s >/dev/null 2>/dev/null" && [ -f _match.o ]; then
> +-    CFLAGS="${CFLAGS} -DASMV"
> +-    OBJA="match.o"
> ++    # disable match.S for PIC code
> ++    # CFLAGS="${CFLAGS} -DASMV"
> ++    # OBJA="match.o"

you could convert this to do a runtime check for pic'ness

is_pic=$(echo | $CPP -dM - | grep -i __pic__)
if [ "$is_pic" = "" ]; then
compile match.o
else
fi

This will also mean you dont have to do the check you are doing in
recipe while applying this patch

> +     echo "int foo() { return 0;}" > conftest.c
> +     $CC -c conftest.c >/dev/null 2>/dev/null
> +     echo Check if compiler generates underlines
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
> index 18b5d8648e..42a17f9450 100644
> --- a/meta/recipes-extended/zip/zip_3.0.bb
> +++ b/meta/recipes-extended/zip/zip_3.0.bb
> @@ -14,6 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
>             file://fix-security-format.patch \
>             file://10-remove-build-date.patch \
>             file://zipnote-crashes-with-segfault.patch \
> +           file://0001-configure-use-correct-CPP.patch \
> +           ${@bb.utils.contains('ERROR_QA', 'textrel', \
> +               'file://0002-configure-support-PIC-code-build.patch', '', d)} \

I think its fine to apply it unconditionally since OE toolchain
generates PIC by default.

>             "
>  UPSTREAM_VERSION_UNKNOWN = "1"
>
> --
> 2.24.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162333): https://lists.openembedded.org/g/openembedded-core/message/162333
> Mute This Topic: https://lists.openembedded.org/mt/89381221/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

