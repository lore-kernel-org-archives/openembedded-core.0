Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473DFC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:15:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.10105.1637169344047048703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eh8McmPD;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id l8so3321631qtk.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E8OPa9d1xcy7lgAn26Lab7qwpXFqAX3LwHZGqz7eezc=;
        b=Eh8McmPDatRo4/tL6o1lQf9MMdqVEMZLEPCeXb5ufaxgtdfrrgkCVGoGwQgPt+KxB6
         4toGJbS1cLA4sCZ6TIwarqOcOQdkFq6L/IRzCVEm0bIONqtpqg1a6bRaev09Snltc7NY
         6AW6/w7f2NZvDXTxHuRogc+f3Q4aiUyUCqA2d8TrKC0YJWNm0i8JvsOpk2cX/CtR+wI4
         NYEJ3Ho7bWkOCAhhdRNFTVMj12Fhxw7u0wo9jsPvhxiNZd2JAaESb0/Zr9c/WFS2CI/q
         ryyb6A92FcNfv5gf7I33jvFSJCj0y1vyB5UrPoer56AOGoolO3xQ026paeuQKhCurpTO
         ScKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E8OPa9d1xcy7lgAn26Lab7qwpXFqAX3LwHZGqz7eezc=;
        b=AIhTlg1bCghWWVBRX6MrNpEUNMu2nxhQ264TWxc8N+FPcAoht6PJvp9h1slQSXCyZU
         H2KnK2ocS7iKKTIpmIB1qGXymRk00kusLsQ/nFUB23HTv596uJbLPqPEdTQOIigAxMTT
         aPwou+Z5eZotmVcX/HT3CB2VCfIQpSEyd64D4F0wSms7AdtmmujM4tZaaMtzGbQCAyZo
         5VAYfGDcR8vzRgz32rfZRar1Wn+mWtrq/FIAsVFIV+ZTK8jyKnqrL4F+Cmcxd3/VkLRU
         zlpCX79yFKHTwlLqLwJ3jqirZZbKtdt4VakwcDks7jDxvQqUrEGIKoWSn6SRWGfRebox
         PtfA==
X-Gm-Message-State: AOAM5336s48nNoXBe+5u0SlDO9x4VDS7Zs5hq2W5GXAlWNLCAq3jVy0j
	wBuczkdxL8LchZLv4eT0P+tX9j/kV+dQciONZQU=
X-Google-Smtp-Source: 
 ABdhPJzJ1BhuBGg8IYuG/djuVMgnAO2x3Z/tbsW+j4OU9YNUKqUD7L23TVKwtOWHOe44+NZiIPHfVT1fps+/XCEzSOg=
X-Received: by 2002:ac8:4e41:: with SMTP id e1mr18332174qtw.116.1637169342701;
 Wed, 17 Nov 2021 09:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-22-alex@linutronix.de>
In-Reply-To: <20211117153525.257146-22-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2021 09:15:16 -0800
Message-ID: 
 <CAMKF1sq-59kYn0WpPKzNB331BLSrDKweCk2+S3AhSsZ2Eb1WVQ@mail.gmail.com>
Subject: Re: [PATCH 22/36] elfutils: update 0.185 -> 0.186
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Hongxu Jia <hongxu.jia@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:15:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158436

On Wed, Nov 17, 2021 at 7:35 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop glibc-2.34-fix.patch merged upstream.
>
> Rework support for error() on non-glibc targets:
> upstream now provides its own implementation, so we can drop
> the patch that adds ours; said implementation isn't
> build-tested with tests, so ptest has to be disabled on musl.

Overall this is an improvement so I am good with this patch.
if upstream implementation does not pass ptests
perhaps worth reporting upstream.

> This, in turns, allows dropping 0004-Fix-error-on-musl.patch.
>
> License-Update: copyright years
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../{elfutils_0.185.bb =3D> elfutils_0.186.bb}  |  12 +-
>  ...ompilation-on-platforms-without-erro.patch |  54 +++++++
>  .../elfutils/files/0002-musl-libs.patch       | 118 ---------------
>  .../elfutils/files/0003-musl-utils.patch      |   6 +-
>  .../files/0004-Fix-error-on-musl.patch        |  36 -----
>  .../0015-config-eu.am-do-not-use-Werror.patch |   8 +-
>  .../elfutils/files/glibc-2.34-fix.patch       | 138 ------------------
>  7 files changed, 65 insertions(+), 307 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.185.bb =3D> elfutils_0=
.186.bb} (95%)
>  create mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-=
fix-compilation-on-platforms-without-erro.patch
>  delete mode 100644 meta/recipes-devtools/elfutils/files/0002-musl-libs.p=
atch
>  delete mode 100644 meta/recipes-devtools/elfutils/files/0004-Fix-error-o=
n-musl.patch
>  delete mode 100644 meta/recipes-devtools/elfutils/files/glibc-2.34-fix.p=
atch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.186.bb
> similarity index 95%
> rename from meta/recipes-devtools/elfutils/elfutils_0.185.bb
> rename to meta/recipes-devtools/elfutils/elfutils_0.186.bb
> index f4769e3632..b3588a2196 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "elfutils is a collection of utilities an=
d libraries to read, crea
>  SECTION =3D "base"
>  LICENSE =3D "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
> -                    file://debuginfod/debuginfod-client.c;endline=3D27;m=
d5=3Df8e9d171c401c493ec45a0b2992ea2ed \
> +                    file://debuginfod/debuginfod-client.c;endline=3D27;m=
d5=3Dd2adfd8f5347d4c96e3c280393ce66da \
>                      "
>  DEPENDS =3D "zlib virtual/libintl"
>  DEPENDS:append:libc-musl =3D " argp-standalone fts musl-obstack "
> @@ -22,20 +22,16 @@ SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV=
}/${BP}.tar.bz2 \
>             file://ptest.patch \
>             file://0001-tests-Makefile.am-compile-test_nlist-with-standar=
d-C.patch \
>             file://0001-debuginfod-debuginfod-client.c-correct-string-for=
mat.patch \
> -           file://glibc-2.34-fix.patch \
> +           file://0001-debuginfod-fix-compilation-on-platforms-without-e=
rro.patch \
>             "
>  SRC_URI:append:libc-musl =3D " \
> -           file://0002-musl-libs.patch \
>             file://0003-musl-utils.patch \
> -           file://0004-Fix-error-on-musl.patch \
>             file://0015-config-eu.am-do-not-use-Werror.patch \
>             "
> -SRC_URI[sha256sum] =3D "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10=
049a73da2ae6b5a6"
> -
> -# remove at next version upgrade or when output changes
> -PR =3D "r1"
> +SRC_URI[sha256sum] =3D "7f6fb9149b1673d38d9178a0d3e0fb8a1ec4f53a9f4c2ff8=
9469609879641177"
>
>  inherit autotools gettext ptest pkgconfig
> +PTEST_ENABLED:libc-musl =3D "0"
>
>  EXTRA_OECONF =3D "--program-prefix=3Deu-"
>
> diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-com=
pilation-on-platforms-without-erro.patch b/meta/recipes-devtools/elfutils/f=
iles/0001-debuginfod-fix-compilation-on-platforms-without-erro.patch
> new file mode 100644
> index 0000000000..e80d96aaca
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilatio=
n-on-platforms-without-erro.patch
> @@ -0,0 +1,54 @@
> +From 99617d7ab5b01c322b0f27d4aa0dd91c61793a5e Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?=3DC3=3D89rico=3D20Nogueira?=3D <erico.erc@gmail.com>
> +Date: Wed, 10 Nov 2021 21:17:48 -0300
> +Subject: [PATCH] debuginfod: fix compilation on platforms without <error=
.h>
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +"system.h" only declares the error() function, so it needs to be in an
> +'extern "C"' block, otherwise linking fails.
> +
> +Since we are here, use quotes for "system.h" header, since it's a local
> +header, not a system one.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Delfutils.git;=
a=3Dcommit;h=3D90b9e91b961b794a4e58ab76d9191a5e7343584e]
> +Signed-off-by: =C3=89rico Nogueira <erico.erc@gmail.com>
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + debuginfod/ChangeLog      | 4 ++++
> + debuginfod/debuginfod.cxx | 2 +-
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/debuginfod/ChangeLog b/debuginfod/ChangeLog
> +index f06d3ee..822bd63 100644
> +--- a/debuginfod/ChangeLog
> ++++ b/debuginfod/ChangeLog
> +@@ -1,3 +1,7 @@
> ++2021-11-10  =C3=89rico N. Rolim  <erico.erc@gmail.com>
> ++
> ++      * debuginfod.cxx: include "system.h" under 'extern "C"' block.
> ++
> + 2021-11-05  Frank Ch. Eigler  <fche@redhat.com>
> +
> +       PR28430
> +diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
> +index 521cb52..764e7b9 100644
> +--- a/debuginfod/debuginfod.cxx
> ++++ b/debuginfod/debuginfod.cxx
> +@@ -33,11 +33,11 @@
> +
> + extern "C" {
> + #include "printversion.h"
> ++#include "system.h"
> + }
> +
> + #include "debuginfod.h"
> + #include <dwarf.h>
> +-#include <system.h>
> +
> + #include <argp.h>
> + #ifdef __GNUC__
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/=
meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> deleted file mode 100644
> index c7360da7a7..0000000000
> --- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
> +++ /dev/null
> @@ -1,118 +0,0 @@
> -From 0f4667f0bb4b000d74ade07e90bd690b7217a19d Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Fri, 23 Aug 2019 10:18:47 +0800
> -Subject: [PATCH] musl-libs
> -
> -Collection of fixes needed to compile libelf and other libraries
> -provided by elfutils for musl targets
> -
> -error is glibc specific API, so this patch will mostly not accepted
> -upstream given that elfutils has been closely tied to glibc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Inappropriate [workaround for musl]
> -
> -Rebase to 0.177
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - lib/error.h                    | 27 +++++++++++++++++++++++++++
> - lib/fixedsizehash.h            |  1 -
> - lib/libeu.h                    |  1 +
> - libdwfl/linux-kernel-modules.c |  1 +
> - libelf/elf.h                   |  7 +++++++
> - 5 files changed, 36 insertions(+), 1 deletion(-)
> - create mode 100644 lib/error.h
> -
> -diff --git a/lib/error.h b/lib/error.h
> -new file mode 100644
> -index 0000000..ef06827
> ---- /dev/null
> -+++ b/lib/error.h
> -@@ -0,0 +1,27 @@
> -+#ifndef _ERROR_H_
> -+#define _ERROR_H_
> -+
> -+#include <stdarg.h>
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <errno.h>
> -+
> -+static unsigned int error_message_count =3D 0;
> -+
> -+static inline void error(int status, int errnum, const char* format, ..=
.)
> -+{
> -+      va_list ap;
> -+      fprintf(stderr, "%s: ", program_invocation_name);
> -+      va_start(ap, format);
> -+      vfprintf(stderr, format, ap);
> -+      va_end(ap);
> -+      if (errnum)
> -+              fprintf(stderr, ": %s", strerror(errnum));
> -+      fprintf(stderr, "\n");
> -+      error_message_count++;
> -+      if (status)
> -+              exit(status);
> -+}
> -+
> -+#endif        /* _ERROR_H_ */
> -diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
> -index dac2a5f..43016fc 100644
> ---- a/lib/fixedsizehash.h
> -+++ b/lib/fixedsizehash.h
> -@@ -30,7 +30,6 @@
> - #include <errno.h>
> - #include <stdlib.h>
> - #include <string.h>
> --#include <sys/cdefs.h>
> -
> - #include <system.h>
> -
> -diff --git a/lib/libeu.h b/lib/libeu.h
> -index ecb4d01..edc85e3 100644
> ---- a/lib/libeu.h
> -+++ b/lib/libeu.h
> -@@ -29,6 +29,7 @@
> - #ifndef LIBEU_H
> - #define LIBEU_H
> -
> -+#include "system.h"
> - #include <stddef.h>
> - #include <stdint.h>
> -
> -diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modul=
es.c
> -index c0f8dfa..aa78033 100644
> ---- a/libdwfl/linux-kernel-modules.c
> -+++ b/libdwfl/linux-kernel-modules.c
> -@@ -50,6 +50,7 @@
> - #include <sys/utsname.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#include "system.h"
> -
> - /* If fts.h is included before config.h, its indirect inclusions may no=
t
> -    give us the right LFS aliases of these functions, so map them manual=
ly.  */
> -diff --git a/libelf/elf.h b/libelf/elf.h
> -index 8e3e618..1353890 100644
> ---- a/libelf/elf.h
> -+++ b/libelf/elf.h
> -@@ -19,6 +19,10 @@
> - #ifndef _ELF_H
> - #define       _ELF_H 1
> -
> -+#ifdef __cplusplus
> -+extern "C" {
> -+#endif
> -+
> - /* Standard ELF types.  */
> -
> - #include <stdint.h>
> -@@ -4102,4 +4106,7 @@ enum
> - #define R_ARC_TLS_LE_S9               0x4a
> - #define R_ARC_TLS_LE_32               0x4b
> -
> -+#ifdef __cplusplus
> -+}
> -+#endif
> - #endif        /* elf.h */
> diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b=
/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> index 2e379cdba6..85f8140330 100644
> --- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> +++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
> @@ -1,4 +1,4 @@
> -From 2f94d488bf3daaa6a8548ee77120fc2506a9bbe3 Mon Sep 17 00:00:00 2001
> +From 934d21dc0b06b95c7c65cb29c5096decd91d4d5f Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Fri, 23 Aug 2019 10:19:48 +0800
>  Subject: [PATCH] musl-utils
> @@ -57,7 +57,7 @@ index 2c6d91b..608646e 100644
>   ARGP_PROGRAM_VERSION_HOOK_DEF =3D print_version;
>
>  diff --git a/src/strip.c b/src/strip.c
> -index 70fc8c0..d035d9e 100644
> +index d5b753d..d6e1b64 100644
>  --- a/src/strip.c
>  +++ b/src/strip.c
>  @@ -46,6 +46,13 @@
> @@ -75,7 +75,7 @@ index 70fc8c0..d035d9e 100644
>
>   /* Name and version of program.  */
>  diff --git a/src/unstrip.c b/src/unstrip.c
> -index e488e81..0e44456 100644
> +index aacc9aa..5e71290 100644
>  --- a/src/unstrip.c
>  +++ b/src/unstrip.c
>  @@ -52,6 +52,15 @@
> diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.=
patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> deleted file mode 100644
> index 2fa60c333c..0000000000
> --- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 72819106d0e5666d172d39c24c19e4e7a3b8be0e Mon Sep 17 00:00:00 2001
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Date: Wed, 1 May 2019 22:15:03 +0100
> -Subject: [PATCH] Fix error on musl:
> -
> -| ../../elfutils-0.176/tests/elfstrmerge.c: In function 'main':
> -| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: error: 'ALLPERMS' und=
eclared (first use in this function); did you mean 'EPERM'?
> -|        fdnew =3D open (fnew, O_WRONLY | O_CREAT, st.st_mode & ALLPERMS=
);
> -|                                                             ^~~~~~~~
> -|                                                             EPERM
> -| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: note: each undeclared=
 identifier is reported only once for each function it appears in
> -
> -Upstream-Status: Inappropriate [workaround in musl]
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> ----
> - tests/elfstrmerge.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c
> -index 197c6a5..3683672 100644
> ---- a/tests/elfstrmerge.c
> -+++ b/tests/elfstrmerge.c
> -@@ -33,6 +33,11 @@
> - #include ELFUTILS_HEADER(dwelf)
> - #include "elf-knowledge.h"
> -
> -+/* for musl */
> -+#ifndef ALLPERMS
> -+# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/* 0=
7777 */
> -+#endif
> -+
> - /* The original ELF file.  */
> - static int fd =3D -1;
> - static Elf *elf =3D NULL;
> diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-no=
t-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am=
-do-not-use-Werror.patch
> index 5cd6fffc27..c96cfd9777 100644
> --- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-W=
error.patch
> +++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-W=
error.patch
> @@ -1,4 +1,4 @@
> -From cfced441d4a6f2eca51d29c52240275bd6f54e49 Mon Sep 17 00:00:00 2001
> +From a2ce41e91d530459eb35d64a19f714ebfe0d4a20 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 22 Jun 2020 21:35:16 +0000
>  Subject: [PATCH] config/eu.am: do not use -Werror
> @@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   1 file changed, 2 deletions(-)
>
>  diff --git a/config/eu.am b/config/eu.am
> -index 2c3e457..8fb0411 100644
> +index 58cd3c4..ac42390 100644
>  --- a/config/eu.am
>  +++ b/config/eu.am
> -@@ -89,7 +89,6 @@ AM_CFLAGS =3D -std=3Dgnu99 -Wall -Wshadow -Wformat=3D2=
 \
> +@@ -91,7 +91,6 @@ AM_CFLAGS =3D -std=3Dgnu99 -Wall -Wshadow -Wformat=3D2=
 \
>             -Wold-style-definition -Wstrict-prototypes $(TRAMPOLINES_WARN=
ING) \
>             $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
>             $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
> @@ -27,7 +27,7 @@ index 2c3e457..8fb0411 100644
>             $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
>             $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
>             $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_=
WARNING),) \
> -@@ -99,7 +98,6 @@ AM_CXXFLAGS =3D -std=3Dc++11 -Wall -Wshadow \
> +@@ -101,7 +100,6 @@ AM_CXXFLAGS =3D -std=3Dc++11 -Wall -Wshadow \
>            $(TRAMPOLINES_WARNING) \
>            $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
>            $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
> diff --git a/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch b/=
meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
> deleted file mode 100644
> index 9509fb4e77..0000000000
> --- a/meta/recipes-devtools/elfutils/files/glibc-2.34-fix.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -glibc 2.34 calls pthread_kill from the raise function. Before raise
> -directly called the (tg)kill syscall. So allow pthread_kill to be the
> -first frame in a backtrace where raise is expected. Also change some
> -asserts to fprintf plus abort to make it more clear why the testcase
> -fails.
> -
> -https://sourceware.org/bugzilla/show_bug.cgi?id=3D28190
> -
> -Signed-off-by: Mark Wielaard <mark@klomp.org>
> -Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-de=
vel/2021q3/004019.html]
> ----
> - tests/ChangeLog   |  6 +++++
> - tests/backtrace.c | 62 +++++++++++++++++++++++++++++++++++++++++------
> - 2 files changed, 61 insertions(+), 7 deletions(-)
> -
> -Index: elfutils-0.185/tests/ChangeLog
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- elfutils-0.185.orig/tests/ChangeLog
> -+++ elfutils-0.185/tests/ChangeLog
> -@@ -1,3 +1,9 @@
> -+2021-08-04  Mark Wielaard  <mark@klomp.org>
> -+
> -+      PR28190
> -+      * backtrace.c (callback_verify): Check for pthread_kill as first
> -+      frame. Change asserts to fprintf plus abort.
> -+
> - 2021-05-14  Frank Ch. Eigler <fche@redhat.com>
> -
> -       PR27859
> -Index: elfutils-0.185/tests/backtrace.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- elfutils-0.185.orig/tests/backtrace.c
> -+++ elfutils-0.185/tests/backtrace.c
> -@@ -97,6 +97,9 @@ callback_verify (pid_t tid, unsigned fra
> -   static bool reduce_frameno =3D false;
> -   if (reduce_frameno)
> -     frameno--;
> -+  static bool pthread_kill_seen =3D false;
> -+  if (pthread_kill_seen)
> -+    frameno--;
> -   if (! use_raise_jmp_patching && frameno >=3D 2)
> -     frameno +=3D 2;
> -   const char *symname2 =3D NULL;
> -@@ -107,11 +110,26 @@ callback_verify (pid_t tid, unsigned fra
> -              && (strcmp (symname, "__kernel_vsyscall") =3D=3D 0
> -                  || strcmp (symname, "__libc_do_syscall") =3D=3D 0))
> -       reduce_frameno =3D true;
> -+      else if (! pthread_kill_seen && symname
> -+             && strstr (symname, "pthread_kill") !=3D NULL)
> -+      pthread_kill_seen =3D true;
> -       else
> --      assert (symname && strcmp (symname, "raise") =3D=3D 0);
> -+      {
> -+        if (!symname || strcmp (symname, "raise") !=3D 0)
> -+          {
> -+            fprintf (stderr,
> -+                     "case 0: expected symname 'raise' got '%s'\n", sym=
name);
> -+            abort ();
> -+          }
> -+      }
> -       break;
> -     case 1:
> --      assert (symname !=3D NULL && strcmp (symname, "sigusr2") =3D=3D 0=
);
> -+      if (symname =3D=3D NULL || strcmp (symname, "sigusr2") !=3D 0)
> -+      {
> -+        fprintf (stderr,
> -+                 "case 1: expected symname 'sigusr2' got '%s'\n", symna=
me);
> -+        abort ();
> -+      }
> -       break;
> -     case 2: // x86_64 only
> -       /* __restore_rt - glibc maybe does not have to have this symbol. =
 */
> -@@ -120,11 +138,21 @@ callback_verify (pid_t tid, unsigned fra
> -       if (use_raise_jmp_patching)
> -       {
> -         /* Verify we trapped on the very first instruction of jmp.  */
> --        assert (symname !=3D NULL && strcmp (symname, "jmp") =3D=3D 0);
> -+        if (symname =3D=3D NULL || strcmp (symname, "jmp") !=3D 0)
> -+          {
> -+            fprintf (stderr,
> -+                     "case 3: expected symname 'raise' got '%s'\n", sym=
name);
> -+            abort ();
> -+          }
> -         mod =3D dwfl_addrmodule (dwfl, pc - 1);
> -         if (mod)
> -           symname2 =3D dwfl_module_addrname (mod, pc - 1);
> --        assert (symname2 =3D=3D NULL || strcmp (symname2, "jmp") !=3D 0=
);
> -+        if (symname2 =3D=3D NULL || strcmp (symname2, "jmp") !=3D 0)
> -+          {
> -+            fprintf (stderr,
> -+                     "case 3: expected symname2 'jmp' got '%s'\n", symn=
ame2);
> -+            abort ();
> -+          }
> -         break;
> -       }
> -       FALLTHROUGH;
> -@@ -137,11 +165,22 @@ callback_verify (pid_t tid, unsigned fra
> -         duplicate_sigusr2 =3D true;
> -         break;
> -       }
> --      assert (symname !=3D NULL && strcmp (symname, "stdarg") =3D=3D 0)=
;
> -+      if (symname =3D=3D NULL || strcmp (symname, "stdarg") !=3D 0)
> -+      {
> -+        fprintf (stderr,
> -+                 "case 4: expected symname 'stdarg' got '%s'\n", symnam=
e);
> -+        abort ();
> -+      }
> -       break;
> -     case 5:
> -       /* Verify we trapped on the very last instruction of child.  */
> --      assert (symname !=3D NULL && strcmp (symname, "backtracegen") =3D=
=3D 0);
> -+      if (symname =3D=3D NULL || strcmp (symname, "backtracegen") !=3D =
0)
> -+      {
> -+        fprintf (stderr,
> -+                 "case 5: expected symname 'backtracegen' got '%s'\n",
> -+                 symname);
> -+        abort ();
> -+      }
> -       mod =3D dwfl_addrmodule (dwfl, pc);
> -       if (mod)
> -       symname2 =3D dwfl_module_addrname (mod, pc);
> -@@ -151,7 +190,15 @@ callback_verify (pid_t tid, unsigned fra
> -       // instructions or even inserts some padding instructions at the =
end
> -       // (which apparently happens on ppc64).
> -       if (use_raise_jmp_patching)
> --        assert (symname2 =3D=3D NULL || strcmp (symname2, "backtracegen=
") !=3D 0);
> -+      {
> -+          if (symname2 !=3D NULL && strcmp (symname2, "backtracegen") =
=3D=3D 0)
> -+          {
> -+            fprintf (stderr,
> -+                     "use_raise_jmp_patching didn't expect symname2 "
> -+                     "'backtracegen'\n");
> -+            abort ();
> -+          }
> -+      }
> -       break;
> -   }
> - }
> --
> 2.20.1
>

