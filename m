Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBCB71AD3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 00:30:39 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id 51so26812747uai.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 17:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ojZ19DK+Z0726GKjsAD2wWmMO4vD8TKd8kd5Yhalwwo=;
	b=IXGlJ0300rsf4Tu9JfLVxR1EzfK88Ae2NTGtAABm+AxsILj86LUgn4v+drJtsJbY0k
	gtqWTHaVGGGoIJbwrXskXJIzCInk4ZKHgy+4mUIF7LYEuNqFjYbTiM5Znia95ov42GqI
	DANtZ1p97fTbbe/j3nyDsYAYYXjG0c8IOYILdUo87yiOq4cyous0mm6e3h85k4UrfLQq
	FHTUywaDyR9b20JOK856KhO+weQ0bTHXUgLXeaEG40MDcli3S9XFLW5fPozyuxTVd/7b
	J2CwSs5WCqjTv/uuRKZYWCzJAKUts6ePXn35AE4SMRG1pDevLLaUkddGMGUjDMJW/GY8
	1HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ojZ19DK+Z0726GKjsAD2wWmMO4vD8TKd8kd5Yhalwwo=;
	b=lOd8RqWt84meZibL3iBEanjtw/gicJ7amIW695/fPPQIszu7pjghfBJytf5jTM9V6g
	lPRPKeDsI2dDpjX3oFH0SlQLrNQ4NJqBFUtxiNbK/FqZ+YbZkwWhU4CjX9jNdJxdTl1w
	3amm/34Q5Ww/byCJUPP7iXiNcr7/kkAcY8Hskq1tvdAJlG5e1lOYqKec/0ogEi/1azJy
	8ujx72gTSyDwiXbG8irdYBIBnAokoPNrDy3z0vstHlB1U9oGxNbQIsXdqHdjofLikB+R
	FgvqHJEU4SxzDoACsGIEjAwaSFBf6aNEganQSH7rBA1fbWrGAjcYYNWTs2rYDYt8igBA
	Ua7Q==
X-Gm-Message-State: ABUngveKPARlvw3HMVPA82O3hUnr48PYKQZL11498LFHycu4AxH0BRVWCcKG1Bn6aVEnOJf8828Dcc77byXRvg==
X-Received: by 10.159.55.141 with SMTP id q13mr5291557uaq.107.1478133041212;
	Wed, 02 Nov 2016 17:30:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Wed, 2 Nov 2016 17:30:40 -0700 (PDT)
Received: by 10.176.5.136 with HTTP; Wed, 2 Nov 2016 17:30:40 -0700 (PDT)
In-Reply-To: <1478127423-4954-1-git-send-email-armccurdy@gmail.com>
References: <1478127423-4954-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Nov 2016 17:30:40 -0700
Message-ID: <CAMKF1soo1AuwGA_y-vhF0bmOGjYj-OO-5U8Z2+3ZqawOWXetqA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: update 7.11+git1a982b689c -> 7.11.1
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
X-List-Received-Date: Thu, 03 Nov 2016 00:30:41 -0000
Content-Type: multipart/alternative; boundary=94eb2c04227ada315105405aaaa6

--94eb2c04227ada315105405aaaa6
Content-Type: text/plain; charset=UTF-8

This is ok. Please backport it to morty as well

On Nov 2, 2016 4:00 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:

>   41d8236 Set GDB version number to 7.11.1.
>   136613e Fix PR gdb/19828: gdb -p <process from a container>: internal
> error
>   a0de87e Make gdb/linux-nat.c consider a waitstatus pending on the infrun
> side
>   cf2cd51 Add mi-threads-interrupt.exp test (PR 20039)
>   f0a8d0d Fix double prompt output after run control MI commands with
> mi-async on (PR 20045)
>   b5f0db4 Fix -exec-run not running asynchronously with mi-async on (PR
> gdb/18077)
>   7f8e34d Use target_terminal_ours_for_output in MI
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-7.11.1.inc           | 22
> ++++++++++++++++++++
>  meta/recipes-devtools/gdb/gdb-7.11.inc             |  9 --------
>  meta/recipes-devtools/gdb/gdb-common.inc           | 24
> ----------------------
>  ...nadian_7.11.bb => gdb-cross-canadian_7.11.1.bb} |  0
>  .../gdb/{gdb-cross_7.11.bb => gdb-cross_7.11.1.bb} |  0
>  .../gdb/{gdb_7.11.bb => gdb_7.11.1.bb}             |  0
>  6 files changed, 22 insertions(+), 33 deletions(-)
>  create mode 100644 meta/recipes-devtools/gdb/gdb-7.11.1.inc
>  delete mode 100644 meta/recipes-devtools/gdb/gdb-7.11.inc
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.11.bb =>
> gdb-cross-canadian_7.11.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_7.11.bb =>
> gdb-cross_7.11.1.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb_7.11.bb => gdb_7.11.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-7.11.1.inc
> b/meta/recipes-devtools/gdb/gdb-7.11.1.inc
> new file mode 100644
> index 0000000..d9dfe6f
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb-7.11.1.inc
> @@ -0,0 +1,22 @@
> +LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> +                   file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
> +                   file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6
> \
> +                   file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b66
> 74"
> +
> +SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
> +           file://0001-include-sys-types.h-for-mode_t.patch \
> +           file://0002-make-man-install-relative-to-DESTDIR.patch \
> +           file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> \
> +           file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> \
> +           file://0005-Add-support-for-Renesas-SH-sh4-architecture.patch
> \
> +           file://0006-Dont-disable-libreadline.a-when-using-disable-static.patch
> \
> +           file://0007-use-asm-sgidefs.h.patch \
> +           file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
> +           file://0009-Change-order-of-CFLAGS.patch \
> +           file://0010-resolve-restrict-keyword-conflict.patch \
> +           file://0011-avx_mpx.patch \
> +"
> +
> +SRC_URI[md5sum] = "5aa71522e488e358243917967db87476"
> +SRC_URI[sha256sum] = "e9216da4e3755e9f414c1aa0026b62
> 6251dfc57ffe572a266e98da4f6988fc70"
> diff --git a/meta/recipes-devtools/gdb/gdb-7.11.inc
> b/meta/recipes-devtools/gdb/gdb-7.11.inc
> deleted file mode 100644
> index a9267d5..0000000
> --- a/meta/recipes-devtools/gdb/gdb-7.11.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> -                   file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
> -                   file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6
> \
> -                   file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b66
> 74"
> -
> -SRC_URI[md5sum] = "b93a2721393e5fa226375b42d567d90b"
> -SRC_URI[sha256sum] = "ff14f8050e6484508c73cbfa63731e
> 57901478490ca1672dc0b5e2b03f6af622"
> -
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc
> b/meta/recipes-devtools/gdb/gdb-common.inc
> index 0923143..33a5ce9 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -1,6 +1,5 @@
>  SUMMARY = "GNU debugger"
>  HOMEPAGE = "http://www.gnu.org/software/gdb/"
> -LICENSE = "GPLv3+"
>  SECTION = "devel"
>  DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST}"
>
> @@ -16,33 +15,10 @@ LTTNGUST_mips64eln32 = ""
>  LTTNGUST_sh4 = ""
>  LTTNGUST_libc-musl = ""
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> -               file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
> -               file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
> -               file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
> -
>  inherit autotools texinfo
>
> -SRCREV = "1a982b689ce4e20523bdf69e47fdd574c4f63934"
> -
> -SRC_URI = "git://sourceware.org/git/binutils-gdb.git;branch=gdb-7.
> 11-branch \
> -           file://0001-include-sys-types.h-for-mode_t.patch \
> -           file://0002-make-man-install-relative-to-DESTDIR.patch \
> -           file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> \
> -           file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> \
> -           file://0005-Add-support-for-Renesas-SH-sh4-architecture.patch
> \
> -           file://0006-Dont-disable-libreadline.a-when-using-disable-static.patch
> \
> -           file://0007-use-asm-sgidefs.h.patch \
> -           file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
> -           file://0009-Change-order-of-CFLAGS.patch \
> -           file://0010-resolve-restrict-keyword-conflict.patch \
> -           file://0011-avx_mpx.patch \
> -"
> -
>  UPSTREAM_CHECK_GITTAGREGEX = "gdb\-(?P<pver>.+)\-release"
>
> -S = "${WORKDIR}/git"
> -
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>
>  EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc
> utils'"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb
> b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.11.bb
> b/meta/recipes-devtools/gdb/gdb-cross_7.11.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_7.11.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_7.11.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb_7.11.bb
> b/meta/recipes-devtools/gdb/gdb_7.11.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_7.11.bb
> rename to meta/recipes-devtools/gdb/gdb_7.11.1.bb
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c04227ada315105405aaaa6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This is ok. Please backport it to morty as well</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Nov 2, 2016 4:=
00 PM, &quot;Andre McCurdy&quot; &lt;<a href=3D"mailto:armccurdy@gmail.com"=
>armccurdy@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">=C2=A0 41d8236 Set GDB version number to 7.11.1.<br>
=C2=A0 136613e Fix PR gdb/19828: gdb -p &lt;process from a container&gt;: i=
nternal error<br>
=C2=A0 a0de87e Make gdb/linux-nat.c consider a waitstatus pending on the in=
frun side<br>
=C2=A0 cf2cd51 Add mi-threads-interrupt.exp test (PR 20039)<br>
=C2=A0 f0a8d0d Fix double prompt output after run control MI commands with =
mi-async on (PR 20045)<br>
=C2=A0 b5f0db4 Fix -exec-run not running asynchronously with mi-async on (P=
R gdb/18077)<br>
=C2=A0 7f8e34d Use target_terminal_ours_for_<wbr>output in MI<br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">arm=
ccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gdb/gdb-<wbr>7.11.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 22 ++++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/gdb/gdb-<wbr>7.11.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 --------<br>
=C2=A0meta/recipes-devtools/gdb/gdb-<wbr>common.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 24 ----------------------<br>
=C2=A0...<a href=3D"http://nadian_7.11.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nadian_7.11.bb</a> =3D&gt; <a href=3D"http://gdb-cross-canadian_7.11.1=
.bb" rel=3D"noreferrer" target=3D"_blank">gdb-cross-canadian_7.11.1.bb</a>}=
 |=C2=A0 0<br>
=C2=A0.../gdb/{<a href=3D"http://gdb-cross_7.11.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gdb-cross_7.11.bb</a> =3D&gt; <a href=3D"http://gdb-cross_7.1=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">gdb-cross_7.11.1.bb</a>} |=C2=
=A0 0<br>
=C2=A0.../gdb/{<a href=3D"http://gdb_7.11.bb" rel=3D"noreferrer" target=3D"=
_blank">gdb_7.11.bb</a> =3D&gt; <a href=3D"http://gdb_7.11.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">gdb_7.11.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A06 files changed, 22 insertions(+), 33 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gdb/gdb-<wbr>7.11.1.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gdb/gdb-<wbr>7.11.inc<br>
=C2=A0rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross-canadia=
n_7.11.bb" rel=3D"noreferrer" target=3D"_blank">gdb<wbr>-cross-canadian_7.1=
1.bb</a> =3D&gt; <a href=3D"http://gdb-cross-canadian_7.11.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">gdb-cross-canadian_7.11.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross_7.11.bb=
" rel=3D"noreferrer" target=3D"_blank">gdb<wbr>-cross_7.11.bb</a> =3D&gt; <=
a href=3D"http://gdb-cross_7.11.1.bb" rel=3D"noreferrer" target=3D"_blank">=
gdb-cross_7.11.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb_7.11.bb" rel=
=3D"noreferrer" target=3D"_blank">gdb<wbr>_7.11.bb</a> =3D&gt; <a href=3D"h=
ttp://gdb_7.11.1.bb" rel=3D"noreferrer" target=3D"_blank">gdb_7.11.1.bb</a>=
} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/gdb/<wbr>gdb-7.11.1.inc b/meta/recipes-d=
evtools/gdb/<wbr>gdb-7.11.1.inc<br>
new file mode 100644<br>
index 0000000..d9dfe6f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gdb/<wbr>gdb-7.11.1.inc<br>
@@ -0,0 +1,22 @@<br>
+LICENSE =3D &quot;GPLv2 &amp; GPLv3 &amp; LGPLv2 &amp; LGPLv3&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>59530bdf33659b29e73d4=
adb9f9f65<wbr>52 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//COPYING3;md5=3D<wbr>d32239bcb673463ab874e80d47fae5<wbr>04 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//COPYING3.LIB;md5=3D<wbr>6a6a8e020838b23406c81b19c1d46d<wbr>f6 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//COPYING.LIB;md5=3D<wbr>9f604d8a4f8e74f4f5140845a21b66<wbr>74&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz" =
rel=3D"noreferrer" target=3D"_blank">http://ftp.gnu.org/gnu/gdb/<wbr>gdb-${=
PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-include-sys-types.<wb=
r>h-for-mode_t.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-make-man-install-<wbr=
>relative-to-DESTDIR.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-mips-linux-nat-<wbr>D=
efine-_ABIO32-if-not-defined.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-ppc-ptrace-Define-<wb=
r>pt_regs-uapi_pt_regs-on-GLIBC-<wbr>syst.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Add-support-for-<wbr>=
Renesas-SH-sh4-architecture.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Dont-disable-<wbr>lib=
readline.a-when-using-<wbr>disable-static.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-use-asm-sgidefs.h.<wb=
r>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-Use-exorted-<wbr>defi=
nitions-of-SIGRTMIN.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-Change-order-of-<wbr>=
CFLAGS.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-resolve-restrict-<wbr=
>keyword-conflict.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-avx_mpx.patch \<br>
+&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>5aa71522e488e358243917967db874<wbr>76&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>e9216da4e3755e9f414c1aa0026b62<wbr>6251d=
fc57ffe572a266e98da4f6988<wbr>fc70&quot;<br>
diff --git a/meta/recipes-devtools/gdb/<wbr>gdb-7.11.inc b/meta/recipes-dev=
tools/gdb/<wbr>gdb-7.11.inc<br>
deleted file mode 100644<br>
index a9267d5..0000000<br>
--- a/meta/recipes-devtools/gdb/<wbr>gdb-7.11.inc<br>
+++ /dev/null<br>
@@ -1,9 +0,0 @@<br>
-LICENSE =3D &quot;GPLv2 &amp; GPLv3 &amp; LGPLv2 &amp; LGPLv3&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>59530bdf33659b29e73d4=
adb9f9f65<wbr>52 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//COPYING3;md5=3D<wbr>d32239bcb673463ab874e80d47fae5<wbr>04 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//COPYING3.LIB;md5=3D<wbr>6a6a8e020838b23406c81b19c1d46d<wbr>f6 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//COPYING.LIB;md5=3D<wbr>9f604d8a4f8e74f4f5140845a21b66<wbr>74&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>b93a2721393e5fa226375b42d567d9<wbr>0b&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>ff14f8050e6484508c73cbfa63731e<wbr>57901=
478490ca1672dc0b5e2b03f6a<wbr>f622&quot;<br>
-<br>
diff --git a/meta/recipes-devtools/gdb/<wbr>gdb-common.inc b/meta/recipes-d=
evtools/gdb/<wbr>gdb-common.inc<br>
index 0923143..33a5ce9 100644<br>
--- a/meta/recipes-devtools/gdb/<wbr>gdb-common.inc<br>
+++ b/meta/recipes-devtools/gdb/<wbr>gdb-common.inc<br>
@@ -1,6 +1,5 @@<br>
=C2=A0SUMMARY =3D &quot;GNU debugger&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.gnu.org/software/gdb/" rel=
=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/<wbr>gdb/</a>=
&quot;<br>
-LICENSE =3D &quot;GPLv3+&quot;<br>
=C2=A0SECTION =3D &quot;devel&quot;<br>
=C2=A0DEPENDS =3D &quot;expat zlib ncurses virtual/libiconv ${LTTNGUST}&quo=
t;<br>
<br>
@@ -16,33 +15,10 @@ LTTNGUST_mips64eln32 =3D &quot;&quot;<br>
=C2=A0LTTNGUST_sh4 =3D &quot;&quot;<br>
=C2=A0LTTNGUST_libc-musl =3D &quot;&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>59530bdf33659b29e73d4=
adb9f9f65<wbr>52 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.LIB;=
md5=3D<wbr>9f604d8a4f8e74f4f5140845a21b66<wbr>74 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING3;md5=
=3D<wbr>d32239bcb673463ab874e80d47fae5<wbr>04 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING3.LIB=
;md5=3D<wbr>6a6a8e020838b23406c81b19c1d46d<wbr>f6&quot;<br>
-<br>
=C2=A0inherit autotools texinfo<br>
<br>
-SRCREV =3D &quot;<wbr>1a982b689ce4e20523bdf69e47fdd5<wbr>74c4f63934&quot;<=
br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/binutils-gdb.=
git;branch=3Dgdb-7.11-branch" rel=3D"noreferrer" target=3D"_blank">sourcewa=
re.org/git/<wbr>binutils-gdb.git;branch=3Dgdb-7.<wbr>11-branch</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-include-sys-types.<wb=
r>h-for-mode_t.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-make-man-install-<wbr=
>relative-to-DESTDIR.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-mips-linux-nat-<wbr>D=
efine-_ABIO32-if-not-defined.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-ppc-ptrace-Define-<wb=
r>pt_regs-uapi_pt_regs-on-GLIBC-<wbr>syst.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Add-support-for-<wbr>=
Renesas-SH-sh4-architecture.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Dont-disable-<wbr>lib=
readline.a-when-using-<wbr>disable-static.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-use-asm-sgidefs.h.<wb=
r>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-Use-exorted-<wbr>defi=
nitions-of-SIGRTMIN.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-Change-order-of-<wbr>=
CFLAGS.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-resolve-restrict-<wbr=
>keyword-conflict.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-avx_mpx.patch \<br>
-&quot;<br>
-<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;gdb\-(?P&lt;pver&gt;.+)\-release=
&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_<wbr>SYS}&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;&#39;SUBDIRS=3Dintl mmalloc libiberty opcodes =
bfd sim gdb etc utils&#39;&quot;<br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian=
_7.11.bb" rel=3D"noreferrer" target=3D"_blank">gd<wbr>b-cross-canadian_7.11=
.bb</a> b/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_7.=
11.1.bb" rel=3D"noreferrer" target=3D"_blank">gd<wbr>b-cross-canadian_7.11.=
1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_=
7.11.bb" rel=3D"noreferrer" target=3D"_blank">gdb-<wbr>cross-canadian_7.11.=
bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_7.=
11.1.bb" rel=3D"noreferrer" target=3D"_blank">gdb-<wbr>cross-canadian_7.11.=
1.bb</a><br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">gd<wbr>b-cross_7.11.bb</a> b/meta/rec=
ipes-devtools/gdb/<a href=3D"http://gdb-cross_7.11.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">gd<wbr>b-cross_7.11.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.11.bb" =
rel=3D"noreferrer" target=3D"_blank">gdb-<wbr>cross_7.11.bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.11.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gdb-<wbr>cross_7.11.1.bb</a><br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.11.bb" rel=
=3D"noreferrer" target=3D"_blank">gd<wbr>b_7.11.bb</a> b/meta/recipes-devto=
ols/gdb/<a href=3D"http://gdb_7.11.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">gd<wbr>b_7.11.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.11.bb" rel=3D=
"noreferrer" target=3D"_blank">gdb_<wbr>7.11.bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.11.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gdb_<wbr>7.11.1.bb</a><br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--94eb2c04227ada315105405aaaa6--
