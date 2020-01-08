Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
	[209.85.217.50])
	by mail.openembedded.org (Postfix) with ESMTP id 69D8E7F8B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 11:17:43 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id g15so1629478vsf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jFXuEmN+twoYwo8EyvmWytKAE1e58Rae99giQhAkOEU=;
	b=W1rYIyVDzOZdYJKiTAYaqGEIo0ehtBEZ3QCHXQ/Y++Xu+ilXDco6bp9bgualRklEFf
	ZJOCcfXfFjy0uSK8By0mWQP8iolRYrld7DRUQXrdkGvOHcbZx4EWxGfBTxFkNsmXrQwn
	cWTsKT38r2e4Ug6PsfqKLnVgipcW995ewj+usSmsIbJT16k1gswjxUnGA0DfU61YZsVu
	i/WSAq/LLFseW7yTTjLRN2wodvkZ2a7Rh9kf72FqzU336DEGaoRy4EyKP8pKqSSpe6/s
	Ie+sv47fBqpWrSEFBLt1vkDYg8CHGSyjpLPmxAbUZw/KUS6QNbdwLudGcx3e81KaGSuC
	G9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jFXuEmN+twoYwo8EyvmWytKAE1e58Rae99giQhAkOEU=;
	b=Df/KTqocFH16b9hu1f/LFNuG+4Co0jfVw0qFZvK7lMc3N8M2CD0pxKrUsljgXPJaLG
	eImbRkcENfzqEFUhcVARcjzX/YsAWmtf88dig9Vy5W0sZih7uRGkoAzEt6EEUfLhf0if
	kYhQq2VgaQLkt3M/TxHOvBHxjBvFNi8kv3hU/2v6XVYexIxdsaCmG0iJck9mbbtUygo3
	owBib4j1gVc51y9UiJGHcu5eFdIyKnnvysIIM1N6pjggqjLPRQeZfWpTtXlp2blIuTBy
	1JpKdH9FjK7wTdcwYcT7cyyjMEUmicvMXmkZZIX44/p5U9GA0n/olYtA77gURJs+YExV
	59aw==
X-Gm-Message-State: APjAAAWUtbcam5aHsEgYYjZ6pqsLHRHMvHwSzjzbgzZnJDuIHrR+p/Ds
	36y2TLxuN1zrt9CvOkEYQ+3BbROsDK5fyjlxWFSbX8gvXGg=
X-Google-Smtp-Source: APXvYqxbrsX18vezUjHFrr1h7jbIiz58g5QXyXedzRHbppsht6BmVaVtVz8uPiW/FDuC8XF5Dg+36EtsZBsUoeG8Nzs=
X-Received: by 2002:a67:3187:: with SMTP id x129mr2340530vsx.23.1578482263938; 
	Wed, 08 Jan 2020 03:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20200108065117.4556-1-yi.zhao@windriver.com>
In-Reply-To: <20200108065117.4556-1-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jan 2020 12:17:32 +0100
Message-ID: <CANNYZj90XtZ2Oi2q1u0UU9Z=+o711YQ2T0=URCxK_MdwsT_4RA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] maintainers.inc: cleanup entries
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
X-List-Received-Date: Wed, 08 Jan 2020 11:17:43 -0000
Content-Type: multipart/alternative; boundary="000000000000a05b6f059b9f0a03"

--000000000000a05b6f059b9f0a03
Content-Type: text/plain; charset="UTF-8"

Just a note: there is an oe-selftest for this which you can use to verify
that all recipes still have a maintainer listed:

oe-selftest -r distrodata.Distrodata.test_maintainers

Alex

On Wed, 8 Jan 2020 at 07:52, Yi Zhao <yi.zhao@windriver.com> wrote:

> Cleanup the following entries because these recipes have been removed
> from oe-core:
>   cve-check-tool
>   gcc-cross-initial
>   gcc-crosssdk-initial
>   gcc-source-8.3.0
>   gccmakedep
>   gnome-themes-standard
>   gtk+
>   gtk-icon-utils-native
>   libnewt-python
>   mkfontdir
>   python3-file-utils
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 2b37403345..47d5c19a62 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -134,7 +134,6 @@ RECIPE_MAINTAINER_pn-cryptodev-module = "Robert Yang <
> liezhi.yang@windriver.com>
>  RECIPE_MAINTAINER_pn-cryptodev-tests = "Robert Yang <
> liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-curl = "Armin Kuster <akuster808@gmail.com>"
> -RECIPE_MAINTAINER_pn-cve-check-tool = "Ross Burton <ross.burton@intel.com
> >"
>  RECIPE_MAINTAINER_pn-cve-update-db-native = "Ross Burton <
> ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-cwautomacros = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-db = "Mark Hatle <mark.hatle@windriver.com>"
> @@ -191,14 +190,10 @@ RECIPE_MAINTAINER_pn-gawk = "Chen Qi <
> Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-gcc = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gcc-cross-${TARGET_ARCH} = "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem
> Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER_pn-gcc-cross-initial-${TARGET_ARCH} = "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <
> raj.khem@gmail.com>"
> -RECIPE_MAINTAINER_pn-gcc-crosssdk-initial-${SDK_SYS} = "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER_pn-gcc-source-8.3.0 = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gcc-source-9.2.0 = "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER_pn-gccmakedep = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gconf = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-gdb = "Khem Raj <raj.khem@gmail.com>"
> @@ -221,7 +216,6 @@ RECIPE_MAINTAINER_pn-glibc-testsuite = "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <
> otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Ross Burton <
> ross.burton@intel.com>"
> -RECIPE_MAINTAINER_pn-gnome-themes-standard = "Ross Burton <
> ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com
> >"
>  RECIPE_MAINTAINER_pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-gnupg = "Hongxu Jia <hongxu.jia@windriver.com>"
> @@ -257,10 +251,8 @@ RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-ugly =
> "Anuj Mittal <anuj.mittal@intel
>  RECIPE_MAINTAINER_pn-gstreamer1.0-python = "Anuj Mittal <
> anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-gstreamer1.0-rtsp-server = "Anuj Mittal <
> anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi = "Anuj Mittal <
> anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER_pn-gtk+ = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-gtk+3 = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alex.kanavin@gmail.com
> >"
> -RECIPE_MAINTAINER_pn-gtk-icon-utils-native = "Ross Burton <
> ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@ti.com>"
>  RECIPE_MAINTAINER_pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@ti.com>"
> @@ -357,7 +349,6 @@ RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libmodulemd-v1 = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
> -RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <
> hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-libnotify = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-libnsl2 = "Khem Raj <raj.khem@gmail.com>"
> @@ -497,7 +488,6 @@ RECIPE_MAINTAINER_pn-meta-world-pkgdata = "Richard
> Purdie <richard.purdie@linuxf
>  RECIPE_MAINTAINER_pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-mini-x-session = "Armin Kuster <akuster808@gmail.com
> >"
>  RECIPE_MAINTAINER_pn-minicom = "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER_pn-mkfontdir = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <
> liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-mmc-utils = "Anuj Mittal <anuj.mittal@intel.com>"
> @@ -589,7 +579,6 @@ RECIPE_MAINTAINER_pn-python3-async = "Oleksandr
> Kravchuk <open.source@oleksandr-
>  RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> -RECIPE_MAINTAINER_pn-python3-file-utils = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a05b6f059b9f0a03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just a note: there is an oe-selftest for this which y=
ou can use to verify that all recipes still have a maintainer listed:</div>=
<div><br></div><div>oe-selftest -r distrodata.Distrodata.test_maintainers</=
div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 8 Jan 2020 at 07:52, Yi Zhao =
&lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Cleanup t=
he following entries because these recipes have been removed<br>
from oe-core:<br>
=C2=A0 cve-check-tool<br>
=C2=A0 gcc-cross-initial<br>
=C2=A0 gcc-crosssdk-initial<br>
=C2=A0 gcc-source-8.3.0<br>
=C2=A0 gccmakedep<br>
=C2=A0 gnome-themes-standard<br>
=C2=A0 gtk+<br>
=C2=A0 gtk-icon-utils-native<br>
=C2=A0 libnewt-python<br>
=C2=A0 mkfontdir<br>
=C2=A0 python3-file-utils<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc | 11 -----------<br>
=C2=A01 file changed, 11 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 2b37403345..47d5c19a62 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -134,7 +134,6 @@ RECIPE_MAINTAINER_pn-cryptodev-module =3D &quot;Robert =
Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">lie=
zhi.yang@windriver.com</a>&gt;<br>
=C2=A0RECIPE_MAINTAINER_pn-cryptodev-tests =3D &quot;Robert Yang &lt;<a hre=
f=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windri=
ver.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-cups =3D &quot;Chen Qi &lt;<a href=3D"mailto:Qi.=
Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;&quot;<b=
r>
=C2=A0RECIPE_MAINTAINER_pn-curl =3D &quot;Armin Kuster &lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;&quot=
;<br>
-RECIPE_MAINTAINER_pn-cve-check-tool =3D &quot;Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-cve-update-db-native =3D &quot;Ross Burton &lt;<=
a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-cwautomacros =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-db =3D &quot;Mark Hatle &lt;<a href=3D"mailto:ma=
rk.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;&=
quot;<br>
@@ -191,14 +190,10 @@ RECIPE_MAINTAINER_pn-gawk =3D &quot;Chen Qi &lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gcc =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gcc-cross-${TARGET_ARCH} =3D &quot;Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D=
 &quot;Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-gcc-cross-initial-${TARGET_ARCH} =3D &quot;Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gcc-crosssdk-${SDK_SYS} =3D &quot;Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-gcc-crosssdk-initial-${SDK_SYS} =3D &quot;Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gcc-runtime =3D &quot;Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;=
<br>
=C2=A0RECIPE_MAINTAINER_pn-gcc-sanitizers =3D &quot;Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&qu=
ot;<br>
-RECIPE_MAINTAINER_pn-gcc-source-8.3.0 =3D &quot;Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;=
<br>
=C2=A0RECIPE_MAINTAINER_pn-gcc-source-9.2.0 =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
-RECIPE_MAINTAINER_pn-gccmakedep =3D &quot;Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gconf =3D &quot;Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;&qu=
ot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gcr =3D &quot;Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gdb =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
@@ -221,7 +216,6 @@ RECIPE_MAINTAINER_pn-glibc-testsuite =3D &quot;Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-glide =3D &quot;Otavio Salvador &lt;<a href=3D"m=
ailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@o=
ssystems.com.br</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gmp =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gnome-desktop-testing =3D &quot;Ross Burton &lt;=
<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@inte=
l.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-gnome-themes-standard =3D &quot;Ross Burton &lt;<a hr=
ef=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gnu-config =3D &quot;Robert Yang &lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gnu-efi =3D &quot;Yi Zhao &lt;<a href=3D"mailto:=
yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&quot=
;<br>
=C2=A0RECIPE_MAINTAINER_pn-gnupg =3D &quot;Hongxu Jia &lt;<a href=3D"mailto=
:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&g=
t;&quot;<br>
@@ -257,10 +251,8 @@ RECIPE_MAINTAINER_pn-gstreamer1.0-plugins-ugly =3D &qu=
ot;Anuj Mittal &lt;anuj.mittal@intel<br>
=C2=A0RECIPE_MAINTAINER_pn-gstreamer1.0-python =3D &quot;Anuj Mittal &lt;<a=
 href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.=
com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gstreamer1.0-rtsp-server =3D &quot;Anuj Mittal &=
lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@i=
ntel.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi =3D &quot;Anuj Mittal &lt;<a =
href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.c=
om</a>&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-gtk+ =3D &quot;Ross Burton &lt;<a href=3D"mailto:ross=
.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;&quot;<br=
>
=C2=A0RECIPE_MAINTAINER_pn-gtk+3 =3D &quot;Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;&qu=
ot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gtk-doc =3D &quot;Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-gtk-icon-utils-native =3D &quot;Ross Burton &lt;<a hr=
ef=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-gzip =3D &quot;Denys Dmytriyenko &lt;<a href=3D"=
mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-harfbuzz =3D &quot;Anuj Mittal &lt;<a href=3D"ma=
ilto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;=
&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-hdparm =3D &quot;Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;&quot;<br>
@@ -357,7 +349,6 @@ RECIPE_MAINTAINER_pn-libmpc =3D &quot;Khem Raj &lt;<a h=
ref=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libmodule-build-perl =3D &quot;Tim Orling &lt;<a=
 href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">timothy=
.t.orling@linux.intel.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libmodulemd-v1 =3D &quot;Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libnewt =3D &quot;Hongxu Jia &lt;<a href=3D"mail=
to:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>=
&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-libnewt-python =3D &quot;Hongxu Jia &lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libnl =3D &quot;Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libnotify =3D &quot;Anuj Mittal &lt;<a href=3D"m=
ailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libnsl2 =3D &quot;Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
@@ -497,7 +488,6 @@ RECIPE_MAINTAINER_pn-meta-world-pkgdata =3D &quot;Richa=
rd Purdie &lt;richard.purdie@linuxf<br>
=C2=A0RECIPE_MAINTAINER_pn-mingetty =3D &quot;Yi Zhao &lt;<a href=3D"mailto=
:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&quo=
t;<br>
=C2=A0RECIPE_MAINTAINER_pn-mini-x-session =3D &quot;Armin Kuster &lt;<a hre=
f=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-minicom =3D &quot;Anuj Mittal &lt;<a href=3D"mai=
lto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&=
quot;<br>
-RECIPE_MAINTAINER_pn-mkfontdir =3D &quot;Armin Kuster &lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;&quot=
;<br>
=C2=A0RECIPE_MAINTAINER_pn-mkfontscale =3D &quot;Armin Kuster &lt;<a href=
=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-mklibs-native =3D &quot;Robert Yang &lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-mmc-utils =3D &quot;Anuj Mittal &lt;<a href=3D"m=
ailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt=
;&quot;<br>
@@ -589,7 +579,6 @@ RECIPE_MAINTAINER_pn-python3-async =3D &quot;Oleksandr =
Kravchuk &lt;open.source@oleksandr-<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-dbus =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-docutils =3D &quot;Oleksandr Kravchuk &l=
t;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">o=
pen.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-extras =3D &quot;Oleksandr Kravchuk &lt;=
<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">ope=
n.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-python3-file-utils =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-git =3D &quot;Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-gitdb =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-python3-iniparse =3D &quot;Oleksandr Kravchuk &l=
t;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">o=
pen.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
-- <br>
2.17.1<br>
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

--000000000000a05b6f059b9f0a03--
