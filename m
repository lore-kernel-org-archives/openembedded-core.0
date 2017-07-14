Return-Path: <gizero@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id D4AA66FFD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 14:39:28 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id a12so3590668ywh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A7Ql9yAgVxW9MDKTb+dU7iCEA1OcKCqudn8iOcqamHU=;
	b=lVJ4++Q4eMm2Z/acHjfhr1FuQlmZ/vKUrnP/TwDVtThy9FABerZeYUcMLKY8/16X4O
	XK1jvVY96T2ZbZnsnWhdQ350z64bYZtCbBTPge+gvj5nV2yCtGq/wj6HguNXK0lCiXP0
	XqzKwNounjfZYB031S4B+I6nL2qkKzf9yN76Yi5H5lTYRd09URKAjI2wtlZ92iSkeM6w
	tM9LB5z0/2/soDW7+n6/zed/J0r6FiDXZok/RXi4av6DhOs4eFePnTN+0eoOsa1sisgO
	yqnUHcZnpWjHc/VlOlFVdazU6DXL2GJve47cvSPGIJytGNuCkQA6KWXOCAMOKkk1wS32
	HsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A7Ql9yAgVxW9MDKTb+dU7iCEA1OcKCqudn8iOcqamHU=;
	b=DfgaxhIuT41Lvbsubvfk0Ngu+SHJdT7SvEg/mkYkCAomJqCIt5ERe0VlTAtze+9aqP
	WE1dUZcVvBsci2k04+2E57CjGBMwAaGwGUm6Or7K+4oGHQVKokDu0IWL++lRDOv67y7/
	oRXqYieU5yE01tmPOND7raS7qekYMuXzl7U/HL++1TIlLfdBe0Ygq0dwEdjczZmCgFhR
	DkijtDjuAUnOEDCyYkCCK3Ee7DvHeZSQJnTvzuUiOAmKI6CQTuMoMGAlnBeifg72ikCg
	8rs5utuHdCNBGTxh9a4FvxCUFzLuvH2lQ+Qm+1f1ZMD5XvKj40lIesVeKmepPMHVl+wC
	Jo8w==
X-Gm-Message-State: AIVw1113fJ/Zl2Zn+2soHegGlFIUCdw9D59BYKoROtkUhKs0jHoyLNDj
	UBBLd3NcJ+e139HbHUIAv6iHpkEwzw==
X-Received: by 10.13.208.66 with SMTP id s63mr6340252ywd.292.1500043169612;
	Fri, 14 Jul 2017 07:39:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.200.129 with HTTP; Fri, 14 Jul 2017 07:39:29 -0700 (PDT)
In-Reply-To: <CAHiDW_FWXf4XJi9-KNMnb34DQ3rO-KuEKfPcveadrHzGdr0szA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
	<CAHiDW_FWXf4XJi9-KNMnb34DQ3rO-KuEKfPcveadrHzGdr0szA@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 14 Jul 2017 16:39:29 +0200
Message-ID: <CAC+thW1Zc6txzCeCDXpu8ept9QUF7OFjov7hStXjcY9tPre5AQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Jul 2017 14:39:29 -0000
Content-Type: multipart/alternative; boundary="001a114e5e9845ccd705544804b3"

--001a114e5e9845ccd705544804b3
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
>
Can anyone of you guys with deep understanding in this matter help with
[1]. I posted a pull request on RPi userland upstream backporting changes
to eglplatform.h from mesa that seems relevant to fix builds for libepoxy
and gtk+3 but maintainers arguments needs more knowledge than I have...

[1] https://github.com/raspberrypi/userland/pull/407

--001a114e5e9845ccd705544804b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jul 11, 2017 at 10:06 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><span class=3D"gmail-">On 10 July 2017 at 17:47, Andrea Galbusera <span di=
r=3D"ltr">&lt;<a href=3D"mailto:gizero@gmail.com" target=3D"_blank">gizero@=
gmail.com</a>&gt;</span> wrote:<br></span><span class=3D"gmail-"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div class=3D=
"gmail-m_7240410860845977654gmail-h5"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><span style=3D"color:rgb(34,34,34)">During bisection the f=
ailing task changed from do_prepare_recipe_sysroot to do_compile with the l=
og below. I have no idea if these things do relate themselves, but if not, =
I was not able to figure it out while bisecting.</span><br></div></div></di=
v></div><div class=3D"gmail_extra"><br>| In file included from /home/gizero=
/work/smartliving/<wbr>distro/repo-master/build-poky/<wbr>tmp/work/cortexa7=
hf-neon-vfpv4<wbr>-poky-linux-gnueabi/gtk+3/3.22<wbr>.16-r0/recipe-sysroot/=
usr/incl<wbr>ude/epoxy/egl.h:46:0,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../=
../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayland.h:32,<br>|=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 from ../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcont=
ext-wayland.c:24:<br>| ../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-=
wayland.c: In function &#39;gdk_wayland_gl_context_realiz<wbr>e&#39;:<br>| =
../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayland.c:179<wbr>:43: =
error: expected expression before &#39;EGLContext&#39;<br>|=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 : EGL_NO_CONTEXT,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^<br></div></div></blockquote><div><br></div></span><div>Your bisect seems=
 valid: gtk+3 uses a define that comes from epoxy and was changed in the up=
date. The new define uses a EGL_CAST() macro that was added to eglplatform.=
h at the same time. mesa has updated their eglplatform.h so it all seems to=
 work, but userland does not seem to have this macro?</div><div><br></div><=
div>There&#39;s probably more to the story (since the error is not about im=
plicit EGL_CAST() as one would expect). My first suggestion would be that u=
serland eglplatform.h is updated to match current Khronos registry or at le=
ast to include the EGL_CAST definition.</div><div><br></div></div></div></d=
iv></blockquote><div><br></div><div>Can anyone of you guys with deep unders=
tanding in this matter help with [1]. I posted a pull request on RPi userla=
nd upstream backporting changes to eglplatform.h from mesa that seems relev=
ant to fix builds for libepoxy and gtk+3 but maintainers arguments needs mo=
re knowledge than I have...=C2=A0</div><div><br></div><div>[1]=C2=A0<a href=
=3D"https://github.com/raspberrypi/userland/pull/407">https://github.com/ra=
spberrypi/userland/pull/407</a></div></div></div></div>

--001a114e5e9845ccd705544804b3--
