Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id A401C7A478
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 11:12:08 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id m11-v6so10816344oic.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2018 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0jFsEgKE43gug6vz7RWkNUwBDJ0w5e4HkmIT2M3HbJw=;
	b=AOXYY33uYu1vQNHpeY2nkuetmjxNLMiXCU32R3aV5mz3jaCs4ri+URWrBcFz/773c+
	3bB7DQg10N2xlH6ZfBV0pgyYsmB/YCjFFIzclxDVK7l7WXCHnpnaTp7e23w7KkmXFDB6
	PNqjfrdyxbVqzyufpd9VPBl5srwz5JuMlTQ8pJASDHz0q66hBGvvzYMACRQSezfko4wO
	iVg/5aYRxqz29ZRFIDs+TUhKdxG88Yp42DMZfsIyMP0iwIC9vvbGmjOsiZkZqdgVD1Gw
	bkhwmxbMBlnkeEXuMc5vVCPeCiKrATzDgWLRlqKzW0NWS6HB0feLtrTmoUUnvEfKzB2R
	O/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0jFsEgKE43gug6vz7RWkNUwBDJ0w5e4HkmIT2M3HbJw=;
	b=dU7KaORM0uu8KOGXj+PDN8conT6pecjDYuyzBprVfFt8X5ACnHY0bYmxuQmYayYmjw
	aPnZ6qT4xZZZ6ocitQdBDiLzPKsVFtyOnU4nUQZLjo1KTfMd5727Lem3c8T5Ff/kqg/S
	3IJp2CYl1RTyXGLlMPFtiDqVoalQ1/ZyecWv3wuUV9lJ6cwWTFhme5pImYh3hJMIP9Kq
	U7NsAmiCiI5puoK9wcnoAOy8oSKLcLhENI43s8w+II04MeI2BQA390UYcNrIiCK9fcxu
	xA8AGZji2AEduM2kni/LrJFRfZnvPZWghGRpjZcKHRcY1olK+HVdvzGSauOnMvRGz9Bf
	bECA==
X-Gm-Message-State: ABuFfohBg1k0XkNwFQ/qOEc3F2IgdLCsQZiYcI59G1n0yISQT3VmZuQz
	yTdaTfgkqDcg/PBOieGVxq+16HSuhviHwxwIIN18hGMshJc=
X-Google-Smtp-Source: ACcGV62xuB1yoBNcPBNM1lYNYUQLnNvcDg0m3WvcB3bHaQ2OJy3pcvZT95UagNP2LRzB3iMBSE9In3wa/slpEMcmAJg=
X-Received: by 2002:aca:68ce:: with SMTP id
	o75-v6mr3747808oik.44.1538392329574; 
	Mon, 01 Oct 2018 04:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538212391.git.Qi.Chen@windriver.com>
	<f12369511c63689b4fb363d6c49907c8593d4608.1538212391.git.Qi.Chen@windriver.com>
In-Reply-To: <f12369511c63689b4fb363d6c49907c8593d4608.1538212391.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Oct 2018 12:11:58 +0100
Message-ID: <CAJTo0LYXgzCoL87B=gv6z5FmHNTfV2AOXkSTUnte0ai2wCri9Q@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] webkitgtk: fix to build without opengl
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
X-List-Received-Date: Mon, 01 Oct 2018 11:12:08 -0000
Content-Type: text/plain; charset="UTF-8"

From the libepoxy web site:

"Epoxy is a library for handling OpenGL function pointer management for you"

libepoxy is essentially a glorified wrapper around dlopen()/dlsym().
Are you simply moving the failure from build time to run time?
libepoxy should be pulling in a GL implementation because that's what
it does.

Ross
On Sat, 29 Sep 2018 at 10:34, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Currently, webkitgtk cannot be built if 'opengl' is not in distro
> feature. The error message is like below:
>
>   OpenGLShims.h:23:10: fatal error: GL/gl.h: No such file or directory
>
> The required distro feature for webkitgtk is only 'x11'.
>
> From its source codes, libepoxy is an alternative option to build webkitgtk.
> So fix to use it. In this way, we can successfully build out
> webkitgtk if 'opengl' is not in distro features.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../0001-fix-to-build-with-libepoxy.patch          | 35 ++++++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.20.5.bb       |  4 ++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch b/meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch
> new file mode 100644
> index 0000000..72ccef4
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-fix-to-build-with-libepoxy.patch
> @@ -0,0 +1,35 @@
> +From 59c04daa31f8083bf4eff8304b13f34dd79d00a3 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Sat, 29 Sep 2018 16:32:57 +0800
> +Subject: [PATCH] fix to build with libepoxy
> +
> +In source codes, there are places checking USE(LIBEPOXY), but
> +in cmake files, there's nowhere to handle it.
> +
> +Fix to define USE_LIBEPOXY to 1 if ENABLE_LIBEPOXY is turned on.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Source/cmake/OptionsGTK.cmake | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
> +index 386fa1d..6e86257 100644
> +--- a/Source/cmake/OptionsGTK.cmake
> ++++ b/Source/cmake/OptionsGTK.cmake
> +@@ -240,6 +240,10 @@ endif ()
> +
> + SET_AND_EXPOSE_TO_BUILD(USE_TEXTURE_MAPPER TRUE)
> +
> ++if (ENABLE_LIBEPOXY)
> ++    SET_AND_EXPOSE_TO_BUILD(USE_LIBEPOXY TRUE)
> ++endif ()
> ++
> + if (ENABLE_OPENGL)
> +     # ENABLE_OPENGL is true if either USE_OPENGL or ENABLE_GLES2 is true.
> +     # But USE_OPENGL is the opposite of ENABLE_GLES2.
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> index c8d4f94..24d10a2 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
> @@ -23,6 +23,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0012-soup-Forward-declare-URL-class.patch \
>             file://0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch \
>             file://0001-webkitgtk-fix-CVE-2017-17821.patch \
> +           file://0001-fix-to-build-with-libepoxy.patch \
>             "
>
>  SRC_URI[md5sum] = "72a05f6a4dc1c78b079590a8fd280401"
> @@ -42,7 +43,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>            "
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', 'libepoxy' ,d)} \
>                     enchant \
>                     libsecret \
>                    "
> @@ -52,6 +53,7 @@ PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/lib
>  PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>  PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant"
>  PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
> +PACKAGECONFIG[libepoxy] = "-DENABLE_LIBEPOXY=ON,-DENABLE_LIBEPOXY=OFF,libepoxy"
>  PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
>  PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
>  PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

