Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.6007.1589009915394134799
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 00:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kjL32r2I;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id u12so2548349vsq.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/gqc1DCVGKBrV9hHjEWrvNV/JJgmqIw8BdJdVV01Y0=;
        b=kjL32r2IIYfuIQ0t21PP/dW5rsQs9yZpCTzqg5llCs7saHxLaa/NZ13NqnZkfh9r6S
         E5QaitkyNBkReMECyURjtvowyF+nGta2fMcP2iqlkarKHI7I5TBAeWmNOwXPLmTbQ8ln
         2c9ROao6EA0F80QbgOaKetpjwApiLR6uUaxukF05StPOJo8HxGFHirIbrorfFAUF+dBP
         EY9tPNig3/tO/nYmmcgj/HkiPuIPfr2z5AFcpC9VgBADGcClGUcnjHXnv9iK6zNdcAOK
         Z6JZNo3TBKJkiA4Kf+6KA8ia8ND5mguErwTcmnO8z3Dc2QBzL+WkRrg03afky0ByquKL
         c2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/gqc1DCVGKBrV9hHjEWrvNV/JJgmqIw8BdJdVV01Y0=;
        b=KcG+yFA0TCyXlBUwjfqtNlCqgam6Jgj+AUEYY8eG0IzFPH4+AFmUHLPMoP9lLKRvBz
         10irtgIwHsz4oz0nja0iLz9wViFj+6kZsUlHw0Zacox1b4u8QhHjNw98kE6w82yyQjIT
         DZpn70p+7ouG8zGvw6lGGW3TVw/mSg9/MjPbAmXOydC9n2W3oli9SiOeLpH85hXTr3dg
         C40vmmbfRwFGMG9tfbQw2RATjAXNCPigtwYPd1NVvJk1+zWrFNkQoxu9SbVZ0w0ANFVp
         AzwUjfCKjB3u0scMBNcsM4KYotMenAHfRQ83e2yZeO4GLEQOQECwAJ23BztVHzJUXvRw
         BopA==
X-Gm-Message-State: AGi0PuZu2b1UDfVVejPn+Y9DvLdjgqbzT4+UciiXBYNSa/PnNQ1X9ENE
	vc4pEYE8trdjnX8Jr6m0FDHpCdnGS3z7PFdiYtk=
X-Google-Smtp-Source: APiQypKwThif+5LC+bC4qWVXfAUTLK0t5TqdKVeOVekfwsVzncgxqWWnMBuwsk5rzNSdM7aGTvkscycEKOnJ59FaZQw=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr5310557vsp.83.1589009914534;
 Sat, 09 May 2020 00:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CANx9H-CQXEyXOU4o4x=Y_Hn-BgeK95C5cSAm4kJT59gYfSfK5g@mail.gmail.com> <PR3PR05MB6890A8531A904349FDA2EDD5A8A30@PR3PR05MB6890.eurprd05.prod.outlook.com>
In-Reply-To: <PR3PR05MB6890A8531A904349FDA2EDD5A8A30@PR3PR05MB6890.eurprd05.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 9 May 2020 09:38:22 +0200
Message-ID: <CANNYZj9=6NLFgbPhVDWdCL1uKmEGLcF25uq17-mOkByq6VJVhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi.bbclass: mind package suffix on version check
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Tim Orling <ticotimo@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008020dc05a5323375"

--0000000000008020dc05a5323375
Content-Type: text/plain; charset="UTF-8"

Can you give specific examples please? I think we can probably add \.tar to
the end of the existing regex, which will ensure there are no unwanted
suffixes. This is already done in plenty of recipes for the same reason.

Alex

On Sat, 9 May 2020 at 08:55, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Fully support that, it's same for me.
> But then the regex is also not a 100% correct, as it will issue a
> notification via "devtool check-upgrade-status", even for an alpha or
> beta or dev release - and most important without the suffix, so it's
> extra hard to identify if one should take action or not.
>
> And even when using the "devtool upgrade" patch it will run a build
> attempt, which will immediately fail, as the reported version is
> present, due to the suffix being trimmed during the process.
>
> What I could imagine is to ignore those releases by default using an
> inverted group like (?P<pver>(\d+[\.\-_]*)+(?![a-z0-9]+)*) to filter out
> those kind of releases.
>
> What do you think?
>
> On 09.05.20 06:56, Tim Orling wrote:
> > We should only be updating to releases, not dev or alpha or any other
> > non-released state. That is why the regex is they way it is.
> >
> > On Fri, May 8, 2020 at 4:37 AM Konrad Weihmann <kweihmann@outlook.com
> > <mailto:kweihmann@outlook.com>> wrote:
> >
> >     Some pypi packages do have suffixes like dev, or a0 or b1.
> >     When doing a version check on these, the version will get falsely
> >     trimmed down to a version without the suffix.
> >
> >     E.g. 3.8.0a1 will become 3.8.0 which then also means that
> >     a version upgrade from 3.8.0a1 to 3.8.0a2 will not be detected.
> >
> >     Fix that by inserting an optional suffix group with alphanumeric
> >     charset.
> >
> >     Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
> >     <mailto:kweihmann@outlook.com>>
> >     ---
> >       meta/classes/pypi.bbclass | 2 +-
> >       1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >     diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> >     index e5d7ab3ce1..7d0f367a02 100644
> >     --- a/meta/classes/pypi.bbclass
> >     +++ b/meta/classes/pypi.bbclass
> >     @@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
> >       S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
> >
> >       UPSTREAM_CHECK_URI ?=
> >     "https://pypi.python.org/pypi/${PYPI_PACKAGE}/
> >     <https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/>"
> >     -UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> >     +UPSTREAM_CHECK_REGEX ?=
> >     "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+[a-z0-9]*)"
> >     --
> >     2.20.1
> >
> >
> >
> 
>

--0000000000008020dc05a5323375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you give specific examples please? I think we can=
 probably add \.tar to the end of the existing regex, which will ensure the=
re are no unwanted suffixes. This is already done in plenty of recipes for =
the same reason.<br></div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 9 May 2=
020 at 08:55, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">=
kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Fully support that, it&#39;s same for me.<br>
But then the regex is also not a 100% correct, as it will issue a <br>
notification via &quot;devtool check-upgrade-status&quot;, even for an alp=
ha or <br>
beta or dev release - and most important without the suffix, so it&#39;s <=
br>
extra hard to identify if one should take action or not.<br>
<br>
And even when using the &quot;devtool upgrade&quot; patch it will run a bu=
ild <br>
attempt, which will immediately fail, as the reported version is <br>
present, due to the suffix being trimmed during the process.<br>
<br>
What I could imagine is to ignore those releases by default using an <br>
inverted group like (?P&lt;pver&gt;(\d+[\.\-_]*)+(?![a-z0-9]+)*) to filter=
 out <br>
those kind of releases.<br>
<br>
What do you think?<br>
<br>
On 09.05.20 06:56, Tim Orling wrote:<br>
&gt; We should only be updating to releases, not dev or alpha or any other=
 <br>
&gt; non-released state. That is why the regex is they way it is.<br>
&gt; <br>
&gt; On Fri, May 8, 2020 at 4:37 AM Konrad Weihmann &lt;<a href=3D"mailto:=
kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:kweihmann@outlook.com" target=3D"_blank"=
>kweihmann@outlook.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Some pypi packages do have suffixes like dev, or a=
0 or b1.<br>
&gt;=C2=A0 =C2=A0 =C2=A0When doing a version check on these, the version w=
ill get falsely<br>
&gt;=C2=A0 =C2=A0 =C2=A0trimmed down to a version without the suffix.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0E.g. 3.8.0a1 will become 3.8.0 which then also mea=
ns that<br>
&gt;=C2=A0 =C2=A0 =C2=A0a version upgrade from 3.8.0a1 to 3.8.0a2 will not=
 be detected.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Fix that by inserting an optional suffix group wit=
h alphanumeric<br>
&gt;=C2=A0 =C2=A0 =C2=A0charset.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Konrad Weihmann &lt;<a href=3D"mail=
to:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes/pypi.bbclass | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(=
-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes/pypi.bbclass b/meta/clas=
ses/pypi.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index e5d7ab3ce1..7d0f367a02 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/pypi.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/pypi.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -23,4 +23,4 @@ SRC_URI +=3D &quot;${PYPI_SRC_UR=
I}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV=
}&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0UPSTREAM_CHECK_URI ?=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://pypi.python.org/pypi/$%7B=
PYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.=
org/pypi/${PYPI_PACKAGE}/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://pypi.python.org/pypi/$%7BPY=
PI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.or=
g/pypi/$%7BPYPI_PACKAGE%7D/</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/=
(?P&lt;pver&gt;(\d+[\.\-_]*)+)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+UPSTREAM_CHECK_REGEX ?=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-_]*=
)+[a-z0-9]*)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.20.1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000008020dc05a5323375--
