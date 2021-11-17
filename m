Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2946BC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:32:53 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web12.10362.1637170372482944323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RKxbX0bE;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id t13so7562400uad.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PdVoUTqyfvvwu6GlKZZsmKO5GGEj36pivs0roPyiAC4=;
        b=RKxbX0bEIG4Ds584dDC8PEsV19+SRdW2j9JS5OLCoh9KtSzyuHJYDEsDWRzaHaSRR5
         LEt0rmiw03ssMqr4reY3vXREAvndJzOha+MA6J4eeUqVw5BrXP0xKu9rjG266NDJu7gx
         WBuJaFhZG/QZnq2/iYQ+0QS+eKRBmlC1/+2ckX5eGs69Efj/6WGCTCf07yZxOyt7ZTRB
         pkjHHzHr3rsKh/HsEjJy0EhsiNJP7RdviqeQ/lODzrZIppzPT+X/X9fV7oQ6Ol59AgGm
         dOltCGdwRm4n4CUZfCaYoIgsTCU3Q9p27VsPRk75YNtb0OCwVUFAb/Z5viXyrN4mgBt8
         zW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PdVoUTqyfvvwu6GlKZZsmKO5GGEj36pivs0roPyiAC4=;
        b=cVqATQMr0th+jPqCNKXyK3J24E4psyFphPsBePaLCpPhWTgk+rQJp9XlWjQvrMskuB
         xa1/R9PQRYOhoeNIX4QCTfHGtPCfZjBP1fYrZxDAIEZYSP7PVhAxUCS0ugZ9wEQg9RLL
         K84hw5y0fe9NM7CQu2i6an+mic+qGY9x7nU1LJwrTPIWK2J+fPUZlfKNd86f0gzzQSek
         6cmftSDOjvSWOwQCkrC/MLCfyyl4XnwzMxdNqo1Kru9gCqQ5g5xl2rx8Vu63lvtCn9OF
         B/xMQcqZTPMQiTsE/KXp2rjJN1KL16aKPT9/hIBDXeAbV61Nc9W4kBo6f/vIvLJplypB
         JFTQ==
X-Gm-Message-State: AOAM530+1bF21DNcHXi+IRC6QoG0kJz1iaCoBzO4Ke0IeoJDlKJUh/Hq
	g6XSlOX2TCYSEOQbnlgiiryYgvRcMpLyHGvEhEE=
X-Google-Smtp-Source: 
 ABdhPJznukF52IV9rRMzzuE0sVG2lly0pwyPpdmy0aZPpIVETM5VDYYoIsCsmGWevsI6TIJyflf2tYj9kisCi0LTouE=
X-Received: by 2002:ab0:648c:: with SMTP id p12mr25657552uam.93.1637170371452;
 Wed, 17 Nov 2021 09:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-22-alex@linutronix.de>
 <CAMKF1sq-59kYn0WpPKzNB331BLSrDKweCk2+S3AhSsZ2Eb1WVQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq-59kYn0WpPKzNB331BLSrDKweCk2+S3AhSsZ2Eb1WVQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 18:32:40 +0100
Message-ID: 
 <CANNYZj8JDt_F+v3TxUuXHV9S-EPR9=9mYdNxd1Pg2Hwe4esLiA@mail.gmail.com>
Subject: Re: [PATCH 22/36] elfutils: update 0.185 -> 0.186
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Hongxu Jia <hongxu.jia@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mark Wielaard <mark@klomp.org>
Content-Type: multipart/alternative; boundary="0000000000006d63d505d0ff6e5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:32:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158438

--0000000000006d63d505d0ff6e5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Nov 2021 at 18:15, Khem Raj <raj.khem@gmail.com> wrote:

> > Rework support for error() on non-glibc targets:
> > upstream now provides its own implementation, so we can drop
> > the patch that adds ours; said implementation isn't
> > build-tested with tests, so ptest has to be disabled on musl.
>
> Overall this is an improvement so I am good with this patch.
> if upstream implementation does not pass ptests
> perhaps worth reporting upstream.
>

I would if upstream would be interested in tests with anything except
glibc, but I'm fairly sure they're not. The tests don't even build with
musl without invasive patching.

Alex



>
> > This, in turns, allows dropping 0004-Fix-error-on-musl.patch.
> >
> > License-Update: copyright years
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../{elfutils_0.185.bb =3D> elfutils_0.186.bb}  |  12 +-
> >  ...ompilation-on-platforms-without-erro.patch |  54 +++++++
> >  .../elfutils/files/0002-musl-libs.patch       | 118 ---------------
> >  .../elfutils/files/0003-musl-utils.patch      |   6 +-
> >  .../files/0004-Fix-error-on-musl.patch        |  36 -----
> >  .../0015-config-eu.am-do-not-use-Werror.patch |   8 +-
> >  .../elfutils/files/glibc-2.34-fix.patch       | 138 ------------------
> >  7 files changed, 65 insertions(+), 307 deletions(-)
> >  rename meta/recipes-devtools/elfutils/{elfutils_0.185.bb =3D>
> elfutils_0.186.bb} (95%)
> >  create mode 100644
> meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on-p=
latforms-without-erro.patch
> >  delete mode 100644
> meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> >  delete mode 100644
> meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> >  delete mode 100644
> meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
> >
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
> > similarity index 95%
> > rename from meta/recipes-devtools/elfutils/elfutils_0.185.bb
> > rename to meta/recipes-devtools/elfutils/elfutils_0.186.bb
> > index f4769e3632..b3588a2196 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "elfutils is a collection of utilities =
and
> libraries to read, crea
> >  SECTION =3D "base"
> >  LICENSE =3D "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504
> \
> > -
> file://debuginfod/debuginfod-client.c;endline=3D27;md5=3Df8e9d171c401c493=
ec45a0b2992ea2ed
> \
> > +
> file://debuginfod/debuginfod-client.c;endline=3D27;md5=3Dd2adfd8f5347d4c9=
6e3c280393ce66da
> \
> >                      "
> >  DEPENDS =3D "zlib virtual/libintl"
> >  DEPENDS:append:libc-musl =3D " argp-standalone fts musl-obstack "
> > @@ -22,20 +22,16 @@ SRC_URI =3D "
> https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
> >             file://ptest.patch \
> >
>  file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
> >
>  file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
> > -           file://glibc-2.34-fix.patch \
> > +
>  file://0001-debuginfod-fix-compilation-on-platforms-without-erro.patch \
> >             "
> >  SRC_URI:append:libc-musl =3D " \
> > -           file://0002-musl-libs.patch \
> >             file://0003-musl-utils.patch \
> > -           file://0004-Fix-error-on-musl.patch \
> >             file://0015-config-eu.am-do-not-use-Werror.patch \
> >             "
> > -SRC_URI[sha256sum] =3D
> "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10049a73da2ae6b5a6"
> > -
> > -# remove at next version upgrade or when output changes
> > -PR =3D "r1"
> > +SRC_URI[sha256sum] =3D
> "7f6fb9149b1673d38d9178a0d3e0fb8a1ec4f53a9f4c2ff89469609879641177"
> >
> >  inherit autotools gettext ptest pkgconfig
> > +PTEST_ENABLED:libc-musl =3D "0"
> >
> >  EXTRA_OECONF =3D "--program-prefix=3Deu-"
> >
> > diff --git
> a/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on=
-platforms-without-erro.patch
> b/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on=
-platforms-without-erro.patch
> > new file mode 100644
> > index 0000000000..e80d96aaca
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on=
-platforms-without-erro.patch
> > @@ -0,0 +1,54 @@
> > +From 99617d7ab5b01c322b0f27d4aa0dd91c61793a5e Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?=3DC3=3D89rico=3D20Nogueira?=3D <erico.erc@gmail.com=
>
> > +Date: Wed, 10 Nov 2021 21:17:48 -0300
> > +Subject: [PATCH] debuginfod: fix compilation on platforms without
> <error.h>
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +"system.h" only declares the error() function, so it needs to be in an
> > +'extern "C"' block, otherwise linking fails.
> > +
> > +Since we are here, use quotes for "system.h" header, since it's a loca=
l
> > +header, not a system one.
> > +
> > +Upstream-Status: Backport [
> https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommit;h=3D90b9e91b961b7=
94a4e58ab76d9191a5e7343584e
> ]
> > +Signed-off-by: =C3=89rico Nogueira <erico.erc@gmail.com>
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + debuginfod/ChangeLog      | 4 ++++
> > + debuginfod/debuginfod.cxx | 2 +-
> > + 2 files changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/debuginfod/ChangeLog b/debuginfod/ChangeLog
> > +index f06d3ee..822bd63 100644
> > +--- a/debuginfod/ChangeLog
> > ++++ b/debuginfod/ChangeLog
> > +@@ -1,3 +1,7 @@
> > ++2021-11-10  =C3=89rico N. Rolim  <erico.erc@gmail.com>
> > ++
> > ++      * debuginfod.cxx: include "system.h" under 'extern "C"' block.
> > ++
> > + 2021-11-05  Frank Ch. Eigler  <fche@redhat.com>
> > +
> > +       PR28430
> > +diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
> > +index 521cb52..764e7b9 100644
> > +--- a/debuginfod/debuginfod.cxx
> > ++++ b/debuginfod/debuginfod.cxx
> > +@@ -33,11 +33,11 @@
> > +
> > + extern "C" {
> > + #include "printversion.h"
> > ++#include "system.h"
> > + }
> > +
> > + #include "debuginfod.h"
> > + #include <dwarf.h>
> > +-#include <system.h>
> > +
> > + #include <argp.h>
> > + #ifdef __GNUC__
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> > deleted file mode 100644
> > index c7360da7a7..0000000000
> > --- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> > +++ /dev/null
> > @@ -1,118 +0,0 @@
> > -From 0f4667f0bb4b000d74ade07e90bd690b7217a19d Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Fri, 23 Aug 2019 10:18:47 +0800
> > -Subject: [PATCH] musl-libs
> > -
> > -Collection of fixes needed to compile libelf and other libraries
> > -provided by elfutils for musl targets
> > -
> > -error is glibc specific API, so this patch will mostly not accepted
> > -upstream given that elfutils has been closely tied to glibc
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Upstream-Status: Inappropriate [workaround for musl]
> > -
> > -Rebase to 0.177
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > -
> > ----
> > - lib/error.h                    | 27 +++++++++++++++++++++++++++
> > - lib/fixedsizehash.h            |  1 -
> > - lib/libeu.h                    |  1 +
> > - libdwfl/linux-kernel-modules.c |  1 +
> > - libelf/elf.h                   |  7 +++++++
> > - 5 files changed, 36 insertions(+), 1 deletion(-)
> > - create mode 100644 lib/error.h
> > -
> > -diff --git a/lib/error.h b/lib/error.h
> > -new file mode 100644
> > -index 0000000..ef06827
> > ---- /dev/null
> > -+++ b/lib/error.h
> > -@@ -0,0 +1,27 @@
> > -+#ifndef _ERROR_H_
> > -+#define _ERROR_H_
> > -+
> > -+#include <stdarg.h>
> > -+#include <stdio.h>
> > -+#include <stdlib.h>
> > -+#include <string.h>
> > -+#include <errno.h>
> > -+
> > -+static unsigned int error_message_count =3D 0;
> > -+
> > -+static inline void error(int status, int errnum, const char* format,
> ...)
> > -+{
> > -+      va_list ap;
> > -+      fprintf(stderr, "%s: ", program_invocation_name);
> > -+      va_start(ap, format);
> > -+      vfprintf(stderr, format, ap);
> > -+      va_end(ap);
> > -+      if (errnum)
> > -+              fprintf(stderr, ": %s", strerror(errnum));
> > -+      fprintf(stderr, "\n");
> > -+      error_message_count++;
> > -+      if (status)
> > -+              exit(status);
> > -+}
> > -+
> > -+#endif        /* _ERROR_H_ */
> > -diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
> > -index dac2a5f..43016fc 100644
> > ---- a/lib/fixedsizehash.h
> > -+++ b/lib/fixedsizehash.h
> > -@@ -30,7 +30,6 @@
> > - #include <errno.h>
> > - #include <stdlib.h>
> > - #include <string.h>
> > --#include <sys/cdefs.h>
> > -
> > - #include <system.h>
> > -
> > -diff --git a/lib/libeu.h b/lib/libeu.h
> > -index ecb4d01..edc85e3 100644
> > ---- a/lib/libeu.h
> > -+++ b/lib/libeu.h
> > -@@ -29,6 +29,7 @@
> > - #ifndef LIBEU_H
> > - #define LIBEU_H
> > -
> > -+#include "system.h"
> > - #include <stddef.h>
> > - #include <stdint.h>
> > -
> > -diff --git a/libdwfl/linux-kernel-modules.c
> b/libdwfl/linux-kernel-modules.c
> > -index c0f8dfa..aa78033 100644
> > ---- a/libdwfl/linux-kernel-modules.c
> > -+++ b/libdwfl/linux-kernel-modules.c
> > -@@ -50,6 +50,7 @@
> > - #include <sys/utsname.h>
> > - #include <fcntl.h>
> > - #include <unistd.h>
> > -+#include "system.h"
> > -
> > - /* If fts.h is included before config.h, its indirect inclusions may
> not
> > -    give us the right LFS aliases of these functions, so map them
> manually.  */
> > -diff --git a/libelf/elf.h b/libelf/elf.h
> > -index 8e3e618..1353890 100644
> > ---- a/libelf/elf.h
> > -+++ b/libelf/elf.h
> > -@@ -19,6 +19,10 @@
> > - #ifndef _ELF_H
> > - #define       _ELF_H 1
> > -
> > -+#ifdef __cplusplus
> > -+extern "C" {
> > -+#endif
> > -+
> > - /* Standard ELF types.  */
> > -
> > - #include <stdint.h>
> > -@@ -4102,4 +4106,7 @@ enum
> > - #define R_ARC_TLS_LE_S9               0x4a
> > - #define R_ARC_TLS_LE_32               0x4b
> > -
> > -+#ifdef __cplusplus
> > -+}
> > -+#endif
> > - #endif        /* elf.h */
> > diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> > index 2e379cdba6..85f8140330 100644
> > --- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> > +++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> > @@ -1,4 +1,4 @@
> > -From 2f94d488bf3daaa6a8548ee77120fc2506a9bbe3 Mon Sep 17 00:00:00 2001
> > +From 934d21dc0b06b95c7c65cb29c5096decd91d4d5f Mon Sep 17 00:00:00 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Fri, 23 Aug 2019 10:19:48 +0800
> >  Subject: [PATCH] musl-utils
> > @@ -57,7 +57,7 @@ index 2c6d91b..608646e 100644
> >   ARGP_PROGRAM_VERSION_HOOK_DEF =3D print_version;
> >
> >  diff --git a/src/strip.c b/src/strip.c
> > -index 70fc8c0..d035d9e 100644
> > +index d5b753d..d6e1b64 100644
> >  --- a/src/strip.c
> >  +++ b/src/strip.c
> >  @@ -46,6 +46,13 @@
> > @@ -75,7 +75,7 @@ index 70fc8c0..d035d9e 100644
> >
> >   /* Name and version of program.  */
> >  diff --git a/src/unstrip.c b/src/unstrip.c
> > -index e488e81..0e44456 100644
> > +index aacc9aa..5e71290 100644
> >  --- a/src/unstrip.c
> >  +++ b/src/unstrip.c
> >  @@ -52,6 +52,15 @@
> > diff --git
> a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> > deleted file mode 100644
> > index 2fa60c333c..0000000000
> > --- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 72819106d0e5666d172d39c24c19e4e7a3b8be0e Mon Sep 17 00:00:00 2001
> > -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -Date: Wed, 1 May 2019 22:15:03 +0100
> > -Subject: [PATCH] Fix error on musl:
> > -
> > -| ../../elfutils-0.176/tests/elfstrmerge.c: In function 'main':
> > -| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: error: 'ALLPERMS'
> undeclared (first use in this function); did you mean 'EPERM'?
> > -|        fdnew =3D open (fnew, O_WRONLY | O_CREAT, st.st_mode & ALLPER=
MS);
> > -|                                                             ^~~~~~~~
> > -|                                                             EPERM
> > -| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: note: each
> undeclared identifier is reported only once for each function it appears =
in
> > -
> > -Upstream-Status: Inappropriate [workaround in musl]
> > -
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > ----
> > - tests/elfstrmerge.c | 5 +++++
> > - 1 file changed, 5 insertions(+)
> > -
> > -diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c
> > -index 197c6a5..3683672 100644
> > ---- a/tests/elfstrmerge.c
> > -+++ b/tests/elfstrmerge.c
> > -@@ -33,6 +33,11 @@
> > - #include ELFUTILS_HEADER(dwelf)
> > - #include "elf-knowledge.h"
> > -
> > -+/* for musl */
> > -+#ifndef ALLPERMS
> > -+# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/*
> 07777 */
> > -+#endif
> > -+
> > - /* The original ELF file.  */
> > - static int fd =3D -1;
> > - static Elf *elf =3D NULL;
> > diff --git
> a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werro=
r.patch
> b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werro=
r.patch
> > index 5cd6fffc27..c96cfd9777 100644
> > ---
> a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werro=
r.patch
> > +++
> b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werro=
r.patch
> > @@ -1,4 +1,4 @@
> > -From cfced441d4a6f2eca51d29c52240275bd6f54e49 Mon Sep 17 00:00:00 2001
> > +From a2ce41e91d530459eb35d64a19f714ebfe0d4a20 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 22 Jun 2020 21:35:16 +0000
> >  Subject: [PATCH] config/eu.am: do not use -Werror
> > @@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   1 file changed, 2 deletions(-)
> >
> >  diff --git a/config/eu.am b/config/eu.am
> > -index 2c3e457..8fb0411 100644
> > +index 58cd3c4..ac42390 100644
> >  --- a/config/eu.am
> >  +++ b/config/eu.am
> > -@@ -89,7 +89,6 @@ AM_CFLAGS =3D -std=3Dgnu99 -Wall -Wshadow -Wformat=
=3D2 \
> > +@@ -91,7 +91,6 @@ AM_CFLAGS =3D -std=3Dgnu99 -Wall -Wshadow -Wformat=
=3D2 \
> >             -Wold-style-definition -Wstrict-prototypes
> $(TRAMPOLINES_WARNING) \
> >             $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
> >             $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING)=
 \
> > @@ -27,7 +27,7 @@ index 2c3e457..8fb0411 100644
> >             $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
> >             $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
> >             $(if
> $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
> > -@@ -99,7 +98,6 @@ AM_CXXFLAGS =3D -std=3Dc++11 -Wall -Wshadow \
> > +@@ -101,7 +100,6 @@ AM_CXXFLAGS =3D -std=3Dc++11 -Wall -Wshadow \
> >            $(TRAMPOLINES_WARNING) \
> >            $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
> >            $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) =
\
> > diff --git a/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
> b/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
> > deleted file mode 100644
> > index 9509fb4e77..0000000000
> > --- a/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
> > +++ /dev/null
> > @@ -1,138 +0,0 @@
> > -glibc 2.34 calls pthread_kill from the raise function. Before raise
> > -directly called the (tg)kill syscall. So allow pthread_kill to be the
> > -first frame in a backtrace where raise is expected. Also change some
> > -asserts to fprintf plus abort to make it more clear why the testcase
> > -fails.
> > -
> > -https://sourceware.org/bugzilla/show_bug.cgi?id=3D28190
> > -
> > -Signed-off-by: Mark Wielaard <mark@klomp.org>
> > -Upstream-Status: Submitted [
> https://sourceware.org/pipermail/elfutils-devel/2021q3/004019.html]
> > ----
> > - tests/ChangeLog   |  6 +++++
> > - tests/backtrace.c | 62 +++++++++++++++++++++++++++++++++++++++++-----=
-
> > - 2 files changed, 61 insertions(+), 7 deletions(-)
> > -
> > -Index: elfutils-0.185/tests/ChangeLog
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- elfutils-0.185.orig/tests/ChangeLog
> > -+++ elfutils-0.185/tests/ChangeLog
> > -@@ -1,3 +1,9 @@
> > -+2021-08-04  Mark Wielaard  <mark@klomp.org>
> > -+
> > -+      PR28190
> > -+      * backtrace.c (callback_verify): Check for pthread_kill as firs=
t
> > -+      frame. Change asserts to fprintf plus abort.
> > -+
> > - 2021-05-14  Frank Ch. Eigler <fche@redhat.com>
> > -
> > -       PR27859
> > -Index: elfutils-0.185/tests/backtrace.c
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- elfutils-0.185.orig/tests/backtrace.c
> > -+++ elfutils-0.185/tests/backtrace.c
> > -@@ -97,6 +97,9 @@ callback_verify (pid_t tid, unsigned fra
> > -   static bool reduce_frameno =3D false;
> > -   if (reduce_frameno)
> > -     frameno--;
> > -+  static bool pthread_kill_seen =3D false;
> > -+  if (pthread_kill_seen)
> > -+    frameno--;
> > -   if (! use_raise_jmp_patching && frameno >=3D 2)
> > -     frameno +=3D 2;
> > -   const char *symname2 =3D NULL;
> > -@@ -107,11 +110,26 @@ callback_verify (pid_t tid, unsigned fra
> > -              && (strcmp (symname, "__kernel_vsyscall") =3D=3D 0
> > -                  || strcmp (symname, "__libc_do_syscall") =3D=3D 0))
> > -       reduce_frameno =3D true;
> > -+      else if (! pthread_kill_seen && symname
> > -+             && strstr (symname, "pthread_kill") !=3D NULL)
> > -+      pthread_kill_seen =3D true;
> > -       else
> > --      assert (symname && strcmp (symname, "raise") =3D=3D 0);
> > -+      {
> > -+        if (!symname || strcmp (symname, "raise") !=3D 0)
> > -+          {
> > -+            fprintf (stderr,
> > -+                     "case 0: expected symname 'raise' got '%s'\n",
> symname);
> > -+            abort ();
> > -+          }
> > -+      }
> > -       break;
> > -     case 1:
> > --      assert (symname !=3D NULL && strcmp (symname, "sigusr2") =3D=3D=
 0);
> > -+      if (symname =3D=3D NULL || strcmp (symname, "sigusr2") !=3D 0)
> > -+      {
> > -+        fprintf (stderr,
> > -+                 "case 1: expected symname 'sigusr2' got '%s'\n",
> symname);
> > -+        abort ();
> > -+      }
> > -       break;
> > -     case 2: // x86_64 only
> > -       /* __restore_rt - glibc maybe does not have to have this
> symbol.  */
> > -@@ -120,11 +138,21 @@ callback_verify (pid_t tid, unsigned fra
> > -       if (use_raise_jmp_patching)
> > -       {
> > -         /* Verify we trapped on the very first instruction of jmp.  *=
/
> > --        assert (symname !=3D NULL && strcmp (symname, "jmp") =3D=3D 0=
);
> > -+        if (symname =3D=3D NULL || strcmp (symname, "jmp") !=3D 0)
> > -+          {
> > -+            fprintf (stderr,
> > -+                     "case 3: expected symname 'raise' got '%s'\n",
> symname);
> > -+            abort ();
> > -+          }
> > -         mod =3D dwfl_addrmodule (dwfl, pc - 1);
> > -         if (mod)
> > -           symname2 =3D dwfl_module_addrname (mod, pc - 1);
> > --        assert (symname2 =3D=3D NULL || strcmp (symname2, "jmp") !=3D=
 0);
> > -+        if (symname2 =3D=3D NULL || strcmp (symname2, "jmp") !=3D 0)
> > -+          {
> > -+            fprintf (stderr,
> > -+                     "case 3: expected symname2 'jmp' got '%s'\n",
> symname2);
> > -+            abort ();
> > -+          }
> > -         break;
> > -       }
> > -       FALLTHROUGH;
> > -@@ -137,11 +165,22 @@ callback_verify (pid_t tid, unsigned fra
> > -         duplicate_sigusr2 =3D true;
> > -         break;
> > -       }
> > --      assert (symname !=3D NULL && strcmp (symname, "stdarg") =3D=3D =
0);
> > -+      if (symname =3D=3D NULL || strcmp (symname, "stdarg") !=3D 0)
> > -+      {
> > -+        fprintf (stderr,
> > -+                 "case 4: expected symname 'stdarg' got '%s'\n",
> symname);
> > -+        abort ();
> > -+      }
> > -       break;
> > -     case 5:
> > -       /* Verify we trapped on the very last instruction of child.  */
> > --      assert (symname !=3D NULL && strcmp (symname, "backtracegen") =
=3D=3D
> 0);
> > -+      if (symname =3D=3D NULL || strcmp (symname, "backtracegen") !=
=3D 0)
> > -+      {
> > -+        fprintf (stderr,
> > -+                 "case 5: expected symname 'backtracegen' got '%s'\n"=
,
> > -+                 symname);
> > -+        abort ();
> > -+      }
> > -       mod =3D dwfl_addrmodule (dwfl, pc);
> > -       if (mod)
> > -       symname2 =3D dwfl_module_addrname (mod, pc);
> > -@@ -151,7 +190,15 @@ callback_verify (pid_t tid, unsigned fra
> > -       // instructions or even inserts some padding instructions at th=
e
> end
> > -       // (which apparently happens on ppc64).
> > -       if (use_raise_jmp_patching)
> > --        assert (symname2 =3D=3D NULL || strcmp (symname2, "backtraceg=
en")
> !=3D 0);
> > -+      {
> > -+          if (symname2 !=3D NULL && strcmp (symname2, "backtracegen")=
 =3D=3D
> 0)
> > -+          {
> > -+            fprintf (stderr,
> > -+                     "use_raise_jmp_patching didn't expect symname2 "
> > -+                     "'backtracegen'\n");
> > -+            abort ();
> > -+          }
> > -+      }
> > -       break;
> > -   }
> > - }
> > --
> > 2.20.1
> >
>

--0000000000006d63d505d0ff6e5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 17 Nov 2021 at 18:15, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; Rework support for error() on non-gli=
bc targets:<br>
&gt; upstream now provides its own implementation, so we can drop<br>
&gt; the patch that adds ours; said implementation isn&#39;t<br>
&gt; build-tested with tests, so ptest has to be disabled on musl.<br>
<br>
Overall this is an improvement so I am good with this patch.<br>
if upstream implementation does not pass ptests<br>
perhaps worth reporting upstream.<br></blockquote><div><br></div><div>I wou=
ld if upstream would be interested in tests with anything except glibc, but=
 I&#39;m fairly sure they&#39;re not. The tests don&#39;t even build with m=
usl without invasive patching.<br></div><div><br></div><div>Alex<br></div><=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt; This, in turns, allows dropping 0004-Fix-error-on-musl.patch.<br>
&gt;<br>
&gt; License-Update: copyright years<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://elfutils_0.185.bb" rel=3D"noreferrer" tar=
get=3D"_blank">elfutils_0.185.bb</a> =3D&gt; <a href=3D"http://elfutils_0.1=
86.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.186.bb</a>}=C2=A0 |=
=C2=A0 12 +-<br>
&gt;=C2=A0 ...ompilation-on-platforms-without-erro.patch |=C2=A0 54 +++++++=
<br>
&gt;=C2=A0 .../elfutils/files/0002-musl-libs.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 118 ---------------<br>
&gt;=C2=A0 .../elfutils/files/0003-musl-utils.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 .../files/0004-Fix-error-on-musl.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 36 -----<br>
&gt;=C2=A0 .../0015-config-eu.am-do-not-use-Werror.patch |=C2=A0 =C2=A08 +-=
<br>
&gt;=C2=A0 .../elfutils/files/glibc-2.34-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 138 ------------------<br>
&gt;=C2=A0 7 files changed, 65 insertions(+), 307 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/elfutils/{<a href=3D"http://elfutil=
s_0.185.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a> =3D&=
gt; <a href=3D"http://elfutils_0.186.bb" rel=3D"noreferrer" target=3D"_blan=
k">elfutils_0.186.bb</a>} (95%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/elfutils/files/0001-deb=
uginfod-fix-compilation-on-platforms-without-erro.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/elfutils/files/0002-mus=
l-libs.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/elfutils/files/0004-Fix=
-error-on-musl.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/elfutils/files/glibc-2.=
34-fix.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils=
_0.185.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a> b/met=
a/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.186.bb" rel=3D"nor=
eferrer" target=3D"_blank">elfutils_0.186.bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_=
0.185.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a><br>
&gt; rename to meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.=
186.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.186.bb</a><br>
&gt; index f4769e3632..b3588a2196 100644<br>
&gt; --- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.=
bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a><br>
&gt; +++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.186.=
bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.186.bb</a><br>
&gt; @@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;elfutils is a collection of util=
ities and libraries to read, crea<br>
&gt;=C2=A0 SECTION =3D &quot;base&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPLv2 &amp; GPLv2+ &amp; LGPLv3+ &amp; GPLv3+&=
quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463a=
b874e80d47fae504 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://debuginfod/debuginfod-client.c;endline=3D27;md5=3Df8e9d171c401c493e=
c45a0b2992ea2ed \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://debuginfod/debuginfod-client.c;endline=3D27;md5=3Dd2adfd8f5347d4c96=
e3c280393ce66da \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;zlib virtual/libintl&quot;<br>
&gt;=C2=A0 DEPENDS:append:libc-musl =3D &quot; argp-standalone fts musl-obs=
tack &quot;<br>
&gt; @@ -22,20 +22,16 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.or=
g/elfutils/ftp/$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_b=
lank">https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ptest.patch \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-Makef=
ile.am-compile-test_nlist-with-standard-C.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-debuginfod-=
debuginfod-client.c-correct-string-format.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc-2.34-fix.patch =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-debuginfod-fix-c=
ompilation-on-platforms-without-erro.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI:append:libc-musl =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-musl-libs.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-musl-utils.=
patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Fix-error-on-mus=
l.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-config-eu.a=
m-do-not-use-Werror.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;dc8d3e74ab209465e7f568e1b3bb9a5a142f8656=
e2b57d10049a73da2ae6b5a6&quot;<br>
&gt; -<br>
&gt; -# remove at next version upgrade or when output changes<br>
&gt; -PR =3D &quot;r1&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;7f6fb9149b1673d38d9178a0d3e0fb8a1ec4f53a=
9f4c2ff89469609879641177&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools gettext ptest pkgconfig<br>
&gt; +PTEST_ENABLED:libc-musl =3D &quot;0&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--program-prefix=3Deu-&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-=
compilation-on-platforms-without-erro.patch b/meta/recipes-devtools/elfutil=
s/files/0001-debuginfod-fix-compilation-on-platforms-without-erro.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e80d96aaca<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compila=
tion-on-platforms-without-erro.patch<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +From 99617d7ab5b01c322b0f27d4aa0dd91c61793a5e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?=3DC3=3D89rico=3D20Nogueira?=3D &lt;<a href=3D"mail=
to:erico.erc@gmail.com" target=3D"_blank">erico.erc@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 10 Nov 2021 21:17:48 -0300<br>
&gt; +Subject: [PATCH] debuginfod: fix compilation on platforms without &lt=
;error.h&gt;<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +&quot;system.h&quot; only declares the error() function, so it needs =
to be in an<br>
&gt; +&#39;extern &quot;C&quot;&#39; block, otherwise linking fails.<br>
&gt; +<br>
&gt; +Since we are here, use quotes for &quot;system.h&quot; header, since =
it&#39;s a local<br>
&gt; +header, not a system one.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=
=3Delfutils.git;a=3Dcommit;h=3D90b9e91b961b794a4e58ab76d9191a5e7343584e" re=
l=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/?p=3Delfutils=
.git;a=3Dcommit;h=3D90b9e91b961b794a4e58ab76d9191a5e7343584e</a>]<br>
&gt; +Signed-off-by: =C3=89rico Nogueira &lt;<a href=3D"mailto:erico.erc@gm=
ail.com" target=3D"_blank">erico.erc@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; +---<br>
&gt; + debuginfod/ChangeLog=C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>
&gt; + debuginfod/debuginfod.cxx | 2 +-<br>
&gt; + 2 files changed, 5 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/debuginfod/ChangeLog b/debuginfod/ChangeLog<br>
&gt; +index f06d3ee..822bd63 100644<br>
&gt; +--- a/debuginfod/ChangeLog<br>
&gt; ++++ b/debuginfod/ChangeLog<br>
&gt; +@@ -1,3 +1,7 @@<br>
&gt; ++2021-11-10=C2=A0 =C3=89rico N. Rolim=C2=A0 &lt;<a href=3D"mailto:eri=
co.erc@gmail.com" target=3D"_blank">erico.erc@gmail.com</a>&gt;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 * debuginfod.cxx: include &quot;system.h&quot; =
under &#39;extern &quot;C&quot;&#39; block.<br>
&gt; ++<br>
&gt; + 2021-11-05=C2=A0 Frank Ch. Eigler=C2=A0 &lt;<a href=3D"mailto:fche@r=
edhat.com" target=3D"_blank">fche@redhat.com</a>&gt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0PR28430<br>
&gt; +diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx<br=
>
&gt; +index 521cb52..764e7b9 100644<br>
&gt; +--- a/debuginfod/debuginfod.cxx<br>
&gt; ++++ b/debuginfod/debuginfod.cxx<br>
&gt; +@@ -33,11 +33,11 @@<br>
&gt; +<br>
&gt; + extern &quot;C&quot; {<br>
&gt; + #include &quot;printversion.h&quot;<br>
&gt; ++#include &quot;system.h&quot;<br>
&gt; + }<br>
&gt; +<br>
&gt; + #include &quot;debuginfod.h&quot;<br>
&gt; + #include &lt;dwarf.h&gt;<br>
&gt; +-#include &lt;system.h&gt;<br>
&gt; +<br>
&gt; + #include &lt;argp.h&gt;<br>
&gt; + #ifdef __GNUC__<br>
&gt; +--<br>
&gt; +2.20.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch=
 b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c7360da7a7..0000000000<br>
&gt; --- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,118 +0,0 @@<br>
&gt; -From 0f4667f0bb4b000d74ade07e90bd690b7217a19d Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targ=
et=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; -Date: Fri, 23 Aug 2019 10:18:47 +0800<br>
&gt; -Subject: [PATCH] musl-libs<br>
&gt; -<br>
&gt; -Collection of fixes needed to compile libelf and other libraries<br>
&gt; -provided by elfutils for musl targets<br>
&gt; -<br>
&gt; -error is glibc specific API, so this patch will mostly not accepted<b=
r>
&gt; -upstream given that elfutils has been closely tied to glibc<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Upstream-Status: Inappropriate [workaround for musl]<br>
&gt; -<br>
&gt; -Rebase to 0.177<br>
&gt; -Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - lib/error.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 27 +++++++++++++++++++++++++++<br>
&gt; - lib/fixedsizehash.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 -<br>
&gt; - lib/libeu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; - libdwfl/linux-kernel-modules.c |=C2=A0 1 +<br>
&gt; - libelf/elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
&gt; - 5 files changed, 36 insertions(+), 1 deletion(-)<br>
&gt; - create mode 100644 lib/error.h<br>
&gt; -<br>
&gt; -diff --git a/lib/error.h b/lib/error.h<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000..ef06827<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/lib/error.h<br>
&gt; -@@ -0,0 +1,27 @@<br>
&gt; -+#ifndef _ERROR_H_<br>
&gt; -+#define _ERROR_H_<br>
&gt; -+<br>
&gt; -+#include &lt;stdarg.h&gt;<br>
&gt; -+#include &lt;stdio.h&gt;<br>
&gt; -+#include &lt;stdlib.h&gt;<br>
&gt; -+#include &lt;string.h&gt;<br>
&gt; -+#include &lt;errno.h&gt;<br>
&gt; -+<br>
&gt; -+static unsigned int error_message_count =3D 0;<br>
&gt; -+<br>
&gt; -+static inline void error(int status, int errnum, const char* format,=
 ...)<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 va_list ap;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;%s: &quot;, program_invoc=
ation_name);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 va_start(ap, format);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 vfprintf(stderr, format, ap);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (errnum)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;: %s&quot;, strerror(errnum));<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;\n&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 error_message_count++;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (status)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(status);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+#endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* _ERROR_H_ */<br>
&gt; -diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h<br>
&gt; -index dac2a5f..43016fc 100644<br>
&gt; ---- a/lib/fixedsizehash.h<br>
&gt; -+++ b/lib/fixedsizehash.h<br>
&gt; -@@ -30,7 +30,6 @@<br>
&gt; - #include &lt;errno.h&gt;<br>
&gt; - #include &lt;stdlib.h&gt;<br>
&gt; - #include &lt;string.h&gt;<br>
&gt; --#include &lt;sys/cdefs.h&gt;<br>
&gt; -<br>
&gt; - #include &lt;system.h&gt;<br>
&gt; -<br>
&gt; -diff --git a/lib/libeu.h b/lib/libeu.h<br>
&gt; -index ecb4d01..edc85e3 100644<br>
&gt; ---- a/lib/libeu.h<br>
&gt; -+++ b/lib/libeu.h<br>
&gt; -@@ -29,6 +29,7 @@<br>
&gt; - #ifndef LIBEU_H<br>
&gt; - #define LIBEU_H<br>
&gt; -<br>
&gt; -+#include &quot;system.h&quot;<br>
&gt; - #include &lt;stddef.h&gt;<br>
&gt; - #include &lt;stdint.h&gt;<br>
&gt; -<br>
&gt; -diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-mo=
dules.c<br>
&gt; -index c0f8dfa..aa78033 100644<br>
&gt; ---- a/libdwfl/linux-kernel-modules.c<br>
&gt; -+++ b/libdwfl/linux-kernel-modules.c<br>
&gt; -@@ -50,6 +50,7 @@<br>
&gt; - #include &lt;sys/utsname.h&gt;<br>
&gt; - #include &lt;fcntl.h&gt;<br>
&gt; - #include &lt;unistd.h&gt;<br>
&gt; -+#include &quot;system.h&quot;<br>
&gt; -<br>
&gt; - /* If fts.h is included before config.h, its indirect inclusions may=
 not<br>
&gt; -=C2=A0 =C2=A0 give us the right LFS aliases of these functions, so ma=
p them manually.=C2=A0 */<br>
&gt; -diff --git a/libelf/elf.h b/libelf/elf.h<br>
&gt; -index 8e3e618..1353890 100644<br>
&gt; ---- a/libelf/elf.h<br>
&gt; -+++ b/libelf/elf.h<br>
&gt; -@@ -19,6 +19,10 @@<br>
&gt; - #ifndef _ELF_H<br>
&gt; - #define=C2=A0 =C2=A0 =C2=A0 =C2=A0_ELF_H 1<br>
&gt; -<br>
&gt; -+#ifdef __cplusplus<br>
&gt; -+extern &quot;C&quot; {<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; - /* Standard ELF types.=C2=A0 */<br>
&gt; -<br>
&gt; - #include &lt;stdint.h&gt;<br>
&gt; -@@ -4102,4 +4106,7 @@ enum<br>
&gt; - #define R_ARC_TLS_LE_S9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x4a<br>
&gt; - #define R_ARC_TLS_LE_32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x4b<br>
&gt; -<br>
&gt; -+#ifdef __cplusplus<br>
&gt; -+}<br>
&gt; -+#endif<br>
&gt; - #endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* elf.h */<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patc=
h b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch<br>
&gt; index 2e379cdba6..85f8140330 100644<br>
&gt; --- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch<br>
&gt; +++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2f94d488bf3daaa6a8548ee77120fc2506a9bbe3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 934d21dc0b06b95c7c65cb29c5096decd91d4d5f Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 23 Aug 2019 10:19:48 +0800<br>
&gt;=C2=A0 Subject: [PATCH] musl-utils<br>
&gt; @@ -57,7 +57,7 @@ index 2c6d91b..608646e 100644<br>
&gt;=C2=A0 =C2=A0ARGP_PROGRAM_VERSION_HOOK_DEF =3D print_version;<br>
&gt;<br>
&gt;=C2=A0 diff --git a/src/strip.c b/src/strip.c<br>
&gt; -index 70fc8c0..d035d9e 100644<br>
&gt; +index d5b753d..d6e1b64 100644<br>
&gt;=C2=A0 --- a/src/strip.c<br>
&gt;=C2=A0 +++ b/src/strip.c<br>
&gt;=C2=A0 @@ -46,6 +46,13 @@<br>
&gt; @@ -75,7 +75,7 @@ index 70fc8c0..d035d9e 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* Name and version of program.=C2=A0 */<br>
&gt;=C2=A0 diff --git a/src/unstrip.c b/src/unstrip.c<br>
&gt; -index e488e81..0e44456 100644<br>
&gt; +index aacc9aa..5e71290 100644<br>
&gt;=C2=A0 --- a/src/unstrip.c<br>
&gt;=C2=A0 +++ b/src/unstrip.c<br>
&gt;=C2=A0 @@ -52,6 +52,15 @@<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-mu=
sl.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patc=
h<br>
&gt; deleted file mode 100644<br>
&gt; index 2fa60c333c..0000000000<br>
&gt; --- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patc=
h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,36 +0,0 @@<br>
&gt; -From 72819106d0e5666d172d39c24c19e4e7a3b8be0e Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; -Date: Wed, 1 May 2019 22:15:03 +0100<br>
&gt; -Subject: [PATCH] Fix error on musl:<br>
&gt; -<br>
&gt; -| ../../elfutils-0.176/tests/elfstrmerge.c: In function &#39;main&#39=
;:<br>
&gt; -| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: error: &#39;ALLPER=
MS&#39; undeclared (first use in this function); did you mean &#39;EPERM&#3=
9;?<br>
&gt; -|=C2=A0 =C2=A0 =C2=A0 =C2=A0 fdnew =3D open (fnew, O_WRONLY | O_CREAT=
, st.st_mode &amp; ALLPERMS);<br>
&gt; -|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~<br>
&gt; -|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0EPERM<br>
&gt; -| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: note: each undecla=
red identifier is reported only once for each function it appears in<br>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [workaround in musl]<br>
&gt; -<br>
&gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - tests/elfstrmerge.c | 5 +++++<br>
&gt; - 1 file changed, 5 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c<br>
&gt; -index 197c6a5..3683672 100644<br>
&gt; ---- a/tests/elfstrmerge.c<br>
&gt; -+++ b/tests/elfstrmerge.c<br>
&gt; -@@ -33,6 +33,11 @@<br>
&gt; - #include ELFUTILS_HEADER(dwelf)<br>
&gt; - #include &quot;elf-knowledge.h&quot;<br>
&gt; -<br>
&gt; -+/* for musl */<br>
&gt; -+#ifndef ALLPERMS<br>
&gt; -+# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/=
* 07777 */<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; - /* The original ELF file.=C2=A0 */<br>
&gt; - static int fd =3D -1;<br>
&gt; - static Elf *elf =3D NULL;<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do=
-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu=
.am-do-not-use-Werror.patch<br>
&gt; index 5cd6fffc27..c96cfd9777 100644<br>
&gt; --- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-us=
e-Werror.patch<br>
&gt; +++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-us=
e-Werror.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From cfced441d4a6f2eca51d29c52240275bd6f54e49 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From a2ce41e91d530459eb35d64a19f714ebfe0d4a20 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 22 Jun 2020 21:35:16 +0000<br>
&gt;=C2=A0 Subject: [PATCH] config/<a href=3D"http://eu.am" rel=3D"noreferr=
er" target=3D"_blank">eu.am</a>: do not use -Werror<br>
&gt; @@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A01 file changed, 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/config/<a href=3D"http://eu.am" rel=3D"noreferrer" =
target=3D"_blank">eu.am</a> b/config/<a href=3D"http://eu.am" rel=3D"norefe=
rrer" target=3D"_blank">eu.am</a><br>
&gt; -index 2c3e457..8fb0411 100644<br>
&gt; +index 58cd3c4..ac42390 100644<br>
&gt;=C2=A0 --- a/config/<a href=3D"http://eu.am" rel=3D"noreferrer" target=
=3D"_blank">eu.am</a><br>
&gt;=C2=A0 +++ b/config/<a href=3D"http://eu.am" rel=3D"noreferrer" target=
=3D"_blank">eu.am</a><br>
&gt; -@@ -89,7 +89,6 @@ AM_CFLAGS =3D -std=3Dgnu99 -Wall -Wshadow -Wformat=
=3D2 \<br>
&gt; +@@ -91,7 +91,6 @@ AM_CFLAGS =3D -std=3Dgnu99 -Wall -Wshadow -Wformat=
=3D2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wold-style-definition =
-Wstrict-prototypes $(TRAMPOLINES_WARNING) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(LOGICAL_OP_WARNING) $=
(DUPLICATED_COND_WARNING) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL_DEREFERENCE_WARN=
ING) $(IMPLICIT_FALLTHROUGH_WARNING) \<br>
&gt; @@ -27,7 +27,7 @@ index 2c3e457..8fb0411 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $($(*F)_no_Wunused=
),,-Wunused -Wextra) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $($(*F)_no_Wstack_=
usage),,$(STACK_USAGE_WARNING)) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $($(*F)_no_Wpacked=
_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \<br>
&gt; -@@ -99,7 +98,6 @@ AM_CXXFLAGS =3D -std=3Dc++11 -Wall -Wshadow \<br>
&gt; +@@ -101,7 +100,6 @@ AM_CXXFLAGS =3D -std=3Dc++11 -Wall -Wshadow \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TRAMPOLINES_WARNING) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LOGICAL_OP_WARNING) $(DUPLI=
CATED_COND_WARNING) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(NULL_DEREFERENCE_WARNING) $=
(IMPLICIT_FALLTHROUGH_WARNING) \<br>
&gt; diff --git a/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch=
 b/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9509fb4e77..0000000000<br>
&gt; --- a/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,138 +0,0 @@<br>
&gt; -glibc 2.34 calls pthread_kill from the raise function. Before raise<b=
r>
&gt; -directly called the (tg)kill syscall. So allow pthread_kill to be the=
<br>
&gt; -first frame in a backtrace where raise is expected. Also change some<=
br>
&gt; -asserts to fprintf plus abort to make it more clear why the testcase<=
br>
&gt; -fails.<br>
&gt; -<br>
&gt; -<a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D28190" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bu=
g.cgi?id=3D28190</a><br>
&gt; -<br>
&gt; -Signed-off-by: Mark Wielaard &lt;<a href=3D"mailto:mark@klomp.org" ta=
rget=3D"_blank">mark@klomp.org</a>&gt;<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://sourceware.org/piperma=
il/elfutils-devel/2021q3/004019.html" rel=3D"noreferrer" target=3D"_blank">=
https://sourceware.org/pipermail/elfutils-devel/2021q3/004019.html</a>]<br>
&gt; ----<br>
&gt; - tests/ChangeLog=C2=A0 =C2=A0|=C2=A0 6 +++++<br>
&gt; - tests/backtrace.c | 62 +++++++++++++++++++++++++++++++++++++++++----=
--<br>
&gt; - 2 files changed, 61 insertions(+), 7 deletions(-)<br>
&gt; -<br>
&gt; -Index: elfutils-0.185/tests/ChangeLog<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- elfutils-0.185.orig/tests/ChangeLog<br>
&gt; -+++ elfutils-0.185/tests/ChangeLog<br>
&gt; -@@ -1,3 +1,9 @@<br>
&gt; -+2021-08-04=C2=A0 Mark Wielaard=C2=A0 &lt;<a href=3D"mailto:mark@klom=
p.org" target=3D"_blank">mark@klomp.org</a>&gt;<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 PR28190<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 * backtrace.c (callback_verify): Check for pthr=
ead_kill as first<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 frame. Change asserts to fprintf plus abort.<br=
>
&gt; -+<br>
&gt; - 2021-05-14=C2=A0 Frank Ch. Eigler &lt;<a href=3D"mailto:fche@redhat.=
com" target=3D"_blank">fche@redhat.com</a>&gt;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0PR27859<br>
&gt; -Index: elfutils-0.185/tests/backtrace.c<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- elfutils-0.185.orig/tests/backtrace.c<br>
&gt; -+++ elfutils-0.185/tests/backtrace.c<br>
&gt; -@@ -97,6 +97,9 @@ callback_verify (pid_t tid, unsigned fra<br>
&gt; -=C2=A0 =C2=A0static bool reduce_frameno =3D false;<br>
&gt; -=C2=A0 =C2=A0if (reduce_frameno)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0frameno--;<br>
&gt; -+=C2=A0 static bool pthread_kill_seen =3D false;<br>
&gt; -+=C2=A0 if (pthread_kill_seen)<br>
&gt; -+=C2=A0 =C2=A0 frameno--;<br>
&gt; -=C2=A0 =C2=A0if (! use_raise_jmp_patching &amp;&amp; frameno &gt;=3D =
2)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0frameno +=3D 2;<br>
&gt; -=C2=A0 =C2=A0const char *symname2 =3D NULL;<br>
&gt; -@@ -107,11 +110,26 @@ callback_verify (pid_t tid, unsigned fra<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (strcmp (=
symname, &quot;__kernel_vsyscall&quot;) =3D=3D 0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || str=
cmp (symname, &quot;__libc_do_syscall&quot;) =3D=3D 0))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0reduce_frameno =3D true;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 else if (! pthread_kill_seen &amp;&amp; symname=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; strstr (s=
ymname, &quot;pthread_kill&quot;) !=3D NULL)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 pthread_kill_seen =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 assert (symname &amp;&amp; strcmp (symname, &qu=
ot;raise&quot;) =3D=3D 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!symname || strcmp (symname, &quot;r=
aise&quot;) !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;case 0: expected symname &#39;raise&#39; got &#39;%s&#39;\n=
&quot;, symname);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case 1:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 assert (symname !=3D NULL &amp;&amp; strcmp (sy=
mname, &quot;sigusr2&quot;) =3D=3D 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (symname =3D=3D NULL || strcmp (symname, &qu=
ot;sigusr2&quot;) !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
case 1: expected symname &#39;sigusr2&#39; got &#39;%s&#39;\n&quot;, symnam=
e);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case 2: // x86_64 only<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* __restore_rt - glibc maybe does not hav=
e to have this symbol.=C2=A0 */<br>
&gt; -@@ -120,11 +138,21 @@ callback_verify (pid_t tid, unsigned fra<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (use_raise_jmp_patching)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Verify we trapped on the very fi=
rst instruction of jmp.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (symname !=3D NULL &amp;&amp; str=
cmp (symname, &quot;jmp&quot;) =3D=3D 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symname =3D=3D NULL || strcmp (symna=
me, &quot;jmp&quot;) !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;case 3: expected symname &#39;raise&#39; got &#39;%s&#39;\n=
&quot;, symname);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mod =3D dwfl_addrmodule (dwfl, pc -=
 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mod)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symname2 =3D dwfl_module_add=
rname (mod, pc - 1);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (symname2 =3D=3D NULL || strcmp (=
symname2, &quot;jmp&quot;) !=3D 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symname2 =3D=3D NULL || strcmp (symn=
ame2, &quot;jmp&quot;) !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;case 3: expected symname2 &#39;jmp&#39; got &#39;%s&#39;\n&=
quot;, symname2);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0FALLTHROUGH;<br>
&gt; -@@ -137,11 +165,22 @@ callback_verify (pid_t tid, unsigned fra<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0duplicate_sigusr2 =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 assert (symname !=3D NULL &amp;&amp; strcmp (sy=
mname, &quot;stdarg&quot;) =3D=3D 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (symname =3D=3D NULL || strcmp (symname, &qu=
ot;stdarg&quot;) !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
case 4: expected symname &#39;stdarg&#39; got &#39;%s&#39;\n&quot;, symname=
);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case 5:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Verify we trapped on the very last inst=
ruction of child.=C2=A0 */<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 assert (symname !=3D NULL &amp;&amp; strcmp (sy=
mname, &quot;backtracegen&quot;) =3D=3D 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (symname =3D=3D NULL || strcmp (symname, &qu=
ot;backtracegen&quot;) !=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
case 5: expected symname &#39;backtracegen&#39; got &#39;%s&#39;\n&quot;,<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symnam=
e);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0mod =3D dwfl_addrmodule (dwfl, pc);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mod)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0symname2 =3D dwfl_module_addrname (mod, pc=
);<br>
&gt; -@@ -151,7 +190,15 @@ callback_verify (pid_t tid, unsigned fra<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0// instructions or even inserts some paddi=
ng instructions at the end<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0// (which apparently happens on ppc64).<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (use_raise_jmp_patching)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert (symname2 =3D=3D NULL || strcmp (=
symname2, &quot;backtracegen&quot;) !=3D 0);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symname2 !=3D NULL &amp;&amp;=
 strcmp (symname2, &quot;backtracegen&quot;) =3D=3D 0)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (stderr,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;use_raise_jmp_patching didn&#39;t expect symname2 &quot;<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&#39;backtracegen&#39;\n&quot;);<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort ();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; - }<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
</blockquote></div></div>

--0000000000006d63d505d0ff6e5c--

