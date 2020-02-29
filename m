Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35FEE608AB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 06:35:04 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id ea1so2459395qvb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6x4/ABioXYcHg54ZIwyTloDiLloMF4U0JGkc+Z9HX40=;
	b=Djq+pFm3RWID54xpz6Dpx/X4ablZyGNF31cI6wu9KbGmZMaoFv0if88gTOLag7VNFI
	woZoXAT6+scUOHisVRvCcggWBoEWRvbkBzs/VYhXXKpuvoYiuHDQ54rTk7E2yN5ZEoMm
	8+cT8f3AukNa1D4CbwPQml8w1EohSiHpd6/GvToO1f3Ngtn6cfVVUec97G98p1U1q9g8
	UMkfzf+f1tfzKqyOWeSqdUjSYDXf3ItIMnxnY+vJhIokZ8SDQodG6P0yg/WVQof7n28Z
	6KOZyG8ek0WTzHCpUUzL7PXO9IX77QMQgqtKMSBTKHE7ri5Aox7uFxrzLElEBWAp54MW
	byVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6x4/ABioXYcHg54ZIwyTloDiLloMF4U0JGkc+Z9HX40=;
	b=A60PiX3/lgGCgv45jC0CkNFwmrBiuQ66+ixM0d1Mu3nUa68U3KXKjfiP8Ym0PQfsme
	M56mx80dKDqgxgxZU1M7hJ4lvXfCPdoTCb7lHOxZ+Rbta21T8ihRvZ3fkiLD4LkqeeXX
	udUqoLW5NipM+okt6DiRbTokAV9ORWz/XqgqyGPVokiMdmG0WJrHw1TD9lBiOxaGBd40
	2iOZhQckGYN2DngSuFzOIynxqBq14rlZavLPXdR6lO+S3XXHMuUCcpSPq/s/NBRTBYmm
	yIEu5vOu8Kz7uGGRsMKwIKydA5WQgjSfjAFNithoYROuvx5N1DFinBcZqWAUgWiLgcrq
	tYBA==
X-Gm-Message-State: ANhLgQ0zcOWyX1gylKn+on7bIHjFC3uKet2xGuf0bnnfm73kywNy4TaB
	MiuYhKtm58SCmLTMo0nKc7Fh/l5cb53/XWwwD14=
X-Google-Smtp-Source: ADFU+vvNT69hH5CL1LoIqZG0ChfyMWBlzu+UQZtG8vweFphtNA7gEykmloc63oh+NHCM9eC66a4nhbK1RYIf0w3tz+k=
X-Received: by 2002:a0c:f647:: with SMTP id s7mr309488qvm.4.1582958104657;
	Fri, 28 Feb 2020 22:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20200228000437.1848815-1-raj.khem@gmail.com>
	<CAJ86T=Xp=_b=VajoJpaWkyRZ5KJOrhUnWWFzF3Oq92-ASzt25A@mail.gmail.com>
In-Reply-To: <CAJ86T=Xp=_b=VajoJpaWkyRZ5KJOrhUnWWFzF3Oq92-ASzt25A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Feb 2020 22:34:53 -0800
Message-ID: <CAMKF1sqrAMsLqVMKHezrfLdZCqUNVP7Ok-B1NFd5K-gD3TKsnw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] systemd: Do not force removing resolved from PACKAGECONFIG
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
X-List-Received-Date: Sat, 29 Feb 2020 06:35:04 -0000
Content-Type: multipart/alternative; boundary="00000000000085c489059fb12730"

--00000000000085c489059fb12730
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 28, 2020 at 9:02 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Feb 27, 2020 at 4:04 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This needs __UAPI_DEF_ETHHDR to be set to 0 which now
> > taken care by CFLAGS
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix typo in append
>
> Looks like this arrived too late. The v1 patch is already in master.
>

No worries will rebase and resend


> >  meta/recipes-core/systemd/systemd_244.3.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_244.3.bb
> b/meta/recipes-core/systemd/systemd_244.3.bb
> > index 5d863410b8..a56a28a189 100644
> > --- a/meta/recipes-core/systemd/systemd_244.3.bb
> > +++ b/meta/recipes-core/systemd/systemd_244.3.bb
> > @@ -98,12 +98,13 @@ PACKAGECONFIG_remove_libc-musl = " \
> >      nss \
> >      nss-mymachines \
> >      nss-resolve \
> > -    resolved \
> >      smack \
> >      sysusers \
> >      utmp \
> >  "
> >
> > +CFLAGS_append_libc-musl = " -D__UAPI_DEF_ETHHDR=0"
> > +
> >  # Use the upstream systemd serial-getty@.service and rely on
> >  # systemd-getty-generator instead of using the OE-core specific
> >  # systemd-serialgetty.bb - not enabled by default.
> > --
> > 2.25.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000085c489059fb12730
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Feb 28, 2020 at 9:02 PM Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Thu, Feb 27, 2020 at 4:04 PM Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; This needs __UAPI_DEF_ETHHDR to be set to 0 which now<br>
&gt; taken care by CFLAGS<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Fix typo in append<br>
<br>
Looks like this arrived too late. The v1 patch is already in master.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">No worries will =
rebase and resend=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_244.3.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_244.3.bb</a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_244.3=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd_244.3.bb</a> b/meta/recip=
es-core/systemd/<a href=3D"http://systemd_244.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">systemd_244.3.bb</a><br>
&gt; index 5d863410b8..a56a28a189 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_244.3.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_244.3.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_244.3.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_244.3.bb</a><br>
&gt; @@ -98,12 +98,13 @@ PACKAGECONFIG_remove_libc-musl =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nss \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nss-mymachines \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nss-resolve \<br>
&gt; -=C2=A0 =C2=A0 resolved \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 smack \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sysusers \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 utmp \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; +CFLAGS_append_libc-musl =3D &quot; -D__UAPI_DEF_ETHHDR=3D0&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Use the upstream systemd serial-getty@.service and rely on<br>
&gt;=C2=A0 # systemd-getty-generator instead of using the OE-core specific<=
br>
&gt;=C2=A0 # <a href=3D"http://systemd-serialgetty.bb" rel=3D"noreferrer" t=
arget=3D"_blank">systemd-serialgetty.bb</a> - not enabled by default.<br>
&gt; --<br>
&gt; 2.25.1<br>
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

--00000000000085c489059fb12730--
