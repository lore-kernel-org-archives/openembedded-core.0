Return-Path: <ross.burton@intel.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A483C60777
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 20:12:01 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id w194so34466382ybe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 12:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pyCfJCjzgJ1/zu+NgZNP71tIaknBmqUHUbmQ+Yl4U50=;
	b=hgQciq0fd5GLM/OeQ2Ncjj9ibr5Afpi27vBd06FNgbw5jU4bcEbi9yX9BLNncQFv0e
	vLiz4erFx3tf44M3ni66jDdvUP3JhdNe03QBTxmBKYMsyKVheGN4ltXP5Mn5nLJ+IVKw
	Azkftp/m08/9td7RpJLO2QeT8Ce22w+7qRLyI6ZeEbFsQfd1h0snqfWjRIQ705VKRg6H
	g0Tx49bR6l8PEvDo7mO+zS0g5Iq3o2Td5bkV6uz6jh3SHkl9cAjV9JD5UqfXFvfN4S0d
	+rKREv0W8v9bMyfvZT/UZZ9HBhl2b6Tc5zQ9dWFzHsEMSyuIjMm/bjC+V3mnHMNQOun5
	15Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pyCfJCjzgJ1/zu+NgZNP71tIaknBmqUHUbmQ+Yl4U50=;
	b=eNWdyOQX+WyaTJf0QkA3EkP2b8ps7Exea6F9UNhxVIFcCypwWtPPOyE15fvs7er7BE
	O5DO93j0LRz8Fn66rLggUhY0DhOYLi2snKk/YloFojv7+EjA3OysvNCrWiO2MhsxNCLi
	lAi6gV8y5djy0N5q6Xkv/CwZ8sgjMZFTYLnqcNVA821Rppc/Jsge85/yS749OtHi0j1n
	/JBYWUMXWyPvqNhEoiW2TiEEzs81ffCk7TwZZKNQrn8CtPc7TjmT3ZbF3ogtN+PHBxLR
	4No/7yyCw2L82rpSI+W1+itBJhfW3v/du6xNMUHsKAkvFh0elA02OHbVPcQ3Pf6/KcuS
	QZbQ==
X-Gm-Message-State: AIkVDXL1oiYJ4E7UmE+EqCsL4/6JMvj0Ksh8VeYFXm0yJ8M00e1BCGYi2Nl/yW4qG29gTQXPimzR4XXRm6v3tNOm
X-Received: by 10.237.62.232 with SMTP id o37mr8900715qtf.188.1484856721139;
	Thu, 19 Jan 2017 12:12:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 12:11:40 -0800 (PST)
In-Reply-To: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 20:11:40 +0000
Message-ID: <CAJTo0LbE5k=91U7haCKMKLQ4m3HTf5+jzQav7Rvq4B_rjMAJAw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Thu, 19 Jan 2017 20:12:02 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e68bf0405467825f4

--001a11406f0e68bf0405467825f4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Breaks under musl:

| ../../../alsa-lib-1.1.3/src/ucm/parser.c: In function
'is_component_directory':
| ../../../alsa-lib-1.1.3/src/ucm/parser.c:1392:39: error: 'PATH_MAX'
undeclared (first use in this function)
|    if (!strncmp(dir, component_dir[i], PATH_MAX))
|                                        ^~~~~~~~

Can you cherry-pick
http://git.alsa-project.org/?p=3Dalsa-lib.git;a=3Dcommit;h=3D9ed4075f05a424=
2f32331f7f2c365767970f5003
?

Ross

On 1 January 2017 at 19:53, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om>
wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb =3D> alsa-lib_1.1.3.bb} =
|
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb =3D>
> alsa-lib_1.1.3.bb} (91%)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
> b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
> similarity index 91%
> rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
> rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
> index e313da7..1afac7a 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
> @@ -12,8 +12,8 @@ SRC_URI =3D "ftp://ftp.alsa-project.org/
> pub/lib/${BP}.tar.bz2 \
>             file://Check-if-wordexp-function-is-supported.patch \
>             file://avoid-including-sys-poll.h-directly.patch \
>  "
> -SRC_URI[md5sum] =3D "1946e6438b8262a7b8fdadacd0e06ba7"
> -SRC_URI[sha256sum] =3D "d38dacd9892b06b8bff04923c380b3
> 8fb2e379ee5538935ff37e45b395d861d6"
> +SRC_URI[md5sum] =3D "eefe5992567ba00d6110a540657aaf5c"
> +SRC_URI[sha256sum] =3D "71282502184c592c1a008e256c22ed
> 0ba5728ca65e05273ceb480c70f515969c"
>
>  inherit autotools pkgconfig
>
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11406f0e68bf0405467825f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaks under musl:<br><br>| ../../../alsa-lib-1.1.3/src/uc=
m/parser.c: In function &#39;is_component_directory&#39;:<br>| ../../../als=
a-lib-1.1.3/src/ucm/parser.c:1392:39: error: &#39;PATH_MAX&#39; undeclared =
(first use in this function)<br>| =C2=A0 =C2=A0if (!strncmp(dir, component_=
dir[i], PATH_MAX))<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~<div><br><div><span class=3D"gmail-stdout">Can you=
 cherry-pick=C2=A0<a href=3D"http://git.alsa-project.org/?p=3Dalsa-lib.git;=
a=3Dcommit;h=3D9ed4075f05a4242f32331f7f2c365767970f5003">http://git.alsa-pr=
oject.org/?p=3Dalsa-lib.git;a=3Dcommit;h=3D9ed4075f05a4242f32331f7f2c365767=
970f5003</a>?</span></div><div><span class=3D"gmail-stdout"><br></span></di=
v><div><span class=3D"gmail-stdout">Ross</span></div></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1 January 2017 at 19:53,=
 Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@=
googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Andreas M=C3=BCl=
ler &lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnitzeltony@googl=
email.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/alsa/{<a href=3D"http://alsa-lib_1.1.2.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>alsa-lib_1.1.2.bb</a> =3D&gt; <a hr=
ef=3D"http://alsa-lib_1.1.3.bb" rel=3D"noreferrer" target=3D"_blank">alsa-l=
ib_1.1.3.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/alsa/{<a href=3D"http://alsa-lib_1.1.2=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>alsa-lib_1.1.2.bb</a> =3D&gt=
; <a href=3D"http://alsa-lib_1.1.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>alsa-lib_1.1.3.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.2.bb</a> b/meta/=
recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.3.bb" rel=3D"no=
referrer" target=3D"_blank">alsa-lib_1.1.3.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">a<wbr>lsa-lib_1.1.2.bb</a><br>
rename to meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.1.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">a<wbr>lsa-lib_1.1.3.bb</a><br>
index e313da7..1afac7a 100644<br>
--- a/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.2.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>alsa/<a href=3D"http://alsa-lib_1.1.3.bb=
" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.3.bb</a><br>
@@ -12,8 +12,8 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.alsa-project.org/p=
ub/lib/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.alsa-p=
roject.org/<wbr>pub/lib/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Check-if-wordexp-<wbr>func=
tion-is-supported.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid-including-sys-<wbr>p=
oll.h-directly.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>1946e6438b8262a7b8fdadacd0e06b<wbr>a7&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>d38dacd9892b06b8bff04923c380b3<wbr>8fb2e=
379ee5538935ff37e45b395d8<wbr>61d6&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>eefe5992567ba00d6110a540657aaf<wbr>5c&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>71282502184c592c1a008e256c22ed<wbr>0ba57=
28ca65e05273ceb480c70f515<wbr>969c&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.5<br>
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

--001a11406f0e68bf0405467825f4--
