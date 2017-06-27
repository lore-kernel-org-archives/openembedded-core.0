Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6637977DB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 14:33:02 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m84so16400891ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k3LgosYb6X8gKN2Od7pA1/C03hXY1S+QUQS42FnTzmk=;
	b=LJiVVyBAxZlrrqH/zHj552sIJY8LgNU7VoH0izC/n7VfK4fSt4rorwJZlxPuvrAS0u
	48cSyTw3X3wW2RqPtOrxxADUEXGai4dshriAgci/nFXV+WWPGQOoXi/F4BAY/TylI4hP
	v7N8NzY3Oqy011GPri30xfLdbmDStDcXG7qXO7wocVJOtvyHOf83suAhCrq19lwVafum
	fdWM+9erQD5jFQS9osl1dcnAMhls66DcSN/eHs/kzpIf4h58kOU212b6+ISOhIGVWjZX
	oOmUHh2kqbIYC+IjdvH97EkQlxEcMAoP3P35oEcbGcXkob6mFPQTjOOSVK6BI5xJAxj8
	l4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k3LgosYb6X8gKN2Od7pA1/C03hXY1S+QUQS42FnTzmk=;
	b=fQpc1BB9v22TWunsrR3Gu+ylhYaxfccZGa24LhFYvwe+w+/jDNUsqV3LFWRIXA54c3
	sdXO0yKQdv0lnjJsx1A4zdBjoNx9Vq6nd2u76jmoOyLVkPhXKT101uIBvrxrIPpogUDX
	PwAwqzHbGJJQl2pFmOMDITUdF0yCwsumuR187OiJkZSS200h9eddqkirmcE3YGsHDvN8
	PLg4c0vvlNVamFrP+jkt6ZvT/0I5QMMsF1DOQiori8+B2BfgYexsNPwrqEOp0Kollj1N
	ia5SI5PLv8JGw0R9jGUkfvISkCm071bUroTY+ga5I7HXU2CpHYefp7CzUsJbgL0hLjvt
	ETfQ==
X-Gm-Message-State: AKS2vOyB83QcLBCyomT91YUmIKW/5ium2gKb0oLdfdWE1aYuTvL8jH7R
	O+j9ZGwdtL6/h2haDRB75J1lBVjYi37M
X-Received: by 10.36.50.199 with SMTP id j190mr2809211ita.110.1498573983368;
	Tue, 27 Jun 2017 07:33:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 27 Jun 2017 07:32:32 -0700 (PDT)
In-Reply-To: <0e65f660ddffdd30bc934af4751266026eab7790.1498512911.git.maxime.roussinbelanger@gmail.com>
References: <cover.1498512911.git.maxime.roussinbelanger@gmail.com>
	<0e65f660ddffdd30bc934af4751266026eab7790.1498512911.git.maxime.roussinbelanger@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 27 Jun 2017 17:32:32 +0300
Message-ID: <CAHiDW_ExCQkURqn37yWj8TizXiQFbFpN=-QM9kS+=NKQMRpsnQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] cmake: Use find_program if find_host_program is not available
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
X-List-Received-Date: Tue, 27 Jun 2017 14:33:02 -0000
Content-Type: multipart/alternative; boundary="001a114ac23ef2fab30552f1f107"

--001a114ac23ef2fab30552f1f107
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 27 June 2017 at 17:14, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> CMake does not define the `find_host_program` command we've
> been using in the cross-compiling code path.  It was
> provided by a widely used Android toolchain file.  For
> compatibility, continue to use `find_host_program` if
> available, but otherwise use just `find_program`.
>
> Upstream-Status: Accepted [https://gitlab.kitware.com/
> cmake/cmake/merge_requests/1009]
>
        - Will be in 3.10
>

The upstream work is much appreciated, thanks. However, the Upstream-Status
tag needs to be in the actual patch file commit message (the idea is that
when cmake recipe version is next upgraded, it's easy to see from the patch
file alone whether it's still needed or not). Sorry for not being explicit
about that.

Thanks,
  Jussi



> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail=
.com>
> ---
> Changes in v2:
>         - Add upstream-status
>
>  meta/recipes-devtools/cmake/cmake.inc              |  1 +
>  ...e-find_program-if-find_host_program-is-no.patch | 36
> ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/
> cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
>
> diff --git a/meta/recipes-devtools/cmake/cmake.inc
> b/meta/recipes-devtools/cmake/cmake.inc
> index dbd34f5..6aeb25f 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -14,6 +14,7 @@ CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').
> split('.')[0:2])}"
>  SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${
> PV}.tar.gz \
>             file://support-oe-qt4-tools-names.patch \
>             file://qt4-fail-silent.patch \
> +           file://0001-FindCUDA-Use-find_program-if-find_host_program-is=
-no.patch
> \
>             "
>
>  SRC_URI[md5sum] =3D "b5dff61f6a7f1305271ab3f6ae261419"
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_
> program-if-find_host_program-is-no.patch b/meta/recipes-devtools/cmake/
> cmake/0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch
> new file mode 100644
> index 0000000..8a61f1f
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/0001-FindCUDA-Use-find_
> program-if-find_host_program-is-no.patch
> @@ -0,0 +1,36 @@
> +From 46d25e782ebd9b6c50771b6f30433c58fae03a51 Mon Sep 17 00:00:00 2001
> +From: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail.com>
> +Date: Mon, 26 Jun 2017 11:30:07 -0400
> +Subject: [PATCH] cmake: Use find_program if find_host_program is not
> + available
> +
> +CMake does not define the `find_host_program` command we've been using
> +in the cross-compiling code path.  It was provided by a widely used
> +Android toolchain file.  For compatibility, continue to use
> +`find_host_program` if available, but otherwise use just `find_program`.
> +
> +Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmai=
l.com>
> +---
> + Modules/FindCUDA.cmake | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/Modules/FindCUDA.cmake b/Modules/FindCUDA.cmake
> +index a4dca54..77ca351 100644
> +--- a/Modules/FindCUDA.cmake
> ++++ b/Modules/FindCUDA.cmake
> +@@ -679,7 +679,11 @@ if(CMAKE_CROSSCOMPILING)
> +   # add known CUDA targetr root path to the set of directories we searc=
h
> for programs, libraries and headers
> +   set( CMAKE_FIND_ROOT_PATH "${CUDA_TOOLKIT_TARGET_DIR};${
> CMAKE_FIND_ROOT_PATH}")
> +   macro( cuda_find_host_program )
> +-    find_host_program( ${ARGN} )
> ++    if (COMMAND find_host_program)
> ++      find_host_program( ${ARGN} )
> ++    else()
> ++      find_program( ${ARGN} )
> ++    endif()
> +   endmacro()
> + else()
> +   # for non-cross-compile, find_host_program =3D=3D find_program and
> CUDA_TOOLKIT_TARGET_DIR =3D=3D CUDA_TOOLKIT_ROOT_DIR
> +--
> +2.1.4
> +
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114ac23ef2fab30552f1f107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
7 June 2017 at 17:14, Maxime Roussin-B=C3=A9langer <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:maxime.roussinbelanger@gmail.com" target=3D"_blank">maxime.=
roussinbelanger@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">CMake does not define the `find_host_program` com=
mand we&#39;ve<br>
been using in the cross-compiling code path.=C2=A0 It was<br>
provided by a widely used Android toolchain file.=C2=A0 For<br>
compatibility, continue to use `find_host_program` if<br>
available, but otherwise use just `find_program`.<br>
<br>
Upstream-Status: Accepted [<a href=3D"https://gitlab.kitware.com/cmake/cmak=
e/merge_requests/1009" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
kitware.com/<wbr>cmake/cmake/merge_requests/<wbr>1009</a>]<br></blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - Will be in 3.10<br></blockquote><div><br></div><div>The upstream work=
 is much appreciated, thanks. However, the Upstream-Status tag needs to be =
in the actual patch file commit message (the idea is that when cmake recipe=
 version is next upgraded, it&#39;s easy to see from the patch file alone w=
hether it&#39;s still needed or not). Sorry for not being explicit about th=
at.</div><div>=C2=A0</div><div>Thanks,</div><div>=C2=A0 Jussi</div><div>=C2=
=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.ro=
ussinbelanger@gmail.com">maxime.roussinbelanger@gmail.<wbr>com</a>&gt;<br>
---<br>
Changes in v2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add upstream-status<br>
<span class=3D"gmail-"><br>
=C2=A0meta/recipes-devtools/cmake/<wbr>cmake.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...e-find_program-if-find_<wbr>host_program-is-no.patch | 36 ++++++++=
++++++++++++++<br>
=C2=A02 files changed, 37 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/cmake/<wbr>cmake/0001-FindCU=
DA-Use-find_<wbr>program-if-find_host_program-<wbr>is-no.patch<br>
<br>
</span>diff --git a/meta/recipes-devtools/cmake/<wbr>cmake.inc b/meta/recip=
es-devtools/cmake/<wbr>cmake.inc<br>
index dbd34f5..6aeb25f 100644<br>
--- a/meta/recipes-devtools/cmake/<wbr>cmake.inc<br>
+++ b/meta/recipes-devtools/cmake/<wbr>cmake.inc<br>
@@ -14,6 +14,7 @@ CMAKE_MAJOR_VERSION =3D &quot;${@&#39;.&#39;.join(d.getVa=
r(&#39;PV&#39;).<wbr>split(&#39;.&#39;)[0:2])}&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://cmake.org/files/v${CMAKE_MAJOR_V=
ERSION}/cmake-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://cm=
ake.org/files/v${<wbr>CMAKE_MAJOR_VERSION}/cmake-${<wbr>PV}.tar.gz</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://support-oe-qt4-tools-<wbr>=
names.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://qt4-fail-silent.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-FindCUDA-Use-find_<wb=
r>program-if-find_host_program-<wbr>is-no.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>b5dff61f6a7f1305271ab3f6ae2614<wbr>19&=
quot;<br>
diff --git a/meta/recipes-devtools/cmake/<wbr>cmake/0001-FindCUDA-Use-find_=
<wbr>program-if-find_host_program-<wbr>is-no.patch b/meta/recipes-devtools/=
cmake/<wbr>cmake/0001-FindCUDA-Use-find_<wbr>program-if-find_host_program-<=
wbr>is-no.patch<br>
new file mode 100644<br>
index 0000000..8a61f1f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/cmake/<wbr>cmake/0001-FindCUDA-Use-find_<wbr>pr=
ogram-if-find_host_program-<wbr>is-no.patch<br>
@@ -0,0 +1,36 @@<br>
+From 46d25e782ebd9b6c50771b6f30433c<wbr>58fae03a51 Mon Sep 17 00:00:00 200=
1<br>
+From: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.roussinbel=
anger@gmail.com">maxime.roussinbelanger@gmail.<wbr>com</a>&gt;<br>
+Date: Mon, 26 Jun 2017 11:30:07 -0400<br>
+Subject: [PATCH] cmake: Use find_program if find_host_program is not<br>
+ available<br>
+<br>
+CMake does not define the `find_host_program` command we&#39;ve been using=
<br>
+in the cross-compiling code path.=C2=A0 It was provided by a widely used<b=
r>
+Android toolchain file.=C2=A0 For compatibility, continue to use<br>
+`find_host_program` if available, but otherwise use just `find_program`.<b=
r>
+<br>
+Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.r=
oussinbelanger@gmail.com">maxime.roussinbelanger@gmail.<wbr>com</a>&gt;<br>
+---<br>
+ Modules/FindCUDA.cmake | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/Modules/FindCUDA.cmake b/Modules/FindCUDA.cmake<br>
+index a4dca54..77ca351 100644<br>
+--- a/Modules/FindCUDA.cmake<br>
++++ b/Modules/FindCUDA.cmake<br>
+@@ -679,7 +679,11 @@ if(CMAKE_CROSSCOMPILING)<br>
+=C2=A0 =C2=A0# add known CUDA targetr root path to the set of directories =
we search for programs, libraries and headers<br>
+=C2=A0 =C2=A0set( CMAKE_FIND_ROOT_PATH &quot;${CUDA_TOOLKIT_TARGET_DIR};${=
<wbr>CMAKE_FIND_ROOT_PATH}&quot;)<br>
+=C2=A0 =C2=A0macro( cuda_find_host_program )<br>
+-=C2=A0 =C2=A0 find_host_program( ${ARGN} )<br>
++=C2=A0 =C2=A0 if (COMMAND find_host_program)<br>
++=C2=A0 =C2=A0 =C2=A0 find_host_program( ${ARGN} )<br>
++=C2=A0 =C2=A0 else()<br>
++=C2=A0 =C2=A0 =C2=A0 find_program( ${ARGN} )<br>
++=C2=A0 =C2=A0 endif()<br>
+=C2=A0 =C2=A0endmacro()<br>
+ else()<br>
+=C2=A0 =C2=A0# for non-cross-compile, find_host_program =3D=3D find_progra=
m and CUDA_TOOLKIT_TARGET_DIR =3D=3D CUDA_TOOLKIT_ROOT_DIR<br>
+--<br>
+2.1.4<br>
+<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--001a114ac23ef2fab30552f1f107--
