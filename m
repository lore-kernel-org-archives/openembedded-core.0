Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id A59757FA0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:39:19 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id dp13so5394451qvb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C2Sb+ngcFSEEIJDGVkPgsVRPwA5C2KCQc8fh3ImOB5Y=;
	b=Q67dYuBNuc36BW1Vdhqkh4euKRzh1e0TzwwDlXFnDoeBrc7M7Vdh+lSHkFCblUfaZt
	nFZ9hN9K+EimreN5de4tULjZdjA5n1u7SuMvnai3xqRB+HtOROvLZ86YdklSE0AS6a0R
	KRRzR8kOTHz1EVQXbvZLoC1GDsk8v9iTPy5g8WwUFudmUzmrD4smDc83/YcTzmOlODKI
	lPiv6MHL2nbj4CnKIABFaFg1GPouhpQ6HacDbBSA+GxZpM6zQ1RzDpNMcBthBeofxQ8O
	U1/wpXyflDa5yXxzP4J1L1BZAzLA7KUVoBBZMNK1seHSy/buvMgprAxpJHywi7jwPAsC
	enlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C2Sb+ngcFSEEIJDGVkPgsVRPwA5C2KCQc8fh3ImOB5Y=;
	b=jjoAZVbR2odlwqVrBa39+TOO7otpw646VpJxvogt19N8P+ZWGFjZRpsKfnXjgoCdJu
	Nf/TwbW3YDnvv7JoBjmwi31yab0Y4vyFV5gsUhlGGrNYrB1iihqCyHDbr4NKD4rhECxn
	W+nUY3MPZB3zl/I5xsP6xH0vW8jua4Ks5bvKGXlpvNf2o2jnvwBTzrL1L4p4ZT3VQaUi
	yOIJzl5auLnMXagIaWfPTvJb75CtSZyUYoJVtOE2vOCWeY6Nl1c1kee1i8wJeD9t3dDv
	tBlc9OeGCkDKMCsYRlMDBcJdKZtnjieLZ4dOaMcOOiS6d+Bacu6SQy0tfskO/RsRVMFp
	U/Xw==
X-Gm-Message-State: APjAAAVqUjqB/MAmGjV57CMk/ox/8BHnCy9mv6bQjrjuIOc8NnK2yeyE
	nWZgDJrhI2a9z4x4F58dm1CLG1sKY42MpeatWtw=
X-Google-Smtp-Source: APXvYqw3vpT04nBgpehf29kfFyt0jlx5wRkZEnDepaXCOb/R1dGLLbkwIcMS3hpN18MOR2wy7e5SiDqtmE1MingqHLU=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr19671774qvy.185.1580168360099;
	Mon, 27 Jan 2020 15:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20200127154330.32269-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200127154330.32269-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 15:38:53 -0800
Message-ID: <CAMKF1sopderw+hwY06CeszehphcxHsc2V299iphj17ufgNHtEQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nspr, nss: use ${includedir}/nspr like e.g. ubuntu does
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
X-List-Received-Date: Mon, 27 Jan 2020 23:39:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 7:43 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * instead of installing all 51 nspr header files directly in ${includedir}
>
> * ubuntu uses /usr/include/nspr as well as shown in:
>   https://packages.ubuntu.com/xenial/amd64/libnspr4-dev/filelist
>   and some components assume the same path
>
> * update nss configure to find them, similar change might be needed in
>   mozjs and ecryptfs-utils

It does come with some userspace fallouts

https://errors.yoctoproject.org/Errors/Details/308323/
https://errors.yoctoproject.org/Errors/Details/308321/
https://errors.yoctoproject.org/Errors/Details/308320/


>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/nspr/nspr/nspr.pc.in | 2 +-
>  meta/recipes-support/nspr/nspr_4.24.bb    | 4 ++++
>  meta/recipes-support/nss/nss/nss.pc.in    | 2 +-
>  meta/recipes-support/nss/nss_3.49.1.bb    | 4 +++-
>  4 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-support/nspr/nspr/nspr.pc.in b/meta/recipes-support/nspr/nspr/nspr.pc.in
> index d74caabe4c..1f15d19cfa 100644
> --- a/meta/recipes-support/nspr/nspr/nspr.pc.in
> +++ b/meta/recipes-support/nspr/nspr/nspr.pc.in
> @@ -8,4 +8,4 @@ Name: NSPR
>  Description: The Netscape Portable Runtime
>  Version: NSPRVERSION
>  Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
> -Cflags:
> +Cflags: -I${includedir}/nspr
> diff --git a/meta/recipes-support/nspr/nspr_4.24.bb b/meta/recipes-support/nspr/nspr_4.24.bb
> index 5f823f8941..e98fe83ed3 100644
> --- a/meta/recipes-support/nspr/nspr_4.24.bb
> +++ b/meta/recipes-support/nspr/nspr_4.24.bb
> @@ -156,6 +156,10 @@ MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/nspr-config"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>
> +# Do not install nspr in usr/include, but in usr/include/nspr, the
> +# preferred path upstream.
> +EXTRA_OECONF += "--includedir=${includedir}/nspr"
> +
>  do_compile_prepend() {
>         oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
>  }
> diff --git a/meta/recipes-support/nss/nss/nss.pc.in b/meta/recipes-support/nss/nss/nss.pc.in
> index 200f635c65..402b4ecb33 100644
> --- a/meta/recipes-support/nss/nss/nss.pc.in
> +++ b/meta/recipes-support/nss/nss/nss.pc.in
> @@ -7,5 +7,5 @@ Name: NSS
>  Description: Network Security Services
>  Version: %NSS_VERSION%
>  Requires: nspr >= %NSPR_VERSION%
> -Libs: -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
> +Libs: -L${libdir} -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
>  Cflags: -IOEINCDIR
> diff --git a/meta/recipes-support/nss/nss_3.49.1.bb b/meta/recipes-support/nss/nss_3.49.1.bb
> index 94f4b88fa5..b16ade9f62 100644
> --- a/meta/recipes-support/nss/nss_3.49.1.bb
> +++ b/meta/recipes-support/nss/nss_3.49.1.bb
> @@ -52,7 +52,7 @@ do_configure_prepend_libc-musl () {
>  }
>
>  do_compile_prepend_class-native() {
> -    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
> +    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
>      export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
>      export NSS_ENABLE_WERROR=0
>  }
> @@ -67,6 +67,8 @@ do_compile_prepend_class-native() {
>  }
>
>  do_compile() {
> +    export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
> +
>      export CROSS_COMPILE=1
>      export NATIVE_CC="${BUILD_CC}"
>      # Additional defines needed on Centos 7
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

