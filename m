Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id BE432616EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 18:41:48 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id o2so1898500vka.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 10:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C6KPqWsrR7fo9yVn+pE9ytq+MBUAw+iRxu5ue7QC4xM=;
	b=d1jAaYRio+Ea5V6XmCrnBkkZQNUz+M/Cs3VQlPwNVCv1w9zinknZ2E+4Mp6C5pZnvK
	2LaSDj81VwRyC4/F8wpk5kqC9Ty4t0S/arT1BCqKjO/VFcK49+1h3wL0/2XP1EBDdrmP
	R4tkLlcHLGtz6OZEOUkGAljHKHaAKYakpoZGo5x/YJ2+o+5IPffBWs8yGSBNopmYWAAj
	WEsqh659tMB0nNv824yN+2PSb2DAocfYWMjvxeIJuUMkTL9fo29WxoJGjkHdwNc5mllY
	m4INxKfnEMUOsus2OYj+g3x5elgmOMor4yOTmurSt3/FZVPinnlIP+86V/eedhyhWPku
	W3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C6KPqWsrR7fo9yVn+pE9ytq+MBUAw+iRxu5ue7QC4xM=;
	b=axhqpy9A5FsHMnLhuGrKebsgTvmGf1O0PzGM4TUMxs1cp4gc5FJJZcYbAx4MpAhqvS
	70B5N8dy7KLRrMsW8iC5DyhVPbdLRRB4ksRULu8e79/yWNlVsoHcbNIY3uTdcUzQAoPc
	zYqGzbnSUzrAY4KxyCr2jVwFkayV+sPV5TfriBzXs+OoiA/tEl0tPNdCbvpc6VuHJ4/W
	anhfpxNcfhmvvK33VZm4CC2S8aGsWhZOZtl5tz7iO9MIaYg1pKEkswCwLKZTOEaUvGsN
	3RDoi4/CPjq665+GJ8dde21R+cLozQmXoqteMSUL3kFeCcW9nHUErHM6ngMc4oeBfe/2
	YWuQ==
X-Gm-Message-State: ANhLgQ3Ue/yvJ4o5DTx6+m331Pvnlit+pUJpelM1IKzQ1WLEo+Lf1fex
	HRmJUsvER1SvkOh09qgdb4temTFVuoq9dtlHg9E=
X-Google-Smtp-Source: ADFU+vvRloI2nsNAj8T3fccnRkJeAPxoYfyeRuZ7i2XwztdsbFEnsytuDCnOipspK9i/+7SZquGPxTVMuJ5f5Yr6pgE=
X-Received: by 2002:a05:6122:489:: with SMTP id o9mr321493vkn.9.1583433709261; 
	Thu, 05 Mar 2020 10:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20200304101307.31198-1-alex.kanavin@gmail.com>
	<e4bb4e709193acf371cf4c5afce4e6a8d1936a52.camel@andred.net>
	<CANNYZj_-om40Ejv2e8TpajUW=yhsedkyjPEJWi=BaY-qMvcw-Q@mail.gmail.com>
	<bb5bac4f73c97d4056aa89464fe97cd021c87f05.camel@andred.net>
In-Reply-To: <bb5bac4f73c97d4056aa89464fe97cd021c87f05.camel@andred.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Mar 2020 19:41:38 +0100
Message-ID: <CANNYZj-MnzgmHym6BSZ68hHmWQObijtt6bMmh_qadZEQHCQB7A@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: use 'make install' for installation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 18:41:49 -0000
Content-Type: multipart/alternative; boundary="000000000000c4185805a01fe36f"

--000000000000c4185805a01fe36f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe you could send a follow up patch then? I won=E2=80=99t get to it unti=
l
tomorrow.

Alex

On Thu 5. Mar 2020 at 17.56, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Thu, 2020-03-05 at 17:44 +0100, Alexander Kanavin wrote:
> > Right I think this should be easy to fix, we need to copy LICENSE.*
> manually. I'll get to it soon.
> >
>
> Keep in mind there's different spelling, and two more files :-)
> This works for me:
>
> +        cp -r GPL-2 LICENCE.* LICENSE.* WHENCE
> ${D}${nonarch_base_libdir}/firmware/
>
>
> Cheers,
> A.
>
> > Alex
> >
> > On Thu, 5 Mar 2020 at 17:20, Andr=C3=A9 Draszik <git@andred.net> wrote:
> > > On Wed, 2020-03-04 at 11:13 +0100, Alexander Kanavin wrote:
> > > > Copying the source tree over was missing important symlinks
> > > > that since recent updates can only be created with make install.
> > >
> > > Thanks for the quick fix Alex, but unfortunately now all the -license
> packages
> > > are non-existent and image creation fails, because their install:
> target
> > > doesn't copy the license files.
> > >
> > > Cheers,
> > > Andre'
> > >
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  .../linux-firmware/linux-firmware_20200122.bb | 22
> +------------------
> > > >  1 file changed, 1 insertion(+), 21 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux-firmware/
> linux-firmware_20200122.bb b/meta/recipes-kernel/linux-
> > > firmware/linux-
> > > > firmware_20200122.bb
> > > > index 0d1422cfca..f7198cb56a 100644
> > > > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> > > > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> > > > @@ -208,27 +208,7 @@ do_compile() {
> > > >  }
> > > >
> > > >  do_install() {
> > > > -     install -d  ${D}${nonarch_base_libdir}/firmware/
> > > > -     cp -r * ${D}${nonarch_base_libdir}/firmware/
> > > > -
> > > > -     # Avoid Makefile to be deployed
> > > > -     rm ${D}${nonarch_base_libdir}/firmware/Makefile
> > > > -
> > > > -     # Remove unbuild firmware which needs cmake and bash
> > > > -     rm ${D}${nonarch_base_libdir}/firmware/carl9170fw -rf
> > > > -
> > > > -     # Remove pointless bash script
> > > > -     rm ${D}${nonarch_base_libdir}/firmware/configure
> > > > -
> > > > -     # Remove python script used to check the WHENCE file
> > > > -     rm ${D}${nonarch_base_libdir}/firmware/check_whence.py
> > > > -
> > > > -     # Libertas sd8686
> > > > -     ln -sf libertas/sd8686_v9.bin
> ${D}${nonarch_base_libdir}/firmware/sd8686.bin
> > > > -     ln -sf libertas/sd8686_v9_helper.bin
> ${D}${nonarch_base_libdir}/firmware/sd8686_helper.bin
> > > > -
> > > > -     # fixup wl12xx location, after 2.6.37 the kernel searches a
> different location for it
> > > > -     ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
> ti-connectivity/* . )
> > > > +        oe_runmake 'DESTDIR=3D${D}' install
> > > >  }
> > > >
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
>
>

--000000000000c4185805a01fe36f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Maybe you could send a follow up patch then? I won=
=E2=80=99t get to it until tomorrow.</div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu 5. Mar 2020 at 17.56, Andr=C3=A9 Drasz=
ik &lt;<a href=3D"mailto:git@andred.net">git@andred.net</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Thu, 2020-03-05 at 17:44 +0100, Alex=
ander Kanavin wrote:<br>
&gt; Right I think this should be easy to fix, we need to copy LICENSE.* ma=
nually. I&#39;ll get to it soon.<br>
&gt; <br>
<br>
Keep in mind there&#39;s different spelling, and two more files :-)<br>
This works for me:<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r GPL-2 LICENCE.* LICENSE.* WHENCE ${D}${n=
onarch_base_libdir}/firmware/<br>
<br>
<br>
Cheers,<br>
A.<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Thu, 5 Mar 2020 at 17:20, Andr=C3=A9 Draszik &lt;<a href=3D"mailto:=
git@andred.net" target=3D"_blank">git@andred.net</a>&gt; wrote:<br>
&gt; &gt; On Wed, 2020-03-04 at 11:13 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; &gt; Copying the source tree over was missing important symlinks<=
br>
&gt; &gt; &gt; that since recent updates can only be created with make inst=
all.<br>
&gt; &gt; <br>
&gt; &gt; Thanks for the quick fix Alex, but unfortunately now all the -lic=
ense packages<br>
&gt; &gt; are non-existent and image creation fails, because their install:=
 target<br>
&gt; &gt; doesn&#39;t copy the license files.<br>
&gt; &gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; Andre&#39;<br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../linux-firmware/<a href=3D"http://linux-firmware_20=
200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200122.bb<=
/a> | 22 +------------------<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 21 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"h=
ttp://linux-firmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linu=
x-firmware_20200122.bb</a> b/meta/recipes-kernel/linux-<br>
&gt; &gt; firmware/linux-<br>
&gt; &gt; &gt; <a href=3D"http://firmware_20200122.bb" rel=3D"noreferrer" t=
arget=3D"_blank">firmware_20200122.bb</a><br>
&gt; &gt; &gt; index 0d1422cfca..f7198cb56a 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://l=
inux-firmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmw=
are_20200122.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://l=
inux-firmware_20200122.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmw=
are_20200122.bb</a><br>
&gt; &gt; &gt; @@ -208,27 +208,7 @@ do_compile() {<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 do_install() {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0install -d=C2=A0 ${D}${nonarch_base_lib=
dir}/firmware/<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0cp -r * ${D}${nonarch_base_libdir}/firm=
ware/<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Avoid Makefile to be deployed<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/=
Makefile<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Remove unbuild firmware which needs c=
make and bash<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/=
carl9170fw -rf<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Remove pointless bash script<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/=
configure<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Remove python script used to check th=
e WHENCE file<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0rm ${D}${nonarch_base_libdir}/firmware/=
check_whence.py<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0# Libertas sd8686<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0ln -sf libertas/sd8686_v9.bin ${D}${non=
arch_base_libdir}/firmware/sd8686.bin<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0ln -sf libertas/sd8686_v9_helper.bin ${=
D}${nonarch_base_libdir}/firmware/sd8686_helper.bin<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0# fixup wl12xx location, after 2.6.37 t=
he kernel searches a different location for it<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/firmwar=
e ; ln -sf ti-connectivity/* . )<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake &#39;DESTDIR=3D${D}&=
#39; install<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; -- <br>
&gt; &gt; &gt; 2.25.1<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
<br>
</blockquote></div></div>

--000000000000c4185805a01fe36f--
