Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFA06C5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 22:29:40 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id p17so19600454qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 14:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AxbnGLku7vSGmX0vcAB8fUtI8teTpQyPy8P6AjtQ7Kc=;
	b=nqIxP+8StYAy0oVnYhZqFW9RFgDCNEvwtjm8LWtbo/RXKIX+zMf/9V6Fh/iRuV2XTB
	3MMiA2BHzIzrZ7GzJMr7ngHmyocn/dirzOsBlla1vIRyZCtCIzGheoAiv2K04Zghp4Ty
	s+Q9FZkQjVG3d8wkMwTDAZiaJPE6IyjAka26yJi8CgMTxVOkGEDQPp/HL/b8Peirp9Nh
	6l+OA276OnC+lvRbu6GSk1fJ7sdJahaFEVDHw+PdIfiMMVt7s+sADhZ+kUjGb9UczndC
	9BlmBabJ4kTFHqcxHB3EMTKTLQCHwMeL+FuTWJ+AUzCAZ0pn4Epu7Gmm92c+gaFcIvep
	WEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AxbnGLku7vSGmX0vcAB8fUtI8teTpQyPy8P6AjtQ7Kc=;
	b=ESzBhcoNrk66kfee/4enOW0hnl3gcs81QnscTRCAmQxA9M/Ip7rarUY2P0HwImPOLN
	BvDXmHJZ/gwlLptBC6Dg+VdalBAjcIw6p29CORSVsKsAqfI3X9GOqGQCoW1lb4MozBEW
	CHblo/kRpyg5vI1BTybRZJtzNkugQlVX97P9ryH7E0CApDTyrEB3VwV8SBl060oUKkZs
	9KUBFKjjjTHs5VqXjrkhjqj4iQ1RY2/7I/o/PMfAofIrUPoBm10SQs8Qon+P8mbrzwf5
	37lvt5B7z/oAKGgPZZOWy9MJE62J0HKIOS9+HXebSIjm+Qk6UqQbxIzxOeUqPMY7NMip
	2SIg==
X-Gm-Message-State: AA+aEWYRGotlpTNlLlRZYzD5vACPVLj1rU8sdkdoIlexUsrcADUy6u3U
	YhUrXhm1BCrujPs3/fqjRm9FWbnFnLnSPZTF2gc=
X-Google-Smtp-Source: AFSGD/WZ3ERU/U5muQ5Ru37xQA8vBAw3jiu0DZA/FmvrOscjf+GOXiR7x3Zmr1gNX/71Y7Ci4e2NTn1V1hTyd+Jf7jw=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr27670886qvd.224.1543271381118;
	Mon, 26 Nov 2018 14:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 14:29:14 -0800
Message-ID: <CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Mon, 26 Nov 2018 22:29:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2018 at 7:42 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Also, change default meson option to building introspection files
> (previously they were not built by default).
>

I wonder if this is causing

http://errors.yoctoproject.org/Errors/Details/202291/
http://errors.yoctoproject.org/Errors/Details/202280/

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...0001-Port-cross-compilation-support-to-meson.patch | 11 ++++++-----
>  ...e-the-repository-directory-for-native-builds.patch |  2 +-
>  ...tion_1.58.0.bb =3D> gobject-introspection_1.58.1.bb} |  4 ++--
>  3 files changed, 9 insertions(+), 8 deletions(-)
>  rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1=
.58.0.bb =3D> gobject-introspection_1.58.1.bb} (98%)
>
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/=
gobject-introspection/gobject-introspection/0001-Port-cross-compilation-sup=
port-to-meson.patch
> index b0eee1ebe5b..63b02fe0f3d 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Port-cross-compilation-support-to-meson.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Port-cross-compilation-support-to-meson.patch
> @@ -1,10 +1,11 @@
> -From e8ce42c5cb54847517fe8fbe50bbaea452618218 Mon Sep 17 00:00:00 2001
> +From fabf8c505181636182a357e0c6e764b752ccf468 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 15 Nov 2018 15:10:05 +0100
>  Subject: [PATCH] Port cross-compilation support to meson
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   gir/meson.build   | 59 ++++++++++++++++++++++++++++++++++-------------
>   meson.build       |  4 +++-
> @@ -12,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   3 files changed, 66 insertions(+), 17 deletions(-)
>
>  diff --git a/gir/meson.build b/gir/meson.build
> -index 607bbc4..c0e221b 100644
> +index 607bbc45..c0e221b3 100644
>  --- a/gir/meson.build
>  +++ b/gir/meson.build
>  @@ -37,15 +37,27 @@ typelibdir =3D join_paths(get_option('libdir'), 'gir=
epository-1.0')
> @@ -115,7 +116,7 @@ index 607bbc4..c0e221b 100644
>       install_dir: typelibdir,
>     )
>  diff --git a/meson.build b/meson.build
> -index 7ec9532..9e20da5 100644
> +index 7ec95328..9e20da57 100644
>  --- a/meson.build
>  +++ b/meson.build
>  @@ -76,7 +76,9 @@ libffi_dep =3D dependency('libffi',
> @@ -130,7 +131,7 @@ index 7ec9532..9e20da5 100644
>   subdir('docs')
>   subdir('tests')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 49726be..3e17c78 100644
> +index 49726be6..d557a3b6 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -21,3 +21,23 @@ option('cairo-libname', type: 'string',
> @@ -150,7 +151,7 @@ index 49726be..3e17c78 100644
>  +  description: 'Use a ldd wrapper instead of system ldd command in gisc=
anner (useful when cross-compiling)'
>  +)
>  +
> -+option('enable-introspection-data', type: 'boolean', value : false,
> ++option('enable-introspection-data', type: 'boolean', value : true,
>  +  description: 'Build introspection data (.gir and .typelib files) in a=
ddition to library and tools'
>  +)
>  +
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/re=
cipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-r=
epository-directory-for-native-builds.patch
> index b9754a96c22..17b9eac057c 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Relocate-the-repository-directory-for-native-builds.patch
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001=
-Relocate-the-repository-directory-for-native-builds.patch
> @@ -1,4 +1,4 @@
> -From 2e2bf063ab79ddff1c284834aef8e22710db9350 Mon Sep 17 00:00:00 2001
> +From a20b4d70f44449875b7c54750ab0f02eefb0870d Mon Sep 17 00:00:00 2001
>  From: Sascha Silbe <x-yo17@se-silbe.de>
>  Date: Fri, 8 Jun 2018 13:55:10 +0200
>  Subject: [PATCH] Relocate the repository directory for native builds
> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.58.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.58.1.bb
> similarity index 98%
> rename from meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n_1.58.0.bb
> rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_=
1.58.1.bb
> index c9a0d816f5e..66f99185389 100644
> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58=
.0.bb
> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58=
.1.bb
> @@ -22,8 +22,8 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_ve=
rsion("${PV}", 2)}/${BPN}-$
>             file://0001-Port-cross-compilation-support-to-meson.patch \
>             "
>
> -SRC_URI[md5sum] =3D "94fec875276262037bfcd51226db12fe"
> -SRC_URI[sha256sum] =3D "27c1590a32749de0a5481ce897772547043e94bccba4bc0a=
7edb3d8513e401ec"
> +SRC_URI[md5sum] =3D "101b04fb0184f9a0c718d450c056d68c"
> +SRC_URI[sha256sum] =3D "4954681fa5c5ed95451d914de89de1263a5b35158b1ded1a=
8b870042c0d0df89"
>
>  SRC_URI_append_class-native =3D " file://0001-Relocate-the-repository-di=
rectory-for-native-builds.patch"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

