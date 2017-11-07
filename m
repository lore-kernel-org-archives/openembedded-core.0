Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6A078436
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 09:58:57 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id e89so1494344ioi.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 01:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FEU1giYosCFt8FlZjebmqp5b1635hfF1ShQlFvYSDv4=;
	b=IpVG2LXOkvYgMGgXN2lHrd+ci3Rn9+21aDC8QSWPIeBvDnjcQSXYoYU1yFropMoZ8R
	LJw5Ze6ZOq440/aX+NWjlDOz7FSzrwEMzimZBXRjHKlL3tflWlYjkf2ATbDa3J4SoOyZ
	uQkmFPDn2WT959sr0fFzWRhh3O9YVGXrQV7sU2RhH038G0XKc53b4GJvqM9vR6jiqyVk
	6QMgDotKMnk7WWIoHzKBUAV/JAB9u5fReIR0EuCmL73RjFeXsYb0Ga3DPEGvFxDEKtj6
	qtUP1Wo6lz515xaJ5sx6GH+X8pmHvdZVfPW0LizjTjV6cn5Nuvo+W+/gy4XZUpWgSmbb
	+BBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FEU1giYosCFt8FlZjebmqp5b1635hfF1ShQlFvYSDv4=;
	b=QUu73ncjkP0aZJckaVrWUDtTX/K+xYc0atsjOB+B4MdXLyu4mtv2e69Dxc8bka8FSo
	jtru3yBdjyW58GS8lUz98doPGEWuSiXAv74LUDcLb8H6Od3jHqok13JCUFhZapwr/Cr5
	gFID/NUE/EzmzUl3t8n+KvbDDzwJ3pHnxmmi4ahwkkQY9r8ULNpuzhKgEcYZgG4Of6d7
	t+b4Kj8lzOre8b9QrSRMJMDcQReahUXBUiORr9FFXBEIAJs/T8Rie4uugoMghpwcKGAl
	1JSyq4epTw6TneruGvTtitK3P5vpR4H8+wntFtjKe9deSH1nCCUTva1nWCivEerZQOiC
	n5Qg==
X-Gm-Message-State: AJaThX79juboE9HdY3gZpgEXqcit+Kw+g0yplA1WoxZ5SQkgjPzLUzQQ
	RwK3Imm7dT195ee87Og2WJJEK2MZE1fdWxy+IMaZ0Q==
X-Google-Smtp-Source: ABhQp+Qp0GfA+vu8syYBrEZCRbHNKrVXvgm251q11gzMF/y9DQ8mLAEs6czBwT5IXwDHtAGGI/pk0pW/uZ/5TgUb1yY=
X-Received: by 10.107.183.151 with SMTP id h145mr24163178iof.259.1510048739194;
	Tue, 07 Nov 2017 01:58:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 7 Nov 2017 01:58:38 -0800 (PST)
In-Reply-To: <20171107001706.10052-1-alistair.francis@xilinx.com>
References: <20171107001706.10052-1-alistair.francis@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Nov 2017 09:58:38 +0000
Message-ID: <CAJTo0LYkCH6TNwGU27Av5-2UwpXZb7iogyM8ScQ_b6JA5jibFw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to glib 2.53.7
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
X-List-Received-Date: Tue, 07 Nov 2017 09:58:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c07b0b194eb055d619e11"

--94eb2c0c07b0b194eb055d619e11
Content-Type: text/plain; charset="UTF-8"

Odd major version numbers are development releases, so this won't be
accepted into oe-core.

Ross

On 7 November 2017 at 00:17, Alistair Francis <alistair.francis@xilinx.com>
wrote:

> Update to Glib version 2.53.7.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  ...evert-meson-Substitute-the-Python-shebang.patch | 54
> ++++++++++++++++++++++
>  .../glib-2.0/glib-2.0/configure-libtool.patch      | 34 +++-----------
>  .../{glib-2.0_2.52.3.bb => glib-2.0_2.53.7.bb}     |  6 +--
>  meta/recipes-core/glib-2.0/glib.inc                |  8 ++--
>  4 files changed, 67 insertions(+), 35 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-
> Revert-meson-Substitute-the-Python-shebang.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.52.3.bb =>
> glib-2.0_2.53.7.bb} (76%)
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-
> Revert-meson-Substitute-the-Python-shebang.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-
> Revert-meson-Substitute-the-Python-shebang.patch
> new file mode 100644
> index 0000000000..979247cbba
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Partially-
> Revert-meson-Substitute-the-Python-shebang.patch
> @@ -0,0 +1,54 @@
> +From be007b2e6fbe93904e36ccddc707f96b30ad8300 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@xilinx.com>
> +Date: Mon, 6 Nov 2017 15:23:16 -0800
> +Subject: [PATCH] Partially Revert: meson: Substitute the Python shebang
> +
> +Partially revert this patch:
> +commit 0f18a2ebda4ec0440ec545542f9fc2f60cd54c5d
> +Author: Emmanuele Bassi <ebassi@gnome.org>
> +Date:   Fri Jul 14 20:43:19 2017 +0100
> +
> +    meson: Substitute the Python shebang
> +
> +    Just like we do with Autotools. This allows building glib-mkenums and
> +    glib-genmarshal on older platforms that only have Python 2.
> +
> +The above patch stops using the hardcoded python3 enviroment to run
> +Python scripts and instead uses the PYTHON variable used from configure.
> +
> +This patch casues QA issues when building Glib and results in the env
> +string being too long (resulting in clipping) which results in build
> +failures.
> +
> +As we always have Python 3 we don't need a workaround for Python 2.
> +
> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + gobject/glib-genmarshal.in | 2 +-
> + gobject/glib-mkenums.in    | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
> +index ed6de0ae8..ec30410bd 100755
> +--- a/gobject/glib-genmarshal.in
> ++++ b/gobject/glib-genmarshal.in
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env @PYTHON@
> ++#!/usr/bin/env python3
> +
> + # pylint: disable=too-many-lines, missing-docstring, invalid-name
> +
> +diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
> +index d4bfd11c3..051fce4ca 100755
> +--- a/gobject/glib-mkenums.in
> ++++ b/gobject/glib-mkenums.in
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env @PYTHON@
> ++#!/usr/bin/env python3
> +
> + # If the code below looks horrible and unpythonic, do not panic.
> + #
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> index aa5de27d12..d759ea1d7f 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> @@ -14,28 +14,20 @@ from PATH though
>  Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
>  Rebased to glib-2.32.1 by Martin Jansa <Martin.Jansa@gmail.com>
>  Rebased to glib-2.31.20+ by Andre McCurdy <armccurdy@gmail.com>
> +Rebased to glib-2.53.4+ by Alistair Francis <alistair.francis@xilinx.com>
>
>  Upstream-Status: Inappropriate [configuration]
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
> - configure.ac | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 1af90c5..f6b7a73 100644
> +index f322edfea..7cf86c2fa 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1378,7 +1378,7 @@ if test x"$glib_native_win32" = xyes; then
> -   G_MODULE_LDFLAGS=
> - else
> -   export SED
> --  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo
> \\$export_dynamic_flag_spec) | sh`
> -+  G_MODULE_LDFLAGS=`(./$host_alias-libtool --config; echo eval echo
> \\$export_dynamic_flag_spec) | sh`
> - fi
> - dnl G_MODULE_IMPL= don't reset, so cmd-line can override
> - G_MODULE_NEED_USCORE=0
> -@@ -1427,13 +1427,13 @@ AS_IF([ test "$G_MODULE_IMPL" =
> "G_MODULE_IMPL_DL" ], [
> +@@ -1428,9 +1428,9 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL"
> ], [
>         LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
>   dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
>         echo "void glib_plugin_test(void) { }" > plugin.c
> @@ -47,20 +39,6 @@ index 1af90c5..f6b7a73 100644
>                 ${LDFLAGS} -module -o plugin.la -export-dynamic \
>                 -shrext ".o" -avoid-version plugin.lo \
>                 -rpath /dont/care >/dev/null 2>&1
> --      eval `./libtool --config | grep ^objdir`
> -+      eval `./$host_alias-libtool --config | grep ^objdir`
> -       AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
> -               glib_cv_rtldglobal_broken,[
> -               AC_TRY_RUN([
> -@@ -1506,7 +1506,7 @@ fi
> -
> - AC_MSG_CHECKING(for the suffix of module shared libraries)
> - export SED
> --shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
> -+shrext_cmds=`./$host_alias-libtool --config | grep '^shrext_cmds='`
> - eval $shrext_cmds
> - module=yes eval std_shrext=$shrext_cmds
> - # chop the initial dot
>  --
> -1.9.1
> +2.11.0
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
> similarity index 76%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
> index b1fe600992..c3807a23ab 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.53.7.bb
> @@ -10,14 +10,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz
> \
>             file://ptest-paths.patch \
>             file://uclibc_musl_translation.patch \
>             file://allow-run-media-sdX-drive-mount-if-username-root.patch
> \
> -           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
> \
>             file://Enable-more-tests-while-cross-compiling.patch \
>             file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
> \
>             file://0001-Do-not-ignore-return-value-of-write.patch \
>             file://0001-Test-for-pthread_getname_np-before-using-it.patch
> \
> +           file://0001-Partially-Revert-meson-Substitute-the-Python-shebang.patch
> \
>             "
>
>  SRC_URI_append_class-native = " file://relocate-modules.patch"
>
> -SRC_URI[md5sum] = "89265d0289a436e99cad54491eb21ef4"
> -SRC_URI[sha256sum] = "25ee7635a7c0fcd4ec91cbc3ae07c7
> f8f5ce621d8183511f414ded09e7e4e128"
> +SRC_URI[md5sum] = "fad7444e5c03c9bd174140fdd5c460f8"
> +SRC_URI[sha256sum] = "028efbf6df4d88d7725314456524b9
> 23169f4d4f8503347194b2baf2222f3e33"
> diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> index 8434b7dae3..48d3dc5b43 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -5,10 +5,10 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
>  # pcre is under BSD;
>  # docs/reference/COPYING is with a 'public domai'-like license!
>  LICENSE = "LGPLv2+ & BSD & PD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
> -                    file://glib/glib.h;beginline=4;endline=17;md5=
> b4f0f4a399c19e5ebb20c31b79d6bc32 \
> -                    file://gmodule/COPYING;md5=
> 3bf50002aefd002f49e7bb854063f7e7 \
> -                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=
> b4f0f4a399c19e5ebb20c31b79d6bc32 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
> +                    file://glib/glib.h;beginline=4;endline=17;md5=
> b88abb7f3ad09607e71cb9d530155906 \
> +                    file://gmodule/COPYING;md5=
> 4fbd65380cdd255951079008b364516c \
> +                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=
> b88abb7f3ad09607e71cb9d530155906 \
>                      file://glib/pcre/COPYING;md5=
> 266ebc3ff74ee9ce6fad65577667c0f4 \
>                      file://glib/pcre/pcre.h;beginline=11;endline=35;md5=
> de27f2bf633d20a2b7af0b1983423283 \
>                      file://docs/reference/COPYING;md5=
> f51a5100c17af6bae00735cd791e1fcc"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0c07b0b194eb055d619e11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Odd major version numbers are development releases, so thi=
s won&#39;t be accepted into oe-core.<div><br></div><div>Ross</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 November 2017 =
at 00:17, Alistair Francis <span dir=3D"ltr">&lt;<a href=3D"mailto:alistair=
.francis@xilinx.com" target=3D"_blank">alistair.francis@xilinx.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Update to Glib version 2.53=
.7.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xili=
nx.com">alistair.francis@xilinx.com</a>&gt;<br>
---<br>
=C2=A0...evert-meson-Substitute-the-<wbr>Python-shebang.patch | 54 ++++++++=
++++++++++++++<br>
=C2=A0.../glib-2.0/glib-2.0/<wbr>configure-libtool.patch=C2=A0 =C2=A0 =C2=
=A0 | 34 +++-----------<br>
=C2=A0.../{<a href=3D"http://glib-2.0_2.52.3.bb" rel=3D"noreferrer" target=
=3D"_blank">glib-2.0_2.52.3.bb</a> =3D&gt; <a href=3D"http://glib-2.0_2.53.=
7.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.53.7.bb</a>}=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 6 +--<br>
=C2=A0meta/recipes-core/glib-2.0/<wbr>glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++--<br>
=C2=A04 files changed, 67 insertions(+), 35 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/<wbr>glib-2.0/0001-Part=
ially-<wbr>Revert-meson-Substitute-the-<wbr>Python-shebang.patch<br>
=C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0_2.52.3.=
bb" rel=3D"noreferrer" target=3D"_blank">gl<wbr>ib-2.0_2.52.3.bb</a> =3D&gt=
; <a href=3D"http://glib-2.0_2.53.7.bb" rel=3D"noreferrer" target=3D"_blank=
">glib-2.0_2.53.7.bb</a>} (76%)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/<wbr>glib-2.0/0001-Partially-<wbr>R=
evert-meson-Substitute-the-<wbr>Python-shebang.patch b/meta/recipes-core/gl=
ib-2.0/<wbr>glib-2.0/0001-Partially-<wbr>Revert-meson-Substitute-the-<wbr>P=
ython-shebang.patch<br>
new file mode 100644<br>
index 0000000000..979247cbba<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glib-2.0/<wbr>glib-2.0/0001-Partially-<wbr>Revert-m=
eson-Substitute-the-<wbr>Python-shebang.patch<br>
@@ -0,0 +1,54 @@<br>
+From be007b2e6fbe93904e36ccddc707f9<wbr>6b30ad8300 Mon Sep 17 00:00:00 200=
1<br>
+From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx.com">=
alistair.francis@xilinx.com</a>&gt;<br>
+Date: Mon, 6 Nov 2017 15:23:16 -0800<br>
+Subject: [PATCH] Partially Revert: meson: Substitute the Python shebang<br=
>
+<br>
+Partially revert this patch:<br>
+commit 0f18a2ebda4ec0440ec545542f9fc2<wbr>f60cd54c5d<br>
+Author: Emmanuele Bassi &lt;<a href=3D"mailto:ebassi@gnome.org">ebassi@gno=
me.org</a>&gt;<br>
+Date:=C2=A0 =C2=A0Fri Jul 14 20:43:19 2017 +0100<br>
+<br>
+=C2=A0 =C2=A0 meson: Substitute the Python shebang<br>
+<br>
+=C2=A0 =C2=A0 Just like we do with Autotools. This allows building glib-mk=
enums and<br>
+=C2=A0 =C2=A0 glib-genmarshal on older platforms that only have Python 2.<=
br>
+<br>
+The above patch stops using the hardcoded python3 enviroment to run<br>
+Python scripts and instead uses the PYTHON variable used from configure.<b=
r>
+<br>
+This patch casues QA issues when building Glib and results in the env<br>
+string being too long (resulting in clipping) which results in build<br>
+failures.<br>
+<br>
+As we always have Python 3 we don&#39;t need a workaround for Python 2.<br=
>
+<br>
+Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xil=
inx.com">alistair.francis@xilinx.com</a>&gt;<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+---<br>
+ gobject/<a href=3D"http://glib-genmarshal.in" rel=3D"noreferrer" target=
=3D"_blank">glib-genmarshal.in</a> | 2 +-<br>
+ gobject/<a href=3D"http://glib-mkenums.in" rel=3D"noreferrer" target=3D"_=
blank">glib-mkenums.in</a>=C2=A0 =C2=A0 | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/gobject/<a href=3D"http://glib-genmarshal.in" rel=3D"noreferr=
er" target=3D"_blank">glib-genmarshal.in</a> b/gobject/<a href=3D"http://gl=
ib-genmarshal.in" rel=3D"noreferrer" target=3D"_blank">glib-genmarshal.in</=
a><br>
+index ed6de0ae8..ec30410bd 100755<br>
+--- a/gobject/<a href=3D"http://glib-genmarshal.in" rel=3D"noreferrer" tar=
get=3D"_blank">glib-genmarshal.in</a><br>
++++ b/gobject/<a href=3D"http://glib-genmarshal.in" rel=3D"noreferrer" tar=
get=3D"_blank">glib-genmarshal.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env @PYTHON@<br>
++#!/usr/bin/env python3<br>
+<br>
+ # pylint: disable=3Dtoo-many-lines, missing-docstring, invalid-name<br>
+<br>
+diff --git a/gobject/<a href=3D"http://glib-mkenums.in" rel=3D"noreferrer"=
 target=3D"_blank">glib-mkenums.in</a> b/gobject/<a href=3D"http://glib-mke=
nums.in" rel=3D"noreferrer" target=3D"_blank">glib-mkenums.in</a><br>
+index d4bfd11c3..051fce4ca 100755<br>
+--- a/gobject/<a href=3D"http://glib-mkenums.in" rel=3D"noreferrer" target=
=3D"_blank">glib-mkenums.in</a><br>
++++ b/gobject/<a href=3D"http://glib-mkenums.in" rel=3D"noreferrer" target=
=3D"_blank">glib-mkenums.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env @PYTHON@<br>
++#!/usr/bin/env python3<br>
+<br>
+ # If the code below looks horrible and unpythonic, do not panic.<br>
+ #<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/meta/recipes-core/glib-2.0/<wbr>glib-2.0/configure-libtool.<wb=
r>patch b/meta/recipes-core/glib-2.0/<wbr>glib-2.0/configure-libtool.<wbr>p=
atch<br>
index aa5de27d12..d759ea1d7f 100644<br>
--- a/meta/recipes-core/glib-2.0/<wbr>glib-2.0/configure-libtool.<wbr>patch=
<br>
+++ b/meta/recipes-core/glib-2.0/<wbr>glib-2.0/configure-libtool.<wbr>patch=
<br>
@@ -14,28 +14,20 @@ from PATH though<br>
=C2=A0Rebased to glib-2.27.3 by Dongxiao Xu &lt;<a href=3D"mailto:dongxiao.=
xu@intel.com">dongxiao.xu@intel.com</a>&gt;<br>
=C2=A0Rebased to glib-2.32.1 by Martin Jansa &lt;<a href=3D"mailto:Martin.J=
ansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0Rebased to glib-2.31.20+ by Andre McCurdy &lt;<a href=3D"mailto:armcc=
urdy@gmail.com">armccurdy@gmail.com</a>&gt;<br>
+Rebased to glib-2.53.4+ by Alistair Francis &lt;<a href=3D"mailto:alistair=
.francis@xilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
<br>
=C2=A0Upstream-Status: Inappropriate [configuration]<br>
<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0---<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 10 +++++-----<br>
- 1 file changed, 5 insertions(+), 5 deletions(-)<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 1af90c5..f6b7a73 100644<br>
+index f322edfea..7cf86c2fa 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -1378,7 +1378,7 @@ if test x&quot;$glib_native_win32&quot; =3D xyes; th=
en<br>
-=C2=A0 =C2=A0G_MODULE_LDFLAGS=3D<br>
- else<br>
-=C2=A0 =C2=A0export SED<br>
--=C2=A0 G_MODULE_LDFLAGS=3D`(./libtool --config; echo eval echo \\$export_=
dynamic_flag_spec) | sh`<br>
-+=C2=A0 G_MODULE_LDFLAGS=3D`(./$host_<wbr>alias-libtool --config; echo eva=
l echo \\$export_dynamic_flag_spec) | sh`<br>
- fi<br>
- dnl G_MODULE_IMPL=3D don&#39;t reset, so cmd-line can override<br>
- G_MODULE_NEED_USCORE=3D0<br>
-@@ -1427,13 +1427,13 @@ AS_IF([ test &quot;$G_MODULE_IMPL&quot; =3D &quot;=
G_MODULE_IMPL_DL&quot; ], [<br>
+@@ -1428,9 +1428,9 @@ AS_IF([ test &quot;$G_MODULE_IMPL&quot; =3D &quot;G_=
MODULE_IMPL_DL&quot; ], [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LDFLAGS=3D&quot;$LDFLAGS $G_MODULE_LDFLAGS&quot=
;<br>
=C2=A0 dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;void glib_plugin_test(void) { }&quot=
; &gt; plugin.c<br>
@@ -47,20 +39,6 @@ index 1af90c5..f6b7a73 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${LDFLAGS} -module =
-o <a href=3D"http://plugin.la" rel=3D"noreferrer" target=3D"_blank">plugin=
.la</a> -export-dynamic \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -shrext &quot;.o&qu=
ot; -avoid-version plugin.lo \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -rpath /dont/care &=
gt;/dev/null 2&gt;&amp;1<br>
--=C2=A0 =C2=A0 =C2=A0 eval `./libtool --config | grep ^objdir`<br>
-+=C2=A0 =C2=A0 =C2=A0 eval `./$host_alias-libtool --config | grep ^objdir`=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glib_cv_rtldglobal_=
broken,[<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_TRY_RUN([<br>
-@@ -1506,7 +1506,7 @@ fi<br>
-<br>
- AC_MSG_CHECKING(for the suffix of module shared libraries)<br>
- export SED<br>
--shrext_cmds=3D`./libtool --config | grep &#39;^shrext_cmds=3D&#39;`<br>
-+shrext_cmds=3D`./$host_alias-<wbr>libtool --config | grep &#39;^shrext_cm=
ds=3D&#39;`<br>
- eval $shrext_cmds<br>
- module=3Dyes eval std_shrext=3D$shrext_cmds<br>
- # chop the initial dot<br>
=C2=A0--<br>
-1.9.1<br>
+2.11.0<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.52.3.b=
b" rel=3D"noreferrer" target=3D"_blank">g<wbr>lib-2.0_2.52.3.bb</a> b/meta/=
recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.53.7.bb" rel=3D"noreferr=
er" target=3D"_blank">g<wbr>lib-2.0_2.53.7.bb</a><br>
similarity index 76%<br>
rename from meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.52.3.bb=
" rel=3D"noreferrer" target=3D"_blank">gli<wbr>b-2.0_2.52.3.bb</a><br>
rename to meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.53.7.bb" =
rel=3D"noreferrer" target=3D"_blank">gli<wbr>b-2.0_2.53.7.bb</a><br>
index b1fe600992..c3807a23ab 100644<br>
--- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.52.3.bb" rel=
=3D"noreferrer" target=3D"_blank">g<wbr>lib-2.0_2.52.3.bb</a><br>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.53.7.bb" rel=
=3D"noreferrer" target=3D"_blank">g<wbr>lib-2.0_2.53.7.bb</a><br>
@@ -10,14 +10,14 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_<wbr>VER}=
/glib-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ptest-paths.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uclibc_musl_<wbr>translati=
on.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://allow-run-media-sdX-<wbr>d=
rive-mount-if-username-root.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Remove-the-<wbr>warni=
ng-about-deprecated-<wbr>paths-in-schemas.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Enable-more-tests-<wbr>whi=
le-cross-compiling.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Install-gio-<wbr>quer=
ymodules-as-libexec_<wbr>PROGRAM.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-ignore-<wbr>re=
turn-value-of-write.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Test-for-pthread_<wbr=
>getname_np-before-using-it.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Partially-Revert-<wbr=
>meson-Substitute-the-Python-<wbr>shebang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; file://relocate-modules.patch&=
quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>89265d0289a436e99cad54491eb21e<wbr>f4&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>25ee7635a7c0fcd4ec91cbc3ae07c7<wbr>f8f5c=
e621d8183511f414ded09e7e4<wbr>e128&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>fad7444e5c03c9bd174140fdd5c460<wbr>f8&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>028efbf6df4d88d7725314456524b9<wbr>23169=
f4d4f8503347194b2baf2222f<wbr>3e33&quot;<br>
diff --git a/meta/recipes-core/glib-2.0/<wbr>glib.inc b/meta/recipes-core/g=
lib-2.0/<wbr>glib.inc<br>
index 8434b7dae3..48d3dc5b43 100644<br>
--- a/meta/recipes-core/glib-2.0/<wbr>glib.inc<br>
+++ b/meta/recipes-core/glib-2.0/<wbr>glib.inc<br>
@@ -5,10 +5,10 @@ HOMEPAGE =3D &quot;<a href=3D"https://developer.gnome.org=
/glib/" rel=3D"noreferrer" target=3D"_blank">https://developer.gnome.org/<w=
br>glib/</a>&quot;<br>
=C2=A0# pcre is under BSD;<br>
=C2=A0# docs/reference/COPYING is with a &#39;public domai&#39;-like licens=
e!<br>
=C2=A0LICENSE =3D &quot;LGPLv2+ &amp; BSD &amp; PD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>3bf50002aefd002f49e7b=
b854063f7<wbr>e7 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://glib/glib.h;beginline=3D<wbr>4;endline=3D17;md5=3D<wbr>b4f0f4a399c19e5eb=
b20c31b79d6bc<wbr>32 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gmodule/COPYING;md5=3D<wbr>3bf50002aefd002f49e7bb854063f7<wbr>e7 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gmodule/gmodule.h;<wbr>beginline=3D4;endline=3D17;md5=3D<wbr>b4f0f4a399c=
19e5ebb20c31b79d6bc<wbr>32 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>4fbd65380cdd255951079=
008b36451<wbr>6c \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://glib/glib.h;beginline=3D<wbr>4;endline=3D17;md5=3D<wbr>b88abb7f3ad09607e=
71cb9d5301559<wbr>06 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gmodule/COPYING;md5=3D<wbr>4fbd65380cdd255951079008b36451<wbr>6c \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gmodule/gmodule.h;<wbr>beginline=3D4;endline=3D17;md5=3D<wbr>b88abb7f3ad=
09607e71cb9d5301559<wbr>06 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://glib/pcre/COPYING;md5=3D<wbr>266ebc3ff74ee9ce6fad65577667c0<wbr>f=
4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://glib/pcre/pcre.h;<wbr>beginline=3D11;endline=3D35;md5=3D<wbr>de27=
f2bf633d20a2b7af0b19834232<wbr>83 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://docs/reference/COPYING;<wbr>md5=3D<wbr>f51a5100c17af6bae00735cd79=
1e1f<wbr>cc&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0c07b0b194eb055d619e11--
