Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web11.4092.1602523690297234363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 10:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KofwhPEb;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id x185so9577710vsb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IiE7U38doLWZsKQBB/cKgKl/LyU0Vq8WS5N35u0xKi8=;
        b=KofwhPEb9pi/ugDgEJ1F4ePGvt8u8vss4L3QAQCsJO3MPm+D8ORy8fLwCozOEpGw17
         Y4veRU9yDVr5Mbeh8blbIFAMrUj3T5PK78PcckK603VO1EiDgNzalVY7QxdBYtrWo28Z
         jRN8K2Vr8iuBdL7vS4fLmAQbQdkYmyLdulRYOrk5I6z/8H+DlZbMzLVSGo+12JkPaOEG
         B2LJC6n5j3tTCcVQ+j6LWwehX7O/nqk18w2WA3738B03AFqUZJ4mL9V6l6+s0DV0aihy
         dPc7kwfnbUZcIOFT4GOT3fH4LHt75KPAd8l7MQ5/hPjFRbLfQNowFfmu4CNDFRp5r+oE
         vO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IiE7U38doLWZsKQBB/cKgKl/LyU0Vq8WS5N35u0xKi8=;
        b=a2ajTiHxR+ctdb2MUHfjIclU+qMQjgzhRh1r45oJhcdNqIGjs9NoCQ+YzHcAe2ybOX
         liWXUn9uXhSTQEI4Mf1ebYV25y3qoP2eutngsueRTc4bROcFKfEJ6FmQL7PTLa0CXfcj
         tOj7LqE8k9/bcrtbEd8DlBybKv5yd7MZ+eH4E803JMGQRdEnvjTOLOc0t4Y6ZSR3qsCx
         vSIIcBoPOfEXIpLuPs7brc5vzopSS5vlMbKsuYMr9K2kVECHKtzwMIjstQXaC73Yxg3K
         TKmgu17ntefL6MZj0VyZpmiDaEzeqXFM++YFqZPr/8+qbnNLhFFEvL2ZjtgTKrsbTGRl
         EiPA==
X-Gm-Message-State: AOAM5324ieDyJg48OVMac6n7xGaYpBZwPiRZ5QgeyuG+Z4oViymg1ouL
	M0L38rdgXS9weRb7Fwh4xFKaFgXsRQTbmWPS5bE=
X-Google-Smtp-Source: ABdhPJxgPAahr3ZgdHuGIY/hKDqcqNcDYwRgJtBIYnfpSrUB9z+dFACi6N4nnKxq+Y5e5mGeZusXf852e6m9dXP13s8=
X-Received: by 2002:a05:6102:119:: with SMTP id z25mr5835152vsq.51.1602523689389;
 Mon, 12 Oct 2020 10:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
In-Reply-To: <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2020 19:27:58 +0200
Message-ID: <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000040136705b17c9f59"

--00000000000040136705b17c9f59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, this is fine then. But please add the information and links to the
commit message, so that anyone who wants to address this knows where to
start.

Alex

On Mon, 12 Oct 2020 at 18:13, Jose Quaresma <quaresma.jose@gmail.com> wrote=
:

> As I understand, the problem is not related with the vulkan package.
>
> To build the vulkan gstreamer plugin whe need a native binary that is
> not provided in OE core.
> This binary is [glslc]
>
> It is provided by the shaderc project
> https://github.com/google/shaderc
>
> Gstreamer upstream also suggests this project.
> As glslangValidator is the tool coming from Khronos it would probably
> be good to support it.
> https://github.com/KhronosGroup/glslang
>
> I can try to build a recipe to fix the missing glslc native binary.
> But it's better if anyone can provide more information on this because
> I am not expert in this area.
>
> Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
> 12/10/2020 =C3=A0(s) 16:54:
> >
> > On Mon, 12 Oct 2020 at 14:36, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >>
> >> -PACKAGECONFIG[vulkan]          =3D
> "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader"
> >> +# FIXME: vulkan build fail
> >> +# to build vulkan, a new package is needed.
> >> +# add shaderc package as a separate pacth
> >> +#
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/1349
> >> +#| Program glslc found: NO
> >> +#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc']
> not found or not executable
> >> +#PACKAGECONFIG[vulkan]          =3D
> "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader shaderc"
> >
> >
> > I think this needs to be addressed, as it's a regression in what
> previously worked. If a newer version of vulkan is required, I have done
> some work towards that here:
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanav=
in/package-version-updates-later&id=3Dd6715a06317b1799f5380cc8169acfbd0696d=
498
> >
> > but had to put it on hold because gstreamer 1.16 is not compatible with
> it :) Can you cherry-pick that and see if it helps? (there's an even newe=
r
> vulkan available since, so maybe you need to do additional upgrading)
>
> I understand the problem and is because of this that I put it in a
> separate patch.
> I will try your work on
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanav=
in/package-version-updates-later&id=3Dd6715a06317b1799f5380cc8169acfbd0696d=
498
> But as I mentioned before I think the problem needs to be solved with
> a new recipe.
>
> >
> > Alex
>
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>

--00000000000040136705b17c9f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, this is fine then. But please add the informat=
ion and links to the commit message, so that anyone who wants to address th=
is knows where to start.</div><div><br></div><div>Alex<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12 =
Oct 2020 at 18:13, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.=
com">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">As I understand, the problem is not related wit=
h the vulkan package.<br>
<br>
To build the vulkan gstreamer plugin whe need a native binary that is<br>
not provided in OE core.<br>
This binary is [glslc]<br>
<br>
It is provided by the shaderc project<br>
<a href=3D"https://github.com/google/shaderc" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/google/shaderc</a><br>
<br>
Gstreamer upstream also suggests this project.<br>
As glslangValidator is the tool coming from Khronos it would probably<br>
be good to support it.<br>
<a href=3D"https://github.com/KhronosGroup/glslang" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/KhronosGroup/glslang</a><br>
<br>
I can try to build a recipe to fix the missing glslc native binary.<br>
But it&#39;s better if anyone can provide more information on this because<=
br>
I am not expert in this area.<br>
<br>
Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_=
blank">alex.kanavin@gmail.com</a>&gt; escreveu no dia segunda,<br>
12/10/2020 =C3=A0(s) 16:54:<br>
&gt;<br>
&gt; On Mon, 12 Oct 2020 at 14:36, Jose Quaresma &lt;<a href=3D"mailto:quar=
esma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; -PACKAGECONFIG[vulkan]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot=
;-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader&quot;<br>
&gt;&gt; +# FIXME: vulkan build fail<br>
&gt;&gt; +# to build vulkan, a new package is needed.<br>
&gt;&gt; +# add shaderc package as a separate pacth<br>
&gt;&gt; +# <a href=3D"https://gitlab.freedesktop.org/gstreamer/gst-plugins=
-bad/-/issues/1349" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/gstreamer/gst-plugins-bad/-/issues/1349</a><br>
&gt;&gt; +#| Program glslc found: NO<br>
&gt;&gt; +#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) [&#39=
;glslc&#39;] not found or not executable<br>
&gt;&gt; +#PACKAGECONFIG[vulkan]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quo=
t;-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader shaderc&quot;<br>
&gt;<br>
&gt;<br>
&gt; I think this needs to be addressed, as it&#39;s a regression in what p=
reviously worked. If a newer version of vulkan is required, I have done som=
e work towards that here:<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/comm=
it/?h=3Dakanavin/package-version-updates-later&amp;id=3Dd6715a06317b1799f53=
80cc8169acfbd0696d498" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-versio=
n-updates-later&amp;id=3Dd6715a06317b1799f5380cc8169acfbd0696d498</a><br>
&gt;<br>
&gt; but had to put it on hold because gstreamer 1.16 is not compatible wit=
h it :) Can you cherry-pick that and see if it helps? (there&#39;s an even =
newer vulkan available since, so maybe you need to do additional upgrading)=
<br>
<br>
I understand the problem and is because of this that I put it in a<br>
separate patch.<br>
I will try your work on<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=
=3Dakanavin/package-version-updates-later&amp;id=3Dd6715a06317b1799f5380cc8=
169acfbd0696d498" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproj=
ect.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-version-upd=
ates-later&amp;id=3Dd6715a06317b1799f5380cc8169acfbd0696d498</a><br>
But as I mentioned before I think the problem needs to be solved with<br>
a new recipe.<br>
<br>
&gt;<br>
&gt; Alex<br>
<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
</blockquote></div>

--00000000000040136705b17c9f59--
