Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.3318.1632452577712695752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 20:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p/pgfm97;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id b65so26177128qkc.13
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 20:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WSO3GI/9G6MQhIWczihteuA1WHmtHZHFoC0UQDxMmWo=;
        b=p/pgfm97rWSthUY6LFliGnePhRpLfjSOF1fqgodiHmODsrGYV/6XM04DAcWQ/LYV0a
         lox/1jj5NAUti7oMuQZu22C8dTPpJ218+3Cugb+bHTT6LYATv967fzbyPOM1VnoXfiJW
         ro1NADZKjcnp7pM83Fo8tdFoFkWBZmkEZ2HQSBtvszB8bXwUjHKATJVveXNnTWSIr/cN
         9GFkuASTklVpKsBzmLP1C+sRbLT3VkEndI7I0X2NTjr72fle9HavWHCPihpBRF81mMRz
         XII7H43OnYpiIC33PZ8zZiYntkRgRku/mVxj4arN2Vc0NWkpc+ISGhGPYN5ODFiR+RnP
         hX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WSO3GI/9G6MQhIWczihteuA1WHmtHZHFoC0UQDxMmWo=;
        b=wF92JSQYceMk45GP0osESZxMtnSZRBkg6cJSuJ5OATUfpcnj9s/vVcLYdLsJkkPdze
         Os9lNxu13ZD9jkgfnM2eqXZiqs4XnO+7XhefOS5q8Rt2DxJ0dH7OD6mUDdrlHw6YB3/L
         tLRyFAPIH8s8pz2fVoGZ542VERxqS4EVxoJ+ETPsa+SAVy6fxWzzShkfd9/ccAs57Jch
         JBgxyfaNoIIALa2xlw5K1Z5fzCYkryfUj/EKPhezkSw5J+7RNV81Lrhbs+3V1gZgwvxG
         RAfknwNuin5k+dzOD8KyyPdWsEvf/Eru6dS/WGzUneUgAecajKcQAOv1D1/QBpdB70Eq
         1qyQ==
X-Gm-Message-State: AOAM530LPClDdzTDH0GxuQbj9/Fnz1iqIK2P9vn0pO7l+cfKMiACIrrg
	p/AaKxA90VKsoR8Z0o/uu7OZppvfRU3AsBE4rCA=
X-Google-Smtp-Source: ABdhPJzkn0oSosOeb/wXYFDqRrpCrXGbor6OTm/YKoMRAkhtfSLGFndIvfSyJzGhOOZSFNS5KWQBh/qlieIy9sRm3VE=
X-Received: by 2002:ae9:dc84:: with SMTP id q126mr4465139qkf.128.1632452576594;
 Thu, 23 Sep 2021 20:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1632332981.git.bruce.ashfield@gmail.com>
 <c3ed9c094566be74c852af8bc58212c3d7d612e3.1632332981.git.bruce.ashfield@gmail.com>
 <CAMKF1srUCZRhBh0N1Gnb3yp2+-h8t+0WXLHRw10BmBEEjSvrjQ@mail.gmail.com> <CADkTA4OQZUUn5PMY59oi6nYnns9os480HV44taknKOe6EGpBQA@mail.gmail.com>
In-Reply-To: <CADkTA4OQZUUn5PMY59oi6nYnns9os480HV44taknKOe6EGpBQA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 23 Sep 2021 20:02:30 -0700
Message-ID: <CAMKF1so8CxTPc2GE00TR5ST+1U20Z-rkMkZkvwKFkK=mDri-GQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] conf/machine: bump qemu preferred versions to 5.14
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Thu, Sep 23, 2021 at 8:00 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Sep 23, 2021 at 1:01 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > 5.14 does break fio and bvoxdrivers recipes, and upgrade of fio took
> > care of build issues but vboxdrivers still needs fixing.
> >
>
> I managed to tease out the 5.14 fixes from virtual box's SVN repository.
>
> A patch will be incoming shortly.
>
> Bruce
>
> > see
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1564
> >
> > On Wed, Sep 22, 2021 at 10:54 AM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > 5.14 is the latest reference kernel, so let's make it the
> > > default.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/conf/machine/include/x86/x86-base.inc | 2 +-
> > >  meta/conf/machine/qemuarmv5.conf           | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
> > > index 958b3490e8..44e4b4ec46 100644
> > > --- a/meta/conf/machine/include/x86/x86-base.inc
> > > +++ b/meta/conf/machine/include/x86/x86-base.inc
> > > @@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
> > >  # kernel-related variables
> > >  #
> > >  PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
> > > -PREFERRED_VERSION_linux-yocto ??= "5.13%"
> > > +PREFERRED_VERSION_linux-yocto ??= "5.14%"
> > >
> > >  #
> > >  # XSERVER subcomponents, used to build the XSERVER variable
> > > diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> > > index 252d6286d8..3c2c4997b9 100644
> > > --- a/meta/conf/machine/qemuarmv5.conf
> > > +++ b/meta/conf/machine/qemuarmv5.conf
> > > @@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
> > >  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
> > >  QB_GRAPHICS = "-device virtio-gpu-pci"
> > >  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > > -PREFERRED_VERSION_linux-yocto ??= "5.13%"
> > > +PREFERRED_VERSION_linux-yocto ??= "5.14%"
> > >  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> > >
> > >  KMACHINE:qemuarmv5 = "qemuarm"
> > > --
> > > 2.19.1
> > >
> > >
> > > 
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
