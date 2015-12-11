Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 400756E665
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 22:11:46 +0000 (UTC)
Received: by igcto18 with SMTP id to18so48011901igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 14:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7wJy90G1RFrA7v8ZbL21G6j51MHDfxwq7KnQ/6FksGQ=;
	b=c/sE1/QHHlMyComy221QSh5M9n7nsDFnwFq3aREOWsLhL5IsNfAgYPBP+AnExwJ4Ci
	fZ5ozN1ua55C/XZCZf6fq7d2Q0GNOvOIbrp10cpo3S7AiZY52qvQG/zWSfDH1gT1Ywl2
	QEZp28+hrjvX56ERTfgy9Z6LAg67+iK8wsxuNYYBCjisGHi4IY46b5/sza+QoBv7VL/y
	e0aIKYSACh/LIJRazFkSVUzMMqbacssidz1DKW8OzrEAD73RMe4krlsw+Z2IzWYr1Rbe
	tM3I0DEVqBuMjatmZXa6PxIqqly24S0u/PWf+y2JXDOxPH+TkrM/sY9iPLw+/oaL/qOe
	amWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7wJy90G1RFrA7v8ZbL21G6j51MHDfxwq7KnQ/6FksGQ=;
	b=C87A+clzyreyxtZFSNCtV0+UzyJuZcu+fSNjFtEAJBrpujVxB6NcsU6QVzT5q0rRb1
	4NLMg4CVC5MEDXcSpCP9+VHtVjn4L0y6hc3X5+DmD3+nnsTeO6Dk4IviRaykSzF40T09
	4hPw2bwsZ++S8vKJrjkB6mBS5O41vPD/2c89MFH2dNydEWx7Hn838Op6kLtrHdjo3lzt
	qpRsVrf1lPKENdmIuHlxXf+6wprkIkOozEhbiCyLZvCfaKLNEUIjBK90dExS+gFXGc3Q
	NiAJns1VKXeZZi1Nx20auBNXCynIiivmvpAPHIR/Ic2mt+gsVY/h6O45TGzifCc8KFrm
	Lvow==
X-Gm-Message-State: ALoCoQkiPqauNDWEuXeINhK1JKv1GvnnN2ko3hT1c6G54XhGD8stJ90fo55GsBTZz9cMeMw+/EuWzt3//dzS6kXKxs+7cCfhJBzA4YSAAF8Gl6F/CTJIcco=
X-Received: by 10.50.22.33 with SMTP id a1mr5478638igf.52.1449871907006; Fri,
	11 Dec 2015 14:11:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 11 Dec 2015 14:11:27 -0800 (PST)
In-Reply-To: <1449847155-18845-1-git-send-email-maxin.john@intel.com>
References: <1449847155-18845-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Dec 2015 22:11:27 +0000
Message-ID: <CAJTo0LaLW0L+599_KXg9om3jEq-raqtFqQMHu9V7qVj=c5xMzg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libical: Fix parallel build failure
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
X-List-Received-Date: Fri, 11 Dec 2015 22:11:47 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca19fce8d60526a69bfb

--047d7b10ca19fce8d60526a69bfb
Content-Type: text/plain; charset=UTF-8

This doesn't want to apply to the patches I've got locally for libical.
Can you squash this with the other patches and just have a single libical
upgrade commit that incorporates the upgrade and the fixes (for clarity,
conciseness, and bisectability).

Cheers,
Ross

On 11 December 2015 at 15:19, Maxin B. John <maxin.john@intel.com> wrote:

> Parallel builds occasionally fail because generated headers are only
> partially built when they're being used.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../Depend-on-headers-to-fix-parallel-build.patch  | 46
> ++++++++++++++++++++++
>  meta/recipes-support/libical/libical_1.0.1.bb      |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644
> meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
>
> diff --git
> a/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
> b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
> new file mode 100644
> index 0000000..4d65c81
> --- /dev/null
> +++
> b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
> @@ -0,0 +1,46 @@
> +From 56a10a14c0a544df99c97ce279801ddf40b0df52 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 14 Sep 2015 13:35:42 +0300
> +Subject: [PATCH] WIP: Depend on headers to fix parallel build
> +
> +Parallel builds occasionally fail because generated headers are only
> +half built when they're being used.
> +
> +This fix is extracted
> +from
> https://github.com/libical/libical/commit/dcc40c7ae2d337a0d83c077bf9d8f283499c6717
> +
> +Upstream-Status: Backport
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +
> +---
> + examples/CMakeLists.txt    | 1 +
> + src/libical/CMakeLists.txt | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
> +index 3379ffd..514956b 100644
> +--- a/examples/CMakeLists.txt
> ++++ b/examples/CMakeLists.txt
> +@@ -16,6 +16,7 @@ set(doesnothing_SRCS
> + )
> +
> + add_executable(doesnothing ${doesnothing_SRCS})
> ++add_dependencies(doesnothing ical icalss icalvcal)
> +
> + target_link_libraries(doesnothing ical icalss icalvcal ical icalss
> icalvcal)
> +
> +diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt
> +index 6774352..468a7d9 100644
> +--- a/src/libical/CMakeLists.txt
> ++++ b/src/libical/CMakeLists.txt
> +@@ -261,6 +261,7 @@ add_library(ical ${LIBRARY_TYPE} ${ical_LIB_SRCS})
> + add_library(ical-static STATIC ${ical_LIB_SRCS})
> +
> + add_dependencies(ical ical-header)
> ++add_dependencies(ical-static ical-header)
> +
> + target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})
> +
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-support/libical/libical_1.0.1.bb
> b/meta/recipes-support/libical/libical_1.0.1.bb
> index 0dcee46..e18b803 100644
> --- a/meta/recipes-support/libical/libical_1.0.1.bb
> +++ b/meta/recipes-support/libical/libical_1.0.1.bb
> @@ -9,6 +9,7 @@ SECTION = "libs"
>  SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz \
>             file://Remove-cmake-check-for-Perl.patch \
>             file://Fix-x32-ABI-build.patch \
> +           file://Depend-on-headers-to-fix-parallel-build.patch \
>             "
>  SRC_URI[md5sum] = "af91db06b22559f863869c5a382ad08a"
>  SRC_URI[sha256sum] =
> "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b10ca19fce8d60526a69bfb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t want to apply to the patches I&#39;ve got=
 locally for libical.=C2=A0 Can you squash this with the other patches and =
just have a single libical upgrade commit that incorporates the upgrade and=
 the fixes (for clarity, conciseness, and bisectability).<div><br></div><di=
v>Cheers,</div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 11 December 2015 at 15:19, Maxin B. John <span dir=3D=
"ltr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.j=
ohn@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Paral=
lel builds occasionally fail because generated headers are only<br>
partially built when they&#39;re being used.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0.../Depend-on-headers-to-fix-parallel-build.patch=C2=A0 | 46 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-support/libical/<a href=3D"http://libical_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libical_1.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 1 +<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/libical/libical/Depend-on-hea=
ders-to-fix-parallel-build.patch<br>
<br>
diff --git a/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-=
parallel-build.patch b/meta/recipes-support/libical/libical/Depend-on-heade=
rs-to-fix-parallel-build.patch<br>
new file mode 100644<br>
index 0000000..4d65c81<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libical/libical/Depend-on-headers-to-fix-paralle=
l-build.patch<br>
@@ -0,0 +1,46 @@<br>
+From 56a10a14c0a544df99c97ce279801ddf40b0df52 Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Mon, 14 Sep 2015 13:35:42 +0300<br>
+Subject: [PATCH] WIP: Depend on headers to fix parallel build<br>
+<br>
+Parallel builds occasionally fail because generated headers are only<br>
+half built when they&#39;re being used.<br>
+<br>
+This fix is extracted<br>
+from <a href=3D"https://github.com/libical/libical/commit/dcc40c7ae2d337a0=
d83c077bf9d8f283499c6717" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/libical/libical/commit/dcc40c7ae2d337a0d83c077bf9d8f283499c6717</a><=
br>
+<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+<br>
+---<br>
+ examples/CMakeLists.txt=C2=A0 =C2=A0 | 1 +<br>
+ src/libical/CMakeLists.txt | 1 +<br>
+ 2 files changed, 2 insertions(+)<br>
+<br>
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt<br>
+index 3379ffd..514956b 100644<br>
+--- a/examples/CMakeLists.txt<br>
++++ b/examples/CMakeLists.txt<br>
+@@ -16,6 +16,7 @@ set(doesnothing_SRCS<br>
+ )<br>
+<br>
+ add_executable(doesnothing ${doesnothing_SRCS})<br>
++add_dependencies(doesnothing ical icalss icalvcal)<br>
+<br>
+ target_link_libraries(doesnothing ical icalss icalvcal ical icalss icalvc=
al)<br>
+<br>
+diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt<br>
+index 6774352..468a7d9 100644<br>
+--- a/src/libical/CMakeLists.txt<br>
++++ b/src/libical/CMakeLists.txt<br>
+@@ -261,6 +261,7 @@ add_library(ical ${LIBRARY_TYPE} ${ical_LIB_SRCS})<br>
+ add_library(ical-static STATIC ${ical_LIB_SRCS})<br>
+<br>
+ add_dependencies(ical ical-header)<br>
++add_dependencies(ical-static ical-header)<br>
+<br>
+ target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})<br>
+<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-support/libical/<a href=3D"http://libical_1.0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libical_1.0.1.bb</a> b/meta/recipes=
-support/libical/<a href=3D"http://libical_1.0.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libical_1.0.1.bb</a><br>
index 0dcee46..e18b803 100644<br>
--- a/meta/recipes-support/libical/<a href=3D"http://libical_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libical_1.0.1.bb</a><br>
+++ b/meta/recipes-support/libical/<a href=3D"http://libical_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libical_1.0.1.bb</a><br>
@@ -9,6 +9,7 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/${BPN}/${BPN}/archive=
/v${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/${B=
PN}/${BPN}/archive/v${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Remove-cmake-check-for-Per=
l.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Fix-x32-ABI-build.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Depend-on-headers-to-fix-p=
arallel-build.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;af91db06b22559f863869c5a382ad08a&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7d5f613454ec6c7d1bcfb441c919215be53292aa=
15cd1cb14249d1413d6c610c&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7b10ca19fce8d60526a69bfb--
