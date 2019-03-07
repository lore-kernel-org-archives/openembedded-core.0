Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id D802A79BA6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 04:21:42 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q128so12935086ljb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 20:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j+hu+k91s2Y0PEOL3G93nAGrFrjJY6he+4zZBh6rqUs=;
	b=MvDaJj86LK9DOiPfAfRrMT9Zrum31hySkwrLYUS5479yPpbj/NmkvdX9+48kYw2Zat
	/j/0MBrMegycPTeL3Tj/UQgyatYHYhxQmOJm8kATzYlxwohvcYTKT7qXK6FZqFIxKn/j
	QEikVh5DG6ZHrUUIqxNJtYGvXVZeplkVCKsiuy4p5W6ZyaqYhr/hvY50Pq8t10FXAtga
	/Gpe43KaWp9mkKckwYnvgKTSk6hBDaMpuQ+/GrHH2wiGCG4GcnV21rQ4B6ZnRPB/2lgE
	xsdnkpSsom01xa9Q6Zp2NFlg9F+yuXPSHQ+4ICRHo+N9yhDZF+5vFebXlOByDXiSsL1x
	ER4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j+hu+k91s2Y0PEOL3G93nAGrFrjJY6he+4zZBh6rqUs=;
	b=lStYidLVF5LJUWPRvKQBwtM/4MLh0QT5FiFpPwMmPxSS5RYvUmbNSArXCfBsEldksl
	MWAfI4DE7WbJOkYuTxiBVL8J2+PuWfsMW3qLl5k1u8R5iOOCOTC2EaA0U/gNdXOP6IHv
	yACBpdk3GjNPg9rTpPGu4CoKxwlKkRDbG7e1KQpKfNot5KAtIHaZlOVSUEjPECuP6qOu
	tNbg8j8uYuaYKKYmc8B2Mol0hzjr5XltbjB7IdzqFTNcKy7ooXZGqrVcM86vNQio6zck
	BeXOg6kBAiH07Cae083gRJ8dIdsGRxUAYyX1/Ylpp5XhSQO4wqFV8Meb5p9b6MO5weka
	fmGg==
X-Gm-Message-State: APjAAAWWguWe4iWPpJYkyfNKYvf9VJAMTI0dDBg6+TFkeB1+5l7OtrZn
	1vfTiw0mWpPVT9v+rtU6cIdNUgypS14cwNlv8u8=
X-Google-Smtp-Source: APXvYqxt4T65Ceok0yjcYe1hu0XBHrdM2rpMGO34m3beRxDPGagvO2vGAmAKUotubbcMxkOEL5Cu+tE8vLaZonSXVNg=
X-Received: by 2002:a2e:6309:: with SMTP id x9mr4290257ljb.75.1551932502996;
	Wed, 06 Mar 2019 20:21:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<088fa1a03d1ff2ec9eb08d419e2a7c7bc1ee3406.camel@linuxfoundation.org>
In-Reply-To: <088fa1a03d1ff2ec9eb08d419e2a7c7bc1ee3406.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Mar 2019 23:21:31 -0500
Message-ID: <CADkTA4NdgcGNtD2RdFSURG7=t1dUna8CC7uGU+Dv4BcHYD=yTQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] linux-yocto: consolidated pull request (5.0 kernel intro)
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
X-List-Received-Date: Thu, 07 Mar 2019 04:21:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 6, 2019 at 6:05 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-03-06 at 11:37 -0500, bruce.ashfield@gmail.com wrote:
> > The -rc8 of the kernel pushed this out a week longer than I would
> > have liked, but luckily the -dev kernel has been running 5.0 for
> > quite a while, so most of the issues had been worked out already.
> >
> > In this series we have the bump of the libc-headers to 5.0, I've
> > built all arches for both musl and glibc, with no issues popping
> > up due to the headers bump. A few patches were dropped, since they
> > are now upstream.
> >
> > I've also introduce the 5.0 versioned recipe in this series and
> > adjusted the two machines that still have a preferred version to
> > use it. Again, this was built and booted on all arches and over
> > several image types (minimal, sato, kernel-dev).
> >
> > As usual lttng was tweaked to work with 5.0, but I was able to
> > keep it on the same 2.10 stable branch and only pull in a few
> > pending patches that haven't been formally released yet.
> >
> > Once we get the h/w reference boards, and reference distros moved
> > to 4.19 and 5.0, I'll send a follow up patch to remove 4.18
> > from master.
> >
> > I'll send follow up patches to the yocto-bsps and poky as
> > appropriate, but until the last few issues are resolved, they can
> > stay out of tree.
> >
> > I captured as many details as possible in the commit messages of
> > the individual patches.
>
> Thanks Bruce!
>
> Just to summarise where we're at:
>
> a) The runtime stap tests fail everywhere, we probably need systemtap
>    patches.

Fixes. Patches out shortly.

> b) Issue with KMACHINE_qemuarm = "qemuarma15" not working, blocks
>    qemuarm armv7 switch

I can have a look at this on Thursday.

> c) qemumips and qemuppc:
>    https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/365/steps/7/logs/step1c
>    https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/365/steps/7/logs/step1c
>    RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase 1541: FAILED

Fixed, patches out shortly.

> d) perf do_compile race seen on qemuarm64 (didn't reproduce locally):
>    https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/366/steps/7/logs/step1b

I can't reproduce this one either.

> e) qemuarm64 graphics startup issue
>

Not sure on this one.

Bruce

> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

