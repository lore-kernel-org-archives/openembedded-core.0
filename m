Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2BD261479
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 14:50:29 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id 59so6217081uap.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UZk07ZA5IPpoV0aJq7FCUk+PYkoOMVlM/1lCUKgSjxs=;
	b=UECW0IYr6uwXiQbGLDHEqDRoYxzCc+z2mQE0ksb/F8V+XMpNGuu4pVhBRJZb1sBpCS
	wUcR1DM2r9e0CmMugqz85gXmCLKhi6PulDmlrQBeFrUra9D7ROBXqw0nzGj07FeUFQ4v
	8k8q8ibU1fr1+4tZGfbYUaCxPSoVIGx2fgkQDNrCS9OXcotoh7wQjuhsRr+UvmHDZRjJ
	tibhxDKjgrvBiSFDAl2RHhyj+T2ZRkU5sYaWaCKocBzwSBtUea42DKcn0oc+tPulsCMA
	2lbhZYolmaMDc3Lu0zhmang8li+2Gq/pmGAAMvcf2QnUXelfd/NRmnGgf9FrYQp1bGk3
	O9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UZk07ZA5IPpoV0aJq7FCUk+PYkoOMVlM/1lCUKgSjxs=;
	b=MDkPYBU7RtakUatouqcvcnY5fFUQpGeU46Osq2NHUKsfyyYzyX5rzyXaL25JQ7J+3Z
	/Lw/wqmhv2hkjjptYipBL83cJe22iqb/p4rDkPlSNDtq9o5z2G2P0d3vsSlQm3QMOZEl
	DCynKWZV79NbS21K+UMyIRm0q0XgmZ4V94xN0jpJysh6DI85n+O//7JAcrCh0a/4hTdP
	08e7jT/iIJrgMGjXn/1FFC9HJGJebe8JTqHr31xLgVqTn+YGdjcR2LprvC9+Pk2O3JQx
	SE+ichcfNUmC0OrPrL72RG4TqplYvdfmQsFIPoHKmjNz58Xz4w/vk+3hjPviHdevMsYe
	FNvA==
X-Gm-Message-State: APjAAAW33G0ydzzwCef2q+9TTx94DTH6vkKHA6NXZyY1ulA6k0Gp6W2W
	xvL5Wr/550qlZRTVeBKGGRy5fyyQ2nNTFatHuExFBvbJ
X-Google-Smtp-Source: APXvYqw5CGZcvAYeDzHyLajOxKBkKVWBplEFs309VB1MOX9qXJHzlY2q2Tu+kgpU5IhjHmvHPyhZtRHjR0opffc7LRU=
X-Received: by 2002:ab0:658d:: with SMTP id v13mr7336181uam.71.1581951030634; 
	Mon, 17 Feb 2020 06:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-9-alex.kanavin@gmail.com>
	<aceb5729c55050e1b1c9c62a316e500e621e33df.camel@linuxfoundation.org>
In-Reply-To: <aceb5729c55050e1b1c9c62a316e500e621e33df.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 15:50:56 +0100
Message-ID: <CANNYZj8-66ksJFTysmwus3uQZz_KamJH19uo2gbUy6B7Z13tBw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/10] wayland: convert to meson build
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
X-List-Received-Date: Mon, 17 Feb 2020 14:50:30 -0000
Content-Type: multipart/alternative; boundary="0000000000003bab01059ec6ad23"

--0000000000003bab01059ec6ad23
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2020 at 15:35, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2020-02-16 at 16:50 +0100, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...-the-native-wayland-scanner-directly.patch | 27
> > +++++++++++++++++++
> >  .../wayland/wayland_1.18.0.bb                 |  9 ++++---
> >  2 files changed, 32 insertions(+), 4 deletions(-)
> >  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-
> > meson.build-find-the-native-wayland-scanner-directly.patch
>
> I pulled some of your patches into -next:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/718
>
> I think the failures are related to this patch?
>

Going slightly mad here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b
<https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b>libxkbcommon
and mesa have failed in do_configure, but I am not seeing the tasks being
run?

Alex

--0000000000003bab01059ec6ad23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, 17 Feb 2020 at 1=
5:35, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">On Sun, 2020-02-16 at 16:50 +0100, Alexan=
der Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-the-native-wayland-scanner-directly.patch | 27<br>
&gt; +++++++++++++++++++<br>
&gt;=C2=A0 .../wayland/<a href=3D"http://wayland_1.18.0.bb" rel=3D"noreferr=
er" target=3D"_blank">wayland_1.18.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++---<br>
&gt;=C2=A0 2 files changed, 32 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-<b=
r>
&gt; meson.build-find-the-native-wayland-scanner-directly.patch<br>
<br>
I pulled some of your patches into -next:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/718" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/83/builds/718</a><br>
<br>
I think the failures are related to this patch?<br></blockquote><div><br></=
div><div>Going slightly mad here:</div><div><a href=3D"https://autobuilder.=
yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b">htt=
ps://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8=
/logs/step1b</a></div><div><a href=3D"https://autobuilder.yoctoproject.org/=
typhoon/#/builders/37/builds/1581/steps/8/logs/step1b"></a>libxkbcommon and=
 mesa have failed in do_configure, but I am not seeing the tasks being run?=
</div><div><br></div><div>Alex=C2=A0</div></div></div></div>

--0000000000003bab01059ec6ad23--
