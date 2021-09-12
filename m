Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.17478.1631462524306616108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BnQzW0/X;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id r128-20020a1c4486000000b003065f0bc631so479057wma.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lufbnlqw4sOM2Gk8vLkttMxmP5tbJfGHOP1nNSeK4Bo=;
        b=BnQzW0/XAqVxWBWK4k8pYbIkIuJS1/BA12MUzgSYjiDAzUrEeVLmIRJ2WKGHxazMQb
         L2xRhc9ICSTDRs3GlfpQWcNKOD/XsXiwEAl+cNy9UI9pJxpFTUb4QnYJ2FSjs26LcYBV
         NkE87Y5+5pbLVkQ6iLRru9BetOmibqIxZaIlrVu7+q16CknPtKaDtyjsKNyvMyFasWNM
         0o9o8RNG8KLqNsfq9fAWzWpAck0LB9DlKpWJqi7aF4wv3VAXouhlY6atMO82N4vAJ9fA
         X+pxgV+7gqMVL1P9LbuUBE1fwGDrIpv33o3QLsO3viotl28Gq0uNBKoKgB6Oio1fhyk4
         DGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lufbnlqw4sOM2Gk8vLkttMxmP5tbJfGHOP1nNSeK4Bo=;
        b=4AIwGXXUPsNeZUE4EnCr9sQ4BDlGGCXzBW3BM8RIZyNGcsjA38X2zXfdbhr0+YVNt/
         cP590KnWxciXF6eRSKZKr/3OkJp7OMaljWSxkFJYOLkCmpgXB7l8kRi0vQtzR4krygRb
         irYVhK7zjsdJmirKAn8Ix2HZyyfSDxcxJ1l/4ii/7yG907fTxRba7HdFLfHO9bXj0g4w
         zFEToS8mOHA2Xrab1P7mhrWYtyF8XnXL+XQ30Ztnaz3h3j0TYhlyuKPSPTk8avv1zMOb
         jd1TgaeCguOYbaHcyrbjTkNyTyPUjJMHjS6pPD8Mi2l6ZixnMKEbPdknZR18Qczw4RaW
         UhSA==
X-Gm-Message-State: AOAM531VOAPbyAzOLgdb7wJxIEEW4gIBwxwfWwPLjo9op2wPgY/Nxk5X
	HyqpPp+uAY+7rYMvE4gXY0KmquYKZH3S2GaDyr8=
X-Google-Smtp-Source: ABdhPJx5uoVzozSsiz4U9T2ND8ySAel1V1MBytsJ3Q2OXgjeKlywa76u7BAxw3kQK5OGQLO9Xjr7G/EZdbZCtaoTJ4U=
X-Received: by 2002:a1c:3584:: with SMTP id c126mr7206533wma.112.1631462522543;
 Sun, 12 Sep 2021 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <0b6111c1d71f1665cacafafaea972e609a77a0cd.camel@linuxfoundation.org>
 <95bf1261-eb40-cafa-3153-0c472142fb98@gmail.com> <2f7b629ba49f76ad80461d00a3322a3fa1dc1b19.camel@linuxfoundation.org>
In-Reply-To: <2f7b629ba49f76ad80461d00a3322a3fa1dc1b19.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Sun, 12 Sep 2021 11:01:51 -0500
Message-ID: <CAJdd5Gax1=zFWNRqG4O5z9Xu=QvjuNuRNAv1NWp5=WX7yiK17Q@mail.gmail.com>
Subject: Re: [OE-core] Public project sstate/hash equivalence mirror now live
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: akuster808 <akuster808@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000001ee35d05cbce785e"

--0000000000001ee35d05cbce785e
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 12, 2021, 10:58 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2021-09-12 at 07:55 -0700, akuster808 wrote:
> >
> > On 9/12/21 4:46 AM, Richard Purdie wrote:
> > > We made the autobuilder sstate public a while ago but it wasn't useful
> after we
> > > switched to hash equivalence by default. I'm pleased to be able to
> report that
> > > we now have a read-only public server for the hash equivalence. We did
> have to
> > > fix a small API omission and a couple of sstate related bugs but I'm
> pleased to
> > > be able to report it is now operational and usable. An example config
> would be:
> > >
> > > SSTATE_MIRRORS ?= "file://.*
> http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
> > > BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
> > >
> > > I've included an example image build below where it took 11 minutes
> for a
> > > core-image-minimal image build. Obviously this is only of benefit if
> you're
> > > building configurations that match the project autobuilder although
> hash
> > > equivalence could be useful alone in reducing some build times.
> >
> > What branches that support hash equivalence will be available other than
> > Master?
>
> The question doesn't make sense as hash equivalence doesn't have a
> "branch".
> We're sharing any hash equivalence data generated from builds on the
> autobuilder.
>

We should (?) backport the BB_HASHSERVE_UPSTREAM patch so that the
instructions to enable it make sense on older branches though.



> > > I have updated the local.conf sample file in poky to match the new
> release.
> > > We're not widely highlighting that information as yet as it remains to
> be seen
> > > how well it scales and what the hosting impacts for it will look like
> but it is
> > > there to experiment with to a wider audience such as this list.
> >
> > The should improve the out-of-the-box experience.
>
> Ultimately that is the hope.
>
> Cheers,
>
> Richard
>
>

--0000000000001ee35d05cbce785e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Sep 12, 2021, 10:58 AM Richard Purdie &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, =
2021-09-12 at 07:55 -0700, akuster808 wrote:<br>
&gt; <br>
&gt; On 9/12/21 4:46 AM, Richard Purdie wrote:<br>
&gt; &gt; We made the autobuilder sstate public a while ago but it wasn&#39=
;t useful after we<br>
&gt; &gt; switched to hash equivalence by default. I&#39;m pleased to be ab=
le to report that<br>
&gt; &gt; we now have a read-only public server for the hash equivalence. W=
e did have to<br>
&gt; &gt; fix a small API omission and a couple of sstate related bugs but =
I&#39;m pleased to<br>
&gt; &gt; be able to report it is now operational and usable. An example co=
nfig would be:<br>
&gt; &gt; <br>
&gt; &gt; SSTATE_MIRRORS ?=3D &quot;file://.* <a href=3D"http://sstate.yoct=
oproject.org/dev/PATH;downloadfilename=3DPATH" rel=3D"noreferrer noreferrer=
" target=3D"_blank">http://sstate.yoctoproject.org/dev/PATH;downloadfilenam=
e=3DPATH</a>&quot;<br>
&gt; &gt; BB_HASHSERVE_UPSTREAM =3D &quot;<a href=3D"http://typhoon.yocto.i=
o:8687" rel=3D"noreferrer noreferrer" target=3D"_blank">typhoon.yocto.io:86=
87</a>&quot;<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve included an example image build below where it took 11 m=
inutes for a=C2=A0<br>
&gt; &gt; core-image-minimal image build. Obviously this is only of benefit=
 if you&#39;re<br>
&gt; &gt; building configurations that match the project autobuilder althou=
gh hash<br>
&gt; &gt; equivalence could be useful alone in reducing some build times.<b=
r>
&gt; <br>
&gt; What branches that support hash equivalence will be available other th=
an<br>
&gt; Master?<br>
<br>
The question doesn&#39;t make sense as hash equivalence doesn&#39;t have a =
&quot;branch&quot;.<br>
We&#39;re sharing any hash equivalence data generated from builds on the<br=
>
autobuilder.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">We should (?) backport the=C2=A0BB_HASHSERVE_UPSTREAM patch so =
that the instructions to enable it make sense on older branches though.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; &gt; I have updated the local.conf sample file in poky to match the ne=
w release.<br>
&gt; &gt; We&#39;re not widely highlighting that information as yet as it r=
emains to be seen<br>
&gt; &gt; how well it scales and what the hosting impacts for it will look =
like but it is<br>
&gt; &gt; there to experiment with to a wider audience such as this list.<b=
r>
&gt; <br>
&gt; The should improve the out-of-the-box experience.<br>
<br>
Ultimately that is the hope.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--0000000000001ee35d05cbce785e--
