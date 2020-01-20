Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCB97F847
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 00:29:45 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r14so22636941lfm.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4Z8MpWiMMYge2aSPLJCPoSH7jBNYo/HDCFT52xBkalQ=;
	b=ZLboXXK95vWpJEbOA/7b0BHvxjv7Y7qXvo8OmPQtAUnsi31b8o8w19OBPJ2mmmEY1q
	Bj51XneFYjOzZdShftdxwYJnWaU50lra2Vr5Yeq/saBI3lV/7gHMSJBd5WjSECkTZHq0
	om3NIniA+SoacUJoAEpoYuThPOufWdHCENTY1NxTpGhDqu5sD8I51259cZSlSXekYh1j
	o/KYecGO9CWVg8clSCIvFpXbQ5FfLzI7cCnRyPk/o758xmFsIoMg+EP//gE1RSjxLz1R
	69vylx67iM1ZvnzArmTSlS0VUvwspgmPYkHxi6sxWMYoqgKua5Ykh+bwbeWQhxygXHlB
	NmIw==
X-Gm-Message-State: APjAAAUPPbBqJaJmaWb10z3CdAfPGyiTb+ZOTCtQzIEkyn4Aa0i+ZVt7
	HULW0Hv5a1HDJo3fCwc8G692TtgogZ8=
X-Google-Smtp-Source: APXvYqwWazzOWof8LHvhT5Tcdv+QKNOa73JNe+m4cZqWWNAdYwxEk1ER6L3FwdEr/tiLSLsZgmxRKQ==
X-Received: by 2002:a19:cb97:: with SMTP id b145mr5743278lfg.161.1579480186307;
	Sun, 19 Jan 2020 16:29:46 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
	[209.85.208.176]) by smtp.gmail.com with ESMTPSA id
	t27sm15949639ljd.26.2020.01.19.16.29.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 19 Jan 2020 16:29:46 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id z22so32023876ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 16:29:45 -0800 (PST)
X-Received: by 2002:a2e:3504:: with SMTP id z4mr12179708ljz.273.1579480185870; 
	Sun, 19 Jan 2020 16:29:45 -0800 (PST)
MIME-Version: 1.0
References: <1579402907-13849-1-git-send-email-alejandro@enedino.org>
	<CAMKF1sp1usXA9Ybu-PgYB7-s2gZS=U8NZdtC-0hdPp=SvSL_rw@mail.gmail.com>
In-Reply-To: <CAMKF1sp1usXA9Ybu-PgYB7-s2gZS=U8NZdtC-0hdPp=SvSL_rw@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sun, 19 Jan 2020 16:29:33 -0800
X-Gmail-Original-Message-ID: <CAHMutrYa6giS9qMnt5gVaO9jBbfHiSQ6398mME+afLB4Cqugvw@mail.gmail.com>
Message-ID: <CAHMutrYa6giS9qMnt5gVaO9jBbfHiSQ6398mME+afLB4Cqugvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure: Enable the use of different symbol versioning
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
X-List-Received-Date: Mon, 20 Jan 2020 00:29:46 -0000
Content-Type: multipart/alternative; boundary="000000000000689f43059c876307"

--000000000000689f43059c876307
Content-Type: text/plain; charset="UTF-8"

Hey Khem,

On Sun, Jan 19, 2020, 4:22 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Jan 18, 2020 at 7:02 PM Alejandro Enedino Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > While the gnu style for symbol versioning is the most usual,
> > --enable-symvers[=style] can be provided several values,
> > gnu, gnu-versioned-namespace, darwin, darwin-export, and sun,
> > depending on users needs.
> >
> > Introduce the SYMVERS_CONF variable to allow the user to
> > configure the symbol versioning in shared libraries.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > index 24ba8ce..bb4f692 100644
> > --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> > @@ -17,6 +17,8 @@ GCCTHREADS ?= "posix"
> >
> >  GCCPIE ??= ""
> >
> > +SYMVERS_CONF ?= "--enable-symvers=gnu"
> > +
>
> just turn the RHS into variable not full option
>

I did think about that, and I can do it, but I think I would have to also
create a PACKAGECONFIG and since AFAIC no one is changing the style I'm not
sure it's worth the complication of the code, and this still allows us to
remove the enablement entirely, not just changing the style.

Alejandro


> >  EXTRA_OECONF = "\
> >      ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS') != 'no']} \
> >      --with-gnu-ld \
> > @@ -27,7 +29,7 @@ EXTRA_OECONF = "\
> >      ${GCCPIE} \
> >      --enable-c99 \
> >      --enable-long-long \
> > -    --enable-symvers=gnu \
> > +    ${SYMVERS_CONF} \
> >      --enable-libstdcxx-pch \
> >      --program-prefix=${TARGET_PREFIX} \
> >      --without-local-prefix \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000689f43059c876307
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hey Khem,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Jan 19, 2020, 4:22 PM Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Sat, Jan 18, 2020 at 7:02 PM Alejandr=
o Enedino Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noref=
errer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; While the gnu style for symbol versioning is the most usual,<br>
&gt; --enable-symvers[=3Dstyle] can be provided several values,<br>
&gt; gnu, gnu-versioned-namespace, darwin, darwin-export, and sun,<br>
&gt; depending on users needs.<br>
&gt;<br>
&gt; Introduce the SYMVERS_CONF variable to allow the user to<br>
&gt; configure the symbol versioning in shared libraries.<br>
&gt;<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta=
/recipes-devtools/gcc/gcc-configure-common.inc<br>
&gt; index 24ba8ce..bb4f692 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
&gt; @@ -17,6 +17,8 @@ GCCTHREADS ?=3D &quot;posix&quot;<br>
&gt;<br>
&gt;=C2=A0 GCCPIE ??=3D &quot;&quot;<br>
&gt;<br>
&gt; +SYMVERS_CONF ?=3D &quot;--enable-symvers=3Dgnu&quot;<br>
&gt; +<br>
<br>
just turn the RHS into variable not full option<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I did think about that, and =
I can do it, but I think I would have to also create a PACKAGECONFIG and si=
nce AFAIC no one is changing the style I&#39;m not sure it&#39;s worth the =
complication of the code, and this still allows us to remove the enablement=
 entirely, not just changing the style.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Alejandro</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@[&#39;--enable-clocale=3Dgeneric&#39;, &#39;&#3=
9;][d.getVar(&#39;USE_NLS&#39;) !=3D &#39;no&#39;]} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-gnu-ld \<br>
&gt; @@ -27,7 +29,7 @@ EXTRA_OECONF =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${GCCPIE} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-c99 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-long-long \<br>
&gt; -=C2=A0 =C2=A0 --enable-symvers=3Dgnu \<br>
&gt; +=C2=A0 =C2=A0 ${SYMVERS_CONF} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-libstdcxx-pch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --program-prefix=3D${TARGET_PREFIX} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --without-local-prefix \<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000689f43059c876307--
