Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.194485.1598273484657031998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 05:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PRtYoxns;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id u21so11073832ejz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UDwHnhrbWeijFcW3AkmTtDPvD0EpBe7GRaPwSM4qKrc=;
        b=PRtYoxnsL9bHN3NJH9OpIS45Mr2OLgbJw8tEAcF8OuiRo+J7vVTvE64KPphLptNY8K
         bv5L/dD9GGyweaLO8+B4aAaIj8DhrHq4XqEXJVulE8fp93Heh42ec47NLVrfH00NP2nQ
         7Wv7Hyyk5Qyth0eK3ECEo8kr3pprGSrzXJnt75QY3rMslC8GFQBn1AKoNHyIrKlMxnz0
         GvlZF2rkRlgU/5F1oLsNDBzkMv0+kqgPWCUgT2SpyzCTmILvEiOMDWGbsv1KeIjeb0Hh
         oq+jb92p1hBko8skUAeeva8K8nJCcN0nPA17z2d2oc+BpH27S3dJs8KVoMul7fSqPELm
         Hipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UDwHnhrbWeijFcW3AkmTtDPvD0EpBe7GRaPwSM4qKrc=;
        b=s28hTkxBVARnFgq1eEOp3eC070cf6OOvdSVIX0QfhmPK1CN0qBmy49HLL+TYHnAtqj
         rPdFri1qpUFonYApSm8tNbQ1OUO8pvt9i4z24fHC43brcJOdb2QaDJ549sCMfXFU713t
         hjRFBp4MllKqIEvIQ8r67tbE+beIMzUKRLFKPM6aNH7R7abPvYIWa0jEzyZGXolS/Qc6
         aheguUeYq5hNPXXkHlzbNDc7AppfuLZIJV4mB5JNgPV2VMbwd1pEyUh+LyDZT6KP8fcJ
         Bc6Zk2yM8tc1CupUp8eGNQqfTtxTEL8C63h7ohHuyHE6CvTToQqQTlvoK9cafAPbwn4U
         QaEw==
X-Gm-Message-State: AOAM533Rp97X2TErk32cU2GAC7QqB0epSq9AiF6kw1bxFK7uRduMZzaN
	xUsTRRE2XaaqbuW7qVp3iCFqsi/BkEEPSGOQNdE=
X-Google-Smtp-Source: ABdhPJz17Qa77+FaS76WRXhPfi4hFrfLfrgcY++VXH4gteKozO5pV4rqoXY8E7NQ5Y0u2lI3ULzGsX8WRajrHxxXTUA=
X-Received: by 2002:a17:906:4810:: with SMTP id w16mr4705006ejq.298.1598273483045;
 Mon, 24 Aug 2020 05:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598036283.git.bruce.ashfield@gmail.com>
 <c9d0bb421a2f7c6783f2c2bbf47c95da5537985d.1598036283.git.bruce.ashfield@gmail.com>
 <CAMKF1sr-JshybsWtqUv9ACo873VoabioyzQipS8EFmeHB96XZA@mail.gmail.com>
 <4b7d45f691efa80b05f3405cbf716a2bce1c13d8.camel@intel.com>
 <CADkTA4NApf+0cxP21pQ=JykJbazGk1M-si6etrqPFvQ0oE6STw@mail.gmail.com>
 <227946a676d142f2a1d15ba3b8eaab85800212fc.camel@intel.com> <CAMKF1sqggjNMp6=F_BTF4tjgVgQV6XJ0RfFXaYyTmQYUBqpz=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqggjNMp6=F_BTF4tjgVgQV6XJ0RfFXaYyTmQYUBqpz=Q@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 24 Aug 2020 08:51:11 -0400
Message-ID: <CADkTA4P3e_zwkmsmaOaV60tUhngYPxoATbD_gN8UWHObxOECAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto/5.8: update to v5.8.2
To: Khem Raj <raj.khem@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000036001605ad9f0b15"

--00000000000036001605ad9f0b15
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 24, 2020 at 3:40 AM Khem Raj <raj.khem@gmail.com> wrote:

> Bruce
>
> Can you also backport
>
> https://github.com/torvalds/linux/commit/6bcaf41f9613278cd5897fc80ab93033bda8efaa
> to your 5.8 tree please ? this should help fixing selftests.
>
>
I double checked on my fresh upstream kernel trees and I see that it hasn't
been tagged for stable yet, so I went ahead and grabbed the patch.

I had to fixup a minor reject for 5.8, but I now have it under test here.

Bruce



> Thanks
> -Khem
>
> On Sun, Aug 23, 2020 at 8:21 PM Mittal, Anuj <anuj.mittal@intel.com>
> wrote:
> >
> > On Sun, 2020-08-23 at 23:03 -0400, Bruce Ashfield wrote:
> > >
> > >
> > > On Sun, Aug 23, 2020 at 7:59 PM Mittal, Anuj <anuj.mittal@intel.com>
> > > wrote:
> > > > On Sat, 2020-08-22 at 01:20 -0700, Khem Raj wrote:
> > > > > Hi Bruce
> > > > >
> > > > > On rv64 I am seeing an error while building lttng
> > > > >
> > > > >  #error "LTTng-modules requires CONFIG_KPROBES on kernels >=
> > > > 5.7.0"
> > > > > >    20 | # error "LTTng-modules requires CONFIG_KPROBES on
> > > > kernels
> > > > > > >= 5.7.0"
> > > > > >       |   ^~~~~
> > > > >
> > > > > I wonder if we need to update defconfig
> > > >
> > > > I see the same failure with linux-yocto-rt kernel as well.
> > > >
> > >
> > > -rt doesn't enable kprobes, so yes, with the latest lttng, it would
> > > trigger that issue.
> > >
> > > Traditionally -rt had issues with kprobes, but that is resolved now.
> > > Rather than adding the overhead, the enablement is still on demand
> > > for -rt.
> > >
> > > That being said, it looks like lttng has forced my hand, I just
> > > enabled the config by default in -rt and don't see any issues.
> > >
> > > I'll send a patch on Monday to fix it up.
> >
> >
> > Thanks Bruce. Should PREFERRRED_VERSION of linux-yocto-rt should also
> > be explicitly set like that of linux-yocto? I was wondering if there is
> > a specific reason why we don't set version for that kernel for qemu and
> > BSPs?
> >
> > Thanks,
> >
> > Anuj
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000036001605ad9f0b15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 24, 2020 at 3:40 AM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Bruce<br>
<br>
Can you also backport<br>
<a href=3D"https://github.com/torvalds/linux/commit/6bcaf41f9613278cd5897fc=
80ab93033bda8efaa" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
torvalds/linux/commit/6bcaf41f9613278cd5897fc80ab93033bda8efaa</a><br>
to your 5.8 tree please ? this should help fixing selftests.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I double checked on my fresh upstream kernel trees and I s=
ee that it hasn&#39;t been tagged for stable yet, so I went ahead and grabb=
ed the patch.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">I had to fi=
xup a minor reject for 5.8, but I now have it under test here.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
-Khem<br>
<br>
On Sun, Aug 23, 2020 at 8:21 PM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mit=
tal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, 2020-08-23 at 23:03 -0400, Bruce Ashfield wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Sun, Aug 23, 2020 at 7:59 PM Mittal, Anuj &lt;<a href=3D"mailt=
o:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br=
>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; On Sat, 2020-08-22 at 01:20 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; Hi Bruce<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On rv64 I am seeing an error while building lttng<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 #error &quot;LTTng-modules requires CONFIG_KPROBE=
S on kernels &gt;=3D<br>
&gt; &gt; &gt; 5.7.0&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 20 | # error &quot;LTTng-modules requ=
ires CONFIG_KPROBES on<br>
&gt; &gt; &gt; kernels<br>
&gt; &gt; &gt; &gt; &gt; &gt;=3D 5.7.0&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0^~~~~<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I wonder if we need to update defconfig<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I see the same failure with linux-yocto-rt kernel as well.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -rt doesn&#39;t enable kprobes, so yes, with the latest lttng, it=
 would<br>
&gt; &gt; trigger that issue.<br>
&gt; &gt;<br>
&gt; &gt; Traditionally -rt had issues with kprobes, but that is resolved n=
ow.<br>
&gt; &gt; Rather than adding the overhead, the enablement is still on deman=
d<br>
&gt; &gt; for -rt.<br>
&gt; &gt;<br>
&gt; &gt; That being said, it looks like lttng has forced my hand, I just<b=
r>
&gt; &gt; enabled the config by default in -rt and don&#39;t see any issues=
.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll send a patch on Monday to fix it up.<br>
&gt;<br>
&gt;<br>
&gt; Thanks Bruce. Should PREFERRRED_VERSION of linux-yocto-rt should also<=
br>
&gt; be explicitly set like that of linux-yocto? I was wondering if there i=
s<br>
&gt; a specific reason why we don&#39;t set version for that kernel for qem=
u and<br>
&gt; BSPs?<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Anuj<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000036001605ad9f0b15--
