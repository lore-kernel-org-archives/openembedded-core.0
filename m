Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id BE9DF744AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 21:08:54 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id p22-v6so8295070uao.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 14:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jAXFy20+I1I5Ds7qh6aUfmvDMh8GTedkQ5YUECqYphw=;
	b=knq9VjHFCJ5CqGgROpPd2KnyflyMiQRhzflopBLVt4/UUTmUXuHo3onhqXizgtMeXK
	wfZvNVi6sFhhaZWwzIgY8VG4QTlz94CmL1GXzoy+VVp8VQ4pl2vOnxaHbp/ukd3OXY02
	eRWmVSh71gaumbWtgyEuIdEJunpCQJpCmIkEEExeZsoen6HTHIROjWOvm+pXvYeMgT47
	TfaWmVXPh5/GRMN6WqpvuaCcaIuSGXpBnY93xKJN/Kbp9g/ZV6qygFSRAivyus5+83K+
	rRAcYF1NAWwyZoHK8FR3bI6SAME3i5npwvM7wWK6SKxH8nvoepbeMR2BZViukjdHRFiB
	wrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jAXFy20+I1I5Ds7qh6aUfmvDMh8GTedkQ5YUECqYphw=;
	b=nsRmq/oiJKUMy6AWL4Kc/yaMxKWrQULqMOeGhun9y1qJlYQV1CvsbwXwPWKTfInBDQ
	NOGSFQT6blYxM0om+BTdzRptiYNTBP5OLkTWCc7wyOCVQWGH1XcD/qfd1uWcPhOjQotv
	NYMV/r4t1RsRk79Ex7q/JppBtWls+jGvQZUwEKLZvNjiAOoQkgyAL9kKb6/CWQjsRtWe
	XvvnaQjHC5BeB/rPThLWl8jHd7muGyS71sFzSOAnCoseeWoQianjQWgPZRsEGR0iNtpp
	wqIUfaI3QhX1Imr8ugtQ96Lh7taoqpEFC1ifWxhE2xgAYA6sbn9YL3Ek7hQx2FfvI9ok
	p3OA==
X-Gm-Message-State: AOUpUlHkfE7KzEbTKU7FRqVlPS4Z21oOZKvvqMbNWXMOPOXNTOFYMi1z
	AlueN9gafu1aBhUdJytHHIqf4xNP69uosgamH4U=
X-Google-Smtp-Source: AAOMgpdghgRtYJoZqfVRhgIpniuPXOFT+I/zGuMdRU6xqFXvL5ZO/8INUEaGDP5wnILQxAu7Igm2W5WVU1eA3Ui66pY=
X-Received: by 2002:ab0:5c9:: with SMTP id e67-v6mr2524720uae.66.1532120935544;
	Fri, 20 Jul 2018 14:08:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 20 Jul 2018 14:08:55 -0700 (PDT)
In-Reply-To: <1520710049-85318-1-git-send-email-juro.bystricky@intel.com>
References: <1520710049-85318-1-git-send-email-juro.bystricky@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 20 Jul 2018 14:08:55 -0700
Message-ID: <CAJ86T=WQy=Zn5Nmy5n6voqw4vhgwJt6+vskX4R8ZdiB5HG4FJQ@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl_1.0.2n: improve reproducibility
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
X-List-Received-Date: Fri, 20 Jul 2018 21:08:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 10, 2018 at 11:27 AM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> Improve reproducible build of:
>
> openssl-staticdev
> openssl-dbg
> libcrypto
>
> There are two main causes that prevent reproducible build, both related to
> the generated file "buildinf.h":
>
> 1. "buildinf.h" contains build host CFLAGS, containing various build
>    host references.  We need to pass sanitized CFLAGS to the script
>    generating this file ("mkbuildinf.pl". )
>
> 2. We also need to modify the script "mkbuildinf.pl" itsel in order to
>    generate a build timestamp based on SOURCE_DATE_EPOCH, if present in
>    the environment.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../openssl-1.0.2n/reproducible-cflags.patch        | 20 ++++++++++++++++++++
>  .../openssl-1.0.2n/reproducible-mkbuildinf.patch    | 21 +++++++++++++++++++++
>  meta/recipes-connectivity/openssl/openssl10.inc     |  3 +++
>  meta/recipes-connectivity/openssl/openssl_1.0.2n.bb |  5 +++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
> index 02a0e16..0598195 100644
> --- a/meta/recipes-connectivity/openssl/openssl10.inc
> +++ b/meta/recipes-connectivity/openssl/openssl10.inc
> @@ -162,6 +162,9 @@ do_configure () {
>
>  do_compile_prepend_class-target () {
>      sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
> +    oe_runmake depend
> +       cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
> +       oe_runmake CC_INFO="${cc_sanitized}"

Here calls to "oe_runmake depend" and "oe_runmake" are made from the
target specific do_compile_prepend(), but the original calls (without
sanitised CC_INFO) are then run again from do_compile(), ie:

  do_compile() {
    sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
    oe_runmake depend
    cc_sanitized=`echo ...`
    oe_runmake CC_INFO="${cc_sanitized}"
    oe_runmake depend
    oe_runmake
  }

Is the intention really to run "oe_runmake depend" and "oe_runmake" twice?

>  }
>
>  do_compile () {
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
> index 32444c6..f07289d 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
> @@ -43,6 +43,11 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
>             file://0001-Fix-build-with-clang-using-external-assembler.patch \
>             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
>             "
> +
> +SRC_URI_append_class-target = "\
> +           file://reproducible-cflags.patch \
> +           file://reproducible-mkbuildinf.patch \
> +           "
>  SRC_URI[md5sum] = "13bdc1b1d1ff39b6fd42a255e74676a4"
>  SRC_URI[sha256sum] = "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe"
>

