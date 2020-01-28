Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 56D6C7F891
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 01:53:24 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dc19so12904127edb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UiQ8iD/WsiKPogPceITkG6omXycSOkUu8zrFdhYBBvw=;
	b=YZqA6gxCmpXfTje03ghsSzJTjmTuZzjmZyTB0/4nYsKK/IjFu/LX7ZvOM3NvXvon9r
	SvVIAwLgkBhA6+h3IxLONH3pwz/03Ms0QFXnZXv7J7dBbtrr7EdmpQTuIn7vbKm2pTAe
	rNpROXe2jhd0ZBHdkLXFOdHijUTRj0z15LCfO1seq7LCAmGFit1/9mJKHQ3jHgBsH8XH
	O5K9/ICZ2zK21f5FbOax/xajWh2cX+6lf0YXjIzS8qVy9PDIK2sFv12+/GJQxI+dVxqG
	cQFfI25cbxlDjhv/RoNi6ufiDydPLchmdBfMkpZN86LV473rdSGtbCxqXg9HTnAScNMk
	9SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UiQ8iD/WsiKPogPceITkG6omXycSOkUu8zrFdhYBBvw=;
	b=E97+tNAQgBC9mjE8WzicMW36gaPgDfhGJKS4QCjvt1vT2/yebkarUedKBsoYLpNj/U
	fy1yvNwLppVWvarCoXw7IMUOWSwTr4fudO7ObnLON9DRCSJrZBrPpZa/Wd2zypb9CKoU
	Pdv82Pc/q0xlmlz0U2HE1IPJxcKnz5nMHcHpMecrOXOI+U7CmZcwDe+9ddzpw0FvZuli
	eODDBxvllaoyfJs4ZQOtSusPzhXg4XKOyFMP3JD5MlbI9X0nAxfnVkO0AVw1kKjECusF
	htuAFTRgWGPgh1bjXgN60DTErJmPYH0llH+wuG7iYmYiSdJ7aMxBzDtSX8gwUjCpQXkq
	iXkQ==
X-Gm-Message-State: APjAAAUhyZjEIrABa7C3dTBzdR51KVnM4ujMZQ+jzoF7akMJXG1+y+uT
	bWRv2Co33eX0zoUS9uqQkIdtia/jXt69pFpn1ISoOQ==
X-Google-Smtp-Source: APXvYqxY7j3rRJbFKwUBh4JsIkvlXCFEs9BITFYbdixr/2x5oqCqNuizEDcnCmAiDpJIAAlaWIkl3IuH9rT987Y9agg=
X-Received: by 2002:a17:906:1356:: with SMTP id
	x22mr1221813ejb.55.1580176405020; 
	Mon, 27 Jan 2020 17:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20200127154330.32269-1-Martin.Jansa@gmail.com>
	<CAMKF1sopderw+hwY06CeszehphcxHsc2V299iphj17ufgNHtEQ@mail.gmail.com>
In-Reply-To: <CAMKF1sopderw+hwY06CeszehphcxHsc2V299iphj17ufgNHtEQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Jan 2020 02:53:13 +0100
Message-ID: <CA+chaQfjfCcdGRhrtrp0qSZOEC0W9kjDpMc514upYdFdiJ0zPA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nspr, nss: use ${includedir}/nspr like e.g. ubuntu does
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
X-List-Received-Date: Tue, 28 Jan 2020 01:53:24 -0000
Content-Type: multipart/alternative; boundary="0000000000004dc6d8059d297d23"

--0000000000004dc6d8059d297d23
Content-Type: text/plain; charset="UTF-8"

Fixes for all 3 sent to oe-devel ML, thanks for review and test with world.

On Tue, Jan 28, 2020 at 12:39 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 27, 2020 at 7:43 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > * instead of installing all 51 nspr header files directly in
> ${includedir}
> >
> > * ubuntu uses /usr/include/nspr as well as shown in:
> >   https://packages.ubuntu.com/xenial/amd64/libnspr4-dev/filelist
> >   and some components assume the same path
> >
> > * update nss configure to find them, similar change might be needed in
> >   mozjs and ecryptfs-utils
>
> It does come with some userspace fallouts
>
> https://errors.yoctoproject.org/Errors/Details/308323/
> https://errors.yoctoproject.org/Errors/Details/308321/
> https://errors.yoctoproject.org/Errors/Details/308320/
>
>
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-support/nspr/nspr/nspr.pc.in | 2 +-
> >  meta/recipes-support/nspr/nspr_4.24.bb    | 4 ++++
> >  meta/recipes-support/nss/nss/nss.pc.in    | 2 +-
> >  meta/recipes-support/nss/nss_3.49.1.bb    | 4 +++-
> >  4 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-support/nspr/nspr/nspr.pc.in
> b/meta/recipes-support/nspr/nspr/nspr.pc.in
> > index d74caabe4c..1f15d19cfa 100644
> > --- a/meta/recipes-support/nspr/nspr/nspr.pc.in
> > +++ b/meta/recipes-support/nspr/nspr/nspr.pc.in
> > @@ -8,4 +8,4 @@ Name: NSPR
> >  Description: The Netscape Portable Runtime
> >  Version: NSPRVERSION
> >  Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
> > -Cflags:
> > +Cflags: -I${includedir}/nspr
> > diff --git a/meta/recipes-support/nspr/nspr_4.24.bb
> b/meta/recipes-support/nspr/nspr_4.24.bb
> > index 5f823f8941..e98fe83ed3 100644
> > --- a/meta/recipes-support/nspr/nspr_4.24.bb
> > +++ b/meta/recipes-support/nspr/nspr_4.24.bb
> > @@ -156,6 +156,10 @@ MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/nspr-config"
> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> >  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> >
> > +# Do not install nspr in usr/include, but in usr/include/nspr, the
> > +# preferred path upstream.
> > +EXTRA_OECONF += "--includedir=${includedir}/nspr"
> > +
> >  do_compile_prepend() {
> >         oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}"
> LDFLAGS="" CC="${BUILD_CC}" -C config export
> >  }
> > diff --git a/meta/recipes-support/nss/nss/nss.pc.in
> b/meta/recipes-support/nss/nss/nss.pc.in
> > index 200f635c65..402b4ecb33 100644
> > --- a/meta/recipes-support/nss/nss/nss.pc.in
> > +++ b/meta/recipes-support/nss/nss/nss.pc.in
> > @@ -7,5 +7,5 @@ Name: NSS
> >  Description: Network Security Services
> >  Version: %NSS_VERSION%
> >  Requires: nspr >= %NSPR_VERSION%
> > -Libs: -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
> > +Libs: -L${libdir} -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
> >  Cflags: -IOEINCDIR
> > diff --git a/meta/recipes-support/nss/nss_3.49.1.bb
> b/meta/recipes-support/nss/nss_3.49.1.bb
> > index 94f4b88fa5..b16ade9f62 100644
> > --- a/meta/recipes-support/nss/nss_3.49.1.bb
> > +++ b/meta/recipes-support/nss/nss_3.49.1.bb
> > @@ -52,7 +52,7 @@ do_configure_prepend_libc-musl () {
> >  }
> >
> >  do_compile_prepend_class-native() {
> > -    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
> > +    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
> >      export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
> >      export NSS_ENABLE_WERROR=0
> >  }
> > @@ -67,6 +67,8 @@ do_compile_prepend_class-native() {
> >  }
> >
> >  do_compile() {
> > +    export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
> > +
> >      export CROSS_COMPILE=1
> >      export NATIVE_CC="${BUILD_CC}"
> >      # Additional defines needed on Centos 7
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004dc6d8059d297d23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fixes for all 3 sent to oe-devel ML, thanks for review and=
 test with world.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Jan 28, 2020 at 12:39 AM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Mon, Jan 27, 2020 at 7:43 AM=
 Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blan=
k">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * instead of installing all 51 nspr header files directly in ${include=
dir}<br>
&gt;<br>
&gt; * ubuntu uses /usr/include/nspr as well as shown in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://packages.ubuntu.com/xenial/amd64/libnsp=
r4-dev/filelist" rel=3D"noreferrer" target=3D"_blank">https://packages.ubun=
tu.com/xenial/amd64/libnspr4-dev/filelist</a><br>
&gt;=C2=A0 =C2=A0and some components assume the same path<br>
&gt;<br>
&gt; * update nss configure to find them, similar change might be needed in=
<br>
&gt;=C2=A0 =C2=A0mozjs and ecryptfs-utils<br>
<br>
It does come with some userspace fallouts<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/308323/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/308323/</a><br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/308321/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/308321/</a><br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/308320/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/308320/</a><br>
<br>
<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/nspr/nspr/<a href=3D"http://nspr.pc.in" rel=
=3D"noreferrer" target=3D"_blank">nspr.pc.in</a> | 2 +-<br>
&gt;=C2=A0 meta/recipes-support/nspr/<a href=3D"http://nspr_4.24.bb" rel=3D=
"noreferrer" target=3D"_blank">nspr_4.24.bb</a>=C2=A0 =C2=A0 | 4 ++++<br>
&gt;=C2=A0 meta/recipes-support/nss/nss/<a href=3D"http://nss.pc.in" rel=3D=
"noreferrer" target=3D"_blank">nss.pc.in</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta/recipes-support/nss/<a href=3D"http://nss_3.49.1.bb" rel=3D=
"noreferrer" target=3D"_blank">nss_3.49.1.bb</a>=C2=A0 =C2=A0 | 4 +++-<br>
&gt;=C2=A0 4 files changed, 9 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/nspr/nspr/<a href=3D"http://nspr.pc.=
in" rel=3D"noreferrer" target=3D"_blank">nspr.pc.in</a> b/meta/recipes-supp=
ort/nspr/nspr/<a href=3D"http://nspr.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">nspr.pc.in</a><br>
&gt; index d74caabe4c..1f15d19cfa 100644<br>
&gt; --- a/meta/recipes-support/nspr/nspr/<a href=3D"http://nspr.pc.in" rel=
=3D"noreferrer" target=3D"_blank">nspr.pc.in</a><br>
&gt; +++ b/meta/recipes-support/nspr/nspr/<a href=3D"http://nspr.pc.in" rel=
=3D"noreferrer" target=3D"_blank">nspr.pc.in</a><br>
&gt; @@ -8,4 +8,4 @@ Name: NSPR<br>
&gt;=C2=A0 Description: The Netscape Portable Runtime<br>
&gt;=C2=A0 Version: NSPRVERSION<br>
&gt;=C2=A0 Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl<br>
&gt; -Cflags:<br>
&gt; +Cflags: -I${includedir}/nspr<br>
&gt; diff --git a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.24.bb"=
 rel=3D"noreferrer" target=3D"_blank">nspr_4.24.bb</a> b/meta/recipes-suppo=
rt/nspr/<a href=3D"http://nspr_4.24.bb" rel=3D"noreferrer" target=3D"_blank=
">nspr_4.24.bb</a><br>
&gt; index 5f823f8941..e98fe83ed3 100644<br>
&gt; --- a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.24.bb" rel=3D=
"noreferrer" target=3D"_blank">nspr_4.24.bb</a><br>
&gt; +++ b/meta/recipes-support/nspr/<a href=3D"http://nspr_4.24.bb" rel=3D=
"noreferrer" target=3D"_blank">nspr_4.24.bb</a><br>
&gt; @@ -156,6 +156,10 @@ MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindir}/ns=
pr-config&quot;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURE=
S&#39;, &#39;ipv6&#39;, d)}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,&quot=
;<br>
&gt;<br>
&gt; +# Do not install nspr in usr/include, but in usr/include/nspr, the<br=
>
&gt; +# preferred path upstream.<br>
&gt; +EXTRA_OECONF +=3D &quot;--includedir=3D${includedir}/nspr&quot;<br>
&gt; +<br>
&gt;=C2=A0 do_compile_prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake CROSS_COMPILE=3D1 CFLAGS=
=3D&quot;-DXP_UNIX ${BUILD_CFLAGS}&quot; LDFLAGS=3D&quot;&quot; CC=3D&quot;=
${BUILD_CC}&quot; -C config export<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta/recipes-support/nss/nss/<a href=3D"http://nss.pc.in"=
 rel=3D"noreferrer" target=3D"_blank">nss.pc.in</a> b/meta/recipes-support/=
nss/nss/<a href=3D"http://nss.pc.in" rel=3D"noreferrer" target=3D"_blank">n=
ss.pc.in</a><br>
&gt; index 200f635c65..402b4ecb33 100644<br>
&gt; --- a/meta/recipes-support/nss/nss/<a href=3D"http://nss.pc.in" rel=3D=
"noreferrer" target=3D"_blank">nss.pc.in</a><br>
&gt; +++ b/meta/recipes-support/nss/nss/<a href=3D"http://nss.pc.in" rel=3D=
"noreferrer" target=3D"_blank">nss.pc.in</a><br>
&gt; @@ -7,5 +7,5 @@ Name: NSS<br>
&gt;=C2=A0 Description: Network Security Services<br>
&gt;=C2=A0 Version: %NSS_VERSION%<br>
&gt;=C2=A0 Requires: nspr &gt;=3D %NSPR_VERSION%<br>
&gt; -Libs: -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3<br>
&gt; +Libs: -L${libdir} -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3<br>
&gt;=C2=A0 Cflags: -IOEINCDIR<br>
&gt; diff --git a/meta/recipes-support/nss/<a href=3D"http://nss_3.49.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">nss_3.49.1.bb</a> b/meta/recipes-supp=
ort/nss/<a href=3D"http://nss_3.49.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">nss_3.49.1.bb</a><br>
&gt; index 94f4b88fa5..b16ade9f62 100644<br>
&gt; --- a/meta/recipes-support/nss/<a href=3D"http://nss_3.49.1.bb" rel=3D=
"noreferrer" target=3D"_blank">nss_3.49.1.bb</a><br>
&gt; +++ b/meta/recipes-support/nss/<a href=3D"http://nss_3.49.1.bb" rel=3D=
"noreferrer" target=3D"_blank">nss_3.49.1.bb</a><br>
&gt; @@ -52,7 +52,7 @@ do_configure_prepend_libc-musl () {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_compile_prepend_class-native() {<br>
&gt; -=C2=A0 =C2=A0 export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR_NATIVE}<br>
&gt; +=C2=A0 =C2=A0 export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR_NATIVE}/nspr=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export NSPR_LIB_DIR=3D${STAGING_LIBDIR_NATIVE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export NSS_ENABLE_WERROR=3D0<br>
&gt;=C2=A0 }<br>
&gt; @@ -67,6 +67,8 @@ do_compile_prepend_class-native() {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_compile() {<br>
&gt; +=C2=A0 =C2=A0 export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR}/nspr<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export CROSS_COMPILE=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export NATIVE_CC=3D&quot;${BUILD_CC}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Additional defines needed on Centos 7<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000004dc6d8059d297d23--
