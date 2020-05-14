Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web12.1781.1589477356214830691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CohAg/TS;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id z16so1413542uae.11
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cc/O07XdmaDrOCS9JvoLVpTXnrB6h9MKPmFqFV8/7L0=;
        b=CohAg/TSwRvgyqPhqMui1eqf7FHMnJcYIpKmCjfH7Qvzg7HW8Qlroqa3h73SJPRw8m
         aVs9VWZHBi5ltWKDY+fMc0pGOqhLlQclaiyE4vJvDkgKiCUhuIntX44jRbH2v25N74od
         AuamfcudCCJKiCFQr7GncRAkP9c8g0L3gaFTIjliR5nzGXYcKeO9QehiRklO4NSGuBlP
         qFLuNtlkwxD6OF/NL8IG9eroi6OodcRAP9++R4dnxnhzQjyKnZqv9aPrgETM/RF7remU
         T3SO0kv7OPEZX3PgJvTMxtqOCcznhMHSCGO5fKelePtf3kx6XldwPXEse6unBuZR7bxz
         GcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cc/O07XdmaDrOCS9JvoLVpTXnrB6h9MKPmFqFV8/7L0=;
        b=FQtwp9cgYj6Qd+uZugLihr8NuOkBT/azAajKA5Ipi9orn16bC04ZoliTWQAiEq8JmX
         IaCplqSd+o0Ewg9sc71IJpamxEDngWTsE2jKiXD54sc808l7mor03WKRrX0OALYGSuFQ
         he8kOVl/qxJpDGlZcZjB8JfeRYq8QChljTKf5oLJzBPFLH6TfNvDbb1d0uZ41Juh1XxZ
         34n1pT04RW22hlWJhUKfXYD7Yw9qPmzrBP6wnZ8gje419M7u1m6lDo9hCLpYwMpbMoI7
         fRQDrgFaBnBS3MlYVsrPOpTSmOHaRgCtmqubU2EpNXGUevCG+9cpYkd5/LPKh/DXqyHX
         Qyww==
X-Gm-Message-State: AOAM531ZIw2//E4fhRHFEq93T3PYmVrYv/b8sgG7PLADyMZW4BBOzwTz
	fXdK0/oFsW2nYtnXoMtPrRYbRPcNXpTQzbQGpHk=
X-Google-Smtp-Source: ABdhPJys0whnmH6577vBBPtCICoNO9/bgTOTCEZDKY9I6RLBhg08CcYWs4fwyg2FhUD3p9fT/9mFDM6EhDf57P+hjfw=
X-Received: by 2002:ab0:69cc:: with SMTP id u12mr4812073uaq.22.1589477355249;
 Thu, 14 May 2020 10:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200511092342.29197-1-kai.kang@windriver.com>
 <f00e9d2b-8ada-a259-337d-9c1fa37862ab@windriver.com> <9c5dcfc03d2670a447cc08565cb74e407211906a.camel@linuxfoundation.org>
In-Reply-To: <9c5dcfc03d2670a447cc08565cb74e407211906a.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 14 May 2020 19:29:04 +0200
Message-ID: <CANNYZj-mE1Dw7yFom3oZ6U8-odD7UXsBhZjhbofy-1O2UYrZDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcr: depends on gnupg-native
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: kai <kai.kang@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000023633105a59f094a"

--00000000000023633105a59f094a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looking gcr's autotools and meson build files, gpg executable is required
in both. Gcr is needed only by epiphany, so I don't think build performanc=
e
will suffer much.

Alex

On Thu, 14 May 2020 at 15:26, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-05-14 at 09:59 +0800, kai wrote:
> > On 2020/5/11 =E4=B8=8B=E5=8D=885:23, kai.kang@windriver.com wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > >
> > > It fails to build gcr if no commmand gpg on build host:
> > >
> > > > meson.build:44:0: ERROR: Program(s) ['gpg2', 'gpg'] not found or
> > > > not executable
> > >
> > > Add dependency gnupg-native to fix the error.
> > >
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >   meta/recipes-gnome/gcr/gcr_3.36.0.bb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-
> > > gnome/gcr/gcr_3.36.0.bb
> > > index 4fe3b2fff3..458dc8e6c4 100644
> > > --- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
> > > +++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
> > > @@ -8,7 +8,7 @@ BUGTRACKER =3D "
> > > https://gitlab.gnome.org/GNOME/gcr/issues"
> > >   LICENSE =3D "GPLv2"
> > >   LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc605"
> > >
> > > -DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt \
> > > +DEPENDS =3D "gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
> > >              ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> > > 'libxslt-native', '', d)}"
> > >
> > >   GNOMEBASEBUILDCLASS =3D "meson"
> >
> > Any comment, please?
>
> Why did this happen? Was this as a result of the move to meson? Is it
> really needed and can we avoid it? native dependencies like this are a
> pain from a build performance perspective...
>
> Cheers,
>
> Richard
>
>=20
>

--00000000000023633105a59f094a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looking gcr&#39;s autotools and meson build files, gp=
g executable is required in both. Gcr is needed only by epiphany, so I don&=
#39;t think build performance will suffer much.</div><div><br></div><div>Al=
ex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, 14 May 2020 at 15:26, Richard Purdie &lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Thu, 2020-05-14 at 09:59 +0800, kai wrote:<br>
&gt; On 2020/5/11 =E4=B8=8B=E5=8D=885:23, <a href=3D"mailto:kai.kang@windr=
iver.com" target=3D"_blank">kai.kang@windriver.com</a> wrote:<br>
&gt; &gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" tar=
get=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; It fails to build gcr if no commmand gpg on build host:<br>
&gt; &gt; <br>
&gt; &gt; &gt; meson.build:44:0: ERROR: Program(s) [&#39;gpg2&#39;, &#39;g=
pg&#39;] not found or<br>
&gt; &gt; &gt; not executable<br>
&gt; &gt; <br>
&gt; &gt; Add dependency gnupg-native to fix the error.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.36.0.=
bb" rel=3D"noreferrer" target=3D"_blank">gcr_3.36.0.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.36.0=
.bb" rel=3D"noreferrer" target=3D"_blank">gcr_3.36.0.bb</a> b/meta/recipes-=
<br>
&gt; &gt; gnome/gcr/<a href=3D"http://gcr_3.36.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gcr_3.36.0.bb</a><br>
&gt; &gt; index 4fe3b2fff3..458dc8e6c4 100644<br>
&gt; &gt; --- a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.36.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gcr_3.36.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.36.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gcr_3.36.0.bb</a><br>
&gt; &gt; @@ -8,7 +8,7 @@ BUGTRACKER =3D &quot;<br>
&gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/gcr/issues" rel=3D"nor=
eferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gcr/issues</a>&qu=
ot;<br>
&gt; &gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc605&quot=
;<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; -DEPENDS =3D &quot;gtk+3 p11-kit glib-2.0 libgcrypt \<br>
&gt; &gt; +DEPENDS =3D &quot;gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native=
 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.cont=
ains(&#39;GI_DATA_ENABLED&#39;, &#39;True&#39;,<br>
&gt; &gt; &#39;libxslt-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
&gt; <br>
&gt; Any comment, please?<br>
<br>
Why did this happen? Was this as a result of the move to meson? Is it<br>
really needed and can we avoid it? native dependencies like this are a<br>
pain from a build performance perspective...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--00000000000023633105a59f094a--
