Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id D1E0F731B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 17:36:10 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id bc4so294040817lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 09:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IEO91eqgFLf8IN2DcICNCInHKF+A44ZLExcro/5ppAE=;
	b=PkG2yb7XBtp7BzN/DDMc1xpObA1hiQcmQPFwYYjqs9oEMGvjwQ9iYyVK7eB+EKoDG+
	FALJctTGt84pQ0riKWcBjdc1/BeBHUt2C4XphS6kTQbyhtYm0e7tIsrPf0ng/bv4qMDJ
	yXoMZyQLFHWqYhnoGdE1+0QjEzAsQUrNU8WNCnN2K+OpiiICt0lmVY7xyaLsQRhg8Gwi
	XS//gncSBVYKKe6ymm2SwE4+h571sVaxHXImhe3EMpDedmWjP9mzIGaeqpbKv5q2gtG/
	sML2K+j23Ex1Q2CIdvVw1K3mW1u1jtA9/aT4+Y5RPBKmmjZtezZxTWAVxR3r1uBPcZ+A
	vfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=IEO91eqgFLf8IN2DcICNCInHKF+A44ZLExcro/5ppAE=;
	b=at7zvI6kYCiB4na9LsoMqB+qB/e8HCMvcTQ4X6z276DshLWVzblHzKSgy6w1EHf/fQ
	s63/WHefSFIxZo/2+2fOb7yA20kVNsy9bAUFbWXshymxSil+aGDKMDPx+Esl+Y9vOYJg
	UxdAiNpr7pelZXl0zr/4sEIYbEZJOe2dGi+KdKLdiT4t7N9Q1z06q82N9z84CqJGI3Ay
	yKC3hgECiF4MVE449Z04PDBKC0VS4vtktAK2p+uxG4w/cYMYEqMjotB3WeSw9cnYaM4J
	fGehkYlYUv/XKMrapK0/Kwi2UHFGC7hF3Z66Lhc+jhCnNY45mkzuDlivmzTbC2JKpDZr
	CYPg==
X-Gm-Message-State: ALoCoQneRc+atzrqEAalRKv4pQYIRgBRldZFW7rVVM000ybxrNiclkdZU6AkWx5FCum2EfaoxUdSb0SQ9eitqN9Lb4JulRZEDc3Ep1clpn43mQ6ZoD2d5aM=
MIME-Version: 1.0
X-Received: by 10.112.172.233 with SMTP id bf9mr4134257lbc.121.1452706570694; 
	Wed, 13 Jan 2016 09:36:10 -0800 (PST)
Received: by 10.114.187.205 with HTTP; Wed, 13 Jan 2016 09:36:10 -0800 (PST)
In-Reply-To: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
Date: Wed, 13 Jan 2016 23:06:10 +0530
Message-ID: <CAD3vsf4W4vEZYa=Ge_yF3SNBSppALXVYuu5U-7wqHx5cPRaPDw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cantarell-fonts: Add recipe
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
X-List-Received-Date: Wed, 13 Jan 2016 17:36:11 -0000
Content-Type: multipart/alternative; boundary=001a11c3277e1c1be405293a9bf4

--001a11c3277e1c1be405293a9bf4
Content-Type: text/plain; charset=UTF-8

Ping.

Without cantarell fonts, the pango test case  test-layout.test fails.
Previous result of pango ptest is at
https://wiki.yoctoproject.org/wiki/Ptest_5e3e2e0cbb0a49986f4653e64c4c8d2b5461645e

Regards,
Jagadeesh

On Sat, Jan 9, 2016 at 8:02 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> 1. The Cantarell font typeface is designed as a
>    contemporary Humanist sans serif, and was developed for
>    on-screen reading; in particular, reading web pages on an
>    HTC Dream mobile phone.
>
> 2. Pango test case (test-layout.test) requires cantarell-font
>    typeface. This test case uses 'Cantarell 11' font type
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  .../cantarell-fonts/cantarell-fonts_git.bb         | 25
> ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/recipes-graphics/cantarell-fonts/
> cantarell-fonts_git.bb
>
> diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> new file mode 100644
> index 0000000..f55fef1
> --- /dev/null
> +++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Cantarell, a Humanist sans-serif font family"
> +
> +DESCRIPTION = "The Cantarell font typeface is designed as a \
> +               contemporary Humanist sans serif, and was developed for \
> +               on-screen reading; in particular, reading web pages on an \
> +               HTC Dream mobile phone."
> +
> +HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
> +SECTION = "fonts"
> +LICENSE = "OFL-1.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
> +
> +PV = "0.0.18.1+git${SRCPV}"
> +PR = "r0"
> +
> +SRCREV = "3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4"
> +SRC_URI = "git://git.gnome.org/cantarell-fonts;protocol=git;branch=master
> "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools allarch fontcache
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[fontforge] =
> "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
> +FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
> --
> 1.9.1
>
>

--001a11c3277e1c1be405293a9bf4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping.<div><br></div><div>Without cantarell fonts, the pang=
o test case=C2=A0<span style=3D"font-size:17.6000003814697px">=C2=A0</span>=
<span style=3D"font-size:12.8000001907349px">test-layout.test fails.</span>=
</div><div>Previous result of pango ptest is at</div><div><a href=3D"https:=
//wiki.yoctoproject.org/wiki/Ptest_5e3e2e0cbb0a49986f4653e64c4c8d2b5461645e=
">https://wiki.yoctoproject.org/wiki/Ptest_5e3e2e0cbb0a49986f4653e64c4c8d2b=
5461645e</a><br></div><div><br></div><div>Regards,</div><div>Jagadeesh</div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Jan 9, 2=
016 at 8:02 PM, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvis=
ta.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex">1. The Cantarell font type=
face is designed as a<br>
=C2=A0 =C2=A0contemporary Humanist sans serif, and was developed for<br>
=C2=A0 =C2=A0on-screen reading; in particular, reading web pages on an<br>
=C2=A0 =C2=A0HTC Dream mobile phone.<br>
<br>
2. Pango test case (test-layout.test) requires cantarell-font<br>
=C2=A0 =C2=A0typeface. This test case uses &#39;Cantarell 11&#39; font type=
<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb" rel=3D"=
noreferrer" target=3D"_blank">cantarell-fonts_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 25 ++++++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/cantarell-fonts/<a href=3D"h=
ttp://cantarell-fonts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarel=
l-fonts_git.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://cantar=
ell-fonts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarell-fonts_git.=
bb</a> b/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://cantarell-=
fonts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarell-fonts_git.bb</=
a><br>
new file mode 100644<br>
index 0000000..f55fef1<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://cantarell-fon=
ts_git.bb" rel=3D"noreferrer" target=3D"_blank">cantarell-fonts_git.bb</a><=
br>
@@ -0,0 +1,25 @@<br>
+SUMMARY =3D &quot;Cantarell, a Humanist sans-serif font family&quot;<br>
+<br>
+DESCRIPTION =3D &quot;The Cantarell font typeface is designed as a \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contemporary Humani=
st sans serif, and was developed for \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on-screen reading; =
in particular, reading web pages on an \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HTC Dream mobile ph=
one.&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.gnome.org/browse/cantarell-fonts=
/" rel=3D"noreferrer" target=3D"_blank">https://git.gnome.org/browse/cantar=
ell-fonts/</a>&quot;<br>
+SECTION =3D &quot;fonts&quot;<br>
+LICENSE =3D &quot;OFL-1.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ddf91e3ffcab8cfb972a66bf112=
55188d&quot;<br>
+<br>
+PV =3D &quot;0.0.18.1+git${SRCPV}&quot;<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRCREV =3D &quot;3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.gnome.org/cantarell-fonts;pr=
otocol=3Dgit;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.gnom=
e.org/cantarell-fonts;protocol=3Dgit;branch=3Dmaster</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools allarch fontcache<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[fontforge] =3D &quot;--enable-source-rebuild=3Dyes,--enable-=
source-rebuild=3Dno,fontforge-native&quot;<br>
+FILES_${PN} =3D &quot;${datadir}/fonts ${datadir}/fontconfig&quot;<br>
<span><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c3277e1c1be405293a9bf4--
