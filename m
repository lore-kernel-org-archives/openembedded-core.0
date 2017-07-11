Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 958B977E9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:31:38 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id f200so6707919ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rai2CMrQ4VMrtUvb0FLpx/rO6I+wWJEbCsrFOJdyn8k=;
	b=DwoKKfclV3GVzxLrTNsvR+C6NdgSkc3GHY2DRbNGJqUjsG0AmNXSrL6baytokI9J1I
	CljZiFv+yctSLb1e5NBTEDhI2WmfzDUkJjkyZWxd+qBUT0/7O7Wz8HHKIzdFfBjhdEiT
	nA6Twmjq1RkxRyGmX2sD98TW+JzC3MksWQY2NXUc/TbwTrBukuzVqgbwin9s4pp/hS98
	WZvqIvqgOn71D6350ygI7ACupKc2s0q6D6gERMXoQZfo7h7hi3rUxGnT0XVKjFsk+UiG
	fdiY7zFoqjJ+AdX8od3vAV8vPJBMHSmKulcSnJXnznYZnkEv8805zSl5zSvdgEi+4OLk
	R5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rai2CMrQ4VMrtUvb0FLpx/rO6I+wWJEbCsrFOJdyn8k=;
	b=WSgyZlh02557Kh6hPSj+U4sndWqqUTw8RoZYA/ARLCj+Y+GaWMIDu3qPHMjv/8xXhY
	dUp8i0/YBOXEZabZGrkSS5UpesvZXZ6l7Wqn4fnV7n2zC7kfCgwkl+cW/+U6R15/AHGA
	aVjmLBbGffaRh33n5qXVsn2ki+6eE6GnliwNNY3sgm0aQxkfKZkaKv/0/snOTEt00eIk
	O0RNuRKFRXn/V70poKbH20EzFx9m0oc9IjIsJk75FxaJPyaxeekw+21JPaCIAbzM2M90
	pThpNYUzfRLGIVjwKY9PYer+I1BL21hUQ9WavpnzmADWxg3ylOqtzwULUs80gQaPSUnb
	tPPw==
X-Gm-Message-State: AIVw110IUhuocJxRKDSFKM54f7aof6FTC4c19aSpMpkwAuWcEnanxBZE
	dqJHA9d2kSEYIvFvN2GWm0qjID6dRQ==
X-Received: by 10.13.236.75 with SMTP id v72mr4021195ywe.25.1499761899458;
	Tue, 11 Jul 2017 01:31:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Tue, 11 Jul 2017 01:31:39 -0700 (PDT)
In-Reply-To: <CAHiDW_FWXf4XJi9-KNMnb34DQ3rO-KuEKfPcveadrHzGdr0szA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FWXf4XJi9-KNMnb34DQ3rO-KuEKfPcveadrHzGdr0szA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Tue, 11 Jul 2017 10:31:39 +0200
Message-ID: <CAC+thW2OAM3cG8UhNt-wAFrfPfMEY67k5MSHBBPPV5yrxRM-Hg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libepoxy: Upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Tue, 11 Jul 2017 08:31:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c08414c43d4d305540687fc"

--94eb2c08414c43d4d305540687fc
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 10:06 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 10 July 2017 at 17:47, Andrea Galbusera <gizero@gmail.com> wrote:
>
>> During bisection the failing task changed from do_prepare_recipe_sysroot
>> to do_compile with the log below. I have no idea if these things do relate
>> themselves, but if not, I was not able to figure it out while bisecting.
>>
>> | In file included from /home/gizero/work/smartliving/
>> distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4
>> -poky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/usr/incl
>> ude/epoxy/egl.h:46:0,
>> |                  from ../../../gtk+-3.22.16/gdk/wayl
>> and/gdkglcontext-wayland.h:32,
>> |                  from ../../../gtk+-3.22.16/gdk/wayl
>> and/gdkglcontext-wayland.c:24:
>> | ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c: In function
>> 'gdk_wayland_gl_context_realize':
>> | ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:179:43:
>> error: expected expression before 'EGLContext'
>> |                                          : EGL_NO_CONTEXT,
>> |                                            ^
>>
>
> Your bisect seems valid: gtk+3 uses a define that comes from epoxy and was
> changed in the update. The new define uses a EGL_CAST() macro that was
> added to eglplatform.h at the same time. mesa has updated their
> eglplatform.h so it all seems to work, but userland does not seem to have
> this macro?
>
> There's probably more to the story (since the error is not about implicit
> EGL_CAST() as one would expect). My first suggestion would be that userland
> eglplatform.h is updated to match current Khronos registry or at least to
> include the EGL_CAST definition.
>

I looked at the userland upstream repo and they don't seem to have updates
on their eglplatform.h since 2015...

--94eb2c08414c43d4d305540687fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jul 11, 2017 at 10:06 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;=
<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkone=
n@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><span class=3D"gmail-">On 10 July 2017 at 17:47, Andrea Galbusera <=
span dir=3D"ltr">&lt;<a href=3D"mailto:gizero@gmail.com" target=3D"_blank">=
gizero@gmail.com</a>&gt;</span> wrote:<br></span><span class=3D"gmail-"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div c=
lass=3D"gmail-m_3403342050928533504gmail-h5"><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><span style=3D"color:rgb(34,34,34)">During bisectio=
n the failing task changed from do_prepare_recipe_sysroot to do_compile wit=
h the log below. I have no idea if these things do relate themselves, but i=
f not, I was not able to figure it out while bisecting.</span><br></div></d=
iv></div></div><div class=3D"gmail_extra"><br>| In file included from /home=
/gizero/work/smartliving/<wbr>distro/repo-master/build-poky/<wbr>tmp/work/c=
ortexa7hf-neon-vfpv4<wbr>-poky-linux-gnueabi/gtk+3/3.22<wbr>.16-r0/recipe-s=
ysroot/usr/incl<wbr>ude/epoxy/egl.h:46:0,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 from ../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayland.h:32,<br>=
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../../../gtk+-3.22.16/gdk/wayl<wbr>and/=
gdkglcontext-wayland.c:24:<br>| ../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkg=
lcontext-wayland.c: In function &#39;gdk_wayland_gl_context_realiz<wbr>e&#3=
9;:<br>| ../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayland.c:179<=
wbr>:43: error: expected expression before &#39;EGLContext&#39;<br>|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 : EGL_NO_CONTEXT,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^<br></div></div></blockquote><div><br></div></span><div>Your bis=
ect seems valid: gtk+3 uses a define that comes from epoxy and was changed =
in the update. The new define uses a EGL_CAST() macro that was added to egl=
platform.h at the same time. mesa has updated their eglplatform.h so it all=
 seems to work, but userland does not seem to have this macro?</div><div><b=
r></div><div>There&#39;s probably more to the story (since the error is not=
 about implicit EGL_CAST() as one would expect). My first suggestion would =
be that userland eglplatform.h is updated to match current Khronos registry=
 or at least to include the EGL_CAST definition.</div></div></div></div></b=
lockquote><div><br></div></div>I looked at the userland upstream repo and t=
hey don&#39;t seem to have updates on their eglplatform.h since 2015...<br>=
</div></div>

--94eb2c08414c43d4d305540687fc--
