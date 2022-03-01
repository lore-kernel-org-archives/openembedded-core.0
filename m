Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEE4C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 04:18:22 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.4700.1646108301522421288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 20:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DZIZ6Xlv;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id 185so12131561qkh.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 20:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=71Lf8YU7dufo2zRY6mmlSQ+2AOLIsBMhBJvGxVSgNxk=;
        b=DZIZ6XlveGVfw1T4PFy27xtwYJaEZNO67pFdh4zjSVqdv3CiTwn3ZqJjGdZI8KXxd3
         tFZTbk1TmjSO9jNAL3eWkyTSSwszec2PfuUvdm/1WUAqWCAinbq/hqpVOKzanCXiM6ss
         DI0UEFTWZQNEMlQcQgVuRvIBOH4jRGp45V/0nsh+hEv5V3/e8mj3XSBJ1x6YBSVRFAmB
         WvuAiJT6Z5LuVNS7afVqm/SM0/K2oHieq787TXybTKEUXp0FpzSplz/VLn8i/q9CIRRk
         /G2KeThRKk5tm0jueOS72VbzPnhLvpkMevkVTB9agFrXRFkKLKWeUuCGWLXfFtQiKynR
         UHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=71Lf8YU7dufo2zRY6mmlSQ+2AOLIsBMhBJvGxVSgNxk=;
        b=A6MCbYBGALvlCKeIrDOwQ4HXN/C8YpActS9/9Si3RtwdqNne/vR09F+4D4413NtcFk
         Av4ESztd2rtQV2tv8d1VdH50S3W+oG6NsllWOpumHzDixNaSmxpPiwvqo2tAvkmrAaFF
         Jl0p9edaULQvgQbUDekoPP9XJNSM86Bue4JytW7ck/lld7o70pUir8d12s3+6DwOCh73
         OT5uJLKhrNVYx/5DU8c+WlPHWw/TioLuxZXv+Mwwltp+jzwlpzSDPhG6PeHpUfBvmyh6
         8xPaTCgfwHubsVRVfpfSsZd2gRZv4V6oqY0gtAsT0F/egtAu6VZumfoTo/22qielA0Cy
         jWqg==
X-Gm-Message-State: AOAM532ppLzs/pzCu26yTJTZoEsbxtvFAerGrKmmxyXryT601ydvJukX
	B6Kgu6Y+i+s4RHJ4TX0L3f9lRM6QB1RHFSpOO/M=
X-Google-Smtp-Source: 
 ABdhPJyW/VXuEmQz5DGNLUGYLTgDef7XeJGExASXhE5XBQEpvfBw2xFy6X2Iy5+O6w1/b5qdxMsw5Thr8jtEGb+B7t4=
X-Received: by 2002:a05:620a:817:b0:648:d856:3fdc with SMTP id
 s23-20020a05620a081700b00648d8563fdcmr12576874qks.180.1646108300510; Mon, 28
 Feb 2022 20:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228163710.44361-1-quaresma.jose@gmail.com>
In-Reply-To: <20220228163710.44361-1-quaresma.jose@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 20:17:54 -0800
Message-ID: 
 <CAMKF1sr60VPL7C-kmroxNs5+d_aEsOn+ZZGZfBB7mwT-NHe3xg@mail.gmail.com>
Subject: Re: [PATCH] Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 04:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162524

this is fixing more than the workaround, e.g. see the patch I sent to
fix libical, where these flags are not passed to git compiler when
using cmake
I am not sure how many such fallouts there will be through out.

On Mon, Feb 28, 2022 at 8:37 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> This reverts commit 47594d59ec4ab82fcf87d3c590caf7c46a6bfdff.
>
> This patch was introduced 5 years ago as a temporary workaround
> to fix an upstream bug.
>
> Currently with that patch the following flags are duplicated:
>  OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
>  OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
>  OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
>
> The duplicated flags is used in the toolchain.cmake:
>  set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
>  set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
>  set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>
> CC: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/cmake.bbclass | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index fac7bbca7a..d9bcddbdbb 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -31,8 +31,6 @@ OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
>  OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
>  OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
>  OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
> -CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>
>  def oecmake_map_compiler(compiler, d):
>      args = d.getVar(compiler).split()
> --
> 2.35.1
>

