Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 18CA07820C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 13:35:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y5so10881332wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BftIc3URkHB0bjff9nDkOFsaL/Th4M99UiyL2pfhbk8=;
	b=NzP7m/XWLi1Xrct7iqx4B9RgS5+HmqTIIVBN5UoEsvxAutadrfNAIVaqSUFJPnZThW
	NbaHHNHWiXTt2x3b0SDwjPgKLbU+aqXbM0PqYXqthUg3EcEbSp/GNL9h/8MJM6Jhq6SL
	UboToQoQ/2FHEvE9FCEDBG9LXVAP3SH3+f+nF8xbccC5vEADkkpPUQlPMhks6W1ccqsX
	JQZgwes11lMOvL/VvuLYP2JISzPKODg167dhpHdk5gfEbhLm8y+0HTbZpXWtFAi00BFy
	ZpT/Z5Cxz7ki2N5Mt+GRxkO5DfgyN5P79mBL4idwOeUTBlB3zFZ/a9xjg9OBPosiTZ7F
	R+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BftIc3URkHB0bjff9nDkOFsaL/Th4M99UiyL2pfhbk8=;
	b=nwL4EpEqstccLwvTVDtiIeH6nW6QoLkkSOU4AFR6Lfzo9A8hhQ2ZHYjnIEoXpbA2AN
	L1YKGcvD9+JUvuk0b4tK64FcV7VVEgmncCqibp0cgN0d9RvZKvz/8Adv7VuSovWfTDa3
	if3N978Bp/eFer2LDhvCr1FSRYYNo0qcO46C570OCce+jaMYnQlRlrB06ICdQWdVFNjz
	0oYeSF4E1umJQuQGCBFvx0qbNmwA9fHJnq3LQHv9qfvL7qJqmjptWEDQs9vyIo7mZeYY
	ELhLFjq/hmGP22M8grJMRNsCoHM87N8/0WkrfX1CUnwlXroI4WmenvSrpPBDooRUjVEn
	k2dg==
X-Gm-Message-State: AIVw112Z9MT6AlbwQtYWDW357PSNtu9m5AHyc4m5+D4RvuBA2x9MSpV4
	pmMwMqg0B6pZoG60cNwAdqHjdqNOfw==
X-Received: by 10.80.144.5 with SMTP id b5mr6889654eda.24.1500039352129; Fri,
	14 Jul 2017 06:35:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Fri, 14 Jul 2017 06:35:21 -0700 (PDT)
In-Reply-To: <1500008435-6588-1-git-send-email-changhyeok.bae@gmail.com>
References: <1500008435-6588-1-git-send-email-changhyeok.bae@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jul 2017 06:35:21 -0700
Message-ID: <CAMKF1soBnvJf=aB3TN28_Mrh1+jeBF9BO0+xUfv2UAjgeuXVpQ@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: namhyung@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uftrace: Add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 13:36:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 13, 2017 at 10:00 PM, Changhyeok Bae
<changhyeok.bae@gmail.com> wrote:
> - Add recipe for uftrace v0.7.
> - Support x86_64, arm (v6 or later), and aarch64.
> - Disable for armv4 and armv5 in arm architecture which is only
>   supported armv6 or later.
> - Attached 2 patches is merged to upstream.
>

perhaps meta-oe is better place fot now. Will it support mips/ppc in future

> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../0001-Makefile-Add-LDFLAGS-in-export.patch      | 31 +++++++++++++++++++
>  ...tils-Add-limits-header-to-fix-build-error.patch | 31 +++++++++++++++++++
>  meta/recipes-devtools/uftrace/uftrace_0.7.bb       | 35 ++++++++++++++++++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
>  create mode 100644 meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
>  create mode 100644 meta/recipes-devtools/uftrace/uftrace_0.7.bb
>
> diff --git a/meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch b/meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
> new file mode 100644
> index 0000000..f665051
> --- /dev/null
> +++ b/meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
> @@ -0,0 +1,31 @@
> +From ec794945475d5792f2ae85afe461e64266613640 Mon Sep 17 00:00:00 2001
> +From: Changhyeok Bae <changhyeok.bae@gmail.com>
> +Date: Thu, 13 Jul 2017 16:44:52 +0900
> +Subject: [PATCH 1/2] Makefile: Add LDFLAGS in export
> +
> +To use build with musl, need to argp library.
> +So need to add LDFLAGS from outside.
> +
> +Upstream-Status: Accepted
> +
> +Signed-off-by: <Changhyeok Bae changhyeok.bae@gmail.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 67be2da..0ca649a 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -48,7 +48,7 @@ endif
> + RM = rm -f
> + INSTALL = install
> +
> +-export ARCH CC AR LD RM srcdir objdir
> ++export ARCH CC AR LD RM srcdir objdir LDFLAGS
> +
> + COMMON_CFLAGS := -O2 -g -D_GNU_SOURCE $(CFLAGS) $(CPPFLAGS)
> + COMMON_CFLAGS +=  -iquote $(srcdir) -iquote $(objdir) -iquote $(srcdir)/arch/$(ARCH)
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch b/meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
> new file mode 100644
> index 0000000..2690011
> --- /dev/null
> +++ b/meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
> @@ -0,0 +1,31 @@
> +From 3bda554766150705160fe2191d8761c7881e2433 Mon Sep 17 00:00:00 2001
> +From: Changhyeok Bae <changhyeok.bae@gmail.com>
> +Date: Thu, 13 Jul 2017 16:46:20 +0900
> +Subject: [PATCH 2/2] utils: Add limits header to fix build error
> +
> +[Error]
> +error: 'PATH_MAX' undeclared (first use in this function); did you mean
> +'INT8_MAX'?
> +
> +Upstream-Status: Accepted
> +
> +Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> +---
> + utils/utils.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/utils/utils.c b/utils/utils.c
> +index 03522c9..30f9e81 100644
> +--- a/utils/utils.c
> ++++ b/utils/utils.c
> +@@ -6,6 +6,7 @@
> + #include <errno.h>
> + #include <sys/uio.h>
> + #include <sys/stat.h>
> ++#include <limits.h>
> +
> + #include "utils/utils.h"
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/uftrace/uftrace_0.7.bb b/meta/recipes-devtools/uftrace/uftrace_0.7.bb
> new file mode 100644
> index 0000000..821d0bb
> --- /dev/null
> +++ b/meta/recipes-devtools/uftrace/uftrace_0.7.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "Trace and analyze execution of a program written in C/C++"
> +HOMEPAGE = "https://github.com/namhyung/uftrace"
> +BUGTRACKER = "https://github.com/namhyung/uftrace/issues"
> +SECTION = "devel"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "elfutils"
> +DEPENDS_append_libc-musl = " argp-standalone"
> +
> +inherit autotools
> +
> +SRCREV = "712ad01fdde57893936d7e254451eec67ab41ca6"
> +SRC_URI = "\
> +    git://github.com/namhyung/${BPN} \
> +    file://0001-Makefile-Add-LDFLAGS-in-export.patch \
> +    file://0002-utils-Add-limits-header-to-fix-build-error.patch \
> +"
> +S = "${WORKDIR}/git"
> +
> +LDFLAGS_append_libc-musl = " -largp"
> +EXTRA_OECONF = "ARCH=${TARGET_ARCH}"
> +
> +do_configure() {
> +    ${S}/configure ${EXTRA_OECONF}
> +}
> +
> +FILES_SOLIBSDEV = ""
> +FILES_${PN} += "${libdir}/*.so"
> +
> +COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
> +
> +# uftrace supports armv6 and above
> +COMPATIBLE_HOST_armv4 = 'null'
> +COMPATIBLE_HOST_armv5 = 'null'
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

