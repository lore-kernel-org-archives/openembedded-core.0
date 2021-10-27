Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A1BC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 18:00:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.673.1635357644254440333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 11:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HwjlQck6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 z81-20020a1c7e54000000b0032cc97975e4so3012603wmc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 11:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ZlzFxMid6FoD12VlC6WU/47Z0Epe8ULaapOhcGf04PQ=;
        b=HwjlQck6qQHlRg5Ag46z28PLT+T4HqRG9IlwmkswTnbbRPcZrM50MRNSmKjniFzRh+
         rdGt68CvOUD0CMfrLKyaecZ28duBLOZciG25ido9RD81lGPHLtI6Sc7Ua0Uwh5CWOdQy
         9rN2XRkK5spGHoh6QprV0U78ezQ/LMlizJJGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZlzFxMid6FoD12VlC6WU/47Z0Epe8ULaapOhcGf04PQ=;
        b=dtLbLu0Oy4cVVWUCEX7V1dE9o0HB4UNJ6YMoA45pyagRGWGtX8Ray+OJkKr6pp/ZTw
         Y4d3E28+LrRqCybFKXkN3WF98LwJ59pYzESUp1lecn9km6Bx18OHg4Yv4LI3z21ejL0K
         QcJ34hus6Fh5+pPg5Jyd9woQoEXPFxDkU78Xu+5bwwEm3IVxnUShJ1fdv2tjdlCiDNPA
         UDtG2Q/hvJ76ZWFiLri2ZvX7osg0FcdCh9E6ovUJRwt229o74nX8eO7bL/Xw1w5OmrTh
         pFKABdc1ruEeVONiNz6BjZLPUmkt4HC1emt0LjgrmnPCP0Ir4GGWdJI1KpMRL8bhREtK
         piDQ==
X-Gm-Message-State: AOAM532XqK4uN0DdbCV08kLhZbxdnkYiW2eLAGNgCSxvmtCUNBH/4lXX
	mGW0iNm9mZkyb6nUn4mlwjgHuw==
X-Google-Smtp-Source: 
 ABdhPJxxizpOSeZ7ea7Scv247/sQe5vCNfm9ui19oojrbq6Gvs0biH7Yx58U2g8EuM7clM+G5tV9wQ==
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr7164725wma.106.1635357642638;
        Wed, 27 Oct 2021 11:00:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a2a1:45e8:949d:3f5c?
 ([2001:8b0:aba:5f3c:a2a1:45e8:949d:3f5c])
        by smtp.gmail.com with ESMTPSA id o1sm508932wrp.95.2021.10.27.11.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 11:00:42 -0700 (PDT)
Message-ID: 
 <c44874c177d7aa9041d1ce266bdbfdbec9dc305d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Improve reproducibility
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: oobitots@cisco.com, openembedded-core@lists.openembedded.org
Date: Wed, 27 Oct 2021 19:00:38 +0100
In-Reply-To: <20211027140954.76185-1-oobitots@cisco.com>
References: <20211027140954.76185-1-oobitots@cisco.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 18:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157561

On Wed, 2021-10-27 at 07:09 -0700, Oleksiy Obitotskyy via lists.openembedded.org
wrote:
> Checksum depends on options that could be
> different from build to build, e.g. absolute patch.
> Remove checksum-options from
> executable checksum calculation.
> 
> Change-Id: Ifa184febecd2d517826beee784ca5ac7a1fb17fe
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 +
>  ...emove-checksum-options-from-checksum.patch | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index 23dfea2319..ecac893980 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -64,6 +64,7 @@ SRC_URI = "\
>             file://0036-mingw32-Enable-operation_not_supported.patch \
>             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
>             file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
> +           file://0050-gcc-Remove-checksum-options-from-checksum.patch \
>  "
>  SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
>  
> diff --git a/meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch b/meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch
> new file mode 100644
> index 0000000000..50cff38c68
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0050-gcc-Remove-checksum-options-from-checksum.patch
> @@ -0,0 +1,77 @@
> +From 67402bb4013ea886b68a9f4ee1c2cb1472652dbf Mon Sep 17 00:00:00 2001
> +From: Oleksiy Obitotskyy <oobitots@cisco.com>
> +Date: Tue, 26 Jan 2021 04:32:27 -0800
> +Subject: [PATCH] gcc: Remove checksum-options from checksum
> +
> +Executable checksum calculated from object
> +files and options. Options could contain
> +absolute path and affect reproducibility.
> +To improve reproducibility remove
> +checksum-options conditionally from
> +executable checksum generation.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> +---
> + gcc/c/Make-lang.in     | 2 +-
> + gcc/cp/Make-lang.in    | 2 +-
> + gcc/objc/Make-lang.in  | 3 ++-
> + gcc/objcp/Make-lang.in | 2 +-
> + 4 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/gcc/c/Make-lang.in b/gcc/c/Make-lang.in
> +index a1cdee872..6ee5c103b 100644
> +--- a/gcc/c/Make-lang.in
> ++++ b/gcc/c/Make-lang.in
> +@@ -78,7 +78,7 @@ cc1-checksum.c : build/genchecksum$(build_exeext) checksum-options \
> + 	  cp ../prev-gcc/cc1-checksum.c cc1-checksum.c; \
> + 	else \
> + 	  build/genchecksum$(build_exeext) $(C_OBJS) $(BACKEND) $(LIBDEPS) \
> +-                     checksum-options > cc1-checksum.c.tmp && 		 \
> ++                     $(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1-checksum.c.tmp && 		 \
> + 	  $(srcdir)/../move-if-change cc1-checksum.c.tmp cc1-checksum.c; \
> + 	fi
> + 
> +diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
> +index 155be74ef..0ac6daa53 100644
> +--- a/gcc/cp/Make-lang.in
> ++++ b/gcc/cp/Make-lang.in
> +@@ -127,7 +127,7 @@ cc1plus-checksum.c : build/genchecksum$(build_exeext) checksum-options \
> + 	   cp ../prev-gcc/cc1plus-checksum.c cc1plus-checksum.c; \
> + 	else \
> + 	  build/genchecksum$(build_exeext) $(CXX_OBJS) $(BACKEND) $(CODYLIB) $(LIBDEPS) \
> +-                     checksum-options > cc1plus-checksum.c.tmp &&	   \
> ++                     $(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1plus-checksum.c.tmp &&	   \
> + 	  $(srcdir)/../move-if-change cc1plus-checksum.c.tmp cc1plus-checksum.c; \
> + 	fi
> + 
> +diff --git a/gcc/objc/Make-lang.in b/gcc/objc/Make-lang.in
> +index c91148a57..a83938ee7 100644
> +--- a/gcc/objc/Make-lang.in
> ++++ b/gcc/objc/Make-lang.in
> +@@ -60,7 +60,8 @@ objc_OBJS = $(OBJC_OBJS) cc1obj-checksum.o
> + cc1obj-checksum.c : build/genchecksum$(build_exeext) checksum-options \
> +         $(OBJC_OBJS) $(C_AND_OBJC_OBJS) $(BACKEND) $(LIBDEPS)
> + 	build/genchecksum$(build_exeext) $(OBJC_OBJS) $(C_AND_OBJC_OBJS) \
> +-        $(BACKEND) $(LIBDEPS) checksum-options > cc1obj-checksum.c.tmp && \
> ++        $(BACKEND) $(LIBDEPS) \
> ++		$(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1obj-checksum.c.tmp && \
> + 	$(srcdir)/../move-if-change cc1obj-checksum.c.tmp cc1obj-checksum.c
> + 
> + cc1obj$(exeext): $(OBJC_OBJS) $(C_AND_OBJC_OBJS) cc1obj-checksum.o $(BACKEND) \
> +diff --git a/gcc/objcp/Make-lang.in b/gcc/objcp/Make-lang.in
> +index dfa4d230e..ef16001c2 100644
> +--- a/gcc/objcp/Make-lang.in
> ++++ b/gcc/objcp/Make-lang.in
> +@@ -63,7 +63,7 @@ obj-c++_OBJS = $(OBJCXX_OBJS) cc1objplus-checksum.o
> + cc1objplus-checksum.c : build/genchecksum$(build_exeext) checksum-options \
> + 	$(OBJCXX_OBJS) $(BACKEND) $(CODYLIB) $(LIBDEPS)
> + 	build/genchecksum$(build_exeext) $(OBJCXX_OBJS) $(BACKEND) $(CODYLIB) \
> +-		$(LIBDEPS) checksum-options > cc1objplus-checksum.c.tmp && \
> ++		$(LIBDEPS) $(if $(SOURCE_DATE_EPOCH),,checksum-options) > cc1objplus-checksum.c.tmp && \
> + 	$(srcdir)/../move-if-change cc1objplus-checksum.c.tmp \
> + 	cc1objplus-checksum.c
> + 


Do you know why we wouldn't see this issue on the autobuilder tests?

Also, do you plan to submit something upstream? Has this been discussed with
them? I'm starting to become reluctant to taking patches marked as "Pending"
which just sit in our tree forever...

Cheers,

Richard



