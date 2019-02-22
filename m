Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id B0D1E7CB5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 19:11:38 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v62so2794004otb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 11:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YIZkNcp3xJ44j/D0AtCIuRksBHp90Vzrq2iRblgzS3M=;
	b=gZzxsfKqynhTnjBO2UQmd3X9D1xSPgvO9J8/Fxs5s5BaL8vrjTdxSRl8BMfbLvuf1f
	8ah6Z7T7kXFR360+BbIaW+v8s0xxyxJ/KJR5TYBLbHE8jmbbVK5o1qlnYl8hSd+AyiAb
	KX+QeMFSJbT3h8oasQKIoNPGoRs9Bub45Hv5ZfZZA0plz64LgtG322bBrd7Og/JA7U3V
	hEvDseqsxVISVEV4dCtadP9/Xqy5py+niAc6+6MX6u2tGwTfunlJ26z75jwGrI56+/7H
	pKVRQKxu1EUqTRDB0EmiEkuiTnYCZHtszdoDEgAiMmG2QHWZWHYz3FgElk53SekaFblj
	ay+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YIZkNcp3xJ44j/D0AtCIuRksBHp90Vzrq2iRblgzS3M=;
	b=ooLiGxBNonSc28v77n78x2qYhORySfS2/nt3p60kZamXqoEE4XgyJFmQ1B3t5JHBUi
	+yK9cTMuxQveGxFVwG4bpTRw81ghc5dfUtp5FJXjO7Ck7yV6FUKji8ds7DrjeVzRT39J
	owcvcuUSeH37gU+9QUzl0hOruLr6B0ueRTx9PHqW1v/jUi8RTpKe6qwUZYj6sYsk/Cx9
	cL3JL36s8QIdV74jTC1e0ACviSuGmBuCKbmaBsYyR2UeI8i8TSBeVbFcPHQWQfIHbEcR
	qTC8hR/DJlC7QBb/XvNDDkiXYqmPmfXWqYY+Jt5sC0ydRZZxavSBNjS8m1hbj/0jailT
	4Nyw==
X-Gm-Message-State: AHQUAuZwfiFCtFc0cyt0F4LNfcy6C8YgYNVfoY0D4t8codw30eWh9pUM
	gd5uN76wHwTLH1y8CWod5lJs2gTywzfYX+HlR0o=
X-Google-Smtp-Source: AHgI3IaS7vMyXfYC2MjmdfnB6tVYfuxEgW9PRs7T8kTYsju1OWTcNuvNZzeXvgUAasX28rngKbE/NCLqmUt9OutcNvY=
X-Received: by 2002:a9d:d0e:: with SMTP id 14mr3888659oti.360.1550862699340;
	Fri, 22 Feb 2019 11:11:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
	<CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
In-Reply-To: <CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 20:11:27 +0100
Message-ID: <CANNYZj8pxkyaYwp+Ob2ZzH=G2iA=F_E1PzOz-L4-q5LdC-C06g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Fri, 22 Feb 2019 19:11:38 -0000
Content-Type: text/plain; charset="UTF-8"

Probably this is the very first time virgl is built for mips :-)

Note that it is useful only if you intend to run qemu on that
platform, so I wonder if we could just blacklist it...

Alex

On Fri, 22 Feb 2019 at 19:54, Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/229902/
>
> mips/glibc
>
> On Fri, Feb 22, 2019 at 6:34 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This component enables hardware-accelerated GL inside QEMU guests.
> > For more information, see here:
> >
> > https://lwn.net/Articles/767970/
> > https://www.collabora.com/news-and-blog/blog/2018/02/12/virtualizing-gpu-access/
> > https://www.collabora.com/news-and-blog/blog/2018/05/09/gpu-virtualization-update/
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  ...efile.am-explicitly-link-with-libdrm.patch | 31 +++++++++++++++
> >  .../0001-vtest-add-missing-includes.patch     | 38 +++++++++++++++++++
> >  .../virglrenderer/virglrenderer_0.7.0.bb      | 19 ++++++++++
> >  4 files changed, 89 insertions(+)
> >  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
> >  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
> >  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 4e3fc103afc..f5e6343904b 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -700,6 +700,7 @@ RECIPE_MAINTAINER_pn-util-macros = "Armin Kuster <akuster808@gmail.com>"
> >  RECIPE_MAINTAINER_pn-v86d = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-vala = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-valgrind = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > +RECIPE_MAINTAINER_pn-virglrenderer = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER_pn-vulkan = "Ross Burton <ross.burton@intel.com>"
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
> > new file mode 100644
> > index 00000000000..aa8d814845e
> > --- /dev/null
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
> > @@ -0,0 +1,31 @@
> > +From d61f7073b8ce159d21811b291c22b273b040c330 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Tue, 12 Feb 2019 12:04:52 +0100
> > +Subject: [PATCH] Makefile.am: explicitly link with libdrm
> > +
> > +Otherwise, a failure happens with gold linker:
> > +
> > +../src/.libs/libvirglrenderer.so: error: undefined reference to 'drmPrimeHandleToFD'
> > +
> > +https://errors.yoctoproject.org/Errors/Details/222046/
> > +
> > +Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/153]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + src/Makefile.am | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/src/Makefile.am b/src/Makefile.am
> > +index 9a0a44e..9b668c8 100644
> > +--- a/src/Makefile.am
> > ++++ b/src/Makefile.am
> > +@@ -1,5 +1,6 @@
> > + SUBDIRS := gallium/auxiliary
> > + AM_LDFLAGS = -lm \
> > ++      $(LIBDRM_LIBS) \
> > +       $(GBM_LIBS) \
> > +       $(EPOXY_LIBS) \
> > +       $(X11_LIBS) \
> > +--
> > +2.17.1
> > +
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
> > new file mode 100644
> > index 00000000000..2b4ffa932de
> > --- /dev/null
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
> > @@ -0,0 +1,38 @@
> > +From 05c5c5f43fbffb3317bd9da27d414890d2ef493c Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Fri, 18 Jan 2019 13:47:23 +0100
> > +Subject: [PATCH] vtest: add missing includes
> > +
> > +This fixes build failures with musl C library
> > +
> > +Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/125]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + vtest/util.c         | 1 +
> > + vtest/vtest_server.c | 1 +
> > + 2 files changed, 2 insertions(+)
> > +
> > +diff --git a/vtest/util.c b/vtest/util.c
> > +index 0d3c78f..c605253 100644
> > +--- a/vtest/util.c
> > ++++ b/vtest/util.c
> > +@@ -26,6 +26,7 @@
> > + #include <stdio.h>
> > + #include <string.h>
> > + #include <unistd.h>
> > ++#include <sys/select.h>
> > +
> > + int vtest_wait_for_fd_read(int fd)
> > + {
> > +diff --git a/vtest/vtest_server.c b/vtest/vtest_server.c
> > +index bc6c95f..010721f 100644
> > +--- a/vtest/vtest_server.c
> > ++++ b/vtest/vtest_server.c
> > +@@ -31,6 +31,7 @@
> > + #include <netinet/in.h>
> > + #include <sys/un.h>
> > + #include <fcntl.h>
> > ++#include <string.h>
> > +
> > + #include "util.h"
> > + #include "vtest.h"
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> > new file mode 100644
> > index 00000000000..500ed4f2d8b
> > --- /dev/null
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "VirGL virtual OpenGL renderer"
> > +HOMEPAGE = "https://virgil3d.github.io/"
> > +
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
> > +
> > +DEPENDS = "libdrm mesa libepoxy"
> > +SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
> > +SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
> > +           file://0001-vtest-add-missing-includes.patch \
> > +           file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
> > +           "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools pkgconfig
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

