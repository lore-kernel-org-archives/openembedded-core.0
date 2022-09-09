Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC9EECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 19:51:46 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.369.1662753101752036375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 12:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hxcIeskA;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: armccurdy@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id z97so4076014ede.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wOLVSLDy/5qshCk9o39mVd2fxzSGWi2Ig2biiyvwCaY=;
        b=hxcIeskAZj5s1CfQEtvLd8uixo2TBpy6xJtOnSHWvidU+JoGN1TWda8bVOURjUKbGK
         lmCOYvp3JBGydeTOIZwHRlhAfXnDDrMoHfB5UKNSXWTKteRgVx3OYphopqbeBFN9t1BG
         A2nIxqRF2E4iaKFuXQyENQC7jzVQ5YWwqc9OvryNVgTHA37NCajDvROASN0gdfK85RZL
         rAuqVV1VlZpOT2wKSTUdjtdn+DG/6IbPI/kK/hHqtO0B9ukzmABhv8FL1ctIyE4NhWTz
         ERYVDEFV9hm8FiIyYszCOh207e9PCqwxryFi4YBDXFBkb6STr6aywY/QJjwy0I6qWC5X
         vM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wOLVSLDy/5qshCk9o39mVd2fxzSGWi2Ig2biiyvwCaY=;
        b=obKi8sytiGottc6MV+ipbv0vst19B+uPihjTdXzLRwljDY5UN2CTQDdASwaXRygfnv
         71AswnHLmWMnS2CpJ5qTn37BHAebJEEqGo2F9SaEHyshelfQa4LmsLK0InylUBYwM+Fv
         EzAT40Jm9TlumTUvhD6orn7FjgXrAb/M7k5ay26wqR8+hJ7E1LlZb3l8LxwV00a4itAM
         lpaomKPlA0F/8/XoV0CD13xuzUwXTeMnB4rp4XwedF258F2OooETXqT+8dItBLuc4Pxr
         x/ivwNqbFP1e2VMUdQJ6Tv+bDXPHNXPHaZR9Twb2p7tGtQcYqssM8pOYLxQYetQgCZ3C
         /vQA==
X-Gm-Message-State: ACgBeo3JO37D/7sMjwxRraGanu1qAL1yqAjMPu6SC0zQvbLFgG5mbhdf
	OtVQ9gGAyozF9x97aPFKr4Iz9aGJVVPLzt0vHBo=
X-Google-Smtp-Source: 
 AA6agR6dyiZgt5jfQF8wXYojnNB4oeBGfWdwG4UhYgnrN8L7SKkiqEI67REgdfJa5Vo5R96oz620Qn2obSw/Php3X8s=
X-Received: by 2002:aa7:d34e:0:b0:44e:8d4b:6e02 with SMTP id
 m14-20020aa7d34e000000b0044e8d4b6e02mr13124675edr.306.1662753100079; Fri, 09
 Sep 2022 12:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220909165204.12656-1-raj.khem@gmail.com>
In-Reply-To: <20220909165204.12656-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 9 Sep 2022 12:51:23 -0700
Message-ID: 
 <CAJ86T=VFBpQku9_Kh52u8jveG7XHxXEEDEaLcs+toYFDopKGzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: Define TC_CXX_RUNTIME
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 19:51:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170504

On Fri, Sep 9, 2022 at 9:52 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This variable is used to denote the C/C++ compiler runtime to use.
> Right now there are few alternatives out of the core which could
> use this variable to define this property, the values it can take
> are 'gnu' for gcc runtime. 'llvm' for using compiler-rt+libc++ and
> 'android' to use android runtime. Default settings is to use gnu
> which is current silent default also.

Seems like you made a conscious decision to refer to the gcc runtime
library as "gnu" instead of "gcc". What was the reasoning? Using "gcc"
would seem to be clearer unless it clashes with some gcc upstream
naming convention.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Document the variable
> v3: Rename to TC_CXX_RUNTIME
>
>  documentation/ref-manual/variables.rst | 6 ++++++
>  meta/conf/bitbake.conf                 | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index cf817e9540..2d28c3d2f7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7973,6 +7973,12 @@ system and gives an overview of their function and contents.
>        toolchain. You can use ``meta-sourcery`` as a template for adding
>        support for other external toolchains.
>
> +   :term:`TC_CXX_RUNTIME`
> +      Specifies the C/C++ STL and runtime variant to use during
> +      the build process. Default value is 'gnu'
> +
> +      You can select "gnu", "llvm", or "android".
> +
>     :term:`TEMPLATECONF`
>        Specifies the directory used by the build system to find templates
>        from which to build the ``bblayers.conf`` and ``local.conf`` files.
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 52a36d788b..62cdd9aa9c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -389,6 +389,7 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
>
>  TCMODE ??= "default"
>  TCLIBC ??= "glibc"
> +TC_CXX_RUNTIME ??= "gnu"
>  TMPDIR ?= "${TOPDIR}/tmp"
>
>  CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170499): https://lists.openembedded.org/g/openembedded-core/message/170499
> Mute This Topic: https://lists.openembedded.org/mt/93577585/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

