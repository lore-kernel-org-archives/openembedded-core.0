Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3035.1589279136835596899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 03:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MFYQoy0a;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: mhm.dawod@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id t40so9159205pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivJdP+uPV9U7h0Olxmgd4u5qQzl87FqvZhZgE3cWh18=;
        b=MFYQoy0aWnl/CYryzIdEciB5nxA/P0k6ScdDfqd1Hmfe6wvG8WOxmR6A3+Sq7J0h+M
         4D9V6JH5e3DiULv3yMmE0/V1BqnMyqWMP7dgashEwV+UYcM0Q/q7L7ii6xssllGM3nMf
         DVJ+ljzdAV52NZk7hUj6q/FutJ1PwHoOOZTXrO8thfzJ5//63R4rCrVDNwRUnMSgkDLl
         zhuvE/R6UgPTk1jYIk7b+mpSCQ8t6ysX6Bhsv8tZcZ3JGzVQBY04qG+Q+XNujwPehDxS
         g6MnhEmg/jkJ4ShzhfoLdJILq4RhlnqeaHEMEN19RvC6uixN1/Gnjdb154o9jJitsIWP
         OW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivJdP+uPV9U7h0Olxmgd4u5qQzl87FqvZhZgE3cWh18=;
        b=kgqFbWyhIL3pKvnyChOKNSFXA7uEKhuMeIaYEUSxCSWvLg3EWq4RMH3rwgmw+tetiP
         BZqFj4b+yUj899Wuqn06wOar8fJfsuB8b/diywc2rViuwVTZIRgHr5hA9gLyrp4kZBjA
         rFVBDJp3P3fw7Q3RE1bGCuWXOhB2EiHGmwih0D0dflvY8D6YRM/BCmDsFUh7m/tdGOz3
         6AmEiPFDv+Scp+Tx1juOT378BwpbCRv2CB0U8RR7uD+ma2WMAXUzRs0HW0VRJWbnuP6d
         ZYts6J8301LA6jAJ4AJxUeqUcKEt3IEu/qXrwjKmUPOvMEaPuWQgXNITu0H03sSFkUZA
         v/og==
X-Gm-Message-State: AOAM532kq4kPRycX9oM3QmjQyt9pZyqzYi1xvViU0a+dWJTUw1mzeVUe
	ozLAlc0E22WvJKVoeeUBWNVrEQLWwUiJ2k5Q688=
X-Google-Smtp-Source: ABdhPJwh7N4/RWpfYzHNg+sRf9ypGNrzf2opQkttxEr++H6sCB14GxPJaRl+OFxMvF5b7OLbbnbMktpLyNylCITUFIQ=
X-Received: by 2002:a17:90b:357:: with SMTP id fh23mr3424070pjb.225.1589279136087;
 Tue, 12 May 2020 03:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNQW1WWHmy1zaE+LF-AKBQa-UpY8sfOy=HH3tt0rJLJFLg@mail.gmail.com>
 <20200511091703.l53b4t74xc36vgdo@qschulz> <e183edd5-cea8-8870-eef3-2d3b7ecbc05a@kernel.crashing.org>
In-Reply-To: <e183edd5-cea8-8870-eef3-2d3b7ecbc05a@kernel.crashing.org>
From: "Dawod" <mhm.dawod@gmail.com>
Date: Tue, 12 May 2020 12:25:24 +0200
Message-ID: <CAGCTLNTeN7ATP32VNxV8OdBuU73OUdAYHtDtQS7=3a1tCQGgRA@mail.gmail.com>
Subject: Re: [oe][yocto][bitbake] Fetching source using different protocols
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005b015b05a570e20e"

--0000000000005b015b05a570e20e
Content-Type: text/plain; charset="UTF-8"

Thank you all, your answers were so helpful,
My problem had been solved.
The reason behind my question was a temporary connections error for some
machines in the lab so I needed some way to cover this problem  as fast as
possible to keep my Yocto recipes away from this problem.

Thank you very much.

On Mon, May 11, 2020 at 8:37 PM Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

>
>
> On 5/11/20 4:17 AM, Quentin Schulz wrote:
> > Hi Mohamed,
> >
> > On Mon, May 11, 2020 at 11:03:26AM +0200, Dawod wrote:
> >> Hello,
> >>
> >> I need to fetch a git repo using 2 different protocols ( ssh & https )
> >> So that when I run bitbake, It will fetch using ssh protocol first and
> if
> >> it fails to fetch, It will try to fetch using https protocol.
> >>
> >
> > Why? What's the exact use case?
> >
> >> can I do some thing like that or I will have to change it manually every
> >> time ?
> >>
> >
> > Maybe you could play with PREMIRROS? (I've never explicitly used that
> > variable though):
> >
> https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#var-PREMIRRORS
>
> This is what I would suggest.  Have the recipe itself set the fallback URI
> as
> the main URL.
>
>
> SRC_URI = "git://example.com/my/repository/uri;proto=https"
>
> PREMIRRORS_prepend = "git://example.com/my/repository/uri;proto=https
> git://example.com/my/otherrepo/uri;proto=ssh \n"
>
> (the \n is literally '\' and 'n')
>
> The above should, when it sees the SRC_URI, try the ssh protocol first..
> if that
> doesn't work it will fall back to SRC_URI.
>
> --Mark
>
> > I guess the asterisk parts could be removed and the path to more or less
> your
> > source could be used (ssh first, to http path in your SRC_URI)?
> >
> > That's a shot in the dark for me but something to test I'd say :)
> >
> > Quentin
> >
> >
> > 
> >
>


-- 

Mohamed Dawod
Computer Engineer

--0000000000005b015b05a570e20e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you all, your answers were so helpful,<br></div=
><div>My problem had been solved.<br></div><div>The reason behind my questi=
on was a temporary connections error for some machines in the lab so I need=
ed some way to cover this problem=C2=A0 as fast as possible to keep my Yoct=
o recipes away from this problem.=C2=A0</div><div><br></div><div>Thank you =
very much.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, May 11, 2020 at 8:37 PM Mark Hatle &lt;<a href=
=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.crashing.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
<br>
On 5/11/20 4:17 AM, Quentin Schulz wrote:<br>
&gt; Hi Mohamed,<br>
&gt; <br>
&gt; On Mon, May 11, 2020 at 11:03:26AM +0200, Dawod wrote:<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; I need to fetch a git repo using 2 different protocols ( ssh &amp=
; https )<br>
&gt;&gt; So that when I run bitbake, It will fetch using ssh protocol firs=
t and if<br>
&gt;&gt; it fails to fetch, It will try to fetch using https protocol.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Why? What&#39;s the exact use case?<br>
&gt; <br>
&gt;&gt; can I do some thing like that or I will have to change it manuall=
y every<br>
&gt;&gt; time ?<br>
&gt;&gt;<br>
&gt; <br>
&gt; Maybe you could play with PREMIRROS? (I&#39;ve never explicitly used =
that<br>
&gt; variable though):<br>
&gt; <a href=3D"https://www.yoctoproject.org/docs/latest/mega-manual/mega-=
manual.html#var-PREMIRRORS" rel=3D"noreferrer" target=3D"_blank">https://ww=
w.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#var-PREMIRRORS<=
/a><br>
<br>
This is what I would suggest.=C2=A0 Have the recipe itself set the fallbac=
k URI as<br>
the main URL.<br>
<br>
<br>
SRC_URI =3D &quot;git://<a href=3D"http://example.com/my/repository/uri;pr=
oto=3Dhttps" rel=3D"noreferrer" target=3D"_blank">example.com/my/repository=
/uri;proto=3Dhttps</a>&quot;<br>
<br>
PREMIRRORS_prepend =3D &quot;git://<a href=3D"http://example.com/my/reposi=
tory/uri;proto=3Dhttps" rel=3D"noreferrer" target=3D"_blank">example.com/my=
/repository/uri;proto=3Dhttps</a><br>
git://<a href=3D"http://example.com/my/otherrepo/uri;proto=3Dssh" rel=3D"n=
oreferrer" target=3D"_blank">example.com/my/otherrepo/uri;proto=3Dssh</a> \=
n&quot;<br>
<br>
(the \n is literally &#39;\&#39; and &#39;n&#39;)<br>
<br>
The above should, when it sees the SRC_URI, try the ssh protocol first.. i=
f that<br>
doesn&#39;t work it will fall back to SRC_URI.<br>
<br>
--Mark<br>
<br>
&gt; I guess the asterisk parts could be removed and the path to more or l=
ess your<br>
&gt; source could be used (ssh first, to http path in your SRC_URI)?<br>
&gt; <br>
&gt; That&#39;s a shot in the dark for me but something to test I&#39;d sa=
y :)<br>
&gt; <br>
&gt; Quentin<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"lt=
r"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineer<br><br></div></div></div></div></div></div></div>

--0000000000005b015b05a570e20e--
