Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 121D77F356
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:05:53 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id w195so2056441vsw.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IAsnpqn84eYzJAY9FUkfH0uX+rYmB9Mi9kbB5inpKT0=;
	b=LaH+Cg0mjIHNZ+9klp2iYJkfI92huT2Ji5JkWtxW7PjrhbyFJQ2BzAwMUFuxjb6V8i
	uI8/OIxfj5sjiIJxCS/5yjt3ToRopUEVDhljXdv7WIOTswdNsLwhQ33SIslOJu2E3aoF
	akgfnMSCifpF6RLU21UiBMx+TGenZcPz4Jo18NOYtr5e0dF/GI9ntTbUqHhU/aoVizTH
	zOXA0BzJfSLJGR2z8TuxdU6smnAo35TyAS5VNsKoub2F3fK6KXhiYNqB0KuDCsjsmE25
	pkIAu45fl8Z9f3jQKGz0YiNVS/7jpGIHNwcYW0rxMoJPn0qoOa4zCUd2EG9dN6eh/kMC
	xg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IAsnpqn84eYzJAY9FUkfH0uX+rYmB9Mi9kbB5inpKT0=;
	b=sFX72fqW8yyMUmVvfZFLSUut3hY2Y7qV2p2qlQosBxk/PMgfcTfRsQu+v676YmhIGv
	OMVKJid0b+I15I2us2GGiO1NfM8PzSJq5Rsjxfo7RuR2nw7CaGqow5IR/6yLwrce+jNH
	b4JfvV55JokzuA12zxVCbZXqbjahTVM5TfXj3jWcsrdaPcotzyo+CI0i9QNtZ/G9LnNt
	SAY6c/OEi0ZvNH/EiR1mrGlUKiKwu/FB+htM51gzto8tUlQPQYIejDDJrnAngd3GfD53
	AhspnzVTW3e8m/oTY6m92dUzP/PV8w6QgfZaa036eD3TaVYuEyPguACzz09Rb5o3/PSy
	BYQg==
X-Gm-Message-State: APjAAAWHKLqMVseC8FnWVSGhQMcD/vagr2kKAVeBeqLhUl8a+SLwRrQ3
	nXVbFZI7kkyYcRT4RdfHDW232zcBgIfPoelrxUYS5w==
X-Google-Smtp-Source: APXvYqxAgsAP08bExwikWpIxMwvvvmFxDusSlBDy4QUo7l0c8Avb/LUnLPh/dOqt4iOXvnKOSKpuDkYk+tJxAoVTgn4=
X-Received: by 2002:a67:784:: with SMTP id 126mr2710107vsh.35.1569596754878;
	Fri, 27 Sep 2019 08:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190927135443.15407-2-git@andred.net>
	<20190927141006.31440-1-git@andred.net>
In-Reply-To: <20190927141006.31440-1-git@andred.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Sep 2019 17:05:43 +0200
Message-ID: <CANNYZj8SJTA37zSRbFQ4jpJFH__ViDBQSKCC9EdH49Zk_E9Pjg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ruby: fix non-IPv6 support
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
X-List-Received-Date: Fri, 27 Sep 2019 15:05:54 -0000
Content-Type: multipart/alternative; boundary="00000000000003e66805938a39c4"

--00000000000003e66805938a39c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just wanted to request, would you be able to provide a ruby version upgrade
as well?

Alex

On Fri, 27 Sep 2019 at 16:10, Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> When IPv6 support is disabled, this recipe mis-configures
> ruby so that it end up non-working:
> --enable-wide-getaddrinfo instructs ruby to re-implement
> the standard getaddinfo(), but IPv6 support is still
> automatically detected via ext/socket/extconf.rb
> independently of that flag.
>
> To re-implement getaddrinfo(), ruby uses the obsolete
> getipnodebyaddr() and getipnodebyname() functions - i.e.
> according to the man-page, glibc provided those only in
> glibc 2.1.91-95; and of course compilation fails. [1]
>
> Switch to ruby's standard --enable-ipv6=3D configure
> options to make the build work without warnings, and
> ruby work at runtime as well.
>
> [1] Compilation and linking actually succeed, albeit with
> a warning regarding implicit declaration / unresolved
> symbols. The error is only obvious at runtime due to the
> unresolved symbols...
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> ---
> v2:
> * switch to --enable-ipv6/--disable-ipv6 instead of
>   --enable-ipv6=3Dyes/no, as the latter is not actually
>   recognised
> ---
>  meta/recipes-devtools/ruby/ruby_2.5.5.bb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> index fdd3852a78..feb654cb6a 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> @@ -9,17 +9,12 @@ SRC_URI +=3D " \
>  SRC_URI[md5sum] =3D "7e156fb526b8f4bb1b30a3dd8a7ce400"
>  SRC_URI[sha256sum] =3D
> "28a945fdf340e6ba04fc890b98648342e3cccfd6d223a48f3810572f11b2514c"
>
> -# it's unknown to configure script, but then passed to extconf.rb
> -# maybe it's not really needed as we're hardcoding the result with
> -# 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
> -UNKNOWN_CONFIGURE_WHITELIST +=3D "--enable-wide-getaddrinfo"
> -
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
>  PACKAGECONFIG[valgrind] =3D "--with-valgrind=3Dyes, --with-valgrind=3Dno=
,
> valgrind"
>  PACKAGECONFIG[gmp] =3D "--with-gmp=3Dyes, --with-gmp=3Dno, gmp"
> -PACKAGECONFIG[ipv6] =3D ",--enable-wide-getaddrinfo,"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
>
>  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>
> --
> 2.23.0.rc1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000003e66805938a39c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just wanted to request, would you be able to provide =
a ruby version upgrade as well?</div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, 27 Sep 2019 at 16:10, Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andr=
ed.net">git@andred.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:andre.=
draszik@jci.com" target=3D"_blank">andre.draszik@jci.com</a>&gt;<br>
<br>
When IPv6 support is disabled, this recipe mis-configures<br>
ruby so that it end up non-working:<br>
--enable-wide-getaddrinfo instructs ruby to re-implement<br>
the standard getaddinfo(), but IPv6 support is still<br>
automatically detected via ext/socket/extconf.rb<br>
independently of that flag.<br>
<br>
To re-implement getaddrinfo(), ruby uses the obsolete<br>
getipnodebyaddr() and getipnodebyname() functions - i.e.<br>
according to the man-page, glibc provided those only in<br>
glibc 2.1.91-95; and of course compilation fails. [1]<br>
<br>
Switch to ruby&#39;s standard --enable-ipv6=3D configure<br>
options to make the build work without warnings, and<br>
ruby work at runtime as well.<br>
<br>
[1] Compilation and linking actually succeed, albeit with<br>
a warning regarding implicit declaration / unresolved<br>
symbols. The error is only obvious at runtime due to the<br>
unresolved symbols...<br>
<br>
Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:andre.draszik@jci.c=
om" target=3D"_blank">andre.draszik@jci.com</a>&gt;<br>
<br>
---<br>
v2:<br>
* switch to --enable-ipv6/--disable-ipv6 instead of<br>
=C2=A0 --enable-ipv6=3Dyes/no, as the latter is not actually<br>
=C2=A0 recognised<br>
---<br>
=C2=A0meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.5.5.bb</a> | 7 +------<br>
=C2=A01 file changed, 1 insertion(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" re=
l=3D"noreferrer" target=3D"_blank">ruby_2.5.5.bb</a> b/meta/recipes-devtool=
s/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"noreferrer" target=3D"_blank=
">ruby_2.5.5.bb</a><br>
index fdd3852a78..feb654cb6a 100644<br>
--- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.5.5.bb</a><br>
+++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_2.5.5.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_2.5.5.bb</a><br>
@@ -9,17 +9,12 @@ SRC_URI +=3D &quot; \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;7e156fb526b8f4bb1b30a3dd8a7ce400&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;28a945fdf340e6ba04fc890b98648342e3cccfd6=
d223a48f3810572f11b2514c&quot;<br>
<br>
-# it&#39;s unknown to configure script, but then passed to extconf.rb<br>
-# maybe it&#39;s not really needed as we&#39;re hardcoding the result with=
<br>
-# 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch<br>
-UNKNOWN_CONFIGURE_WHITELIST +=3D &quot;--enable-wide-getaddrinfo&quot;<br>
-<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG +=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;ipv6&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[valgrind] =3D &quot;--with-valgrind=3Dyes, --with-valgr=
ind=3Dno, valgrind&quot;<br>
=C2=A0PACKAGECONFIG[gmp] =3D &quot;--with-gmp=3Dyes, --with-gmp=3Dno, gmp&q=
uot;<br>
-PACKAGECONFIG[ipv6] =3D &quot;,--enable-wide-getaddrinfo,&quot;<br>
+PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6, --disable-ipv6,&quot;<br>
<br>
=C2=A0EXTRA_AUTORECONF +=3D &quot;--exclude=3Daclocal&quot;<br>
<br>
-- <br>
2.23.0.rc1<br>
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

--00000000000003e66805938a39c4--
