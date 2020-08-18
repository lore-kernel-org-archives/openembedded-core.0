Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.64992.1597753309175421133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 05:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=htagiKsj;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id c16so21799436ejx.12
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=edfptoX6UndmNF/oStBjiRAPolUr++DfpL+bOJMUHKU=;
        b=htagiKsjE6LqDta7RANr+Q5XElh82JSHaBlHNWcjdtI3ofFEc06T9HQvzU8Gzuyh0H
         tOubUbJGVksIFkHBS7Ptgx7D+k4yH/Pt25/EJCfnPxSZsR9Pdn2dlKxGEMMmyNu5shdo
         LYpk4fg00IgAZtvxMjBSkmSepALzVIS5oGRMhrG5DPVi8Aw0ChanmXAi1Hj/KDnOvIx7
         vVyDrLye6N/bWWgyeuHYSEfyce+dExgtOWw1z6eosGgAdPHJNKXIwefXbWbfKpuogi6h
         fW3srXUAqUou2lmOshlo8j82hE43otPlFae+0h0uxux9LNDQwuAygzGC8HVpvQkAaXVz
         65ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=edfptoX6UndmNF/oStBjiRAPolUr++DfpL+bOJMUHKU=;
        b=oDFTLsaEfKcM1t5+R1uoKp1LHzdh5/nCyVYMMXZyPl6hrZ2mjN5zbwGFa7Nsj/LyFt
         lg4PmSbRULvv0LxSfQNlBngF2G4FT0YBnfvK+TsgeQUVefMfKdtEHWxYiq/5cAuqsKPQ
         LDN2U7Onzi1q4eXwjMOVSF8QOnIXkBOY2EUy82wo5vd4tt7ruSKFV6c2gPRNP5UMkLg1
         lVKokN/u4X3ByIxuaHqxy/hnwTlqcKuk/DlIkmlq06+OYn7Wt2kTHHZJJ1nw4rjKBXvq
         6jgdpWsyTlbNO5X1De7aruU4qk47qEy8WmIwV6knkOEV3B5B+yzsP2ZYSTcnPP+CQXzk
         cXqg==
X-Gm-Message-State: AOAM530CfCqSRZ8cm7vxBQJ73kfY6qPKBdemt0f+WLTESYCMU8PbBqts
	jZTX+wvePJ1D0tqTArdHaNPHALghJtfbOo7iQ9s=
X-Google-Smtp-Source: ABdhPJwIj7yTnnbWwohOx2Zz3PPz4cGjp4pVhm8FZZprt/ZQMJMxhaQZlVOIFxVfzrSFP5CBrdOK0SIPBSahRHb6Itc=
X-Received: by 2002:a17:906:bc52:: with SMTP id s18mr18583259ejv.298.1597753307497;
 Tue, 18 Aug 2020 05:21:47 -0700 (PDT)
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
 <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com> <CA+chaQeE25GYJEv4z329B4XR5SgAAEgx+OptqszNQmQ-Lsvu2A@mail.gmail.com>
In-Reply-To: <CA+chaQeE25GYJEv4z329B4XR5SgAAEgx+OptqszNQmQ-Lsvu2A@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 18 Aug 2020 08:21:35 -0400
Message-ID: <CADkTA4OREk8G=61vyufBT7vngCCc-iKSxJgMMDL-qg_GokE5ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005508bf05ad25eeff"

--0000000000005508bf05ad25eeff
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 7:57 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Yes, I'm seeing this weird concatenation with raspberrypi builds as well:
>
> find: unknown predicate `-mthumb/arch'
> arm-webos-linux-gnueabi-gcc: error: unrecognized command-line option
> '-mthumb/include/uapi/asm-generic/errno.h'
> arm-webos-linux-gnueabi-gcc: fatal error: no input files
> compilation terminated.
>

confirmed as the same with my beaglebone build that ran overnight.

I'll have a closer look and send a fix (hopefully) .. but if anyone else is
already doing this, please let me know and I'll work on something else!

Cheers,

Bruce



>
> But in this case it isn't fatal for the perf build, I've noticed it only
> because it was failing with 5.4.51 currently in meta-raspberrypi and after
> upgrade to 5.4.58 perf built OK, but this error message is still there in
> log.do_compile.
>
> On Mon, Aug 17, 2020 at 9:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
>> > >
>> > >
>> > > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
>> > > richard.purdie@linuxfoundation.org> wrote:
>> > > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
>> > > > > Bruce,
>> > > > >
>> > > > > We need
>> > > > >
>> > > >
>> https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
>> > > > > backported to 5.4 kernels for perf to build with -fno-common can
>> > > > you
>> > > > > queue this in your kernel updates as soon as you can ?
>> > > >
>> > > > I think we have other active kernels which will also need it as
>> > > > even
>> > > > with Khem's patch we still see failures:
>> > > >
>> > >
>> > > I've taken care of linux-yocto now, I don't think there are any
>> > > active use cases for those kernels that won't be covered.
>> >
>> > I bumped the meta-yocto BSPs with a quickly hacked up patch but we
>> > still see:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
>> >
>> > so I think there may be another patch we need somewhere...
>> >
>> > (which matches what we saw with Khem's _append which also failed).
>> >
>>
>> there seems to be concaternation of compiler options without space
>>
>> | arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
>> '-mfpu=neon/include/uapi/asm-generic/errno.h'
>> | arm-poky-linux-gnueabi-gcc: note: valid arguments to '-mfpu=' are:
>> auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
>> neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2
>> vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4
>> vfpv4-d16
>> | arm-poky-linux-gnueabi-gcc: fatal error: no input files
>>
>> but it also showed up on x86_64 in one of your prior builds, so I
>> wonder if its something in kernel build system or is it processing
>> TUNE_CCARGS in special ways.
>>
>> > There is still some piece of this we're missing, maybe on non-IA.
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> 
>>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000005508bf05ad25eeff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 18, 2020 at 7:57 AM Martin Jansa &lt;<a=
 href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr">Yes, I&#39;m seeing this weird concatenation with raspberrypi builds as=
 well:<div><br></div><div>find: unknown predicate `-mthumb/arch&#39;<br>arm=
-webos-linux-gnueabi-gcc: error: unrecognized command-line option &#39;-mth=
umb/include/uapi/asm-generic/errno.h&#39;<br>arm-webos-linux-gnueabi-gcc: f=
atal error: no input files<br>compilation terminated.=C2=A0=C2=A0<br></div>=
</div></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">confirmed as the same with my beaglebone build that r=
an overnight.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll ha=
ve a closer look and send a fix (hopefully) .. but if anyone else is alread=
y doing this, please let me know and I&#39;ll work on something else!</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=
=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>=
<br></div><div>But in this case it isn&#39;t fatal for the perf build, I&#3=
9;ve noticed it only because it was failing with 5.4.51 currently in meta-r=
aspberrypi and after upgrade to 5.4.58 perf built OK, but this error messag=
e is still there in log.do_compile.</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 17, 2020 at 9:47 PM Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--0000000000005508bf05ad25eeff--
