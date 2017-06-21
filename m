Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id BDDF377F70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 10:27:05 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id m47so22087955iti.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 03:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4vfWk7om6Zz5kh1UKSbk2oggiCI2Pofe38EyVNu94MU=;
	b=D1VU7yGjpYRYrWR46POUNJTPerZf2hbbODUeJkCXbwBurLhQun6QJ0urisSumplZ6O
	wEM+KT4OhEreaVYl1vkgRQwKL5T5S01tXOo48UqKYK9PCfd1p2Gaxa27ilbEEmFWg7Wp
	Ynx8yPb/uQruXuWQftEHWRWm/c3yjDw4Bz3cWoqKoJlXBrRENfUlO7qlKjSNLxx3LkAn
	Oo8Ua7uq4evnTF0cQxvghS5DQj/C//1KasSI7TqhHcS5iIyOyEyEi58xUqHx5CxM9i8n
	zRhcnEcYSpLq3ktb9+TPvnKTUHfY4LvTrkTC1kShrWU715LP+Yq4eO7NV4D8DM+6yvD1
	cCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4vfWk7om6Zz5kh1UKSbk2oggiCI2Pofe38EyVNu94MU=;
	b=SglPVSOcl/kzdNqs9w4NCrbUpBtQmxCDcWBcj6BiAj3E2eJDcl9MAKeIFCsTtLOO90
	d0ZI1WWXRnmcWpq3s2C6tX+OiuHixgoe5R0Ta9pOE/XxEW6XLOBOK3OD/5u7EqcwK12L
	yqqEnbPJ6Axf3j5gkAmYpZTJWo2ikd7N8Jaa/JLMhl1iWqH4CeBilMYWcwoHFM+1Bo3K
	V/Erw9HxnuYauIpkJjmJueK/KC/QTrCssvhZN0sijJvQwDQCoRXUKEkNAvGtuITafS5B
	2WBmfxwJ4fBjIiTxdye7NOS9pD1bRAivGcIoAKnLJyW0gaKPAgfsHHH1qcO5uocwIskN
	FimA==
X-Gm-Message-State: AKS2vOxveu8ryQimZYUPNTFgAU9i1xIwbfv2jd9hOQjDS2qAnn2bCJJ/
	Dm8qVXXsLiyVP4ipzTOWxunmYeU0DUq2DyY=
X-Received: by 10.36.167.65 with SMTP id s1mr8002619iti.98.1498040826708; Wed,
	21 Jun 2017 03:27:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.130 with HTTP; Wed, 21 Jun 2017 03:26:36 -0700 (PDT)
In-Reply-To: <20170619101917.31865-1-git@andred.net>
References: <20170619101917.31865-1-git@andred.net>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 21 Jun 2017 13:26:36 +0300
Message-ID: <CAHiDW_FCUwov8fBMZMSs+yaDms6oNWMgSfua4LEW8JezntGrqA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] tclibc-musl: use musl's virtual/gettext implementation
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
X-List-Received-Date: Wed, 21 Jun 2017 10:27:06 -0000
Content-Type: multipart/alternative; boundary="f403045fbfd855d2fa055275cfee"

--f403045fbfd855d2fa055275cfee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

$ bitbake -k core-image-minimal core-image-full-cmdline core-image-sato
world
That seems to fail with musl on the autobuilder with "Nothing RPROVIDES
'gettext-runtime' "

https://autobuilder.yocto.io/builders/nightly-musl/builds/313/steps/BuildIm=
ages/logs/stdio

Cheers,
Jussi

On 19 June 2017 at 13:19, Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> musl implements the GNU gettext API version 1 and 2
>   http://www.openwall.com/lists/musl/2015/04/16/3
>
> Generally, there should be no need need for the
> actual GNU/gettext in systems using musl, so with
> this change systems using musl can avoid a needless
> dependency on a GPLv3+ tool.
>
> If an application ever appears that needs
> GNU/gettext API version 3, we can think about a way
> to support it at that time.
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---
>  meta/conf/distro/include/tclibc-musl.inc | 1 +
>  meta/recipes-core/musl/musl_git.bb       | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tclibc-musl.inc
b/meta/conf/distro/include/tclibc-musl.inc
> index 3d3f6ac4f4..172b09ab20 100644
> --- a/meta/conf/distro/include/tclibc-musl.inc
> +++ b/meta/conf/distro/include/tclibc-musl.inc
> @@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"
>  PREFERRED_PROVIDER_virtual/libintl ?=3D "musl"
>  PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
>  PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/gettext ?=3D "musl"
>
>  #USE_NLS ?=3D "no"
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/
musl_git.bb
> index fba47096f5..9cf097d067 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://git.musl-libc.org/musl \
>
>  S =3D "${WORKDIR}/git"
>
> -PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
virtual/libiconv virtual/libintl"
> +PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
virtual/gettext virtual/libiconv virtual/libintl"
>
>  DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
>             virtual/${TARGET_PREFIX}gcc-initial \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--f403045fbfd855d2fa055275cfee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">$ bitbake -k core-image-minimal core-image-full-cmdline co=
re-image-sato world<br><div>That seems to fail with musl on the autobuilder=
 with &quot;Nothing RPROVIDES &#39;gettext-runtime&#39; &quot;<br><br><a hr=
ef=3D"https://autobuilder.yocto.io/builders/nightly-musl/builds/313/steps/B=
uildImages/logs/stdio">https://autobuilder.yocto.io/builders/nightly-musl/b=
uilds/313/steps/BuildImages/logs/stdio</a><br><br>Cheers,<br>Jussi<br><br>O=
n 19 June 2017 at 13:19, Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andre=
d.net">git@andred.net</a>&gt; wrote:<br>&gt;<br>&gt; From: Andr=C3=A9 Drasz=
ik &lt;<a href=3D"mailto:adraszik@tycoint.com">adraszik@tycoint.com</a>&gt;=
<br>&gt;<br>&gt; musl implements the GNU gettext API version 1 and 2<br>&gt=
; =C2=A0 <a href=3D"http://www.openwall.com/lists/musl/2015/04/16/3">http:/=
/www.openwall.com/lists/musl/2015/04/16/3</a><br>&gt;<br>&gt; Generally, th=
ere should be no need need for the<br>&gt; actual GNU/gettext in systems us=
ing musl, so with<br>&gt; this change systems using musl can avoid a needle=
ss<br>&gt; dependency on a GPLv3+ tool.<br>&gt;<br>&gt; If an application e=
ver appears that needs<br>&gt; GNU/gettext API version 3, we can think abou=
t a way<br>&gt; to support it at that time.<br>&gt;<br>&gt; Signed-off-by: =
Andr=C3=A9 Draszik &lt;<a href=3D"mailto:adraszik@tycoint.com">adraszik@tyc=
oint.com</a>&gt;<br>&gt; Acked-by: Sylvain Lemieux &lt;<a href=3D"mailto:sl=
emieux@tycoint.com">slemieux@tycoint.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0=
meta/conf/distro/include/tclibc-musl.inc | 1 +<br>&gt; =C2=A0meta/recipes-c=
ore/musl/<a href=3D"http://musl_git.bb">musl_git.bb</a> =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>&gt; =C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br=
>&gt;<br>&gt; diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/=
conf/distro/include/tclibc-musl.inc<br>&gt; index 3d3f6ac4f4..172b09ab20 10=
0644<br>&gt; --- a/meta/conf/distro/include/tclibc-musl.inc<br>&gt; +++ b/m=
eta/conf/distro/include/tclibc-musl.inc<br>&gt; @@ -13,6 +13,7 @@ PREFERRED=
_PROVIDER_virtual/libiconv ?=3D &quot;musl&quot;<br>&gt; =C2=A0PREFERRED_PR=
OVIDER_virtual/libintl ?=3D &quot;musl&quot;<br>&gt; =C2=A0PREFERRED_PROVID=
ER_virtual/nativesdk-libintl ?=3D &quot;nativesdk-glibc&quot;<br>&gt; =C2=
=A0PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D &quot;nativesdk-glibc=
&quot;<br>&gt; +PREFERRED_PROVIDER_virtual/gettext ?=3D &quot;musl&quot;<br=
>&gt;<br>&gt; =C2=A0#USE_NLS ?=3D &quot;no&quot;<br>&gt;<br>&gt; diff --git=
 a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb">musl_git.bb</a> b/=
meta/recipes-core/musl/<a href=3D"http://musl_git.bb">musl_git.bb</a><br>&g=
t; index fba47096f5..9cf097d067 100644<br>&gt; --- a/meta/recipes-core/musl=
/<a href=3D"http://musl_git.bb">musl_git.bb</a><br>&gt; +++ b/meta/recipes-=
core/musl/<a href=3D"http://musl_git.bb">musl_git.bb</a><br>&gt; @@ -15,7 +=
15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.musl-libc.org/musl">g=
it.musl-libc.org/musl</a> \<br>&gt;<br>&gt; =C2=A0S =3D &quot;${WORKDIR}/gi=
t&quot;<br>&gt;<br>&gt; -PROVIDES +=3D &quot;virtual/libc virtual/${TARGET_=
PREFIX}libc-for-gcc virtual/libiconv virtual/libintl&quot;<br>&gt; +PROVIDE=
S +=3D &quot;virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/gett=
ext virtual/libiconv virtual/libintl&quot;<br>&gt;<br>&gt; =C2=A0DEPENDS =
=3D &quot;virtual/${TARGET_PREFIX}binutils \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 virtual/${TARGET_PREFIX}gcc-initial \<br>&gt; --<br>&g=
t; 2.11.0<br>&gt;<br>&gt; --<br>&gt; ______________________________________=
_________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:=
Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembed=
ded.org</a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/listin=
fo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openem=
bedded-core</a><div><pre style=3D"font-family:&quot;Courier New&quot;,couri=
er,monotype,monospace;color:rgb(0,0,0);font-size:medium"></pre></div><div><=
pre style=3D"font-family:&quot;Courier New&quot;,courier,monotype,monospace=
;color:rgb(0,0,0);font-size:medium"></pre></div></div></div>

--f403045fbfd855d2fa055275cfee--
