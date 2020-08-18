Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.69480.1597766644461329257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 09:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aFr+dipx;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id df16so15694244edb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LpbG/RbkfFYSqeveFpXSjelKtgJSHWJBiSX3Oe5JFas=;
        b=aFr+dipx7AeTSv4sAH/usjXBZccnWajCy4sAFo14lHQLerwCpri0Y9W2tKp92IE487
         rzyST45mj1qI3brsmwJ+y/iPIVsV/AB8iGIgtveliRkYfhf0chQ0d5JN0VrPSl4VHaaG
         /YZ6d5m1xaVwQl2zKsIRXxVqZgyyYR6liZMJrCpos9pdSxZUKNn/ykXgSn44kPv/k5Qk
         DpqROjpsnKBS20YLwIxvNcMcP4HNxjxqmALxsy3n2sc3c33KtQfJpKxz/m7kR4ABwbWQ
         lz9TfivY7da7tdObGFVlZiFdn7R1BFXoGYe1bQOK+RwA+q0WhylgP6qU2zkBmSILYPH9
         fmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LpbG/RbkfFYSqeveFpXSjelKtgJSHWJBiSX3Oe5JFas=;
        b=Xfi0SKudmIRXclCGaKtEkIvqgOQjcz1Jt6uik4XcU6QiocRCKGPdPXBQIIplnqEh2e
         O+Q31G5XwxZowfOR4jbeBA4aKB6MPRmZ0CyDHXmzm24QGW/K6S2ZxTsGMRH/Wlejy087
         CQ57xKUC1d/rjAF4O/yWFzILbd7P1hODnem7FFmvt0y31S5GunP3jH6p62M43jDwlOqN
         MeAvhoZnogqGSqeYMAe2jXdDqbFVUmbXWa+DepVUOi0MSkIqdJRlSn0WXCPJ31KQJ/cP
         /1PbKHJDsIUGyFtvUcDfNlPGhPFTMBkTNsqJrD0KpVmGzlZiHHS6yyfHjvzubNR6tFfL
         pS7w==
X-Gm-Message-State: AOAM532nO758OabEDCjaqvIPCvW9KyIbQm+sQ2Mi6hUlgtpUoBnzsL8q
	VSMTnhALtjGKlhsTQgEP0jxBBXC0aaGv/rr2sAU=
X-Google-Smtp-Source: ABdhPJxUdsKd+woZ9o1gpdiHieh5zxgSrN5K0nymo3qCmylTztcdQCt+ZFvA/qm6jTPRHJ4V4pqsNaRFxudPS82VJJ4=
X-Received: by 2002:a05:6402:899:: with SMTP id e25mr20240029edy.311.1597766642787;
 Tue, 18 Aug 2020 09:04:02 -0700 (PDT)
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
 <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com>
 <CA+chaQeE25GYJEv4z329B4XR5SgAAEgx+OptqszNQmQ-Lsvu2A@mail.gmail.com> <CADkTA4OREk8G=61vyufBT7vngCCc-iKSxJgMMDL-qg_GokE5ow@mail.gmail.com>
In-Reply-To: <CADkTA4OREk8G=61vyufBT7vngCCc-iKSxJgMMDL-qg_GokE5ow@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2020 18:03:51 +0200
Message-ID: <CA+chaQf5e3jtDD1BWR5=-79ms4+YaL90qx9Jn6FEB8FVeqNvyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002d6c0905ad29096e"

--0000000000002d6c0905ad29096e
Content-Type: text/plain; charset="UTF-8"

The perf issue with find and cflags concatenation is fixed in upstream by:
https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8

Adding V=1 to perf's EXTRA_OEMAKE makes it easier to see, sending a patch
now.

On Tue, Aug 18, 2020 at 2:21 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Tue, Aug 18, 2020 at 7:57 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Yes, I'm seeing this weird concatenation with raspberrypi builds as well:
>>
>> find: unknown predicate `-mthumb/arch'
>> arm-webos-linux-gnueabi-gcc: error: unrecognized command-line option
>> '-mthumb/include/uapi/asm-generic/errno.h'
>> arm-webos-linux-gnueabi-gcc: fatal error: no input files
>> compilation terminated.
>>
>
> confirmed as the same with my beaglebone build that ran overnight.
>
> I'll have a closer look and send a fix (hopefully) .. but if anyone else
> is already doing this, please let me know and I'll work on something else!
>
> Cheers,
>
> Bruce
>
>
>
>>
>> But in this case it isn't fatal for the perf build, I've noticed it only
>> because it was failing with 5.4.51 currently in meta-raspberrypi and after
>> upgrade to 5.4.58 perf built OK, but this error message is still there in
>> log.do_compile.
>>
>> On Mon, Aug 17, 2020 at 9:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>> >
>>> > On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
>>> > >
>>> > >
>>> > > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
>>> > > richard.purdie@linuxfoundation.org> wrote:
>>> > > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
>>> > > > > Bruce,
>>> > > > >
>>> > > > > We need
>>> > > > >
>>> > > >
>>> https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
>>> > > > > backported to 5.4 kernels for perf to build with -fno-common can
>>> > > > you
>>> > > > > queue this in your kernel updates as soon as you can ?
>>> > > >
>>> > > > I think we have other active kernels which will also need it as
>>> > > > even
>>> > > > with Khem's patch we still see failures:
>>> > > >
>>> > >
>>> > > I've taken care of linux-yocto now, I don't think there are any
>>> > > active use cases for those kernels that won't be covered.
>>> >
>>> > I bumped the meta-yocto BSPs with a quickly hacked up patch but we
>>> > still see:
>>> >
>>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
>>> >
>>> > so I think there may be another patch we need somewhere...
>>> >
>>> > (which matches what we saw with Khem's _append which also failed).
>>> >
>>>
>>> there seems to be concaternation of compiler options without space
>>>
>>> | arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
>>> '-mfpu=neon/include/uapi/asm-generic/errno.h'
>>> | arm-poky-linux-gnueabi-gcc: note: valid arguments to '-mfpu=' are:
>>> auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
>>> neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2
>>> vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4
>>> vfpv4-d16
>>> | arm-poky-linux-gnueabi-gcc: fatal error: no input files
>>>
>>> but it also showed up on x86_64 in one of your prior builds, so I
>>> wonder if its something in kernel build system or is it processing
>>> TUNE_CCARGS in special ways.
>>>
>>> > There is still some piece of this we're missing, maybe on non-IA.
>>> >
>>> > Cheers,
>>> >
>>> > Richard
>>> >
>>> 
>>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--0000000000002d6c0905ad29096e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The perf issue with find and cflags concatenation is fixed=
 in upstream by:<div><a href=3D"https://github.com/torvalds/linux/commit/e4=
ffd066ff440a57097e9140fa9e16ceef905de8">https://github.com/torvalds/linux/c=
ommit/e4ffd066ff440a57097e9140fa9e16ceef905de8</a><br></div><div><br></div>=
<div>Adding V=3D1 to perf&#39;s EXTRA_OEMAKE makes it easier to see, sendin=
g a patch now.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Aug 18, 2020 at 2:21 PM Bruce Ashfield &lt;<a h=
ref=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Aug 18, 2020 at 7:57 AM Martin Jansa &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">Yes, I&#39;m seeing this weird concatenation with raspberrypi bu=
ilds as well:<div><br></div><div>find: unknown predicate `-mthumb/arch&#39;=
<br>arm-webos-linux-gnueabi-gcc: error: unrecognized command-line option &#=
39;-mthumb/include/uapi/asm-generic/errno.h&#39;<br>arm-webos-linux-gnueabi=
-gcc: fatal error: no input files<br>compilation terminated.=C2=A0=C2=A0<br=
></div></div></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">confirmed as the same with my beaglebone build th=
at ran overnight.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;l=
l have a closer look and send a fix (hopefully) .. but if anyone else is al=
ready doing this, please let me know and I&#39;ll work on something else!</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><d=
iv><br></div><div>But in this case it isn&#39;t fatal for the perf build, I=
&#39;ve noticed it only because it was failing with 5.4.51 currently in met=
a-raspberrypi and after upgrade to 5.4.58 perf built OK, but this error mes=
sage is still there in log.do_compile.</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 17, 2020 at 9:47 PM=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>
</blockquote></div>

--0000000000002d6c0905ad29096e--
