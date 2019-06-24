Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 142C17C786
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:43:51 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m24so218457ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3EZJuw6SnUib3zd7erM09sLGk2ETYw9GicLLNrPa8gM=;
	b=MrmHihvaPOfGPv2eY9yGsKoHO6br86M7d2gQsgJJTISuSCwHrX8KdJQTBAJsIHt16X
	NOzkVD8ObNwW+8TNKPeIouJF+NqgUUPkvdmAg5reMA6jVS2wFrQFd+xsElLQQI2YWlBQ
	9Va6QgsLK6N3HDqqaSDTR4zYn6jzWDnbtCLOZbdhhg289F79kQD94uA2TEHjwtIVPErx
	2KLYGHPSNyDqYdkgz/2ZpK124ONqrggGtt+k3P6HJKUAtsBed4lD6kJ+iudxnsvaboZp
	a8BcPF8M2SdqYJ7R7gkf//kzNRUmr/3EtH44ieZRVfXkjma38LAUPvsHm8vP2H66u+Hq
	Zi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3EZJuw6SnUib3zd7erM09sLGk2ETYw9GicLLNrPa8gM=;
	b=eTVGPX8VCJyYKr+kDYb95aEeGiQEAyjAk1+SGuhP91Unt5gcB6rOCSijHBLaeGDDsx
	qIchVbHmJ7JhlZ//nC2U4jAf5P0KwWEZ5kSXELRLBRmreAHk69Yyzu/BOcelPLhn94t5
	I4Hkd8rdurH0q3oK2etmp2QkDP6Ri/KrWDv8VdqGeq0rV9nlPYUtkpKs1FPXur/e9SVN
	jsc36cC+8Lq29j+yCOAQgCVuZGp5kPw8Tny1itPPysDXSORWPrr0i8blgkIBUE98ehmJ
	9cDCHQoVUBaN9dRBg8+34CLqCrfI1Mmgc8hyIBUrAcUAHNfLjXCQ17v6nhFqlBeHHqrv
	XAoQ==
X-Gm-Message-State: APjAAAUNDHIzpfLXRmQWKjcC1fOJNItW28QQasd00AL8XG08QKbY5YY1
	yfL4QFBs/dGkEXSDW9NRXLyMeOrTk+BZydDidYcu0g==
X-Google-Smtp-Source: APXvYqzJrS7/Si8bpuhJFpcUOTLCR8nYJ5bld8ZTN4uwTn6i5BXM8Q0GdmOfif7QQPqFMNQKTog/C+KDKIe+JoSlfcc=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr16447240iod.25.1561369432175; 
	Mon, 24 Jun 2019 02:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <1561368577-265361-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1561368577-265361-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 10:43:41 +0100
Message-ID: <CAJTo0LZJUL7Qk8EUV0jSneyH3BAZCrTz_YqS8dwNrPBsxF6NAA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scons: fix conflict during do_rootfs
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
X-List-Received-Date: Mon, 24 Jun 2019 09:43:52 -0000
Content-Type: text/plain; charset="UTF-8"

Is this actually needed?  Can we just delete python-scons?

Ross

On Mon, 24 Jun 2019 at 10:33, <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below error:
> file /usr/bin/scons conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-configure-cache conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-configure-cache-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-time conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/scons-time-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/sconsign conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> file /usr/bin/sconsign-3.0.5 conflicts between attempted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/python/python-scons_3.0.5.bb  | 14 +++++++++++++-
>  meta/recipes-devtools/python/python3-scons_3.0.5.bb | 14 +++++++++++++-
>  2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-scons_3.0.5.bb b/meta/recipes-devtools/python/python-scons_3.0.5.bb
> index 939c15b..94c2d07 100644
> --- a/meta/recipes-devtools/python/python-scons_3.0.5.bb
> +++ b/meta/recipes-devtools/python/python-scons_3.0.5.bb
> @@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
>  UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>
> -inherit setuptools
> +inherit setuptools update-alternatives
>
>  RDEPENDS_${PN} = "\
>    python-fcntl \
> @@ -22,3 +22,15 @@ RDEPENDS_${PN} = "\
>    python-shell \
>    python-pprint \
>    "
> +
> +ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsign-3.0.5"
> +ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
> +ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
> +ALTERNATIVE_TARGET[scons-configure-cache] = "${bindir}/scons-configure-cache"
> +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] = "${bindir}/scons-configure-cache-3.0.5"
> +ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
> +ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
> +ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
> +ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
> +
> +ALTERNATIVE_PRIORITY = "20"
> diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> index 7fb75a6..6e240d8 100644
> --- a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> +++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> @@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
>  UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>
> -inherit setuptools3
> +inherit setuptools3 update-alternatives
>
>  do_install_prepend() {
>      sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/script/*
> @@ -27,3 +27,15 @@ RDEPENDS_${PN} = "\
>    python3-pickle \
>    python3-pprint \
>    "
> +
> +ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsign-3.0.5"
> +ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
> +ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
> +ALTERNATIVE_TARGET[scons-configure-cache] = "${bindir}/scons-configure-cache"
> +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] = "${bindir}/scons-configure-cache-3.0.5"
> +ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
> +ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
> +ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
> +ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
> +
> +ALTERNATIVE_PRIORITY = "30"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

