Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAB2C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:54:07 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.14309.1635263647021239271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QQdg6Be1;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id bp7so15509810qkb.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0gtdlx0dgYsMjq0m/0TklXSmx1P8KC2crkHmLly5fco=;
        b=QQdg6Be17CcRvkhxqZiC5gTbhWrO+0Qv9s5PiGRbEMoeTevxCNXFUwGJQTnVzQQn05
         mQNzjBueLtLtcMIUtyUvqCs+4to71i0o7bV8oIpFiBsO/9sUPeaKnTfNsrRFPQO5tqll
         pameiNG4cvHNzYqLoR1y+4287HmSDC6cZHtPaczTBUgihZgwn1zeF2vKsWjQdgZkm780
         i4TAaQXiRDSDwkaAWbzdtIyde5HNTmFjMQoWKtSeLF0Qia1aEwwhVLNnnpzwUU+s31io
         lZAW05GQ2pSV0wj2FDABRh9IiWM07UrRlqviYt+ktMPsbYXDjGXrhzfBCGQPzgEXX8j/
         FXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0gtdlx0dgYsMjq0m/0TklXSmx1P8KC2crkHmLly5fco=;
        b=gCmPk9gRHn4IWAtTvWUYiDKQQayGcuLM/t74pa39neNK+yeUxdzrIpHP/I9LIbs+J0
         5xIWjCsM/166BUFh/TwweKY5AsP1ufsKQyekV8SYwQs98dxCT9NgbgkiMMgK9WB4Gn3a
         TAI0aC1E0o528bzUzhSG3SzvNKb02W+l6WQ+ZL2n01dDKdrOcCflyCUctmR8IUlrIRvx
         NVDcmcy66X8yj5SYuz6HVAJ9aQxPbVlfs5/4jCIUsMDHc/i7bF0lcCMUPTJT+jV/+3sW
         Ry0smcliXqogDrCvFvBvRmzG0Uw59Xr9aSWrXNZeBFjHvJC9zrHAfK9Ob+o4QaWwJ079
         wJUg==
X-Gm-Message-State: AOAM5302WtZfcCPCYjN1WmezRgMYUyPDjZUHtxqCh8+SAk4FFSaqHWFC
	Y6oUgJaDOX0UB3lqSD8MgeIGqudUKR610yMQ5PU=
X-Google-Smtp-Source: 
 ABdhPJzl2GSGw+YJgRhPpjiwNDjnDUSL/ajpox8D+66C/A/fcZrDRtzQLbAXyFrkLakGz+3xjP2P498Vd5HQ7vtTcG4=
X-Received: by 2002:a37:9ec7:: with SMTP id
 h190mr19656566qke.105.1635263646100;
 Tue, 26 Oct 2021 08:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
 <20211026111140.3298966-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211026111140.3298966-4-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Oct 2021 08:53:40 -0700
Message-ID: 
 <CAMKF1sovwgOet_n23KHgzRMyptqq=MYq7W1ZKM-VWj0Sy14CoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] gcc: Drop broken/unneeded patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:54:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157402

On Tue, Oct 26, 2021 at 4:11 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This patch looks obsolete because it looks like part of an upstream
> backport on a very old gcc version (4.3.3) and looks incomplete. The
> diff also has little context making it likely to be a rebase error.
>
> Builds seem find without it so drop it.
>

IIRC it was not accepted upstream but perhaps a different one was.
However if it builds for us without issues then drop it.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
>  ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch | 70 -------------------
>  2 files changed, 71 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_=
CFLAGS_FOR_TARGET.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.2.inc
> index 1ab779533ca..23dfea2319e 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -32,7 +32,6 @@ SRC_URI =3D "\
>             ${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>             file://0002-gcc-poison-system-directories.patch \
> -           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
>             file://0004-64-bit-multilib-hack.patch \
>             file://0005-optional-libstdc.patch \
>             file://0006-COLLECT_GCC_OPTIONS.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_=
FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFL=
AGS_FOR_TARGET.patch
> deleted file mode 100644
> index 7a676545557..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TAR=
GET.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 274a27da6fe355c4c49953b3b69c8949d2412c62 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:08:31 +0400
> -Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> -
> -Before committing, I noticed that PR/32161 was marked as a dup of PR/320=
09, but my previous patch did not fix it.
> -
> -This alternative patch is better because it lets you just use CFLAGS_FOR=
_TARGET to set the compilation flags for libgcc. Since bootstrapped target =
libraries are never compiled with the native compiler, it makes little sens=
e to use different flags for stage1 and later stages. And it also makes lit=
tle sense to use a different variable than CFLAGS_FOR_TARGET.
> -
> -Other changes I had to do include:
> -
> -- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to c=
onfigure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_=
FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner =
this way though.
> -
> -- passing the right CFLAGS to configure scripts as exported environment =
variables
> -
> -I also stopped passing LIBCFLAGS to configure scripts since they are unu=
sed in the whole src tree. And I updated the documentation as H-P reminded =
me to do.
> -
> -Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok=
 for 4.3?
> -
> -Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - configure | 32 ++++++++++++++++++++++++++++++++
> - 1 file changed, 32 insertions(+)
> -
> -diff --git a/configure b/configure
> -index bcebad264ec..86e4ee7c383 100755
> ---- a/configure
> -+++ b/configure
> -@@ -8977,6 +8977,38 @@ fi
> -
> -
> -
> -+# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
> -+# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
> -+# might also be empty (or "-g", if a non-GCC C++ compiler is in the pat=
h).
> -+# We want to ensure that TARGET libraries (which we know are built with
> -+# gcc) are built with "-O2 -g", so include those options when setting
> -+# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> -+if test "x$CFLAGS_FOR_TARGET" =3D x; then
> -+  CFLAGS_FOR_TARGET=3D$CFLAGS
> -+  case " $CFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> -+  esac
> -+  case " $CFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> -+if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> -+  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> -+  case " $CXXFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> -+  esac
> -+  case " $CXXFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> - # Handle --with-headers=3DXXX.  If the value is not "yes", the contents=
 of
> - # the named directory are copied to $(tooldir)/sys-include.
> - if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xno ;=
 then
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157386): https://lists.openembedded.org/g/openembedde=
d-core/message/157386
> Mute This Topic: https://lists.openembedded.org/mt/86599750/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

