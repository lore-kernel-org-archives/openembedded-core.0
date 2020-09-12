Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.27883.1599949485821262175
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 15:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=OMM1VAlP;
 spf=pass (domain: emacinc.com, ip: 209.85.167.193, mailfrom: mgloff@emacinc.com)
Received: by mail-oi1-f193.google.com with SMTP id i17so13427656oig.10
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SnwUnrrelS2bY3zdnl2dS2LhvS/+deiP2T90y0Lt2k0=;
        b=OMM1VAlPfu928ySXmYODX2hYZB8FrEgoZnnvBL2cAX/alGkky0oWbRGcusxDbU+3nt
         cLRZfo7xkDovJr3o43d959IQzbyql+cWgMgkyL/Ryd/DH0EePGr+fYmNzIK3clBtsj35
         6aMWVmwdV04dogvob+s6H2f2PlA2ljk/psPzSo/131DTG86a7jnCj9jHFaFlMmFOTL9b
         mCS1ClUUMZw4i479XWplxX/eZfzgvtvAnbDN429f9UXE0Xi9XaT55qrD+x/AXtqyV0rH
         +OZbP1MdO2VHVmGXBrQdrDzufaZLzhicV570k+WA04rrTn5dZDQ7MlF+8oqP1sVo2BR+
         iNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SnwUnrrelS2bY3zdnl2dS2LhvS/+deiP2T90y0Lt2k0=;
        b=C4UcQ4ypAN+l6uqMusb/C3UKh+dc6BHa3gLtYElAOymHfWNrcyAfzkT4PIHhc/tfG7
         zLTjgkBMdsGRsJuCw/+zdmnM1W/jbZ81DTGJtFJAErg4KcZejvXKlBJFFTQldHlBtam9
         GZ51TG8QZW+JuYLIHIzpPxyCH8Gf5ivHzxXGCxwNjP61ToqSPsiwUh+JFT6X2FeZ1xuS
         RobasyVbBYLTqLnGgjNybBVlFod3DgzxVg4U9RGCywgfRYsIKDdLGv5uJWSbct5rE+JZ
         2IJxdsp9ENlqWp1QwUrs53RfnxqdW/+K1tn0UknSD6360FDWJsMW078yksVW0kvy9P4J
         cNOA==
X-Gm-Message-State: AOAM5316GUD5kZ4Xoz+R1RmKUbyavPPbno6fYz6OhPPum7GL57iA/Ouy
	Xme0ZaPhbJYKr+G57U6Z4jW25+D58UaIiFoQG+z2eA==
X-Google-Smtp-Source: ABdhPJzM2NGiwYP3IOGMbhZe8FgPHE7pNFytYM3Z3ype65eHVJSofbvd6uIn/GRefmQO4i3r5uGTG/nyEmFHVVgv2j0=
X-Received: by 2002:aca:bec5:: with SMTP id o188mr4909207oif.21.1599949485164;
 Sat, 12 Sep 2020 15:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200912164811.978100-1-mgloff@emacinc.com> <84342cda07aa41fb6f03a1dda815c22e1609bd44.camel@linuxfoundation.org>
 <CALXw4G7G6MghUtVr+po2JQDKCvF5SZksd-_8NCjasGUuPSjRzw@mail.gmail.com> <CAJ86T=UnPaXyzXQNZ7j7nLYVSAMs-rhfkepksRZnzQh1qLAbRQ@mail.gmail.com>
In-Reply-To: <CAJ86T=UnPaXyzXQNZ7j7nLYVSAMs-rhfkepksRZnzQh1qLAbRQ@mail.gmail.com>
From: "Michael Gloff" <mgloff@emacinc.com>
Date: Sat, 12 Sep 2020 17:24:09 -0500
Message-ID: <CALXw4G6ff1Gii_sQDeG13dGRm5053SFO+8q=v602=bi=j96_9Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sysvinit: Remove ${B} assignment
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b8e08105af254406"

--000000000000b8e08105af254406
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 12, 2020 at 3:11 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Sat, Sep 12, 2020 at 12:46 PM Michael Gloff <mgloff@emacinc.com> wrote:
> >
> > On Sat, Sep 12, 2020 at 2:11 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Sat, 2020-09-12 at 11:48 -0500, Michael Gloff wrote:
> >> > In order for the VERSION variable to be set, the
> >> > top level Makefile should be used, which only
> >> > builds the code in /src anyway.
> >> >
> >> > Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> >> > ---
> >> >  meta/recipes-core/sysvinit/sysvinit_2.97.bb | 1 -
> >> >  1 file changed, 1 deletion(-)
> >> >
> >> > diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> >> > b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> >> > index 80ab9d70e7..98916f7f19 100644
> >> > --- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> >> > +++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> >> > @@ -24,7 +24,6 @@ SRC_URI =
> >> > "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
> >> >  SRC_URI[sha256sum] =
> >> > "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
> >> >
> >> >  S = "${WORKDIR}/sysvinit-${PV}"
> >> > -B = "${S}/src"
> >> >
> >> >  inherit update-alternatives features_check
> >> >  DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
> >>
> >> I don't understand what you're saying. Why do we need the VERSION
> >> variable to be set? Does sysvinit not support a separate build
> >> directory?
> >>
> >> Can you rewrite the commit message so that someone who hasn't looked at
> >> the code can understand what the problem is we're fixing, why its a
> >> problem and why this is the correct solution.
> >>
> >> Thanks!
> >>
> >> Richard
> >
> > This issue is seeing no version on boot up since the switch from 2.88:
> > INIT: version  booting
> > instead of:
> > INIT: version 2.96 booting
> > with this change.
> >
> > The VERSION variable that is used for all of the binaries of sysvinit is
> defined in the top level Makefile.
> >
> > VERSION=$(shell sed -rn '1s/.*[[:blank:]]\((.*)\)[[:blank:]].*/\1/p'
> doc/Changelog)
> >
> > I'm not sure about the separate build directory. Any tips?
> > Thanks,
>
> A separate build directory typically only applies for components which
> build with autotools, cmake, etc. For components such as this one
> which build with handwritten Makefiles the default is to build in the
> source directory.
>
> Anyway, the patch looks fine. Key point is that you want to run make
> in the top level source directory rather than the "src" subdirectory
> to ensure that variables set by the top level Makefile are correctly
> defined.
>
> Thanks Andre,
I kind of thought we couldn't do a separate build directory, but wanted to
try.
I'll amend the  commit message

> > Michael
> >
> > 
>

--000000000000b8e08105af254406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 12, 2020 at 3:11 PM Andre=
 McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On S=
at, Sep 12, 2020 at 12:46 PM Michael Gloff &lt;<a href=3D"mailto:mgloff@ema=
cinc.com" target=3D"_blank">mgloff@emacinc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, Sep 12, 2020 at 2:11 PM Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, 2020-09-12 at 11:48 -0500, Michael Gloff wrote:<br>
&gt;&gt; &gt; In order for the VERSION variable to be set, the<br>
&gt;&gt; &gt; top level Makefile should be used, which only<br>
&gt;&gt; &gt; builds the code in /src anyway.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Michael Gloff &lt;<a href=3D"mailto:mgloff@em=
acinc.com" target=3D"_blank">mgloff@emacinc.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_=
2.97.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a> | 1 -<br=
>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-core/sysvinit/<a href=3D"http://sy=
svinit_2.97.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><b=
r>
&gt;&gt; &gt; b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_2.97=
.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><br>
&gt;&gt; &gt; index 80ab9d70e7..98916f7f19 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_=
2.97.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_=
2.97.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><br>
&gt;&gt; &gt; @@ -24,7 +24,6 @@ SRC_URI =3D<br>
&gt;&gt; &gt; &quot;${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz =
\<br>
&gt;&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt;&gt; &gt; &quot;2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420e=
e8bdf25110&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/sysvinit-${PV}&quot;<br>
&gt;&gt; &gt; -B =3D &quot;${S}/src&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 inherit update-alternatives features_check<br>
&gt;&gt; &gt;=C2=A0 DEPENDS_append =3D &quot; update-rc.d-native base-pass=
wd virtual/crypt&quot;<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t understand what you&#39;re saying. Why do we need the=
 VERSION<br>
&gt;&gt; variable to be set? Does sysvinit not support a separate build<br=
>
&gt;&gt; directory?<br>
&gt;&gt;<br>
&gt;&gt; Can you rewrite the commit message so that someone who hasn&#39;t=
 looked at<br>
&gt;&gt; the code can understand what the problem is we&#39;re fixing, why=
 its a<br>
&gt;&gt; problem and why this is the correct solution.<br>
&gt;&gt;<br>
&gt;&gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;<br>
&gt; This issue is seeing no version on boot up since the switch from 2.88=
:<br>
&gt; INIT: version=C2=A0 booting<br>
&gt; instead of:<br>
&gt; INIT: version 2.96 booting<br>
&gt; with this change.<br>
&gt;<br>
&gt; The VERSION variable that is used for all of the binaries of sysvinit=
 is defined in the top level Makefile.<br>
&gt;<br>
&gt; VERSION=3D$(shell sed -rn &#39;1s/.*[[:blank:]]\((.*)\)[[:blank:]].*/=
\1/p&#39; doc/Changelog)<br>
&gt;<br>
&gt; I&#39;m not sure about the separate build directory. Any tips?<br>
&gt; Thanks,<br>
<br>
A separate build directory typically only applies for components which<br>
build with autotools, cmake, etc. For components such as this one<br>
which build with handwritten Makefiles the default is to build in the<br>
source directory.<br>
<br>
Anyway, the patch looks fine. Key point is that you want to run make<br>
in the top level source directory rather than the &quot;src&quot; subdirec=
tory<br>
to ensure that variables set by the top level Makefile are correctly<br>
defined.<br>
<br></blockquote><div>Thanks Andre, <br></div><div>I kind of thought we co=
uldn&#39;t do a separate build directory, but wanted to try.</div><div> I&#=
39;ll amend the=C2=A0 commit message <br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; Michael<br>
&gt;<br>
&gt; <br>
</blockquote></div></div>

--000000000000b8e08105af254406--
