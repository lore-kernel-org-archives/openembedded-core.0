Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D73FC61DA3
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 01:58:36 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.2448.1677031113988682227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 17:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qW9OXLYD;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id bk2so5446951oib.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 17:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21EQF9lhmZ/ERN4ZqB5cUO1gD5YzEK4hnqaSzj4yBqk=;
        b=qW9OXLYDF/2G0CBRdtKunSQzFQSH15+bqQOxTCtQhSiYmCdp3icwkP6ICm4uTvb2+o
         WqW6aETADpRuhTP6XJzfWtqxIKpCxYPxOV3SWqn7fSUnNx5SlvyvvCNZYcqxcNIvA4ht
         /zLZ16hBCAN4UGFaLMkIws4Kiq0Bg+Yua1+tHkdidp4AfFW/dOErAGaZqHpi4FWURNxq
         RsPi5sa+2rQOKSgRrF/XfCsXKuTd2jSK2ijmIoxa26JhkOfojehiIttmAZ1bziDusvIW
         3IWAiWKk92X47MjqOg75el5rHnNwRvnoJcZq6yb1GdxSw8uuyiCfiygxaPnR4LjrbeMI
         agjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21EQF9lhmZ/ERN4ZqB5cUO1gD5YzEK4hnqaSzj4yBqk=;
        b=RceHp2oiXqoe+bzAc+ZoAGl9Mo6OXj3nopB/ht50HMKd3kll/BZFxUCbPoJ17UVYde
         jGyMJeZIzkUKuayLwwVuQQZvCsi0Lcg2SWo+vlzWU6DfpYJ1NagG1csMp9EpnZRmvaUG
         2YPZn+kvx84dduiasIdblF8PnWKNyC8r5dqfx9GFOEVQByRrOcDuHnzB+FTcS1kvdbGz
         Phl743kmBuMXQ4UirKp9BySIGesEZ8Faxfa8HbMhDY0PsH/+NkdXighcFLLrjQT12wnl
         3b0IqCee/6+bgJRYFzN7+lKf5fyaxmRkMtef6qGgEAtt1mJ2ZwS6wTKt55tgSLiT9npZ
         d0AA==
X-Gm-Message-State: AO0yUKWlVY8hGB7m6v2jyil/MpavNM77WGk81g5BGJEvR3i7T8doPftE
	/kdgEQmUONx4qUGR7W2IeqJXjyczzOlPdWB4e1Y=
X-Google-Smtp-Source: AK7set/d5pSDpfEs2Uw5Q1FFsIBXo+EAFZ9GohYRE1jvoJSmC/kt+mmXfJw9it5o/46D+iyYCKlFzkyPnnc1g2tVY3U=
X-Received: by 2002:a05:6808:331a:b0:37b:592b:ec39 with SMTP id
 ca26-20020a056808331a00b0037b592bec39mr925672oib.262.1677031112761; Tue, 21
 Feb 2023 17:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20220512192854.1538701-1-raj.khem@gmail.com> <28cffc0d-da67-e259-a55e-b6165a5498e0@windriver.com>
In-Reply-To: <28cffc0d-da67-e259-a55e-b6165a5498e0@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2023 17:58:21 -0800
Message-ID: <CAMKF1sp5ZeO+QCTAfvhgmFYfuwDw0cByuppzNUR2xqw7oyPTCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb: Upgrade to 12.1
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Shinde, Yash" <yash.shinde@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c0e99d05f5403b54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 01:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177553

--000000000000c0e99d05f5403b54
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023 at 5:27 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2022-05-12 15:28, Khem Raj wrote:
>
> Release Announcement [1] and Notes [2]
>
> [1] https://lists.gnu.org/archive/html/info-gnu/2022-05/msg00000.html
> [2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-12.1-release
>
> I just noticed that gdb-13.1 was released 2 days ago (Feb 19, 2023) .
>
> It seems like a good candidate to be included in the 4.2 release.
>
> $ git diff gdb-12-branch  gdb-13-branch gdb | diffstat | tail -1
>  6222 files changed, 142614 insertions(+), 63875 deletions(-)
>
> and  notes linked below.
>
> Khem,
>
> Are you working on that or should someone else start on it?
>

I have branch for 13.x already so will send patches tonight

../Randy
>
>
> https://www.sourceware.org/gdb/download/ANNOUNCEMENT
>
> https://www.sourceware.org/gdb/
>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |  2 +-
>  ...canadian_11.2.bb => gdb-cross-canadian_12.1.bb} |  0
>  .../gdb/{gdb-cross_11.2.bb => gdb-cross_12.1.bb}   |  0
>  meta/recipes-devtools/gdb/gdb.inc                  | 14 +++++++-------
>  ...0001-make-man-install-relative-to-DESTDIR.patch | 10 +++++-----
>  ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |  8 ++++----
>  ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 11 +++++------
>  ...-libreadline.a-when-using-disable-static.patch} | 14 +++++++-------
>  ...gidefs.h.patch => 0005-use-asm-sgidefs.h.patch} |  8 ++++----
>  ...AGS.patch => 0006-Change-order-of-CFLAGS.patch} | 10 +++++-----
>  ...> 0007-resolve-restrict-keyword-conflict.patch} |  6 +++---
>  ...tch => 0008-Fix-invalid-sigprocmask-call.patch} |  8 ++++----
>  ....patch => 0009-gdbserver-ctrl-c-handling.patch} | 10 +++++-----
>  .../gdb/{gdb_11.2.bb => gdb_12.1.bb}               |  0
>  14 files changed, 50 insertions(+), 51 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_11.2.bb => gdb-cross-canadian_12.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_11.2.bb => gdb-cross_12.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/gdb/{0005-Dont-disable-libreadline.a-when-using-disable-static.patch => 0004-Dont-disable-libreadline.a-when-using-disable-static.patch} (80%)
>  rename meta/recipes-devtools/gdb/gdb/{0006-use-asm-sgidefs.h.patch => 0005-use-asm-sgidefs.h.patch} (84%)
>  rename meta/recipes-devtools/gdb/gdb/{0007-Change-order-of-CFLAGS.patch => 0006-Change-order-of-CFLAGS.patch} (80%)
>  rename meta/recipes-devtools/gdb/gdb/{0008-resolve-restrict-keyword-conflict.patch => 0007-resolve-restrict-keyword-conflict.patch} (93%)
>  rename meta/recipes-devtools/gdb/gdb/{0009-Fix-invalid-sigprocmask-call.patch => 0008-Fix-invalid-sigprocmask-call.patch} (90%)
>  rename meta/recipes-devtools/gdb/gdb/{0010-gdbserver-ctrl-c-handling.patch => 0009-gdbserver-ctrl-c-handling.patch} (82%)
>  rename meta/recipes-devtools/gdb/{gdb_11.2.bb => gdb_12.1.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 9660f2804a7..1179ba172ff 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  GCCVERSION ?= "12.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.38%"
> -GDBVERSION ?= "11.%"
> +GDBVERSION ?= "12.%"
>  GLIBCVERSION ?= "2.35"
>  LINUXLIBCVERSION ?= "5.16%"
>  QEMUVERSION ?= "7.0%"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_11.2.bb b/meta/recipes-devtools/gdb/gdb-cross_12.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_11.2.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_12.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> index 649ee287276..3b569fd40e7 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -8,11 +8,11 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0001-make-man-install-relative-to-DESTDIR.patch \
>             file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
>             file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
> -           file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch \
> -           file://0006-use-asm-sgidefs.h.patch \
> -           file://0007-Change-order-of-CFLAGS.patch \
> -           file://0008-resolve-restrict-keyword-conflict.patch \
> -           file://0009-Fix-invalid-sigprocmask-call.patch \
> -           file://0010-gdbserver-ctrl-c-handling.patch \
> +           file://0004-Dont-disable-libreadline.a-when-using-disable-static.patch \
> +           file://0005-use-asm-sgidefs.h.patch \
> +           file://0006-Change-order-of-CFLAGS.patch \
> +           file://0007-resolve-restrict-keyword-conflict.patch \
> +           file://0008-Fix-invalid-sigprocmask-call.patch \
> +           file://0009-gdbserver-ctrl-c-handling.patch \
>             "
> -SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
> +SRC_URI[sha256sum] = "0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed"
> diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
> index 824b96f6afe..16d6cf196fd 100644
> --- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
> @@ -1,7 +1,7 @@
> -From a6d3df9d84463ec500d9d01558ab8a17e824e9e5 Mon Sep 17 00:00:00 2001
> +From 8eca28eddcda4ce8a345ca031f43ff1ed6f37089 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 02:27:55 +0000
> -Subject: [PATCH 01/10] make man install relative to DESTDIR
> +Subject: [PATCH 1/9] make man install relative to DESTDIR
>
>  Upstream-Status: Pending
>
> @@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/sim/common/Make-common.in b/sim/common/Make-common.in
> -index 8c2cacea1e5..4a52eef2203 100644
> +index 74e5dad3049..9e95c224ba4 100644
>  --- a/sim/common/Make-common.in
>  +++ b/sim/common/Make-common.in
> -@@ -63,7 +63,7 @@ tooldir = $(libdir)/$(target_alias)
> +@@ -70,7 +70,7 @@ tooldir = $(libdir)/$(target_alias)
>   datadir = @datadir@
>   datarootdir = @datarootdir@
>   mandir = @mandir@
> @@ -24,5 +24,5 @@ index 8c2cacea1e5..4a52eef2203 100644
>   includedir = @includedir@
>
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> index 591c9bfa3f9..8d263de8963 100644
> --- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> @@ -1,7 +1,7 @@
> -From 7f1f25eaaace289bc33c5aaa1c5fe9e04e719651 Mon Sep 17 00:00:00 2001
> +From 37d3afd2eaa95c89ad7cb5d0079b017752e4d0ea Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>  Date: Wed, 23 Mar 2016 06:30:09 +0000
> -Subject: [PATCH 02/10] mips-linux-nat: Define _ABIO32 if not defined
> +Subject: [PATCH 2/9] mips-linux-nat: Define _ABIO32 if not defined
>
>  This helps building gdb on mips64 on musl, since
>  musl does not provide sgidefs.h this define is
> @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
>
>  diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> -index b21c7cb2ea6..6614b4de31e 100644
> +index 20e12b6889e..6adc61235aa 100644
>  --- a/gdb/mips-linux-nat.c
>  +++ b/gdb/mips-linux-nat.c
>  @@ -41,6 +41,10 @@
> @@ -31,5 +31,5 @@ index b21c7cb2ea6..6614b4de31e 100644
>   class mips_linux_nat_target final : public linux_nat_trad_target
>   {
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> index 09ea533b00d..7e09404bb05 100644
> --- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> @@ -1,8 +1,7 @@
> -From 0cb233ec3951582fa1a051a16bfd644ef4969df5 Mon Sep 17 00:00:00 2001
> +From e689eec672ee8c53b3adb2ade2b5deb9b7cd99d4 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>  Date: Sat, 30 Apr 2016 18:32:14 -0700
> -Subject: [PATCH 03/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
> - systems
> +Subject: [PATCH 3/9] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
>
>  Upstream-Status: Pending
>
> @@ -13,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   2 files changed, 12 insertions(+)
>
>  diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
> -index e712a9a5713..76bbcca0928 100644
> +index 1094f6b0be3..d8588a646c2 100644
>  --- a/gdb/nat/ppc-linux.h
>  +++ b/gdb/nat/ppc-linux.h
>  @@ -18,7 +18,13 @@
> @@ -31,7 +30,7 @@ index e712a9a5713..76bbcca0928 100644
>
>   /* This sometimes isn't defined.  */
>  diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
> -index db9a88219ea..151e4183bb1 100644
> +index 08824887003..69afbae5359 100644
>  --- a/gdbserver/linux-ppc-low.cc
>  +++ b/gdbserver/linux-ppc-low.cc
>  @@ -23,7 +23,13 @@
> @@ -49,5 +48,5 @@ index db9a88219ea..151e4183bb1 100644
>   #include "arch/ppc-linux-common.h"
>   #include "arch/ppc-linux-tdesc.h"
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
> similarity index 80%
> rename from meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
> rename to meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
> index 02ea30f9bf8..a1e85e91b33 100644
> --- a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
> @@ -1,7 +1,7 @@
> -From e2efd044c479895767f1b929f5a54fa0c689f318 Mon Sep 17 00:00:00 2001
> +From 15ee6a626242efb8f367be49c13e00d0b72317f0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>  Date: Sat, 30 Apr 2016 15:25:03 -0700
> -Subject: [PATCH 05/10] Dont disable libreadline.a when using --disable-static
> +Subject: [PATCH 4/9] Dont disable libreadline.a when using --disable-static
>
>  If gdb is configured with --disable-static then this is dutifully passed to
>  readline which then disables libreadline.a, which causes a problem when gdb
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/Makefile.def b/Makefile.def
> -index 5a460f1dbbc..77a702ac6d6 100644
> +index acdcd625ed6..78fc31e1199 100644
>  --- a/Makefile.def
>  +++ b/Makefile.def
> -@@ -105,7 +105,8 @@ host_modules= { module= libiconv;
> +@@ -120,7 +120,8 @@ host_modules= { module= libiconv;
>   		missing= install-html;
>   		missing= install-info; };
>   host_modules= { module= m4; };
> @@ -33,10 +33,10 @@ index 5a460f1dbbc..77a702ac6d6 100644
>   host_modules= { module= sim; };
>   host_modules= { module= texinfo; no_install= true; };
>  diff --git a/Makefile.in b/Makefile.in
> -index 9b3a5d75735..98cbe844fca 100644
> +index 3aacd2daac9..aa58adada4a 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -25607,7 +25607,7 @@ configure-readline:
> +@@ -32791,7 +32791,7 @@ configure-readline:
>   	  $$s/$$module_srcdir/configure \
>   	  --srcdir=$${topdir}/$$module_srcdir \
>   	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
> @@ -46,5 +46,5 @@ index 9b3a5d75735..98cbe844fca 100644
>   @endif readline
>
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> similarity index 84%
> rename from meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
> rename to meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> index ef271c45e29..242099b9b1e 100644
> --- a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> @@ -1,7 +1,7 @@
> -From 5077518c11e8d75e9bf65cdf9ca21c59564e1037 Mon Sep 17 00:00:00 2001
> +From 25a75aaf29791f4302f0e4452f7ebaf735d4f083 Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <amccurdy@gmail.com> <amccurdy@gmail.com>
>  Date: Sat, 30 Apr 2016 15:29:06 -0700
> -Subject: [PATCH 06/10] use <asm/sgidefs.h>
> +Subject: [PATCH 5/9] use <asm/sgidefs.h>
>
>  Build fix for MIPS with musl libc
>
> @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> -index 6614b4de31e..237eb6eb975 100644
> +index 6adc61235aa..afb40066744 100644
>  --- a/gdb/mips-linux-nat.c
>  +++ b/gdb/mips-linux-nat.c
>  @@ -31,7 +31,7 @@
> @@ -32,5 +32,5 @@ index 6614b4de31e..237eb6eb975 100644
>   #include <asm/ptrace.h>
>   #include "inf-ptrace.h"
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
> similarity index 80%
> rename from meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
> rename to meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
> index 40d12579c0e..58c9b1d0a78 100644
> --- a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
> @@ -1,7 +1,7 @@
> -From 80080e6c8425ac51498f49c2063b960a08f9a27d Mon Sep 17 00:00:00 2001
> +From c0e7c34134aa1f9644075c596a2338a50d3d923e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>  Date: Sat, 30 Apr 2016 15:35:39 -0700
> -Subject: [PATCH 07/10] Change order of CFLAGS
> +Subject: [PATCH 6/9] Change order of CFLAGS
>
>  Lets us override Werror if need be
>
> @@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
> -index 12e9b2777ae..ad44fbc3309 100644
> +index 47648b8d962..5599779de57 100644
>  --- a/gdbserver/Makefile.in
>  +++ b/gdbserver/Makefile.in
> -@@ -172,7 +172,7 @@ WIN32APILIBS = @WIN32APILIBS@
> +@@ -156,7 +156,7 @@ WIN32APILIBS = @WIN32APILIBS@
>   INTERNAL_CFLAGS_BASE = ${GLOBAL_CFLAGS} \
>   	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
>   INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
> @@ -26,5 +26,5 @@ index 12e9b2777ae..ad44fbc3309 100644
>   # LDFLAGS is specifically reserved for setting from the command line
>   # when running make.
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
> similarity index 93%
> rename from meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
> rename to meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
> index 9095f905828..bbd1f0b27f1 100644
> --- a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
> @@ -1,7 +1,7 @@
> -From 4ee7e8afb9ff259e889ac938c673fda9ddc5e15a Mon Sep 17 00:00:00 2001
> +From 44fa1ecfbd8a5fe0cfea12a175fa041686842a0c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>  Date: Tue, 10 May 2016 08:47:05 -0700
> -Subject: [PATCH 08/10] resolve restrict keyword conflict
> +Subject: [PATCH 7/9] resolve restrict keyword conflict
>
>  GCC detects that we call 'restrict' as param name in function
>  signatures and complains since both params are called 'restrict'
> @@ -44,5 +44,5 @@ index 90a67d18426..664641a1fe8 100644
>   _GL_CXXALIASWARN (gettimeofday);
>   # if defined __cplusplus && defined GNULIB_NAMESPACE
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
> similarity index 90%
> rename from meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
> rename to meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
> index 5b9d1cfaf93..ed1310ced28 100644
> --- a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
> @@ -1,7 +1,7 @@
> -From 5740876d92ddb67b039d5fbcd1b71e6c58823c08 Mon Sep 17 00:00:00 2001
> +From 5bdd15553daef7370ca3c1f12d8f14247fdd4907 Mon Sep 17 00:00:00 2001
>  From: Yousong Zhou <yszhou4tech@gmail.com> <yszhou4tech@gmail.com>
>  Date: Fri, 24 Mar 2017 10:36:03 +0800
> -Subject: [PATCH 09/10] Fix invalid sigprocmask call
> +Subject: [PATCH 8/9] Fix invalid sigprocmask call
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=UTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
> -index 95c156e5036..f4aa512d105 100644
> +index 92e799d3551..a4a0234272a 100644
>  --- a/gdbsupport/signals-state-save-restore.cc
>  +++ b/gdbsupport/signals-state-save-restore.cc
>  @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
> @@ -45,5 +45,5 @@ index 95c156e5036..f4aa512d105 100644
>       perror_with_name (("sigprocmask"));
>
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
> similarity index 82%
> rename from meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
> rename to meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
> index cb4744e5dda..f53d3bd1e54 100644
> --- a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
> +++ b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
> @@ -1,7 +1,7 @@
> -From d611a68f05c0c86af27bf6beae189a90a946e2e3 Mon Sep 17 00:00:00 2001
> +From bc3b1f6aacf2d8fe66b022fbfcf28cd82c76e52f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>  Date: Thu, 29 Nov 2018 18:00:23 -0800
> -Subject: [PATCH 10/10] gdbserver ctrl-c handling
> +Subject: [PATCH 9/9] gdbserver ctrl-c handling
>
>  This problem was created by the upstream commit 78708b7c8c
>  After applying the commit, it will send SIGINT to the process
> @@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
> -index 5c6191d941c..7f7acf6700d 100644
> +index 7726a4a0c36..f750e074a03 100644
>  --- a/gdbserver/linux-low.cc
>  +++ b/gdbserver/linux-low.cc
> -@@ -5733,7 +5733,7 @@ linux_process_target::request_interrupt ()
> +@@ -5496,7 +5496,7 @@ linux_process_target::request_interrupt ()
>   {
>     /* Send a SIGINT to the process group.  This acts just like the user
>        typed a ^C on the controlling terminal.  */
> @@ -36,5 +36,5 @@ index 5c6191d941c..7f7acf6700d 100644
>
>   bool
>  --
> -2.33.1
> +2.36.1
>
> diff --git a/meta/recipes-devtools/gdb/gdb_11.2.bb b/meta/recipes-devtools/gdb/gdb_12.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_11.2.bb
> rename to meta/recipes-devtools/gdb/gdb_12.1.bb
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165541): https://lists.openembedded.org/g/openembedded-core/message/165541
> Mute This Topic: https://lists.openembedded.org/mt/91065965/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--000000000000c0e99d05f5403b54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 21, 2023 at 5:27 PM Randy MacLeod &lt;<a href=
=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">

 =20
  <div>
    <div>On 2022-05-12 15:28, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Release Announcement [1] and Notes [2]

[1] <a href=3D"https://lists.gnu.org/archive/html/info-gnu/2022-05/msg00000=
.html" target=3D"_blank">https://lists.gnu.org/archive/html/info-gnu/2022-0=
5/msg00000.html</a>
[2] <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=
=3Dblob_plain;f=3Dgdb/NEWS;hb=3Dgdb-12.1-release" target=3D"_blank">https:/=
/sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_plain;f=3Dgdb/=
NEWS;hb=3Dgdb-12.1-release</a></pre>
    </blockquote>
    <p>I just noticed that gdb-13.1 was released 2 days ago (Feb 19,
      2023) .</p>
    <p>It seems like a good candidate to be included in the 4.2 release.</p=
>
    <p>$ git diff gdb-12-branch=C2=A0 gdb-13-branch gdb | diffstat | tail -=
1<br>
      =C2=A06222 files changed, 142614 insertions(+), 63875 deletions(-)<br=
>
    </p>
    <p>and=C2=A0 notes linked below.<br>
    </p>
    <p>Khem, <br>
    </p>
    <p>Are you working on that or should someone else start on it?</p></div=
></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I have branch f=
or 13.x already so will send patches tonight=C2=A0</div><div dir=3D"auto"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div><p dir=3D"auto"></p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><a href=3D"https://www.sourceware.org/gdb/download/ANNOUNCEMENT" tar=
get=3D"_blank">https://www.sourceware.org/gdb/download/ANNOUNCEMENT</a></p>
    <p><a href=3D"https://www.sourceware.org/gdb/" target=3D"_blank">https:=
//www.sourceware.org/gdb/</a></p>
    <blockquote type=3D"cite">
      <pre>
Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...<a href=3D"http://canadian_11.2.bb" target=3D"_blank">canadian_11.2.bb<=
/a> =3D&gt; <a href=3D"http://gdb-cross-canadian_12.1.bb" target=3D"_blank"=
>gdb-cross-canadian_12.1.bb</a>} |  0
 .../gdb/{<a href=3D"http://gdb-cross_11.2.bb" target=3D"_blank">gdb-cross_=
11.2.bb</a> =3D&gt; <a href=3D"http://gdb-cross_12.1.bb" target=3D"_blank">=
gdb-cross_12.1.bb</a>}   |  0
 meta/recipes-devtools/gdb/gdb.inc                  | 14 +++++++-------
 ...0001-make-man-install-relative-to-DESTDIR.patch | 10 +++++-----
 ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |  8 ++++----
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 11 +++++------
 ...-libreadline.a-when-using-disable-static.patch} | 14 +++++++-------
 ...gidefs.h.patch =3D&gt; 0005-use-asm-sgidefs.h.patch} |  8 ++++----
 ...AGS.patch =3D&gt; 0006-Change-order-of-CFLAGS.patch} | 10 +++++-----
 ...&gt; 0007-resolve-restrict-keyword-conflict.patch} |  6 +++---
 ...tch =3D&gt; 0008-Fix-invalid-sigprocmask-call.patch} |  8 ++++----
 ....patch =3D&gt; 0009-gdbserver-ctrl-c-handling.patch} | 10 +++++-----
 .../gdb/{<a href=3D"http://gdb_11.2.bb" target=3D"_blank">gdb_11.2.bb</a> =
=3D&gt; <a href=3D"http://gdb_12.1.bb" target=3D"_blank">gdb_12.1.bb</a>}  =
             |  0
 14 files changed, 50 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross-canadian_11.=
2.bb" target=3D"_blank">gdb-cross-canadian_11.2.bb</a> =3D&gt; <a href=3D"h=
ttp://gdb-cross-canadian_12.1.bb" target=3D"_blank">gdb-cross-canadian_12.1=
.bb</a>} (100%)
 rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross_11.2.bb" tar=
get=3D"_blank">gdb-cross_11.2.bb</a> =3D&gt; <a href=3D"http://gdb-cross_12=
.1.bb" target=3D"_blank">gdb-cross_12.1.bb</a>} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0005-Dont-disable-libreadline.a-when=
-using-disable-static.patch =3D&gt; 0004-Dont-disable-libreadline.a-when-us=
ing-disable-static.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0006-use-asm-sgidefs.h.patch =3D&gt;=
 0005-use-asm-sgidefs.h.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0007-Change-order-of-CFLAGS.patch =
=3D&gt; 0006-Change-order-of-CFLAGS.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0008-resolve-restrict-keyword-confli=
ct.patch =3D&gt; 0007-resolve-restrict-keyword-conflict.patch} (93%)
 rename meta/recipes-devtools/gdb/gdb/{0009-Fix-invalid-sigprocmask-call.pa=
tch =3D&gt; 0008-Fix-invalid-sigprocmask-call.patch} (90%)
 rename meta/recipes-devtools/gdb/gdb/{0010-gdbserver-ctrl-c-handling.patch=
 =3D&gt; 0009-gdbserver-ctrl-c-handling.patch} (82%)
 rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb_11.2.bb" target=3D=
"_blank">gdb_11.2.bb</a> =3D&gt; <a href=3D"http://gdb_12.1.bb" target=3D"_=
blank">gdb_12.1.bb</a>} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 9660f2804a7..1179ba172ff 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gettext&qu=
ot;
 GCCVERSION ?=3D &quot;12.%&quot;
 SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;
 BINUVERSION ?=3D &quot;2.38%&quot;
-GDBVERSION ?=3D &quot;11.%&quot;
+GDBVERSION ?=3D &quot;12.%&quot;
 GLIBCVERSION ?=3D &quot;2.35&quot;
 LINUXLIBCVERSION ?=3D &quot;5.16%&quot;
 QEMUVERSION ?=3D &quot;7.0%&quot;
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian=
_11.2.bb" target=3D"_blank">gdb-cross-canadian_11.2.bb</a> b/meta/recipes-d=
evtools/gdb/<a href=3D"http://gdb-cross-canadian_12.1.bb" target=3D"_blank"=
>gdb-cross-canadian_12.1.bb</a>
similarity index 100%
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_=
11.2.bb" target=3D"_blank">gdb-cross-canadian_11.2.bb</a>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_12=
.1.bb" target=3D"_blank">gdb-cross-canadian_12.1.bb</a>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_11.2.bb"=
 target=3D"_blank">gdb-cross_11.2.bb</a> b/meta/recipes-devtools/gdb/<a hre=
f=3D"http://gdb-cross_12.1.bb" target=3D"_blank">gdb-cross_12.1.bb</a>
similarity index 100%
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_11.2.bb" =
target=3D"_blank">gdb-cross_11.2.bb</a>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_12.1.bb" ta=
rget=3D"_blank">gdb-cross_12.1.bb</a>
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/=
gdb.inc
index 649ee287276..3b569fd40e7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -8,11 +8,11 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            <a>file://0001-make-man-install-relative-to-DESTDIR.patch</a> \
            <a>file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.pat=
ch</a> \
            <a>file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-=
syst.patch</a> \
-           <a>file://0005-Dont-disable-libreadline.a-when-using-disable-st=
atic.patch</a> \
-           <a>file://0006-use-asm-sgidefs.h.patch</a> \
-           <a>file://0007-Change-order-of-CFLAGS.patch</a> \
-           <a>file://0008-resolve-restrict-keyword-conflict.patch</a> \
-           <a>file://0009-Fix-invalid-sigprocmask-call.patch</a> \
-           <a>file://0010-gdbserver-ctrl-c-handling.patch</a> \
+           <a>file://0004-Dont-disable-libreadline.a-when-using-disable-st=
atic.patch</a> \
+           <a>file://0005-use-asm-sgidefs.h.patch</a> \
+           <a>file://0006-Change-order-of-CFLAGS.patch</a> \
+           <a>file://0007-resolve-restrict-keyword-conflict.patch</a> \
+           <a>file://0008-Fix-invalid-sigprocmask-call.patch</a> \
+           <a>file://0009-gdbserver-ctrl-c-handling.patch</a> \
            &quot;
-SRC_URI[sha256sum] =3D &quot;1497c36a71881b8671a9a84a0ee40faab788ca30d7ba1=
9d8463c3cc787152e32&quot;
+SRC_URI[sha256sum] =3D &quot;0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28=
c4f7fc017b818d69fed&quot;
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-t=
o-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relat=
ive-to-DESTDIR.patch
index 824b96f6afe..16d6cf196fd 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTD=
IR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTD=
IR.patch
@@ -1,7 +1,7 @@
-From a6d3df9d84463ec500d9d01558ab8a17e824e9e5 Mon Sep 17 00:00:00 2001
+From 8eca28eddcda4ce8a345ca031f43ff1ed6f37089 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt=
;raj.khem@gmail.com&gt;</a>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH 01/10] make man install relative to DESTDIR
+Subject: [PATCH 1/9] make man install relative to DESTDIR
=20
 Upstream-Status: Pending
=20
@@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/sim/common/Make-common.in b/sim/common/Make-common.in
-index 8c2cacea1e5..4a52eef2203 100644
+index 74e5dad3049..9e95c224ba4 100644
 --- a/sim/common/Make-common.in
 +++ b/sim/common/Make-common.in
-@@ -63,7 +63,7 @@ tooldir =3D $(libdir)/$(target_alias)
+@@ -70,7 +70,7 @@ tooldir =3D $(libdir)/$(target_alias)
  datadir =3D @datadir@
  datarootdir =3D @datarootdir@
  mandir =3D @mandir@
@@ -24,5 +24,5 @@ index 8c2cacea1e5..4a52eef2203 100644
  includedir =3D @includedir@
 =20
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO=
32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat=
-Define-_ABIO32-if-not-defined.patch
index 591c9bfa3f9..8d263de8963 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-n=
ot-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-n=
ot-defined.patch
@@ -1,7 +1,7 @@
-From 7f1f25eaaace289bc33c5aaa1c5fe9e04e719651 Mon Sep 17 00:00:00 2001
+From 37d3afd2eaa95c89ad7cb5d0079b017752e4d0ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt=
;raj.khem@gmail.com&gt;</a>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH 02/10] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH 2/9] mips-linux-nat: Define _ABIO32 if not defined
=20
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 4 insertions(+)
=20
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index b21c7cb2ea6..6614b4de31e 100644
+index 20e12b6889e..6adc61235aa 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -41,6 +41,10 @@
@@ -31,5 +31,5 @@ index b21c7cb2ea6..6614b4de31e 100644
  class mips_linux_nat_target final : public linux_nat_trad_target
  {
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-u=
api_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-ppc-pt=
race-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 09ea533b00d..7e09404bb05 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_=
regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_=
regs-on-GLIBC-syst.patch
@@ -1,8 +1,7 @@
-From 0cb233ec3951582fa1a051a16bfd644ef4969df5 Mon Sep 17 00:00:00 2001
+From e689eec672ee8c53b3adb2ade2b5deb9b7cd99d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt=
;raj.khem@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
-Subject: [PATCH 03/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
- systems
+Subject: [PATCH 3/9] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC sys=
tems
=20
 Upstream-Status: Pending
=20
@@ -13,7 +12,7 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  2 files changed, 12 insertions(+)
=20
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index e712a9a5713..76bbcca0928 100644
+index 1094f6b0be3..d8588a646c2 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -31,7 +30,7 @@ index e712a9a5713..76bbcca0928 100644
 =20
  /* This sometimes isn&#39;t defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index db9a88219ea..151e4183bb1 100644
+index 08824887003..69afbae5359 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -23,7 +23,13 @@
@@ -49,5 +48,5 @@ index db9a88219ea..151e4183bb1 100644
  #include &quot;arch/ppc-linux-common.h&quot;
  #include &quot;arch/ppc-linux-tdesc.h&quot;
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-=
when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0004-Dont-d=
isable-libreadline.a-when-using-disable-static.patch
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-w=
hen-using-disable-static.patch
rename to meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-whe=
n-using-disable-static.patch
index 02ea30f9bf8..a1e85e91b33 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-us=
ing-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-us=
ing-disable-static.patch
@@ -1,7 +1,7 @@
-From e2efd044c479895767f1b929f5a54fa0c689f318 Mon Sep 17 00:00:00 2001
+From 15ee6a626242efb8f367be49c13e00d0b72317f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt=
;raj.khem@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
-Subject: [PATCH 05/10] Dont disable libreadline.a when using --disable-sta=
tic
+Subject: [PATCH 4/9] Dont disable libreadline.a when using --disable-stati=
c
=20
 If gdb is configured with --disable-static then this is dutifully passed t=
o
 readline which then disables libreadline.a, which causes a problem when gd=
b
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  2 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/Makefile.def b/Makefile.def
-index 5a460f1dbbc..77a702ac6d6 100644
+index acdcd625ed6..78fc31e1199 100644
 --- a/Makefile.def
 +++ b/Makefile.def
-@@ -105,7 +105,8 @@ host_modules=3D { module=3D libiconv;
+@@ -120,7 +120,8 @@ host_modules=3D { module=3D libiconv;
  		missing=3D install-html;
  		missing=3D install-info; };
  host_modules=3D { module=3D m4; };
@@ -33,10 +33,10 @@ index 5a460f1dbbc..77a702ac6d6 100644
  host_modules=3D { module=3D sim; };
  host_modules=3D { module=3D texinfo; no_install=3D true; };
 diff --git a/Makefile.in b/Makefile.in
-index 9b3a5d75735..98cbe844fca 100644
+index 3aacd2daac9..aa58adada4a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25607,7 +25607,7 @@ configure-readline:
+@@ -32791,7 +32791,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=3D$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=3D${build_alias} --host=3D${host_alias} \
@@ -46,5 +46,5 @@ index 9b3a5d75735..98cbe844fca 100644
  @endif readline
 =20
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch b/m=
eta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
similarity index 84%
rename from meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
rename to meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
index ef271c45e29..242099b9b1e 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 5077518c11e8d75e9bf65cdf9ca21c59564e1037 Mon Sep 17 00:00:00 2001
+From 25a75aaf29791f4302f0e4452f7ebaf735d4f083 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <a href=3D"mailto:amccurdy@gmail.com" target=3D"_blank=
">&lt;amccurdy@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH 06/10] use &lt;asm/sgidefs.h&gt;
+Subject: [PATCH 5/9] use &lt;asm/sgidefs.h&gt;
=20
 Build fix for MIPS with musl libc
=20
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 6614b4de31e..237eb6eb975 100644
+index 6adc61235aa..afb40066744 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -32,5 +32,5 @@ index 6614b4de31e..237eb6eb975 100644
  #include &lt;asm/ptrace.h&gt;
  #include &quot;inf-ptrace.h&quot;
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patc=
h b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
rename to meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
index 40d12579c0e..58c9b1d0a78 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From 80080e6c8425ac51498f49c2063b960a08f9a27d Mon Sep 17 00:00:00 2001
+From c0e7c34134aa1f9644075c596a2338a50d3d923e Mon Sep 17 00:00:00 2001
 From: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt=
;raj.khem@gmail.com&gt;</a>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
-Subject: [PATCH 07/10] Change order of CFLAGS
+Subject: [PATCH 6/9] Change order of CFLAGS
=20
 Lets us override Werror if need be
=20
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 12e9b2777ae..ad44fbc3309 100644
+index 47648b8d962..5599779de57 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
-@@ -172,7 +172,7 @@ WIN32APILIBS =3D @WIN32APILIBS@
+@@ -156,7 +156,7 @@ WIN32APILIBS =3D @WIN32APILIBS@
  INTERNAL_CFLAGS_BASE =3D ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
  INTERNAL_WARN_CFLAGS =3D ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
@@ -26,5 +26,5 @@ index 12e9b2777ae..ad44fbc3309 100644
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-co=
nflict.patch b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-=
conflict.patch
similarity index 93%
rename from meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-con=
flict.patch
rename to meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-confl=
ict.patch
index 9095f905828..bbd1f0b27f1 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.=
patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.=
patch
@@ -1,7 +1,7 @@
-From 4ee7e8afb9ff259e889ac938c673fda9ddc5e15a Mon Sep 17 00:00:00 2001
+From 44fa1ecfbd8a5fe0cfea12a175fa041686842a0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt=
;raj.khem@gmail.com&gt;</a>
 Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH 08/10] resolve restrict keyword conflict
+Subject: [PATCH 7/9] resolve restrict keyword conflict
=20
 GCC detects that we call &#39;restrict&#39; as param name in function
 signatures and complains since both params are called &#39;restrict&#39;
@@ -44,5 +44,5 @@ index 90a67d18426..664641a1fe8 100644
  _GL_CXXALIASWARN (gettimeofday);
  # if defined __cplusplus &amp;&amp; defined GNULIB_NAMESPACE
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-cal=
l.patch b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.p=
atch
similarity index 90%
rename from meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call=
.patch
rename to meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.p=
atch
index 5b9d1cfaf93..ed1310ced28 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
@@ -1,7 +1,7 @@
-From 5740876d92ddb67b039d5fbcd1b71e6c58823c08 Mon Sep 17 00:00:00 2001
+From 5bdd15553daef7370ca3c1f12d8f14247fdd4907 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <a href=3D"mailto:yszhou4tech@gmail.com" target=3D"_bla=
nk">&lt;yszhou4tech@gmail.com&gt;</a>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
-Subject: [PATCH 09/10] Fix invalid sigprocmask call
+Subject: [PATCH 8/9] Fix invalid sigprocmask call
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals=
-state-save-restore.cc
-index 95c156e5036..f4aa512d105 100644
+index 92e799d3551..a4a0234272a 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
 @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
@@ -45,5 +45,5 @@ index 95c156e5036..f4aa512d105 100644
      perror_with_name ((&quot;sigprocmask&quot;));
 =20
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.p=
atch b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
similarity index 82%
rename from meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.pa=
tch
rename to meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patc=
h
index cb4744e5dda..f53d3bd1e54 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
@@ -1,7 +1,7 @@
-From d611a68f05c0c86af27bf6beae189a90a946e2e3 Mon Sep 17 00:00:00 2001
+From bc3b1f6aacf2d8fe66b022fbfcf28cd82c76e52f Mon Sep 17 00:00:00 2001
 From: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">&lt=
;raj.khem@gmail.com&gt;</a>
 Date: Thu, 29 Nov 2018 18:00:23 -0800
-Subject: [PATCH 10/10] gdbserver ctrl-c handling
+Subject: [PATCH 9/9] gdbserver ctrl-c handling
=20
 This problem was created by the upstream commit 78708b7c8c
 After applying the commit, it will send SIGINT to the process
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">&lt;raj.khem@gmail.com&gt;</a>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
-index 5c6191d941c..7f7acf6700d 100644
+index 7726a4a0c36..f750e074a03 100644
 --- a/gdbserver/linux-low.cc
 +++ b/gdbserver/linux-low.cc
-@@ -5733,7 +5733,7 @@ linux_process_target::request_interrupt ()
+@@ -5496,7 +5496,7 @@ linux_process_target::request_interrupt ()
  {
    /* Send a SIGINT to the process group.  This acts just like the user
       typed a ^C on the controlling terminal.  */
@@ -36,5 +36,5 @@ index 5c6191d941c..7f7acf6700d 100644
 =20
  bool
 --=20
-2.33.1
+2.36.1
=20
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb_11.2.bb" targe=
t=3D"_blank">gdb_11.2.bb</a> b/meta/recipes-devtools/gdb/<a href=3D"http://=
gdb_12.1.bb" target=3D"_blank">gdb_12.1.bb</a>
similarity index 100%
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb_11.2.bb" target=
=3D"_blank">gdb_11.2.bb</a>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb_12.1.bb" target=
=3D"_blank">gdb_12.1.bb</a>
</pre>
      <br>
      <fieldset></fieldset>
      <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#165541): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165541" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/165541</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91065965/3616=
765" target=3D"_blank">https://lists.openembedded.org/mt/91065965/3616765</=
a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core=
/unsub</a> [<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank=
">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre></blockquote></div><div><blockquote type=3D"cite">
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div></div>

--000000000000c0e99d05f5403b54--

