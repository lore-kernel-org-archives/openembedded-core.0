Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3558C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:38:36 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.5020.1646383115262646662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AtHSO7J7;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id v22so10033374ljh.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhtFSSSw3LYuIfen4Zblca7PH/AaSaSXCjhfst7O5Vs=;
        b=AtHSO7J7uwTpH5RCwwyCbp4Zk1WiQeI6TLVJxn6r2VDz1jZ5VBISYBu1GGwp9OrLqx
         CV1bZIY9wJaz2Z4E/hbsC77XGHp8GUutEFdYIVlHlQ/TTygqSkD8XmgtS789UvPaCRbU
         76PfWPI06et2h68JrcpvLRJi+0q+7hFZQrEnhdf8qT/pPg7SDWXUiSFYAJh7hcWk/yNu
         j5psSGrkq8ye6FYdmksHgXfQilg6HrcmmbyuBvO7JRGZbpC3QsN3LOZsCDcfiqZRqIrm
         J86aoMlTDdO+JPZSjI62sx+5iUCRU8b/bLpy5SVwAQSoT0am0ZltU29FyW8VNR4PGt67
         SCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhtFSSSw3LYuIfen4Zblca7PH/AaSaSXCjhfst7O5Vs=;
        b=dgyRrp/pxc5VI79Hq9khm1E25OQXo9HcLvPpvOfF0GzKV35rUmkW6PRm88MNN3rzKI
         I1BK1ybkyukni5893IGecwRjCgFBfexbBIUPA8p+SftPLhVmWv/hKMBGyLXJrl0mqxgm
         BWCLCgqf3Tc6ZNf1xYH/Woh1NlqZSnVJ/E3pIOjORHIruOkL74tOTb3m//9ULA5cy1c7
         2plF7v9RAMQvq7Gf5dmdFHqGi85u/63CWJkK3OiLSQQSXEduRug1yS7d5D2pep353JLS
         m0ybB+4QE3YMeM+Wt+aVIJeCst7GncbKc0zxiYn8FdiLtKIhXV3ls3Gta8tXoBNLBDGH
         IDXw==
X-Gm-Message-State: AOAM531VBlJXk8igYugDGmF/04Pgt/GGylbWAQ3w00m7N1pNudtJfJ53
	wghnMbaDVXcMW/sI8TnBWIPsoPvm/XLCoY9UqjA=
X-Google-Smtp-Source: 
 ABdhPJxIVkFC+iQzmfJ4Za+Zm8kUFXZrwaAwz8VKvp1Lm+cduHZNas9YVODrpQHBGlIuf5gUKX64jXsSk0+ga04hYQU=
X-Received: by 2002:a2e:b90e:0:b0:239:3332:c83c with SMTP id
 b14-20020a2eb90e000000b002393332c83cmr24775090ljb.426.1646383113413; Fri, 04
 Mar 2022 00:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20220301041346.1703440-1-raj.khem@gmail.com>
 <3912ca5523901721837cd3200b9c685cd5561313.camel@linuxfoundation.org>
 <CAMKF1soDJbtUY1qrkGXjUw86XzNSF+4VD3fv=Kr8MuqXR7tjGA@mail.gmail.com>
 <df36f0c75a79adeda5d6f57297efaccb4fd54bda.camel@linuxfoundation.org>
In-Reply-To: 
 <df36f0c75a79adeda5d6f57297efaccb4fd54bda.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 4 Mar 2022 08:38:22 +0000
Message-ID: 
 <CANPvuRkrBr_sQBxK3foVsSD-GZ7JMTDOgPhUhU3HPx0sr4g0qQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libical: Pass TOOLCHAIN_OPTIONS via CFLAGS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a3aa4905d9607008"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 08:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162711

--000000000000a3aa4905d9607008
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
3/03/2022 =C3=A0(s) 23:15:

> On Thu, 2022-03-03 at 15:05 -0800, Khem Raj wrote:
> > On Thu, Mar 3, 2022 at 2:53 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2022-02-28 at 20:13 -0800, Khem Raj wrote:
> > > > This ensures that right sysroot is used during build, otherwise we
> see
> > > > warnings in build about using wrong sysroot and it fails explicitly
> with
> > > > clang
> > > >
> > > > x86_64-yoe-linux-ld: warning: library search path "/usr/lib/gcc/x86=
_6
> > > > 4-pc-linux-gnu/11.2.0/../../../../lib64" is unsafe for
> cross-compilation
> > > >
> > > > x86_64-yoe-linux-ld: cannot find /usr/lib/clang/14.0.0/lib/linux/li=
bc
> > > > lang_rt.builtins-x86_64.a: No such file or directory
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-support/libical/libical_3.0.14.bb | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-support/libical/libical_3.0.14.bb
> b/meta/recipes-support/libical/libical_3.0.14.bb
> > > > index 717eb11e125..879ad8ed595 100644
> > > > --- a/meta/recipes-support/libical/libical_3.0.14.bb
> > > > +++ b/meta/recipes-support/libical/libical_3.0.14.bb
> > > > @@ -18,6 +18,8 @@ UPSTREAM_CHECK_URI =3D "
> https://github.com/libical/libical/releases"
> > > >
> > > >  inherit cmake pkgconfig gobject-introspection vala
> > > >
> > > > +CFLAGS +=3D "${TOOLCHAIN_OPTIONS}"
> > > > +
> > > >  DEPENDS +=3D "libical-native"
> > > >
> > > >  PACKAGECONFIG ??=3D "icu glib"
> > >
> > >
> > > I gave this (and the cmake patch) a go and whilst it mostly worked, i=
t
> doesn't
> > > work on arm (qemuarm or beaglebone):
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/485=
5
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/3774
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/482=
9
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3715
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/482=
5
> > >
> > > Any ideas?
> >
> > I think we need to check why CC is being passed here from env
> > explicitly when invoking g-ir-scanner-wrapper, which is bare compiler
> > without TOOLCHAIN_OPTIONS and this cmd seems to not
> > respect CFLAGS
>

I will take a look in the weekend.

Jose


> >
> > > [95/112] cd
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-n=
eon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical
> > &&
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-n=
eon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot-native/usr/bin/cmak=
e
> > -E env
> "CC=3D'/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/corte=
xa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot-native/usr/b=
in/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc'"
> >
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-n=
eon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot/usr/bin/g-ir-scanne=
r-wrapper
> > --c-include=3Dlibical/ical.h --pkg-export libical
> > --identifier-prefix=3Dical
> >
> -I/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf=
-neon-poky-linux-gnueabi/libical/3.0.14-r0/libical-3.0.14/src/libical
> >
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-n=
eon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ical.h
> > --namespace=3DICal --nsversion=3D3.0 --no-libtool --library=3Dical
> > --include=3DGObject-2.0
> >
> -L/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf=
-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/lib
> > --output
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-n=
eon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ICal-3.0.gir
> > --accept-unprefixed
> >
> > I will take a look later today.
>
> Thanks, I'll be asleep shortly I hope! :)
>
> >
> > btw. is this the only failure left ?
> >
>
> For that patch in core, yes, I think so.
>
> Cheers,
>
> Richard
>
> >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a3aa4905d9607008
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 3/03/2022 =C3=A0(s) 23:15:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, 2022-03-03 at 15:05 -0800, K=
hem Raj wrote:<br>
&gt; On Thu, Mar 3, 2022 at 2:53 PM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Mon, 2022-02-28 at 20:13 -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; This ensures that right sysroot is used during build, otherw=
ise we see<br>
&gt; &gt; &gt; warnings in build about using wrong sysroot and it fails exp=
licitly with<br>
&gt; &gt; &gt; clang<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; x86_64-yoe-linux-ld: warning: library search path &quot;/usr=
/lib/gcc/x86_6<br>
&gt; &gt; &gt; 4-pc-linux-gnu/11.2.0/../../../../lib64&quot; is unsafe for =
cross-compilation<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; x86_64-yoe-linux-ld: cannot find /usr/lib/clang/14.0.0/lib/l=
inux/libc<br>
&gt; &gt; &gt; lang_rt.builtins-x86_64.a: No such file or directory<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-support/libical/<a href=3D"http://libical=
_3.0.14.bb" rel=3D"noreferrer" target=3D"_blank">libical_3.0.14.bb</a> | 2 =
++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/recipes-support/libical/<a href=3D"http://=
libical_3.0.14.bb" rel=3D"noreferrer" target=3D"_blank">libical_3.0.14.bb</=
a> b/meta/recipes-support/libical/<a href=3D"http://libical_3.0.14.bb" rel=
=3D"noreferrer" target=3D"_blank">libical_3.0.14.bb</a><br>
&gt; &gt; &gt; index 717eb11e125..879ad8ed595 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-support/libical/<a href=3D"http://libical=
_3.0.14.bb" rel=3D"noreferrer" target=3D"_blank">libical_3.0.14.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-support/libical/<a href=3D"http://libical=
_3.0.14.bb" rel=3D"noreferrer" target=3D"_blank">libical_3.0.14.bb</a><br>
&gt; &gt; &gt; @@ -18,6 +18,8 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"ht=
tps://github.com/libical/libical/releases" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/libical/libical/releases</a>&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 inherit cmake pkgconfig gobject-introspection vala<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; +CFLAGS +=3D &quot;${TOOLCHAIN_OPTIONS}&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 DEPENDS +=3D &quot;libical-native&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 PACKAGECONFIG ??=3D &quot;icu glib&quot;<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; I gave this (and the cmake patch) a go and whilst it mostly worke=
d, it doesn&#39;t<br>
&gt; &gt; work on arm (qemuarm or beaglebone):<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/65/builds/4855" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/65/builds/4855</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/106/builds/3774" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/106/builds/3774</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/53/builds/4829" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/53/builds/4829</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/110/builds/3715" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/typhoon/#/builders/110/builds/3715</a><br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/47/builds/4825" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/47/builds/4825</a><br>
&gt; &gt; <br>
&gt; &gt; Any ideas?<br>
&gt; <br>
&gt; I think we need to check why CC is being passed here from env<br>
&gt; explicitly when invoking g-ir-scanner-wrapper, which is bare compiler<=
br>
&gt; without TOOLCHAIN_OPTIONS and this cmd seems to not<br>
&gt; respect CFLAGS<br></blockquote><div><br></div><div>I will take a look =
in the weekend.</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; &gt; [95/112] cd /home/pokybuild/yocto-worker/beaglebone/build/build/t=
mp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libi=
cal<br>
&gt; &amp;&amp; /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wor=
k/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot-nativ=
e/usr/bin/cmake<br>
&gt; -E env &quot;CC=3D&#39;/home/pokybuild/yocto-worker/beaglebone/build/b=
uild/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-s=
ysroot-native/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc&#39=
;&quot;<br>
&gt; /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8h=
f-neon-poky-linux-gnueabi/libical/3.0.14-r0/recipe-sysroot/usr/bin/g-ir-sca=
nner-wrapper<br>
&gt; --c-include=3Dlibical/ical.h --pkg-export libical<br>
&gt; --identifier-prefix=3Dical<br>
&gt; -I/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa=
8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/libical-3.0.14/src/libical<br=
>
&gt; /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8h=
f-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ical.h<br>
&gt; --namespace=3DICal --nsversion=3D3.0 --no-libtool --library=3Dical<br>
&gt; --include=3DGObject-2.0<br>
&gt; -L/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa=
8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/lib<br>
&gt; --output /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/=
cortexa8hf-neon-poky-linux-gnueabi/libical/3.0.14-r0/build/src/libical/ICal=
-3.0.gir<br>
&gt; --accept-unprefixed<br>
&gt; <br>
&gt; I will take a look later today.<br>
<br>
Thanks, I&#39;ll be asleep shortly I hope! :)<br>
<br>
&gt; <br>
&gt; btw. is this the only failure left ?<br>
&gt; <br>
<br>
For that patch in core, yes, I think so.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000a3aa4905d9607008--

