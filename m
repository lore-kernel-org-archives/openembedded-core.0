Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 217627FDCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 15:44:39 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id k188so2013324vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=BCkMoW2dI0Pn6DYzSnSBbfEjf+fiC4y/zT208EmB58o=;
	b=nB9BbRM7VZcN4z7tNezzlaMOp6HzJBEnLn9Ro8qaH6P8wIrGdHxcMnqg7BEdvCA3Du
	H/PjTXe6pego7q85NV7CqI09hADVYvy4NBvW44oqF9SpgJ3BbA/ZWRjik8dQqGraS/fa
	o3jZDou62QqUYjiZb0fflFtKjabAbfBLpX7Q43WLdnGyhELw0F77JjGlhl/aGrxYAdES
	nWRME4kLIt41O7jueP3fIOiLA6YUZNZORsfihS9yvyGn9cxESkLhnzCyIVUW4roktY2z
	336AXroKk+SHivsH3i1asykVZekG0hg65xfMZFkPIYd1C7AjFIQ47T9mLZ7gWNYO2KOG
	SeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=BCkMoW2dI0Pn6DYzSnSBbfEjf+fiC4y/zT208EmB58o=;
	b=YdmkYDJR0X2h7hS5f9VlsM8ClcJlO6Mqlxv+d1k9j7WQiBznVx0SV2/iT+zW/JNX4E
	I2Q3RoIRlgYawTTVn7P/z5bZB3HS10cNFzw7VpAcG55Oh9rXsFkOMwMnLO14flEGnCkb
	eJyhePuauXLXrhWjpu5RrOfJpkky3XPJ0gj8CDbIvaFD0rvZsmtl8fw/Sa3ft/RIirRu
	8RkKxO7Jr+HB0pjcwT8PqRcLQmrascbQvCxbPt1L5hsW9EBYYmOXICkqxPuBXWoMG9OC
	6xFjAiI/YsrhrF1ehF3tafs0OuVMaqRb78Xg0NRIcLy0XSZR4OBdL2nVp4wwTQ1qDne3
	eVgg==
X-Gm-Message-State: APjAAAW6AWtt4TIgpT4qcgLSBnAJAseQ1fAwl17m8jBRQXpagW5blBFo
	kKgoSIc59heeDh7LNrhytZKkckd1O9IbUGXcyY7ksg==
X-Google-Smtp-Source: APXvYqy1qk85tgiX32SsmYhUEQGI+8mX/XyzvFBflcreU58N8Mn/OYzEmV5iYL6UGw9KlZnTuKQCuxe5RArxZ8AJeYU=
X-Received: by 2002:a05:6102:3213:: with SMTP id
	r19mr6845770vsf.83.1579794279905; 
	Thu, 23 Jan 2020 07:44:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579793597.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1579793597.git.alex.kanavin@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Jan 2020 16:44:29 +0100
Message-ID: <CANNYZj-Ra+5bjAj4Wmg5L-teqBeViodcmU5B+Pe=C4tJGEFETQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] virgl: enable in qemu when 'opengl' is in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 23 Jan 2020 15:44:39 -0000
Content-Type: multipart/alternative; boundary="000000000000df3e5a059cd0841e"

--000000000000df3e5a059cd0841e
Content-Type: text/plain; charset="UTF-8"

I forgot to mention that this is all entirely opt-in (via non-default
options to 'runqemu'). By default qemu behaves exactly as before, and does
not use virgl.

Alex

On Thu, 23 Jan 2020 at 16:38, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> virgl is a virtualized accelerated 3D graphics support for the qemu
> guests. This patchset enables virgl in qemu, when 'opengl' is in
> DISTRO_FEATURES.
>
> This adds a few native dependencies to qemu-system-native
> (particularly, libdrm, virglrenderer and a special minimal configuration
> of mesa-native). I tested the impact on build times: it is about 30
> seconds on a 16 core machine. 'bitbake core-image-minimal' goes from
> 25m26s to 25m57s.
>
> The following changes since commit
> ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
>
>   bitbake: tests/fetch: Allow wget upgrade tests to run against a local
> server (2020-01-22 15:56:39 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib akanavin/qemu-split-virgl-gtk
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/qemu-split-virgl-gtk
>
> Alexander Kanavin (3):
>   bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk
>     from target
>   libsdl2: enable opengl option for native/nativesdk, subject to
>     'opengl' in DISTRO_FEATURES
>   qemu: enable virglrenderer and glx options subject to 'opengl'
>     DISTRO_FEATURE
>
>  meta/conf/bitbake.conf                         |  4 ++--
>  meta/lib/oeqa/selftest/cases/runtime_test.py   | 18 ++++++------------
>  .../qemu/qemu-system-native_4.1.0.bb           |  4 +++-
>  meta/recipes-devtools/qemu/qemu_4.1.0.bb       |  5 ++++-
>  meta/recipes-gnome/gtk+/gtk+3.inc              |  2 ++
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb    |  2 ++
>  .../libepoxy/libepoxy_1.5.4.bb                 |  2 --
>  .../recipes-graphics/libsdl2/libsdl2_2.0.10.bb |  4 ++--
>  .../virglrenderer/virglrenderer_0.8.1.bb       |  2 --
>  9 files changed, 21 insertions(+), 22 deletions(-)
>
> --
> 2.17.1
>
>

--000000000000df3e5a059cd0841e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I forgot to mention that this is all entirely opt-in =
(via non-default options to &#39;runqemu&#39;). By default qemu behaves exa=
ctly as before, and does not use virgl.</div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, 23 Jan 2020 at 16:38, Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">virgl is a virtualized acceler=
ated 3D graphics support for the qemu<br>
guests. This patchset enables virgl in qemu, when &#39;opengl&#39; is in<br=
>
DISTRO_FEATURES.<br>
<br>
This adds a few native dependencies to qemu-system-native<br>
(particularly, libdrm, virglrenderer and a special minimal configuration<br=
>
of mesa-native). I tested the impact on build times: it is about 30<br>
seconds on a 16 core machine. &#39;bitbake core-image-minimal&#39; goes fro=
m<br>
25m26s to 25m57s.<br>
<br>
The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba=
:<br>
<br>
=C2=A0 bitbake: tests/fetch: Allow wget upgrade tests to run against a loca=
l server (2020-01-22 15:56:39 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a> akanavin/=
qemu-split-virgl-gtk<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dakanavin/qemu-split-virgl-gtk" rel=3D"noreferrer" target=3D"_blank">http=
://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/qemu-split-=
virgl-gtk</a><br>
<br>
Alexander Kanavin (3):<br>
=C2=A0 bitbake.conf: propagate &#39;opengl&#39; DISTRO_FEATURE to native/na=
tivesdk<br>
=C2=A0 =C2=A0 from target<br>
=C2=A0 libsdl2: enable opengl option for native/nativesdk, subject to<br>
=C2=A0 =C2=A0 &#39;opengl&#39; in DISTRO_FEATURES<br>
=C2=A0 qemu: enable virglrenderer and glx options subject to &#39;opengl&#3=
9;<br>
=C2=A0 =C2=A0 DISTRO_FEATURE<br>
<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0meta/lib/oeqa/selftest/cases/runtime_test.py=C2=A0 =C2=A0| 18 ++++++-=
-----------<br>
=C2=A0.../qemu/<a href=3D"http://qemu-system-native_4.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">qemu-system-native_4.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_4.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">qemu_4.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 5 ++++-<br>
=C2=A0meta/recipes-gnome/gtk+/gtk+3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 2 +=
+<br>
=C2=A0.../libepoxy/<a href=3D"http://libepoxy_1.5.4.bb" rel=3D"noreferrer" =
target=3D"_blank">libepoxy_1.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A0.../recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.10.bb" rel=
=3D"noreferrer" target=3D"_blank">libsdl2_2.0.10.bb</a> |=C2=A0 4 ++--<br>
=C2=A0.../virglrenderer/<a href=3D"http://virglrenderer_0.8.1.bb" rel=3D"no=
referrer" target=3D"_blank">virglrenderer_0.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 --<br>
=C2=A09 files changed, 21 insertions(+), 22 deletions(-)<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000df3e5a059cd0841e--
