Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9227CC0E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 18:54:37 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x6so1764719qki.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 10:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5o/K2s7kKTWxakrRePe9vuwqYG2h+K35V+5FrKEi3UU=;
	b=KZh/FQh46tdeZWJmfcYdBn2nz+ytrFWeiwh64tTCJR+8dOBMScJLHmY0MxR5ThFUjU
	dQ6hVKOLHJOjz+VXKxNjqUxcw45HIs7d4wmmP/jdqsBZgKR+E0dYK07UEjt94Ih7W2a/
	Chg504ASmhs+8A3BBoMRF23QjYP2pZ66VNTA4690ucO/HTATnywwn/8Lx+ITehvzmDir
	Eod/w1BJKe0V5iwzVNO9khDNezEpYhrBnfmc0dxQ7eSXwOrku+P1pESbCOPXhYEilfS+
	0pBWubEps8EZUNG6l0RGNNfB4tkag+u0stscPEkmQ4fHwh0bAu8hq0iDQiKBZ0rCSFA8
	bVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5o/K2s7kKTWxakrRePe9vuwqYG2h+K35V+5FrKEi3UU=;
	b=RyEakxZAeVNyH5TNZ0cuhiu5N1zRCBFmC4LKXRjqggkLcvpd0C5gm8PGpqpyXwNKGY
	xXMCu/Y0/MdhNZHPO8FDHZMkLYfj036X8aqPfwgY9RslOJno4gj09jmxpxM8Ublie3xR
	kcgEckdNT6wolXVUxulPpP0saGvkfWFe2BV/WktCqJvJz7RRF2sffBuidYdsRYy61823
	japFBm5rijw+efQLwSdmpfRM3T2Nm9VZZGuR8JrV+4yf2mW7C3HSe8sYLDfoUVJVlozz
	9eZRu5Y4MfjGd5eo7x2Byj5AZl2SEr3KncpeSQugfPsobNwU+DzyHvu0HvkewpXCPtfH
	bcdA==
X-Gm-Message-State: AHQUAuZuGy0/sUyHatMmEGyvFSlCIQ7lPEiwWOoYdNqIi7CxEZT35niF
	whCaKgfZDgYDESCYRGI8CCALnt81z3SBRNpPy+A=
X-Google-Smtp-Source: AHgI3Ib2zQ6lzGDE7uKZc1w4fn0hGKqdz9AFUTO2eRDroUKwKDf9bgbLaPSkKvNVRLRTvQTORMjM5ziEkFBn/42CCFk=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr3998552qkd.223.1550861678660; 
	Fri, 22 Feb 2019 10:54:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
In-Reply-To: <bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Feb 2019 10:54:12 -0800
Message-ID: <CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Fri, 22 Feb 2019 18:54:38 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/229902/

mips/glibc

On Fri, Feb 22, 2019 at 6:34 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This component enables hardware-accelerated GL inside QEMU guests.
> For more information, see here:
>
> https://lwn.net/Articles/767970/
> https://www.collabora.com/news-and-blog/blog/2018/02/12/virtualizing-gpu-access/
> https://www.collabora.com/news-and-blog/blog/2018/05/09/gpu-virtualization-update/
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  ...efile.am-explicitly-link-with-libdrm.patch | 31 +++++++++++++++
>  .../0001-vtest-add-missing-includes.patch     | 38 +++++++++++++++++++
>  .../virglrenderer/virglrenderer_0.7.0.bb      | 19 ++++++++++
>  4 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 4e3fc103afc..f5e6343904b 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -700,6 +700,7 @@ RECIPE_MAINTAINER_pn-util-macros = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-v86d = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-vala = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-valgrind = "Alexander Kanavin <alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER_pn-virglrenderer = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-vulkan = "Ross Burton <ross.burton@intel.com>"
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
> new file mode 100644
> index 00000000000..aa8d814845e
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Makefile.am-explicitly-link-with-libdrm.patch
> @@ -0,0 +1,31 @@
> +From d61f7073b8ce159d21811b291c22b273b040c330 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 12 Feb 2019 12:04:52 +0100
> +Subject: [PATCH] Makefile.am: explicitly link with libdrm
> +
> +Otherwise, a failure happens with gold linker:
> +
> +../src/.libs/libvirglrenderer.so: error: undefined reference to 'drmPrimeHandleToFD'
> +
> +https://errors.yoctoproject.org/Errors/Details/222046/
> +
> +Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/153]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 9a0a44e..9b668c8 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -1,5 +1,6 @@
> + SUBDIRS := gallium/auxiliary
> + AM_LDFLAGS = -lm \
> ++      $(LIBDRM_LIBS) \
> +       $(GBM_LIBS) \
> +       $(EPOXY_LIBS) \
> +       $(X11_LIBS) \
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
> new file mode 100644
> index 00000000000..2b4ffa932de
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-missing-includes.patch
> @@ -0,0 +1,38 @@
> +From 05c5c5f43fbffb3317bd9da27d414890d2ef493c Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 18 Jan 2019 13:47:23 +0100
> +Subject: [PATCH] vtest: add missing includes
> +
> +This fixes build failures with musl C library
> +
> +Upstream-Status: Accepted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/125]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + vtest/util.c         | 1 +
> + vtest/vtest_server.c | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/vtest/util.c b/vtest/util.c
> +index 0d3c78f..c605253 100644
> +--- a/vtest/util.c
> ++++ b/vtest/util.c
> +@@ -26,6 +26,7 @@
> + #include <stdio.h>
> + #include <string.h>
> + #include <unistd.h>
> ++#include <sys/select.h>
> +
> + int vtest_wait_for_fd_read(int fd)
> + {
> +diff --git a/vtest/vtest_server.c b/vtest/vtest_server.c
> +index bc6c95f..010721f 100644
> +--- a/vtest/vtest_server.c
> ++++ b/vtest/vtest_server.c
> +@@ -31,6 +31,7 @@
> + #include <netinet/in.h>
> + #include <sys/un.h>
> + #include <fcntl.h>
> ++#include <string.h>
> +
> + #include "util.h"
> + #include "vtest.h"
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> new file mode 100644
> index 00000000000..500ed4f2d8b
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "VirGL virtual OpenGL renderer"
> +HOMEPAGE = "https://virgil3d.github.io/"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
> +
> +DEPENDS = "libdrm mesa libepoxy"
> +SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
> +SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
> +           file://0001-vtest-add-missing-includes.patch \
> +           file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

