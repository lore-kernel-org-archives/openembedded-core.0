Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C63A77FEC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 16:04:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j85so21364107wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NcRae5PvanO56VoUiCzxcgobtKvqwwvOW73keUrf/HQ=;
	b=AfYN7d3NRADHZPC+5zKUaRwjadXZTxY5jPiWYpAqQR3n1KEyhgvyYkSXyepPfnUAms
	B+rby+IWzbtdNiHxjasAqc6Ge3km5avG2wTCDnirsRbbpEiuPp7j/LU81+HWzo1cgDVw
	04MxCo9tqnP0HbsAE/FesNBLeAIcHfRtTP7wDswsw5BZjTUFB5qGdF0hs0PC+sJzTbCt
	Lig+i0R00XR/wnncbN0Fb07/wCxn4yiFOHvEyK6EKsO5b+EbbO5IE71OXwQX/TxbTWlq
	87o7UC8wsujehqbE17FGsG6xRCu3Ph95FgVkqz26HR2xvCaDbUtlppsVZHV8DNY+vTI0
	le+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NcRae5PvanO56VoUiCzxcgobtKvqwwvOW73keUrf/HQ=;
	b=bEOlf/tdrMXh2cZRlb7WMO7jYKOLCuV3WMzZIwjp4YUSV4H2mAbcbKOD01C35jIGOG
	8YwITH6Q+Cej5t5fAwo+LNTUo6At9w2KC7sGz2n08e72ZVw+4r8m3hTp4vT8Nclj6VFQ
	ZwTu+SoBLQee386W8yWUu1ilNtA8+76PRLPjyp7DJGPsrFj/h0A3cYdJsTv/tK8wPRSq
	4kuwVkOH4rgyAazTU9Cv0uHeggHxihX1xWwRdxKPW4nidhqOwXH4ErgBG310pvV6Ovyw
	Jx/oNg8TAJTSmTaCEmxDlTdhiMQ1LPWgbveLlOZ5gmNDG4RsxJv0J3xXMzR7fAlOcnbd
	6Bxg==
X-Gm-Message-State: AKS2vOzWyzdiOgANp8stoofpT5DCM7+S04nCxpaQnMlFT3787V038d/f
	ZesRAuTMAQDRZWfmxM9trqAMfpXV4w==
X-Received: by 10.80.137.45 with SMTP id e42mr15275604ede.67.1499097858005;
	Mon, 03 Jul 2017 09:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Mon, 3 Jul 2017 09:03:47 -0700 (PDT)
In-Reply-To: <20170630085114.32050-1-ricardo.ribalda@gmail.com>
References: <20170630085114.32050-1-ricardo.ribalda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jul 2017 09:03:47 -0700
Message-ID: <CAMKF1sqz3J9q_BT7zdKU=oVttQmsrkP+5_k=nZW6h2gGgpYUmg@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Mon, 03 Jul 2017 16:04:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 30, 2017 at 1:51 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Without this patch libbacktrace cannot be included/link during
> libgfortran build.
>
> libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
> or unhandled argument `../libbacktrace/libbacktrace.la'
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
>  .../gcc/gcc-6.3/0099-Fix-gfortran-build.patch      | 44 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
> index 86b3e9ff19a4..36a116d48fb4 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
> @@ -74,6 +74,7 @@ SRC_URI = "\
>             file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
>             file://0048-sync-gcc-stddef.h-with-musl.patch \
>             file://0054_all_nopie-all-flags.patch \
> +           file://0099-Fix-gfortran-build.patch \

call it 0055 for legibility sake.

>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch
> new file mode 100644
> index 000000000000..32b2f9a0567f
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.3/0099-Fix-gfortran-build.patch
> @@ -0,0 +1,44 @@
> +diff --git a/libgfortran/Makefile.am b/libgfortran/Makefile.am
> +index 39d3e11d223c..b5efe6dfe195 100644
> +--- a/libgfortran/Makefile.am
> ++++ b/libgfortran/Makefile.am
> +@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
> + toolexeclib_DATA = libgfortran.spec
> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
> +       -lm $(extra_ldflags_libgfortran) \
> +       $(version_arg) -Wc,-shared-libgcc
> + libgfortran_la_DEPENDENCIES = $(version_dep) libgfortran.spec $(LIBQUADLIB_DEP)
> +@@ -63,7 +63,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
> +             -I$(MULTIBUILDTOP)../libgcc \
> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> +             -I$(MULTIBUILDTOP)../libbacktrace \
> +-            -I../libbacktrace
> ++            -I../../libbacktrace
> +
> + # Fortran rules for complex multiplication and division
> + AM_CFLAGS += -fcx-fortran-rules
> +diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
> +index 7ed080cf7b0d..d197fbd6b683 100644
> +--- a/libgfortran/Makefile.in
> ++++ b/libgfortran/Makefile.in
> +@@ -598,7 +598,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
> + toolexeclib_DATA = libgfortran.spec
> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
> +-      $(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
> ++      $(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
> +       -lm $(extra_ldflags_libgfortran) \
> +       $(version_arg) -Wc,-shared-libgcc
> +
> +@@ -618,7 +618,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
> +             -I$(MULTIBUILDTOP)../libgcc \
> +             -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> +             -I$(MULTIBUILDTOP)../libbacktrace \
> +-            -I../libbacktrace
> ++            -I../../libbacktrace
> +
> + gfor_io_src = io/size_from_kind.c $(am__append_2)
> + gfor_io_headers = \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

