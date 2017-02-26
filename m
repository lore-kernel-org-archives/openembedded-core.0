Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 678FC71BF0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 18:15:54 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o22so7018803wro.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 10:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hvYOyuLx5vqg2m/PQvk1dTD5pCQSCBds9TzAH2HYWt4=;
	b=CsIX7HLq7TtdZmKEZB51KR2+rCX060PM2vU8y21uLcKPuHy6HU5wvkQabvK0HmS6IA
	QpwU53C2NePxVCdlt2P3sPVNwDUxZQG78mSd1g17MWorwJi+Zz2NM6WfQDS/feKfzl/N
	qGvD6W02PA2X/Cf7UYKaceKtTXxAPlxP9kDmDGihtW/B4ZRaOu7KA+f1gFsMuPCPvjlH
	fIEj4KJp77LOnbjfJH8ObFonx9RS0wZlsCHg0v6fI6OlhDn2UqG1hKfyzaEDgj7Ok7Y4
	kZ5wzCkPRuE3UgDElKlpkGyQKc6B8yCk3SIIqgiFtD0ddXRK7y8TPNdEywgYNuDg4blx
	GLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hvYOyuLx5vqg2m/PQvk1dTD5pCQSCBds9TzAH2HYWt4=;
	b=IemkDmp+DiaN+y3SrISbRmEjgFXW6hmc14eyAbqF5fhiqWEQVdKcAMsiKPOefXw9TU
	uek6+mZ379KTriaYkcG+rkPVIb4IgXKyXs1YJIqrsNuLRIJPn5HxA1HT3ZGzg/xtzj54
	gPpAkqVC9mvbRLM3jOTxFz3YulTSi2tAtEUNDBnl6zLQq/jZ/oroqsRZWQqpwjGb1tTa
	pSIrBmogrhHEotRXLmY3wif17SG+3DcNjrioX4XG4dNzqmvKOK5j6HSDfLFzekDXfsrS
	ceKA+o+z0EfgEw3ooX5NQOlZhITbKWc0sAplWbkn4eNZaymLLDeXXf5rn66dxjJ36M2i
	n0+Q==
X-Gm-Message-State: AMke39nns+vFVcBNwZvPayNjWfkJzfzxzB2Op72qNJvgTO5luJLtDLOnWA2Dx2V35/fPPCWVLVhEdHkIA3V0gw==
X-Received: by 10.223.153.9 with SMTP id x9mr5254667wrb.196.1488132955812;
	Sun, 26 Feb 2017 10:15:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Sun, 26 Feb 2017 10:15:55 -0800 (PST)
In-Reply-To: <03b310a8701ba7a927c8de949af9398d5739e8a8.1488125460.git.jussi.kukkonen@intel.com>
References: <cover.1488125460.git.jussi.kukkonen@intel.com>
	<03b310a8701ba7a927c8de949af9398d5739e8a8.1488125460.git.jussi.kukkonen@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 26 Feb 2017 19:15:55 +0100
Message-ID: <CA+chaQcSpX=a77jcg1-D7Uj30ukOto2gpuemf9JMCpZ0n9m3jA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] vkcube: Add recipe for minimal vulkan demo
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
X-List-Received-Date: Sun, 26 Feb 2017 18:15:55 -0000
Content-Type: multipart/alternative; boundary=f403045d581235c04b054972f43a

--f403045d581235c04b054972f43a
Content-Type: text/plain; charset=UTF-8

> +PV = "0+git${SRCPV}"

https://github.com/krh/vkcube/blob/master/configure.ac#L1

says 0.1 since the very first commit, why not use that as base version
instead of just "0"?

On Sun, Feb 26, 2017 at 5:50 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> It currently requires libvulkan_intel.so (mesa intel vulkan driver),
> meaning that mesa needs to be built with "vulkan" PACKAGECONFIG.
> Also, currently vkcube is only buildable with both X and wayland
> support without other options.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../vkcube/0001-Install-the-vkcube-binary.patch    | 38
> ++++++++++++++++++++++
>  meta/recipes-graphics/vulkan/vkcube_git.bb         | 18 ++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-graphics/vulkan/vkcube/0001-Install-the-
> vkcube-binary.patch
>  create mode 100644 meta/recipes-graphics/vulkan/vkcube_git.bb
>
> diff --git a/meta/recipes-graphics/vulkan/vkcube/0001-Install-the-vkcube-binary.patch
> b/meta/recipes-graphics/vulkan/vkcube/0001-Install-the-vkcube-binary.patch
> new file mode 100644
> index 00000000000..012ee528888
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vkcube/0001-Install-
> the-vkcube-binary.patch
> @@ -0,0 +1,38 @@
> +From 18d1d30a6c7ad73b25751152cc4dda89e9cf77dd Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Sat, 25 Feb 2017 18:27:54 +0200
> +Subject: [PATCH] Install binary, never clean generated files
> +
> +We don't have the tools to regenerate the spv.h files, don't
> +clean them.
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + Makefile.am | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 78724bb..e208152 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -11,7 +11,7 @@ CFLAGS = -std=c11                            \
> +
> + CXXFLAGS = -std=c++11 $(common_CFLAGS)
> +
> +-noinst_PROGRAMS = vkcube
> ++bin_PROGRAMS = vkcube
> +
> + BUILT_SOURCES = \
> +       vkcube.vert.spv.h                       \
> +@@ -30,7 +30,5 @@ vkcube_SOURCES =                             \
> +       esTransform.c                           \
> +       esUtil.h
> +
> +-CLEANFILES = $(BUILT_SOURCES)
> +-
> + vkcube_CFLAGS = $(CFLAGS) $(MINIGBM_CPPFLAGS) $(LIBDRM_CFLAGS)
> $(WAYLAND_CFLAGS)  $(LIBPNG_CFLAGS)
> + vkcube_LDADD = $(MINIGBM_LDFLAGS) $(MESA_LDFLAGS) $(LIBDRM_LIBS)
> $(WAYLAND_LIBS)  $(LIBPNG_LIBS) -lgbm -lm -lvulkan -lxcb
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-graphics/vulkan/vkcube_git.bb
> b/meta/recipes-graphics/vulkan/vkcube_git.bb
> new file mode 100644
> index 00000000000..4a5b345cbbf
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vkcube_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "A simple Vulkan demo"
> +HOMEPAGE = "https://github.com/krh/vkcube"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://main.c;endline=24;md5=
> 9eb35fa5573e696e3f59ec043ad2b5bc"
> +
> +PV = "0+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/krh/vkcube.git \
> +           file://0001-Install-the-vkcube-binary.patch"
> +SRCREV = "80c0d047c257f486d054f28b0b381abef3327069"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig distro_features_check
> +REQUIRED_DISTRO_FEATURES = "x11 wayland"
> +
> +DEPENDS = "libpng libxcb wayland mesa libdrm vulkan"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045d581235c04b054972f43a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">+PV =3D &quot;0=
+git${SRCPV}&quot;</span><div><br></div><div><span style=3D"font-size:12.8p=
x"></span><a href=3D"https://github.com/krh/vkcube/blob/master/configure.ac=
#L1">https://github.com/krh/vkcube/blob/master/configure.ac#L1</a><br></div=
><div><br></div><div>says 0.1 since the very first commit, why not use that=
 as base version instead of just &quot;0&quot;?</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Sun, Feb 26, 2017 at 5:50 PM, =
Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel=
.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">It currently requires libvulkan_intel.so (mes=
a intel vulkan driver),<br>
meaning that mesa needs to be built with &quot;vulkan&quot; PACKAGECONFIG.<=
br>
Also, currently vkcube is only buildable with both X and wayland<br>
support without other options.<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../vkcube/0001-Install-the-<wbr>vkcube-binary.patch=C2=A0 =C2=A0 | 3=
8 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-graphics/vulkan/<a href=3D"http://vkcube_git.bb" rel=3D"=
noreferrer" target=3D"_blank">v<wbr>kcube_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 18 ++++++++++<br>
=C2=A02 files changed, 56 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/vulkan/<wbr>vkcube/0001-Inst=
all-the-<wbr>vkcube-binary.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/vulkan/<a href=3D"http://vkc=
ube_git.bb" rel=3D"noreferrer" target=3D"_blank">v<wbr>kcube_git.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/<wbr>vulkan/vkcube/0001-Install-<wbr>the=
-vkcube-binary.patch b/meta/recipes-graphics/<wbr>vulkan/vkcube/0001-Instal=
l-<wbr>the-vkcube-binary.patch<br>
new file mode 100644<br>
index 00000000000..012ee528888<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>vulkan/vkcube/0001-Install-<wbr>the-vkcube=
-binary.patch<br>
@@ -0,0 +1,38 @@<br>
+From 18d1d30a6c7ad73b25751152cc4dda<wbr>89e9cf77dd Mon Sep 17 00:00:00 200=
1<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
+Date: Sat, 25 Feb 2017 18:27:54 +0200<br>
+Subject: [PATCH] Install binary, never clean generated files<br>
+<br>
+We don&#39;t have the tools to regenerate the spv.h files, don&#39;t<br>
+clean them.<br>
+<br>
+Upstream-Status: Inappropriate [configuration]<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ Makefile.am | 4 +---<br>
+ 1 file changed, 1 insertion(+), 3 deletions(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 78724bb..e208152 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -11,7 +11,7 @@ CFLAGS =3D -std=3Dc11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+<br>
+ CXXFLAGS =3D -std=3Dc++11 $(common_CFLAGS)<br>
+<br>
+-noinst_PROGRAMS =3D vkcube<br>
++bin_PROGRAMS =3D vkcube<br>
+<br>
+ BUILT_SOURCES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vkcube.vert.spv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+@@ -30,7 +30,5 @@ vkcube_SOURCES =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esTransform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esUtil.h<br>
+<br>
+-CLEANFILES =3D $(BUILT_SOURCES)<br>
+-<br>
+ vkcube_CFLAGS =3D $(CFLAGS) $(MINIGBM_CPPFLAGS) $(LIBDRM_CFLAGS) $(WAYLAN=
D_CFLAGS)=C2=A0 $(LIBPNG_CFLAGS)<br>
+ vkcube_LDADD =3D $(MINIGBM_LDFLAGS) $(MESA_LDFLAGS) $(LIBDRM_LIBS) $(WAYL=
AND_LIBS)=C2=A0 $(LIBPNG_LIBS) -lgbm -lm -lvulkan -lxcb<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/meta/recipes-graphics/<wbr>vulkan/<a href=3D"http://vkcube_git=
.bb" rel=3D"noreferrer" target=3D"_blank">vkcube_git.bb</a> b/meta/recipes-=
graphics/<wbr>vulkan/<a href=3D"http://vkcube_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">vkcube_git.bb</a><br>
new file mode 100644<br>
index 00000000000..4a5b345cbbf<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>vulkan/<a href=3D"http://vkcube_git.bb" re=
l=3D"noreferrer" target=3D"_blank">vkcube_git.bb</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;A simple Vulkan demo&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/krh/vkcube" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/krh/vkcube</a><wbr>&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://main.c;endline=3D24;md5=3D<wbr>9eb35fa55=
73e696e3f59ec043ad2b5<wbr>bc&quot;<br>
+<br>
+PV =3D &quot;0+git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/krh/vkcube.git" rel=
=3D"noreferrer" target=3D"_blank">github.com/krh/vkcube.<wbr>git</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Install-the-<wbr>vkcu=
be-binary.patch&quot;<br>
+SRCREV =3D &quot;<wbr>80c0d047c257f486d054f28b0b381a<wbr>bef3327069&quot;<=
br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools pkgconfig distro_features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;x11 wayland&quot;<br>
+<br>
+DEPENDS =3D &quot;libpng libxcb wayland mesa libdrm vulkan&quot;<br>
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

--f403045d581235c04b054972f43a--
