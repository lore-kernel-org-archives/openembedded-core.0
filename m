Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 49F2D6076F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 00:07:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e199so27306669pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3K9Ah3UlfnmMe6DI42mq7ihcQMZyXfGwmhouRo2RStI=;
	b=qs6Bx+CPT4VP8AH+1kspbcAsFhgVvKaY1+DUvHQweyyPV7Cw5iXr5PMjhcbo+7NsAg
	N5qHM5gxzPTRZq3Ie1X8ekhG+yAAUqPPmzQIZgxR9YCWbVBrZAsSNNtUHJo036cC02mk
	hog0oDg+hmzyrVZ11VPPSRS2RGgrxLPIhmxLyOGfeU/cG2TY0ND+fE1wBRiJybk/ejb3
	5zWp3hJzb7Eo/zSLSq68dXb2No1SlVN75k3Al+oa3Sczt2e3VOQse1/wAk+DEZk5dfkS
	oS5/CpiLFUlMgZF1AXRxc0WxZCS2mPNs4zlZkN56/YO7Rwk0M3X6ubWOiGSAhhfB4COL
	860w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3K9Ah3UlfnmMe6DI42mq7ihcQMZyXfGwmhouRo2RStI=;
	b=PVT65us7KNKKJymqBrqRqSkhJ5fUMLixvXJ3whOd/5qrEBaPwKyidS2uGND9kFMZpd
	+8b8huFh0R1WPjLTWSxUuHt2t3MURTPkkEuPniNzDxoBCNXZR/uY2NJG2c9b9N5QzFLJ
	gpbjf2MmXV0DgeZ5S65faBqm2oUwdg15vddUzE5GRS4um1kY5noCNm1LR8lkhzplVNit
	wVbPqeM+HgdTcZddn5WONonrBMLsN9g043/IjM0gv0fBU44NicQWdtJfUaOVukqGCtNC
	g+CoyehM99yI1a8Kh1opw+DyK75JpbUaalQYpBmzIXXc60rPp3YmGKDswuLzH7KOeST1
	QCzA==
X-Gm-Message-State: AIVw112VmEw7/ScWj3dikOU+YtAVGfHZpzzYnIwxmjkcfl6PH5kjx27b
	PqwLeFACYAJMJdwDGT4=
X-Received: by 10.99.119.194 with SMTP id s185mr12990358pgc.256.1499126831308; 
	Mon, 03 Jul 2017 17:07:11 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:98c2:a462:52b5:f035])
	by smtp.gmail.com with ESMTPSA id
	x124sm30162351pgb.20.2017.07.03.17.07.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 17:07:10 -0700 (PDT)
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <05071b35-42a4-1733-7e04-4ecc512901b3@gmail.com>
Date: Mon, 3 Jul 2017 17:07:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v3 1/4] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Tue, 04 Jul 2017 00:07:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Whole series looks ok to me.

On 7/3/17 2:57 PM, Ricardo Ribalda Delgado wrote:
> Without this patch libbacktrace cannot be included/link during
> libgfortran build.
> 
> libbtool: link: cannot find the library `../libbacktrace/libbacktrace.la'
> or unhandled argument `../libbacktrace/libbacktrace.la'
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
>   .../gcc/gcc-6.3/0055-Fix-gfortran-build.patch      | 53 ++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
> index 86b3e9ff19a4..2595dbd0ee8b 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
> @@ -74,6 +74,7 @@ SRC_URI = "\
>              file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
>              file://0048-sync-gcc-stddef.h-with-musl.patch \
>              file://0054_all_nopie-all-flags.patch \
> +           file://0055-Fix-gfortran-build.patch \
>              ${BACKPORTS} \
>   "
>   BACKPORTS = "\
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch b/meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch
> new file mode 100644
> index 000000000000..30b135b9780f
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.3/0055-Fix-gfortran-build.patch
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
> +index 39d3e11d223c..b5efe6dfe195 100644
> +--- a/libgfortran/Makefile.am
> ++++ b/libgfortran/Makefile.am
> +@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
> + toolexeclib_DATA = libgfortran.spec
> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version` \
> +-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
> ++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
> + 	-lm $(extra_ldflags_libgfortran) \
> + 	$(version_arg) -Wc,-shared-libgcc
> + libgfortran_la_DEPENDENCIES = $(version_dep) libgfortran.spec $(LIBQUADLIB_DEP)
> +@@ -63,7 +63,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
> + 	      -I$(MULTIBUILDTOP)../libgcc \
> + 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> + 	      -I$(MULTIBUILDTOP)../libbacktrace \
> +-	      -I../libbacktrace
> ++	      -I../../libbacktrace
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
> +-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la \
> ++	$(LTLDFLAGS) $(LIBQUADLIB) ../../libbacktrace/libbacktrace.la \
> + 	-lm $(extra_ldflags_libgfortran) \
> + 	$(version_arg) -Wc,-shared-libgcc
> +
> +@@ -618,7 +618,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io -I$(srcdir)/$(MULTISRCTOP)../gcc \
> + 	      -I$(MULTIBUILDTOP)../libgcc \
> + 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> + 	      -I$(MULTIBUILDTOP)../libbacktrace \
> +-	      -I../libbacktrace
> ++	      -I../../libbacktrace
> +
> + gfor_io_src = io/size_from_kind.c $(am__append_2)
> + gfor_io_headers = \
> 

