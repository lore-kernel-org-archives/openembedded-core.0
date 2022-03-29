Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812A4C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 20:36:02 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.1873.1648586161609689872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 13:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fa218/vr;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id c15so24989254ljr.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 13:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k9j97xv/DuPkWSDfojALWN78ALbnv7p7U+10DrXxb6c=;
        b=fa218/vrKzawfU0oDISQFm5AvzExq5XV/cQZg78u/pcmt+jSTxCeuiEGoBVkljoW6y
         aPVJ066tREE4NnJ3a1cXSu2lMVrINr5E4JSuqPcqK0LGHVwxoBjLUlgJgRWwltFolYHm
         RhGLD75XOSX2daP1m6PZlCjODFmWyPs3X2ucyuNcSDlFL3u8FpMYG39QwDjPBVX5CnBR
         2um8aX3cW7SlBtuhIAl9Ks2x6AUpkOwawzazwz3Sm21AQQyjMhI5U8RQg+C+CQuhBRI3
         RA9nCMrIow0IWQlTYstQvn9nOW/AKFDQ/GYPBTwFNHTkh6uy/dlTiBzND7etpAnkhwLD
         jQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9j97xv/DuPkWSDfojALWN78ALbnv7p7U+10DrXxb6c=;
        b=Vdv9NUBc8mYNPwr7ZMQXXLdC5E2T4QxWHd5oX1IbjEMUgkZ4XuCBEFQEqed68SW+wZ
         BVjJpquowRQ+79x7MEGyv/4JS+UifFjzi5v90rAWrkyWL56Ytw8BfQ0lmLJvDDQqHDeg
         9vrNrnIzLnJfXSi/vIXdPsi8bMZeuBtNfovk5zJaZA3rOVl7Be6JsVoqEs7nxbZuPJAM
         toDRSnlT/3pHSj8sH46Y0V0TiKmgy3mU6in5lVrvUtTQszJ2QAhSnk9K1Gh7CdTOgErj
         j5/xWLwuI44/XCN8bPqwBPaFsiO0GxUO4VrqmN0cK3GPw5Z/sjAdtexOtZb9hnS+JTx3
         ph5w==
X-Gm-Message-State: AOAM532MCgKS5cOGSOM31ke2WcK2fRxNkzRHLH+F6ySWxvKD/GPzY3hq
	1fwrDhJTSTeO2etMeQInhb3aOcsKKrnbQTJGb5Y=
X-Google-Smtp-Source: 
 ABdhPJxRikWdHrj+Cww0y2LcA82H2I9gocMOkHtQuBEvDy+jh50c6QHb9y+dlEZ3euMzcUh5mABW4AmJDWoR/h1gNN8=
X-Received: by 2002:a05:651c:50e:b0:249:89ef:101b with SMTP id
 o14-20020a05651c050e00b0024989ef101bmr4096994ljp.109.1648586159669; Tue, 29
 Mar 2022 13:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220329075101.3085897-1-crg7475@mailbox.org>
In-Reply-To: <20220329075101.3085897-1-crg7475@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Mar 2022 22:35:47 +0200
Message-ID: 
 <CANNYZj8+h6hLAeMSU2JTN_MXE53-_iSN926tPkiAOtqLkdszTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: Disable libunwind dependency in native
 builds
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 20:36:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163757

Is this specific to some particular host setup? If so, it needs to be
said in the commit message, so we know when it is safe to drop this
patch.

Alex

On Tue, 29 Mar 2022 at 09:52, Carlos Rafael Giani via
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
wrote:
>
> libunwind-native currently cannot be added to the class-native DEPENDS
> due to the following problem:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio
>
> And without libunwind-native, libsdl2-native config fails errors like:
>
> | -- Checking for one of the modules 'libunwind'
> | CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> |   None of the required 'libunwind' found
> | Call Stack (most recent call first):
> |   CMakeLists.txt:1367 (pkg_search_module)
>
> Ideally, the libunwind issue would be fixed, and then this could be added
> to the libsdl2 recipe:
>
> DEPENDS:append:class-native = " libunwind-native"
>
> However, the libunwind problem is not trivial to fix, and requires a
> specific setup to reproduce. As an alternative workaround, turn off
> libunwind support in the native SDL2 build by disabling the unwind.h
> check in the CMake script (this subsequently turns off all the other
> libunwind checks). The main user of libsdl2-native is qemu-native, which
> does not need libunwind support in SDL2.
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  ...d-in-native-OE-builds-by-not-looking.patch | 38 +++++++++++++++++++
>  .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
> new file mode 100644
> index 0000000000..214664f621
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
> @@ -0,0 +1,38 @@
> +From 50c691e83f81b235bb96ef996dd4568ffaae256f Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <crg7475@mailbox.org>
> +Date: Fri, 18 Mar 2022 12:06:23 +0100
> +Subject: [PATCH] Disable libunwind in native OE builds by not looking for
> + libunwind
> +
> +This is a workaround for this build error:
> +
> +| -- Checking for one of the modules 'libunwind'
> +| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> +|   None of the required 'libunwind' found
> +| Call Stack (most recent call first):
> +|   CMakeLists.txt:1367 (pkg_search_module)
> +
> +By not looking for the libunwind header, the rest of the libunwind
> +specific bits in the CMake build script are disabled.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 64f9fbf..12a4d8f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -862,7 +862,7 @@ if(SDL_LIBC)
> +     check_include_file(sys/types.h HAVE_SYS_TYPES_H)
> +     foreach(_HEADER
> +             stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string.h limits.h float.h
> +-            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h libunwind.h)
> ++            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.h signal.h)
> +       string(TOUPPER "HAVE_${_HEADER}" _UPPER)
> +       string(REPLACE "." "_" _HAVE_H ${_UPPER})
> +       check_include_file("${_HEADER}" ${_HAVE_H})
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> index 58bc94cc86..4ba22c1fe6 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://optional-libunwind-generic.patch \
>             file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
>             "
> +SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch"
>
>  S = "${WORKDIR}/SDL2-${PV}"
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163739): https://lists.openembedded.org/g/openembedded-core/message/163739
> Mute This Topic: https://lists.openembedded.org/mt/90103750/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

