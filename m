Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id BEB3478CB2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 11:57:59 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id n21-v6so13667067oig.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 04:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iy9UqI3k/yjlc9uT0lM0VKv4PRMxUtBHJ5gLaNVYvlM=;
	b=jacEpyKFa1n2gZpFYTlch2sIO/L1B7EENIkM/QOqc+8/CECns/MXbs0GSYz8JzNjv4
	Mf+GVP8+7NYL/vNqiSwQpFWueN5MPNAt3iDb2djJpSLEOOFsmxtuv8Oreoz9cya3/7Vq
	fqPC1ZBoep+toLtRtxgckK5To/DTZKSxxChZZL31oKRpMA47qtHbVSv5H89oG28KsVGi
	CYJDr8H3dEUnQkq2PXoKm+QFRjMd5vSLDKtPKiKYilw+HQErKU3/C9iRjRTPpTcIIUH/
	0Koou8pJggQ08XCLMYJtSgvmyxzWzQLk4x3ZmlAeRyX3gzYGjf+MPljqmOLs7h6D4xNi
	eK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iy9UqI3k/yjlc9uT0lM0VKv4PRMxUtBHJ5gLaNVYvlM=;
	b=J2rh8MXQCT8gCpmKmnoFNcNMtm22BohBHjV734VsqwTcASqOgUwSrWY5OYQkQgz6vT
	0PEcLmkzNKq4XE+vwn3lQNvz6jLpWikpLC196MIu8q6YzPc+WSwdxvE8yCae5MaXKf+s
	QSvR1LoTfI0foJTayijmNdJCQFb90bIRno57q3M5Ja3zJ9M6BYcByvdvHOy596KJePP+
	8sOTZnzMsb6xWEp7dI1dISR5ZzJSWYow9TREdihnQks4Z67fxKXyRsc4ievoxHztyb2r
	vTj3hrRtnsOsykZTfpXxopFazd+ZSNNZt2OBhyBVCzkx7q1Ud3OuUnP7LcvVM1OvkfCU
	NeFQ==
X-Gm-Message-State: AOUpUlGMuIY4tvfjAPKVXX0UIaRl3mGmGt0/Dox4fuh3SBLP91D2GXNN
	thf4D7/bWujglj/9hoRzL0EqpUKVaOJ2N1RAgP2QTg==
X-Google-Smtp-Source: AAOMgpdHQkSoLkwgDTlvAhBHNLhEou6+YexgbC70bbCBfPdTnu5Kci9qfT+JkHorVtIDg9Vo5WyzdDFig8TlPyILmJs=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr10912028oib.115.1532779080739; 
	Sat, 28 Jul 2018 04:58:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Sat, 28 Jul 2018 04:57:40
	-0700 (PDT)
In-Reply-To: <1532734081-24485-4-git-send-email-armccurdy@gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
	<1532734081-24485-4-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 28 Jul 2018 12:57:40 +0100
Message-ID: <CAJTo0Lb1N4=WQ0hXWKEGM3kPr-_BkG-SNN-00yTOEc31u7mJ_w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] openssl_1.0: add PACKAGECONFIG option to control manpages
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
X-List-Received-Date: Sat, 28 Jul 2018 11:58:00 -0000
Content-Type: text/plain; charset="UTF-8"

You might want to use the manpages class here.

Ross

On 28 July 2018 at 00:28, Andre McCurdy <armccurdy@gmail.com> wrote:
> Creating the openssl manpages, which happens as part of do_install(),
> can take a significant amount of time (e.g. ~50 seconds on a quad
> core laptop). Provide a PACKAGECONFIG option to allow creation of the
> manpages to be skipped completely if not required. Leave manpages
> enabled by default for target builds, but disable by default for
> -native and -nativesdk.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../0001-allow-manpages-to-be-disabled.patch       | 31 ++++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  8 ++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
> new file mode 100644
> index 0000000..3f7d649
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
> @@ -0,0 +1,31 @@
> +From e1c39b80b01d4d18feeadfdc6e45a3e1dd110634 Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Fri, 27 Jul 2018 21:41:06 +0000
> +Subject: [PATCH] allow manpages to be disabled
> +
> +Define OE_DISABLE_MANPAGES (via environment or the make command line)
> +to skip creation and installation of manpages.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + Makefile.org | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.org b/Makefile.org
> +index ed98d2a..747d8cb 100644
> +--- a/Makefile.org
> ++++ b/Makefile.org
> +@@ -549,7 +549,7 @@ dist:
> +       @$(MAKE) SDIRS='$(SDIRS)' clean
> +       @$(MAKE) TAR='$(TAR)' TARFLAGS='$(TARFLAGS)' $(DISTTARVARS) tar
> +
> +-install: all install_docs install_sw
> ++install: all $(if $(OE_DISABLE_MANPAGES),,install_docs) install_sw
> +
> + install_sw:
> +       @$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> index 2804203..527be72 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> @@ -43,6 +43,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://Use-SHA256-not-MD5-as-default-digest.patch \
>             file://0001-Fix-build-with-clang-using-external-assembler.patch \
>             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
> +           file://0001-allow-manpages-to-be-disabled.patch \
>             "
>
>  SRC_URI_append_class-target = " \
> @@ -61,17 +62,20 @@ UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
>
>  inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
>
> -PACKAGECONFIG ?= "cryptodev-linux"
> +PACKAGECONFIG ?= "cryptodev-linux manpages"
>  PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>
> -PACKAGECONFIG[perl] = ",,,"
>  PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
> +PACKAGECONFIG[manpages] = ",,,"
> +PACKAGECONFIG[perl] = ",,,"
>
>  # Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
>  # vulnerability
>  EXTRA_OECONF = "no-ssl3"
>
> +EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABLE_MANPAGES=1', d)}"
> +
>  export OE_LDFLAGS = "${LDFLAGS}"
>
>  # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

