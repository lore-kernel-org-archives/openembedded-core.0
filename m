Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 180B97458B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:43:41 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 130-v6so9872698qkd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r6TX/IbWeaFsV/CQaq2gI8RHk+uK33XWkB9w30kEO6c=;
	b=QSi+QHpyaAimvtoic7VHBFg/eRIH7grYDe19MJGtYCwcxLfYRECoYaBjUQWwubQikh
	oxMBaLId562wNcQnLsdjyPlaFur7kyz7jyDBasBellKWiYUn+6oD6+XmRWGeI83ft+e7
	6oOBtmY9H9kHZzCvrM9TwenpUgLotuj6vg88+mUBMPlzamcc4aigWuGGyLVWYUPXabwh
	JwN9cHScQ2iDfOG4MpkdghKeMvMVXFfj3ajOvN2m5+gqYoJANh6j02/OiD8GyuGLlBrN
	0vMa/bEIW6mqumKl6ZlbyR+9AOAerSeWcoFF/lQVZTn9EL5icse+YkquhW/82NYt2abE
	23tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r6TX/IbWeaFsV/CQaq2gI8RHk+uK33XWkB9w30kEO6c=;
	b=ImtWGQWrz/ZiOIM0N7Qzb6L+w1Hk56qVcUTpfKsVbQlQqluIxvHwUMNr6Me8lxZNm+
	yUH7nt3yKKSUxfDtAI0KbWARVqXGz5wlrAHNbkNqMzBab2XX3oViIssqflH5ZQozG1u+
	+enGs3UGGNycHzux3yGe5P1ZcKeQi4MHfeeuIBf+FYK269t9MOqE8nsmnZhjliguTxhw
	Q23lPT+peR8MNSZMh8d/dP2+C2RheruHhSOZ1gtL2OLJbX2UmkueUWybWGDr6SLBwdvT
	MntZjy2MZcrV3Hck8UKMsfEr5a9UJZePfsYcD6MomNfLKwruD54MUz8wWgW9hSw+PBVh
	Hc5A==
X-Gm-Message-State: APzg51COFo6CFI5Ljo7dpkSJxRiPsaELo78Tcqt38U6M3ACZGTfYTHIM
	ojYOLqbqGJrNR2LxXWp7jFH1c22HJMqluecRNRE=
X-Google-Smtp-Source: ANB0Vdac2NcwCuLjykgsz2BiNhkTPS2r2Pzok5sDHSxMclbfEPZ+kAtrwqn96lqlhAQInultZdNZXhNfjxcrXe8eXQc=
X-Received: by 2002:a37:2e03:: with SMTP id
	u3-v6mr18328932qkh.223.1537220622743; 
	Mon, 17 Sep 2018 14:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180916155313.18535-1-raj.khem@gmail.com>
	<CAJ86T=VU+eey_Pn9hxdBwprjOHRyej25pKVooSL7imb1vtg0XQ@mail.gmail.com>
In-Reply-To: <CAJ86T=VU+eey_Pn9hxdBwprjOHRyej25pKVooSL7imb1vtg0XQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Sep 2018 14:43:32 -0700
Message-ID: <CAMKF1sqQKa_OMqVcTKa4Tfk54w+TV+VoJHZuAD5=PU027SZWOg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Add aliases for glibc provided libraries
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
X-List-Received-Date: Mon, 17 Sep 2018 21:43:42 -0000
Content-Type: multipart/alternative; boundary="0000000000002900310576181173"

--0000000000002900310576181173
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2018 at 11:19 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Sun, Sep 16, 2018 at 8:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > This is a step towards running pebuilt applications for glibc  on musl
> > There are many realworld applications which are not always built from
> > source, especially provided by third party
>
> Should these symlinks go in a separate package (musl-glibc-compat ?)
> so that only people trying to run closed source glibc binaries on musl
> need to see them?


I thought about doing it but then this would mean we have to install that
package in image explicitly and here it=E2=80=99s practically adding no ext=
ra code
so decided against it but I am open if people feel strongly against it


>
> > Signee-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb
> b/meta/recipes-core/musl/musl_git.bb
> > index be31718e3a..a830c36eeb 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -26,6 +26,14 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
> >             bsd-headers \
> >             libssp-nonshared \
> >            "
> > +GLIBC_LDSO ?=3D "ld.so.1"
> > +GLIBC_LDSO_arm =3D "${@ bb.utils.contains('TUNE_FEATURES',
> 'callconvention-hard', 'ld-linux-armhf.so.3', 'ld-linux.so.3', d)}"
> > +GLIBC_LDSO_aarch64 =3D "ld-linux-aarch64.so.1"
> > +GLIBC_LDSO_x86 =3D "ld-linux.so.2"
> > +GLIBC_LDSO_x86_64 =3D "ld-linux-x86-64.so.2"
> > +GLIBC_LDSO_x32 =3D "ld-linux-x32.so.2"
> > +GLIBC_LDSO_powerpc64 =3D "ld64.so.1"
> > +GLIBC_LDSO_mips64 =3D "ld64.so.1"
> >
> >  export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> >
> > @@ -62,10 +70,14 @@ do_install() {
> >         install -d ${D}${bindir}
> >         rm -f ${D}${bindir}/ldd
> >         lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
> > +       lnr ${D}${libdir}/libc.so ${D}${base_libdir}/${GLIBC_LDSO}
> >         for l in crypt dl m pthread resolv rt util xnet
> >         do
> >                 ln -sf libc.so ${D}${libdir}/lib$l.so
> >         done
> > +       for i in libc.so.6 libcrypt.so.1 libdl.so.2 libm.so.6
> libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
> > +               ln -sf libc.so ${D}${libdir}/$i
> > +       done
> >  }
> >
> >  RDEPENDS_${PN}-dev +=3D "linux-libc-headers-dev bsd-headers-dev
> libssp-nonshared-staticdev"
> > --
> > 2.19.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002900310576181173
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon,=
 Sep 17, 2018 at 11:19 AM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gma=
il.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Sun, Sep 16, 2018 at 8:53 AM, Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; This is a step towards running pebuilt applications for glibc=C2=A0 on=
 musl<br>
&gt; There are many realworld applications which are not always built from<=
br>
&gt; source, especially provided by third party<br>
<br>
Should these symlinks go in a separate package (musl-glibc-compat ?)<br>
so that only people trying to run closed source glibc binaries on musl<br>
need to see them?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I thought about doing it but then this would mean we have to install that =
package in image explicitly and here it=E2=80=99s practically adding no ext=
ra code so decided against it but I am open if people feel strongly against=
 it</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; Signee-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">musl_git.bb</a> | 12 ++++++++++++<br>
&gt;=C2=A0 1 file changed, 12 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=
=3D"noreferrer" target=3D"_blank">musl_git.bb</a> b/meta/recipes-core/musl/=
<a href=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank">musl_gi=
t.bb</a><br>
&gt; index be31718e3a..a830c36eeb 100644<br>
&gt; --- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">musl_git.bb</a><br>
&gt; +++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">musl_git.bb</a><br>
&gt; @@ -26,6 +26,14 @@ DEPENDS =3D &quot;virtual/${TARGET_PREFIX}binutils =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bsd-headers \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libssp-nonshared \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +GLIBC_LDSO ?=3D &quot;ld.so.1&quot;<br>
&gt; +GLIBC_LDSO_arm =3D &quot;${@ bb.utils.contains(&#39;TUNE_FEATURES&#39=
;, &#39;callconvention-hard&#39;, &#39;ld-linux-armhf.so.3&#39;, &#39;ld-li=
nux.so.3&#39;, d)}&quot;<br>
&gt; +GLIBC_LDSO_aarch64 =3D &quot;ld-linux-aarch64.so.1&quot;<br>
&gt; +GLIBC_LDSO_x86 =3D &quot;ld-linux.so.2&quot;<br>
&gt; +GLIBC_LDSO_x86_64 =3D &quot;ld-linux-x86-64.so.2&quot;<br>
&gt; +GLIBC_LDSO_x32 =3D &quot;ld-linux-x32.so.2&quot;<br>
&gt; +GLIBC_LDSO_powerpc64 =3D &quot;ld64.so.1&quot;<br>
&gt; +GLIBC_LDSO_mips64 =3D &quot;ld64.so.1&quot;<br>
&gt;<br>
&gt;=C2=A0 export CROSS_COMPILE=3D&quot;${TARGET_PREFIX}&quot;<br>
&gt;<br>
&gt; @@ -62,10 +70,14 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/ldd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lnr ${D}${libdir}/libc.so ${D}${bindi=
r}/ldd<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0lnr ${D}${libdir}/libc.so ${D}${base_libdi=
r}/${GLIBC_LDSO}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in crypt dl m pthread resolv rt=
 util xnet<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf li=
bc.so ${D}${libdir}/lib$l.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in libc.so.6 libcrypt.so.1 libdl.so.=
2 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf libc.so=
 ${D}${libdir}/$i<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS_${PN}-dev +=3D &quot;linux-libc-headers-dev bsd-headers=
-dev libssp-nonshared-staticdev&quot;<br>
&gt; --<br>
&gt; 2.19.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000002900310576181173--
