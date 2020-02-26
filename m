Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 10437616A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 16:13:04 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id b2so945224vkk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 08:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XLHm7tBN+DtDOsSttL1xHGPS4Pf5n/3x+xiM6Lbnj38=;
	b=eyIr6G6N7V1LvS3qYhQAXT2xr56qQ6P9KLTKj1B2zGv9IZbgbuw+sy30P/G+n1JvhC
	WqAi3Gp8EHx0aOpJ9mBhO6I8rSuTeN4QbuFEX6B+U9tFBH0AsVka0EtcBSBci1gRCh7S
	jdDAr8VM0bzs9HrKVNBdj1WqFgAU8LYBU+Ie5krkh5Ue00xTbS0sK43AeaOIOq7IfxlJ
	YRGhAH2g/iBdOl8acPoBIcygLIHSinLflH63l/jbD8XrG/2CbuvQScFbmTw07RECiF63
	g7sT4sHVmTBoY2pMc9BiIw9hbDI8ev792sWawt5olu7mkPfm7QBfisUd7OK4kBgP56f/
	mw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XLHm7tBN+DtDOsSttL1xHGPS4Pf5n/3x+xiM6Lbnj38=;
	b=ghGO+Od6JTWHDAx8S8oH+2j5NSD/fSKLMljoFjKMdcJ8DCQGWqc7QAyzpxXxE3fCrO
	p1lA6Oo5ddRQzGRtyVLOWa05fFZo1upkvxyfLtwBOV0hr3sbj0B47/XY3T7D7mFxmPbR
	KnGdufMF3chRZz/asfVQIkaAjLiBBWtzAgHczkzlxOMLOc2NELpUfhrV+10yYwOJWnJK
	Zjte6PW29bFnN+9e2CgYTMR7JmWMdY4cvRAzcb77g7aR+ZODJISE1OKkCc6g7kJ0Jv6f
	yIycVSAIVRZBYq95s0/v9qacIRuUjFhECbkD6SVdU90ICefXxDNuudjjGSAHyyATM5Wi
	gjQg==
X-Gm-Message-State: APjAAAXjvfOo57I3efb0gU+KWF2N9J/7NV/9CBSuGHcowR0KQx3xvwra
	inZXZ/Jp++Nj6sszIxg0GQcfzYQekvXZiBMIo2p13g==
X-Google-Smtp-Source: APXvYqwNmQ+12oyCSt9cf77rJKwNPf57yMwsRzGtg9CNDbHcYOl6idPVMLVzfrVz1IRjmc+qQlhyyQWh/0CnKdh6yvw=
X-Received: by 2002:a05:6122:2b6:: with SMTP id
	22mr4018451vkq.49.1582733585858; 
	Wed, 26 Feb 2020 08:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
In-Reply-To: <20200226135716.49255-2-zboszor@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Feb 2020 17:12:54 +0100
Message-ID: <CANNYZj8MzPaJM7DMuufL_QShHtK5v5e=VjK7xmS2zz1ovf7J6g@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 16:13:05 -0000
Content-Type: multipart/alternative; boundary="00000000000028c8e4059f7ce123"

--00000000000028c8e4059f7ce123
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The 'circular dependency' thing must be explained in the commits, and not
in a discussion link to some email elsewhere.

I still don't get why this is needed. The -initial recipe is identical to
the eventual 'real' recipe, so where is the circularity coming from?

Alex

On Wed, 26 Feb 2020 at 15:05, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Op=
enembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> The package name exploits sstate.bbclass so it's not added as
> implicit dependency to packages.
>
> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> ---
>  meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
>  meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>
> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc
> b/meta/recipes-graphics/libva/libva-2.6.1.inc
> index ca1386d80b..5b1cdee7e3 100644
> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
> @@ -17,10 +17,12 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035378=
00f"
>
> -SRC_URI =3D "
> https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
> +SRC_URI =3D "
> https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz=
2
> "
>  SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
>  SRC_URI[sha256sum] =3D
> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
>
> +S =3D "${WORKDIR}/libva-${PV}"
> +
>  UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
>
>  DEPENDS =3D "libdrm"
> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> new file mode 100644
> index 0000000000..828ef6fbca
> --- /dev/null
> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> @@ -0,0 +1,5 @@
> +require libva-${PV}.inc
> +
> +do_install_append () {
> +       rm -f ${D}${libdir}/*.so*
> +}
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000028c8e4059f7ce123
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The &#39;circular dependency&#39; thing must be expla=
ined in the commits, and not in a discussion link to some email elsewhere.<=
/div><div><br></div><div>I still don&#39;t get why this is needed. The -ini=
tial recipe is identical to the eventual &#39;real&#39; recipe, so where is=
 the circularity coming from?</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, 26 Feb 2020 at 15:05, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Openembe=
dded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">The package name exploits sstate.bbc=
lass so it&#39;s not added as<br>
implicit dependency to packages.<br>
<br>
Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<a href=3D"mailto=
:zboszor@pr.hu" target=3D"_blank">zboszor@pr.hu</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/libva/libva-2.6.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 4 +++-<br>
=C2=A0meta/recipes-graphics/libva/<a href=3D"http://libva-initial_2.6.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libva-initial_2.6.1.bb</a> | 5 +++++<=
br>
=C2=A02 files changed, 8 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/libva/<a href=3D"http://libv=
a-initial_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">libva-initial_2.6.=
1.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/recipes-gra=
phics/libva/libva-2.6.1.inc<br>
index ca1386d80b..5b1cdee7e3 100644<br>
--- a/meta/recipes-graphics/libva/libva-2.6.1.inc<br>
+++ b/meta/recipes-graphics/libva/libva-2.6.1.inc<br>
@@ -17,10 +17,12 @@ SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2e48940f94acb0af582e5=
ef03537800f&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/intel/$%7BBPN%7D/releases/=
download/$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2</a>&q=
uot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/intel/libva/releases/downl=
oad/$%7BPV%7D/libva-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2=
</a>&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;aef13eb48e01a47d1416d97462a22a11&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;6c57eb642d828af2411aa38f55dc10111e8c9897=
6dbab8fd62e48629401eaea5&quot;<br>
<br>
+S =3D &quot;${WORKDIR}/libva-${PV}&quot;<br>
+<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/intel/libv=
a/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel/l=
ibva/releases</a>&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libdrm&quot;<br>
diff --git a/meta/recipes-graphics/libva/<a href=3D"http://libva-initial_2.=
6.1.bb" rel=3D"noreferrer" target=3D"_blank">libva-initial_2.6.1.bb</a> b/m=
eta/recipes-graphics/libva/<a href=3D"http://libva-initial_2.6.1.bb" rel=3D=
"noreferrer" target=3D"_blank">libva-initial_2.6.1.bb</a><br>
new file mode 100644<br>
index 0000000000..828ef6fbca<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/libva/<a href=3D"http://libva-initial_2.6.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libva-initial_2.6.1.bb</a><br>
@@ -0,0 +1,5 @@<br>
+require libva-${PV}.inc<br>
+<br>
+do_install_append () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${libdir}/*.so*<br>
+}<br>
-- <br>
2.24.1<br>
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

--00000000000028c8e4059f7ce123--
