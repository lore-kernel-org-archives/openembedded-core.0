Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.194178.1598272245487595758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 05:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vAquqeJ6;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id l23so7843199edv.11
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sC3Yrh6TwFmXf2Wm4dVjH6cwJ2DXqfFaPnvxl2R7KNQ=;
        b=vAquqeJ6v9+IDwYmiN+un7X5aNzTL5/LHVrJU6t44KoEOADInV6nZ2oRG3n1uiafc1
         MRm/oOT7zQ+c8WGEu28EWw7Tvu8pr1jrpoXf7QPEumrsik/KmOcccT5wUhIsh43DLTjw
         HY5K9DZsn1pXSm719Xfmei00noPl6gAPwBFJ0aAiKDFVMz4tvphvRuFh/wlFdCqa0pEu
         ptNr7nWNd8D9Q+vhNrBxO6ehO4xF7PjcLaXjpUF9xfvUolfpMLQvaJLztUwLnlI0YkQU
         9p58DURB9soloo+Hx1NDMrRg+sIlmMRV1BxQZB0NW5lye+y6AGyqcfZi3Upakxbq/kxQ
         Ix6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sC3Yrh6TwFmXf2Wm4dVjH6cwJ2DXqfFaPnvxl2R7KNQ=;
        b=IHHLZ4LAdMPcndooD/6x3UnU7HS9dDzTBOhtlH4yP4YfIimIh5CG5DctkSThFNg3e5
         CuNIY6/c75nt9orEdXjStSkIwBGuo2vFdlUHl4tgQFR3tM4+u81suJ/isVFyEhSCNyzS
         UT4Di4L4TZjbW7s2Xm0+7xX3u/awtAHxjwEEA8dN79y1cuA09LjRl5IxSE3pMTwcFiYU
         kBXI+TRFc1oAwWbnT7NsVWiYilV6eXk8YEDV284HBilhsZ7uTQ9r/QzWvYYVaDOZ1ERx
         9qedBXctJ2V2YPK9s1gaVSis48aQqzlii869b22VvV+KkdjFzzuLz9t7H7pyX3bg2Eq0
         LUeQ==
X-Gm-Message-State: AOAM532Bg8+SrM9H6ULFhd6w7QD2WoIcCSdU9kFUgv/W4V+omhGr5pD6
	Xx6MGCPhutZllrMZS67QNrPJgg0M0q31e3WQzog=
X-Google-Smtp-Source: ABdhPJyyC9NltQ8WUxLK8QIpXrI+W/02Tb881+Tjx6UfB42rk0+g0yLarg43x1EA0LpsCeJ7hh4RMAt8MpFw4IqWDgs=
X-Received: by 2002:a50:99cf:: with SMTP id n15mr4926880edb.352.1598272243818;
 Mon, 24 Aug 2020 05:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598036283.git.bruce.ashfield@gmail.com>
 <c9d0bb421a2f7c6783f2c2bbf47c95da5537985d.1598036283.git.bruce.ashfield@gmail.com>
 <CAMKF1sr-JshybsWtqUv9ACo873VoabioyzQipS8EFmeHB96XZA@mail.gmail.com>
 <4b7d45f691efa80b05f3405cbf716a2bce1c13d8.camel@intel.com>
 <CADkTA4NApf+0cxP21pQ=JykJbazGk1M-si6etrqPFvQ0oE6STw@mail.gmail.com> <227946a676d142f2a1d15ba3b8eaab85800212fc.camel@intel.com>
In-Reply-To: <227946a676d142f2a1d15ba3b8eaab85800212fc.camel@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 24 Aug 2020 08:30:32 -0400
Message-ID: <CADkTA4MRB93KVMwOe+1M4wPQEO7o3PxmLymHqTv1vZ_PFgVGEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto/5.8: update to v5.8.2
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000058e25705ad9ec1c4"

--00000000000058e25705ad9ec1c4
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 23, 2020 at 11:21 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Sun, 2020-08-23 at 23:03 -0400, Bruce Ashfield wrote:
> >
> >
> > On Sun, Aug 23, 2020 at 7:59 PM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > > On Sat, 2020-08-22 at 01:20 -0700, Khem Raj wrote:
> > > > Hi Bruce
> > > >
> > > > On rv64 I am seeing an error while building lttng
> > > >
> > > >  #error "LTTng-modules requires CONFIG_KPROBES on kernels >=
> > > 5.7.0"
> > > > >    20 | # error "LTTng-modules requires CONFIG_KPROBES on
> > > kernels
> > > > > >= 5.7.0"
> > > > >       |   ^~~~~
> > > >
> > > > I wonder if we need to update defconfig
> > >
> > > I see the same failure with linux-yocto-rt kernel as well.
> > >
> >
> > -rt doesn't enable kprobes, so yes, with the latest lttng, it would
> > trigger that issue.
> >
> > Traditionally -rt had issues with kprobes, but that is resolved now.
> > Rather than adding the overhead, the enablement is still on demand
> > for -rt.
> >
> > That being said, it looks like lttng has forced my hand, I just
> > enabled the config by default in -rt and don't see any issues.
> >
> > I'll send a patch on Monday to fix it up.
>
>
> Thanks Bruce. Should PREFERRRED_VERSION of linux-yocto-rt should also
> be explicitly set like that of linux-yocto? I was wondering if there is
> a specific reason why we don't set version for that kernel for qemu and
> BSPs?
>

It's a distro decision, but there's no reason why we couldn't set that
preferred version along with the standard kernel type.

The folks that use rt tend to know what they want, so it hasn't popped up
as a question in the past.

Since -rt lags the first iterations of any new reference kernel, setting
the preference to the known working version isn't a bad idea. At the moment
5.8-rt is a series of configuration changes, and not the -rt patch.

Cheers,

Bruce



>
> Thanks,
>
> Anuj
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000058e25705ad9ec1c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Aug 23, 2020 at 11:21 PM Mittal, Anuj &lt;<=
a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2020-0=
8-23 at 23:03 -0400, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, Aug 23, 2020 at 7:59 PM Mittal, Anuj &lt;<a href=3D"mailto:anu=
j.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Sat, 2020-08-22 at 01:20 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; Hi Bruce<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On rv64 I am seeing an error while building lttng<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 #error &quot;LTTng-modules requires CONFIG_KPROBES on =
kernels &gt;=3D<br>
&gt; &gt; 5.7.0&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 20 | # error &quot;LTTng-modules requires =
CONFIG_KPROBES on<br>
&gt; &gt; kernels<br>
&gt; &gt; &gt; &gt; &gt;=3D 5.7.0&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0^~~~~<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I wonder if we need to update defconfig<br>
&gt; &gt; <br>
&gt; &gt; I see the same failure with linux-yocto-rt kernel as well.<br>
&gt; &gt; <br>
&gt; <br>
&gt; -rt doesn&#39;t enable kprobes, so yes, with the latest lttng, it woul=
d<br>
&gt; trigger that issue.<br>
&gt; <br>
&gt; Traditionally -rt had issues with kprobes, but that is resolved now.<b=
r>
&gt; Rather than adding the overhead, the enablement is still on demand<br>
&gt; for -rt.<br>
&gt; <br>
&gt; That being said, it looks like lttng has forced my hand, I just<br>
&gt; enabled the config by default in -rt and don&#39;t see any issues. <br=
>
&gt; <br>
&gt; I&#39;ll send a patch on Monday to fix it up.<br>
<br>
<br>
Thanks Bruce. Should PREFERRRED_VERSION of linux-yocto-rt should also<br>
be explicitly set like that of linux-yocto? I was wondering if there is<br>
a specific reason why we don&#39;t set version for that kernel for qemu and=
<br>
BSPs?<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">It&#39;s a distro decision, but there&#39;s no reason=
 why we couldn&#39;t set that preferred version along with the standard ker=
nel type.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">The folks that =
use rt tend to know what they want, so it hasn&#39;t popped up as a questio=
n in the past.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Since -rt =
lags the first iterations of any new reference kernel, setting the preferen=
ce to the known working version isn&#39;t a bad idea. At the moment 5.8-rt =
is a series of configuration changes, and not the -rt patch.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce<br></div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
Anuj<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000058e25705ad9ec1c4--
