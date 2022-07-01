Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC279C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 16:36:40 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.40930.1656693398943382870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BxnoQwOq;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id n15so3239872ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sP0mvfU7EKzcCgMeUqYXTJmQF5XVrYEbJWK6UQ0WxVE=;
        b=BxnoQwOqIPeMqh7PjdSTT/FH6TR3R9kqn2mVu15/wFsWypF0o6AhcYkQ6qvHdVcQU6
         NtqY6R4+oABHO8ixJ+f6IAHMfo2yvJcetaapnP4h7pIUG7SCOtgZXY2cLGwWDkW1gZYO
         D+2sNXtD3QJr38cDUXP6/p3bFL2qApmk1/n+7OKXOrbLQc3WYPJLE2ONN9hzS52zObw/
         mESFWrfMJXTbq7K2X9hcEUZjbkWnS+HUG6PJpeJ64DpPhX1kYJlU/n1dciYG3tmdHPss
         A8nqDrJ4R0RvvEKO6SQCa8Gnk2GvJYnt15PTJzaf7zR9dTg8ZsnFoF1T9Enln2Va5EBu
         bI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sP0mvfU7EKzcCgMeUqYXTJmQF5XVrYEbJWK6UQ0WxVE=;
        b=f3lddCCMdazsMIp3ebKu3JCMtQixxwt2ZPaVP512cGew44GRYrAdr7VtM05wwRALUo
         4L4W1FAM4D7KS8LBmw7wJhMA8yTb1eiPm8ZkJ3+PEDShbAs2d8+0o0UmX/MVqWhHUlH2
         suGJym80BPyBnBT8pk0uifWYRntlCoZy8EOt4lGZiPFsffU7FBH0BZE6hXH8pJHHH+g9
         CqXrMF7jc+6M99oeSpIwauCH+wtm3k1EJC+Up/mhcY22FoF9GC78nXD371yRrCToEGL5
         Qw9kSGHcLg/jTZfA8ixoFQQ1WMarkyJm2tgi3UPGsvAjn/dH2+IiU96GokRrLt7nebKd
         XQ0g==
X-Gm-Message-State: AJIora/3gzINnZMT++88Xiy0QcX1hhaZ0EQcvqwWQV8xCSRVjZmYIltq
	Kh9gVQ7cl60cX9/ZQLGJSRw1z080ym4dloK+Jq0=
X-Google-Smtp-Source: 
 AGRyM1velD02lWQTKjJk2Ba3Rkb/NBec7+OdOVT8HbyHJ2lFz0lBHuDEvkSH5aAmBMl3yOM8xqRQXiIt/oEGr4YBqq8=
X-Received: by 2002:a2e:bc1d:0:b0:25b:9667:87b9 with SMTP id
 b29-20020a2ebc1d000000b0025b966787b9mr8508801ljf.91.1656693397056; Fri, 01
 Jul 2022 09:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220701020939.62295-1-alhe@linux.microsoft.com>
 <CANPvuR=RZJALd-1jx-yULntdcjUSyDBpaMdakXWmqetXOa6Zyg@mail.gmail.com>
 <a50e0d9b15a796c39b77b9b765084a093da489bd.camel@linuxfoundation.org>
In-Reply-To: 
 <a50e0d9b15a796c39b77b9b765084a093da489bd.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 1 Jul 2022 17:36:25 +0100
Message-ID: 
 <CANPvuRkg1+=2oFG5b=Gw0RnAKAk7fdFnO9gWU4XJ-4gquNExQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix base directory for
 debugsource files when using externalsrc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006ef00505e2c0fd5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 16:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167536

--0000000000006ef00505e2c0fd5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia sexta,
1/07/2022 =C3=A0(s) 12:19:

> On Fri, 2022-07-01 at 12:05 +0100, Jose Quaresma wrote:
> > Hi Alejandro,
> >
> > Alejandro Hernandez Samaniego <alhe@linux.microsoft.com> escreveu no
> dia sexta, 1/07/2022 =C3=A0(s) 03:09:
> > > While executing do_package, bitbake checks for a list of
> > > debug source files and uses a pattern to match the ones
> > > to be included in copydebugsources.
> > >
> > > Previously when externalsrc was in use either directly or by
> > > using devtool, the source location changed and this pattern
> > > no longer matched, hence debug source files failed to be
> > > included in the corresponding package.
> > >
> > > Check when the source directory isnt the default (based on
> > > WORKDIR), and change the pattern used to match debug source
> > > files if that is the case, allowing us to perform do_package
> > > properly.
> > >
> > > Workaround debugsource.list containing paths from the host by
> > > moving debug source files away from the host directory
> > > structure  to avoid host contamination (this seems to happen
> > > when packages use $TMPDIR/work-shared and externalsrc is
> > > in use).
> > >
> > > Test matrix included using:
> > > - devtool to use externalsrc automatically
> > > - externalsrc with a non-devtool based source directory
> > > - No externalsrc at all
> > > Tested the following packages to be working:
> > > - glibc ($TMPDIR/work-shared based)
> > > - libxcrypt ($TMPDIR/work based)
> > >
> > > [YOCTO 8015]
> > >
> > > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alhe@linux.microsoft.com>
> > > ---
> > >  meta/classes/package.bbclass | 31 ++++++++++++++++++++++++++++---
> > >  1 file changed, 28 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> > > index 62050a18b8..4850134022 100644
> > > --- a/meta/classes/package.bbclass
> > > +++ b/meta/classes/package.bbclass
> > > @@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, d):
> > >          strip =3D d.getVar("STRIP")
> > >          objcopy =3D d.getVar("OBJCOPY")
> > >          workdir =3D d.getVar("WORKDIR")
> > > +        sdir =3D d.getVar("S")
> > > +        sparentdir =3D os.path.dirname(os.path.dirname(sdir))
> > > +        sbasedir =3D os.path.basename(os.path.dirname(sdir)) + "/" +
> os.path.basename(sdir)
> > >          workparentdir =3D os.path.dirname(os.path.dirname(workdir))
> > >          workbasedir =3D os.path.basename(os.path.dirname(workdir)) +
> "/" + os.path.basename(workdir)
> > >
> > > +        # If S isnt based on WORKDIR we can infer our sources are
> located elsewhere,
> > > +        # e.g. using externalsrc; use S as base for our dirs
> > >
> >
> >
> > This doesn't seem very safe imo, if the idea is to check if the
> externalsrc in use it is better using:
> >
> > if bb.data.inherits_class('externalsrc', d):
>
> The code is generic enough that if the source is outside WORKDIR, it
> should work so I'm not sure it makes sense to gate this on externalsrc
> only though...
>

My comment is mainly because I see the externalsrc everywhere in this patch=
.
But as said to make it generic it's better as it is.

Jose


> Cheers,
>
> Richard
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006ef00505e2c0fd5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia sexta, 1/07/2022 =C3=A0(s) 12:19:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Fri, 2022-07-01 at 12:05 +0100, Jo=
se Quaresma wrote:<br>
&gt; Hi Alejandro,<br>
&gt; <br>
&gt; Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:alhe@linux.microso=
ft.com" target=3D"_blank">alhe@linux.microsoft.com</a>&gt; escreveu no dia =
sexta, 1/07/2022 =C3=A0(s) 03:09:<br>
&gt; &gt; While executing do_package, bitbake checks for a list of<br>
&gt; &gt; debug source files and uses a pattern to match the ones<br>
&gt; &gt; to be included in copydebugsources.<br>
&gt; &gt; <br>
&gt; &gt; Previously when externalsrc was in use either directly or by<br>
&gt; &gt; using devtool, the source location changed and this pattern<br>
&gt; &gt; no longer matched, hence debug source files failed to be<br>
&gt; &gt; included in the corresponding package.<br>
&gt; &gt; <br>
&gt; &gt; Check when the source directory isnt the default (based on<br>
&gt; &gt; WORKDIR), and change the pattern used to match debug source<br>
&gt; &gt; files if that is the case, allowing us to perform do_package<br>
&gt; &gt; properly.<br>
&gt; &gt; <br>
&gt; &gt; Workaround debugsource.list containing paths from the host by<br>
&gt; &gt; moving debug source files away from the host directory<br>
&gt; &gt; structure=C2=A0 to avoid host contamination (this seems to happen=
<br>
&gt; &gt; when packages use $TMPDIR/work-shared and externalsrc is<br>
&gt; &gt; in use).<br>
&gt; &gt; <br>
&gt; &gt; Test matrix included using:<br>
&gt; &gt; - devtool to use externalsrc automatically<br>
&gt; &gt; - externalsrc with a non-devtool based source directory<br>
&gt; &gt; - No externalsrc at all<br>
&gt; &gt; Tested the following packages to be working:<br>
&gt; &gt; - glibc ($TMPDIR/work-shared based)<br>
&gt; &gt; - libxcrypt ($TMPDIR/work based)<br>
&gt; &gt; <br>
&gt; &gt; [YOCTO 8015]<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=
=3D"mailto:alhe@linux.microsoft.com" target=3D"_blank">alhe@linux.microsoft=
.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/classes/package.bbclass | 31 +++++++++++++++++++++++++=
+++---<br>
&gt; &gt; =C2=A01 file changed, 28 insertions(+), 3 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.=
bbclass<br>
&gt; &gt; index 62050a18b8..4850134022 100644<br>
&gt; &gt; --- a/meta/classes/package.bbclass<br>
&gt; &gt; +++ b/meta/classes/package.bbclass<br>
&gt; &gt; @@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, =
d):<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strip =3D d.getVar(&quot;STRIP&=
quot;)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objcopy =3D d.getVar(&quot;OBJC=
OPY&quot;)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&quot;WORK=
DIR&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdir =3D d.getVar(&quot;S&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sparentdir =3D os.path.dirname(os.pa=
th.dirname(sdir))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbasedir =3D os.path.basename(os.pat=
h.dirname(sdir)) + &quot;/&quot; + os.path.basename(sdir)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workparentdir =3D os.path.dirna=
me(os.path.dirname(workdir))<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workbasedir =3D os.path.basenam=
e(os.path.dirname(workdir)) + &quot;/&quot; + os.path.basename(workdir)<br>
&gt; &gt; <br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If S isnt based on WORKDIR we can =
infer our sources are located elsewhere,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e.g. using externalsrc; use S as b=
ase for our dirs<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; This doesn&#39;t=C2=A0seem very safe imo, if the idea is to check if t=
he externalsrc in use it is better using:<br>
&gt; <br>
&gt; if bb.data.inherits_class(&#39;externalsrc&#39;, d):<br>
<br>
The code is generic enough that if the source is outside WORKDIR, it<br>
should work so I&#39;m not sure it makes sense to gate this on externalsrc<=
br>
only though...<br></blockquote><div><br></div><div>My comment is mainly bec=
ause I see the externalsrc everywhere=C2=A0in this patch.</div><div>But as =
said to make it generic it&#39;s better as it is.</div><div><br></div><div>=
Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000006ef00505e2c0fd5c--

