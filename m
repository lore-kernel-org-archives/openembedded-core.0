Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id DE1747C89A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:52:08 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id v20so4204572otk.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jYnGXBvtx/PsV3U6sLf98RYOT3Vll4C6Uo07W2dotRY=;
	b=CtEL+rKekeoMNVXFqp/Npl4xFjO/qfHvaW5QCz+/mOuutIrH63cIDn1yuE02bd0jcZ
	WTMfCDWAwbQMpxBhgGVhCV5MZ7KHuAfd0qB/5kBfJ8d78oc/Y+oOdE3iaTZXY8c0qLAo
	2d5SwR2Urh0pX/oy2Cc6xE05JRmJtrO6tZnIc6XkOlwsu7Idint/Chtm6YKERU21xQ2N
	O1PnDI7HIQqkD3KDpmxzyb+/tyobtbzuJGIm8WRVhk2eRb6ZXM6B9rEiLvxliLOgmmXD
	VEnzf504m9+ps6VdZKSnWQR4ZWfIsC+2IfAIBkp751j44Ooumb2ai88KRu3VSKHOl7kV
	A4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jYnGXBvtx/PsV3U6sLf98RYOT3Vll4C6Uo07W2dotRY=;
	b=lkexpmww2zXhq0pVVN7UMUqCyORaCBCwRpUAzHLEX9fZ/RqGELpZKrK0WIGB+e8v/g
	qw/Qm/kp6tmGJQHY+/IcZHULz136ETf3kpJrTJHYRbFTHcmH8iKcQK1wlAXIFuMF7A5t
	YSSvE4G72LoTrmfgGrbGy7u/MIGWICRLCf1Eg1/49oFEWT/OXWmR9NT92snQwVmq6jy2
	AFxvFtKMsC5fBU33MUIN9WCajvQ2irJO4+PFZtcOI1+64etOhk9r+WH0nRPIVFjB0lJz
	Uv8IkUHOJuaLjE/WoZnfwK6PZb2ioeI5LSrV1ZuqbUHHfSw03NUfO3Uelb+gkxAKRtDB
	9kQw==
X-Gm-Message-State: AHQUAuZy96fU8OVSwAo9vULMuCFcqRN+lQKHwpEwpZMIka4jrjHgoBk9
	X95YWEs4dnWcSLB6trr6ZB/kWQA+wI3bNyFdz+A=
X-Google-Smtp-Source: AHgI3IYNmY6pArRb/DrWGl9wOScrr3xahw6DusTgvVyMPHi9x3r4MlPXU6Tn7XYg/m0cfi2ZjVkJpKOAykjPCGZv3lM=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr5648052otf.367.1550926329877; 
	Sat, 23 Feb 2019 04:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
	<6378eef56d799e4b91da708cc8fff92c0e4bc13e.camel@linuxfoundation.org>
	<10aa3afa4b558884e16f600954422435aa8a6023.camel@linuxfoundation.org>
In-Reply-To: <10aa3afa4b558884e16f600954422435aa8a6023.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Feb 2019 13:51:58 +0100
Message-ID: <CANNYZj-Q96NJ9eh-DxTHhCC0CFPtQ26jx2cJG3PkNdDYprDLGw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Sat, 23 Feb 2019 12:52:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Feb 2019 at 13:43, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-02-23 at 12:29 +0000, Richard Purdie wrote:
> > On Wed, 2019-02-20 at 21:10 +0100, Alexander Kanavin wrote:
> > > Drop autotools-specific patches.
> > >
> > > Rework jku's thumbnailer patch into meson configuration.
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > We've seen it before but its happened again:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/326
> >
> > I went into the failed build directory and ran "bitbake core-image-
> > sato -c testsdkext" and it succeeded so I'm not sure sure how we're
> > going to debug this one...
>
> From staring at the log, I think do_build_target_sysroot in build-
> sysroots.bb may need to depend on do_build_native_sysroot.
>
> They're both running at the same time and potentially racing?

I'm at the same time staring at this bit in pixbufcache.bbclass:

gdkpixbuf_complete() {
GDK_PIXBUF_FATAL_LOADER=1
${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
--update-cache || exit 1
}

DEPENDS_append_class-native = " gdk-pixbuf-native"
SYSROOT_PREPROCESS_FUNCS_append_class-native = " pixbufcache_sstate_postinst"

# See base.bbclass for the other half of this
pixbufcache_sstate_postinst() {
        mkdir -p ${SYSROOT_DESTDIR}${bindir}
        dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
        echo '#!/bin/sh' > $dest
        echo "${gdkpixbuf_complete}" >> $dest
        chmod 0755 $dest
}

It's all written for -native, yet the script that fails, resides in
tmp/sysroots/qemux86-64/usr/bin/postinst-gdk-pixbuf-native (e.g. the
target sysroot which is racing with the native one). Why is it even
there?
I haven't written this code :) and haven't really seen it before, but
this might be a lead.

Alex

