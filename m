Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B63B614FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 14:52:53 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id o42so6211968uad.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=koG1cbqXz3Xl4ToiPVyfpZPAWY7LM5459jsbT1UHaxs=;
	b=jrDMk9sVxC1xt7QonO0qsmFevvPBW6UirNvXh9/W5UFThmxrX/qfJW1wmlzTcOb8+E
	sPDZvbHeL/O/60e6sa4CsrQbbWyv0ZuatOwU9jJMx/VI0yOvxPxhpCjlxH99nGHoxKM2
	glLII2+zbe91vKAkF63p5zef3J/2RdKZilPGr/fMaiNxP5ExOCAycLoBWgtoC67fTzwW
	5QPrUOO1m6XlGN41gA+aXfjT+j5ulHqudsd2HZHpPOYG0cUD7eX1N4WcpSOOZefV1hT0
	iu86qVXR8kZYnv82stJm4DK2MByWEccjZqMTG+INGjR8Qio2RWwhFVxba3UvvYIOOsNr
	xsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=koG1cbqXz3Xl4ToiPVyfpZPAWY7LM5459jsbT1UHaxs=;
	b=t7Hx2rUMTU6tgxW0VofGjNImk9yPhEIhGBiuyRbXb8RA3eXFyMSZPoIiME1A7Z9wfF
	Xi3jJq6vQrBzHaBr5HsBMb0HNilx4HhwqY7ksyMhOTT/1e07ft37d68WrFN3Nk8vFObM
	E+qPm50B/K+Y+Mu+gmSvkvdopZxTStLSa9jc2ugoBAieWfY5bY97h+yyTMVzQ5vSZzxc
	XB0ISLMLJeAvDGrqpOhrXrnBU16Q76W6WBrlzuJgchTuOKq5MQkuwQrm6OBFj8n8mDMr
	xC4so0JI2KHJitjx4AuoFAjlbHBVRo4Pl0RMpOh8C1JK7HUHCogtuWpDa/Jlc6fc0+A+
	Nrkg==
X-Gm-Message-State: APjAAAX6ZiIYxMOE8MhFYpsvs9fBIa7YkDq0U1sq4520mP4R9cRdnjc+
	YYnZRQvrx41bRGA5tY8dUU9GUOQfOBBZTzVuF90=
X-Google-Smtp-Source: APXvYqx0QcrSrRuIIrgns9EpgaO76FJzt5AQSfdlxZgWAjBLJMUTaSyk5VYku2kkw8imkni+9V4t6lumKB4qmiWpN8E=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr7485152uap.93.1581951174053;
	Mon, 17 Feb 2020 06:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-9-alex.kanavin@gmail.com>
	<aceb5729c55050e1b1c9c62a316e500e621e33df.camel@linuxfoundation.org>
	<CANNYZj8-66ksJFTysmwus3uQZz_KamJH19uo2gbUy6B7Z13tBw@mail.gmail.com>
In-Reply-To: <CANNYZj8-66ksJFTysmwus3uQZz_KamJH19uo2gbUy6B7Z13tBw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 15:53:19 +0100
Message-ID: <CANNYZj8WjiZ9qK14=qGf-XdjKGL1f_GMedJtXaUa48xK3KWgzg@mail.gmail.com>
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
X-List-Received-Date: Mon, 17 Feb 2020 14:52:53 -0000
Content-Type: multipart/alternative; boundary="000000000000c81253059ec6b54a"

--000000000000c81253059ec6b54a
Content-Type: text/plain; charset="UTF-8"

Nevermind, found it. Forgot to click on the magnifying glass, before
starting a search.

Alex

On Mon, 17 Feb 2020 at 15:50, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 17 Feb 2020 at 15:35, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Sun, 2020-02-16 at 16:50 +0100, Alexander Kanavin wrote:
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  ...-the-native-wayland-scanner-directly.patch | 27
>> > +++++++++++++++++++
>> >  .../wayland/wayland_1.18.0.bb                 |  9 ++++---
>> >  2 files changed, 32 insertions(+), 4 deletions(-)
>> >  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-
>> > meson.build-find-the-native-wayland-scanner-directly.patch
>>
>> I pulled some of your patches into -next:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/718
>>
>> I think the failures are related to this patch?
>>
>
> Going slightly mad here:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b
>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b>libxkbcommon
> and mesa have failed in do_configure, but I am not seeing the tasks being
> run?
>
> Alex
>

--000000000000c81253059ec6b54a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nevermind, found it. Forgot to click on the magnifying gla=
ss, before starting a search.<div><br></div><div>Alex</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 17 Feb 2=
020 at 15:50, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.co=
m">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, 17 Feb 2020 at 15:35, Ri=
chard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targ=
et=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex">On Sun, 2020-02-16 at 16:50 +0100=
, Alexander Kanavin wrote:<br>
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
yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b" tar=
get=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/37/b=
uilds/1581/steps/8/logs/step1b</a></div><div><a href=3D"https://autobuilder=
.yoctoproject.org/typhoon/#/builders/37/builds/1581/steps/8/logs/step1b" ta=
rget=3D"_blank"></a>libxkbcommon and mesa have failed in do_configure, but =
I am not seeing the tasks being run?</div><div><br></div><div>Alex=C2=A0</d=
iv></div></div></div>
</blockquote></div>

--000000000000c81253059ec6b54a--
