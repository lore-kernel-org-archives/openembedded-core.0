Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A89287BFB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:31:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y15so8509794wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 07:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=5IXyRSVQeJYpRUsvNdVyH1am7QB4zsEHkgpuBwF10cA=;
	b=gGEwJYS5bqmL4fDo5UqE+T5YAYCef5bGCfOlgeCU0qjANQRJFocQsArbYLt2YhFBk1
	rdEJUB+P8edb9IEOdgtLnHYjTqfPW3u5BPb4KS15Pzd79azcTJKpbfztcS7jEHzl2Dmk
	wKP91Fs4EqtHEAxDnyGQt+ra37qqslnIn8Vgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5IXyRSVQeJYpRUsvNdVyH1am7QB4zsEHkgpuBwF10cA=;
	b=YsV1lCCKFzckvcfCRavgd87aYrLiXzcmFQ3yI4I4xp437JqiWbvny5GP/dje4Ytc6C
	+RnjHigTPbxNPI7JHkRuF2Se2SWtnwSy5ptBFKCzuoimLKQWMfV7TinkaVRLEofdjGK+
	v9MmxHI7ow6Lw+gTtJBSRK9cFHB+scxjB3C76Ws8Rc8w70qjP+QOW5CZPx9O5JIcM3Ok
	ckKby/pr+abXT3vVs+SJtrjRJsF9cbQFY2t9BCdWvnsT4CCKB+dw0c9jMly/50lxHzbp
	I2pw99WZEm6B0dLZmoTefOEx1zQRjSMppz30+j875MjugKHruKddCC51EDHr5EIHm8pG
	iKsQ==
X-Gm-Message-State: AHQUAuYe96ZCBbiVlMyqTXpgqmhNbv3X/3bB6RU9m1Z7XxRFPuI9z5Eq
	TWwgDdjnvZ3w7SaavUyUfXgSIA==
X-Google-Smtp-Source: AHgI3Ib4zIKMpR83V2zl/XFqqXpcxcxM06YazhiBH+gdMao21cet1nG7K5K52vNzsHnZUDVlKJmNuQ==
X-Received: by 2002:a1c:9693:: with SMTP id y141mr11469455wmd.33.1551108710172;
	Mon, 25 Feb 2019 07:31:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y20sm11741770wmi.34.2019.02.25.07.31.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 25 Feb 2019 07:31:49 -0800 (PST)
Message-ID: <531071f0314445751bf4afb0c0be273a76cebef5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Mon, 25 Feb 2019 15:31:48 +0000
In-Reply-To: <01e0cbf362ad949ea1ccac98d31e44d1c601dc6f.camel@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<296658f75576781b5e8f36c95bec204a65482af7.1550845989.git.alex.kanavin@gmail.com>
	<3cab827a44a031abbffa58de513230d100d5ebe4.camel@linuxfoundation.org>
	<CANNYZj-egKt=s0SYG2NN3kV2LnPqg9Jb9UQ25LOGrLjhfZVQUg@mail.gmail.com>
	<01e0cbf362ad949ea1ccac98d31e44d1c601dc6f.camel@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 25 Feb 2019 15:31:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-25 at 09:29 -0600, Joshua Watt wrote:
> On Mon, 2019-02-25 at 13:52 +0100, Alexander Kanavin wrote:
> > On Mon, 25 Feb 2019 at 12:02, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2019-02-22 at 15:33 +0100, Alexander Kanavin wrote:
> > > > Except for ming32/darwin, which do not support them.
> > > > 
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> > > > b/meta/recipes-
> > > > devtools/qemu/qemu.inc
> > > > index c127434b020..95e9e0ede77 100644
> > > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > > @@ -74,15 +74,15 @@ PACKAGECONFIG ??= " \
> > > >      fdt sdl kvm \
> > > >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> > > >  "
> > > > -PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> > > > -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> > > > +PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer
> > > > glx"
> > > > +PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer
> > > > glx"
> > > > 
> > > >  # Handle distros such as CentOS 5 32-bit that do not have kvm
> > > > support
> > > >  PACKAGECONFIG_class-native_remove = "${@'kvm' if not
> > > > os.path.exists('/usr/include/linux/kvm.h') else ''}"
> > > > 
> > > > -# Disable kvm on targets that do not support it
> > > > -PACKAGECONFIG_remove_darwin = "kvm"
> > > > -PACKAGECONFIG_remove_mingw32 = "kvm"
> > > > +# Disable kvm/virgl/mesa on targets that do not support it
> > > > +PACKAGECONFIG_remove_darwin = "kvm virglrenderer glx gtk+"
> > > > +PACKAGECONFIG_remove_mingw32 = "kvm virglrenderer glx gtk+"
> > > 
> > > Sorry, I just spotted this. Please don't use _remove in OE-Core.
> > > Can we
> > > rearrange this so we don't need to use remove?
> > > 
> > > I appreciate there are other users that have crept in but I'd
> > > like
> > > to
> > > see them gone too...
> > 
> > I'm actually unsure how to override the
> > PACKAGECONFIG_append_pn-qemu-native = " gtk+"
> > set in local.conf without using _remove.
> 
> I don't think I quite follow why this is an issue, mingw is not a
> supported build host AFAIK, so the "-native" means it shouldn't be a
> problem (e.g. "native" should never mean "mingw")? Not sure about
> darwin though.

I wasn't quite seeing this either at first. native isn't the problem,
its the nativesdk variant...

Cheers,

Richard


