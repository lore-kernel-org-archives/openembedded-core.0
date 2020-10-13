Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.509.1602606581529873961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 09:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jF4dxqgr;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id j15so157159uaa.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 09:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4XuFzqw94cl6VsUlSFKzT54U6TW6zf6CTOuHyoBdfcw=;
        b=jF4dxqgr+NvCdD+hgu//ddi6ZoQT8SmJVvHkW2LsItuaxyaZVkXZlhIpQKMJnsVDrq
         1GCV6R0QgV+3k+V8eduHT4AfOwow0agM2gsoJMQQfuvFMAVXZsk/J2WX1Evz4nAGM0um
         TRng6FikUC+t9YW6cI35iVgORttQdishdzzOHwZl10fe1f17UbODnsnl7SiyUXHZm/Ce
         nWnjuoW0/H6di4tUHB8Qz1ut5+7eo1VCazo6qXfIiQlap7woz4ZQkaKLacFzlZ8IDkCa
         CZXrEhUhd1ImVX9cgsV3+30yRHHNANxjX+JDbzIn47nHXC9XdXLlnsG5HJRcJc37PRgS
         Y1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XuFzqw94cl6VsUlSFKzT54U6TW6zf6CTOuHyoBdfcw=;
        b=EdB+b+i6w+SLUS9xRJuf82/KdCXHZe5QYLL/3OWtn11MJy2Oa7GuuMaUI2HKvr1Le2
         UfwzEZIvvMDbqqWT4JMZP+Cqa2zGagOWZvgTq9LHoJEXyeB8Kc7HiayOkAcsiHlnFNYk
         X3oS8ReEy6o6Jzr9Nh4LXBvQYsHlmEn7IbsOcGQQ7aXB9Yyh1S//2OIWxzK6kp7U4wFx
         uPM9ZzNwIZZVKAbSsd4FfuzGcAIBlzfAtCvLVADXkC2aoLehC9d5ZbTOCHSEv5/9bfjR
         By/okezojC+v49cUhGxX0yDKo+95iGP63e1KpN9Qqo2C3ZRueaLWHVDP2m5w6CYLO+06
         27Qg==
X-Gm-Message-State: AOAM531WHIfO+HOV9ui468W7XTXgrhT8k3em4WZNtJqVB4XEM7gXpvfo
	e8vnJhbLRcXh0PrTEUAl7Rf4YasQxMgk5S0bwyU=
X-Google-Smtp-Source: ABdhPJx59JQj1C+k8iLfey/P4HIdyBjBYpKxTmT7HjRSaw5xFGLD6iLnYLb1oD9eL71CjDsFihFlk+Yck6juEoc4XYo=
X-Received: by 2002:a9f:2c0a:: with SMTP id r10mr660291uaj.22.1602606580639;
 Tue, 13 Oct 2020 09:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
 <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
 <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com>
 <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com>
 <163D7EFF5EFA949A.25724@lists.openembedded.org> <CANPvuRmeDf9Mmcj95noPET0d=NGtcC33k8qRhBRb95pLOxMQHQ@mail.gmail.com>
In-Reply-To: <CANPvuRmeDf9Mmcj95noPET0d=NGtcC33k8qRhBRb95pLOxMQHQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 13 Oct 2020 18:29:28 +0200
Message-ID: <CANNYZj9Zgc1BbufcL-ef8ArheofAd3S_raWVdkKYK7c+7PD4uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f4296e05b18feb39"

--000000000000f4296e05b18feb39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Either way is ok. If there are two patchsets, reference them in cover
letters.

Alex

On Tue, 13 Oct 2020 at 16:38, Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:

> I have new 3 recipes for fix the build of the vulkan gstreamer plugin
>
> spirv-tools:
> move it from meta-oe, add native build and install some extra header fil=
es.
>
> glslang:
> is the official reference compiler front end for the OpenGL ES and
> OpenGL shading languages.
>
> shaderc:
> A collection of tools, libraries and tests for shader compilation that
> provide the binary glslc need to build the vulkan plugin.
>
> What is the better method to submit this?
> A new patch series with these 3 recipes or a gstreamer patch series v2
> with all the recipes needed.
>
> Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
> ter=C3=A7a, 13/10/2020 =C3=A0(s) 09:11:
> >
> > Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
> > 12/10/2020 =C3=A0(s) 20:45:
> > >
> > > On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> > >>
> > >>
> > >> What I meant to point out was - there is a dependency in Vulkan on
> > >> glslang, irrespective whether it is compiled standalone or as a
> > >> dependency of another package. I believe this Vulkan <- glslang
> > >> dependency should be solved first before Vulkan can be included
> > >> anywhere further.
> > >>
> > >> As I know, it is currently solved locally in meta-freescale-distro
> > >> layer, hence it was my question on whether it should be moved to
> > >> OE-Core to solve the Vulkan dependency altogether?
> > >
> > >
> > > Can you please point to where glslang is used in the vulkan source
> tree? Is it something recently added, as vulkan bits and examples have b=
een
> building fine without it in oe-core?
> >
> > I am working on a recipe for 'shaderc' that is needed for build the
> > gstreamer vulkan plugin
> >
> > This recipe needs glslang and spirv-tools.
> > I don't have knowledge of the existence of glslang on
> > meta-freescale-distro and I created one for myself.
> >
> > >
> > > Alex
> >
> >
> >
> > --
> > best regards,
> > Jos=C3=A9 Quaresma
> >
> >=20
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>

--000000000000f4296e05b18feb39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Either way is ok. If there are two patchsets, referen=
ce them in cover letters.</div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 13=
 Oct 2020 at 16:38, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">I have new 3 recipes for fix the build of the =
vulkan gstreamer plugin<br>
<br>
spirv-tools:<br>
move it from meta-oe, add native build and install some extra header files=
.<br>
<br>
glslang:<br>
is the official reference compiler front end for the OpenGL ES and<br>
OpenGL shading languages.<br>
<br>
shaderc:<br>
A collection of tools, libraries and tests for shader compilation that<br>
provide the binary glslc need to build the vulkan plugin.<br>
<br>
What is the better method to submit this?<br>
A new patch series with these 3 recipes or a gstreamer patch series v2<br>
with all the recipes needed.<br>
<br>
Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu no dia<br=
>
ter=C3=A7a, 13/10/2020 =C3=A0(s) 09:11:<br>
&gt;<br>
&gt; Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targe=
t=3D"_blank">alex.kanavin@gmail.com</a>&gt; escreveu no dia segunda,<br>
&gt; 12/10/2020 =C3=A0(s) 20:45:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin &lt;<a href=3D"ma=
ilto:andrey.z@gmail.com" target=3D"_blank">andrey.z@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What I meant to point out was - there is a dependency in Vul=
kan on<br>
&gt; &gt;&gt; glslang, irrespective whether it is compiled standalone or a=
s a<br>
&gt; &gt;&gt; dependency of another package. I believe this Vulkan &lt;- g=
lslang<br>
&gt; &gt;&gt; dependency should be solved first before Vulkan can be inclu=
ded<br>
&gt; &gt;&gt; anywhere further.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; As I know, it is currently solved locally in meta-freescale-=
distro<br>
&gt; &gt;&gt; layer, hence it was my question on whether it should be move=
d to<br>
&gt; &gt;&gt; OE-Core to solve the Vulkan dependency altogether?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Can you please point to where glslang is used in the vulkan sour=
ce tree? Is it something recently added, as vulkan bits and examples have b=
een building fine without it in oe-core?<br>
&gt;<br>
&gt; I am working on a recipe for &#39;shaderc&#39; that is needed for bui=
ld the<br>
&gt; gstreamer vulkan plugin<br>
&gt;<br>
&gt; This recipe needs glslang and spirv-tools.<br>
&gt; I don&#39;t have knowledge of the existence of glslang on<br>
&gt; meta-freescale-distro and I created one for myself.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; best regards,<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
</blockquote></div>

--000000000000f4296e05b18feb39--
