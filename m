Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5725C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 15:26:07 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.35120.1690557960156153308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 08:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lfaCH4eV;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso34687091fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690557958; x=1691162758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AplrXMF2eI/HoDGgzTOszOLIU3tqyXUbu7WQj77POyg=;
        b=lfaCH4eV0Acbew7yLHZpt7F1uB2/xpSwsQqclALusbE3yVPCS5CDPVuHRyIGZc4PJW
         QXLrBaWbGosnUquzt5HtsLrghL+6mdSyS//IeO62iVUlxMYZUL1NaAdkeqIX7W6qQd2x
         ZlZeR88iDdTzd5Khk2KNpANNuBjUHuyr0Nrm9+hZML/Sf7Wr7xDV7X+n8c+aGgp4qlLT
         UESJmJW/LnSnJ3LqIG2yMkMSWXrQSZE+uGh1B1w4x0tQ0/68TxSYucgkXVBCwJdA9CIZ
         XA/Jd68oDXAgwEIx+AKkzgRSnyb5gjYDB3bj0awhOmItSzAYxNREvMRpyEYpPUpkKApo
         6O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690557958; x=1691162758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AplrXMF2eI/HoDGgzTOszOLIU3tqyXUbu7WQj77POyg=;
        b=fNqWOosH4YMkQ6gYn7CXrzhl62uvSiLjFt4mpcezJ618UuLdn+FW2W5kxWok3o2Un0
         t8amB9K9UVcqv3XF63ht0ao62zqF5WtTPTUnIIg3DXiy9BefpMGYF8rnK+lqNcRPEPsY
         titzUkIE6pI5P8vp80CeO+VRnk65R885F5/vXT4DGXY2Iij7EiZ97v9RCrXRfGrYZDEe
         82jti2OgYdoPDV8zoaj2Pn1LcBhY5HzFg5ePU5rEW/3vlYPSho9StBbqygh+DYdAd0tu
         CO5S0H2W9fL6uXZ8GasstGqvBtu5MPXedm0kzSCHJjFb69eMekEHtDVcOlgXZfyyoM+Y
         K0wQ==
X-Gm-Message-State: ABy/qLY68Wxqb4N4cc6uloelC07mSbB/lXMp9+jBV7YxkEga8B+2banU
	Vq0tY7iO+qD0nNsllz82dIOwsg+Gt5uMPe84Yh8=
X-Google-Smtp-Source: APBJJlFwjqguwxnLjd+O2Cxd0jfo0Jf7WjzOUbcGJ7d0u3+IGx0JbpqMd4mslUpPx2lpOhcAt/YQ8xC2yA5AaKQitR4=
X-Received: by 2002:a2e:b0e3:0:b0:2b7:1005:931b with SMTP id
 h3-20020a2eb0e3000000b002b71005931bmr1874588ljl.0.1690557958064; Fri, 28 Jul
 2023 08:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-12-alex@linutronix.de>
 <20230728131317ca8fba29@mail.local> <17760BA193C3A223.27447@lists.openembedded.org>
In-Reply-To: <17760BA193C3A223.27447@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Jul 2023 17:25:46 +0200
Message-ID: <CANNYZj_=kDrFgL8nEv8vJsu6zvOra+V92=GjCGj-j2YVhhiOSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/21] util-linux: upgrade 2.38.1 -> 2.39.1
To: alex.kanavin@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 15:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185037

I just locally ran the ptest against current abelloni/master-next
(1db230c0191eefffd94be0e8f40312b76e8b8769) with arm-64 target on an
x86 host, and that passed too. I can try to do that on the actual arm
host in the AB cluster, but otherwise out of ideas at the moment. Can
you bisect the patchset?

Alex

On Fri, 28 Jul 2023 at 15:38, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I don't know. Nothing stands out in particular here:
> https://git.yoctoproject.org/poky-contrib/log/?h=abelloni/master-next
>
> Both failures happened on arm64 I think?
>
> Alex
>
> On Fri, 28 Jul 2023 at 15:13, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > I got a new ptest failure twice with this patch:
> >
> > 'util-linux': ['lsfd:_--inet_option']
> >
> > I don't see it on your run, I'm wondering what is in my branch that
> > causes it.
> >
> > On 27/07/2023 16:36:18+0200, Alexander Kanavin wrote:
> > > License-update: added bsd-2-clause
> > > https://github.com/util-linux/util-linux/commit/faeb1b64b36ededd1a0b62555cad65f002d47ac6
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  ...2.38.1.bb => util-linux-libuuid_2.39.1.bb} |  0
> > >  meta/recipes-core/util-linux/util-linux.inc   | 10 ++--
> > >  .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
> > >  ...configure.ac-Improve-check-for-magic.patch | 40 --------------
> > >  .../util-linux/util-linux/run-ptest           |  6 +++
> > >  ...l-linux_2.38.1.bb => util-linux_2.39.1.bb} |  0
> > >  6 files changed, 10 insertions(+), 99 deletions(-)
> > >  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb => util-linux-libuuid_2.39.1.bb} (100%)
> > >  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
> > >  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
> > >  rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb => util-linux_2.39.1.bb} (100%)
> > >
> > > diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
> > > rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
> > > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> > > index 3868b1c41d3..99ce2a24b0a 100644
> > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > @@ -6,13 +6,13 @@ disk partitioning, kernel message management, filesystem creation, and system lo
> > >
> > >  SECTION = "base"
> > >
> > > -LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause"
> > > +LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
> > >  LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
> > >  LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
> > >  LICENSE:${PN}-libmount = "LGPL-2.1-or-later"
> > >  LICENSE:${PN}-libsmartcols = "LGPL-2.1-or-later"
> > >
> > > -LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
> > > +LIC_FILES_CHKSUM = "file://README.licensing;md5=12ae7768a65ec8f2e44d930df9cb43fa \
> > >                      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > >                      file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > >                      file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
> > > @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da
> > >                      file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> > >                      file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> > >                      file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> > > -"
> > > +                    "
> > >
> > >  FILESEXTRAPATHS:prepend := "${THISDIR}/util-linux:"
> > >  MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> > > @@ -35,8 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
> > >             file://run-ptest \
> > >             file://display_testname_for_subtest.patch \
> > >             file://avoid_parallel_tests.patch \
> > > -           file://0001-check-for-sys-pidfd.h.patch \
> > > -           file://0001-configure.ac-Improve-check-for-magic.patch \
> > >             "
> > >
> > > -SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
> > > +SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
> > > diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
> > > deleted file mode 100644
> > > index 19f57f14bc7..00000000000
> > > --- a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
> > > +++ /dev/null
> > > @@ -1,53 +0,0 @@
> > > -From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
> > > -From: Khem Raj <raj.khem@gmail.com>
> > > -Date: Sun, 7 Aug 2022 14:39:19 -0700
> > > -Subject: [PATCH] check for sys/pidfd.h
> > > -
> > > -This header in newer glibc defines the signatures of functions
> > > -pidfd_send_signal() and pidfd_open() and when these functions are
> > > -defined by libc then we need to include the relevant header to get
> > > -the definitions. Clang 15+ has started to error out when function
> > > -signatures are missing.
> > > -
> > > -Fixes errors like
> > > -misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_signal'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > > -        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
> > > -
> > > -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/1769]
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ----
> > > - configure.ac          | 1 +
> > > - include/pidfd-utils.h | 4 +++-
> > > - 2 files changed, 4 insertions(+), 1 deletion(-)
> > > -
> > > -diff --git a/configure.ac b/configure.ac
> > > -index a511e93de..fd7d9245f 100644
> > > ---- a/configure.ac
> > > -+++ b/configure.ac
> > > -@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
> > > -     sys/mkdev.h \
> > > -     sys/mount.h \
> > > -     sys/param.h \
> > > -+    sys/pidfd.h \
> > > -     sys/prctl.h \
> > > -     sys/resource.h \
> > > -     sys/sendfile.h \
> > > -diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
> > > -index eddede976..d9e33cbc5 100644
> > > ---- a/include/pidfd-utils.h
> > > -+++ b/include/pidfd-utils.h
> > > -@@ -4,8 +4,10 @@
> > > - #ifdef HAVE_SYS_SYSCALL_H
> > > - # include <sys/syscall.h>
> > > - # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
> > > -+#  ifdef HAVE_SYS_PIDFD_H
> > > -+#   include <sys/pidfd.h>
> > > -+#  endif
> > > - #  include <sys/types.h>
> > > --
> > > - #  ifndef HAVE_PIDFD_SEND_SIGNAL
> > > - static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
> > > -                                 unsigned int flags)
> > > ---
> > > -2.37.1
> > > -
> > > diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
> > > deleted file mode 100644
> > > index 00611fe5788..00000000000
> > > --- a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
> > > +++ /dev/null
> > > @@ -1,40 +0,0 @@
> > > -From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
> > > -From: Mateusz Marciniec <mateuszmar2@gmail.com>
> > > -Date: Fri, 19 Aug 2022 14:47:49 +0200
> > > -Subject: [PATCH] configure.ac: Improve check for magic
> > > -
> > > -Check whether magic.h header exists before defining HAVE_MAGIC.
> > > -
> > > -Despite library availability there still can be missing header.
> > > -Current test doesn't cover that possibility which will lead compilation
> > > -to fail in case of separate sysroot.
> > > -
> > > -Upstream-Status: Backport
> > > -[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc811273b66bc52087b]
> > > -
> > > -Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
> > > -Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > > ----
> > > - configure.ac | 6 ++++--
> > > - 1 file changed, 4 insertions(+), 2 deletions(-)
> > > -
> > > -diff --git a/configure.ac b/configure.ac
> > > -index daa8f0dca..968a0daf0 100644
> > > ---- a/configure.ac
> > > -+++ b/configure.ac
> > > -@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
> > > - )
> > > - AS_IF([test "x$with_libmagic" = xno], [have_magic=no], [
> > > -   AC_CHECK_LIB([magic], [magic_open], [
> > > --    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
> > > --    MAGIC_LIBS="-lmagic"
> > > -+    AC_CHECK_HEADER(magic.h, [
> > > -+      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
> > > -+      MAGIC_LIBS="-lmagic"
> > > -+    ])
> > > -   ])
> > > - ])
> > > - AC_SUBST([MAGIC_LIBS])
> > > ---
> > > -2.37.1
> > > -
> > > diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
> > > index 097107cd095..e25e9d10823 100644
> > > --- a/meta/recipes-core/util-linux/util-linux/run-ptest
> > > +++ b/meta/recipes-core/util-linux/util-linux/run-ptest
> > > @@ -16,6 +16,12 @@ export PATH=$bindir/bin:$PATH
> > >  # losetup tests will be skipped and/or fail otherwise
> > >  modprobe loop
> > >
> > > +# required for mount/fallback test to pass
> > > +# systemd does this by default, but ptest images do not use it
> > > +# see https://man7.org/linux/man-pages/man7/mount_namespaces.7.html
> > > +# for a long description of mount namespaces in Linux
> > > +mount --make-shared /
> > > +
> > >  ./tests/run.sh --use-system-commands --parsable --show-diff | sed -u '{
> > >        s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/
> > >        s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/
> > > diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > > rename to meta/recipes-core/util-linux/util-linux_2.39.1.bb
> > > --
> > > 2.30.2
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185030): https://lists.openembedded.org/g/openembedded-core/message/185030
> Mute This Topic: https://lists.openembedded.org/mt/100391613/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

