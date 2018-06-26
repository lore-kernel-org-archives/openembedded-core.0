Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id EE4ED745C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 19:24:28 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id u6-v6so12108172otk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XPrFaJXkXBx7UvOlaNoyPA3mVT7jDSB7AWAKX//23JI=;
	b=a0UNKca1WOWJsAlNeeX5XFktsbTuVDkqM2EdvTIsPvDps1VFTLPzfG/2zJWOtzqxc/
	IQTnM4X3K94ZyxVPmm+KO/ru1S+GE6HIk2KrbA0//hBvZBTHp6EIL/EUfsc4hG9C9G6L
	z8/etQruF33E5Ysxxaha6DWs/QXTbdGcYQF0ScH+B2ZZ9sZ8fwqB5Zo9id+YaroCQPwW
	nlm4C5PFpAN/dFEz+6XOZ2g02V0v+Cg956wBAHzzZxWWBqvO9rc/PE/lo7XX88W5plXN
	cmnVRkTQS0A7iLQGXBPbzf9IO8q4DBqjtR8QDPEY3uRFtUVElCZ1lDC0A1sYg6B7X7mr
	dJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XPrFaJXkXBx7UvOlaNoyPA3mVT7jDSB7AWAKX//23JI=;
	b=eOc4ltU3UO5rAaYZQ4nr+oTyhNYwjno9kUaV0aRPriDfZdT+ZMLFGhSc63ZeVbUCMD
	s1asZ8W+7TrUyLORr4OqU58G0uwb+SfYTJv8WABfWJTnbRFA3bxyAbctl0q5O5waJ/uk
	2R/u9qwq2HU4vouXPQQrKtkTs7GWIG+biA0AS7neFsn5wBRHxw5mgFi0P39b6TAuxZsO
	a918KVoj6nILj6AmniLbVug8dJsAEs3TXMmwYkmk/9jGHkt6Oaswu/IEM+xkFHL/8zIw
	CbmdPkKcETv07AqiHlHSEql2uFwkANeQRur6zoRpVFwUYxYoDREr9AugndHHgRVzzwP6
	cUbA==
X-Gm-Message-State: APt69E2d5TY5ELz2qvH9gfjsxFtJlpdqFYUEr64tP5tPLeArtCwzwtxq
	M9qOZS+RcxgykiuC1MlGgZvNL6iZ6ud4RoSDII0=
X-Google-Smtp-Source: AAOMgpev0m/R7sTWDqFbAxpgNgi9nXsYJPnMeELDHhIXl9gOqjYDIZxfg5FMJwT+YmQqlvk3x1lsk91Zv47xsRbPfwI=
X-Received: by 2002:a9d:1f3b:: with SMTP id
	x56-v6mr1509981otd.369.1530041069962; 
	Tue, 26 Jun 2018 12:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 12:24:29
	-0700 (PDT)
In-Reply-To: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
References: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Jun 2018 21:24:29 +0200
Message-ID: <CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
To: Michael Gloff <mgloff@emacinc.com>
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
X-List-Received-Date: Tue, 26 Jun 2018 19:24:29 -0000
Content-Type: text/plain; charset="UTF-8"

The bug refers to a gstreamer bug with patches, which you should probably apply:
https://bugzilla.gnome.org/show_bug.cgi?id=784779

Alex

2018-06-26 20:55 GMT+02:00 Michael Gloff <mgloff@emacinc.com>:
> I'm seeing the below errors when trying to build webkitgtk. I am using base
> poky distro on sumo branch without any extra layers with qemuarm machine. It
> looks similar to:
> https://bugs.webkit.org/show_bug.cgi?id=175127
> which reports that this was fixed upstream, but obviously not in 2.18.6.
> Does anyone know what the proper fix for this is or at least a work around?
> Thanks,
>
> Michael Gloff
>
> In file included from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:23,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GLContext.h:23,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:72:
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:
> At global scope:
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:468:19:
> error: conflicting declaration 'typedef ptrdiff_t GLsizeiptr'
>  typedef ptrdiff_t GLsizeiptr;
>                    ^~~~~~~~~~
> In file included from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:40:0,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gl.h:29,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:69:
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:75:25:
> note: previous declaration as 'typedef khronos_ssize_t GLsizeiptr'
>  typedef khronos_ssize_t GLsizeiptr;
>                          ^~~~~~~~~~
> In file included from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:23,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GLContext.h:23,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:72:
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:469:19:
> error: conflicting declaration 'typedef ptrdiff_t GLintptr'
>  typedef ptrdiff_t GLintptr;
>                    ^~~~~~~~
> In file included from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:40:0,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gl.h:29,
>                  from
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:69:
> /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:76:26:
> note: previous declaration as 'typedef khronos_intptr_t GLintptr'
>  typedef khronos_intptr_t GLintptr;
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

