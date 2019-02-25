Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id B060E7CA5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:09:11 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id o6so10813750qtk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e9/xqlbpedIT+csqvY752sRcLhuxm+Bwshno19rHkyA=;
	b=fbsstzVzyrVg1Y7KdoZt0ye+OCeEDE5Yb9p5qcmIH+Giq+RnkfMe8TiX9YGAY81ArF
	EqS05s/i4eYYR74p0P9eIC/rkRzsqF9Ov5u678BCSU8QNC6aD1M8gSgs+EQFah8RFS+z
	Dhv2dbdDn4JBB2C/qqbNNmMnLXCR185w7QgD2qzEiv+qqlxCqpMqfuC3SmXsEkNIx/dC
	UrLXwKNRNa46tzAy87s+ujlA8xvBMLZJodx5T7D2V17RCbua+CXLSuND2TgslVACb63F
	g099iJwvOZn1YzGrhFL5664nigfE25sCZxPUNsp58XsyvAp2YFdN1jJRKNDHbMa389Zb
	IZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e9/xqlbpedIT+csqvY752sRcLhuxm+Bwshno19rHkyA=;
	b=GY+eBqY0Wornua4GrHdv56QiyJztyCEoXMKs77whfLW5v3R4eXp+dRUjyVLfQEc8qR
	dk4a3ypjfunX7lVQWotEyTL1p4YOhkGnT4iia7sBShwp8Qz9VyiHhNAzPUjPNPjjt8If
	5A29MgPCQ+FrtIIgKtEeEeK4oQ8xMu0xHMi9lPq2+sLGJH3/EhMsODhz9TO78MGczOfw
	KX4N6S7uynTjDe/NTsf8fsay0zXOElxYiXRxmirKu2wWTqeAsue6OHqxVxtvvXICpPBo
	U/88nPUZwgRW2xYYkUh8tZ+aJsfVuBHiCT02uSvOJW2Czo88JXjfjdmO7+4MvEx2jlH+
	HLBg==
X-Gm-Message-State: AHQUAuYrIlakKAYXeOUtBCw4EDqS71nP5phzXWMPJPK6WC46Zq6AbAdN
	RXWhGTTSn08vuGgFMWzjH4Uba+qRa8T5z5BxBEc=
X-Google-Smtp-Source: AHgI3IYnO72wsBdM0x5HwQ7mKpA6mXmNzSGCq45wTUnotpgc5TWsRDCXgeLKUr1CQl41jq8x8iQArr/F4c02k/haW3g=
X-Received: by 2002:a0c:94cf:: with SMTP id k15mr14139195qvk.55.1551107352440; 
	Mon, 25 Feb 2019 07:09:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<296658f75576781b5e8f36c95bec204a65482af7.1550845989.git.alex.kanavin@gmail.com>
	<3cab827a44a031abbffa58de513230d100d5ebe4.camel@linuxfoundation.org>
	<CANNYZj-egKt=s0SYG2NN3kV2LnPqg9Jb9UQ25LOGrLjhfZVQUg@mail.gmail.com>
In-Reply-To: <CANNYZj-egKt=s0SYG2NN3kV2LnPqg9Jb9UQ25LOGrLjhfZVQUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2019 07:08:46 -0800
Message-ID: <CAMKF1srXWYu1J8WX11aCx0sQ3+yV40WNvcwwg+28RBZwU_4UFQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Mon, 25 Feb 2019 15:09:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 4:52 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 25 Feb 2019 at 12:02, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2019-02-22 at 15:33 +0100, Alexander Kanavin wrote:
> > > Except for ming32/darwin, which do not support them.
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> > > devtools/qemu/qemu.inc
> > > index c127434b020..95e9e0ede77 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -74,15 +74,15 @@ PACKAGECONFIG ??= " \
> > >      fdt sdl kvm \
> > >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> > >  "
> > > -PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> > > -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> > > +PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
> > > +PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
> > >
> > >  # Handle distros such as CentOS 5 32-bit that do not have kvm
> > > support
> > >  PACKAGECONFIG_class-native_remove = "${@'kvm' if not
> > > os.path.exists('/usr/include/linux/kvm.h') else ''}"
> > >
> > > -# Disable kvm on targets that do not support it
> > > -PACKAGECONFIG_remove_darwin = "kvm"
> > > -PACKAGECONFIG_remove_mingw32 = "kvm"
> > > +# Disable kvm/virgl/mesa on targets that do not support it
> > > +PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
> > > +PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
> >
> > Sorry, I just spotted this. Please don't use _remove in OE-Core. Can we
> > rearrange this so we don't need to use remove?
> >
> > I appreciate there are other users that have crept in but I'd like to
> > see them gone too...
>
> I'm actually unsure how to override the
> PACKAGECONFIG_append_pn-qemu-native = " gtk+"
> set in local.conf without using _remove.
>
> (we do not support gtk+ on mingw, and I guess darwin too).
>

iirc there are overrides for mingw which could be used in local.conf
to narrow this packageconfig setting

> We can rearrange this, enable/not enable gtk+ directly in the recipe,
> and drop the qemu related lines from local.conf altogether, if you're
> okay with that.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

