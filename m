Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D31C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 09:30:26 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.24460.1646645425602341536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 01:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QWdI+oQw;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id y44so6232330uac.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDopjZny00AVdIkUYMeqM/Yi5T0sWvxovLzvlczAtRQ=;
        b=QWdI+oQw4huvPsqGQd4mpdLou5jmbw0zONrVNBXUCQgsrKgFJdgW3lkIn1gvFrzzBy
         h8qIGzjgUbma9Ga9Nx26OMhPSNWZYYifBZ/od8mROz3u5MVR0CjaGwfOY/49okfNrqYL
         TB+/UnbvESF+s/ng9UZs4bziGH9Ya5vie1+g1jFlalcbO2YU6X12jwP0xaHF2PYvNzH+
         CHrgwuwoMX73yxPYN2aNmuUjOK/nfz8Gh2Mky57uL09Knewbn9JWU4Cv40YGmF0fHsgm
         5HBjdGCdzYRVHPzTekm8eusjyYVXG40nV3foNf3liBQxQJxdEUVpT04vaT/CTef5lMA0
         aJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDopjZny00AVdIkUYMeqM/Yi5T0sWvxovLzvlczAtRQ=;
        b=sJQHOLJ7w86zbU2ydj8jwRL5hWhjlZhHtyFFE+jOO5AAd5tmklH53u/zYOBQezNEYf
         4ZTOwlUFDGkJPF/ZC7G++WalOc4weX8Woxmb4Du66AYlHsi5gr3L+WR7GN3mLnjZxGWo
         BigUj4gICV2R68uQf3DIFtb1uPXTPh+j0bbuUnpQwKNXln89nBXTJ4qSFNdTHoFtLOMC
         PZNWssBQ7klM/WtYzonM3TrzCfcl+o4JlssJEUXgKCDg0f8dZ133UJUg13Zf1Ch/D4Gv
         Ly5VlMlBUOmQfTVt2MDhhijPH9/SV0GTP4aqR8e4+JjY273OkvzxptE+1AcPRf2sruVF
         5XqQ==
X-Gm-Message-State: AOAM532Wys8p5gDhfbhKJj91KYAh0hrV4dOPEhpvGFWKL8msvO9XmlnO
	lU+olAeLGpXyVeJCQFBq9L6D26ajRSXWBgzldgc=
X-Google-Smtp-Source: 
 ABdhPJw7uu8sm3+WI8Z64WPNkMTT/usVdLBfKgll/ys6T8xQYNURNC5iREA57+VuwI2Rju5LQQ7KTOa9e4KDdEQlsDc=
X-Received: by 2002:ab0:16d9:0:b0:342:4791:1b86 with SMTP id
 g25-20020ab016d9000000b0034247911b86mr3032801uaf.82.1646645424686; Mon, 07
 Mar 2022 01:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20220307080750.489418-1-crg7475@mailbox.org>
In-Reply-To: <20220307080750.489418-1-crg7475@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Mar 2022 10:30:12 +0100
Message-ID: 
 <CANNYZj-2EV5L4EoKzNi3k8r4Z8=hUE9KkgzK0xNWo1TNbvjCNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: Make libunwind dependency optional for
 native builds
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 09:30:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162801

This needs to be better explained, particularly why the patch is
inappropriate for upstream submission.

Alex

On Mon, 7 Mar 2022 at 09:08, Carlos Rafael Giani via
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
wrote:
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  ...ependency-optional-for-native-libsdl.patch | 37 +++++++++++++++++++
>  .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
> new file mode 100644
> index 0000000000..00f3486194
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Make-libunwind-dependency-optional-for-native-libsdl.patch
> @@ -0,0 +1,37 @@
> +From 78078bcf00f0ad13d93b1dc525ee0a666c30f246 Mon Sep 17 00:00:00 2001
> +From: Carlos Rafael Giani <crg7475@mailbox.org>
> +Date: Mon, 7 Mar 2022 05:09:08 +0100
> +Subject: [PATCH] Make libunwind dependency optional for native libsdl2 OE
> + build
> +
> +This is a workaround for this build error:
> +
> +| -- Checking for one of the modules 'libunwind'
> +| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmake:890 (message):
> +|   None of the required 'libunwind' found
> +| Call Stack (most recent call first):
> +|   CMakeLists.txt:1367 (pkg_search_module)
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 64f9fbf..eda3112 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1364,7 +1364,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROID AND NOT RISCOS AND NOT HAIKU)
> +
> +       if(HAVE_LIBUNWIND_H)
> +         # We've already found the header, so REQUIRE the lib to be present
> +-        pkg_search_module(UNWIND REQUIRED libunwind)
> ++        pkg_search_module(UNWIND libunwind)
> +         pkg_search_module(UNWIND_GENERIC libunwind-generic)
> +         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIBRARIES})
> +       endif()
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> index 90724ab8b7..d8211165d4 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
>             file://optional-libunwind-generic.patch \
>             file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
>             "
> +SRC_URI:append:class-native = " file://0001-Make-libunwind-dependency-optional-for-native-libsdl.patch "
>
>  S = "${WORKDIR}/SDL2-${PV}"
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162798): https://lists.openembedded.org/g/openembedded-core/message/162798
> Mute This Topic: https://lists.openembedded.org/mt/89607589/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

