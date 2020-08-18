Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.64603.1597751858861862543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 04:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FfsjFXVY;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id c16so21708641ejx.12
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TSCUaZHiejFQMBn3XaPh4VoAAm/efV90WEIVAbrimpE=;
        b=FfsjFXVY3AGXNSprZUmmio+ulfqQX53dUu5RQA90/tDwTWO/Qn74zPSsD6gC5I61nq
         BZr/I5AUG/Hw6FEHCD4MWWDMHEFoU08wBSxnWVb17Vkq0K+DViboylEXZ57kV4FTg3vb
         U26kBR0npTtb5b2tKfMQrecbKAI2WyXd5qxeXNa6VaF+iXdEwjKxSpey/Y3KXrS/sjx8
         VbhSqg2kLr1iq9iXmnwI6qAlFtSb/7FWVp6mWsOEJP8e8dadCKiqSL7sqPEFUrjDvey0
         E5eux+pQ0wI+/0fgSlEdlT5Dxwm8+byQVWHpfKfEUbMszPOtX3+xBXIQHG7ziHklsSdv
         BBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TSCUaZHiejFQMBn3XaPh4VoAAm/efV90WEIVAbrimpE=;
        b=lRTV0Drb5AjW0hjNtxc722cHS45DsINJrz4dsDs3CWTtN4CJh+5gIdM1w5SifMdOIE
         9jP2aqXCF0YdoCE467ygqZDq/qapK1rmI+CPP5lRDgjMnFCngdmhi5yfvXWMiDq6maw1
         MdplCA4/J8z5DcDD9YyVfp1E7wpz3gCTvsC5/EZl4uk7w2AYUPy41tE7t0/F3E1sjjQo
         oz/6sQcSF3bSVHd1OgtWHBqsZyhyNiLcrMvti1fTTucvAHN/FUPaZfcj4ubj46fEO0dC
         3/unb4aOjHR8bkhv9l0i1MkrZmPdhKJCqYPPtDJd9/xw0KoLaOgeQ0q5QKIebaYkkA6G
         s6Dg==
X-Gm-Message-State: AOAM530d47nCKEo08+9pq6iWezWG0nCryomzQAcYnTwxOHCgd2ngoX5q
	l0fzNGxrT9XjJKMFPGonA9SJWFlUz9CA8VgsmC4=
X-Google-Smtp-Source: ABdhPJwI9/3e0HUHO69puQRakbYrEq/OnMwQEbzamGqnPqzlbl9tUvhKNc7+BgbsjFcafuuQ78doJD+FYUSVpYxdD3s=
X-Received: by 2002:a17:906:7391:: with SMTP id f17mr2430740ejl.392.1597751857155;
 Tue, 18 Aug 2020 04:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
 <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
 <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org> <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com>
In-Reply-To: <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2020 13:57:26 +0200
Message-ID: <CA+chaQeE25GYJEv4z329B4XR5SgAAEgx+OptqszNQmQ-Lsvu2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e2927b05ad2597bc"

--000000000000e2927b05ad2597bc
Content-Type: text/plain; charset="UTF-8"

Yes, I'm seeing this weird concatenation with raspberrypi builds as well:

find: unknown predicate `-mthumb/arch'
arm-webos-linux-gnueabi-gcc: error: unrecognized command-line option
'-mthumb/include/uapi/asm-generic/errno.h'
arm-webos-linux-gnueabi-gcc: fatal error: no input files
compilation terminated.

But in this case it isn't fatal for the perf build, I've noticed it only
because it was failing with 5.4.51 currently in meta-raspberrypi and after
upgrade to 5.4.58 perf built OK, but this error message is still there in
log.do_compile.

On Mon, Aug 17, 2020 at 9:47 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
> > >
> > >
> > > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > > > > Bruce,
> > > > >
> > > > > We need
> > > > >
> > > >
> https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > > > > backported to 5.4 kernels for perf to build with -fno-common can
> > > > you
> > > > > queue this in your kernel updates as soon as you can ?
> > > >
> > > > I think we have other active kernels which will also need it as
> > > > even
> > > > with Khem's patch we still see failures:
> > > >
> > >
> > > I've taken care of linux-yocto now, I don't think there are any
> > > active use cases for those kernels that won't be covered.
> >
> > I bumped the meta-yocto BSPs with a quickly hacked up patch but we
> > still see:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
> >
> > so I think there may be another patch we need somewhere...
> >
> > (which matches what we saw with Khem's _append which also failed).
> >
>
> there seems to be concaternation of compiler options without space
>
> | arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
> '-mfpu=neon/include/uapi/asm-generic/errno.h'
> | arm-poky-linux-gnueabi-gcc: note: valid arguments to '-mfpu=' are:
> auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
> neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2
> vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4
> vfpv4-d16
> | arm-poky-linux-gnueabi-gcc: fatal error: no input files
>
> but it also showed up on x86_64 in one of your prior builds, so I
> wonder if its something in kernel build system or is it processing
> TUNE_CCARGS in special ways.
>
> > There is still some piece of this we're missing, maybe on non-IA.
> >
> > Cheers,
> >
> > Richard
> >
> 
>

--000000000000e2927b05ad2597bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I&#39;m seeing this weird concatenation with raspberr=
ypi builds as well:<div><br></div><div>find: unknown predicate `-mthumb/arc=
h&#39;<br>arm-webos-linux-gnueabi-gcc: error: unrecognized command-line opt=
ion &#39;-mthumb/include/uapi/asm-generic/errno.h&#39;<br>arm-webos-linux-g=
nueabi-gcc: fatal error: no input files<br>compilation terminated.=C2=A0=C2=
=
=A0<br></div><div><br></div><div>But in this case it isn&#39;t fatal for t=
he perf build, I&#39;ve noticed it only because it was failing with 5.4.51 =
currently in meta-raspberrypi and after upgrade to 5.4.58 perf built OK, bu=
t this error message is still there in log.do_compile.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 17,=
 2020 at 9:47 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie &lt;<br>
&gt; &gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"=
_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; Bruce,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We need<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://github.com/torvalds/linux/commit/168200b=
6d6ea0cb5765943ec5da5b8149701f36a" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f=
36a</a><br>
&gt; &gt; &gt; &gt; backported to 5.4 kernels for perf to build with -fno-=
common can<br>
&gt; &gt; &gt; you<br>
&gt; &gt; &gt; &gt; queue this in your kernel updates as soon as you can ?=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think we have other active kernels which will also need i=
t as<br>
&gt; &gt; &gt; even<br>
&gt; &gt; &gt; with Khem&#39;s patch we still see failures:<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve taken care of linux-yocto now, I don&#39;t think there =
are any<br>
&gt; &gt; active use cases for those kernels that won&#39;t be covered.<br=
>
&gt;<br>
&gt; I bumped the meta-yocto BSPs with a quickly hacked up patch but we<br=
>
&gt; still see:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65=
/builds/2339" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/typhoon/#/builders/65/builds/2339</a><br>
&gt;<br>
&gt; so I think there may be another patch we need somewhere...<br>
&gt;<br>
&gt; (which matches what we saw with Khem&#39;s _append which also failed)=
.<br>
&gt;<br>
<br>
there seems to be concaternation of compiler options without space<br>
<br>
| arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option<br>
&#39;-mfpu=3Dneon/include/uapi/asm-generic/errno.h&#39;<br>
| arm-poky-linux-gnueabi-gcc: note: valid arguments to &#39;-mfpu=3D&#39; =
are:<br>
auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16<br>
neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2<br>
vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4<br>
vfpv4-d16<br>
| arm-poky-linux-gnueabi-gcc: fatal error: no input files<br>
<br>
but it also showed up on x86_64 in one of your prior builds, so I<br>
wonder if its something in kernel build system or is it processing<br>
TUNE_CCARGS in special ways.<br>
<br>
&gt; There is still some piece of this we&#39;re missing, maybe on non-IA.=
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000e2927b05ad2597bc--
