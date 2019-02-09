Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5AB6BBDE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 09:44:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y185so9022751wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CwVIRvQlSKmo6fQ481p52nU6xAp7dFlDZzcEfHlo+jM=;
	b=tmIiULOF8rVj1T6rFLPRWDH7jluC0tNVQjQ6qu3lI5GB8BoryjeJ99YdTQ+iPjz+ta
	Wct0n9PCgm2+YNk8gxBj+g6oBMgw/OW6yYa0ig1xy5p5DAUiVg4cbbUc6mc+w7K69SHF
	KVrLeOBzR9csPP7JNd7mpEzN3Cql8udv3yUVVjhiJqqueCwW0UKqUaBZ1hHCw3NVlo6i
	a+38KPZfZBwBK9q5YPJhV610KvcXHW2JNOQHO1bHfRsWs93V1x7WIdxwzYIbr1uMUd4E
	q0nbVbqk9UxPWO+skISa7bffV5om5Og76oo8rysW3Q8GYOSP8dyQIu5yWtPyXjTgTy88
	U9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CwVIRvQlSKmo6fQ481p52nU6xAp7dFlDZzcEfHlo+jM=;
	b=FfQ5iAFE8nglIy0fzSGjarPNIo5fiRpXWyC+8jvgijxdskHeX3cCZ4o9MZFoXLgmtp
	+8k8n+PO/fm0EXLlgx8FMYgnfQRTJZh6ushopstLACDP5XgQKeC1QtPqZsEKTUWIa7Xg
	DBGYWh/8TP/7QwRw6F7vLxDQBsKLNSw1KDE7mDCduAZzWgQnUxrgiXEbxDoyabFJ0k2v
	hWx8fLQGkoCsUsY9upZQAjJy97moWnFnnyT5aqr9dkmROtf9r22l+FYHQXWMcy4ShLgG
	uLTThREVktiV1vQQ6CmwF0tUqnP8fI6Mc/qeRxn3dHJEf828oSxMjwHUMlg9ZEcSx+4N
	EXNg==
X-Gm-Message-State: AHQUAua0RwDJ503alBb3dzDoPdI2nMLfwJxBGvWE3W3tcZT78gHRXZ+/
	AW/dA+/ognT/2ZoSR3CVlEI=
X-Google-Smtp-Source: AHgI3IZPkWF+6vct0N11rDWskwWd9W4vsJwybznNfFWQ6NeRETK4J3oDeAjT6H4/j3l7+/HuaRovrg==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr16793701wrw.131.1549705457466;
	Sat, 09 Feb 2019 01:44:17 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id j3sm5833529wmb.39.2019.02.09.01.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 09 Feb 2019 01:44:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 9 Feb 2019 10:44:19 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190209094419.GC2258@jama>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 09 Feb 2019 09:44:17 -0000
X-Groupsio-MsgNum: 121003
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2019 at 03:45:42PM +0100, Alexander Kanavin wrote:
> This component enables hardware-accelerated GL inside QEMU guests.
> For more information, see here:
>=20
> https://lwn.net/Articles/767970/
> https://www.collabora.com/news-and-blog/blog/2018/02/12/virtualizing-gpu-=
access/
> https://www.collabora.com/news-and-blog/blog/2018/05/09/gpu-virtualizatio=
n-update/
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../0001-vtest-add-missing-includes.patch     | 38 +++++++++++++++++++
>  .../virglrenderer/virglrenderer_git.bb        | 19 ++++++++++
>  3 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/000=
1-vtest-add-missing-includes.patch
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git=
=2Ebb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 122fdbcff4b..f7d43d20b7f 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -700,6 +700,7 @@ RECIPE_MAINTAINER_pn-util-macros =3D "Armin Kuster <a=
kuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-v86d =3D "Alexander Kanavin <alex.kanavin@gmail.com=
>"
>  RECIPE_MAINTAINER_pn-vala =3D "Alexander Kanavin <alex.kanavin@gmail.com=
>"
>  RECIPE_MAINTAINER_pn-valgrind =3D "Alexander Kanavin <alex.kanavin@gmail=
=2Ecom>"
> +RECIPE_MAINTAINER_pn-virglrenderer =3D "Alexander Kanavin <alex.kanavin@=
gmail.com>"
>  RECIPE_MAINTAINER_pn-volatile-binds =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-vte =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-vulkan =3D "Ross Burton <ross.burton@intel.com>"
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest=
-add-missing-includes.patch b/meta/recipes-graphics/virglrenderer/virglrend=
erer/0001-vtest-add-missing-includes.patch
> new file mode 100644
> index 00000000000..b565c48ee66
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-add-mi=
ssing-includes.patch
> @@ -0,0 +1,38 @@
> +From 05c5c5f43fbffb3317bd9da27d414890d2ef493c Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 18 Jan 2019 13:47:23 +0100
> +Subject: [PATCH] vtest: add missing includes
> +
> +This fixes build failures with musl C library
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglre=
nderer/merge_requests/125]
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
> +=20
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
> +=20
> + #include "util.h"
> + #include "vtest.h"
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb b/m=
eta/recipes-graphics/virglrenderer/virglrenderer_git.bb
> new file mode 100644
> index 00000000000..93fc35feb8d
> --- /dev/null
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "VirGL virtual OpenGL renderer"
> +HOMEPAGE =3D "https://virgil3d.github.io/"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc81c08eeefd9418fca8f88309a76d=
b10"
> +
> +DEPENDS =3D "libdrm mesa libepoxy"

Does it need to depend on mesa directly instead of one of virtual/*
providers?

It fails to build for targets which use different mesa, e.g. mesa-gl:

ERROR: Nothing PROVIDES 'mesa' (but /OE/build/luneos-master/webos-ports/ope=
nembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb DEP=
ENDS on or otherwise requires it)
mesa was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa-gl, not mesa
ERROR: Required build target 'virglrenderer' has no buildable providers.
Missing or unbuildable dependency chain was: ['virglrenderer', 'mesa']

Regards,

> +PV =3D "0.7.0"
> +SRCREV =3D "402c228861c9893f64cffbbcb4cb23044b8c721c"
> +SRC_URI =3D "git://anongit.freedesktop.org/virglrenderer \
> +           file://0001-vtest-add-missing-includes.patch \
> +           "
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXF6g8gAKCRA3VSO3ZXaA
HJWKAJ9ple7x1eTxZPp8YjXd5itqy1ZNQgCeOzyDVx+nkRq0RCa1oYg1xTVU968=
=/PuR
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
