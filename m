Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A879E6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 23:52:51 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l2-v6so832697qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 16:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fIsb9rG06C7LectNuFtJ+AUeoOxK4/Wt7kepVdjpQYs=;
	b=F/bs50bmsQ9hhLPOYCvRvTYh/stVBbHU6LJaIvKzRyLhTYYusYAbNEPve6iKkcx1rb
	Uc12fjdumfzWNvd5sXKLRxgi67wMU2GfI6F+9gX/sZ9xh/unj1VmE+8rmAt0/CqkggK3
	kxxET1pUgwXkF77bODlJwBY+tFEv3oo6EvV8XIf/ab63LUe332kDvOe6k51MUdii1V7s
	mhiOuyV1P31G/UX3XGrjl3LW5Bm8rIfPMBispPrjJ85t9A5z4q/0T+kFr7bE+YD3sjLV
	i+PWbkiaudfYoTAuA9nEgkIk8dQ1l/+vFHbjWpjlcRM0l+Z+Xcx1XolyR6cLS+iefGr6
	ooAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fIsb9rG06C7LectNuFtJ+AUeoOxK4/Wt7kepVdjpQYs=;
	b=Qgt+tPClGAepBXPkiTf7nPRcS+gxKlD0Ge1IEUDmsKuHBiJemV6r9Of5Fkfe3m9aTO
	HUn7nG+szhFixuAvWVWHyCe7NsRZMpNNy1A7hIDpzOkpHrsor/p0O/pxFFAzE5Nl1xMb
	HqOmHESFKwx/00sSZ95NNqeLr6k5Cdjt2xMc8jzGDu1+cqvV2x7uGUVgJf/y5Oix18X9
	K0ocyknTpfd/Ev2ykv8s0j+/1iVPgvxF9Nz8BuXrnruj0uTqGp5G0XnZr7OSQ5IRmzcS
	O/BsEhoqHky87HEsSO+djcYvWZ//i0B4wklIPT0ER+n/UaDQWPlehzPmElTTB00u2yp8
	caLw==
X-Gm-Message-State: ABuFfohhJ9KMZS0M7WynzLENrEj/et9ik0+8iL4YBOLLPuXjeV+3VuND
	xYC5txSHhLSjUrDlV8XxaVvQq4D9UDCn6OVtjzQ=
X-Google-Smtp-Source: ACcGV63uPq7PCL87mnDnORLVWvd5H4Ne2rPSvL79C1zTDFRsmCsZS+74YsChD8CM2CX9dZK5YyLUmnfyOzDnl2yVuhs=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr6317789qvo.50.1538005972129; 
	Wed, 26 Sep 2018 16:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180926132848.6632-1-andrej.valek@siemens.com>
	<20180926132848.6632-2-andrej.valek@siemens.com>
	<5ec7d09ee0d304331280e1ad45a95f136beccbf8.camel@linuxfoundation.org>
	<b711f13dce071f35402e284d31bbe393679753c5.camel@linuxfoundation.org>
In-Reply-To: <b711f13dce071f35402e284d31bbe393679753c5.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 16:52:25 -0700
Message-ID: <CAMKF1sr0bW=fZ-sLQuveZi5XL=eSSUzxfZojkWhgfOFTzCwUcQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel-devsrc: fix searching for non-existing manifest files
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
X-List-Received-Date: Wed, 26 Sep 2018 23:52:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 26, 2018 at 4:12 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-09-26 at 23:30 +0100, Richard Purdie wrote:
> > On Wed, 2018-09-26 at 15:28 +0200, Andrej Valek wrote:
> > > Even if the do_populate_sysroot have had set-up noexec flag,
> > > populate_sdk's
> > > tasks were trying to find .populate_sysroot manifest file. Change
> > > noexec
> > > flag settings to delete appreciated tasks.
> > >
> > > WARNING: core-image-minimal-1.0-r0 do_sdk_depends: Manifest
> > > build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-
> > > devsrc.populate_sysroot
> > > not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm
> > > allarch x86_64_x86_64-nativesdk (variant '')?
> > >
> > > WARNING: core-image-minimal-1.0-r0 do_populate_sdk_ext: Manifest
> > > build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-
> > > devsrc.populate_sysroot
> > > not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm
> > > allarch x86_64_x86_64-nativesdk (variant '')?
> > >
> > > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > ---
> > >  meta/recipes-kernel/linux/kernel-devsrc.bb | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > index 463305e89a..716e908af8 100644
> > > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > @@ -20,12 +20,12 @@ do_install[depends] +=
> > > "virtual/kernel:do_shared_workdir"
> > >  do_install[depends] += "virtual/kernel:do_install"
> > >
> > >  # There's nothing to do here, except install the source where we
> > > can
> > > package it
> > > -do_fetch[noexec] = "1"
> > > -do_unpack[noexec] = "1"
> > > -do_patch[noexec] = "1"
> > > -do_configure[noexec] = "1"
> > > -do_compile[noexec] = "1"
> > > -do_populate_sysroot[noexec] = "1"
> > > +deltask do_fetch
> > > +deltask do_unpack
> > > +deltask do_patch
> > > +deltask do_configure
> > > +deltask do_compile
> > > +deltask do_populate_sysroot
> > >
> >
> > This triggered some failures in the autobuilder tests:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/8/builds/78/s
> > teps/7/logs/step1b
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/19/builds/70/
> > steps/7/logs/step1c
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/77/
> > steps/7/logs/step1c
> >
> > (https://wiki.yoctoproject.org/wiki/BuildLog#2578 if that is clearer,
> > the stdio log shows which following log(s) have the errors)
> >
> > why, I'm not sure...
>
> I think its because:
>
> module-base.bbclass:do_configure[depends] += "make-mod-scripts:do_compile"
>
> and the dependency goes missing when you delete the configure task.

this dependency seems redundant for devsrc

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

