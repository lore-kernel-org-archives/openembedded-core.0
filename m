Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.10134.1603100915111517220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 02:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a1pDnB5R;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: max.oss.09@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id i2so11196728ljg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iecEN/vmjRnIq4KwHF+tX52kxIFZFCdloCixpUf4r5I=;
        b=a1pDnB5RVMzZoccjCSjaOHFy7/xDUy/GKorX8QHC8x6T10Nk6/dS54dovyDm7uUj+E
         JupwTntDOSLx7/9qBHG2GqoP+CIhg4U4xZ3czvH2fW69QRHGVgAX6oAEwuZ7qKmZbUnX
         kEE7p0h8g+AICEgj0nx0HV4D86bxRZFoj3mlffxOvIcOMotkuSTOVIfWAVPX1TNnCupF
         Ue5JmC4sMPxB450lENkDKH9fiX19ORVtMaIrPaqtZo83bfeqETPXWS28WH1wRPEnwr9l
         qrUkAkwiCqy1EGaZveouKOF9WQnRQxhglQBD+XFa+Z6Hnt2DFkhi/rrV2Z+CVCRUoFs6
         j+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iecEN/vmjRnIq4KwHF+tX52kxIFZFCdloCixpUf4r5I=;
        b=ofMmCDTFizqbqz5JFbZ/5RD3lMFQBYqTXCGItKYWfgVOwWr7Top5LVtyOehi2JGVZ2
         BN8FCkckFpi1WiYJHJt21DVR4X6wkFiymcr8e3HCdRStJtj5NY+0lOvOcRd+0a3ev4Ln
         Qo0IztcjVGGq9qT/A1RuXDAjXijJJ2B1wj3wFSPS1fFe+5i0ETCxawtZPrZchU/wE7SV
         Csab6l+BwWm+zicjaMYWHjMEx6FLigDtMhpk4X4HP2dCh+i0r+N1mRiM3tZoERQ5X5cU
         o/szfVQZQrFaBeozSZPhK0x2RIwE4WjB1XZbl3gGFZdH2jfQPwzCxIznZWEh0ysLE0Hn
         shJQ==
X-Gm-Message-State: AOAM531PlgP+AHcYygcX8waV8NUApV1to/vReZyuyZLJpURLllNSaXMP
	O6lkbu7Gq5ACtPj+4Kk8CFkdPlLFDEQJcwaBiP0=
X-Google-Smtp-Source: ABdhPJxgp0sbJs7V0WSWzrto710YR+4M5SOdNykONnAj7VojI3QFLFy/frVNSrpRXS8WQ2zdZBiX8aFrfQVbg0jbU9M=
X-Received: by 2002:a2e:9882:: with SMTP id b2mr5663995ljj.247.1603100912996;
 Mon, 19 Oct 2020 02:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201019093801.55488-1-max.krummenacher@toradex.com>
 <20201019093801.55488-2-max.krummenacher@toradex.com> <20201019094459.hx2v3qjf2fwhig7n@qschulz>
In-Reply-To: <20201019094459.hx2v3qjf2fwhig7n@qschulz>
From: "Max Krummenacher" <max.oss.09@gmail.com>
Date: Mon, 19 Oct 2020 11:48:22 +0200
Message-ID: <CAEHkU3Xgb153UtTbAA+=fn4Piv8=B4uJv9dvMJM_nZBH=XBg4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-firmware: package nvidia firmware
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000007554b905b2030470"

--0000000000007554b905b2030470
Content-Type: text/plain; charset="UTF-8"

Hi Quentin

Thanks for the input.
My bad. Will change that in a V2.

Max

Am Mo., 19. Okt. 2020 um 11:45 Uhr schrieb Quentin Schulz <
quentin.schulz@streamunlimited.com>:

> Hi Max,
>
> On Mon, Oct 19, 2020 at 11:38:01AM +0200, Max Krummenacher wrote:
> > Add packages for the firmware required by the Nvidia chipsets.
> > Split it in Tegra K1, all other Tegras and desktop GPU packages.
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  .../linux-firmware/linux-firmware_20200817.bb | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/
> linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/
> linux-firmware_20200817.bb
> > index 3d6644e504..5bb27c51c7 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
> > @@ -288,6 +288,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
> >               ${PN}-adsp-sst-license ${PN}-adsp-sst \
> >               ${PN}-bnx2-mips \
> >               ${PN}-liquidio \
> > +             ${PN}-nvidia-license \
> > +             ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
> > +             ${PN}-nvidia-gpu \
> >               ${PN}-netronome-license ${PN}-netronome \
> >               ${PN}-qat ${PN}-qat-license \
> >               ${PN}-qcom-license \
> > @@ -478,6 +481,27 @@ FILES_${PN}-netronome = " \
> >
> >  RDEPENDS_${PN}-netronome += "${PN}-netronome-license"
> >
> > +# For Nvidia
> > +LICENSE_${PN}-nvidia-gpu = "Firmware-nvidia"
> > +LICENSE_${PN}-nvidia-tegra = "Firmware-nvidia"
> > +LICENSE_${PN}-nvidia-tegra-k1 = "Firmware-nvidia"
> > +LICENSE_${PN}-nvidia-license = "Firmware-nvidia"
> > +
> > +FILES_${PN}-nvidia-gpu = "/lib/firmware/nvidia"
>                              ^^^^ nonarch_base_libdir instead?
> > +FILES_${PN}-nvidia-tegra = " \
> > +  ${nonarch_base_libdir}/firmware/nvidia/tegra* \
> > +  ${nonarch_base_libdir}/firmware/nvidia/gm20b \
> > +  ${nonarch_base_libdir}/firmware/nvidia/gp10b \
> > +"
> > +FILES_${PN}-nvidia-tegra-k1 = " \
> > +  ${nonarch_base_libdir}/firmware/nvidia/tegra124 \
> > +  ${nonarch_base_libdir}/firmware/nvidia/gk20a \
> > +"
> > +FILES_${PN}-nvidia-license = "/lib/firmware/LICENCE.nvidia"
>                                  ^^^^ nonarch_base_libdir instead?
>
> Thanks,
> Quentin
>

--0000000000007554b905b2030470
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Quentin</div><div><br></div><div>Thanks for the in=
put.<br></div><div>My bad. Will change that in a V2.<br></div><div><br></di=
v><div>Max<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Am Mo., 19. Okt. 2020 um 11:45=C2=A0Uhr schrieb Quentin=
 Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.s=
chulz@streamunlimited.com</a>&gt;:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Max,<br>
<br>
On Mon, Oct 19, 2020 at 11:38:01AM +0200, Max Krummenacher wrote:<br>
&gt; Add packages for the firmware required by the Nvidia chipsets.<br>
&gt; Split it in Tegra K1, all other Tegras and desktop GPU packages.<br>
&gt; <br>
&gt; Signed-off-by: Max Krummenacher &lt;<a href=3D"mailto:max.krummenacher=
@toradex.com" target=3D"_blank">max.krummenacher@toradex.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../linux-firmware/<a href=3D"http://linux-firmware_20200817.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-firmware_20200817.bb</a> | 24 +=
++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 24 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linu=
x-firmware_20200817.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware=
_20200817.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http://lin=
ux-firmware_20200817.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmwar=
e_20200817.bb</a><br>
&gt; index 3d6644e504..5bb27c51c7 100644<br>
&gt; --- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_20200817.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202008=
17.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-firmw=
are_20200817.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_202008=
17.bb</a><br>
&gt; @@ -288,6 +288,9 @@ PACKAGES =3D+ &quot;${PN}-ralink-license ${PN}-ral=
ink \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-adsp-sst-l=
icense ${PN}-adsp-sst \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-bnx2-mips =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-liquidio \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-nvidia-license =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-nvidia-tegra-k1=
 ${PN}-nvidia-tegra \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-nvidia-gpu \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-netronome-=
license ${PN}-netronome \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qat ${PN}-=
qat-license \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-qcom-licen=
se \<br>
&gt; @@ -478,6 +481,27 @@ FILES_${PN}-netronome =3D &quot; \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RDEPENDS_${PN}-netronome +=3D &quot;${PN}-netronome-license&quot=
;<br>
&gt;=C2=A0 <br>
&gt; +# For Nvidia<br>
&gt; +LICENSE_${PN}-nvidia-gpu =3D &quot;Firmware-nvidia&quot;<br>
&gt; +LICENSE_${PN}-nvidia-tegra =3D &quot;Firmware-nvidia&quot;<br>
&gt; +LICENSE_${PN}-nvidia-tegra-k1 =3D &quot;Firmware-nvidia&quot;<br>
&gt; +LICENSE_${PN}-nvidia-license =3D &quot;Firmware-nvidia&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-nvidia-gpu =3D &quot;/lib/firmware/nvidia&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^ nonarch_base_libdir instead?<br>
&gt; +FILES_${PN}-nvidia-tegra =3D &quot; \<br>
&gt; +=C2=A0 ${nonarch_base_libdir}/firmware/nvidia/tegra* \<br>
&gt; +=C2=A0 ${nonarch_base_libdir}/firmware/nvidia/gm20b \<br>
&gt; +=C2=A0 ${nonarch_base_libdir}/firmware/nvidia/gp10b \<br>
&gt; +&quot;<br>
&gt; +FILES_${PN}-nvidia-tegra-k1 =3D &quot; \<br>
&gt; +=C2=A0 ${nonarch_base_libdir}/firmware/nvidia/tegra124 \<br>
&gt; +=C2=A0 ${nonarch_base_libdir}/firmware/nvidia/gk20a \<br>
&gt; +&quot;<br>
&gt; +FILES_${PN}-nvidia-license =3D &quot;/lib/firmware/LICENCE.nvidia&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^ nonarch_base_libdir inste=
ad?<br>
<br>
Thanks,<br>
Quentin<br>
</blockquote></div>

--0000000000007554b905b2030470--
