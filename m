Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.52852.1597698479363724908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 14:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Clge99q2;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id m22so19479289eje.10
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=172auedtC7PPqHv2PO/NysbxOWOmdq04TpVXf0euEd8=;
        b=Clge99q2f1hStFF0G3IkMRgGpErlwfIad/Uv8WcfgYyvRaD6g/Sqfowy3gr6EHLUbP
         s9hbG05+nwA868rjegQk8FCBPTMgDjOvVQQizZq9mK09PW+hKX1BNHkis/Q4xI87SDo0
         kaDjbW+2NyVMd8lucSVI4yYZIt77V65/Zv/0GyNquNEUrMC/eY9VHx+3YnRvFXQKo/PR
         Co6jmtJNWWDHGPZJdx8LoiUmMwhbf9ULq4hi8IgzIi0xZivSTq/1v878sQ+hVz6KN7jD
         xbbrOMR5KSyhJcttEB7X8IwTEfYeVAqUA6jR01xfYATy7REqOIGyuMYUwtzHJIn+Qlsx
         eLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=172auedtC7PPqHv2PO/NysbxOWOmdq04TpVXf0euEd8=;
        b=EwG6h2NMs6IDp921yrwHeP6b/MYDWa8Bl32pG4rtQy/qXctFRmTu3SDbGoMoPSPaUH
         bFvDvxnepAbF+J4GIEFL7xhUO2jhbcZA9K2TfHxva7gNrloTAxfHVr6iOEoAFHwF8QqS
         awmP/Ty8A8OYjMwIITQgZHCgfqMQTrKWKriQKjsgPgWt0nKYAPQDwFoBOmFT8iGGWmx5
         SVcGiljAbEgS7ElGU+Yc2UGDrfCdDy9gyuKyBqMXXKT1nG0j/6Pr0uOd96fpWUvAMjbG
         4QdyQoaKuHP3lec40hjYi1vnQ+VSOfj1Gk3LeKgcJSdfe6xMck0G9sk2WXsfNvt/bQ5M
         4fHA==
X-Gm-Message-State: AOAM533UfDirE8BC9Dr8gKbpxk8NAV2fAUrwQiIK0fzsafTt2zjIuAmU
	6MetR70A3DWo0hJtr2fcmEyu7q1ZdGwyNGcXQco=
X-Google-Smtp-Source: ABdhPJwRPHpjF46qmSR+1B3Effm4mSWechPaJupxcZed3boaMnxBdmB4cxpS2QxPjR7WJMWUe4J7Y/1E5rSKdjN8dck=
X-Received: by 2002:a17:906:4a0d:: with SMTP id w13mr9631411eju.247.1597698477763;
 Mon, 17 Aug 2020 14:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
 <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
 <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
 <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com> <CAMKF1sp71Zc0_4fyUnZCuiE3E56mbv8J5Dp7bo7viNxTVafDTQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp71Zc0_4fyUnZCuiE3E56mbv8J5Dp7bo7viNxTVafDTQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 17 Aug 2020 17:07:46 -0400
Message-ID: <CADkTA4NVGFpdRve2G8xiisTZSc2j8wdntwTong8zZU67OAcWKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000039b00405ad192a02"

--00000000000039b00405ad192a02
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 17, 2020 at 3:55 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Aug 17, 2020 at 12:47 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
> > > >
> > > >
> > > > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
> > > > richard.purdie@linuxfoundation.org> wrote:
> > > > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > > > > > Bruce,
> > > > > >
> > > > > > We need
> > > > > >
> > > > >
> https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > > > > > backported to 5.4 kernels for perf to build with -fno-common can
> > > > > you
> > > > > > queue this in your kernel updates as soon as you can ?
> > > > >
> > > > > I think we have other active kernels which will also need it as
> > > > > even
> > > > > with Khem's patch we still see failures:
> > > > >
> > > >
> > > > I've taken care of linux-yocto now, I don't think there are any
> > > > active use cases for those kernels that won't be covered.
> > >
> > > I bumped the meta-yocto BSPs with a quickly hacked up patch but we
> > > still see:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
> > >
> > > so I think there may be another patch we need somewhere...
> > >
> > > (which matches what we saw with Khem's _append which also failed).
> > >
> >
> > there seems to be concaternation of compiler options without space
> >
> > | arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
> > '-mfpu=neon/include/uapi/asm-generic/errno.h'
> > | arm-poky-linux-gnueabi-gcc: note: valid arguments to '-mfpu=' are:
> > auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
> > neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2
> > vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4
> > vfpv4-d16
> > | arm-poky-linux-gnueabi-gcc: fatal error: no input files
> >
> > but it also showed up on x86_64 in one of your prior builds, so I
> > wonder if its something in kernel build system or is it processing
> > TUNE_CCARGS in special ways.
> >
> > > There is still some piece of this we're missing, maybe on non-IA.
> > >
>
> Perhaps these kernel backports might help
>
>
> https://github.com/torvalds/linux/commit/7597ce89b3ed239f7a3408b930d2a6c7a4c938a1
>
> https://github.com/torvalds/linux/commit/6d1f916265aa615218d341ba5d3fd39dfe931cde


I unfortunately had to clean and rebuild my development machine, so only
now started a reference h/w build to see what's up with perf.

I'll follow up tomorrow when I have some input.

Cheers,

Bruce



>
>
> > > Cheers,
> > >
> > > Richard
> > >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000039b00405ad192a02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Aug 17, 2020 at 3:55 PM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug 17, 2020 at 1=
2:47 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie &lt;<br>
&gt; &gt; &gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; Bruce,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; We need<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/torvalds/linux/commit/168=
200b6d6ea0cb5765943ec5da5b8149701f36a" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149=
701f36a</a><br>
&gt; &gt; &gt; &gt; &gt; backported to 5.4 kernels for perf to build with -=
fno-common can<br>
&gt; &gt; &gt; &gt; you<br>
&gt; &gt; &gt; &gt; &gt; queue this in your kernel updates as soon as you c=
an ?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I think we have other active kernels which will also ne=
ed it as<br>
&gt; &gt; &gt; &gt; even<br>
&gt; &gt; &gt; &gt; with Khem&#39;s patch we still see failures:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve taken care of linux-yocto now, I don&#39;t think th=
ere are any<br>
&gt; &gt; &gt; active use cases for those kernels that won&#39;t be covered=
.<br>
&gt; &gt;<br>
&gt; &gt; I bumped the meta-yocto BSPs with a quickly hacked up patch but w=
e<br>
&gt; &gt; still see:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/65/builds/2339" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/65/builds/2339</a><br>
&gt; &gt;<br>
&gt; &gt; so I think there may be another patch we need somewhere...<br>
&gt; &gt;<br>
&gt; &gt; (which matches what we saw with Khem&#39;s _append which also fai=
led).<br>
&gt; &gt;<br>
&gt;<br>
&gt; there seems to be concaternation of compiler options without space<br>
&gt;<br>
&gt; | arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option<b=
r>
&gt; &#39;-mfpu=3Dneon/include/uapi/asm-generic/errno.h&#39;<br>
&gt; | arm-poky-linux-gnueabi-gcc: note: valid arguments to &#39;-mfpu=3D&#=
39; are:<br>
&gt; auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16<br=
>
&gt; neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2<br>
&gt; vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4<b=
r>
&gt; vfpv4-d16<br>
&gt; | arm-poky-linux-gnueabi-gcc: fatal error: no input files<br>
&gt;<br>
&gt; but it also showed up on x86_64 in one of your prior builds, so I<br>
&gt; wonder if its something in kernel build system or is it processing<br>
&gt; TUNE_CCARGS in special ways.<br>
&gt;<br>
&gt; &gt; There is still some piece of this we&#39;re missing, maybe on non=
-IA.<br>
&gt; &gt;<br>
<br>
Perhaps these kernel backports might help<br>
<br>
<a href=3D"https://github.com/torvalds/linux/commit/7597ce89b3ed239f7a3408b=
930d2a6c7a4c938a1" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
torvalds/linux/commit/7597ce89b3ed239f7a3408b930d2a6c7a4c938a1</a><br>
<a href=3D"https://github.com/torvalds/linux/commit/6d1f916265aa615218d341b=
a5d3fd39dfe931cde" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
torvalds/linux/commit/6d1f916265aa615218d341ba5d3fd39dfe931cde</a></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I unfortunately had to clean and rebuild my development machine, so onl=
y now started a reference h/w build to see what&#39;s up with perf.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;ll follow up tomorrow wh=
en I have some input.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Che=
ers,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; &gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000039b00405ad192a02--
