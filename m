Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id D087E60C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 19:26:51 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id p14so4356606vsq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 11:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fwwcl4NcY73F49LLYVt/3LwsTY7T3SIPcy2Ry4aZ1p8=;
	b=ESLndyNh8DiMV4+QOHlM1XFhwgHYC3RqDbt4FNW/5ZIRiFH/1x+raC9BjNYOlaZKKs
	2MmR9CGUP9VUpYluMDgpKOPriUUdMH8J5rrUcWCM9p4J6HBW6UOkkJh7y+4wLvcqIIhM
	xnMu5WFQx/M+wV8kFZYi7AcGOnMkfZzuO92aWx1uDEJMfszfeUVZYADRiL3M9XR8bZzY
	pBGKwFR3Y6K6C0goe7FOH83+pf7FsNhLetiF+A3lMgYOrC8F4sbEMXul9Tm7XibCQpOk
	wJfzQOmqTlJtthwXfH6yEksn7V0OMp/iZy5RVlVQWv9NjlyLrttgqsFM1tnV2wK83ScK
	lrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fwwcl4NcY73F49LLYVt/3LwsTY7T3SIPcy2Ry4aZ1p8=;
	b=q9aUSg//dHswdqaiSE8ML2p5femA6k5ovle2keC3ATxvzmAgfXoQ2LPECKcJh6IbR7
	NFKEeljVb5519vSsVQscrLNZwTpGsZ9nR2NelsJdeIM3kX3DQaEmh4Dx9yHrojJT1DmO
	4x2jDnmB4tJTkraJJMQP08VsXOhrTdbFJ/wUt5Uqmm3cJ+NK8kecUZPnU4JkQTpTCplp
	wZKT4cNtZN0GRkXt3tw3KSEaCNUJ6800V8/byA6aUZD3XFGxQuiHg3oNUsJ3dPxUqAUp
	JPiEqC6ZfC1oSecrj1KDB02vRC3Hj6ga/9o1dffWmU/pe0CYde1ds2YPVSmNE+SAoIMn
	WP4Q==
X-Gm-Message-State: APjAAAUdZMshFurJk0fTU1g0Oj2xWema+xSD9yN0mDmlMo+u0lFC9hgx
	G+rkmvM3lV7TQtRrEbtu40wOHSM01iPMIqiFLpI=
X-Google-Smtp-Source: APXvYqxYAbqu03ejjaywGiOsSBVaObyauxK+E9t8b9y87YM8HZh2plxB5ld7WOLfiQVpuKcB4DwF18LorpEdecJCGG0=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr16554270vsa.25.1581622012711; 
	Thu, 13 Feb 2020 11:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20200213163918.29470-1-scott.branden@broadcom.com>
In-Reply-To: <20200213163918.29470-1-scott.branden@broadcom.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 20:26:41 +0100
Message-ID: <CANNYZj-sdO8mrRLet5WSBV-MnSo5b-E4ZvsR+7PvgxFtse=ZKA@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] x265: add x265 recipe
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
X-List-Received-Date: Thu, 13 Feb 2020 19:26:52 -0000
Content-Type: multipart/alternative; boundary="0000000000003c963b059e7a12ab"

--0000000000003c963b059e7a12ab
Content-Type: text/plain; charset="UTF-8"

Wrong mailing list, should go to oe-devel.

Alex

On Thu, 13 Feb 2020 at 17:39, Scott Branden via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../recipes-multimedia/x265/x265_3.2.1.bb     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644
> meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
>
> diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/
> x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/
> x265_3.2.1.bb
> new file mode 100644
> index 0000000000..68c1a55c8c
> --- /dev/null
> +++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/
> x265_3.2.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "H.265/HEVC video encoder"
> +DESCRIPTION = "A free software library and application for encoding video
> streams into the H.265/HEVC format."
> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> +
> +LICENSE = "GPLv2"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM =
> "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> +
> +DEPENDS = "nasm-native gnutls zlib libpcre"
> +
> +SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
> +
> +S = "${WORKDIR}/x265_${PV}/source"
> +
> +SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
> +SRC_URI[sha256sum] =
> "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
> +
> +inherit lib_package pkgconfig cmake
> +
> +AS[unexport] = "1"
> +
> +COMPATIBLE_MACHINE = "^$"
> +COMPATIBLE_MACHINE_x86 = ".*"
> +COMPATIBLE_MACHINE_x86-64 = ".*"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003c963b059e7a12ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wrong mailing list, should go to oe-devel.</div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 13 Feb 2020 at 17:39, Scott Branden v=
ia Openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembe=
dded.org">openembedded-core@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Add x265 recipe for lates=
t tag of Release_3.2 branch (3.2.1).<br>
<br>
Signed-off-by: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadcom.c=
om" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-multimedia/x265/<a href=3D"http://x265_3.2.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">x265_3.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0| 24 ++++=
+++++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta-openembedded/meta-multimedia/recipes-multimed=
ia/x265/<a href=3D"http://x265_3.2.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">x265_3.2.1.bb</a><br>
<br>
diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/<a h=
ref=3D"http://x265_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">x265_3.2.=
1.bb</a> b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/<a hre=
f=3D"http://x265_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">x265_3.2.1.=
bb</a><br>
new file mode 100644<br>
index 0000000000..68c1a55c8c<br>
--- /dev/null<br>
+++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/<a href=3D"=
http://x265_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">x265_3.2.1.bb</a=
><br>
@@ -0,0 +1,24 @@<br>
+SUMMARY =3D &quot;H.265/HEVC video encoder&quot;<br>
+DESCRIPTION =3D &quot;A free software library and application for encoding=
 video streams into the H.265/HEVC format.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.videolan.org/developers/x265.html=
" rel=3D"noreferrer" target=3D"_blank">http://www.videolan.org/developers/x=
265.html</a>&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LICENSE_FLAGS =3D &quot;commercial&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://../COPYING;md5=3Dc9e0427bc58f129f99728c6=
2d4ad4091&quot;<br>
+<br>
+DEPENDS =3D &quot;nasm-native gnutls zlib libpcre&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://ftp.videolan.org/pub/videolan/x265/x26=
5_$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.videola=
n.org/pub/videolan/x265/x265_${PV}.tar.gz</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/x265_${PV}/source&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;94808045a34d88a857e5eaf3f68f4bca&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b86=
4387cec31e3b58cbbcc&quot;<br>
+<br>
+inherit lib_package pkgconfig cmake<br>
+<br>
+AS[unexport] =3D &quot;1&quot;<br>
+<br>
+COMPATIBLE_MACHINE =3D &quot;^$&quot;<br>
+COMPATIBLE_MACHINE_x86 =3D &quot;.*&quot;<br>
+COMPATIBLE_MACHINE_x86-64 =3D &quot;.*&quot;<br>
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

--0000000000003c963b059e7a12ab--
