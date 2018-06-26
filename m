Return-Path: <mgloff@emacinc.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6A26772EB7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 18:55:45 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id u21-v6so4528416qku.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=/iapEoOk2+3BN8NswUOOjHI4c3GgQJsquyUGXH/Jv5U=;
	b=LCADu+pjgj40gv73Yw08bYNiahcxeUtAunJ7QjWMJXoBx0eLA8VUX9q+EURjkcK1I7
	c6ap6cNwp0C8WTqF9GT7CWqKRM0sogLOIisSiuRYEHZxBm+s/c4DutMuIjsWZj98Opq6
	S9aCy2PAPdWuCd2Z7YLHwk8/+mAGpS5sCPb4sqUvNICZzfA68gOne9I7T2NerOdsRLPo
	ojmFozJdAz6xGDOPez/nIAXqsjiVAkERXhTR86leyIzxzUZsCGsOAFniVb9fjvo4hzrZ
	RatrO2x0kYrrjNMvGERuA+a0x0r5FfgG96FtyqKbZnMpuXXUnwvQN8bSz+EwIkupzwoR
	hPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/iapEoOk2+3BN8NswUOOjHI4c3GgQJsquyUGXH/Jv5U=;
	b=MMmwvn/KAFQwm1ogAk23UsaQsBiNLNfNNLwxlxxIzaZUAcmpOqKfhslfhx9pnCCwh+
	NROd33mVxOx6xqn/bfMKgK/dtk1RVnIzXab6g/rT2zh1TfPC6b4/zLyNrq7xkK8pMuXA
	etNxCWjfdmKJsXW2oO+YUc//f51nOMxHO8j7Ic5bdpsXaeTnq1jLmsEhsmnSL4ZA+A8l
	1wOmPAWFxpkbXlo4aFNZKq2bG+qkCfs5OJfi2bZakKaGRjoJxYMqYghxKtNYNJJeToXq
	S2+vgE9pk5c2ba60UBgB9uC12tvT0CpwY4meug93GRd83rvpnrfRN8kEzJQnaDxY90Sq
	uqkw==
X-Gm-Message-State: APt69E2E1R68fw0cpdIsaAqnvClm+bLaOLLdSZrrw4AJ8pftRiAHLuoV
	nsHu1zRJSi1pZ5AvoqFvZ50pM6Vqhyq236bczRjQpnZc
X-Google-Smtp-Source: AAOMgpelLCev8G4kR7T8GSf/yJMauQsY4q1LIulYukkPBA6pPZfYcqTfTerlfQv5s/oyAAcEKz4n/mnfVjXr6mvIJ14=
X-Received: by 2002:ae9:c10d:: with SMTP id
	z13-v6mr2446207qki.359.1530039346033; 
	Tue, 26 Jun 2018 11:55:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2f03:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 11:55:05
	-0700 (PDT)
From: Michael Gloff <mgloff@emacinc.com>
Date: Tue, 26 Jun 2018 13:55:05 -0500
Message-ID: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Sumo webkitgtk fails to compile
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
X-List-Received-Date: Tue, 26 Jun 2018 18:55:45 -0000
Content-Type: multipart/alternative; boundary="000000000000b69226056f900bb8"

--000000000000b69226056f900bb8
Content-Type: text/plain; charset="UTF-8"

I'm seeing the below errors when trying to build webkitgtk. I am using base
poky distro on sumo branch without any extra layers with qemuarm machine.
It looks similar to:
https://bugs.webkit.org/show_bug.cgi?id=175127
which reports that this was fixed upstream, but obviously not in 2.18.6.
Does anyone know what the proper fix for this is or at least a work around?
Thanks,

Michael Gloff

In file included from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:23,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GLContext.h:23,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:72:
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:
At global scope:
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:468:19:
error: conflicting declaration 'typedef ptrdiff_t GLsizeiptr'
 typedef ptrdiff_t GLsizeiptr;
                   ^~~~~~~~~~
In file included from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:40:0,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gl.h:29,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:69:
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:75:25:
note: previous declaration as 'typedef khronos_ssize_t GLsizeiptr'
 typedef khronos_ssize_t GLsizeiptr;
                         ^~~~~~~~~~
In file included from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:23,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GLContext.h:23,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:72:
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:469:19:
error: conflicting declaration 'typedef ptrdiff_t GLintptr'
 typedef ptrdiff_t GLintptr;
                   ^~~~~~~~
In file included from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:40:0,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gl.h:29,
                 from
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:69:
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:76:26:
note: previous declaration as 'typedef khronos_intptr_t GLintptr'
 typedef khronos_intptr_t GLintptr;

--000000000000b69226056f900bb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m seeing the below errors when trying to build =
webkitgtk. I am using base poky distro on sumo branch without any extra lay=
ers with qemuarm machine. It looks similar to:</div><div><a href=3D"https:/=
/bugs.webkit.org/show_bug.cgi?id=3D175127">https://bugs.webkit.org/show_bug=
.cgi?id=3D175127</a><br></div><div>which reports that this was fixed upstre=
am, but obviously not in 2.18.6.</div><div>Does anyone know what the proper=
 fix for this is or at least a work around?</div><div>Thanks,</div><div><br=
></div><div>Michael Gloff</div><div><br></div><div>In file included from /h=
ome/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r=
0/recipe-sysroot/usr/include/GL/gl.h:2055:0,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from =
/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6=
-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:23,<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp/work/armv5e-poky-lin=
ux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/gra=
phics/ANGLEWebKitBridge.h:50,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/po=
ky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2=
.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueab=
i/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GLC=
ontext.h:23,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp/wo=
rk/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/We=
bCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:72:<b=
r>/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18=
.6-r0/recipe-sysroot/usr/include/GL/glext.h: At global scope:<br>/home/mglo=
ff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe=
-sysroot/usr/include/GL/glext.h:468:19: error: conflicting declaration &#39=
;typedef ptrdiff_t GLsizeiptr&#39;<br>=C2=A0typedef ptrdiff_t GLsizeiptr;<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~<br>In file included from /h=
ome/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r=
0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:40:0,<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-=
gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl=
/gstgl_fwd.h:26,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp=
/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/incl=
ude/gstreamer-1.0/gst/gl/gl.h:29,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgl=
off/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webki=
tgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGS=
treamerBase.cpp:69:<br>/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-g=
nueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:75:25: no=
te: previous declaration as &#39;typedef khronos_ssize_t GLsizeiptr&#39;<br=
>=C2=A0typedef khronos_ssize_t GLsizeiptr;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~<br>In file included f=
rom /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.=
18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 from /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/=
2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:2=
3,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp/work/armv5e-po=
ky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platfo=
rm/graphics/ANGLEWebKitBridge.h:50,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgl=
off/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webki=
tgtk-2.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-=
gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphi=
cs/GLContext.h:23,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/=
tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Sou=
rce/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp=
:72:<br>/home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgt=
k/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:469:19: error: conflictin=
g declaration &#39;typedef ptrdiff_t GLintptr&#39;<br>=C2=A0typedef ptrdiff=
_t GLintptr;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~<br>In file inc=
luded from /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webki=
tgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:4=
0:0,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/poky/build/tmp/work/armv5e=
-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreame=
r-1.0/gst/gl/gstgl_fwd.h:26,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /home/mgloff/po=
ky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysr=
oot/usr/include/gstreamer-1.0/gst/gl/gl.h:29,<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fr=
om /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.1=
8.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPla=
yerPrivateGStreamerBase.cpp:69:<br>/home/mgloff/poky/build/tmp/work/armv5e-=
poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3=
.h:76:26: note: previous declaration as &#39;typedef khronos_intptr_t GLint=
ptr&#39;<br>=C2=A0typedef khronos_intptr_t GLintptr;<br></div></div>

--000000000000b69226056f900bb8--
