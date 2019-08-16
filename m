Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5F06D548
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 12:00:46 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p28so4909422edi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 05:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qL64rAxmDedOEzjeJBZtM0ynOiT1nTEAT0w6YVfzTnE=;
	b=cPGmrXZizfNSQALc7D7gChLQVNU8Nqc3mpsipzlb03/2zvg2xokl3BuC6/D4qv/n+d
	FoT+LiBoCi6Xvk5qnr2Tfn8YEA2oTkeVa+N/xxApRYPUSEDDzQ/AYl6MmPazWAFPLwTE
	eOhRf6/SmcCGITVlyaRfGsrOPreVNyGS6EQqvuB+Eys591rK7z44DyAz6LslPFcJA3xg
	7XIsf7gbr4KaTFNpNazpX50m83U/jyFj99t2AFW1nB8yRl4S8pgXUBvrPGXVpJLxt1wR
	42W0XDbq3nlgfZJ/v9kqAMpVAGHlfP+cgQdivq6e5MTVTZnq/3DWvHJMad7Mj3UyCN2Z
	FkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qL64rAxmDedOEzjeJBZtM0ynOiT1nTEAT0w6YVfzTnE=;
	b=I2r0JWAS+RBB1QY7osVDobmN5j+1bS9N8HHUsEMGmDFaqOsoLkfrYhMQs5jxQLhaES
	wDUrO/VLEd35qGamKozRthly4dep4Cg8hAcp0rUWkXGB7x461n/k+r3I0nvqPda+urqQ
	yx1OwyDINPB+0HzQF6EET4tgy1L/FNwB1dqm1eBPtmNgcXKMy0YbT3l5HSNYfxqsR8Yv
	NJpUTM3meyWzrR8szNa2UPgwj+ekCrDpFbCtn8Qvd0t6Xg5bA+hkg1IqUjDNSi19+Wdk
	r33kk3jjA3RmipKDQcg5xXN6hDNJ8zogwgZyJRcN0fFrgh97GGpDXNDJ2mcE7NfuL/lG
	/pCg==
X-Gm-Message-State: APjAAAUWY8uyHs0Rid+z/aep1mO43zMNhCEvCKZEOxwxGsvyDa6j/7fb
	c93HO/Hf66iqZlfWLQZP6+2V0t0V/0FspQtH6Qs=
X-Google-Smtp-Source: APXvYqznpent+tp+x8m3aBFhwOo5hRZovkvDp940yHczFgMFxzHmwK6mbiV2qt0W2B4n2vi7L6WpBBO0boxA/4kqQA4=
X-Received: by 2002:a17:906:a89a:: with SMTP id
	ha26mr8184009ejb.110.1565956847006; 
	Fri, 16 Aug 2019 05:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190813152835.12578-1-raj.khem@gmail.com>
In-Reply-To: <20190813152835.12578-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Aug 2019 14:00:44 +0200
Message-ID: <CA+chaQf6EnDHU=9U6q1a2_p=grcyWoy2epYXP+yaZ--qi0eH4Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Fri, 16 Aug 2019 12:00:47 -0000
Content-Type: multipart/alternative; boundary="00000000000099774805903abdf5"

--00000000000099774805903abdf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have an app which includes omp.h from gomp, it used to find it without
adding any -I for that (with just -fopenmp to enable openmp).

Now the header file is included in RSS:
lib32-recipe-sysroot/usr/lib/arm-oemllib32-linux-gnueabi/9.2.0/include/omp.=
h
but no longer found in default search dirs.

Is this expected or should gcc be adjusted to search for it automatically?

Looking at the default search paths I see:

ignoring nonexistent directory
"BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/rec=
ipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemlli=
b32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/../../../../../arm-=
oemllib32-linux-gnueabi/include"
ignoring nonexistent directory "/not/exist/usr/include/c++/9.2.0"
ignoring nonexistent directory
"/not/exist/usr/include/c++/9.2.0/arm-oemllib32-linux-gnueabi"
ignoring nonexistent directory "/not/exist/usr/include/c++/9.2.0/backward"
ignoring duplicate directory
"BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/rec=
ipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemlli=
b32-linux-gnueabi/gcc/../../../lib/arm-oemllib32-linux-gnueabi/gcc/arm-oeml=
lib32-linux-gnueabi/9.2.0/include"
ignoring nonexistent directory
"/not/exist/usr/lib/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include"
ignoring nonexistent directory "/not/exist/usr/local/include"
ignoring duplicate directory
"BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/rec=
ipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemlli=
b32-linux-gnueabi/gcc/../../../lib/arm-oemllib32-linux-gnueabi/gcc/arm-oeml=
lib32-linux-gnueabi/9.2.0/include-fixed"
ignoring nonexistent directory
"BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/rec=
ipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemlli=
b32-linux-gnueabi/gcc/../../../lib/arm-oemllib32-linux-gnueabi/gcc/arm-oeml=
lib32-linux-gnueabi/9.2.0/../../../../../arm-oemllib32-linux-gnueabi/includ=
e"
ignoring nonexistent directory "/not/exist/usr/include"
#include "..." search starts here:
#include <...> search starts here:
 BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/rec=
ipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemlli=
b32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include
 BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/rec=
ipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemlli=
b32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include-fixed
End of search list.

On Tue, Aug 13, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:

> OE does not use the traditional /usr/lib/gcc prefix to store gcc-runtime
> it basically is moved into libdir, however some newer files were
> installed by newer versions of gcc especially libgomp ( omp.h openacc.h )
> into gcclibdir, so we have content in both directories, this confuses
> other tools which are trying to guess the gcc installation and its
> runtime location, since now we have two directories, the tools either
> choose one or other and we get inconsistent behavior, e.g. clang for
> aarch64 uses /usr/lib but same clang for riscv64 chose /usr/lib/gcc
>
> This change ensures that OE ends up with single valid location for gcc
> runtime files
>
> Move more common bits into common inc file
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Divert packaging to use new path in whole recipe
>
>  meta/recipes-devtools/gcc/gcc-runtime.inc    | 18 +++++++++++++++---
>  meta/recipes-devtools/gcc/gcc-runtime_8.3.bb | 10 ----------
>  meta/recipes-devtools/gcc/gcc-runtime_9.1.bb | 10 ----------
>  3 files changed, 15 insertions(+), 23 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index a5c2600d7f..22c1d78dd1 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -17,6 +17,12 @@ EXTRA_OECONF_PATHS =3D "\
>  EXTRA_OECONF_append_linuxstdbase =3D " --enable-clocale=3Dgnu"
>  EXTRA_OECONF_append =3D " --cache-file=3D${B}/config.cache"
>
> +# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> +EXTRA_OECONF_append_arm =3D " libat_cv_have_ifunc=3Dno "
> +
> +# Building with thumb enabled on armv6t fails
> +ARM_INSTRUCTION_SET_armv6 =3D "arm"
> +
>  RUNTIMELIBITM =3D "libitm"
>  RUNTIMELIBITM_arc =3D ""
>  RUNTIMELIBITM_mipsarch =3D ""
> @@ -77,6 +83,11 @@ do_install () {
>                 cd ${B}/${TARGET_SYS}/$d/
>                 oe_runmake 'DESTDIR=3D${D}'
> MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install
>         done
> +       if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> +               install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> +               mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/*
> ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> +               rmdir --ignore-fail-on-non-empty -p
> ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> +       fi
>         rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
>         rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
>         rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
> @@ -205,7 +216,7 @@ FILES_libssp-dev =3D "\
>      ${libdir}/libssp*.so \
>      ${libdir}/libssp*_nonshared.a \
>      ${libdir}/libssp*.la \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/ssp \
>  "
>  SUMMARY_libssp-dev =3D "GNU stack smashing protection library - developm=
ent
> files"
>  FILES_libssp-staticdev =3D "${libdir}/libssp*.a"
> @@ -214,7 +225,7 @@ SUMMARY_libssp-staticdev =3D "GNU stack smashing
> protection library - static devel
>  FILES_libquadmath =3D "${libdir}/libquadmath*.so.*"
>  SUMMARY_libquadmath =3D "GNU quad-precision math library"
>  FILES_libquadmath-dev =3D "\
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/quadmath* \
>      ${libdir}/libquadmath*.so \
>      ${libdir}/libquadmath.la \
>  "
> @@ -239,7 +250,8 @@ FILES_libgomp-dev =3D "\
>      ${libdir}/libgomp*${SOLIBSDEV} \
>      ${libdir}/libgomp*.la \
>      ${libdir}/libgomp.spec \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
> +    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
>  "
>  SUMMARY_libgomp-dev =3D "GNU OpenMP parallel programming library -
> development files"
>  FILES_libgomp-staticdev =3D "${libdir}/libgomp*.a"
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> index a1c7a76d0b..dd430b57eb 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> @@ -1,12 +1,2 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require gcc-runtime.inc
> -
> -# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> -EXTRA_OECONF_append_arm =3D " libat_cv_have_ifunc=3Dno "
> -
> -FILES_libgomp-dev +=3D "\
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> -"
> -
> -# Building with thumb enabled on armv6t fails
> -ARM_INSTRUCTION_SET_armv6 =3D "arm"
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> index a1c7a76d0b..dd430b57eb 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> @@ -1,12 +1,2 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require gcc-runtime.inc
> -
> -# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> -EXTRA_OECONF_append_arm =3D " libat_cv_have_ifunc=3Dno "
> -
> -FILES_libgomp-dev +=3D "\
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> -"
> -
> -# Building with thumb enabled on armv6t fails
> -ARM_INSTRUCTION_SET_armv6 =3D "arm"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000099774805903abdf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have an app which includes omp.h =
from gomp, it used to find it without adding any -I for that (with just=C2=
=A0-fopenmp to enable openmp).</div><div><br></div><div>Now the header file=
 is included in RSS:</div><div>lib32-recipe-sysroot/usr/lib/arm-oemllib32-l=
inux-gnueabi/9.2.0/include/omp.h<br></div><div>but no longer found in defau=
lt search dirs.</div><div><br></div><div>Is this expected or should gcc be =
adjusted to search for it automatically?</div><div><br></div><div>Looking a=
t the default search paths I see:</div><div><br></div><div>ignoring nonexis=
tent directory &quot;BUILD/work/machine-oemllib32-linux-gnueabi/lib32-compo=
nent/2.0.0-76-r7/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/=
../../lib/arm-oemllib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0=
/../../../../../arm-oemllib32-linux-gnueabi/include&quot;<br>ignoring nonex=
istent directory &quot;/not/exist/usr/include/c++/9.2.0&quot;<br>ignoring n=
onexistent directory &quot;/not/exist/usr/include/c++/9.2.0/arm-oemllib32-l=
inux-gnueabi&quot;<br>ignoring nonexistent directory &quot;/not/exist/usr/i=
nclude/c++/9.2.0/backward&quot;<br>ignoring duplicate directory &quot;BUILD=
/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/recipe-sy=
sroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemllib32-li=
nux-gnueabi/gcc/../../../lib/arm-oemllib32-linux-gnueabi/gcc/arm-oemllib32-=
linux-gnueabi/9.2.0/include&quot;<br>ignoring nonexistent directory &quot;/=
not/exist/usr/lib/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include&quot;<br>ig=
noring nonexistent directory &quot;/not/exist/usr/local/include&quot;<br>ig=
noring duplicate directory &quot;BUILD/work/machine-oemllib32-linux-gnueabi=
/lib32-component/2.0.0-76-r7/recipe-sysroot-native/usr/bin/arm-oemllib32-li=
nux-gnueabi/../../lib/arm-oemllib32-linux-gnueabi/gcc/../../../lib/arm-oeml=
lib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include-fixed&quo=
t;<br>ignoring nonexistent directory &quot;BUILD/work/machine-oemllib32-lin=
ux-gnueabi/lib32-component/2.0.0-76-r7/recipe-sysroot-native/usr/bin/arm-oe=
mllib32-linux-gnueabi/../../lib/arm-oemllib32-linux-gnueabi/gcc/../../../li=
b/arm-oemllib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/../../.=
./../../arm-oemllib32-linux-gnueabi/include&quot;<br>ignoring nonexistent d=
irectory &quot;/not/exist/usr/include&quot;<br>#include &quot;...&quot; sea=
rch starts here:<br>#include &lt;...&gt; search starts here:<br>=C2=A0BUILD=
/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/recipe-sy=
sroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemllib32-li=
nux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include<br>=C2=A0BUILD/wo=
rk/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/recipe-sysro=
ot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oemllib32-linux=
-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include-fixed<br>End of sear=
ch list.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 13, 2019 at 5:29 PM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">OE does not use the traditional=
 /usr/lib/gcc prefix to store gcc-runtime<br>
it basically is moved into libdir, however some newer files were<br>
installed by newer versions of gcc especially libgomp ( omp.h openacc.h )<b=
r>
into gcclibdir, so we have content in both directories, this confuses<br>
other tools which are trying to guess the gcc installation and its<br>
runtime location, since now we have two directories, the tools either<br>
choose one or other and we get inconsistent behavior, e.g. clang for<br>
aarch64 uses /usr/lib but same clang for riscv64 chose /usr/lib/gcc<br>
<br>
This change ensures that OE ends up with single valid location for gcc<br>
runtime files<br>
<br>
Move more common bits into common inc file<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Divert packaging to use new path in whole recipe<br>
<br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 | 18 +++++++++=
++++++---<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-runtime_8.3.bb</a> | 10 ----------<br=
>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-runtime_9.1.bb</a> | 10 ----------<br=
>
=C2=A03 files changed, 15 insertions(+), 23 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc<br>
index a5c2600d7f..22c1d78dd1 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
@@ -17,6 +17,12 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
=C2=A0EXTRA_OECONF_append_linuxstdbase =3D &quot; --enable-clocale=3Dgnu&qu=
ot;<br>
=C2=A0EXTRA_OECONF_append =3D &quot; --cache-file=3D${B}/config.cache&quot;=
<br>
<br>
+# Disable ifuncs for libatomic on arm conflicts -march/-mcpu<br>
+EXTRA_OECONF_append_arm =3D &quot; libat_cv_have_ifunc=3Dno &quot;<br>
+<br>
+# Building with thumb enabled on armv6t fails<br>
+ARM_INSTRUCTION_SET_armv6 =3D &quot;arm&quot;<br>
+<br>
=C2=A0RUNTIMELIBITM =3D &quot;libitm&quot;<br>
=C2=A0RUNTIMELIBITM_arc =3D &quot;&quot;<br>
=C2=A0RUNTIMELIBITM_mipsarch =3D &quot;&quot;<br>
@@ -77,6 +83,11 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}/${TARGET_SY=
S}/$d/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake &#39;DES=
TDIR=3D${D}&#39; MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}=
/include ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${li=
bdir}/${TARGET_SYS}/${BINV}/include <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/gc=
c/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/inclu=
de<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir --ignore-fail=
-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${infodir}/<a href=3D"http://libgomp=
.info" rel=3D"noreferrer" target=3D"_blank">libgomp.info</a> ${D}${infodir}=
/dir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${infodir}/<a href=3D"http://libitm.=
info" rel=3D"noreferrer" target=3D"_blank">libitm.info</a> ${D}${infodir}/d=
ir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${infodir}/<a href=3D"http://libquad=
math.info" rel=3D"noreferrer" target=3D"_blank">libquadmath.info</a> ${D}${=
infodir}/dir<br>
@@ -205,7 +216,7 @@ FILES_libssp-dev =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libssp*.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libssp*_nonshared.a \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libssp*.la \<br>
-=C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \<br>
+=C2=A0 =C2=A0 ${libdir}/${TARGET_SYS}/${BINV}/include/ssp \<br>
=C2=A0&quot;<br>
=C2=A0SUMMARY_libssp-dev =3D &quot;GNU stack smashing protection library - =
development files&quot;<br>
=C2=A0FILES_libssp-staticdev =3D &quot;${libdir}/libssp*.a&quot;<br>
@@ -214,7 +225,7 @@ SUMMARY_libssp-staticdev =3D &quot;GNU stack smashing p=
rotection library - static devel<br>
=C2=A0FILES_libquadmath =3D &quot;${libdir}/libquadmath*.so.*&quot;<br>
=C2=A0SUMMARY_libquadmath =3D &quot;GNU quad-precision math library&quot;<b=
r>
=C2=A0FILES_libquadmath-dev =3D &quot;\<br>
-=C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \<br>
+=C2=A0 =C2=A0 ${libdir}/${TARGET_SYS}/${BINV}/include/quadmath* \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libquadmath*.so \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/<a href=3D"http://libquadmath.la" rel=3D"nore=
ferrer" target=3D"_blank">libquadmath.la</a> \<br>
=C2=A0&quot;<br>
@@ -239,7 +250,8 @@ FILES_libgomp-dev =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libgomp*${SOLIBSDEV} \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libgomp*.la \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libgomp.spec \<br>
-=C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \<br>
+=C2=A0 =C2=A0 ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \<br>
+=C2=A0 =C2=A0 ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \<br>
=C2=A0&quot;<br>
=C2=A0SUMMARY_libgomp-dev =3D &quot;GNU OpenMP parallel programming library=
 - development files&quot;<br>
=C2=A0FILES_libgomp-staticdev =3D &quot;${libdir}/libgomp*.a&quot;<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.3.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_8.3.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-runtime_8.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_8.3.bb</a><br>
index a1c7a76d0b..dd430b57eb 100644<br>
--- a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-runtime_8.3.bb</a><br>
+++ b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-runtime_8.3.bb</a><br>
@@ -1,12 +1,2 @@<br>
=C2=A0require recipes-devtools/gcc/gcc-${PV}.inc<br>
=C2=A0require gcc-runtime.inc<br>
-<br>
-# Disable ifuncs for libatomic on arm conflicts -march/-mcpu<br>
-EXTRA_OECONF_append_arm =3D &quot; libat_cv_have_ifunc=3Dno &quot;<br>
-<br>
-FILES_libgomp-dev +=3D &quot;\<br>
-=C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \<br>
-&quot;<br>
-<br>
-# Building with thumb enabled on armv6t fails<br>
-ARM_INSTRUCTION_SET_armv6 =3D &quot;arm&quot;<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_9.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_9.1.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-runtime_9.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_9.1.bb</a><br>
index a1c7a76d0b..dd430b57eb 100644<br>
--- a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-runtime_9.1.bb</a><br>
+++ b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-runtime_9.1.bb</a><br>
@@ -1,12 +1,2 @@<br>
=C2=A0require recipes-devtools/gcc/gcc-${PV}.inc<br>
=C2=A0require gcc-runtime.inc<br>
-<br>
-# Disable ifuncs for libatomic on arm conflicts -march/-mcpu<br>
-EXTRA_OECONF_append_arm =3D &quot; libat_cv_have_ifunc=3Dno &quot;<br>
-<br>
-FILES_libgomp-dev +=3D &quot;\<br>
-=C2=A0 =C2=A0 ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \<br>
-&quot;<br>
-<br>
-# Building with thumb enabled on armv6t fails<br>
-ARM_INSTRUCTION_SET_armv6 =3D &quot;arm&quot;<br>
-- <br>
2.22.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000099774805903abdf5--
