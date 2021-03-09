Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.7651.1615291457297928483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 04:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvFQfOj9;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id q1so3681019vsq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YatuO8Dhl4SbgYL5oCFWLJXDhq09SdzS9v7bFCmS10E=;
        b=EvFQfOj9b7Fn1zH5GT9fFUUpttRR+UodXz3p0n1+6dIO9cZryY/Hre0jnMRg0HN0Jz
         p6nC14AgatXzRwnY00k2NL6shpGrNrkCqARuu8fTDR1qK7pKpfr/ccpbIJYW28s9+sLt
         ZIF2bON0t0jxtQg9iKbeU4w8rD+/FcHn4oAeNgi9wihKwLDAQ1DYEshCB8aHdLs+dXc3
         EpPIrLUWUW+iJowuBXnRppPXkUlSfY3ujAfSOXK029p56sWFktmaMi9+2rbt1SBOQ8dq
         WHxPfBhLZtVYgoLsw1lKG4+TDj6Mi5UuYvMyzxoOIQcT0Nv0ddMIJgI55T9veAXBUbZc
         ZcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YatuO8Dhl4SbgYL5oCFWLJXDhq09SdzS9v7bFCmS10E=;
        b=pUxVNmT2Lz19QVaYifliU+EJt/225DyoNHP9MomjjaFnScAd0CHEoecSvVz2Oa9neV
         T5y0ahfMroYeITUJrSzKTwU9DWVGDnUljf/LiQi5WG/3rPKm5tH8I3N+5CgNx5nMi+YM
         38K8ccxsGSLpH9pZP1Jl8gSwqYoF+PI0qhYd9kdf0q8eh/oT2nGGdLE60drx/b1MfDa+
         SfUplns8DfAaczS9xwpJfbiWVMguTZBYLNti1syRNnyXrcc6KxweImU2UrrAG2v0qWCU
         GTbDdAa63OjfPx0foyRt1X1o7XlZ2KzcSV2FciwmDQbaxPPx7xxIg+d26An+/w8S8ovV
         Rw8A==
X-Gm-Message-State: AOAM530+s/AnxaGypPxylxW1YDWr6gyVgJx4opWSkVLtZeZ314zRWIsR
	jL1N8r7iUFqymbWS2bb+B+5mITzj/qrlJSc198Q=
X-Google-Smtp-Source: ABdhPJyj/xBFcTCRkZbJ9ubBnO8CG+bGT7JD/JNicmrgAJzrrOGpftcAhPlgWBZoeHBKDoo9oZ4ygd2JEhKeh+uxYkk=
X-Received: by 2002:a67:33d8:: with SMTP id z207mr9773534vsz.54.1615291456441;
 Tue, 09 Mar 2021 04:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-18-alex.kanavin@gmail.com> <c6f58a09-04d1-16d3-e162-88e24a6c6814@gmail.com>
 <c4173a2a3bd58afdf3cc38fbb25d4b99e3d0a3d2.camel@linuxfoundation.org>
In-Reply-To: <c4173a2a3bd58afdf3cc38fbb25d4b99e3d0a3d2.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Mar 2021 13:04:05 +0100
Message-ID: <CANNYZj93mK-R2ghAvb9WGn37mQmJBOsXduGc_YohgwgF_PVG=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/24] procps: update 3.3.16 -> 3.3.17
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000078514a05bd195942"

--00000000000078514a05bd195942
Content-Type: text/plain; charset="UTF-8"

There is an open issue upstream:
https://gitlab.com/procps-ng/procps/-/issues/193

I'm fine if this is deferred until upstream sorts it out.

Alex

On Mon, 8 Mar 2021 at 23:47, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2021-02-28 at 11:10 -0800, Khem Raj wrote:
> >
> > On 2/28/21 7:36 AM, Alexander Kanavin wrote:
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >   .../procps/0001-w.c-correct-musl-builds.patch | 44
> +++++++++++++++++++
> > >   ...02-proc-escape.c-add-missing-include.patch | 23 ++++++++++
> > >   .../{procps_3.3.16.bb => procps_3.3.17.bb}    |  4 +-
> > >   3 files changed, 70 insertions(+), 1 deletion(-)
> > >   create mode 100644
> meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> > >   create mode 100644
> meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
> > >   rename meta/recipes-extended/procps/{procps_3.3.16.bb =>
> procps_3.3.17.bb} (94%)
> > >
> > > diff --git
> a/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> > > new file mode 100644
> > > index 0000000000..c92ad28e4f
> > > --- /dev/null
> > > +++
> b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> > > @@ -0,0 +1,44 @@
> > > +From 22f8d25567b8d64bdbab0fb0b4915b4362561d9b Mon Sep 17 00:00:00 2001
> > > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > +Date: Wed, 24 Feb 2021 21:14:31 +0000
> > > +Subject: [PATCH] w.c: correct musl builds
> > > +
> > > +No need to redefine UT_ stuff to something that does not exist.
> > > +
> > > +UT_ is already provided in musl but via utmp.h header, so include
> > > +it always.
> > > +
> > > +Upstream-Status: Submitted [
> https://gitlab.com/procps-ng/procps/-/merge_requests/126]
> > > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > +---
> > > + w.c | 9 +--------
> > > + 1 file changed, 1 insertion(+), 8 deletions(-)
> > > +
> > > +diff --git a/w.c b/w.c
> > > +index 9d07ac9..d10639b 100644
> > > +--- a/w.c
> > > ++++ b/w.c
> > > +@@ -57,9 +57,8 @@
> > > + #include <unistd.h>
> > > + #ifdef HAVE_UTMPX_H
> > > + # include <utmpx.h>
> > > +-#else
> > > +-# include <utmp.h>
> > > + #endif
> > > ++#include <utmp.h>
> >
> > this would mean when utmpx.h is provided ( e.g. ) it will now include
> > both, which is a change perhaps to look more into, it might want them to
> > be exclusive.
>
> This one is worrying me a bit as it does seem to change behaviour on glibc.
> Was anyone able to look into it further?
>
> Cheers,
>
> Richard
>
>

--00000000000078514a05bd195942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There is an open issue upstream:</div><div><a href=3D=
"https://gitlab.com/procps-ng/procps/-/issues/193">https://gitlab.com/procp=
s-ng/procps/-/issues/193</a></div><div><br></div><div>I&#39;m fine if this =
is deferred until upstream sorts it out.</div><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, 8 Mar 2021 at 23:47, Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2=
021-02-28 at 11:10 -0800, Khem Raj wrote:<br>
&gt; <br>
&gt; On 2/28/21 7:36 AM, Alexander Kanavin wrote:<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0=C2=A0.../procps/0001-w.c-correct-musl-builds.patch | 44 ++=
+++++++++++++++++<br>
&gt; &gt; =C2=A0=C2=A0...02-proc-escape.c-add-missing-include.patch | 23 ++=
++++++++<br>
&gt; &gt; =C2=A0=C2=A0.../{<a href=3D"http://procps_3.3.16.bb" rel=3D"noref=
errer" target=3D"_blank">procps_3.3.16.bb</a> =3D&gt; <a href=3D"http://pro=
cps_3.3.17.bb" rel=3D"noreferrer" target=3D"_blank">procps_3.3.17.bb</a>}=
=C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; &gt; =C2=A0=C2=A03 files changed, 70 insertions(+), 1 deletion(-)<br>
&gt; &gt; =C2=A0=C2=A0create mode 100644 meta/recipes-extended/procps/procp=
s/0001-w.c-correct-musl-builds.patch<br>
&gt; &gt; =C2=A0=C2=A0create mode 100644 meta/recipes-extended/procps/procp=
s/0002-proc-escape.c-add-missing-include.patch<br>
&gt; &gt; =C2=A0=C2=A0rename meta/recipes-extended/procps/{<a href=3D"http:=
//procps_3.3.16.bb" rel=3D"noreferrer" target=3D"_blank">procps_3.3.16.bb</=
a> =3D&gt; <a href=3D"http://procps_3.3.17.bb" rel=3D"noreferrer" target=3D=
"_blank">procps_3.3.17.bb</a>} (94%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-extended/procps/procps/0001-w.c-correct=
-musl-builds.patch b/meta/recipes-extended/procps/procps/0001-w.c-correct-m=
usl-builds.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..c92ad28e4f<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-b=
uilds.patch<br>
&gt; &gt; @@ -0,0 +1,44 @@<br>
&gt; &gt; +From 22f8d25567b8d64bdbab0fb0b4915b4362561d9b Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Wed, 24 Feb 2021 21:14:31 +0000<br>
&gt; &gt; +Subject: [PATCH] w.c: correct musl builds<br>
&gt; &gt; +<br>
&gt; &gt; +No need to redefine UT_ stuff to something that does not exist.<=
br>
&gt; &gt; +<br>
&gt; &gt; +UT_ is already provided in musl but via utmp.h header, so includ=
e<br>
&gt; &gt; +it always.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Submitted [<a href=3D"https://gitlab.com/procps=
-ng/procps/-/merge_requests/126" rel=3D"noreferrer" target=3D"_blank">https=
://gitlab.com/procps-ng/procps/-/merge_requests/126</a>]<br>
&gt; &gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + w.c | 9 +--------<br>
&gt; &gt; + 1 file changed, 1 insertion(+), 8 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/w.c b/w.c<br>
&gt; &gt; +index 9d07ac9..d10639b 100644<br>
&gt; &gt; +--- a/w.c<br>
&gt; &gt; ++++ b/w.c<br>
&gt; &gt; +@@ -57,9 +57,8 @@<br>
&gt; &gt; + #include &lt;unistd.h&gt;<br>
&gt; &gt; + #ifdef HAVE_UTMPX_H<br>
&gt; &gt; + # include &lt;utmpx.h&gt;<br>
&gt; &gt; +-#else<br>
&gt; &gt; +-# include &lt;utmp.h&gt;<br>
&gt; &gt; + #endif<br>
&gt; &gt; ++#include &lt;utmp.h&gt;<br>
&gt; <br>
&gt; this would mean when utmpx.h is provided ( e.g. ) it will now include =
<br>
&gt; both, which is a change perhaps to look more into, it might want them =
to <br>
&gt; be exclusive.<br>
<br>
This one is worrying me a bit as it does seem to change behaviour on glibc.=
<br>
Was anyone able to look into it further?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000078514a05bd195942--
