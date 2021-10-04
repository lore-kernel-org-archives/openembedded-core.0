Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF06C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 17:59:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.13589.1633370367804538621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 10:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RjrisFXJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id n8so19498588lfk.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dDWlq5FP6PzVt1xFEc0DTUymjVurRJVQIZddGUuIUM=;
        b=RjrisFXJVk4RYJIS3sTPdgmdsVb1jSChoWi+X1r9JLkgEXB+nFHQGHw6HpFgWg0EkI
         0+nW41R+ZsGB0ZBY3pTvuqfgHRqEHLJBw5LiAEawnXFFw/TUyKd8GW0l5w4t9dVxzpuQ
         1/wBAcfYrclTCuMK2CMbQQ0ulm/AnRf/gMEtaWken22Smv0euCyCQ9F2DfJYiUw62YrS
         qP48DnsDkubHjeiW0z2HWJeKfB3lpZZsG4JGiDWXKp8mbd+vze2MNpLKn/AzYno2h0gi
         LkmjBhPELGCq+Q9TN5ULocUy/kqfzh4PJfkmr21S8VXK6iUtvgXJb6GIox1gSCAG3sPI
         aYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dDWlq5FP6PzVt1xFEc0DTUymjVurRJVQIZddGUuIUM=;
        b=bTdl4tIc6JY7Au9vPjqCLwe0lBDpI1gBUQ0vKv1G8ps1TDVx7rIE30tfYa17AhG+o/
         jh7uj0WNbLL0KUzbEXpYFMCuXoV534xW1eb4BX4cEFPa9en/n6HjAZdiiKD73ez5gNDV
         kKSRZODc2QpQf+b0hSBGp+AnLV9/nUcJulCd8UVR/mk3UGL7AtZgtLe23anmX4z0BiUF
         cbD75LM6z8G0ras75x/swzumsSsDT2jq9v5G0XblANYvEbCJRmI2sfkr1QOLe6VTMU6g
         TuhBWl0E2z6YCjcEu9PIwj32S3vv4p/t/xsiZl0t8MY756aX0evPmMx1naGDWav80OKT
         duNw==
X-Gm-Message-State: AOAM530EDbvi38xzRN2KIQualeCHHHqHDV7/zrWWnB4HF+vymRrKFvg8
	XlDOT2w2QoXhUhqRBzUHCkInh9mrdDkwzGY95dA=
X-Google-Smtp-Source: 
 ABdhPJzMoXiR3F9wYf+LqeC5Frl7HVHTUxi0nn3eaUnqI1dFYx/BNke6fQr7IXhaISxBiDldVipkG8LtgcIErAbFpN0=
X-Received: by 2002:a2e:5111:: with SMTP id
 f17mr17755300ljb.409.1633370364048;
 Mon, 04 Oct 2021 10:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211003213834.934065-1-quaresma.jose@gmail.com>
 <c9839c9f3bda2be330b9ee6be281b9bee237411e.camel@linuxfoundation.org>
In-Reply-To: 
 <c9839c9f3bda2be330b9ee6be281b9bee237411e.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 4 Oct 2021 18:59:17 +0100
Message-ID: 
 <CANPvuR=Gnc=QpXqQkC1=37=93SZC1f_MS8FvfLui8RKmx9r5hQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: adds warnings for the
 exceptions of os.utime in siginfo
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000055f94805cd8aacd2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 17:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156620

--00000000000055f94805cd8aacd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 4/10/2021 =C3=A0(s) 15:11:

> On Sun, 2021-10-03 at 22:38 +0100, Jose Quaresma wrote:
> > When we can't update the access and modified times of sstate siginfo
> > it is useful to infor the user about that.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 92a73114bb..2deecd8777 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -720,11 +720,15 @@ def sstate_package(ss, d):
> >          try:
> >              os.utime(siginfo, None)
> >          except PermissionError:
> > +            bb.warn("Cannot sets the access and modified times of
> sstate siginfo %s, no access rights" % siginfo)
> >              pass
> >          except OSError as e:
> >              # Handle read-only file systems gracefully
> >              import errno
> > -            if e.errno !=3D errno.EROFS:
> > +            if e.errno =3D=3D errno.EROFS:
> > +                bb.warn("Cannot sets the access and modified times of
> sstate siginfo %s, read-only file system" % siginfo)
> > +                pass
> > +            else:
> >                  raise e
> >
> >      return
> > @@ -1165,11 +1169,15 @@ python sstate_eventhandler() {
> >              try:
> >                  os.utime(siginfo, None)
> >              except PermissionError:
> > +                bb.warn("Cannot sets the access and modified times of
> sstate siginfo %s, no access rights" % siginfo)
> >                  pass
> >              except OSError as e:
> >                  # Handle read-only file systems gracefully
> >                  import errno
> > -                if e.errno !=3D errno.EROFS:
> > +                if e.errno =3D=3D errno.EROFS:
> > +                    bb.warn("Cannot sets the access and modified times
> of sstate siginfo %s, read-only file system" % siginfo)
> > +                    pass
> > +                else:
> >                      raise e
> >
> >
>
> I'm not sure we can do this as there are some cases where this is
> unavoidable by
> people's state setups and we wouldn't want to show warnings in those case=
s.
>
> (e.g. think of a shared sstate dir between multiple users where the objec=
ts
> remain owned by the user that created them).
>
>
> Cheers,
>
> Richard
>
>
>
Hi Richard,

I understand the exception for the use cases but I think it would be useful
to show this to the users. Will it be more appropriate perhaps to log this
as debug messages?

I have a final question that I don't understand clearly.
Can the omission of these timestamps updates on siginfo invalidate the use
of the sstate-cache for that task,
bitbake-dumpsig can complain about that?

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000055f94805cd8aacd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia segunda, 4/10/2021 =C3=A0(s) 15:11:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Sun, 2021-10-03 at 22:38 +0100, =
Jose Quaresma wrote:<br>
&gt; When we can&#39;t update the access and modified times of sstate sigin=
fo<br>
&gt; it is useful to infor the user about that.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 12 ++++++++++--<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 92a73114bb..2deecd8777 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -720,11 +720,15 @@ def sstate_package(ss, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.utime(siginfo, None=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except PermissionError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Cannot sets t=
he access and modified times of sstate siginfo %s, no access rights&quot; %=
 siginfo)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle read-only fil=
e systems gracefully<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import errno<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e.errno !=3D errno.EROFS=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e.errno =3D=3D errno.ERO=
FS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;Cannot sets the access and modified times of sstate siginfo %s, read-only =
file system&quot; % siginfo)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise e<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return<br>
&gt; @@ -1165,11 +1169,15 @@ python sstate_eventhandler() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.utime=
(siginfo, None)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except PermissionError=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;Cannot sets the access and modified times of sstate siginfo %s, no access =
rights&quot; % siginfo)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as e:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle=
 read-only file systems gracefully<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import e=
rrno<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e.errno !=
=3D errno.EROFS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e.errno =
=3D=3D errno.EROFS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.warn(&quot;Cannot sets the access and modified times of sstate siginfo =
%s, read-only file system&quot; % siginfo)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 pass<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 raise e<br>
&gt;=C2=A0 <br>
&gt; <br>
<br>
I&#39;m not sure we can do this as there are some cases where this is unavo=
idable by<br>
people&#39;s state setups and we wouldn&#39;t want to show warnings in thos=
e cases.<br>
<br>
(e.g. think of a shared sstate dir between multiple users where the objects=
<br>
remain owned by the user that created them).<br>
<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><div><br></div><div>Hi Richard,</div><div><br></div>I un=
derstand the exception for the use cases but I think it would be useful<div=
>to show this to the users. Will it be more appropriate perhaps to log this=
 as debug=C2=A0messages?<div><br></div><div>I have a final question that I =
don&#39;t understand clearly.</div><div>Can the omission=C2=A0of these time=
stamps updates on siginfo invalidate the use of the sstate-cache for that t=
ask,</div><div>bitbake-dumpsig can complain about that?</div><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best re=
gards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div></div>

--00000000000055f94805cd8aacd2--

