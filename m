Return-Path: <mgloff@emacinc.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4728B74C1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 17:28:30 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id d23-v6so2372406qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GddkTHoQ9ipdaVOumgvm1zb+N6auL8D4YAZj2VrTYS4=;
	b=tNiVSue3ioYsPdGdI5I4oG7rI6ddeepW9HKs8cm4Zpay/viIHz5gdYNRoe3WmFHUp1
	pPm3C6AJA8PkAwHMd/S+Jf70Hg8Zvq2Lq7bTA2CbnTSwCskpGtPvAsHf1lDYBasYnRn3
	pZ38pJK3n6kCxzlNfwq5RrGmisMb+vQkHnU/6YStLhHCkxpPLrLmLkew1frPEGIllBcn
	D7Np3CBfOvKTuMbhWXWR+6UR6zDXlAVcc+q2MzpUgZitqVokk/TiI2CmYY7h5ZS9fnyM
	osKBPHidhlMhCbYFOZvcSf+5BHuU4POuwbdLn8m6ATCTx6w59T8dAw0QniCLYi7FU5Al
	/OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GddkTHoQ9ipdaVOumgvm1zb+N6auL8D4YAZj2VrTYS4=;
	b=MuB15tZd0PNlJgNYFpydPeDxsZgvQhwWqN4ob5lZlCQg2Wtklrp+nBAxWIgCRwZ5Ju
	5MwXcxzEQDR4VQZgdJDtueJo3J7JX/pEupCM+7AjgRZS0KHiMZOURD+j1wHyQm4SChKi
	Pkeqi6utNeAXCrywqH9hb3OG9BlNxztNhMI2AiVTa2WgVizzceqVeuleNJWYPLeM/Wqj
	zNJ7feu/UiqQv4CB+4Z2ASuXO6seTDxxNg8sUwIQS9n2xIJ2uxUQU/+k5sCZ7Hzuf11o
	5yWbQVJgDvV4Mc+5eVfUS99pnBjj+EDDTRh0osVEFhWMAo/rGkw8XTALZwxVb/0fHirr
	3WAA==
X-Gm-Message-State: APt69E11KXjhA44dCmE9ttbYrsgVlvjM+NyUehCQ4CEJVwSbabiufVRD
	KGNAFnLvuHup5eKnP+unMewrJTCgJcoi+1J+mAJEsA==
X-Google-Smtp-Source: AAOMgpdVDG7rPU/SuNPvylzEfz83l0FL8MMLhwDZ1581c8mycyjhCwqIWTUH2dFz2qWlbnzUiJjCl13/zaVxRR7Y3T0=
X-Received: by 2002:a0c:fad0:: with SMTP id p16-v6mr6221921qvo.8.1530120510936;
	Wed, 27 Jun 2018 10:28:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2f03:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 10:27:50
	-0700 (PDT)
In-Reply-To: <CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
References: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
	<CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
Date: Wed, 27 Jun 2018 12:27:50 -0500
Message-ID: <CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: Sumo webkitgtk fails to compile
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
X-List-Received-Date: Wed, 27 Jun 2018 17:28:30 -0000
Content-Type: multipart/alternative; boundary="00000000000084b04f056fa2f149"

--00000000000084b04f056fa2f149
Content-Type: text/plain; charset="UTF-8"

Alex,
Thanks. I looked into the patch [1], but it does not apply to gstreamer
1.12.x. After refreshing the patch, gstreamer1.0-plugins-bad does not build
because of the move of some header files to plugins-base in 1.13. I noticed
in the recipe:

# GL/GLES header clash: both define the same thing, differently, on 32 bit
x86
EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "

I think the best thing to do it to turn off USE_GSTREAMER_GL for all
architectures. Would a patch doing so be acceptable? I've verified that it
will build with the _armv5 case.

Thanks,

Michael Gloff

[1]
https://bug784779.bugzilla-attachments.gnome.org/attachment.cgi?id=357732

On Tue, Jun 26, 2018 at 2:24 PM, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> The bug refers to a gstreamer bug with patches, which you should probably
> apply:
> https://bugzilla.gnome.org/show_bug.cgi?id=784779
>
> Alex
>
> 2018-06-26 20:55 GMT+02:00 Michael Gloff <mgloff@emacinc.com>:
> > I'm seeing the below errors when trying to build webkitgtk. I am using
> base
> > poky distro on sumo branch without any extra layers with qemuarm
> machine. It
> > looks similar to:
> > https://bugs.webkit.org/show_bug.cgi?id=175127
> > which reports that this was fixed upstream, but obviously not in 2.18.6.
> > Does anyone know what the proper fix for this is or at least a work
> around?
> > Thanks,
> >
> > Michael Gloff
> >
> > In file included from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/OpenGLShims.h:23,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/GraphicsContext3D.h:28,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/GLContext.h:23,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBas
> e.cpp:72:
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:
> > At global scope:
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:468:19:
> > error: conflicting declaration 'typedef ptrdiff_t GLsizeiptr'
> >  typedef ptrdiff_t GLsizeiptr;
> >                    ^~~~~~~~~~
> > In file included from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/
> gstreamer-1.0/gst/gl/gstglapi.h:40:0,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/
> gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/
> gstreamer-1.0/gst/gl/gl.h:29,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBas
> e.cpp:69:
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:75:25:
> > note: previous declaration as 'typedef khronos_ssize_t GLsizeiptr'
> >  typedef khronos_ssize_t GLsizeiptr;
> >                          ^~~~~~~~~~
> > In file included from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/OpenGLShims.h:23,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/GraphicsContext3D.h:28,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/GLContext.h:23,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBas
> e.cpp:72:
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:469:19:
> > error: conflicting declaration 'typedef ptrdiff_t GLintptr'
> >  typedef ptrdiff_t GLintptr;
> >                    ^~~~~~~~
> > In file included from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/
> gstreamer-1.0/gst/gl/gstglapi.h:40:0,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/
> gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/
> gstreamer-1.0/gst/gl/gl.h:29,
> >                  from
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/
> WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBas
> e.cpp:69:
> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-
> gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:76:26:
> > note: previous declaration as 'typedef khronos_intptr_t GLintptr'
> >  typedef khronos_intptr_t GLintptr;
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--00000000000084b04f056fa2f149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Alex,</div><div>Thanks. I looked into the patch [1], =
but it does not apply to gstreamer 1.12.x. After refreshing the patch, gstr=
eamer1.0-plugins-bad does not build because of the move of some header file=
s to plugins-base in 1.13. I noticed in the recipe:</div><div><br></div><di=
v># GL/GLES header clash: both define the same thing, differently, on 32 bi=
t x86<br>EXTRA_OECMAKE_append_x86 =3D &quot; -DUSE_GSTREAMER_GL=3DOFF &quot=
;<br>EXTRA_OECMAKE_append_x86-x32 =3D &quot; -DUSE_GSTREAMER_GL=3DOFF &quot=
;</div><div><br></div><div>I think the best thing to do it to turn off USE_=
GSTREAMER_GL for all architectures. Would a patch doing so be acceptable? I=
&#39;ve verified that it will build with the _armv5 case.</div><div><br></d=
iv><div>Thanks,<br></div><div><br></div><div>Michael Gloff</div><div><br></=
div><div>[1] <a href=3D"https://bug784779.bugzilla-attachments.gnome.org/at=
tachment.cgi?id=3D357732">https://bug784779.bugzilla-attachments.gnome.org/=
attachment.cgi?id=3D357732</a><br></div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Tue, Jun 26, 2018 at 2:24 PM, Alexander Kan=
avin <span dir=3D"ltr">&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">The bug refers to a gstreamer bug with patches, which you s=
hould probably apply:<br>
<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D784779" rel=3D"nore=
ferrer" target=3D"_blank">https://bugzilla.gnome.org/<wbr>show_bug.cgi?id=
=3D784779</a><br>
<br>
Alex<br>
<br>
2018-06-26 20:55 GMT+02:00 Michael Gloff &lt;<a href=3D"mailto:mgloff@emaci=
nc.com">mgloff@emacinc.com</a>&gt;:<br>
&gt; I&#39;m seeing the below errors when trying to build webkitgtk. I am u=
sing base<br>
&gt; poky distro on sumo branch without any extra layers with qemuarm machi=
ne. It<br>
&gt; looks similar to:<br>
&gt; <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D175127" rel=3D"no=
referrer" target=3D"_blank">https://bugs.webkit.org/show_<wbr>bug.cgi?id=3D=
175127</a><br>
&gt; which reports that this was fixed upstream, but obviously not in 2.18.=
6.<br>
&gt; Does anyone know what the proper fix for this is or at least a work ar=
ound?<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Michael Gloff<br>
&gt;<br>
&gt; In file included from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/GL/<wbr>gl.h:2055:0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>OpenGLShims.h:23,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>ANGLEWebKitBridge.h:50,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>GraphicsContext3D.h:28,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>GLContext.h:23,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>gstreamer/<wbr>MediaPlayerPrivateGStreamerBas<wbr>e.cpp:72:<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/GL/<wbr>glext.h:<br>
&gt; At global scope:<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/GL/<wbr>glext.h:468:19:<=
br>
&gt; error: conflicting declaration &#39;typedef ptrdiff_t GLsizeiptr&#39;<=
br>
&gt;=C2=A0 typedef ptrdiff_t GLsizeiptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
~~~~~~~~~<br>
&gt; In file included from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>gstreamer-1.0/gst/g=
l/gstglapi.<wbr>h:40:0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>gstreamer-1.0/gst/g=
l/gstgl_<wbr>fwd.h:26,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>gstreamer-1.0/gst/g=
l/gl.h:29,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>gstreamer/<wbr>MediaPlayerPrivateGStreamerBas<wbr>e.cpp:69:<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>GLES3/gl3.h:75:25:<=
br>
&gt; note: previous declaration as &#39;typedef khronos_ssize_t GLsizeiptr&=
#39;<br>
&gt;=C2=A0 typedef khronos_ssize_t GLsizeiptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
&gt; In file included from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/GL/<wbr>gl.h:2055:0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>OpenGLShims.h:23,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>ANGLEWebKitBridge.h:50,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>GraphicsContext3D.h:28,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>GLContext.h:23,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>gstreamer/<wbr>MediaPlayerPrivateGStreamerBas<wbr>e.cpp:72:<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/GL/<wbr>glext.h:469:19:<=
br>
&gt; error: conflicting declaration &#39;typedef ptrdiff_t GLintptr&#39;<br=
>
&gt;=C2=A0 typedef ptrdiff_t GLintptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
~~~~~~~<br>
&gt; In file included from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>gstreamer-1.0/gst/g=
l/gstglapi.<wbr>h:40:0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>gstreamer-1.0/gst/g=
l/gstgl_<wbr>fwd.h:26,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>gstreamer-1.0/gst/g=
l/gl.h:29,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>webkitgtk-2.18.6/Source/<wbr>WebCore/platform/graph=
ics/<wbr>gstreamer/<wbr>MediaPlayerPrivateGStreamerBas<wbr>e.cpp:69:<br>
&gt; /home/mgloff/poky/build/tmp/<wbr>work/armv5e-poky-linux-<wbr>gnueabi/w=
ebkitgtk/2.18.6-r0/<wbr>recipe-sysroot/usr/include/<wbr>GLES3/gl3.h:76:26:<=
br>
&gt; note: previous declaration as &#39;typedef khronos_intptr_t GLintptr&#=
39;<br>
&gt;=C2=A0 typedef khronos_intptr_t GLintptr;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--00000000000084b04f056fa2f149--
