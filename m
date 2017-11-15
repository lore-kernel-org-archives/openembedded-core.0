Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 366E17851E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:36:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j16so11486125pgn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=83n3ZyAZEMEkJAZnYfnImoyaLTVThTWQSHF1RpufuxA=;
	b=Pbn22mKmrPHTVnX+qg80IvCWwnhi6Ryz9DnKWSZiweH1zzlM/fSeKNalfFzD0qpqV+
	3uxQiSedPnBBJ7V0tJO9PugIysKMF0Z0hO+njz0cauXGjODpn/Wc2VR+nOQrs7EcKlnP
	XeZyUIQzh3KDBVzBnBOPjzmOQjOcMbAtPRVIpU24pPLf3DVmXzTwUbYYyNXDo72qLb8J
	4x50qhxUslI0LnAYMQmL9wAYJhdEO++0FzeIQf7RrxHBxW1z/t3KWnXoBXkCHPQ1I/2w
	fwsP4KpXRIfeZ0j7CSmPRD0atxo7k6/0CYTLtuSRls9sSWgpeNmHNPAS2Bz7twLnAOcX
	hdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=83n3ZyAZEMEkJAZnYfnImoyaLTVThTWQSHF1RpufuxA=;
	b=sN30dHUdYahDstmnxAWvxgp8CO5rNxHhvK8aVXUfYYTAiA1/49eW10edszhu6VYH1M
	P+4DpERFvRbXm2JijSNadR5uCwJ2LKq6mvnqp+trw5BaV3bzCI6kF4n3vlTa8DPLKqTz
	73WCtQS9pOuDnAo02sUPlcGEbiYjg5ou0DXaWko8Q9lVYmPYxpVU3h4ezg7IjrABbck+
	rMN3xq6tnUOMMUgjeid9mhh8s08i5hmL8HAq/JsBI+bzVkbFie/3f/7m4Yt53BiaCVh6
	s3uVIJcUr0Czgg2ksPt+FGDyrbCwZviRLO0Foalp0hdoqzq74m9nqIuEwa246+JWdjgb
	7DOQ==
X-Gm-Message-State: AJaThX4EMqGqN9QTT3Czskm4P9Pvuh3pcx0jvnwOhopioEZ39ytegdBT
	l4rkjKtWfShWBx2+l2kog6vx/jjOjaWMY7+dufE=
X-Google-Smtp-Source: AGs4zMaZaAgcHhcy2jyrZkUx/OBGQ9S8V1dl39MPPzOuhm4+gHUODv1qmRomj3/mbmazCBlrgKDcRIU1YOkb9oRhKRg=
X-Received: by 10.84.252.4 with SMTP id x4mr8428140pll.99.1510716985422; Tue,
	14 Nov 2017 19:36:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Tue, 14 Nov 2017 19:35:54 -0800 (PST)
In-Reply-To: <20171113125714.21427-1-ricardo.ribalda@gmail.com>
References: <20171113125714.21427-1-ricardo.ribalda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2017 19:35:54 -0800
Message-ID: <CAMKF1so_ciNyeNbo9GuxcT6qCw7XgykYGEY5LQ23ikqCJiMx4A@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Wed, 15 Nov 2017 03:36:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 13, 2017 at 4:57 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Without this patch libbacktrace cannot be included/link during
> libgfortran build.
>
> libbtool: link: cannot find the library
> `../libbacktrace/libbacktrace.la'
> or unhandled argument `../libbacktrace/libbacktrace.la
>

This patch is ok.
while here, can you please backport this patch to gcc6 as well ?


> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>  .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
> index 1d40cba73175..ae3ed02d6ce3 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> @@ -75,6 +75,7 @@ SRC_URI = "\
>             file://0048-gcc-Enable-static-PIE.patch \
>             file://fix-segmentation-fault-precompiled-hdr.patch \
>             file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
> +          file://0051-Fix-gfortran-build.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
> new file mode 100644
> index 000000000000..a71b6b0bee0e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
> @@ -0,0 +1,53 @@
> +Without this patch libbacktrace cannot be included/link during
> +libgfortran build.
> +
> +libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
> +or unhandled argument `../libbacktrace/libbacktrace.la'
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +
> +diff --git a/libgfortran/Makefile.am b/libgfortran/Makefile.am
> +index 2857af5943f9..e07760069a3c 100644
> +--- a/libgfortran/Makefile.am
> ++++ b/libgfortran/Makefile.am
> +@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
> + toolexeclib_DATA = libgfortran.spec
> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
> +       $(HWCAP_LDFLAGS) \
> +       -lm $(extra_ldflags_libgfortran) \
> +       $(version_arg) -Wc,-shared-libgcc
> +@@ -64,7 +64,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
> +             -I$(MULTIBUILDTOP)../libgcc \
> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> +             -I$(MULTIBUILDTOP)../libbacktrace \
> +-            -I../libbacktrace
> ++            -I../../libbacktrace
> +
> + # Fortran rules for complex multiplication and division
> + AM_CFLAGS += -fcx-fortran-rules
> +diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
> +index 05b183dcadb0..c9e0280e412c 100644
> +--- a/libgfortran/Makefile.in
> ++++ b/libgfortran/Makefile.in
> +@@ -581,7 +581,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
> + toolexeclib_DATA = libgfortran.spec
> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
> +       $(HWCAP_LDFLAGS) \
> +       -lm $(extra_ldflags_libgfortran) \
> +       $(version_arg) -Wc,-shared-libgcc
> +@@ -602,7 +602,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
> +             -I$(MULTIBUILDTOP)../libgcc \
> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> +             -I$(MULTIBUILDTOP)../libbacktrace \
> +-            -I../libbacktrace
> ++            -I../../libbacktrace
> +
> + gfor_io_src = io/size_from_kind.c $(am__append_2)
> + gfor_io_headers = \
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

