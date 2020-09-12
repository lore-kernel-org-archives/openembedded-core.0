Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web10.24679.1599940007602310390
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 12:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=WrgeTtAk;
 spf=pass (domain: emacinc.com, ip: 209.85.167.194, mailfrom: mgloff@emacinc.com)
Received: by mail-oi1-f194.google.com with SMTP id a3so13210944oib.4
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+oOLuIeAZLBzI8/Lwl/Yq6UyS8OXJ5XGY2nuXcTZ6M=;
        b=WrgeTtAk/9uG6bUdBA5W7GWeCSTUIgKG12phSfZlCEknjrzNvUNqKDyjj7/E8UpE/U
         vPAycD+5Gkj2Mup6klUzft3tWHYM+CRN49kgCPoUQpLaNwnK4ANA7QOegcbH5rCP+D+Q
         /pOdb+YE9+kgHfClWZ8MNptXMM5Sx2hF5szfQlDWFB3mWkM+VI3EAtXoiFjIKr2xbYhg
         8eRj4YTbd2AdLukYLK75X74nq2Kqn17cvldGgPLD7Nl0qzVUIIiG1LzlxFinbPs6Lbko
         vjrUW9WDAX347QZ106TRxeLj9o1ky/ANizXE7HObjKixnOKTl1p88u2YTgaSOYlXFVWg
         JuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+oOLuIeAZLBzI8/Lwl/Yq6UyS8OXJ5XGY2nuXcTZ6M=;
        b=gMPtZdsk7IrW5X2w8RhprTaFnDKNHNzn6rN2Tko2v6wX293ODyXXpOUvxDTiUKrwoC
         aHBOzqGzAO1t7lU6n7iKVcSN8kn+XWyb/SHEG1CMr8lHGWtBbbzCwZgkLH2rYIKunPsX
         5m54riFHk4Y6n5a9SD69byrU1yguXnj0K+YFud/lAbNpXRcysFAhGwl5n5KUdJE7eu9y
         8cubFoQSH/hYvEqfTwhWKHUpfsRViyGPZArZFjoWYWmn2n+aonNnEuoX7Sb87LyejYbx
         6vJjNxqz0xyW8UBMahoPYKYDuUaVEyUDXo9pkbE3c2jM7aanQ5OWdeQeJcWwoK3MXC5H
         LP5w==
X-Gm-Message-State: AOAM531Enbk8JulWbhNwbgZ0418Ipi1t/28KwQs9aLr9cH/mqlHW/SGF
	SjLiw6GFqmIlh61E7It5TX1Bes0V1tltGLtxUabt/A==
X-Google-Smtp-Source: ABdhPJxcsL6nvvSkFBpIAeBtYmTi6MLuAYvi1SUBHBYCjj1IJvg2RqpJ+44RZ01s7Ifh2oWQ/+VPazuWSip7+leIghQ=
X-Received: by 2002:aca:bec5:: with SMTP id o188mr4682542oif.21.1599940006897;
 Sat, 12 Sep 2020 12:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200912164811.978100-1-mgloff@emacinc.com> <84342cda07aa41fb6f03a1dda815c22e1609bd44.camel@linuxfoundation.org>
In-Reply-To: <84342cda07aa41fb6f03a1dda815c22e1609bd44.camel@linuxfoundation.org>
From: "Michael Gloff" <mgloff@emacinc.com>
Date: Sat, 12 Sep 2020 14:46:10 -0500
Message-ID: <CALXw4G7G6MghUtVr+po2JQDKCvF5SZksd-_8NCjasGUuPSjRzw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sysvinit: Remove ${B} assignment
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c607c805af230f0e"

--000000000000c607c805af230f0e
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 12, 2020 at 2:11 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-09-12 at 11:48 -0500, Michael Gloff wrote:
> > In order for the VERSION variable to be set, the
> > top level Makefile should be used, which only
> > builds the code in /src anyway.
> >
> > Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> > ---
> >  meta/recipes-core/sysvinit/sysvinit_2.97.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> > b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> > index 80ab9d70e7..98916f7f19 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> > +++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> > @@ -24,7 +24,6 @@ SRC_URI =
> > "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
> >  SRC_URI[sha256sum] =
> > "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
> >
> >  S = "${WORKDIR}/sysvinit-${PV}"
> > -B = "${S}/src"
> >
> >  inherit update-alternatives features_check
> >  DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
>
> I don't understand what you're saying. Why do we need the VERSION
> variable to be set? Does sysvinit not support a separate build
> directory?
>
> Can you rewrite the commit message so that someone who hasn't looked at
> the code can understand what the problem is we're fixing, why its a
> problem and why this is the correct solution.
>
> Thanks!
>
> Richard
>
This issue is seeing no version on boot up since the switch from 2.88:
INIT: version  booting
instead of:
INIT: version 2.96 booting
with this change.

The VERSION variable that is used for all of the binaries of sysvinit is
defined in the top level Makefile.

VERSION=$(shell sed -rn '1s/.*[[:blank:]]\((.*)\)[[:blank:]].*/\1/p'
doc/Changelog)

I'm not sure about the separate build directory. Any tips?
Thanks,

Michael

--000000000000c607c805af230f0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 12, 2020 at 2:11 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Sat, 2020-09-12 at 11:48 -0500, Michael Gloff=
 wrote:<br>
&gt; In order for the VERSION variable to be set, the<br>
&gt; top level Makefile should be used, which only<br>
&gt; builds the code in /src anyway.<br>
&gt; <br>
&gt; Signed-off-by: Michael Gloff &lt;<a href=3D"mailto:mgloff@emacinc.com"=
 target=3D"_blank">mgloff@emacinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_2.97.bb" r=
el=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a> | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_2.9=
7.bb" rel=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><br>
&gt; b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_2.97.bb" rel=
=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><br>
&gt; index 80ab9d70e7..98916f7f19 100644<br>
&gt; --- a/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_2.97.bb" r=
el=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><br>
&gt; +++ b/meta/recipes-core/sysvinit/<a href=3D"http://sysvinit_2.97.bb" r=
el=3D"noreferrer" target=3D"_blank">sysvinit_2.97.bb</a><br>
&gt; @@ -24,7 +24,6 @@ SRC_URI =3D<br>
&gt; &quot;${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &quot;2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/sysvinit-${PV}&quot;<br>
&gt; -B =3D &quot;${S}/src&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit update-alternatives features_check<br>
&gt;=C2=A0 DEPENDS_append =3D &quot; update-rc.d-native base-passwd virtual=
/crypt&quot;<br>
<br>
I don&#39;t understand what you&#39;re saying. Why do we need the VERSION<b=
r>
variable to be set? Does sysvinit not support a separate build<br>
directory?<br>
<br>
Can you rewrite the commit message so that someone who hasn&#39;t looked at=
<br>
the code can understand what the problem is we&#39;re fixing, why its a<br>
problem and why this is the correct solution.<br>
<br>
Thanks!<br>
<br>
Richard<br></blockquote><div>This issue is seeing no version on boot up sin=
ce the switch from 2.88:</div><div>INIT: version =C2=A0booting</div><div>in=
stead of:</div><div>INIT: version 2.96 booting</div><div>with this change.<=
br></div><div><br></div><div>The VERSION variable that is used for all of t=
he binaries of sysvinit is defined in the top level Makefile.</div><div><br=
></div><div>VERSION=3D$(shell sed -rn &#39;1s/.*[[:blank:]]\((.*)\)[[:blank=
:]].*/\1/p&#39; doc/Changelog)</div><div><br></div><div>I&#39;m not sure ab=
out the separate build directory. Any tips?<br></div><div>Thanks,</div><div=
><br></div><div>Michael<br></div><br></div></div>

--000000000000c607c805af230f0e--
