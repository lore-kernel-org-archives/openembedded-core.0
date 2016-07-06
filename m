Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3026013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:06:54 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z36so16348589qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DG+TQE7ms3XcMqautCGCzsq4SVjXxEmgyt/ePm1QZv4=;
	b=lJwOj6PdnnpW7wvFB7S10wnloKf1KfIWvgrZ4STbvVVPAX2WIJjTKwsN7niEB3F2f5
	0z/hZofz3xLCCTM/13MwcHBg35p2jZ/RuToZvyULIj92WH4c0PO/joVRLhs5FaTqcjOJ
	I8zJSqq/rNdnLbkc6jebl/53n+b2f5iUjdWznrjNXvLUGU3T2CBQwSVBFawCoZfZQ+NP
	7iXuyfmqHGRvCzFVBCWcCp7ElIdqO/+3rO1aAlS9M4qFI5ii2gVAauqPd1qOJSrKKgpj
	uO8+h5jyvIHtT6H9Fmv5UMoO+1k1RCth0RkjgFxMgdAcYyFxLXztZ5Lrji7f6YsBgQTb
	7BZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DG+TQE7ms3XcMqautCGCzsq4SVjXxEmgyt/ePm1QZv4=;
	b=J89YOSCXfEfhNLJzbIAPx9KMY5DKqU5R2IS6EE+O5D8/Yc+jHA/pdoDq2JKPT4hqf8
	++YD4tyo6bCaR+WyAn5iOZXErZB4NFdCnWt/pbaAqiRsMt+Xp68pbzcu538L8DsKwe1b
	Ho8TlH10WMKoHrO3gGMR4y0LxcDX93A0Qvyh03lkqCVaNh1/WvTvC4URVnEAej7dmhuM
	ZLDj80VcWkzGitQ9DwjLtwUE1+Qer/7W4UbRC0v4B7pzrXU3eksxj2WQ9Wk7puDGENfd
	n5MoqDBaDafeWdCgeuIr1SlLIyaClBd9zSFFunIPmpS8/7YM95sSYsTyy9bJ5sL+3QzY
	6Vog==
X-Gm-Message-State: ALyK8tIBV/ypTYCAU4n766o8hDtKG1fKOU8hIXtXVH4hLEI8e0I0glDTPmhQY22G1N6nfIOEvZuuefIi/w2sBw==
X-Received: by 10.200.37.9 with SMTP id 9mr39680155qtm.31.1467839214921; Wed,
	06 Jul 2016 14:06:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 14:06:25 -0700 (PDT)
In-Reply-To: <b999c120aa54bd09eb2bd6d5acd362d01b19a7da.1467838464.git.paul.eggleton@linux.intel.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
	<b999c120aa54bd09eb2bd6d5acd362d01b19a7da.1467838464.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 14:06:25 -0700
Message-ID: <CAMKF1srfzXyx=D1rh_ofH4YdBXn5UTPtcofGp3aYmyXgkUdqwA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gcc: add runtime packages to RRECOMMENDS
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
X-List-Received-Date: Wed, 06 Jul 2016 21:06:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 1:55 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> In order to use certain features of gcc, you need the corresponding
> runtime library. It seems to me that these ought to be installed by
> default when installing the compiler since they are required if certain
> command line options are used, so add them to RRECOMMENDS. I used
> RRECOMMENDS since some of these packages may or may not exist depending
> on architecture and build options; additionally it makes it possible to
> use BAD_RECOMMENDATIONS if you really want to exclude them.
>
> The impact of this isn't too bad in the context of an image providing
> on-target compilation - about a 30MB increase in size for an image
> containing gcc and g++.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> index 37c5c62..2eac2bc 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -42,6 +42,16 @@ FILES_${PN} = "\
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
>  "
>  INSANE_SKIP_${PN} += "dev-so"
> +RRECOMMENDS_${PN} += "\
> +    libssp \
> +    libssp-dev \
> +    libquadmath \
> +    libquadmath-dev \
> +    libgomp \
> +    libgomp-dev \
> +    libitm \
> +    libitm-dev \
> +"

I think besides libssp/libquadmath others seems not commonly used. I
wouldnt suggest to add them

>
>  FILES_${PN}-dev = "\
>      ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
> @@ -69,6 +79,11 @@ FILES_g77-symlinks = "\
>      ${bindir}/g77 \
>      ${bindir}/f77 \
>  "
> +RRECOMMENDS_g77 = "\
> +    libg2c \
> +    libg2c-dev \
> +"
> +
>  FILES_gfortran = "\
>      ${bindir}/${TARGET_PREFIX}gfortran \
>      ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
> @@ -98,6 +113,12 @@ FILES_g++-symlinks = "\
>      ${bindir}/c++ \
>      ${bindir}/g++ \
>  "
> +RRECOMMENDS_g++ = "\
> +    libstdc++ \
> +    libstdc++-dev \
> +    libatomic \
> +    libatomic-dev \
> +"
>
>  FILES_${PN}-doc = "\
>      ${infodir} \
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

