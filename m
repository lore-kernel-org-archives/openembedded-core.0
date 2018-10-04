Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C5A76751D2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 23:03:43 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id u34-v6so11919351qth.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ODoDE8qNcllk5HHzeLVq/XJ79IaTsR/rsI0X4b23tg0=;
	b=DQzhIKb9B7e9Zf4Y0+BNkGJ9XJD8sA3/tdgMGZqT9V84F5H2Xazm7tQV/GL5Geuk0P
	PRQRDI50a9iemhVmawcU6g0NATbU7ctO8ZkMrANWJBU60X65Va7dnyF2ZoLONMl2SwCy
	O2itVWxd109bhH+drxPof5fibFvH9H660vasdgs6y5oT6tHmaeGgt3pTnUSOnWcw682D
	fGw7QaqZ4E1i0sqdVkJkseyudX76zNAl1Zb2dfKuXSTtujz6UtlNfTAJVONRJojaUrs4
	YrTYVWRlcG6OnqH7lahSKfTKz6XCYre4MStsiQpffoEIuIFMitytlZBFD+ahqzdy8wkm
	48lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ODoDE8qNcllk5HHzeLVq/XJ79IaTsR/rsI0X4b23tg0=;
	b=V/guFFCDL7DuYiPqohOKznfF4sTVB03C1PbZINZQd86kgBZsl1es5zBK+z/eWhyU8W
	AeHXAFVb4YYKvzEL297XVY/oMqCYfLUEDAw34U2j232ycLG1qXRV6abV3g9u0CLUNofD
	ZdzsNsNGRpxFYzZP7cbGk58qwDj6PL76bHQ/u9sfAIlv1KUg+tQ7mXQUCu4zRxLNVD4d
	C6j1MbCQ1t/Tk5eMnfR6e56leEeXMpREQTIXhXDUUozaBWlHv0collKV74HocX2sxfMc
	hNA6aigKyxynBfENU8lMgXPkxjQ/ljT/xMf1EccwMhnhqVNxyQpNXWw2ewV+/VVAb3gA
	EOnw==
X-Gm-Message-State: ABuFfoispI011+4OdW9DkJTKn3J0g+KgxHblVp27HUSkM9hWI5gb3BaK
	ILtxUVh+TigeqCUKTJk4Nr7S4ZVjJHazonGtZR4=
X-Google-Smtp-Source: ACcGV61mFFkFczSYHJ5RJWRdNK2dXdfHvcSjMWEj7zlYcDw+atfw9ay71tuOXkjOpd+WLhc6OzaZSvFFLJptUyXV5yg=
X-Received: by 2002:a0c:9c42:: with SMTP id
	w2-v6mr7257121qve.194.1538694224550; 
	Thu, 04 Oct 2018 16:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20181004152419.27370-1-pascal.bach@siemens.com>
In-Reply-To: <20181004152419.27370-1-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2018 16:03:17 -0700
Message-ID: <CAMKF1soAsTH6VFg9rE0rPRLoFQ16KdVxyU4xTGapArJgO-WxAQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] piglit: correctly find wayland include dirs
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
X-List-Received-Date: Thu, 04 Oct 2018 23:03:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 4, 2018 at 8:24 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> Builds include host /usr/include as the wrong wayland variable was used.
> The issue only surfaces if CMAKE_SYSROOT is properly set.
>


this seems fine

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  ...-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 32 ++++++++++++++++++++++
>  meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
>
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
> new file mode 100644
> index 0000000000..5d6ec368ba
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
> @@ -0,0 +1,32 @@
> +From 3bf1beee1ddd19bc536ff2856e04ac269d43daa2 Mon Sep 17 00:00:00 2001
> +From: Pascal Bach <pascal.bach@siemens.com>
> +Date: Thu, 4 Oct 2018 14:43:17 +0200
> +Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
> +
> +WAYLAND_wayland-client_INCLUDEDIR is an internal variable and is not correctly
> +set when cross compiling. WAYLAND_INCLUDE_DIRS includes the correct path even
> +when cross compiling.
> +
> +Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> +
> +Upstream-Status: Submitted [piglit@lists.freedesktop.org]
> +---
> + tests/util/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
> +index a5f080156..a303a9f58 100644
> +--- a/tests/util/CMakeLists.txt
> ++++ b/tests/util/CMakeLists.txt
> +@@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
> +                       piglit-framework-gl/piglit_wl_framework.c
> +               )
> +               list(APPEND UTIL_GL_INCLUDES
> +-                      ${WAYLAND_wayland-client_INCLUDEDIR}
> ++                      ${WAYLAND_INCLUDE_DIRS}
> +               )
> +       endif()
> +       if(PIGLIT_HAS_X11)
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index df810a33b4..3292d4cad0 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
>  SRC_URI = "git://anongit.freedesktop.org/piglit \
>             file://0001-cmake-install-bash-completions-in-the-right-place.patch \
>             file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
> +           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
>             "
>  UPSTREAM_CHECK_COMMITS = "1"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

