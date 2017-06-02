Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A248260049
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 03:15:09 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n195so10861028wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 20:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=MU2fnL4yzNWr11u0LKaCfnns6kWSL4OEmMFpevSWKyI=;
	b=Qx/5gKVjQIeOdqfEXbWdoNiplhmuijcsKptJQk3bbi79y1WVyCnXk2vEzAjdGbtO6Q
	j7uI9UZndAugU+0tTtmzQPr63Lnd8VSgfX+FGd/UTTR2GCLdWfPlJF9t/E+WBoSKzkgD
	/sFxxBIs6TI10TUAN8eF6c/KZb3tPyFiVNECGhDEXPwJy4k7h4y5rqgmwwTyP7YvOF9X
	WKRBt434mD/GeE2G9honfUf2Sv7vkM/X9FhLA+IXyI+qBXlhKm1mKU7+LtyD5fOk0mpb
	OTpLOki9ntg5cYHHwZk1o48a1MxTbnPug1CWxXH92aYhW1bzjN3SPHYBT+TNyg/pF8EB
	rR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=MU2fnL4yzNWr11u0LKaCfnns6kWSL4OEmMFpevSWKyI=;
	b=H2KpKiEAWR044ccZva3elF3vqNcb1Hgc76hQYfOevstGVIfQSxzS7Wz8+SUSKb8kye
	QkAqEjv8jluNo1X6b7WoHXMtIeczMqnRgG8x7X9A5hRW5p9oV1qc93EgpQuN3VztM9Wc
	b+dKDCGoIEk15yjKhEot3Mxr59+0ATm9O9hDfxLg3RdvHY5/kv+69c9fJLZAquU033X+
	2wbKg4hfG2q5sF146YqBlE8z6C0Hq4l0I74TH/uYEkq+ohM1Iby/fBJvg+oFbKVca/Bx
	XAgkxe4Th/VuPXCgysGRHZCAYq2nrH/cPTbxnygE2JRN4IctoLTLR3kzrEYsdSI452wG
	AvMg==
X-Gm-Message-State: AODbwcAH7OvPanH+JRhfB35AbAblxm0hUW11kA9yEJsnjGlTJU3Pc/Sf
	Vu66iYhah4jn4rdRB/V3V0XRtMaakA==
X-Received: by 10.80.137.56 with SMTP id e53mr4279034ede.67.1496373310233;
	Thu, 01 Jun 2017 20:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <1496373137-4094-1-git-send-email-fan.xin@jp.fujitsu.com>
In-Reply-To: <1496373137-4094-1-git-send-email-fan.xin@jp.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 Jun 2017 03:14:59 +0000
Message-ID: <CAMKF1soxS53rTddDtH2YPFW9f82ndW__0PvWUCMisvf5eOPtqw@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lzo: Upgrade 2.09 -> 2.10
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
X-List-Received-Date: Fri, 02 Jun 2017 03:15:09 -0000
Content-Type: multipart/alternative; boundary="f403045c283e9ba22f0550f18fb9"

--f403045c283e9ba22f0550f18fb9
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2017 at 8:11 PM Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> 1. Upgrade lzo from 2.09 to 2.10
>
> 2. Update the license checksum due to the date change, not license change.
>
> 3. Add a patch to fix the undefined error.
>
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  ...-pkgconfigdir-to-solve-the-undefine-error.patch | 27
> ++++++++++++++++++++++
>  .../lzo/{lzo_2.09.bb => lzo_2.10.bb}               |  9 ++++----
>  2 files changed, 32 insertions(+), 4 deletions(-)
>  create mode 100644
> meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch
>  rename meta/recipes-support/lzo/{lzo_2.09.bb => lzo_2.10.bb} (74%)
>
> diff --git
> a/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch
> b/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch
> new file mode 100644
> index 0000000..5235a15
> --- /dev/null
> +++
> b/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch
> @@ -0,0 +1,27 @@
> +From e730bfd7c2d3a4b5f3605878599cb9b20d31b1fd Mon Sep 17 00:00:00 2001
> +From: Fan Xin <fan.xin@jp.fujitsu.com>
> +Date: Fri, 2 Jun 2017 11:52:25 +0900
> +Subject: [PATCH] Add pkgconfigdir to solve the undefine error.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> +---
> + Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index e4d383b..c75023d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -14,6 +14,7 @@ AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_srcdir)
> + LDADD = src/liblzo2.la
> + lib_LTLIBRARIES =
> + noinst_PROGRAMS =
> ++pkgconfigdir = $(libdir)/pkgconfig
> + pkgconfig_DATA = lzo2.pc
> +
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-support/lzo/lzo_2.09.bb
> b/meta/recipes-support/lzo/lzo_2.10.bb
> similarity index 74%
> rename from meta/recipes-support/lzo/lzo_2.09.bb
> rename to meta/recipes-support/lzo/lzo_2.10.bb
> index 2978617..efeb167 100644
> --- a/meta/recipes-support/lzo/lzo_2.09.bb
> +++ b/meta/recipes-support/lzo/lzo_2.10.bb
> @@ -3,23 +3,24 @@ HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
>  SECTION = "libs"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -
> file://src/lzo_init.c;beginline=5;endline=25;md5=355023835a9b9eeb70ab895395e951ff"
> +
> file://src/lzo_init.c;beginline=5;endline=25;md5=9ae697ca01829b0a383c5d2d163e0108"
>
>  SRC_URI = "
> http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
>             file://0001-Use-memcpy-instead-of-reinventing-it.patch \
> +          file://0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch \
>             file://acinclude.m4 \
>             file://run-ptest \
>             "
>
> -SRC_URI[md5sum] = "c7ffc9a103afe2d1bba0b015e7aa887f"
> -SRC_URI[sha256sum] =
> "f294a7ced313063c057c504257f437c8335c41bfeed23531ee4e6a2b87bcb34c"
> +SRC_URI[md5sum] = "39d3f3f9c55c87b1e5d6888e1420f4b5"
> +SRC_URI[sha256sum] =
> "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072"
>
>  inherit autotools ptest
>
>  EXTRA_OECONF = "--enable-shared"
>
>  do_configure_prepend () {
> -       cp ${WORKDIR}/acinclude.m4 ${S}/
> +#      cp ${WORKDIR}/acinclude.m4 ${S}/
>  }
>

Delete the whole function

>
>  do_install_ptest() {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c283e9ba22f0550f18fb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Thu, Jun 1, 2017 at 8:11 PM Fan=
 Xin &lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com">fan.xin@jp.fujitsu.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1. Upgrade lzo from 2=
.09 to 2.10<br>
<br>
2. Update the license checksum due to the date change, not license change.<=
br>
<br>
3. Add a patch to fix the undefined error.<br>
<br>
Signed-off-by: Fan Xin &lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com" target=
=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...-pkgconfigdir-to-solve-the-undefine-error.patch | 27 +++++++++++++=
+++++++++<br>
=C2=A0.../lzo/{<a href=3D"http://lzo_2.09.bb" rel=3D"noreferrer" target=3D"=
_blank">lzo_2.09.bb</a> =3D&gt; <a href=3D"http://lzo_2.10.bb" rel=3D"noref=
errer" target=3D"_blank">lzo_2.10.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++----<br>
=C2=A02 files changed, 32 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir=
-to-solve-the-undefine-error.patch<br>
=C2=A0rename meta/recipes-support/lzo/{<a href=3D"http://lzo_2.09.bb" rel=
=3D"noreferrer" target=3D"_blank">lzo_2.09.bb</a> =3D&gt; <a href=3D"http:/=
/lzo_2.10.bb" rel=3D"noreferrer" target=3D"_blank">lzo_2.10.bb</a>} (74%)<b=
r>
<br>
diff --git a/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-th=
e-undefine-error.patch b/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir=
-to-solve-the-undefine-error.patch<br>
new file mode 100644<br>
index 0000000..5235a15<br>
--- /dev/null<br>
+++ b/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undef=
ine-error.patch<br>
@@ -0,0 +1,27 @@<br>
+From e730bfd7c2d3a4b5f3605878599cb9b20d31b1fd Mon Sep 17 00:00:00 2001<br>
+From: Fan Xin &lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com" target=3D"_bla=
nk">fan.xin@jp.fujitsu.com</a>&gt;<br>
+Date: Fri, 2 Jun 2017 11:52:25 +0900<br>
+Subject: [PATCH] Add pkgconfigdir to solve the undefine error.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Fan Xin &lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com" targe=
t=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;<br>
+---<br>
+ Makefile.am | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index e4d383b..c75023d 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -14,6 +14,7 @@ AM_CPPFLAGS =3D -I$(top_srcdir)/include -I$(top_srcdir)<=
br>
+ LDADD =3D src/<a href=3D"http://liblzo2.la" rel=3D"noreferrer" target=3D"=
_blank">liblzo2.la</a><br>
+ lib_LTLIBRARIES =3D<br>
+ noinst_PROGRAMS =3D<br>
++pkgconfigdir =3D $(libdir)/pkgconfig<br>
+ pkgconfig_DATA =3D lzo2.pc<br>
+<br>
+<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-support/lzo/<a href=3D"http://lzo_2.09.bb" rel=3D=
"noreferrer" target=3D"_blank">lzo_2.09.bb</a> b/meta/recipes-support/lzo/<=
a href=3D"http://lzo_2.10.bb" rel=3D"noreferrer" target=3D"_blank">lzo_2.10=
.bb</a><br>
similarity index 74%<br>
rename from meta/recipes-support/lzo/<a href=3D"http://lzo_2.09.bb" rel=3D"=
noreferrer" target=3D"_blank">lzo_2.09.bb</a><br>
rename to meta/recipes-support/lzo/<a href=3D"http://lzo_2.10.bb" rel=3D"no=
referrer" target=3D"_blank">lzo_2.10.bb</a><br>
index 2978617..efeb167 100644<br>
--- a/meta/recipes-support/lzo/<a href=3D"http://lzo_2.09.bb" rel=3D"norefe=
rrer" target=3D"_blank">lzo_2.09.bb</a><br>
+++ b/meta/recipes-support/lzo/<a href=3D"http://lzo_2.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">lzo_2.10.bb</a><br>
@@ -3,23 +3,24 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.oberhumer.com/op=
ensource/lzo/" rel=3D"noreferrer" target=3D"_blank">http://www.oberhumer.co=
m/opensource/lzo/</a>&quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/lzo_init.c;beginline=3D5;endline=3D25;md5=3D355023835a9b9eeb70ab8953=
95e951ff&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/lzo_init.c;beginline=3D5;endline=3D25;md5=3D9ae697ca01829b0a383c5d2d=
163e0108&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.oberhumer.com/opensource/lzo/=
download/lzo-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://=
www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-memcpy-instead-of=
-reinventing-it.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-pkgconfigdir-to-solve-t=
he-undefine-error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://acinclude.m4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;c7ffc9a103afe2d1bba0b015e7aa887f&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f294a7ced313063c057c504257f437c8335c41bfeed23=
531ee4e6a2b87bcb34c&quot;<br>
+SRC_URI[md5sum] =3D &quot;39d3f3f9c55c87b1e5d6888e1420f4b5&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c0f892943208266f9b6543b3ae308fab6284c5c90e627=
931446fb49b4221a072&quot;<br>
<br>
=C2=A0inherit autotools ptest<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-shared&quot;<br>
<br>
=C2=A0do_configure_prepend () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/acinclude.m4 ${S}/<br>
+#=C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/acinclude.m4 ${S}/<br>
=C2=A0}<br>
</blockquote><div><br></div><div>Delete the whole function</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
=C2=A0do_install_ptest() {<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--f403045c283e9ba22f0550f18fb9--
