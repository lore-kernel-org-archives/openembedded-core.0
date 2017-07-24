Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id DF68F783AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:12:35 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v205so14182258itf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T6dgZ1PmV8A42r9PFqRE9I167Pp1yHB5pR8UPJn0qIE=;
	b=CJlo7TgXaskUtf1EU2YTB+Keo1q7edHiSfxBBP3NaIFpjseOtKuN/vPegz3W3pLK5g
	3pOMG5DjXOUHIGXVVf/lsnkA0IaJS14vbbMkhAL8S+HX099NOqqzVgh50maXPqpdJboc
	pmOhvbNybh5A7iUxSbbXJIj23ND+zNy+QqG723FY3i9GcRmdATCDhA/jQ/fREOtwKaY1
	E7zaz4XV/OSvtkdrNZJ8Yz83yC5EyG8vdvuwj1pBbRa4t6SGFdWJxVFUmtvEuhelYMx5
	Dxie1p9KXE0fjNM2ct0tPvWTUxHB+bSRIujMHj+Kaq933+k94EXyogsio3HprIw2doGE
	NqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T6dgZ1PmV8A42r9PFqRE9I167Pp1yHB5pR8UPJn0qIE=;
	b=hRVzZLl3Oo7ZRyTIz+2M+paRhiOd9fRXRUq7UUITz7nPI6E8I8dmTUFXdZwkvhZdOX
	D8oQggBLbfR2djVCyMgAeHlZBcbE/XbS7iRd62VNC7TXgaB9Q0F3SAiioBz4NMrTAyC8
	gMAd2w4WFL0hSbVGnnpf6rxyNaTUA6Gq4xOsJXdMF5Wwt4sfSxJ1sE9yBN6YNVC21Gi7
	JHn95uCHP9VwbJQ2cAne9eUNI3rOUzROeTfvvCx4XP9GlHohIaexv8HQNDcPXIfr0Sff
	LVfnmrUuzy3KC2lAdN9H0zs1cXl7z3KBJbrAoFIfHJIiuv0tebQtbm2oyqypai9dMAbV
	kJrg==
X-Gm-Message-State: AIVw112yxSSZz+/lY4X1TBvNxhYHwEJZpIkN4eGQFMB14jxjFA6xcdOX
	jaTWpRx302mmZ7EM7vJ/m1chUtL83Llb
X-Received: by 10.36.201.198 with SMTP id h189mr6357227itg.113.1500887556747; 
	Mon, 24 Jul 2017 02:12:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 24 Jul 2017 02:12:16 -0700 (PDT)
In-Reply-To: <1500551494-19244-1-git-send-email-maxin.john@intel.com>
References: <1500551494-19244-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jul 2017 10:12:16 +0100
Message-ID: <CAJTo0Lbfro=E6O=1Gt_R8qFi1jB8JutD=TXCn=icTQMJ3rmAzw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng: upgrade to 1.6.30
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
X-List-Received-Date: Mon, 24 Jul 2017 09:12:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c089360abdc4d05550c9d83"

--94eb2c089360abdc4d05550c9d83
Content-Type: text/plain; charset="UTF-8"

Fails on beaglebone:

../libpng-1.6.30/arm/../pngpriv.h:476: Error: bad instruction `typedef
unsigned long png_ptruint'

Ross

On 20 July 2017 at 12:51, Maxin B. John <maxin.john@intel.com> wrote:

> 1.6.29 -> 1.6.30
>
> No changes in License.The license checksums changed because of
> update in Copyright dates in LICENSE and png.h files.
>
> Since GENTOO_MIRROR also removes the older releases of libpng,
> it makes sense to move back to the original SOURCEFORGE_MIRROR
> and provide an additional MIRROR to the standard path of the
> old binaries present in libpng project - "older-releases".
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../libpng/{libpng_1.6.29.bb => libpng_1.6.30.bb}         | 15
> +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.29.bb =>
> libpng_1.6.30.bb} (53%)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
> b/meta/recipes-multimedia/libpng/libpng_1.6.30.bb
> similarity index 53%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.29.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.30.bb
> index 8a3056e..f9ff1a9 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.30.bb
> @@ -2,14 +2,17 @@ SUMMARY = "PNG image format decoding library"
>  HOMEPAGE = "http://www.libpng.org/"
>  SECTION = "libs"
>  LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=f9acafc1325f8f8da80aeee94dbc1bda \
> -                    file://png.h;endline=144;md5=
> 0b2aa20c7ff55d9411108317df8ff0c9"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e2caf3f5970737a6a7b746d8a0d12105 \
> +                    file://png.h;endline=144;md5=
> 7c8feac6904795276e99304ac474f852"
>  DEPENDS = "zlib"
> +LIBV = "16"
>
> -SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
> -          "
> -SRC_URI[md5sum] = "3245dbd76ea91e1437507357b858ec97"
> -SRC_URI[sha256sum] = "4245b684e8fe829ebb76186327bb37
> ce5a639938b219882b53d64bd3cfc5f239"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/$
> {PV}/libpng-${PV}.tar.xz"
> +
> +MIRRORS += "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/
> older-releases/${PV}"
> +
> +SRC_URI[md5sum] = "88a729d47eaf880d61a0ef90f4bd5e8f"
> +SRC_URI[sha256sum] = "267c332ffff70cc599d3929207869f
> 698798f1df143aa5f9597b007c14353666"
>
>  BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c089360abdc4d05550c9d83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Fails on beaglebone:</div><div><br>../libpng-1.6.30/a=
rm/../pngpriv.h:476: Error: bad instruction `typedef unsigned long png_ptru=
int&#39;</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On 20 July 2017 at 12:51, Maxin B. John <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blan=
k">maxin.john@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">1.6.29 -&gt; 1.6.30<br>
<br>
No changes in License.The license checksums changed because of<br>
update in Copyright dates in LICENSE and png.h files.<br>
<br>
Since GENTOO_MIRROR also removes the older releases of libpng,<br>
it makes sense to move back to the original SOURCEFORGE_MIRROR<br>
and provide an additional MIRROR to the standard path of the<br>
old binaries present in libpng project - &quot;older-releases&quot;.<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0.../libpng/{<a href=3D"http://libpng_1.6.29.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libpng_1.6.29.bb</a> =3D&gt; <a href=3D"http://libpng_1.6.3=
0.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.30.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++------<br>
=C2=A01 file changed, 9 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/<wbr>libpng/{<a href=3D"http://libpng_=
1.6.29.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.29.bb</a> =3D&gt=
; <a href=3D"http://libpng_1.6.30.bb" rel=3D"noreferrer" target=3D"_blank">=
libpng_1.6.30.bb</a>} (53%)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>libpng/<a href=3D"http://libpng_1=
.6.29.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.29.bb</a> b/meta/=
recipes-multimedia/<wbr>libpng/<a href=3D"http://libpng_1.6.30.bb" rel=3D"n=
oreferrer" target=3D"_blank">libpng_1.6.30.bb</a><br>
similarity index 53%<br>
rename from meta/recipes-multimedia/<wbr>libpng/<a href=3D"http://libpng_1.=
6.29.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.29.bb</a><br>
rename to meta/recipes-multimedia/<wbr>libpng/<a href=3D"http://libpng_1.6.=
30.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.30.bb</a><br>
index 8a3056e..f9ff1a9 100644<br>
--- a/meta/recipes-multimedia/<wbr>libpng/<a href=3D"http://libpng_1.6.29.b=
b" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.29.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>libpng/<a href=3D"http://libpng_1.6.30.b=
b" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.30.bb</a><br>
@@ -2,14 +2,17 @@ SUMMARY =3D &quot;PNG image format decoding library&quot;=
<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.libpng.org/" rel=3D"noreferr=
er" target=3D"_blank">http://www.libpng.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;Libpng&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>f9acafc1325f8f8da80ae=
ee94dbc1b<wbr>da \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://png.h;endline=3D144;md5=3D<wbr>0b2aa20c7ff55d9411108317df8ff0<wbr>c9&quo=
t;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>e2caf3f5970737a6a7b74=
6d8a0d121<wbr>05 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://png.h;endline=3D144;md5=3D<wbr>7c8feac6904795276e99304ac474f8<wbr>52&quo=
t;<br>
=C2=A0DEPENDS =3D &quot;zlib&quot;<br>
+LIBV =3D &quot;16&quot;<br>
<br>
-SRC_URI =3D &quot;${GENTOO_MIRROR}/libpng-${PV}<wbr>.tar.xz \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>3245dbd76ea91e1437507357b858ec<wbr>97&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>4245b684e8fe829ebb76186327bb37<wbr>ce5a6=
39938b219882b53d64bd3cfc5<wbr>f239&quot;<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/<wbr>project/libpng/libpng${LIBV}/=
$<wbr>{PV}/libpng-${PV}.tar.xz&quot;<br>
+<br>
+MIRRORS +=3D &quot;${SOURCEFORGE_MIRROR}/<wbr>project/libpng/libpng${LIBV}=
/<wbr>older-releases/${PV}&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>88a729d47eaf880d61a0ef90f4bd5e<wbr>8f&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>267c332ffff70cc599d3929207869f<wbr>69879=
8f1df143aa5f9597b007c1435<wbr>3666&quot;<br>
<br>
=C2=A0BINCONFIG =3D &quot;${bindir}/libpng-config ${bindir}/libpng16-config=
&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.4.0<br>
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

--94eb2c089360abdc4d05550c9d83--
