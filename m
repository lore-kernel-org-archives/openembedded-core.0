Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 15A92748CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 22:55:25 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id v8-v6so3402610oie.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VyoHsUGAY+bdEAx0h9++5kNnIjOijY4Qv6zQwAJWjFs=;
	b=VKiHVnOKlwLfQR4Q6fjtHCUWO9333ZjXc0ekkJTvik++76QOeeZkI4qoCABTBWfODK
	/mfnhvNSYzEet8PL/n4V2PL0eETZqsYXRxeU9fDXfD46rOjwcsaDNnDIJAPnOT57e4Qj
	/x5Eg01iU2dbM7dkIZWYRCcLzVo0vMo47Vzkv/ZQ0EWtNdJJGAjhLAIZMGghqI6fJETX
	Zikz8RWGBte7M/B3y4JXfvzI0oKLkBSFekpdAHNU6tQCu5moaeI9ycQ4NNvXgVTf7FSx
	Oy/R1QV1XVH5A+2YLBdyxZRv0WfBWaIboPQ1NWNuPtGlcHIsHryYrhla5QC3rSUZF8KP
	52xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VyoHsUGAY+bdEAx0h9++5kNnIjOijY4Qv6zQwAJWjFs=;
	b=Jtljgmq/rtVYL4VoiR5VXwwRLdpn/R9P/RNhYICvwsPYsT+CHblHcB4W634x5smGf2
	aT24VnSiu574rQbbQ+sCDIdJppnNgeFDZnpYiXicSD7zxZG4J3r2G0rCdZ5Dj9ZZt+5L
	EG6032CVIsqjn5bvnx2eCjp07fsP+jYzc2LYlIP4/EOTl3kepvwJV6UQJPYxq15i2iul
	2dbu87PvjY63AcM2uUL2NBygau44FnF0ITDFXSuVTQdt+QJSEKmlyDsKdClR8Wk9m3p9
	thxuhk44odC7f+Vjz0TEBxZAIhPfhuUWhssarkkhL8x1T8vzii4XftwH735n51v7qQZA
	rloQ==
X-Gm-Message-State: APt69E2o4dGTEBpyG8We/kClrqYDtE17g9iZ3h2F/5MMC1u1yWw3pB4s
	Bgz9JiY3NX8oy+TvXnNBJBxhFAOpyv21VCTGax4=
X-Google-Smtp-Source: AAOMgpcEv/EUYH5kkjVrxoxKkC4q+nqUwpaJDBn+snrIukiD6LnY5h86XGPP3AoZ1Ijwc/eu4zfhffF7pOGDvYEPBF8=
X-Received: by 2002:aca:4782:: with SMTP id
	u124-v6mr322313oia.45.1530140127059; 
	Wed, 27 Jun 2018 15:55:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 15:55:26
	-0700 (PDT)
In-Reply-To: <CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
References: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
	<CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
	<CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Jun 2018 00:55:26 +0200
Message-ID: <CANNYZj-wJC5+w6e9qEQq4etBd0uWt8DZC2EMErkV2V44D-m5=w@mail.gmail.com>
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
X-List-Received-Date: Wed, 27 Jun 2018 22:55:26 -0000
Content-Type: text/plain; charset="UTF-8"

Sure, yes. Remember the [sumo] prefix.

Alex

2018-06-27 19:27 GMT+02:00 Michael Gloff <mgloff@emacinc.com>:
> Alex,
> Thanks. I looked into the patch [1], but it does not apply to gstreamer
> 1.12.x. After refreshing the patch, gstreamer1.0-plugins-bad does not build
> because of the move of some header files to plugins-base in 1.13. I noticed
> in the recipe:
>
> # GL/GLES header clash: both define the same thing, differently, on 32 bit
> x86
> EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
> EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
>
> I think the best thing to do it to turn off USE_GSTREAMER_GL for all
> architectures. Would a patch doing so be acceptable? I've verified that it
> will build with the _armv5 case.
>
> Thanks,
>
> Michael Gloff
>
> [1]
> https://bug784779.bugzilla-attachments.gnome.org/attachment.cgi?id=357732
>
> On Tue, Jun 26, 2018 at 2:24 PM, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>>
>> The bug refers to a gstreamer bug with patches, which you should probably
>> apply:
>> https://bugzilla.gnome.org/show_bug.cgi?id=784779
>>
>> Alex
>>
>> 2018-06-26 20:55 GMT+02:00 Michael Gloff <mgloff@emacinc.com>:
>> > I'm seeing the below errors when trying to build webkitgtk. I am using
>> > base
>> > poky distro on sumo branch without any extra layers with qemuarm
>> > machine. It
>> > looks similar to:
>> > https://bugs.webkit.org/show_bug.cgi?id=175127
>> > which reports that this was fixed upstream, but obviously not in 2.18.6.
>> > Does anyone know what the proper fix for this is or at least a work
>> > around?
>> > Thanks,
>> >
>> > Michael Gloff
>> >
>> > In file included from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:23,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GLContext.h:23,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:72:
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:
>> > At global scope:
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:468:19:
>> > error: conflicting declaration 'typedef ptrdiff_t GLsizeiptr'
>> >  typedef ptrdiff_t GLsizeiptr;
>> >                    ^~~~~~~~~~
>> > In file included from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:40:0,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gl.h:29,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:69:
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:75:25:
>> > note: previous declaration as 'typedef khronos_ssize_t GLsizeiptr'
>> >  typedef khronos_ssize_t GLsizeiptr;
>> >                          ^~~~~~~~~~
>> > In file included from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/gl.h:2055:0,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/OpenGLShims.h:23,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/ANGLEWebKitBridge.h:50,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GraphicsContext3D.h:28,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/GLContext.h:23,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:72:
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GL/glext.h:469:19:
>> > error: conflicting declaration 'typedef ptrdiff_t GLintptr'
>> >  typedef ptrdiff_t GLintptr;
>> >                    ^~~~~~~~
>> > In file included from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglapi.h:40:0,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstgl_fwd.h:26,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gl.h:29,
>> >                  from
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/webkitgtk-2.18.6/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamerBase.cpp:69:
>> >
>> > /home/mgloff/poky/build/tmp/work/armv5e-poky-linux-gnueabi/webkitgtk/2.18.6-r0/recipe-sysroot/usr/include/GLES3/gl3.h:76:26:
>> > note: previous declaration as 'typedef khronos_intptr_t GLintptr'
>> >  typedef khronos_intptr_t GLintptr;
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>
>

