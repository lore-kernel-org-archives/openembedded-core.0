Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96F1EB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 04:25:47 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.602.1690431939737817395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 21:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GL2Z1QI3;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b974031aeaso7404321fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 21:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690431938; x=1691036738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ml84jMJSQOutKgkR0FMhAGC5Ys1DM+9AoYuRYyBR8QE=;
        b=GL2Z1QI3k25JhUHmt68I0zU4kLtt8i6qJxcdUn9h2vZ3WzuoIjzRsKu+Pe+K+YdNFH
         IzTTeWHneV45CNr9eAYdG9HBPl7CNwkiPZ8JIaXNAmzepOLSjmMNByifq/v/xwBZOcxe
         9ytCj3nv8Lx3srOb7QeDwk18pN2rBRHNwwRBwaUfU93OTB5d9LTOXPquGFPR4BCnoFwH
         FnooMs4/1b/7S+uecZflcjE93sPlDhhAgtKqqYUtyJHzx7BIHYeEJ5nwdZuQ2KcuTq9D
         bu+BkRsWQQjXcXqZrZg+pd4XnpFVhZs0vHUK2C35XWhcGkpBvIMwVL9t0z6LZx/zFQ8+
         8P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690431938; x=1691036738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ml84jMJSQOutKgkR0FMhAGC5Ys1DM+9AoYuRYyBR8QE=;
        b=XDg0T+AtfnNdpwSOQd6qSjJI364ngn1CAWunpITeQ5iPOA+eQJ/SAbRHdE9+V0kqwJ
         v1ETU68lMn76eLlL8pmwLtzDE0/K5v0ti2ECoHuNE/gcHZBj15iHnmsnxyNN2Ly2q7qV
         zX1E6sqYMbTZ80tvoyCYF2pUZHr7Ye2qc5CxJnVK8w4wp4Js02MiDgjuTYt+27teQCIQ
         2P8wRr0TIK6gzYco3WeMnDFp6pPQQHdHL/+wwX8fH1wp9xQL+dAc/B9qXJCnD6KCzdPv
         ItjvMj/XT+IjkJoKc95filJcrJ1GtKOU7yQTx1cC2vWrPDwcJ4yDGABkmurzTthAmZMD
         QEcg==
X-Gm-Message-State: ABy/qLYAPtIHtGRhZLxhQZG68LPUwFzfbyBy/h7u6cZUoSngLnagCcVJ
	PftgaLRTOp+iOgoTlhuG4zQp9hZDH/0XaQjdnJ8=
X-Google-Smtp-Source: APBJJlHUzZINf8JdZMHPwVJuzgARkESH34hl9Hbg+UlKyxZHdE7VDJgoYeIKfLOT3ziO8CBKOovjQHufMd+jvmSJOGk=
X-Received: by 2002:a2e:3204:0:b0:2b6:e8a0:a7f8 with SMTP id
 y4-20020a2e3204000000b002b6e8a0a7f8mr769003ljy.31.1690431937446; Wed, 26 Jul
 2023 21:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230727022539.2478131-1-Qi.Chen@windriver.com>
In-Reply-To: <20230727022539.2478131-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jul 2023 06:25:26 +0200
Message-ID: <CANNYZj9HjzzNk1DhAdgBv9CVhsHMrDu6hFmTc54c-xPGQdBDTg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ncurses: upgrade to 6.4+20230625
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 04:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184907

6.4+20230625 is a development snapshot, and not an actual stable
release. We used to take them but that was due to misunderstanding
about ncurses version policy. Is there a particular reason to move to
it?

Alex

On Thu, 27 Jul 2023 at 04:25, Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The license checksum is updated because of the year change, the license
> itself remains the same.
>
> The exit_prototype.patch is refreshed to avoid patch fuzz error.
>
> The repo is switched back to salsa.debian.org. It was switch from
> salsa.debian.org to github mirror because, according to the commit
> message, the github mirror was updated on a daily basis. But things
> have changed and the github mirror hasn't been updated for months.
> So switch back to use salsa.debian.org.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/ncurses/files/exit_prototype.patch | 10 +++++-----
>  meta/recipes-core/ncurses/ncurses.inc                |  4 ++--
>  meta/recipes-core/ncurses/ncurses_6.4.bb             |  3 ++-
>  3 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/=
recipes-core/ncurses/files/exit_prototype.patch
> index fd961512e0..9dddbbccf4 100644
> --- a/meta/recipes-core/ncurses/files/exit_prototype.patch
> +++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
> @@ -1,4 +1,4 @@
> -From 4a769a441d7e57a23017c3037cde3e53fb9f35fe Mon Sep 17 00:00:00 2001
> +From bc917b9bae0b11b02aa0ddd9ed62d9cd78ffc4f7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 30 Aug 2022 15:58:32 -0700
>  Subject: [PATCH] Add needed headers for including mbstate_t and exit()
> @@ -11,18 +11,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/configure b/configure
> -index f377f551..163f8899 100755
> +index c2462f7f..33668cf0 100755
>  --- a/configure
>  +++ b/configure
> -@@ -3423,6 +3423,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
> +@@ -3458,6 +3458,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
>     cat >"conftest.$ac_ext" <<_ACEOF
> - #line 3424 "configure"
> + #line 3459 "configure"
>   #include "confdefs.h"
>  +#include <stdlib.h>
>   $ac_declaration
>   int
>   main (void)
> -@@ -13111,6 +13112,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
> +@@ -13526,6 +13527,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
>   #include <stdlib.h>
>   #include <stdarg.h>
>   #include <stdio.h>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 367f3b19f4..78d6f2619c 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "The New Curses library"
>  DESCRIPTION =3D "SVr4 and XSI-Curses compatible curses library and termi=
nfo tools including tic, infocmp, captoinfo. Supports color, multiple highl=
ights, forms-drawing characters, and automatic recognition of keypad and fu=
nction-key sequences. Extensions include resizable windows and mouse suppor=
t on both xterm and Linux console using the gpm library."
>  HOMEPAGE =3D "http://www.gnu.org/software/ncurses/ncurses.html"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5a4600fdef86384c41ca33ecc70a=
4b8;endline=3D27"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f2e5b99d5b6c0e6ee7cb39b99273=
3b6;endline=3D27"
>  SECTION =3D "libs"
>  DEPENDS =3D "ncurses-native"
>  DEPENDS:class-native =3D ""
> @@ -13,7 +13,7 @@ BINCONFIG =3D "${bindir}/ncurses5-config ${bindir}/ncur=
sesw5-config \
>  inherit autotools binconfig-disabled multilib_header pkgconfig
>
>  # Upstream has useful patches at times at ftp://invisible-island.net/ncu=
rses/
> -SRC_URI =3D "git://github.com/mirror/ncurses.git;protocol=3Dhttps;branch=
=3Dmaster"
> +SRC_URI =3D "git://salsa.debian.org/debian/ncurses.git;protocol=3Dhttps;=
branch=3Dmaster"
>
>  EXTRA_AUTORECONF =3D "-I m4"
>
> diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core=
/ncurses/ncurses_6.4.bb
> index 1eb15673d1..b875aee250 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.4.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
> @@ -6,7 +6,8 @@ SRC_URI +=3D "file://0001-tic-hang.patch \
>             file://exit_prototype.patch \
>             "
>  # commit id corresponds to the revision in package version
> -SRCREV =3D "79b9071f2be20a24c7be031655a5638f6032f29f"
> +SRCREV =3D "964ec9f9c6e3ac3aaa1a9161c6fb75f6d7f589b5"
> +PV =3D "6.4+20230625"
>  S =3D "${WORKDIR}/git"
>  EXTRA_OECONF +=3D "--with-abi-version=3D5"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)$"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184904): https://lists.openembedded.org/g/openembedde=
d-core/message/184904
> Mute This Topic: https://lists.openembedded.org/mt/100383999/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

