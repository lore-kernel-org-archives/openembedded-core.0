Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0221B7FC4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 16:27:08 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id bx28so5332796edb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EJykAXmPEHr1gKSCAb7xrvE5o2B0IiVV5MJTJm2fb4g=;
	b=iG1cK7Y1QNW3UWFRxLX26Vpkpvh3zPmY7FYwb9Tz3ghqd4YsQpopZfOD/rQDCC8qG1
	kB8OkbGOsTKBuCcfeA0e20S9fhz4NFm4dp6e1alYce/nNtvNPPVtwRL+pouk9wEVVnxo
	yfW78Y+A7Je3yC02jQTyfPs18Zk7bFkTRLYTtLwOc+Vhf1YM4iMnBG2auicOEBOvidIo
	xmE7NuNyQ0JHWIXi1P27he7QHhyMKPTZX6GCkhVq4/Hp4stsGsRsXBNpt9BbqWuix7OA
	PeVxb9c3Dsc7zpBRr2M95U8NF7WwsUDoGUoEH+1BwjinZV3f14h+iOVOpuXdIi5zDvWX
	8FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EJykAXmPEHr1gKSCAb7xrvE5o2B0IiVV5MJTJm2fb4g=;
	b=En/CDUarGe9SCkFsozmgGctulNE3otg+HKyhBAqbPCHJkrkYVgQmLl0F5N6cqCEqXr
	g5LznaklSEhHrVR7DvGVwke49T81t5GJRauBnW6mioj61KaGkHMuOk856zPvPL48Zy5K
	nWblDyGxYyvxrRd6N/07uC3aIBCQc/UmaN8KzNx7AfrQMrZ/vQBACSPUF5YbrvXqVkTi
	g5Yo20breHKX+AGWqs/HiXF4f396zSZcLN5QEWRAQ3N87Y4dunTqlmKF1QFhhHA7ZILU
	Dc6vy/rd2uNzWvnA0NHJK61kJFR1EMyxj4RuP4PaxXzX/ezKDoHITwG9GLKy9n2mvD8L
	J5sw==
X-Gm-Message-State: APjAAAWo1ZitRvZstacy0IlQtwM9h6uJ91SRCn7ugv+2f948m7mflpk/
	vIEhXsiMx5c4RW0HMk+7poe59fQMTJcMqsSWSlY=
X-Google-Smtp-Source: APXvYqzJXVZA36nH0vhHPKHF8xuNx4GT4F0H4tvH7EQYu8S7WApBuaGw8MTY5gfqF2fQfT0u2AUuniQ1EO7WEkp/yg8=
X-Received: by 2002:aa7:c983:: with SMTP id c3mr6282913edt.98.1576600029540;
	Tue, 17 Dec 2019 08:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20191214180842.14879-1-alistair@alistair23.me>
	<a72aa388-a311-f680-3621-ada8350a9f16@intel.com>
In-Reply-To: <a72aa388-a311-f680-3621-ada8350a9f16@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 17 Dec 2019 17:26:58 +0100
Message-ID: <CA+chaQeXWgqd+WMBBzuTfm_DSZUyWmcccVGLQOwYLPADnCTYQg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.3.0
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
X-List-Received-Date: Tue, 17 Dec 2019 16:27:09 -0000
Content-Type: multipart/alternative; boundary="000000000000b6b4f40599e8cc35"

--000000000000b6b4f40599e8cc35
Content-Type: text/plain; charset="UTF-8"

Yes, see my reply in https://patches.openembedded.org/patch/165737/

On Tue, Dec 17, 2019 at 4:54 PM Ross Burton <ross.burton@intel.com> wrote:

> Breaks the no-x11 builds.
>
> Waffle:
>
> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/waffle/1.6.0-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10:
>
> fatal error: X11/Xlib.h: No such file or directory
>    134 | #include <X11/Xlib.h>
>        |          ^~~~~~~~~~~~
>
> glew:
>
> In file included from include/GL/eglew.h:107,
>                   from src/glew.c:43:
> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/glew/2.1.0-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10:
>
> fatal error: X11/Xlib.h: No such file or directory
>    134 | #include <X11/Xlib.h>
>        |          ^~~~~~~~~~~~
>
> I believe the big X11 on/off toggle changed in this release?
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b6b4f40599e8cc35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, see my reply in=C2=A0<a href=3D"https://patches.opene=
mbedded.org/patch/165737/">https://patches.openembedded.org/patch/165737/</=
a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Dec 17, 2019 at 4:54 PM Ross Burton &lt;<a href=3D"mailto:ross.bu=
rton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Breaks the no-x11 builds.<br>
<br>
Waffle:<br>
<br>
/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linu=
x/waffle/1.6.0-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: <br>
fatal error: X11/Xlib.h: No such file or directory<br>
=C2=A0 =C2=A0134 | #include &lt;X11/Xlib.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~=
<br>
<br>
glew:<br>
<br>
In file included from include/GL/eglew.h:107,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from src/gle=
w.c:43:<br>
/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linu=
x/glew/2.1.0-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: <br>
fatal error: X11/Xlib.h: No such file or directory<br>
=C2=A0 =C2=A0134 | #include &lt;X11/Xlib.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~=
<br>
<br>
I believe the big X11 on/off toggle changed in this release?<br>
<br>
Ross<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000b6b4f40599e8cc35--
