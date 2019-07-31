Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 364EA7BE3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:17:46 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 190so45778876vsf.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 03:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sUBF10vun2j9nWU/SZofUaJC7Cr/hhCc61aJF6Gv4nU=;
	b=PJ3vM78B2FpRrVmr5pWdEznjX4z4rQVEYVoG2GIiE1n3LFJu+gyZBxEELm4MTGD2Mp
	nwugjFoolf2jtyVCon+B9QSxPpC4PF0mXhEk3HFlqqdCkbfmrT4tvyDRbzWDq4KeuaHQ
	Vl49PXQOf5fsCOICsR9djNRNylx4sH2WYTL7dMq0TrdkR4TPODz08cgA4sd11fXtMOj/
	Hn4+xgpztkYZHa/eoIAyF1eXyBdhTbogLZEb8oRj4wFo/P6g6cTrFKWVN/TwsIPFxifE
	oYFTBqcd0XsBhkfe7OnoUrljKnrkR9XHeO+jWj9h17Iz69U3cSHQGTvAHlVJBKZBwQ1r
	ApUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sUBF10vun2j9nWU/SZofUaJC7Cr/hhCc61aJF6Gv4nU=;
	b=Qlz2DmgsLllScjlFM3GOj/9qtGAG24cLYK/GNIi/Ea8BXGyn0YNODnDc/j3T35HlE7
	QgQkhHboNdy7oPmrtErffuTXdCdl4pPCZuFuFxlYqahfc/f0G+Xf5nLW5nmHlM2JZBoH
	EBvtVuC1DXHDtsTvpbvgk5qgZuyPu3FkwPvutYllyEBw0UFOJulIsm6jwRIIBSKfKVgL
	2rvuWfmohGIC7q3lIl65pPgsvEYufvM0VXYscNTsj9vll6DvRgsTzEqk4kf0StSdIM2s
	XHPpwc0i8Z2hzVTcqHxFxrk/P2cKBdWGNSoNSEZbBcEfHO70xGkRpdHudLjwMvkhqIK/
	GMRA==
X-Gm-Message-State: APjAAAUk6B4EKQqKeXhxo4g4zvwYvSJ+pNkdqt8gxKHvSCs0eRKmcSde
	kZGi7DDjaihLdx9nm9/AqCiYaCWJARZPbh8ZWxzR2i/a
X-Google-Smtp-Source: APXvYqzETttIhjIND1aSX2xM9RfOHCblrXe93ntLMgGSWrPZ8TAae4DDKwUFTNMXhVoDYz35vqFVbVVblSKUzyukff0=
X-Received: by 2002:a05:6102:db:: with SMTP id
	u27mr8879651vsp.83.1564568267068; 
	Wed, 31 Jul 2019 03:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190731093347.16834-1-bunk@stusta.de>
In-Reply-To: <20190731093347.16834-1-bunk@stusta.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Jul 2019 12:17:35 +0200
Message-ID: <CANNYZj9Yi6MQPo_8yzy-iSorHRfc3Syj5_wLj7jSLuuJNykefQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: Upgrade to 2.1.1
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
X-List-Received-Date: Wed, 31 Jul 2019 10:17:46 -0000
Content-Type: multipart/alternative; boundary="000000000000c9198c058ef76f87"

--000000000000c9198c058ef76f87
Content-Type: text/plain; charset="UTF-8"

Please do not use ftp:// as it is deprecated for oe-core recipes. We are
trying to eliminate it entirely.
(if no http is available, then git is actually preferred!)

Alex

On Wed, 31 Jul 2019 at 11:34, Adrian Bunk <bunk@stusta.de> wrote:

> Move from a git snapshot to a tarball release.
>
> Add zstd PACKAGECONFIG to disable the zstd support that upstream
> enables by default, zstd is not in oe-core.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../mtd/{mtd-utils_git.bb => mtd-utils_2.1.1.bb}       | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  rename meta/recipes-devtools/mtd/{mtd-utils_git.bb => mtd-utils_2.1.1.bb}
> (92%)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> b/meta/recipes-devtools/mtd/mtd-utils_2.1.1.bb
> similarity index 92%
> rename from meta/recipes-devtools/mtd/mtd-utils_git.bb
> rename to meta/recipes-devtools/mtd/mtd-utils_2.1.1.bb
> index 49a650a9ef..dc39ee6058 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_2.1.1.bb
> @@ -10,14 +10,11 @@ inherit autotools pkgconfig update-alternatives
>  DEPENDS = "zlib e2fsprogs util-linux"
>  RDEPENDS_mtd-utils-tests += "bash"
>
> -PV = "2.1.0+${SRCPV}"
> -
> -SRCREV = "b5027be5f470830ac9543db3c52e076b13abd313"
> -SRC_URI = "git://git.infradead.org/mtd-utils.git \
> +SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://add-exclusion-to-mkfs-jffs2-git-2.patch \
>  "
> -
> -S = "${WORKDIR}/git/"
> +SRC_URI[md5sum] = "94bbd31b217a5169ae26ab8c0442f691"
> +SRC_URI[sha256sum] =
> "8d15e8b70f036d6af1a66011f8ca0e048e9675fa7983d33bea92c24313a232d2"
>
>  EXTRA_OECONF += "--enable-install-tests"
>
> @@ -30,6 +27,7 @@ PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
>  PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
>  PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
>  PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
> +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
>
>  CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c9198c058ef76f87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please do not use ftp:// as it is deprecated for oe-c=
ore recipes. We are trying to eliminate it entirely.</div><div>(if no http =
is available, then git is actually preferred!)<br></div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 31 Jul 2019 at 11:34, Adrian Bunk &lt;<a href=3D"ma=
ilto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Move from a git snapshot to a tarball re=
lease.<br>
<br>
Add zstd PACKAGECONFIG to disable the zstd support that upstream<br>
enables by default, zstd is not in oe-core.<br>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"=
_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0.../mtd/{<a href=3D"http://mtd-utils_git.bb" rel=3D"noreferrer" targe=
t=3D"_blank">mtd-utils_git.bb</a> =3D&gt; <a href=3D"http://mtd-utils_2.1.1=
.bb" rel=3D"noreferrer" target=3D"_blank">mtd-utils_2.1.1.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/mtd/{<a href=3D"http://mtd-utils_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> =3D&gt; <a href=
=3D"http://mtd-utils_2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">mtd-uti=
ls_2.1.1.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" =
rel=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> b/meta/recipes-de=
vtools/mtd/<a href=3D"http://mtd-utils_2.1.1.bb" rel=3D"noreferrer" target=
=3D"_blank">mtd-utils_2.1.1.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" r=
el=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
rename to meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_2.1.1.bb" r=
el=3D"noreferrer" target=3D"_blank">mtd-utils_2.1.1.bb</a><br>
index 49a650a9ef..dc39ee6058 100644<br>
--- a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"=
noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_2.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mtd-utils_2.1.1.bb</a><br>
@@ -10,14 +10,11 @@ inherit autotools pkgconfig update-alternatives<br>
=C2=A0DEPENDS =3D &quot;zlib e2fsprogs util-linux&quot;<br>
=C2=A0RDEPENDS_mtd-utils-tests +=3D &quot;bash&quot;<br>
<br>
-PV =3D &quot;2.1.0+${SRCPV}&quot;<br>
-<br>
-SRCREV =3D &quot;b5027be5f470830ac9543db3c52e076b13abd313&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.infradead.org/mtd-utils.git"=
 rel=3D"noreferrer" target=3D"_blank">git.infradead.org/mtd-utils.git</a> \=
<br>
+SRC_URI =3D &quot;<a href=3D"ftp://ftp.infradead.org/pub/$%7BBPN%7D/$%7BBP=
N%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.infr=
adead.org/pub/${BPN}/${BPN}-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-exclusion-to-mkfs-jffs=
2-git-2.patch \<br>
=C2=A0&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git/&quot;<br>
+SRC_URI[md5sum] =3D &quot;94bbd31b217a5169ae26ab8c0442f691&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8d15e8b70f036d6af1a66011f8ca0e048e9675fa7983d=
33bea92c24313a232d2&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-install-tests&quot;<br>
<br>
@@ -30,6 +27,7 @@ PACKAGECONFIG[xattr] =3D &quot;--with-xattr,--without-xat=
tr,acl&quot;<br>
=C2=A0PACKAGECONFIG[crypto] =3D &quot;--with-crypto,--without-crypto,openss=
l&quot;<br>
=C2=A0PACKAGECONFIG[jffs] =3D &quot;--with-jffs,--without-jffs&quot;<br>
=C2=A0PACKAGECONFIG[ubifs] =3D &quot;--with-ubifs,--without-ubifs&quot;<br>
+PACKAGECONFIG[zstd] =3D &quot;--with-zstd,--without-zstd,zstd&quot;<br>
<br>
=C2=A0CPPFLAGS_append_riscv64=C2=A0 =3D &quot; -pthread -D_REENTRANT&quot;<=
br>
<br>
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

--000000000000c9198c058ef76f87--
