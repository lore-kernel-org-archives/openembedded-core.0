Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0801BC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:06:14 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.2207.1636052773117222196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NdvF0NWo;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id i26so11153465ljg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xdR/G/HSA5gLUbZkqv4pJKQVswhhwoV1b2J+jiCaL6c=;
        b=NdvF0NWo1y0Ei0i22YzAEA804suX4sbUm1XOFFz2U186XlsXa5luNIEn+qOl87nNBZ
         ihxom6dP6d2fSI6KXaR616TR83jf4eLX/yVnJr8yxaoBxBD7mRoNZcU57bhyxsXH1lFy
         kw6hulLRRvvW+ybWpGIKQphXAYQdYmpM4JtM5f8hIBXrBYRPvVJHnxRoi0FtrHf2jJTy
         V/LJIdHYo+jLGmozmTuZhvAU0OeazDbYwFeq1M0JqDD8A1KzZqyYQ4MEywvwDDY8Ivg5
         U0w4XvwoOP+t1zrbj1E5kjZV7rb9jn0PIAYAgiSN8ZnIi1Ot31LJ/sVIyqTFGu5wNDq3
         E3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xdR/G/HSA5gLUbZkqv4pJKQVswhhwoV1b2J+jiCaL6c=;
        b=ddOFOIyQIq5YeOqx/cseq/ZGcjep84sRwCmZZrbeVyejxsk2IpDBDtHFPLA9MR+C1r
         Y2lAm7CT8EEROIAl+qG1T8s0aanPjdp6Z0tvvcV2i3Nqvk56x666A8cvsKdwF/mBrqtZ
         polz/BDhrVNY4f+sCg5dWQNyD4wHywJqOX/Q79IFTgVm+d8EcFLX5Tdg0vMK4KnUCJ53
         v8uGtcrzFh5TfhuhOgMzjBhRjPjkWaDwO8H8ElVGokaSnWPSdj0BxznyqIA7xFOtOy26
         NHpPnNeDHSgz6/jLwJvVZ5jXa9oAzx1sMHEvBhB8S17sHqCgLIQifwoKennQ7k7H8lIp
         winA==
X-Gm-Message-State: AOAM532Xm4+G+kYSOhsBfIUfibIpZQdBjo7teVYepyLA/6qRs/eXNaVm
	J+C6WlN79iztcDPWuQNXZ4IYVbrg0QCKmD1Z+Ks=
X-Google-Smtp-Source: 
 ABdhPJyQb1RsKJR/EZaKmGpG0V9hldMM/CoPIaFndCZQGKEumRKoBbDAqnfqBfUVub7pKppl4XPeTnE/S8uca8SWu9c=
X-Received: by 2002:a2e:2204:: with SMTP id i4mr2374135lji.28.1636052771284;
 Thu, 04 Nov 2021 12:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211104154221.57948-1-quaresma.jose@gmail.com>
 <ec28e677b4354353ac6f93564fb68f72@axis.com>
In-Reply-To: <ec28e677b4354353ac6f93564fb68f72@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Nov 2021 19:06:00 +0000
Message-ID: 
 <CANPvuRkLwfu2wFT3XO51-G+ysLtvOa904E_xj9A6N2WykcWqog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: another fix for touching files inside
 pseudo
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000442d4705cffb3836"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:06:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157857

--000000000000442d4705cffb3836
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quinta,
4/11/2021 =C3=A0(s) 17:01:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Jose Quaresma
> > Sent: den 4 november 2021 16:42
> > To: openembedded-core@lists.openembedded.org
> > Cc: Jose Quaresma <quaresma.jose@gmail.com>
> > Subject: [OE-core] [PATCH] sstate: another fix for touching files insid=
e
> > pseudo
> >
> > This patch is a fixup for 676757f "sstate: fix touching files inside
> > pseudo"
> >
> > running the 'id' command inside the sstate_unpack_package
> > function shows that this funcion run inside the pseudo:
> >
> >  uid=3D0(root) gid=3D0(root) groups=3D0(root)
> >
> > The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
> > will always return true and the touch can fail when the real user
> > don't have permission or in readonly filesystem.
> >
> > As the documentation refers:
> > - the file test operator "-w" check if the file has write permission
> > (for the user running the test).
> > - the file test operator "-O" check if you are owner of file
> >
> > We can avoid this test running the touch and mask any return errors
> > that we have.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 8182010047..e4d58639f3 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -900,12 +900,12 @@ sstate_unpack_package () {
> >       fi
> >
> >       tar -I "$ZSTD" -xvf ${SSTATE_PKG}
> > -     # update .siginfo atime on local/NFS mirror
> > -     [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [
> -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> > -     # Use "! -w ||" to return true for read only files
> > -     [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
> > -     [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch
> --no-dereference ${SSTATE_PKG}.sig
> > -     [ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ]
> || touch --no-dereference ${SSTATE_PKG}.siginfo
> > +     # update .siginfo atime on local/NFS mirror if it is a symbolic
> link
> > +     [ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo
> 2>/dev/null || true
> > +     # update each symbolic link instead of any referenced file
> > +     touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
> > +     touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
>
> To match the original code this should be:
>
>         [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference
> ${SSTATE_PKG}.siginfo 2>/dev/null || true
>
> Or was there some reason you removed the test for if the siginfo
> file exists before touching it? If so, then the commit message
> should state this.
>

I assumed that when ${SSTATE_PKG} exists the ${SSTATE_PKG}.siginfo also
exists.
You are true in your observation that this doesn't match the original code.
I will send a v2.


>
> > +     [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference
> ${SSTATE_PKG}.sig 2>/dev/null || true
> >  }
> >
> >  BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> > --
> > 2.33.1
>
> //Peter
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000442d4705cffb3836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mai=
lto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escrev=
eu no dia quinta, 4/11/2021 =C3=A0(s) 17:01:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Jose Quaresma<br>
&gt; Sent: den 4 november 2021 16:42<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" targe=
t=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] sstate: another fix for touching files insi=
de<br>
&gt; pseudo<br>
&gt; <br>
&gt; This patch is a fixup for 676757f &quot;sstate: fix touching files ins=
ide<br>
&gt; pseudo&quot;<br>
&gt; <br>
&gt; running the &#39;id&#39; command inside the sstate_unpack_package<br>
&gt; function shows that this funcion run inside the pseudo:<br>
&gt; <br>
&gt;=C2=A0 uid=3D0(root) gid=3D0(root) groups=3D0(root)<br>
&gt; <br>
&gt; The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]<br=
>
&gt; will always return true and the touch can fail when the real user<br>
&gt; don&#39;t have permission or in readonly filesystem.<br>
&gt; <br>
&gt; As the documentation refers:<br>
&gt; - the file test operator &quot;-w&quot; check if the file has write pe=
rmission<br>
&gt; (for the user running the test).<br>
&gt; - the file test operator &quot;-O&quot; check if you are owner of file=
<br>
&gt; <br>
&gt; We can avoid this test running the touch and mask any return errors<br=
>
&gt; that we have.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 12 ++++++------<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 8182010047..e4d58639f3 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -900,12 +900,12 @@ sstate_unpack_package () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&quot; -xvf ${SSTATE_PKG}<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS mirror<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ -O ${SSTATE_PKG}.siginfo ] &amp;&amp; [ -w ${SS=
TATE_PKG}.siginfo ] &amp;&amp; [ -h ${SSTATE_PKG}.siginfo ] &amp;&amp; touc=
h -a ${SSTATE_PKG}.siginfo<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Use &quot;! -w ||&quot; to return true for read=
 only files<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} ] || touch --no-dereference =
${SSTATE_PKG}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG=
}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE=
_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS mirror if it=
 is a symbolic link<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTA=
TE_PKG}.siginfo 2&gt;/dev/null || true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# update each symbolic link instead of any refere=
nced file<br>
&gt; +=C2=A0 =C2=A0 =C2=A0touch --no-dereference ${SSTATE_PKG} 2&gt;/dev/nu=
ll || true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0touch --no-dereference ${SSTATE_PKG}.siginfo 2&gt=
;/dev/null || true<br>
<br>
To match the original code this should be:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-de=
reference ${SSTATE_PKG}.siginfo 2&gt;/dev/null || true<br>
<br>
Or was there some reason you removed the test for if the siginfo <br>
file exists before touching it? If so, then the commit message <br>
should state this.<br></blockquote><div><br></div><div>I assumed that when =
${SSTATE_PKG} exists the ${SSTATE_PKG}.siginfo=C2=A0also exists.<br></div><=
div>You are true in your observation that this doesn&#39;t match the origin=
al code.</div><div>I will send a v2.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ ! -e ${SSTATE_PKG}.sig ] || touch --no-derefere=
nce ${SSTATE_PKG}.sig 2&gt;/dev/null || true<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 BB_HASHCHECK_FUNCTION =3D &quot;sstate_checkhashes&quot;<br>
&gt; --<br>
&gt; 2.33.1<br>
<br>
//Peter<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000442d4705cffb3836--

