Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7490CC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:03:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.9304.1672830210411939288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okzEqVQU;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id cf42so49879100lfb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=63vgOUvfBL/bxxG6xIq1onp1STzF0yIisqwBMP9yvaY=;
        b=okzEqVQUsvsDRIBkXBLn+KVIa+VEEiBi9VGnwehTRP7k/nJ1uF/hgnxhDsZsUKQXlm
         LhXOFpqiO8issThTzdw/c/fJnNJj/2peLQOZGdkS/FBKOQd0Oh7HO7zvRN2PeY8760P3
         Cy3Egw0agmNpHKC1UgyZUGzoa8PO6kBamS8BvvEMQQx+pFpeMgEsZRrLiYfyhWQFEV8U
         yryOS3ePuILn0HGaLafPIi5vQ+x6ooq8VtcJY2bUxyVB7cf2vjf2Q014Dh5bUdUsIZDL
         91OL6CeAQ/2nw/8S2IONyE03jEHj3u58cWP1aFGrONUzqAZCazhe+FF/0g8NlTitwDbx
         gdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63vgOUvfBL/bxxG6xIq1onp1STzF0yIisqwBMP9yvaY=;
        b=SopvjM2fNo6ALfc65+5gpjfn9RFROINT5CT6pc/fnQYmqbxouWGwW+v11jN1qznFcI
         aq0A9lN2xPv9HOlLzDIHMDFVvzGod7H1wym3n4atOrDkFfn2Y42pOdCXyTJ18KSlK2eD
         im4KVDUpUMuyZsjVa0rThTLMd6eUAROMTYoKLlbzig0UrCq+UlKUK9Rpz4rNj7EBIVYa
         pIv/sQtnX3sTIIxFdhYxjY+I8L1+vzgXQugmIdiVKFqF7k8TSqjOxuvYnpCBzfAP8Bas
         xmsUQxDIRJFR2Duue3kDV6xdvo3uwF5gEVAhBMGgC42hwg6JTTC5Xcp70zwifRfBSfrI
         mivg==
X-Gm-Message-State: AFqh2kpqkSeC4Ac9pHNE28V6ND4aEMe0LfQF4AXs2LRSDp1mcbQ3oghP
	0ZQqUUMij5DukmgemxNsxhHv/zBjDWOQfshaHGk=
X-Google-Smtp-Source: AMrXdXuPUrl/XmXCd2Xk/oiverD0Glfh6xOQC2GRqcAc76H6sKwCUvdT7wIknoDcTVEtZ8LYD0Hq0m2lzaoVkKE3yFg=
X-Received: by 2002:ac2:568e:0:b0:4cb:4404:1bc3 with SMTP id
 14-20020ac2568e000000b004cb44041bc3mr137197lfr.263.1672830208524; Wed, 04 Jan
 2023 03:03:28 -0800 (PST)
MIME-Version: 1.0
References: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com> <4820194.31r3eYUQgx@n95hx1g2>
In-Reply-To: <4820194.31r3eYUQgx@n95hx1g2>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 12:03:16 +0100
Message-ID: <CANNYZj9yhjncXH7BpSYEaxrKF6s70GK71omvDCj_Hn0wub=VDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] boost: upgrade 1.80.0 -> 1.81.0
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-core@lists.openembedded.org, Wang Mingyu <wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175385

You should send respective patches to both mailing lists at the same
time, noting that one is dependent on the other.

Alex

On Wed, 4 Jan 2023 at 11:44, Christian Eggers <ceggers@arri.de> wrote:
>
> On Wednesday, 21 December 2022, 03:59:07 CET, wangmy@fujitsu.com wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > 0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
> > removed since it's included in 1.81.0
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../{boost-1.80.0.inc => boost-1.81.0.inc}    |  2 +-
> >  ...y-binary_function-base-classes-are-d.patch | 34 -------------------
> >  .../{boost_1.80.0.bb => boost_1.81.0.bb}      |  1 -
> >  3 files changed, 1 insertion(+), 36 deletions(-)
> >  rename meta/recipes-support/boost/{boost-1.80.0.inc => boost-1.81.0.inc} (90%)
> >  delete mode 100644 meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
> >  rename meta/recipes-support/boost/{boost_1.80.0.bb => boost_1.81.0.bb} (75%)
> >
> > diff --git a/meta/recipes-support/boost/boost-1.80.0.inc b/meta/recipes-support/boost/boost-1.81.0.inc
> > similarity index 90%
> > rename from meta/recipes-support/boost/boost-1.80.0.inc
> > rename to meta/recipes-support/boost/boost-1.81.0.inc
> > index 3ee82eb9b2..291796c736 100644
> > --- a/meta/recipes-support/boost/boost-1.80.0.inc
> > +++ b/meta/recipes-support/boost/boost-1.81.0.inc
> > @@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
> >  BOOST_P = "boost_${BOOST_VER}"
> >
> >  SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
> > -SRC_URI[sha256sum] = "1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0"
> > +SRC_URI[sha256sum] = "71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99fa"
> >
> >  UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
> >  UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
> > diff --git a/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch b/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
> > deleted file mode 100644
> > index 49603348ee..0000000000
> > --- a/meta/recipes-support/boost/boost/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From f9b55f5a1fab85bf73c95e6372779d6f50f75e84 Mon Sep 17 00:00:00 2001
> > -From: jzmaddock <john@johnmaddock.co.uk>
> > -Date: Mon, 11 Jul 2022 18:26:07 +0100
> > -Subject: [PATCH] The std lib unary/binary_function base classes are
> > - deprecated/removed from libcpp15. Fixes
> > - https://github.com/boostorg/container_hash/issues/24.
> > -
> > -Upstream-Status: Backport [https://github.com/boostorg/config/pull/440/commits/f0af4a9184457939b89110795ae2d293582c5f66]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - boost/config/stdlib/libcpp.hpp | 9 +++++++++
> > - 1 file changed, 9 insertions(+)
> > -
> > -diff --git a/boost/config/stdlib/libcpp.hpp b/boost/config/stdlib/libcpp.hpp
> > -index bc8536ead..0e9f2445e 100644
> > ---- a/boost/config/stdlib/libcpp.hpp
> > -+++ b/boost/config/stdlib/libcpp.hpp
> > -@@ -168,4 +168,13 @@
> > - #  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
> > - #endif
> > -
> > -+#if _LIBCPP_VERSION >= 15000
> > -+//
> > -+// Unary function is now deprecated in C++11 and later:
> > -+//
> > -+#if __cplusplus >= 201103L
> > -+#define BOOST_NO_CXX98_FUNCTION_BASE
> > -+#endif
> > -+#endif
> > -+
> > - //  --- end ---
> > ---
> > -2.37.2
> > -
> > diff --git a/meta/recipes-support/boost/boost_1.80.0.bb b/meta/recipes-support/boost/boost_1.81.0.bb
> > similarity index 75%
> > rename from meta/recipes-support/boost/boost_1.80.0.bb
> > rename to meta/recipes-support/boost/boost_1.81.0.bb
> > index c34ab7d703..4b580d078b 100644
> > --- a/meta/recipes-support/boost/boost_1.80.0.bb
> > +++ b/meta/recipes-support/boost/boost_1.81.0.bb
> > @@ -4,5 +4,4 @@ require boost.inc
> >  SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
> >             file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
> >             file://0001-dont-setup-compiler-flags-m32-m64.patch \
> > -           file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
> >             "
> >
>
> There is a new library (boost-url) in boost-1.81.0. So "url" should be added to BOOST_LIBS.
> Unfortunately this causes a conflict (sorry, I don't remember which type) with the standalone
> boost-url recipe in meta-openembedded (that recipe should be obsolete now).
>
> What is the correct procedure in this case? I guess that it's not possible to atomically remove
> the boost-url recipe from meta-openembedded and add "url" to BOOST_LIBS.
>
> regards
> Christian
>
>
>

