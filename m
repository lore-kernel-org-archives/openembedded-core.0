Return-Path: <samentu1@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA1578699
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:00:29 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id m191so2982408itg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 11:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rU5IcLCAuim6uA+eIw9ozxKyey0asS6Y1u8cYrqHq1M=;
	b=kO5dUxZMRHmfm9OWxjnN7qMV5DRBWYreQ769B+og52Zgk12D85YCG32hs58WNbEO5R
	DFRRGlSrq3Awje4s23kIilrIQ2ZWt+6cyhna1d58IqOmkT0FGusKqlUkFVW3+5lHXjgB
	yrzskgAC1qiQwW1q31Vv8zUhs5F2K41MVH0wdnMBEbY0YPzeYDR+Fg3e9to7CoaF4xh/
	VptNnqn1p5wxsTLJ82LyjageCJoU1xSzc+QGCzxspPgdQW7g768im8tDslRxRYRfQHve
	+fWdcAmvGZan4jGVb52kVpLMTt0xkbgj1G6g0LjSeRYK4ikMFN89JWxwf6lr/j4C5GCF
	xvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rU5IcLCAuim6uA+eIw9ozxKyey0asS6Y1u8cYrqHq1M=;
	b=kUmFhYJBWx53CN/1HBlm3V6HHeaJArNCwhOwBIivAHjkpDWTDm8lYt6XT+O54durNU
	E2/tm3j7gE/WU2of636/2kAqg6yQHmkgeTLkzibPQpwmY2IsPQsu7m/PJmzzXQnWtXO6
	5RO13A6FgQQvcTONCzkoQhLJliAr3C0VOyuD6NPYbAYjxDVB+Zc0RVhQaU8lVN/y61mF
	DJrM0rGRsp3iH5DsFDqlKXhlg0UfulJkTabYE58lly1zC7guO4WwdrovOZU/YLaTvFej
	BOeYpRBQrIlL9wsVdtnhlttTjPk+PP79j7S6yqDfMYQTbUMzIKY9SzSrdBPzxtWgKEqb
	jo4g==
X-Gm-Message-State: AJaThX6gVGLEcv+ivirH+CYFFd+Kyh9v0zChoNHdURq5lbq/kaABvcYY
	fy8P30Wl46FTo8Nn4qU4j4Tyh77dO/crymqQ0Uw=
X-Google-Smtp-Source: AGs4zMaWHEL8p2nBmb6DH116bAJxnF7LmeWaczGY1jMbVmIEFS8ACI19nxJE2S+kV6UbWRp9Lahos0H/HgK6GGYMPhg=
X-Received: by 10.36.66.80 with SMTP id i77mr22154442itb.102.1510772430981;
	Wed, 15 Nov 2017 11:00:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.18.11 with HTTP; Wed, 15 Nov 2017 11:00:30 -0800 (PST)
In-Reply-To: <20171113190011.17183-1-florin@resin.io>
References: <20171113190011.17183-1-florin@resin.io>
From: Florin Ionut <samentu1@gmail.com>
Date: Wed, 15 Nov 2017 21:00:30 +0200
Message-ID: <CAM4Jt4nGjzhCDFxpkzNVYrs8REGhQ57aO89yj4t7O8tOM8c4yw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Sarbu <florin@resin.io>
Subject: Re: [pyro][PATCH] gcc: Use libssp_nonshared linker specs only for ppc/musl
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
X-List-Received-Date: Wed, 15 Nov 2017 19:00:30 -0000
Content-Type: multipart/alternative; boundary="001a1140695815d034055e0a1eef"

--001a1140695815d034055e0a1eef
Content-Type: text/plain; charset="UTF-8"

Hi,
any comments on this commit?

Thanks

On Mon, Nov 13, 2017 at 9:00 PM, Florin Sarbu <samentu1@gmail.com> wrote:

> Link libssp_nonshared.a only for ppc/musl because glibc already
> provides the content for libssp_nonshared in libc_nonshared.a and
> therefore we dont need to make it universal.
>
> (From OE-Core rev: c08247e3c7c004a40281d4010186a9ace86e0e47)
>
> Signed-off-by: Florin Sarbu <florin@resin.io>
> ---
>  meta/recipes-devtools/gcc/gcc-6.3.inc              |  2 +-
>  ...shared-to-link-commandline-for-musl-targe.patch | 87
> ++++++++++++++++++++++
>  .../gcc/gcc-6.3/0041-ssp_nonshared.patch           | 28 -------
>  3 files changed, 88 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-
> 6.3/0041-ssp_nonshared.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc
> b/meta/recipes-devtools/gcc/gcc-6.3.inc
> index d74f12c466..5c81a33af0 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
> @@ -71,7 +71,7 @@ SRC_URI = "\
>             file://0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> \
>             file://0039-Fix-various-_FOR_BUILD-and-related-variables.patch
> \
>             file://0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> -           file://0041-ssp_nonshared.patch \
> +           file://0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> \
>             file://0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> \
>             file://0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> \
>             file://0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> \
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_
> nonshared-to-link-commandline-for-musl-targe.patch
> b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_
> nonshared-to-link-commandline-for-musl-targe.patch
> new file mode 100644
> index 0000000000..29b7ce72d2
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_
> nonshared-to-link-commandline-for-musl-targe.patch
> @@ -0,0 +1,87 @@
> +From 210f6b3b82084cc756e02b8bc12f909a43b14ee8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 27 Jun 2017 18:10:54 -0700
> +Subject: [PATCH 40/49] Add ssp_nonshared to link commandline for musl
> targets
> +
> +when -fstack-protector options are enabled we need to
> +link with ssp_shared on musl since it does not provide
> +the __stack_chk_fail_local() so essentially it provides
> +libssp but not libssp_nonshared something like
> +TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> + where-as for glibc the needed symbols
> +are already present in libc_nonshared library therefore
> +we do not need any library helper on glibc based systems
> +but musl needs the libssp_noshared from gcc
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + gcc/config/linux.h          |  7 +++++++
> + gcc/config/rs6000/linux.h   | 10 ++++++++++
> + gcc/config/rs6000/linux64.h | 10 ++++++++++
> + 3 files changed, 27 insertions(+)
> +
> +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> +index 2e683d0c430..1b4df798671 100644
> +--- a/gcc/config/linux.h
> ++++ b/gcc/config/linux.h
> +@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> +     { 0, 0, 0, 0, 0, 0 }                              \
> +   }
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++                     "|fstack-protector-strong|fstack-protector-explicit"
> \
> ++                     ":-lssp_nonshared}"
> ++#endif
> ++
> + #endif
> +
> + #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
> +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> +index 684afd6c190..22cfa391b89 100644
> +--- a/gcc/config/rs6000/linux.h
> ++++ b/gcc/config/rs6000/linux.h
> +@@ -91,6 +91,16 @@
> +                                        " -m elf32ppclinux")
> + #endif
> +
> ++/* link libssp_nonshared.a with musl */
> ++#if DEFAULT_LIBC == LIBC_MUSL
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++                     "|fstack-protector-strong|fstack-protector-explicit"
> \
> ++                     ":-lssp_nonshared}"
> ++#endif
> ++#endif
> ++
> + #undef LINK_OS_LINUX_SPEC
> + #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
> +   %{rdynamic:-export-dynamic} \
> +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> +index 3b00ec0fcf0..8371f8d7b6b 100644
> +--- a/gcc/config/rs6000/linux64.h
> ++++ b/gcc/config/rs6000/linux64.h
> +@@ -465,6 +465,16 @@ extern int dot_symbols;
> +                                          " -m elf64ppc")
> + #endif
> +
> ++/* link libssp_nonshared.a with musl */
> ++#if DEFAULT_LIBC == LIBC_MUSL
> ++#ifdef TARGET_LIBC_PROVIDES_SSP
> ++#undef LINK_SSP_SPEC
> ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> ++                     "|fstack-protector-strong|fstack-protector-explicit"
> \
> ++                     ":-lssp_nonshared}"
> ++#endif
> ++#endif
> ++
> + #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared:
> %{!static: \
> +   %{rdynamic:-export-dynamic} \
> +   -dynamic-linker " GNU_USER_DYNAMIC_LINKER32 "}} \
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
> b/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
> deleted file mode 100644
> index 0744529741..0000000000
> --- a/meta/recipes-devtools/gcc/gcc-6.3/0041-ssp_nonshared.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 551a5db7acb56e085a101f1c222d51b2c1b039a4 Mon Sep 17 00:00:00 2001
> -From: Szabolcs Nagy <nsz@port70.net>
> -Date: Sat, 7 Nov 2015 14:58:40 +0000
> -Subject: [PATCH 41/46] ssp_nonshared
> -
> ----
> -Upstream-Status: Inappropriate [OE Configuration]
> -
> - gcc/gcc.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 2812819..9de96ee 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -863,7 +863,8 @@ proper position among the other output files.  */
> - #ifndef LINK_SSP_SPEC
> - #ifdef TARGET_LIBC_PROVIDES_SSP
> - #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> --                     "|fstack-protector-strong|
> fstack-protector-explicit:}"
> -+                     "|fstack-protector-strong|fstack-protector-explicit"
> \
> -+                     ":-lssp_nonshared}"
> - #else
> - #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> -                      "|fstack-protector-strong|fstack-protector-explicit"
> \
> ---
> -2.8.2
> -
> --
> 2.13.6
>
>

--001a1140695815d034055e0a1eef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>any comments on this commit?</div><div><br></div><=
div>Thanks</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Mon, Nov 13, 2017 at 9:00 PM, Florin Sarbu <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:samentu1@gmail.com" target=3D"_blank">samentu1@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Link libssp_nonshared=
.a only for ppc/musl because glibc already<br>
provides the content for libssp_nonshared in libc_nonshared.a and<br>
therefore we dont need to make it universal.<br>
<br>
(From OE-Core rev: c08247e3c7c004a40281d4010186a9<wbr>ace86e0e47)<br>
<br>
Signed-off-by: Florin Sarbu &lt;<a href=3D"mailto:florin@resin.io">florin@r=
esin.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-<wbr>6.3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0...shared-to-link-commandline-<wbr>for-musl-targe.patch | 87 ++++++++=
++++++++++++++<br>
=C2=A0.../gcc/gcc-6.3/0041-ssp_<wbr>nonshared.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 28 -------<br>
=C2=A03 files changed, 88 insertions(+), 29 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.3/0041-Add-ss=
p_nonshared-to-<wbr>link-commandline-for-musl-<wbr>targe.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.3/0041-ssp_no=
nshared.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/<wbr>gcc-6.3.inc b/meta/recipes-devt=
ools/gcc/<wbr>gcc-6.3.inc<br>
index d74f12c466..5c81a33af0 100644<br>
--- a/meta/recipes-devtools/gcc/<wbr>gcc-6.3.inc<br>
+++ b/meta/recipes-devtools/gcc/<wbr>gcc-6.3.inc<br>
@@ -71,7 +71,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0038-Search-target-<wbr>sy=
sroot-gcc-version-specific-<wbr>dirs-with.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0039-Fix-various-_FOR_<wbr=
>BUILD-and-related-variables.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0040-nios2-Define-MUSL_<wb=
r>DYNAMIC_LINKER.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0041-ssp_nonshared.<wbr>pa=
tch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0041-Add-ssp_nonshared-<wb=
r>to-link-commandline-for-musl-<wbr>targe.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0042-gcc-libcpp-<wbr>suppo=
rt-ffile-prefix-map-old-<wbr>new.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0043-Reuse-fdebug-<wbr>pre=
fix-map-to-replace-ffile-<wbr>prefix-map.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0044-gcc-final.c-<wbr>fdeb=
ug-prefix-map-support-to-<wbr>remap-sourc.patch \<br>
diff --git a/meta/recipes-devtools/gcc/<wbr>gcc-6.3/0041-Add-ssp_<wbr>nonsh=
ared-to-link-commandline-<wbr>for-musl-targe.patch b/meta/recipes-devtools/=
gcc/<wbr>gcc-6.3/0041-Add-ssp_<wbr>nonshared-to-link-commandline-<wbr>for-m=
usl-targe.patch<br>
new file mode 100644<br>
index 0000000000..29b7ce72d2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/<wbr>gcc-6.3/0041-Add-ssp_<wbr>nonshared-to=
-link-commandline-<wbr>for-musl-targe.patch<br>
@@ -0,0 +1,87 @@<br>
+From 210f6b3b82084cc756e02b8bc12f90<wbr>9a43b14ee8 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Tue, 27 Jun 2017 18:10:54 -0700<br>
+Subject: [PATCH 40/49] Add ssp_nonshared to link commandline for musl targ=
ets<br>
+<br>
+when -fstack-protector options are enabled we need to<br>
+link with ssp_shared on musl since it does not provide<br>
+the __stack_chk_fail_local() so essentially it provides<br>
+libssp but not libssp_nonshared something like<br>
+TARGET_LIBC_PROVIDES_SSP_BUT_<wbr>NOT_SSP_NONSHARED<br>
+ where-as for glibc the needed symbols<br>
+are already present in libc_nonshared library therefore<br>
+we do not need any library helper on glibc based systems<br>
+but musl needs the libssp_noshared from gcc<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---<br>
+ gcc/config/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++++<br=
>
+ gcc/config/rs6000/linux.h=C2=A0 =C2=A0| 10 ++++++++++<br>
+ gcc/config/rs6000/linux64.h | 10 ++++++++++<br>
+ 3 files changed, 27 insertions(+)<br>
+<br>
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h<br>
+index 2e683d0c430..1b4df798671 100644<br>
+--- a/gcc/config/linux.h<br>
++++ b/gcc/config/linux.h<br>
+@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME respective=
ly.=C2=A0 If not, see<br>
+=C2=A0 =C2=A0 =C2=A0{ GCC_INCLUDE_DIR, &quot;GCC&quot;, 0, 1, 0, 0 },=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0{ 0, 0, 0, 0, 0, 0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br=
>
+=C2=A0 =C2=A0}<br>
++#ifdef TARGET_LIBC_PROVIDES_SSP<br>
++#undef LINK_SSP_SPEC<br>
++#define LINK_SSP_SPEC &quot;%{fstack-protector|fstack-<wbr>protector-all&=
quot; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;|fstack-protector-strong|<wbr>fstack-protector-explicit&quot; \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;:-lssp_nonshared}&quot;<br>
++#endif<br>
++<br>
+ #endif<br>
+<br>
+ #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) &amp;&amp; defined (SINGLE_LIBC) /*=
 uClinux */<br>
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h<br>
+index 684afd6c190..22cfa391b89 100644<br>
+--- a/gcc/config/rs6000/linux.h<br>
++++ b/gcc/config/rs6000/linux.h<br>
+@@ -91,6 +91,16 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; -=
m elf32ppclinux&quot;)<br>
+ #endif<br>
+<br>
++/* link libssp_nonshared.a with musl */<br>
++#if DEFAULT_LIBC =3D=3D LIBC_MUSL<br>
++#ifdef TARGET_LIBC_PROVIDES_SSP<br>
++#undef LINK_SSP_SPEC<br>
++#define LINK_SSP_SPEC &quot;%{fstack-protector|fstack-<wbr>protector-all&=
quot; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;|fstack-protector-strong|<wbr>fstack-protector-explicit&quot; \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;:-lssp_nonshared}&quot;<br>
++#endif<br>
++#endif<br>
++<br>
+ #undef LINK_OS_LINUX_SPEC<br>
+ #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL &quot; %{!shared: %{!static=
: \<br>
+=C2=A0 =C2=A0%{rdynamic:-export-dynamic} \<br>
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h<br>
+index 3b00ec0fcf0..8371f8d7b6b 100644<br>
+--- a/gcc/config/rs6000/linux64.h<br>
++++ b/gcc/config/rs6000/linux64.h<br>
+@@ -465,6 +465,16 @@ extern int dot_symbols;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot; -m elf64ppc&quot;)<br>
+ #endif<br>
+<br>
++/* link libssp_nonshared.a with musl */<br>
++#if DEFAULT_LIBC =3D=3D LIBC_MUSL<br>
++#ifdef TARGET_LIBC_PROVIDES_SSP<br>
++#undef LINK_SSP_SPEC<br>
++#define LINK_SSP_SPEC &quot;%{fstack-protector|fstack-<wbr>protector-all&=
quot; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;|fstack-protector-strong|<wbr>fstack-protector-explicit&quot; \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;:-lssp_nonshared}&quot;<br>
++#endif<br>
++#endif<br>
++<br>
+ #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 &quot; %{!shared: %{!st=
atic: \<br>
+=C2=A0 =C2=A0%{rdynamic:-export-dynamic} \<br>
+=C2=A0 =C2=A0-dynamic-linker &quot; GNU_USER_DYNAMIC_LINKER32 &quot;}} \<b=
r>
+--<br>
+2.13.2<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/<wbr>gcc-6.3/0041-ssp_nonshared.<wbr=
>patch b/meta/recipes-devtools/gcc/<wbr>gcc-6.3/0041-ssp_nonshared.<wbr>pat=
ch<br>
deleted file mode 100644<br>
index 0744529741..0000000000<br>
--- a/meta/recipes-devtools/gcc/<wbr>gcc-6.3/0041-ssp_nonshared.<wbr>patch<=
br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-From 551a5db7acb56e085a101f1c222d51<wbr>b2c1b039a4 Mon Sep 17 00:00:00 200=
1<br>
-From: Szabolcs Nagy &lt;<a href=3D"mailto:nsz@port70.net">nsz@port70.net</=
a>&gt;<br>
-Date: Sat, 7 Nov 2015 14:58:40 +0000<br>
-Subject: [PATCH 41/46] ssp_nonshared<br>
-<br>
----<br>
-Upstream-Status: Inappropriate [OE Configuration]<br>
-<br>
- gcc/gcc.c | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/gcc/gcc.c b/gcc/gcc.c<br>
-index 2812819..9de96ee 100644<br>
---- a/gcc/gcc.c<br>
-+++ b/gcc/gcc.c<br>
-@@ -863,7 +863,8 @@ proper position among the other output files.=C2=A0 */=
<br>
- #ifndef LINK_SSP_SPEC<br>
- #ifdef TARGET_LIBC_PROVIDES_SSP<br>
- #define LINK_SSP_SPEC &quot;%{fstack-protector|fstack-<wbr>protector-all&=
quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;|fstack-protector-strong|<wbr>fstack-protector-explicit:}&quot;<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;|fstack-protector-strong|<wbr>fstack-protector-explicit&quot; \<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;:-lssp_nonshared}&quot;<br>
- #else<br>
- #define LINK_SSP_SPEC &quot;%{fstack-protector|fstack-<wbr>protector-all&=
quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;|fstack-protector-strong|<wbr>fstack-protector-explicit&quot; \<b=
r>
---<br>
-2.8.2<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.6<br>
<br>
</font></span></blockquote></div><br></div>

--001a1140695815d034055e0a1eef--
