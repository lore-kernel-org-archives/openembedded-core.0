Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id A4E0E78A54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:05:49 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id n84-v6so15351882oib.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 06:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QMdxGFO0bQ+pPB6gpvqffmf9BxB4j1uRh3uo/fQNQUA=;
	b=UZBPGk3uWGV/yJejlhz/zoafLwzKVEnw7NmAQkNDnL19z+kBXdr5XS6XurKiTMsSmJ
	Jp+sF+5kj5S/hmB5fPe3fI2zhkQvKxeHwomQvReaGOi+T2aZ8d3NMJbO2VR5ul/l0DfO
	l4shWe3q9g7+IEWv3j2iMGm3LF5v6cvVGzu7CVfSNRXaNMNHLqJuk4xXazjswcfk7Nva
	YDFOBA+ac8hdz4WXJYhFwQq/ILvN2lhDOLH6Bn6ZDsY2w2qiLOiVgrlJtps1ngEHRULD
	s+TKxoVn45l/scFlpnq3hB5DfpGKq6M/5yejOYaZAtnRK5BLf90VwCVfO1mZNVqJJecR
	XWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QMdxGFO0bQ+pPB6gpvqffmf9BxB4j1uRh3uo/fQNQUA=;
	b=qK8hWWvZdUgfYuKwo/HzjaSJRPiPQNK61woDIqMeBDTQD9mgJQrYBiTYdIi/wEoAI0
	2mradmcrwu2nsBlh78Pzr7bIYRwcMEhz7ph3oxfFdTD4vLSMnfsMmYk/DvuGJGm1aI1I
	9M4Ljlw3Nu4HfI+GWt6F3iK3Tn7gCfiSaZBn9iRgZ/xUv5g1kP3Eya2u5TPCp3iU7KT0
	TPu7ZNpU9OerGMv+uP+45m5inC07o1+wA23+XN7dSsiVKRLrq6JdVy5TetfAz66T/gE2
	b3ifbIPZDk+u2+CSr31Lq+p2k8ep1Hm0R2NupYOD1I+QVyrOsphqH/JL4EZicNyu83Rc
	l6Pg==
X-Gm-Message-State: AOUpUlEo8CBIKS5a+Mxn6+NrsQO5PDZT9i1FptlguAqOk71rNp41nTFI
	W+5vA22BJYlOumBBTe/4wmSSae1ISy+tz+Zj7QR5yw==
X-Google-Smtp-Source: AAOMgpf8rmGmZJZyGJilorJsct+Ceip7YOSssp4kfwkYa8wqa3P8NBVf9HZbUOeRcLYyNnpqPSjhlcii91kg1YxuMps=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr10965719oib.320.1532005550724; 
	Thu, 19 Jul 2018 06:05:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Thu, 19 Jul 2018 06:05:30
	-0700 (PDT)
In-Reply-To: <e73aaa685b5af27bd88016b19bb45917502440ea.1531875240.git.hongxu.jia@windriver.com>
References: <cover.1531875240.git.hongxu.jia@windriver.com>
	<e73aaa685b5af27bd88016b19bb45917502440ea.1531875240.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 14:05:30 +0100
Message-ID: <CAJTo0LbGHtKCYX8-ETzhMtgUs3y209KtBtSDkm_OSRG_Fu_7hA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] distutils/setuptools, distutils3/setuptools3: improve reproducibility
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
X-List-Received-Date: Thu, 19 Jul 2018 13:05:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Hongxu,

Can you rebase this to current master?

Cheers,
Ross

On 18 July 2018 at 01:57, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> - Unify var-DISTUTILS_INSTALL_ARGS in distutils and setuptools
>
> - Supply "--root" directory to the "install" command, and use
>   it as a prefix to strip off the purported filename encoded
>   in bytecode files. (It strips build path prefix from .pyc files)
>
> [YOCTO #8446]
> [YOCTO #12084]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/distutils.bbclass   | 8 +++++---
>  meta/classes/distutils3.bbclass  | 8 +++++---
>  meta/classes/setuptools.bbclass  | 5 -----
>  meta/classes/setuptools3.bbclass | 4 ----
>  4 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index 1930c35..db28767 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -4,8 +4,10 @@ DISTUTILS_BUILD_ARGS ?= ""
>  DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
>  DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
>      --install-data=${STAGING_DATADIR}"
> -DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
> -    --install-data=${D}/${datadir}"
> +DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
> +    --prefix=${prefix} \
> +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> +    --install-data=${datadir}"
>
>  distutils_do_compile() {
>           STAGING_INCDIR=${STAGING_INCDIR} \
> @@ -34,7 +36,7 @@ distutils_do_install() {
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal_log "${PYTHON_PN} setup.py install execution failed."
>
>          # support filenames with *spaces*
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
> index d4b92a3..9637486 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -5,8 +5,10 @@ DISTUTILS_BUILD_EXT_ARGS ?= ""
>  DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
>  DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
>      --install-data=${STAGING_DATADIR}"
> -DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
> -    --install-data=${D}/${datadir}"
> +DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
> +    --prefix=${prefix} \
> +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> +    --install-data=${datadir}"
>
>  distutils3_do_configure() {
>         if [ "${CLEANBROKEN}" != "1" ] ; then
> @@ -45,7 +47,7 @@ distutils3_do_install() {
>          STAGING_INCDIR=${STAGING_INCDIR} \
>          STAGING_LIBDIR=${STAGING_LIBDIR} \
>          PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
> -        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS} || \
>          bbfatal_log "${PYTHON_PN} setup.py install execution failed."
>
>          # support filenames with *spaces*
> diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
> index 157ef63..a923ea3 100644
> --- a/meta/classes/setuptools.bbclass
> +++ b/meta/classes/setuptools.bbclass
> @@ -1,8 +1,3 @@
>  inherit distutils
>
>  DEPENDS += "python-setuptools-native"
> -
> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
> -    --prefix=${prefix} \
> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=${datadir}"
> diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
> index de6dd94..8ca66ee 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -2,7 +2,3 @@ inherit distutils3
>
>  DEPENDS += "python3-setuptools-native"
>
> -DISTUTILS_INSTALL_ARGS = "--root=${D} \
> -    --prefix=${prefix} \
> -    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> -    --install-data=${datadir}"
> --
> 2.7.4
>

