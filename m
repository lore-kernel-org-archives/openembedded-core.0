Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31D5C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 09:03:12 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.9409.1638522183797504726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 01:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dcVJjKXD;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id v15so4985080ljc.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 01:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nx9/iSAbEO2OhbhyZawSSclrZcE4AgDOmjHy5x98CEc=;
        b=dcVJjKXDd9NpwIjkK3Kj7/3EfxoHdyA4Hhh6hIxupVY7i/WRn/LqI3SGZ94xljGZK/
         Kemjp+SQFXm5w2/OeD5ABn0iYtI+BiyZsHrMDPyHQf/tobEZPI6pOQHyJ19/bjgXSjpl
         5C0w+FZhWgjYY3J/wEKCsug6/AGbwItlFxbSwFq+3GdHbEi2ZfzE3hgYeFyNG/xkwuBD
         82rU0gEj4MMeJlK4xQPcAvYX1Q3xakt+64Ar/5mNH7b+WD63iidH1lehQlQoVupSuaHG
         JBfePrBHxq93tor8I0Cn+lXqtTOjI6dq4EHrXopegM2l9iwdIar8/2pMmR9tmrJh8mi4
         7zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nx9/iSAbEO2OhbhyZawSSclrZcE4AgDOmjHy5x98CEc=;
        b=DhwIkRL/WsP61rE+schbPTVqvdajjQdPCt54L/WU/UpHKzX9Hn4rRuOQUHrc6EVU27
         Q3zzKOSimUPzFDqdbwEzFXonOjx5Qwb3kuRT155Y+1J5rCaoFvWJYM/WOOTTZB0QiCZt
         pexQUDNLekc62FL7RVOa05KjgVRhcPMM2GH+Cyhn/pQzNXr9v8zukCnyzVYqiKmPSdzO
         Du+TRskJmxib409wfiIx4bMbaIDujNj+/ry4Y8b2zktA0jE+3Z5n9S6D3iEo/VrCsKIy
         KXoQz+cQUV/KRCTCRXIO5ApDXEw1NtKCaTnFgw3/6/zwacaRmSS/rktIVL/wQwnBtqCa
         ipJw==
X-Gm-Message-State: AOAM533+108YWvJGUPSh3cPBZ/L3L9+HFog08nc+2oT16aiMQC50O5Zu
	33W+px3Cqd9qxTuqBekm6dZ9AopwkxMUAdG8YKk=
X-Google-Smtp-Source: 
 ABdhPJwnieeJYcxi97qQqJX2RjWnFSjP725wqNyXl5O6RRtkTChRq46MCfx9PIgDfj8jFko5HAbLCnBDKaV7O4teuiY=
X-Received: by 2002:a2e:2e0e:: with SMTP id u14mr16805556lju.28.1638522181637;
 Fri, 03 Dec 2021 01:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20211202220517.2106590-1-quaresma.jose@gmail.com>
 <4ba740e7876974703d351f941eaf2e67cc3688e8.camel@linuxfoundation.org>
In-Reply-To: 
 <4ba740e7876974703d351f941eaf2e67cc3688e8.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 3 Dec 2021 09:02:51 +0000
Message-ID: 
 <CANPvuRkn0ib1=n=hpa6jDnei+4JLvLZ2bfwbs8BMGhWDunnCxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sstate: don't limit the thread pool size
 when checking mirrors
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000097dc3f05d23a2cd8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 09:03:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159111

--00000000000097dc3f05d23a2cd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
2/12/2021 =C3=A0(s) 23:16:

> On Thu, 2021-12-02 at 22:05 +0000, Jose Quaresma wrote:
> > This improves the time needed to check the mirrors,
> > reducing it from 50s to 8s when building the core-image-minimal
> > using the yocto upstream sstate and hashequivlance servers
> > on a machine with 8 cpu cores.
> >
> > Tested with:
> >
> >  SSTATE_MIRRORS =3D "file://.*
> http://sstate.yoctoproject.org/dev/PATH;downloadfilename=3DPATH"
> >  BB_HASHSERVE_UPSTREAM =3D "typhoon.yocto.io:8687"
> >  bitbake core-image-minimal
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 0326d27c74..5e404d7cd8 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -1005,7 +1005,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFals=
e,
> currentcount=3D0, summary=3DTrue,
> >              tasklist.append((tid, sstatefile))
> >
> >          if tasklist:
> > -            nproc =3D min(int(d.getVar("BB_NUMBER_THREADS")),
> len(tasklist))
> > +            nproc =3D len(tasklist)
> >
> >              progress =3D len(tasklist) >=3D 100
> >              if progress:
>
> No, we're not doing that. That opens a ton (thousands) of parallel
> connections
> to the servers and isn't fair on the systems hosting the data. In many
> cases
> that would look like a DoS attack.
>
> Cheers,
>
> Richard
>
>
>
>
Got it and I have to agree that it will launch a DoS to the server.
However there are some cases around that have the mirror hosted locally on
the file system.
I'll try to find a solution that doesn't affect the http mirror.

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000097dc3f05d23a2cd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 2/12/2021 =C3=A0(s) 23:16:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, 2021-12-02 at 22:05 +0000, J=
ose Quaresma wrote:<br>
&gt; This improves the time needed to check the mirrors,<br>
&gt; reducing it from 50s to 8s when building the core-image-minimal<br>
&gt; using the yocto upstream sstate and hashequivlance servers<br>
&gt; on a machine with 8 cpu cores.<br>
&gt; <br>
&gt; Tested with:<br>
&gt; <br>
&gt;=C2=A0 SSTATE_MIRRORS =3D &quot;file://.* <a href=3D"http://sstate.yoct=
oproject.org/dev/PATH;downloadfilename=3DPATH" rel=3D"noreferrer" target=3D=
"_blank">http://sstate.yoctoproject.org/dev/PATH;downloadfilename=3DPATH</a=
>&quot;<br>
&gt;=C2=A0 BB_HASHSERVE_UPSTREAM =3D &quot;<a href=3D"http://typhoon.yocto.=
io:8687" rel=3D"noreferrer" target=3D"_blank">typhoon.yocto.io:8687</a>&quo=
t;<br>
&gt;=C2=A0 bitbake core-image-minimal<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 0326d27c74..5e404d7cd8 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -1005,7 +1005,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFal=
se, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasklist.append((tid, =
sstatefile))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tasklist:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nproc =3D min(int(d.getVar(=
&quot;BB_NUMBER_THREADS&quot;)), len(tasklist))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nproc =3D len(tasklist)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 progress =3D len(taskl=
ist) &gt;=3D 100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if progress:<br>
<br>
No, we&#39;re not doing that. That opens a ton (thousands) of parallel conn=
ections<br>
to the servers and isn&#39;t fair on the systems hosting the data. In many =
cases<br>
that would look like a DoS attack.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><div><br></div>Got it and=C2=A0I have to agree that it w=
ill launch=C2=A0a DoS to the server.<div>However there are some cases aroun=
d that have the=C2=A0mirror hosted locally on the file system.<div><div>I&#=
39;ll try to find a solution that doesn&#39;t affect the http mirror.<br></=
div><div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><=
div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div><=
/div></div></div></div>

--00000000000097dc3f05d23a2cd8--

