Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4E0CCA479
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 01:26:57 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.23670.1657502808934748441
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 18:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EXXWiXvL;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id w1so5659762qtv.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 18:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BFROf6vW9VXAP9Pu9S8ticRSP6LVojRFc4ho5xWNITQ=;
        b=EXXWiXvLELmNLmeZ+ZOZDcIsexjCuicrq+w+WMLg4Q+fIx+AeT/LSRc/kTgQnSdLfl
         iOmDsCNRQOxxlMvIVoziybYKOXSpjJLcrtNJacldn/v5MGp2UKt1N3v4/neInp6ql5hK
         zcISZxA9LdFREOpf2ZQvPrvReJFFM3S+WA0zfF2BXO/mSkSDPL+yMT8Sp23QF4/3k+eL
         I1M+BAPBlvTymvRoy2wua8+w8H02IEgYmgtpDHd7nH2+BaNfawfN5OWPP4SKRa30MOCi
         8+KcoKZvw1GkSJZmtqRdIdFGNRWTMafoDMZj3okMTWL89Iyg/AQQ7RpOvLyLtTTC/A4n
         Jg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BFROf6vW9VXAP9Pu9S8ticRSP6LVojRFc4ho5xWNITQ=;
        b=7YGr5nJZK2fH8b501KbpXh+fcbh92YfnQ3c6DKzWwZvkMMGwRsUwGVYOjc4W+pVhRh
         orwYKw3RXfOi26wkgajEuqxys00aTDftyYLYE6B+nbqB8iSNvLlg3dgvwbLVF/kTgdHG
         xis4qKSGf/muCQ83H8x8nyWw94c50hFXk9cr8Da4r9IDTsUMxGx2gbIJiunvPEWse3I3
         4OLTaDGUQ1/K9dUFGp1Y7Ex3PmHdHQmiZU1wiX+gp1GTEwpuBqxEnLxA1OTod8abAq34
         31M1XcDA3CYgvCg8RV7KuyM7ewh9T5/4DIE+Yqxd9hn6bKhxegYh5mvYYHrBIq+e1MKk
         qWLg==
X-Gm-Message-State: AJIora8AqcjzMvAcDOIZsz4G/q7Vrw1qVZ7e7tdMe+eOOPd/N7bdn6G6
	oMaNPi/U6iecN5QcFYUn1hI=
X-Google-Smtp-Source: 
 AGRyM1uWPrISv3+Uisj91926uey6w77FuZCZPOQVk3rrV8gLMENDkSZwtuUj3l+oYJQgk7KVTlyegQ==
X-Received: by 2002:ac8:4b42:0:b0:31b:efb7:7e9c with SMTP id
 e2-20020ac84b42000000b0031befb77e9cmr11978107qts.566.1657502807865;
        Sun, 10 Jul 2022 18:26:47 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a05620a40c700b006b1490619cdsm5155255qko.99.2022.07.10.18.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 18:26:46 -0700 (PDT)
Date: Sun, 10 Jul 2022 21:26:45 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, cardoe@cardoe.com,
	Bertrand.Marquis@arm.com
Subject: Re: [meta-virtualization][PATCH] xen, xen-tools: pass prefix maps to
 fix buildpaths reproducible build issues
Message-ID: <20220711012642.GA10267@gmail.com>
References: <20220710054216.40558-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710054216.40558-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 01:26:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167852

Looks good to me, and better than what we had before.

I've fast tracked it into master, so we can see what the
next set of autobuilder runs uncover.

Many thanks for looking at this.

Bruce


In message: [meta-virtualization][PATCH] xen, xen-tools: pass prefix maps to fix buildpaths reproducible build issues
on 09/07/2022 Christopher Clark wrote:

> To fix warnings when the buildpaths QA test is enabled, pass the file
> and debug prefix map options that were previously supplied only for
> reproducible builds, adding them to the DEBUG_PREFIX_MAP variable
> and supplying that to CC.
> 
> Testing indicates that passing the prefix maps needs to be via CC
> rather than the EXTRA_CFLAGS_XEN_CORE/TOOLS variables.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/xen/xen.inc | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index ed6e6a7..2bbf1e3 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -88,12 +88,13 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
>  # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unrecognized option '-Wl,-O1'"
>  export LDFLAGS=""
>  
> -# Pass through the Yocto distro compiler flags via the Xen-provided variables.
> -# Special handling:
> -# - The Yocto distro compiler flags are typically set to be appropriate for
> -#   user-space software rather than for generation of a hypervisor binary, so
> -#   only pass the debug prefix map to the hypervisor build:
> -EXTRA_CFLAGS_XEN_CORE="${DEBUG_PREFIX_MAP}"
> +# No additional C flags for the main hypervisor build
> +EXTRA_CFLAGS_XEN_CORE ?= ""
> +# Add prefix maps to support buildpaths QA test and reproducibility
> +DEBUG_PREFIX_MAP:append = " \
> +    -ffile-prefix-map=${S}=${PN}-source \
> +    -fdebug-prefix-map=${WORKDIR}=${PN} \
> +    "
>  
>  # - The Xen tools build for x86 systems with HVM-mode enabled includes hvmloader
>  #   which fails to build when "-m64" is included in flags set via the
> @@ -109,11 +110,11 @@ TUNE_CCARGS:x86-64=""
>  #   It must not be compiled with SSE compiler options enabled and the Xen build
>  #   explicitly clears CFLAGS to ensure that, so such options must not be passed
>  #   in via the tool variable. hvmloader is required to run HVM-mode guest VMs.
> -CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
> +CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
>  EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
>  # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
>  # in CC to ensure that configure can compile binaries for the right arch.
> -CC:arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
> +CC:arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
>  
>  # There are no Xen-provided variables for C++, so append to the tool variables:
>  CPP:append = " ${CPPFLAGS}"
> @@ -158,9 +159,7 @@ EXTRA_OEMAKE += "${@['', 'XEN_WHOAMI=${PF} XEN_DOMAIN=${DISTRO} XEN_BUILD_HOST=$
>                      [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}${@get_build_time_vars(d)}"
>  
>  # Improve build reproducibility: compiler flags to remove filesystem differences.
> -CC_REPRODUCIBLE_OPTIONS = "${@['', '-gno-record-gcc-switches ' + \
> -                                   '-ffile-prefix-map=${S}=${PN}-source ' + \
> -                                   '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
> +CC_REPRODUCIBLE_OPTIONS = "${@['', '-gno-record-gcc-switches'] \
>                               [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
>  
>  # check for XSM in package config to allow XSM_ENABLE to be set
> -- 
> 2.25.1
> 

