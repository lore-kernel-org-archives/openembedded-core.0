Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.7415.1605200521138462883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=iR1NWXiT;
 spf=pass (domain: blade-group.com, ip: 209.85.167.178, mailfrom: yann.dirson@blade-group.com)
Received: by mail-oi1-f178.google.com with SMTP id m17so7155470oie.4
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SOlfEtVM5ORmpkw3rs1EW2v1YxCbeH7eQjGWk919vJA=;
        b=iR1NWXiTMLcCnvE1s+sgt2Eh1tZBNS0Jb7FTZjQPG7YslSSBE3jwjdhmXEHMVUNRH3
         7CTTpyHkWc4RbDYMkS0E0OL7yC8ngVMbGhSbPcCvIQ/E5Mjo34pUajvdi6sVOI2JnD1d
         mfvPmwYs9bV/g2YksFfyASd0+hcpgYwHmHNyPsNpngpVeB2JnxY0gWSMNTiZzQ+aHQt2
         lUFiLEHvin2Nz5LrE97mkXFkCH9EkxONxtuKYA2UQNTDW30f7o0GpeZUEjh0pEsfbW5p
         CSrjWO1Rkig5zZ7l8G0s40Hhc222vFGjwfxE13FVYwVRsBXO3Q3HqUggldB77UQ1eFES
         HMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SOlfEtVM5ORmpkw3rs1EW2v1YxCbeH7eQjGWk919vJA=;
        b=tUOnyUujWvIvelvKQwcWKp64fqce3YAal/I412Z9cBz8gkZMxcfZDEoJQVDRM7Ls0r
         ozJbS1EL/O+J+6H98gAZtkCorfHN7yRmVNLUnigBtLIU2nCOcU8WOhJjxkP/Bieauqow
         o8ZTzHMgmJcTU9czDmYuOX1X61RihbVv5zVgE1MgBtnAiS2kMSLtHfi8nJBZVQ7Z2bS5
         H5ObmVtlQFX9WEJu6cC7Jgn2B0Ttm1nw7X+6aCdLuV2vlkHMfKhb9yBvqrWPr2cFNSdj
         hWtpOmDr0hJj9NgA3VVxIj0rv4LOyMD0sNu746lAkKbcELmOabDaDwLqA9YBEbXoDmrC
         OqXw==
X-Gm-Message-State: AOAM530S1M2WIbGSaRso28TMWMHkh5jtNtDUpCFfZpcHJT6dsc99ab8l
	OCDMWiSTrcqZ2wxjs0dvpnd4a+1vv5jPe/54hJriGA==
X-Google-Smtp-Source: ABdhPJwlRJAd/E984sid7acNatfgqYcbXss/BQDR4opjGgDo5C01Ua5P4PZPuDBy9ewe2Ud7HWT8yRvXZiPJEn9YA9Y=
X-Received: by 2002:aca:420a:: with SMTP id p10mr381654oia.117.1605200520373;
 Thu, 12 Nov 2020 09:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20200921141544.3145189-1-yann@blade-group.com>
 <20200921141544.3145189-9-yann@blade-group.com> <1c41fc0d0f0928baeacb628812cafd66de745b75.camel@linuxfoundation.org>
 <CA+4=imb9n8r-taOxj68JagEVJkisUFk3vHVbKOru8Td24kLHdg@mail.gmail.com>
 <581392d58d402cf3b79f8bd36f8d5d5f7fa4c1bd.camel@linuxfoundation.org> <CADkTA4M4nAke3L=GPseCHGT=rmqVnKbNWGd8QEyzz_saeKt3pQ@mail.gmail.com>
In-Reply-To: <CADkTA4M4nAke3L=GPseCHGT=rmqVnKbNWGd8QEyzz_saeKt3pQ@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Thu, 12 Nov 2020 18:01:48 +0100
Message-ID: <CA+4=imbn07uhvLje-M_U1x4yPA57sTFPa3L0YLnhhfPV_skrqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] New systemtap.bb class, and systemtap-demo.bb to illustrate it.
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000cf943105b3ebde05"

--000000000000cf943105b3ebde05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 22 sept. 2020 =C3=A0 02:41, Bruce Ashfield <bruce.ashfield@gmail.co=
m> a
=C3=A9crit :

> On Mon, Sep 21, 2020 at 6:51 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2020-09-21 at 23:23 +0200, Yann Dirson wrote:
> > >
> > >
> > > Le lun. 21 sept. 2020 =C3=A0 21:46, Richard Purdie <
> > > richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > > > On Mon, 2020-09-21 at 16:15 +0200, Yann Dirson wrote:
> > > > > From: Yann Dirson <yann@blade-group.com>
> > > > >
> > > > > ---
> > > > >  meta/classes/systemtap.bbclass                | 74
> > > > +++++++++++++++++++
> > > > >  .../systemtap/systemtap-demo_git.bb           | 71
> > > > ++++++++++++++++++
> > > > >  2 files changed, 145 insertions(+)
> > > > >  create mode 100644 meta/classes/systemtap.bbclass
> > > > >  create mode 100644 meta/recipes-kernel/systemtap/systemtap-
> > > > demo_git.bb
> > > >
> > > > I'm afraid this patch is going to throw warnings all over the
> > > > autobuilder, e.g.:
> > > >
> > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2488
> > > >
> > > > (and there will be more).
> > > >
> > > > We are trying to ensure all warnings are solved so that any that d=
o
> > > > show are real issues and this patch would significantly distract
> > > > from
> > > > that.
> > >
> > > OK, we could default to built just the handful of probes that should
> > > always build, and give instructions for those willing to use the
> > > current behaviour.
> >
> > I think that is going to be safer and we could grow into more examples
> > if/as/when we van build them.
>
> Also, as the person that usually picks up systemtap breakage first
> on our new kernel versions .. we need to make sure that the reworked
> recipe and class pass the oe-selftest for stap.
>

AFAICT, if we exclude this last patch, the only impact on tests is that
those
testing modules with crosstap (which I only learnt about when looking for
those tests)
and pulling the full systemtap package should be changed to pull
systemtap-runtime
instead.

Now adding tests for the modules built with systemtap.class is a different
thing.

It is doing on target compilation, so ideally, that test should be expande=
d
> to test bot the cross and on-target variants.
>

The on-target compilation is already tested by
meta/lib/oeqa/runtime/cases/stap.py,
and there are crosstap tests in
meta/lib/oeqa/selftest/cases/runtime_test.py.

I have started to look at adding a test for modules cross-built by
systemtap.bbclass,
but as it takes ages to run those tests it seems it would make sense to
move this last
patch into a series of its own.



>
> Cheers,
>
> Bruce
>
> >
> > >
> > > > I'm also wary that we're now in feature freeze for release so
> > > > perhaps
> > > > these changes should wait until 3.3?
> > >
> > > OK, I can reroll a series with just the fixes.
> >
> > That would be great.
> >
> > > For the rest should I just wait for the gatesgarth branch to be
> > > created and resubmit then ?
> >
> > Once we start taking new work on master, yes.
> >
> > Also, for a new recipe like this we need a maintainers entry, else we
> > see:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1377
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >=20
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000cf943105b3ebde05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 22 sept. 2020 =C3=A0=C2=
=A002:41, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">b=
ruce.ashfield@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Mon, Sep 21, 2020 at 6:51 PM Richard=
 Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 2020-09-21 at 23:23 +0200, Yann Dirson wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Le lun. 21 sept. 2020 =C3=A0 21:46, Richard Purdie &lt;<br>
&gt; &gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"=
_blank">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit :<br>
&gt; &gt; &gt; On Mon, 2020-09-21 at 16:15 +0200, Yann Dirson wrote:<br>
&gt; &gt; &gt; &gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-gro=
up.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/classes/systemtap.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 74<br>
&gt; &gt; &gt; +++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 .../systemtap/<a href=3D"http://systemtap-demo_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">systemtap-demo_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 71<br>
&gt; &gt; &gt; ++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 2 files changed, 145 insertions(+)<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta/classes/systemtap.bbclas=
s<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-kernel/systemtap=
/systemtap-<br>
&gt; &gt; &gt; <a href=3D"http://demo_git.bb" rel=3D"noreferrer" target=3D=
"_blank">demo_git.bb</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m afraid this patch is going to throw warnings all ov=
er the<br>
&gt; &gt; &gt; autobuilder, e.g.:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/b=
uilders/40/builds/2488" rel=3D"noreferrer" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/typhoon/#/builders/40/builds/2488</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; (and there will be more).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We are trying to ensure all warnings are solved so that any=
 that do<br>
&gt; &gt; &gt; show are real issues and this patch would significantly dis=
tract<br>
&gt; &gt; &gt; from<br>
&gt; &gt; &gt; that.<br>
&gt; &gt;<br>
&gt; &gt; OK, we could default to built just the handful of probes that sh=
ould<br>
&gt; &gt; always build, and give instructions for those willing to use the=
<br>
&gt; &gt; current behaviour.<br>
&gt;<br>
&gt; I think that is going to be safer and we could grow into more example=
s<br>
&gt; if/as/when we van build them.<br>
<br>
Also, as the person that usually picks up systemtap breakage first<br>
on our new kernel versions .. we need to make sure that the reworked<br>
recipe and class pass the oe-selftest for stap.<br></blockquote><div><br><=
/div><div>AFAICT, if we exclude this last patch, the only impact on tests i=
s that those</div><div>testing modules with crosstap (which I only learnt a=
bout when looking for those tests)</div><div>and pulling the full systemtap=
 package should be changed to pull systemtap-runtime</div><div>instead.</di=
v><div><br></div><div>Now adding tests for the modules built with systemtap=
.class is a different thing.<br></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">

It is doing on target compilation, so ideally, that test should be expande=
d<br>
to test bot the cross and on-target variants.<br></blockquote><div><br></d=
iv><div>The on-target compilation is already tested by meta/lib/oeqa/runtim=
e/cases/stap.py,</div><div>and there are crosstap tests in meta/lib/oeqa/se=
lftest/cases/runtime_test.py.</div><div><br></div><div>I have started to lo=
ok at adding a test for modules cross-built by systemtap.bbclass,</div><div=
>but as it takes ages to run those tests it seems it would make sense to mo=
ve this last</div><div>patch into a series of its own.<br></div><div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; I&#39;m also wary that we&#39;re now in feature freeze for =
release so<br>
&gt; &gt; &gt; perhaps<br>
&gt; &gt; &gt; these changes should wait until 3.3?<br>
&gt; &gt;<br>
&gt; &gt; OK, I can reroll a series with just the fixes.<br>
&gt;<br>
&gt; That would be great.<br>
&gt;<br>
&gt; &gt; For the rest should I just wait for the gatesgarth branch to be<=
br>
&gt; &gt; created and resubmit then ?<br>
&gt;<br>
&gt; Once we start taking new work on master, yes.<br>
&gt;<br>
&gt; Also, for a new recipe like this we need a maintainers entry, else we=
<br>
&gt; see:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80=
/builds/1377" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/typhoon/#/builders/80/builds/1377</a><br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--000000000000cf943105b3ebde05--
