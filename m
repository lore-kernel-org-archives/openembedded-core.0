Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.44235.1597673733136238432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 07:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IHqwKDf0;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id cq28so12394777edb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AUDEvvVGlOze4h05vyO7111WBdwziW4O3xyW1ZiUR2w=;
        b=IHqwKDf0aqg8coC/OL3O3bS4QfDcNe5JSofKBfSubkHMNwSCnm/m9IGXpf5tJYQYFX
         4j8sb/FUsId+mmwh91/HLDvSOWcADaBy7uU1uWobPIwyzYFs07e/qgSlCogIEAnHWhSa
         tK78cQrrQ9FqJ523NeDEDgwmDYRVwa0g85xWr93gQ7hVHXwCB/5ckMIynGk3nhgFjLsJ
         Czy7zXI5dBDvtRnuPMhSwx+Vt1DoCajeyvaav7eY5K7o/M+v0MTK+OCR6Ve6x3oknat+
         nnLCGXPDOnaC8Oy0aXFq2tzhIKEWLRDPC5uo75ikzOr31FnMuOzTPX9bGTqQSa0kBYKR
         y2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AUDEvvVGlOze4h05vyO7111WBdwziW4O3xyW1ZiUR2w=;
        b=ZTIiJ2KabaXrH1LxlPIsG1TRN8odUQAOZpMbfqSCSOYlATlZj6GQ2+sQw143pwW0IA
         +x1vtygDB9vbR+0iQ+sBFs07V4DgF/2+/gY7AbJhgmx7c/AH+y1C2+15pQRlpxP+5rIu
         sis+4Pq2yzb/472TaZtDpWZ2L2b3Khfp3jdTOwDWchsG/eaH+eYH6o1/6uo0cGAc/f5m
         Xpp75YMY4K9e1fJUCjJdGYf4gw/9hItD3N22JVeRJRr158bCT4fPlfiivqld4cJexG+H
         Q1hHo0nmIYTrYAiaeMkSJQr9aOMuIDI9PmW2B4WL00wCH9ImZnAUKam5Pl+DVQTNkrP3
         WVOw==
X-Gm-Message-State: AOAM532EaFjV/k7Jk7Xan0sz0b908fFb5kh309vbby9a9+iI3Y9g2kaN
	dbjZnqNe1uEWluKv91X2j3jBMBkoh+WWNu9IiAo=
X-Google-Smtp-Source: ABdhPJxa1YJCQt9aH9dti314IliRMWus+k0ziyZ7uOQ9AcxW+xu5bt24f10cx+Gxv4Xi+mldYpZupEGibZJW4dvKMeU=
X-Received: by 2002:aa7:c383:: with SMTP id k3mr14728701edq.164.1597673731655;
 Mon, 17 Aug 2020 07:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
 <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com> <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
In-Reply-To: <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 17 Aug 2020 10:15:20 -0400
Message-ID: <CADkTA4PFf_PsFLg4nbZ9csO0zvE_pfh_h-LgRwn1RJJmS-5kQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003e0c9305ad136761"

--0000000000003e0c9305ad136761
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 17, 2020 at 8:27 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
> >
> >
> > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > > > Bruce,
> > > >
> > > > We need
> > > >
> > >
> https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > > > backported to 5.4 kernels for perf to build with -fno-common can
> > > you
> > > > queue this in your kernel updates as soon as you can ?
> > >
> > > I think we have other active kernels which will also need it as
> > > even
> > > with Khem's patch we still see failures:
> > >
> >
> > I've taken care of linux-yocto now, I don't think there are any
> > active use cases for those kernels that won't be covered.
>
> I bumped the meta-yocto BSPs with a quickly hacked up patch but we
> still see:
>
>
I have local bumps for the yocto-bsps as well, let me try a perf build
against beaglebone to see if I can see anything.

If I build master-next, will I get all the required gcc patches to trigger
the issue ?

Bruce



> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
>
> so I think there may be another patch we need somewhere...
>
> (which matches what we saw with Khem's _append which also failed).
>
> There is still some piece of this we're missing, maybe on non-IA.
>
> Cheers,
>
> Richard
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003e0c9305ad136761
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 17, 2020 at 8:27 AM Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; Bruce,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; We need <br>
&gt; &gt; &gt; <br>
&gt; &gt; <a href=3D"https://github.com/torvalds/linux/commit/168200b6d6ea0=
cb5765943ec5da5b8149701f36a" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a</a=
><br>
&gt; &gt; &gt; backported to 5.4 kernels for perf to build with -fno-common=
 can<br>
&gt; &gt; you<br>
&gt; &gt; &gt; queue this in your kernel updates as soon as you can ?<br>
&gt; &gt; <br>
&gt; &gt; I think we have other active kernels which will also need it as<b=
r>
&gt; &gt; even<br>
&gt; &gt; with Khem&#39;s patch we still see failures:<br>
&gt; &gt; <br>
&gt; <br>
&gt; I&#39;ve taken care of linux-yocto now, I don&#39;t think there are an=
y<br>
&gt; active use cases for those kernels that won&#39;t be covered.<br>
<br>
I bumped the meta-yocto BSPs with a quickly hacked up patch but we<br>
still see:<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I have local bumps for the yocto-bsps as well, let me try =
a perf build against beaglebone to see if I can see anything.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">If I build master-next, will I get all=
 the required gcc patches to trigger the issue ?</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/2339" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/65/builds/2339</a><br>
<br>
so I think there may be another patch we need somewhere...<br>
<br>
(which matches what we saw with Khem&#39;s _append which also failed).<br>
<br>
There is still some piece of this we&#39;re missing, maybe on non-IA.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000003e0c9305ad136761--
