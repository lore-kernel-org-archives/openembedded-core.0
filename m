Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB1A73170
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:37:50 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id ba1so186990704obb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 06:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BBgJr7qCnsQH03hyeUH92ZwEuG8M/EwmfQXVJEvKPeQ=;
	b=nq7WJtYwKoPRojqr/5H2w7yRDTCl5PwkUvfB0sJuzmdLXYgiy5hePH+ULSSb4EN4iG
	LnXvW0iIa206XJ5hsrQcHsgZJ/EfG2eYHu2SIozKo3PBtuhGff9YWHFBaKSPyzMmY4BR
	9a45/B45I0QInDZSglffjcySRAyV2ftaV2vAGOux6r4luDwabidGCfSFRCz4F3I11dL+
	A+Nl4oPhxJzApLVDrBqyxfLOfdn0DcA+gpQtc2MAgQ4P728PXr+ETS/8JhAegdIcIof8
	8E6hZHSHRWL3odg/yBJD1garrtmCzMsqDxuvizCO5DX3guRHHeNWrqzPc2QOfstoaJvS
	C22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BBgJr7qCnsQH03hyeUH92ZwEuG8M/EwmfQXVJEvKPeQ=;
	b=JvNq7XPkhCk+tRs2/PzCNQko/TeJx0lSPGzWdL2SArbHH8ncARPQ3z19HTKWTmD6fn
	gnFYgCt0vJlvEr+y3d4hFTlIvzByX95K4xMqMHk9LMmXhZLEadtFy/tkIXskEGQsuugw
	IWlZHCRjw3Sjr20swtydGNcwSqiy3cmvqKPBfmBPx7U36XLCF6b1fIJVWNmzIaN8DbKj
	U0Ty9BC31pMNuCzcP9xF67gXFcnpUy6z8hLtvq6cTiNxvGzJK8PYJaTUf8MMLd4w83CI
	oXh2iLLx+eZDaYsOhJCoc+Dofs6j42Yxh01eA+zFmeEKUiSE5mXeRi5T5MAkDAzOsVuk
	9zxA==
X-Gm-Message-State: AG10YOSUwQjY63WTH6LzErj5MB6ZLWk8O3w+6XzYD1eonzqnyBNM4huQdVA+6PYjkHq8SIbNvuWgbj2BbHuVSYc5
X-Received: by 10.60.227.74 with SMTP id ry10mr29872524oec.48.1455028671580;
	Tue, 09 Feb 2016 06:37:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.224.68 with HTTP; Tue, 9 Feb 2016 06:37:22 -0800 (PST)
In-Reply-To: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 9 Feb 2016 16:37:22 +0200
Message-ID: <CAHiDW_GqS-S1OK2FQ6v4vf=iDQiXdKyJQewz7a5iZ2wYajfmAw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 09 Feb 2016 14:37:52 -0000
Content-Type: multipart/alternative; boundary=001a1136935e1ba720052b57434f

--001a1136935e1ba720052b57434f
Content-Type: text/plain; charset=UTF-8

Hi again,

Maybe this does make sense even with the downsides I mentioned earlier:
testing the layout is a good idea (even if just using font metrics), and
the build/install time/size of cantarell are reasonable. The test in
question seems good to me and these patches produce correct results.

A recipe review comment below.

Jussi

On 9 January 2016 at 16:32, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:
>
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
++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/recipes-graphics/cantarell-fonts/
cantarell-fonts_git.bb
>
> diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> new file mode 100644
> index 0000000..f55fef1
> --- /dev/null
> +++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Cantarell, a Humanist sans-serif font family"
> +
> +DESCRIPTION = "The Cantarell font typeface is designed as a \
> +               contemporary Humanist sans serif, and was developed for \
> +               on-screen reading; in particular, reading web pages on an
\
> +               HTC Dream mobile phone."
> +
> +HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
> +SECTION = "fonts"
> +LICENSE = "OFL-1.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
> +
> +PV = "0.0.18.1+git${SRCPV}"

We could go with 0.0.21 since that's now out (I realize you picked the
newest release at the time -- sorry for extra work).

> +PR = "r0"

PR is not needed.

> +
> +SRCREV = "3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4"
> +SRC_URI = "git://git.gnome.org/cantarell-fonts;protocol=git;branch=master
"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools allarch fontcache
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[fontforge] =
"--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
> +FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1136935e1ba720052b57434f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi again,<div><br>Maybe this does make sense even with the=
 downsides I mentioned earlier: testing the layout is a good idea (even if =
just using font metrics), and the build/install time/size of cantarell are =
reasonable. The test in question seems good to me and these patches produce=
 correct results.<br><br>A recipe review comment below.<br><br>Jussi<br><br=
>On 9 January 2016 at 16:32, Jagadeesh Krishnanjanappa &lt;<a href=3D"mailt=
o:jkrishnanjanappa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt; wrote:<b=
r>&gt;<br>&gt; 1. The Cantarell font typeface is designed as a<br>&gt; =C2=
=A0 =C2=A0contemporary Humanist sans serif, and was developed for<br>&gt; =
=C2=A0 =C2=A0on-screen reading; in particular, reading web pages on an<br>&=
gt; =C2=A0 =C2=A0HTC Dream mobile phone.<br>&gt;<br>&gt; 2. Pango test case=
 (test-layout.test) requires cantarell-font<br>&gt; =C2=A0 =C2=A0typeface. =
This test case uses &#39;Cantarell 11&#39; font type <br>&gt;<br>&gt; Signe=
d-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjanappa@=
mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.=
../cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb">cantarell-font=
s_git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 25 ++++++++++++++++++++++<br>&gt=
; =C2=A01 file changed, 25 insertions(+)<br>&gt; =C2=A0create mode 100644 m=
eta/recipes-graphics/cantarell-fonts/<a href=3D"http://cantarell-fonts_git.=
bb">cantarell-fonts_git.bb</a><br>&gt;<br>&gt; diff --git a/meta/recipes-gr=
aphics/cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb">cantarell-=
fonts_git.bb</a> b/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://=
cantarell-fonts_git.bb">cantarell-fonts_git.bb</a><br>&gt; new file mode 10=
0644<br>&gt; index 0000000..f55fef1<br>&gt; --- /dev/null<br>&gt; +++ b/met=
a/recipes-graphics/cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb=
">cantarell-fonts_git.bb</a><br>&gt; @@ -0,0 +1,25 @@<br>&gt; +SUMMARY =3D =
&quot;Cantarell, a Humanist sans-serif font family&quot;<br>&gt; +<br>&gt; =
+DESCRIPTION =3D &quot;The Cantarell font typeface is designed as a \<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contemporary Humanist=
 sans serif, and was developed for \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 on-screen reading; in particular, reading web pages on=
 an \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HTC Dream =
mobile phone.&quot;<br>&gt; +<br>&gt; +HOMEPAGE =3D &quot;<a href=3D"https:=
//git.gnome.org/browse/cantarell-fonts/">https://git.gnome.org/browse/canta=
rell-fonts/</a>&quot;<br>&gt; +SECTION =3D &quot;fonts&quot;<br>&gt; +LICEN=
SE =3D &quot;OFL-1.1&quot;<br>&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYI=
NG;md5=3Ddf91e3ffcab8cfb972a66bf11255188d&quot;<br>&gt; +<br>&gt; +PV =3D &=
quot;0.0.18.1+git${SRCPV}&quot;<br><br><div>We could go with 0.0.21 since t=
hat&#39;s now out (I realize you picked the newest release at the time -- s=
orry for extra work).</div><div><br></div><div>&gt; +PR =3D &quot;r0&quot;<=
br><br><div>PR is not needed.</div><div><br></div><div>&gt; +<br>&gt; +SRCR=
EV =3D &quot;3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4&quot;<br>&gt; +SRC_UR=
I =3D &quot;git://<a href=3D"http://git.gnome.org/cantarell-fonts;protocol=
=3Dgit;branch=3Dmaster">git.gnome.org/cantarell-fonts;protocol=3Dgit;branch=
=3Dmaster</a>&quot;<br>&gt; +<br>&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>=
&gt; +<br>&gt; +inherit autotools allarch fontcache<br>&gt; +<br>&gt; +PACK=
AGECONFIG ??=3D &quot;&quot;<br>&gt; +PACKAGECONFIG[fontforge] =3D &quot;--=
enable-source-rebuild=3Dyes,--enable-source-rebuild=3Dno,fontforge-native&q=
uot;<br>&gt; +FILES_${PN} =3D &quot;${datadir}/fonts ${datadir}/fontconfig&=
quot;<br>&gt; --<br>&gt; 1.9.1<br>&gt;<br>&gt; --<br>&gt; _________________=
______________________________<br>&gt; Openembedded-core mailing list<br>&g=
t; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded=
-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists.openembedd=
ed.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/ma=
ilman/listinfo/openembedded-core</a></div></div></div></div>

--001a1136935e1ba720052b57434f--
