Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3976977E7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:06:31 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id v202so56110521itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sKsjnhye7JbnooACr+WuIPC6XJrSTy90ZSWY4bvBSzs=;
	b=XfL6YO3MFzpl8Cy7tTYUDuICLDoDgpGnIUHvhS0j7LB69BM1P/SDxwzYtDI+kkvxDm
	Lt90F+wtGYSzu8GLqFa2mMp6sSycEFMg29EKnd9kGrHnn/dI7fiOFvmZj+be3ZoQ8Lut
	Dw6nGcm3yH9i2474Er6ib1Q0DEGaLzVaWQURE6MFd73SpxO7eCEfMmORNi0nd+KNCzNq
	mGRgoV9VhzsQlBFUfMQRLsSg1bDpSZUDldDv+oyp6D6ovDyeR0Fm7usKxsfjIBCcKOBP
	ex9ZgcJPCjCNFjN5TDZi1qcbabus1QzFh/IdO4c7BpugTnxKQkNiAJzARvbuwla7z8v3
	u0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sKsjnhye7JbnooACr+WuIPC6XJrSTy90ZSWY4bvBSzs=;
	b=mtVGMaPjvzUuXh5dYGjW1gxT2WPOUjR+VeaAnxdjh3n9c6a5OgnWDIr4drvpbLOoem
	fa0z5oiEDb4imY/SePIOEF5qyqZOOms/5QpufD4l2Zgfv7MiSecAdn9Uc/ZkZR84dfg3
	r8qp2l/jFgtV3/eaZ4UsXwOa56yW/P7j+GyRWyk2rA3wOmPqnh+kehfpC+7PaVE9K62s
	l7G3Ke6lUUtjr2f+vaHA6xOd+aJ1tGsQWQVubQZq2JKI61/y0Xd/gn1HuKy/4gzI/46a
	YLubIjG67G8txzUS88HAy3znG5hyxZxj7ajotOHMTfFn2l/9LFBs7tPpcHn8/9AodmQb
	WyHQ==
X-Gm-Message-State: AIVw110IwtJ70tY41uLFlcMHS2mIvTUUtpfZqI6sOrP+fWLMbyLe+OAv
	ogW3A8tDmhHooiHz1w9vWyOPJIoFXmbG
X-Received: by 10.107.37.141 with SMTP id l135mr7045787iol.146.1499760392956; 
	Tue, 11 Jul 2017 01:06:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Tue, 11 Jul 2017 01:06:02 -0700 (PDT)
In-Reply-To: <CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
References: <cover.1498569089.git.jussi.kukkonen@intel.com>
	<7f8b7c06040b1a12d4a85f82a2ec7c44617538a6.1498569089.git.jussi.kukkonen@intel.com>
	<CAC+thW2RzkC5YsXiHsgaB8Y8+b156YXwLi5TJnq2nzrPS=hBfA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 11 Jul 2017 11:06:02 +0300
Message-ID: <CAHiDW_FWXf4XJi9-KNMnb34DQ3rO-KuEKfPcveadrHzGdr0szA@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 08:06:34 -0000
Content-Type: multipart/alternative; boundary="001a114031ea78c3ee0554062d02"

--001a114031ea78c3ee0554062d02
Content-Type: text/plain; charset="UTF-8"

On 10 July 2017 at 17:47, Andrea Galbusera <gizero@gmail.com> wrote:

> During bisection the failing task changed from do_prepare_recipe_sysroot
> to do_compile with the log below. I have no idea if these things do relate
> themselves, but if not, I was not able to figure it out while bisecting.
>
> | In file included from /home/gizero/work/smartliving/
> distro/repo-master/build-poky/tmp/work/cortexa7hf-neon-vfpv4
> -poky-linux-gnueabi/gtk+3/3.22.16-r0/recipe-sysroot/usr/
> include/epoxy/egl.h:46:0,
> |                  from ../../../gtk+-3.22.16/gdk/wayl
> and/gdkglcontext-wayland.h:32,
> |                  from ../../../gtk+-3.22.16/gdk/wayl
> and/gdkglcontext-wayland.c:24:
> | ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c: In function
> 'gdk_wayland_gl_context_realize':
> | ../../../gtk+-3.22.16/gdk/wayland/gdkglcontext-wayland.c:179:43: error:
> expected expression before 'EGLContext'
> |                                          : EGL_NO_CONTEXT,
> |                                            ^
>

Your bisect seems valid: gtk+3 uses a define that comes from epoxy and was
changed in the update. The new define uses a EGL_CAST() macro that was
added to eglplatform.h at the same time. mesa has updated their
eglplatform.h so it all seems to work, but userland does not seem to have
this macro?

There's probably more to the story (since the error is not about implicit
EGL_CAST() as one would expect). My first suggestion would be that userland
eglplatform.h is updated to match current Khronos registry or at least to
include the EGL_CAST definition.

--001a114031ea78c3ee0554062d02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
0 July 2017 at 17:47, Andrea Galbusera <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:gizero@gmail.com" target=3D"_blank">gizero@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div><div class=3D"gmail-h5"><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><span style=3D"color:rgb(34,34,34)">During bisection the failing tas=
k changed from do_prepare_recipe_sysroot to do_compile with the log below. =
I have no idea if these things do relate themselves, but if not, I was not =
able to figure it out while bisecting.</span><br></div></div></div></div><d=
iv class=3D"gmail_extra"><br>| In file included from /home/gizero/work/smar=
tliving/<wbr>distro/repo-master/build-poky/<wbr>tmp/work/cortexa7hf-neon-vf=
pv4<wbr>-poky-linux-gnueabi/gtk+3/3.<wbr>22.16-r0/recipe-sysroot/usr/<wbr>i=
nclude/epoxy/egl.h:46:0,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../../../gtk=
+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayland.h:32,<br>|=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 from ../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayla=
nd.c:24:<br>| ../../../gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayland.c=
: In function &#39;gdk_wayland_gl_context_realiz<wbr>e&#39;:<br>| ../../../=
gtk+-3.22.16/gdk/wayl<wbr>and/gdkglcontext-wayland.c:<wbr>179:43: error: ex=
pected expression before &#39;EGLContext&#39;<br>|=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : EGL_NO_CONTEXT,<br>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br></d=
iv></div></blockquote><div><br></div><div>Your bisect seems valid: gtk+3 us=
es a define that comes from epoxy and was changed in the update. The new de=
fine uses a EGL_CAST() macro that was added to eglplatform.h at the same ti=
me. mesa has updated their eglplatform.h so it all seems to work, but userl=
and does not seem to have this macro?</div><div><br></div><div>There&#39;s =
probably more to the story (since the error is not about implicit EGL_CAST(=
) as one would expect). My first suggestion would be that userland eglplatf=
orm.h is updated to match current Khronos registry or at least to include t=
he EGL_CAST definition.</div><div><br></div><div><br></div></div></div></di=
v>

--001a114031ea78c3ee0554062d02--
