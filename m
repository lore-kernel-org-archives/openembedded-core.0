Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.10168.1623529409877896067
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jun 2021 13:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vc4uTWmi;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id g34so3912406uah.8
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jun 2021 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uzrt+0lilgp0wxKPaKDdK/0zxYDWusoPL6hq/KJenaU=;
        b=vc4uTWmi/EYp+3y+v2HO+rP1/v6RTcFWdXCIkgcDI4xYV6A2xKJPX3vWeWC68z69QP
         M84kbEanCYBf0XgbjHaqXwSzvBYokB7uJEBLWf0ZWwuQOYMIedCTzi+0905bOUnSg9Kd
         LBy4O5fDsuhUPOt0rLpNUeB+K1WJ6OkoPiwPnAxI8foMA5vvvCPgS25Td6ONix3KHPop
         0GnJvrPFVz7/Wff5Mxuzd5tKaxSlOf56po5osVqAunGjNHLNxtMgXQEWSJMOOfVs4Aqa
         g/JrQT78FlykxU+8mayiBPfh+QKSjLnt0/4D1ExVAAXDSKZwmz0DokpMwVSvcOZjkBlX
         wDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uzrt+0lilgp0wxKPaKDdK/0zxYDWusoPL6hq/KJenaU=;
        b=Wu++T4+N1QAcgdBAgLpTDfJ+gY2IeIeaGDkwHjwqAF1awWbbG8gcXb9eTWvLHf1b5E
         50cPFJKUjBHbYlzz6UuOimrJNoZJ7UjaxY8o3h8HZo7Nj0fYN8XIglWVv7TDLYAQgo+M
         KRsjylIE5h40m7Mq6oPU0L7XN7lGmMH5Q/MB3H1Cl9veSoFbxz4gISPQTv/LKPLxWROx
         5pUJ95BGCGNYNq0LCB8aUwE0g24pbblOhpVCysKS82sQ0LX+VRufKDR3MKqbptVabHrg
         l3c3SRtMIh1lOsHBRCuHTGDxcgFH738C7O6USF4t9C95TAAWmOMz14rAXqseJLiKFoTn
         UihA==
X-Gm-Message-State: AOAM5335Ep6k8QondVcz540ibyjgz9aq1NM+V1BokTE2Uu6r1eLzPgEh
	FO+tLmZ/n07Seq9aEAdRlNL+IrnzjOI70kyjUR8=
X-Google-Smtp-Source: ABdhPJxKj59e6M7r6TAkGToC/yxgDGU0OklGYmEKo/r4nTYUpgXWDSmWcF3eH4kFv2dCLygCcno41SZ1nOa6kN4fHk4=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr8032980uan.93.1623529408968;
 Sat, 12 Jun 2021 13:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210612194315.676681-1-raj.khem@gmail.com>
In-Reply-To: <20210612194315.676681-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 12 Jun 2021 22:23:17 +0200
Message-ID: <CANNYZj9J3eM9vaoCQuU02uPLad-WhZXVD_+PiZ1egqEUohcx8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gcompat: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Andrea Adami <andrea.adami@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b43c6705c4976599"

--000000000000b43c6705c4976599
Content-Type: text/plain; charset="UTF-8"

Please ensure that PV is set so that upstream version check works (I'm not
sure if it does, looking at it):

devtool check-upgrade-status gcompat


Alex

On Sat, 12 Jun 2021 at 21:43, Khem Raj <raj.khem@gmail.com> wrote:

> This is a compat library which helps running pre-compiled binaries which
> were
> compiled for glibc but needs to run on musl systems, this is quite
> common case where pre-existing binaries are supplied and can not be
> recompiled immediately
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 +
>  meta/recipes-core/musl/gcompat_git.bb    | 42 ++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-core/musl/gcompat_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 71943ffe26..e59f01d66a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -229,6 +229,7 @@ RECIPE_MAINTAINER_pn-gobject-introspection =
> "Alexander Kanavin <alex.kanavin@gm
>  RECIPE_MAINTAINER_pn-gperf = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-gpgme = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-gptfdisk = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER_pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-grub = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-core/musl/gcompat_git.bb
> b/meta/recipes-core/musl/gcompat_git.bb
> new file mode 100644
> index 0000000000..6792c0be70
> --- /dev/null
> +++ b/meta/recipes-core/musl/gcompat_git.bb
> @@ -0,0 +1,42 @@
> +# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "A library which provides glibc-compatible APIs for use on musl
> libc systems"
> +HOMEPAGE = "https://git.adelielinux.org/adelie/gcompat"
> +
> +LICENSE = "NCSA"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
> +
> +SRC_URI = "git://
> git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current"
> +
> +PV = "1.0.0+1.1+git${SRCPV}"
> +SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig linuxloader
> +
> +DEPENDS += "musl-obstack"
> +
> +GLIBC_LDSO = "${@get_glibc_loader(d)}"
> +MUSL_LDSO = "${@get_musl_loader(d)}"
> +
> +EXTRA_OEMAKE = "LINKER_PATH=${MUSL_LDSO} LOADER_NAME=`basename
> ${@get_glibc_loader(d)}`"
> +
> +do_configure () {
> +       :
> +}
> +
> +do_compile () {
> +       oe_runmake
> +}
> +
> +do_install () {
> +       oe_runmake install 'DESTDIR=${D}'
> +}
> +#
> +# We will skip parsing for non-musl systems
> +#
> +COMPATIBLE_HOST = ".*-musl.*"
> +
> +UPSTREAM_CHECK_COMMITS = "1"
> --
> 2.32.0
>
>
> 
>
>

--000000000000b43c6705c4976599
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please ensure that PV is set so that upstream version=
 check works (I&#39;m not sure if it does, looking at it):</div><div><br></=
div><div>devtool check-upgrade-status gcompat</div><div><br></div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, 12 Jun 2021 at 21:43, Khem Raj &lt;<a href=
=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">This is a compat library =
which helps running pre-compiled binaries which were<br>
compiled for glibc but needs to run on musl systems, this is quite<br>
common case where pre-existing binaries are supplied and can not be<br>
recompiled immediately<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.com" target=3D"_=
blank">andrea.adami@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc |=C2=A0 1 +<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://gcompat_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">gcompat_git.bb</a>=C2=A0 =C2=A0 | 42 ++++++++++++=
++++++++++++<br>
=C2=A02 files changed, 43 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/musl/<a href=3D"http://gcompat_=
git.bb" rel=3D"noreferrer" target=3D"_blank">gcompat_git.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/i=
nclude/maintainers.inc<br>
index 71943ffe26..e59f01d66a 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -229,6 +229,7 @@ RECIPE_MAINTAINER_pn-gobject-introspection =3D &quot;A=
lexander Kanavin &lt;alex.kanavin@gm<br>
=C2=A0RECIPE_MAINTAINER_pn-gperf =3D &quot;Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gpgme =3D &quot;Hongxu Jia &lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gptfdisk =3D &quot;Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-gcompat =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-grep =3D &quot;Denys Dmytriyenko &lt;<a href=3D=
"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;&quot;<br=
>
=C2=A0RECIPE_MAINTAINER_pn-groff =3D &quot;Hongxu Jia &lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-grub =3D &quot;Anuj Mittal &lt;<a href=3D"mailt=
o:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&qu=
ot;<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://gcompat_git.bb" rel=
=3D"noreferrer" target=3D"_blank">gcompat_git.bb</a> b/meta/recipes-core/m=
usl/<a href=3D"http://gcompat_git.bb" rel=3D"noreferrer" target=3D"_blank">=
gcompat_git.bb</a><br>
new file mode 100644<br>
index 0000000000..6792c0be70<br>
--- /dev/null<br>
+++ b/meta/recipes-core/musl/<a href=3D"http://gcompat_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">gcompat_git.bb</a><br>
@@ -0,0 +1,42 @@<br>
+# Copyright (C) 2021 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+SUMMARY =3D &quot;A library which provides glibc-compatible APIs for use =
on musl libc systems&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.adelielinux.org/adelie/gcompat"=
 rel=3D"noreferrer" target=3D"_blank">https://git.adelielinux.org/adelie/gc=
ompat</a>&quot;<br>
+<br>
+LICENSE =3D &quot;NCSA&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Deb33ef4af05a9c7602843afb7=
adfe792&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.adelielinux.org/adelie/gcom=
pat.git;protocol=3Dhttps;branch=3Dcurrent" rel=3D"noreferrer" target=3D"_bl=
ank">git.adelielinux.org/adelie/gcompat.git;protocol=3Dhttps;branch=3Dcurre=
nt</a>&quot;<br>
+<br>
+PV =3D &quot;1.0.0+1.1+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;af5a49e489fdc04b9cf02547650d7aeaccd43793&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit pkgconfig linuxloader<br>
+<br>
+DEPENDS +=3D &quot;musl-obstack&quot;<br>
+<br>
+GLIBC_LDSO =3D &quot;${@get_glibc_loader(d)}&quot;<br>
+MUSL_LDSO =3D &quot;${@get_musl_loader(d)}&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &quot;LINKER_PATH=3D${MUSL_LDSO} LOADER_NAME=3D`basename=
 ${@get_glibc_loader(d)}`&quot;<br>
+<br>
+do_configure () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
+}<br>
+<br>
+do_compile () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br>
+}<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake install &#39;DESTDIR=3D${D}&#39;<br=
>
+}<br>
+#<br>
+# We will skip parsing for non-musl systems<br>
+#<br>
+COMPATIBLE_HOST =3D &quot;.*-musl.*&quot;<br>
+<br>
+UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b43c6705c4976599--
