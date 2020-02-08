Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id C81C560BA8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 01:12:32 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c24so869138qtp.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 17:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2p9PrPVxuy1mWAO+8jRXTaLh2JzyLzT6J4eINRi6Jrc=;
	b=Im/CZuvO9C8/TcB+Dz94kbKM3kEvpYqHaa+c+CVI5iY8oKCE0V4bAMeLVo/CmaPrX0
	mP9tP+up7yXSTb2roiySMskMO5Pc4OYhwqi2LaZEuKk8ju77R3TP3ATtiqcspqWzskau
	dx8i+qSDDO4hLr2ZO3rMx7oAXwGo8eoCXPVinBep/35pOfk98mccFp2xFw2o3NYs3/7m
	AaoL1NXtDR7qoYnGqwOsXy3P4CrxV5J5FuHik5DwpSexzPaGsootQV8/WlxJKY8DoYjP
	pD2H04eXCDLdFc8lQ7OEuApVQ4xgsKvjrvFTNkYzvKHpMWT88CTTAQVkL5B0cEElUIiS
	1tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2p9PrPVxuy1mWAO+8jRXTaLh2JzyLzT6J4eINRi6Jrc=;
	b=kmQfbQDJ3hNvooNoS9aVMMmJvVXEf7evE48TySOYyrXoOoJ4Cej9IxeEzdKB0GpqPQ
	7ldIE8lmNpAz8eVjxma4UwPawtnZcXakabcjtmCQArInolR/x2P1YI+y96AScpryrI+v
	ZBjlY7/lx9dTS2nMwzckCjGD5NiFSCGv+jXzq7FoXnYCsOoz/4Xm7rxefpV6GvgT9ABM
	CMwzffvQOUO+FHgSBgdcVdtEymWYRfybkiBHFYWmRbxkRhLijpudrDnPJNKTqZlI6A5B
	h/I308XdvEJbYCXzEumvZBiu3pPLqKENsBK5TD2AiKSPDbZEj6E96zONguwbGIG1spfC
	QS2g==
X-Gm-Message-State: APjAAAUVUHZFExIxWExPEfxp9psQUhSHIN8Qx3b7f5nr6zLTBu6fmDpJ
	JSC7Nmdwn8E+5vpxpm+mp+GeTqsK7fwvIXCHepY=
X-Google-Smtp-Source: APXvYqyzC3jkQ+q0+fGuBKmlMK9Q8XtHQajKNAFP29XPZSBuXoYc36hdQWuFEZqAa0THEBhY+YC8IYQxwyVxtJqCoWk=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr1050683qtn.378.1581124353578; 
	Fri, 07 Feb 2020 17:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20200208000110.29065-1-scott.branden@broadcom.com>
In-Reply-To: <20200208000110.29065-1-scott.branden@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Feb 2020 17:12:22 -0800
Message-ID: <CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] x265: add x265 recipe
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
X-List-Received-Date: Sat, 08 Feb 2020 01:12:33 -0000
Content-Type: multipart/alternative; boundary="00000000000070dcb5059e06339e"

--00000000000070dcb5059e06339e
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Add x265 recipe from latest revision of stable branch.


I wonder if it belongs to core are there deps on it that we need in common
metadata

>
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  meta/recipes-multimedia/x265/x265_git.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>
> diff --git a/meta/recipes-multimedia/x265/x265_git.bb
> b/meta/recipes-multimedia/x265/x265_git.bb
> new file mode 100644
> index 0000000000..796fbbc13a
> --- /dev/null
> +++ b/meta/recipes-multimedia/x265/x265_git.bb
> @@ -0,0 +1,20 @@
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
> +DEPENDS = "gnutls zlib libpcre"
> +
> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
> +          "
> +
> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
> +
> +S = "${WORKDIR}/git/source"
> +
> +inherit lib_package pkgconfig cmake
> +
> +AS[unexport] = "1"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000070dcb5059e06339e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedd=
ed-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org">ope=
nembedded-core@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Add x265 recipe from latest revision of stable branch.</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder if it belo=
ngs to core are there deps on it that we need in common metadata=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadcom.c=
om" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" rel=3D"no=
referrer" target=3D"_blank">x265_git.bb</a> | 20 ++++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/x265/<a href=3D"http://x26=
5_git.bb" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a><br>
<br>
diff --git a/meta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" re=
l=3D"noreferrer" target=3D"_blank">x265_git.bb</a> b/meta/recipes-multimedi=
a/x265/<a href=3D"http://x265_git.bb" rel=3D"noreferrer" target=3D"_blank">=
x265_git.bb</a><br>
new file mode 100644<br>
index 0000000000..796fbbc13a<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" rel=3D"no=
referrer" target=3D"_blank">x265_git.bb</a><br>
@@ -0,0 +1,20 @@<br>
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
+DEPENDS =3D &quot;gnutls zlib libpcre&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/videolan/x265;branch=
=3Dstable" rel=3D"noreferrer" target=3D"_blank">github.com/videolan/x265;br=
anch=3Dstable</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+SRCREV =3D &quot;4ef6b67fd46e1584e52a11a264812edcaef02526&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git/source&quot;<br>
+<br>
+inherit lib_package pkgconfig cmake<br>
+<br>
+AS[unexport] =3D &quot;1&quot;<br>
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
</blockquote></div></div>

--00000000000070dcb5059e06339e--
