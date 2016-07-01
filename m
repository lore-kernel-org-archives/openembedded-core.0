Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA02560124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 21:28:09 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id t74so12746531ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=neYT97UhCJ7GEuXPGoItM1mEmV16uEmLrM0cl/GLwpM=;
	b=d5UWITouILGUp1zRW4lF1yqDSgkLpsBM+5vtSgQJhQmUmWIeEp19scvA+XqSWnHVZa
	sP2pncYtQV1F1ph5/tcpm6kzT9FYIVlBGkmNaqVaU2xcfJz7FYHjC5tUbuV1OmuN+OOx
	uhnzHB+EQoUd07tzcDQ+79h7SF+IcsA7us7O8W/TPdO3nnpC3d3wctLmModY0i0tZXgl
	NPdlnisJwigkBcJiLv0ROBiyCQKPf/9txoH9Wyz2+l59zOBZnwp5j4utOl62Mzn88hKX
	d+Z16sItQqmCTYF7cThoVy77xnBpkcfruS70Ej4jMbkPPuT4A00GHaKjjArPlFQOgfc2
	EmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=neYT97UhCJ7GEuXPGoItM1mEmV16uEmLrM0cl/GLwpM=;
	b=SKv5SPGB2hUDIHkZWPTOf/Q/ds8iquJw8tSBgX5UHN7JAX/tuwWkoaCoCv+dI9wJXY
	ftQSyn047nMY5fRZhwyBeeSm7CPd4aqF8eohL1tOwgxAaBVH/g3pZd3HohQEzs4pAAFK
	8Qj7u+ZJgDOUHWG/rjKLMseiiu3i4ho92ChO4F8LDEzVFu/lf5iQ5I5XkjvcWuqZIxqp
	GyTlmjqIsH0TslHRL/0b71r+oq7Guo81UCdz3dV+x+EJpwlvVWQSK05+HtvxfMupRTux
	gElGqOn7dDEIakEU5UT2axyqmWYH5d1daB/FY67ULL8JLiOfFk6MkEPx93YFzLs2MgM5
	6/bw==
X-Gm-Message-State: ALyK8tIl0AOGO8dgae2PQk5F61vJnhU3ozB2k9lJdTscsFAntlVf36oGlt/VAlsLSJekTl1tUVNgcoYzi6TdNw==
X-Received: by 10.107.175.83 with SMTP id y80mr311482ioe.70.1467408490011;
	Fri, 01 Jul 2016 14:28:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.19.70 with HTTP; Fri, 1 Jul 2016 14:27:50 -0700 (PDT)
In-Reply-To: <CAMKF1sqOmppX34XM=GpKrZwxHO1Rmdc+kfKR_P=MT4xra99v2w@mail.gmail.com>
References: <1467405897-14036-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sqOmppX34XM=GpKrZwxHO1Rmdc+kfKR_P=MT4xra99v2w@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 1 Jul 2016 14:27:50 -0700
Message-ID: <CABcZAN=T70vHK3B0EQfu6pBs1rHDWfAYUH8tiXPicvwzAXKSKA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] gcc-cross: remove --with-linker-hash-style
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
X-List-Received-Date: Fri, 01 Jul 2016 21:28:10 -0000
Content-Type: multipart/alternative; boundary=001a11448a04c9a5f0053699a972

--001a11448a04c9a5f0053699a972
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 2:19 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jul 1, 2016 at 1:44 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We explicitly set the hash style to gnu in our LDFLAGS. Setting the
> default to
> > this in the toolchain, while convenient, actually hides bugs, as a
> failure to
> > obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how
> we
> > poison the sysroot -- rather than relying on the default, notice right
> away if
> > somoeone isn't obeying the needed flags.
> >
> > This will result in a failure to obey LDFLAGS causing a GNU_HASH QA
> failure,
> > which is what's often seen with external toolchains. This brings us all
> on the
> > same page, and makes sure a failure to obey LDFLAGS is seen early.
> >
> > This is limited to cross, to retain ease of use for SDKs.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-4.9.inc   | 3 ++-
> >  meta/recipes-devtools/gcc/gcc-5.3.inc   | 3 ++-
> >  meta/recipes-devtools/gcc/gcc-6.1.inc   | 3 ++-
> >  meta/recipes-devtools/gcc/gcc-cross.inc | 1 +
> >  4 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc
> b/meta/recipes-devtools/gcc/gcc-4.9.inc
> > index 64701c8..05e02d9 100644
> > --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> > @@ -107,13 +107,14 @@ JAVA = ""
> >
> >  LTO = "--enable-lto"
> >
> > +OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
> >  EXTRA_OECONF_BASE = "\
> >      ${LTO} \
> > +    ${OECONF_HASH_STYLE} \
> >      --enable-libssp \
> >      --disable-bootstrap \
> >      --disable-libmudflap \
> >      --with-system-zlib \
> > -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
> >      --enable-linker-build-id \
> >      --with-ppl=no \
> >      --with-cloog=no \
> > diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc
> b/meta/recipes-devtools/gcc/gcc-5.3.inc
> > index 8613a10..faa1292 100644
> > --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> > @@ -113,14 +113,15 @@ JAVA = ""
> >
> >  LTO = "--enable-lto"
> >
> > +OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
> >  EXTRA_OECONF_BASE = "\
> >      ${LTO} \
> > +    ${OECONF_HASH_STYLE} \
> >      --enable-libssp \
> >      --enable-libitm \
> >      --disable-bootstrap \
> >      --disable-libmudflap \
> >      --with-system-zlib \
> > -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
> >      --enable-linker-build-id \
> >      --with-ppl=no \
> >      --with-cloog=no \
> > diff --git a/meta/recipes-devtools/gcc/gcc-6.1.inc
> b/meta/recipes-devtools/gcc/gcc-6.1.inc
> > index 1a00f3f..e3ff9cb 100644
> > --- a/meta/recipes-devtools/gcc/gcc-6.1.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-6.1.inc
> > @@ -93,14 +93,15 @@ JAVA = ""
> >
> >  LTO = "--enable-lto"
> >
> > +OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
> >  EXTRA_OECONF_BASE = "\
> >      ${LTO} \
> > +    ${OECONF_HASH_STYLE} \
> >      --enable-libssp \
> >      --enable-libitm \
> >      --disable-bootstrap \
> >      --disable-libmudflap \
> >      --with-system-zlib \
> > -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
> >      --enable-linker-build-id \
> >      --with-ppl=no \
> >      --with-cloog=no \
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> b/meta/recipes-devtools/gcc/gcc-cross.inc
> > index f479360..850c63a 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > @@ -33,6 +33,7 @@ EXTRA_OECONF_PATHS = "\
> >      --with-sysroot=/not/exist \
> >      --with-build-sysroot=${STAGING_DIR_TARGET} \
> >  "
> > +OECONF_HASH_STYLE = ""
>
> May be we can just explicitly override default LINKER_HASH_STYLE here
> by setting LINKER_HASH_STYLE = "sysv"
> which is effectively what we are doing by removing the option.


Ah, good idea, that would be simpler. Thanks, I'll try that.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11448a04c9a5f0053699a972
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 1, 2016 at 2:19 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, Jul 1,=
 2016 at 1:44 PM, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.co=
m">kergoth@gmail.com</a>&gt; wrote:<br>
</span><div><div class=3D"">&gt; From: Christopher Larson &lt;<a href=3D"ma=
ilto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We explicitly set the hash style to gnu in our LDFLAGS. Setting the de=
fault to<br>
&gt; this in the toolchain, while convenient, actually hides bugs, as a fai=
lure to<br>
&gt; obey LDFLAGS isn&#39;t noticed. By removing this, it&#39;s not dissimi=
lar to how we<br>
&gt; poison the sysroot -- rather than relying on the default, notice right=
 away if<br>
&gt; somoeone isn&#39;t obeying the needed flags.<br>
&gt;<br>
&gt; This will result in a failure to obey LDFLAGS causing a GNU_HASH QA fa=
ilure,<br>
&gt; which is what&#39;s often seen with external toolchains. This brings u=
s all on the<br>
&gt; same page, and makes sure a failure to obey LDFLAGS is seen early.<br>
&gt;<br>
&gt; This is limited to cross, to retain ease of use for SDKs.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-4.9.inc=C2=A0 =C2=A0| 3 ++-<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-5.3.inc=C2=A0 =C2=A0| 3 ++-<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-6.1.inc=C2=A0 =C2=A0| 3 ++-<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-cross.inc | 1 +<br>
&gt;=C2=A0 4 files changed, 7 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devt=
ools/gcc/gcc-4.9.inc<br>
&gt; index 64701c8..05e02d9 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-4.9.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc<br>
&gt; @@ -107,13 +107,14 @@ JAVA =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 LTO =3D &quot;--enable-lto&quot;<br>
&gt;<br>
&gt; +OECONF_HASH_STYLE =3D &quot;--with-linker-hash-style=3D${LINKER_HASH_=
STYLE}&quot;<br>
&gt;=C2=A0 EXTRA_OECONF_BASE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${LTO} \<br>
&gt; +=C2=A0 =C2=A0 ${OECONF_HASH_STYLE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-libssp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-bootstrap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-libmudflap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-system-zlib \<br>
&gt; -=C2=A0 =C2=A0 --with-linker-hash-style=3D${LINKER_HASH_STYLE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-linker-build-id \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-ppl=3Dno \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-cloog=3Dno \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devt=
ools/gcc/gcc-5.3.inc<br>
&gt; index 8613a10..faa1292 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-5.3.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc<br>
&gt; @@ -113,14 +113,15 @@ JAVA =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 LTO =3D &quot;--enable-lto&quot;<br>
&gt;<br>
&gt; +OECONF_HASH_STYLE =3D &quot;--with-linker-hash-style=3D${LINKER_HASH_=
STYLE}&quot;<br>
&gt;=C2=A0 EXTRA_OECONF_BASE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${LTO} \<br>
&gt; +=C2=A0 =C2=A0 ${OECONF_HASH_STYLE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-libssp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-libitm \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-bootstrap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-libmudflap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-system-zlib \<br>
&gt; -=C2=A0 =C2=A0 --with-linker-hash-style=3D${LINKER_HASH_STYLE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-linker-build-id \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-ppl=3Dno \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-cloog=3Dno \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-6.1.inc b/meta/recipes-devt=
ools/gcc/gcc-6.1.inc<br>
&gt; index 1a00f3f..e3ff9cb 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-6.1.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-6.1.inc<br>
&gt; @@ -93,14 +93,15 @@ JAVA =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 LTO =3D &quot;--enable-lto&quot;<br>
&gt;<br>
&gt; +OECONF_HASH_STYLE =3D &quot;--with-linker-hash-style=3D${LINKER_HASH_=
STYLE}&quot;<br>
&gt;=C2=A0 EXTRA_OECONF_BASE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${LTO} \<br>
&gt; +=C2=A0 =C2=A0 ${OECONF_HASH_STYLE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-libssp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-libitm \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-bootstrap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-libmudflap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-system-zlib \<br>
&gt; -=C2=A0 =C2=A0 --with-linker-hash-style=3D${LINKER_HASH_STYLE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-linker-build-id \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-ppl=3Dno \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-cloog=3Dno \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-de=
vtools/gcc/gcc-cross.inc<br>
&gt; index f479360..850c63a 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; @@ -33,6 +33,7 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-sysroot=3D/not/exist \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-build-sysroot=3D${STAGING_DIR_TARGET} \<br>
&gt;=C2=A0 &quot;<br>
&gt; +OECONF_HASH_STYLE =3D &quot;&quot;<br>
<br>
</div></div>May be we can just explicitly override default LINKER_HASH_STYL=
E here<br>
by setting LINKER_HASH_STYLE =3D &quot;sysv&quot;<br>
which is effectively what we are doing by removing the option.</blockquote>=
</div><br>Ah, good idea, that would be simpler. Thanks, I&#39;ll try that.<=
br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder=
 - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwa=
re Engineer, Mentor Graphics</div></div>
</div></div>

--001a11448a04c9a5f0053699a972--
