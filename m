Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4527964F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 04:23:49 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id w6so12945492ljd.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 20:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zBcPPiqxGsRuw2WhGltDDS9YxH/QMmDWT3OZKf/E/x8=;
	b=ZIt7LVI126dr7rzbzCxXUJ22Baff0Wbao0FEWm3+/QqrWT8+3Dz9/wpyj1ysSAwqj9
	hoirW8bfxxXvMsejRivg++o3VIeBM4z7sWg7/1jHMqNxkANBbwIixIJx1qoZhpOlRbtc
	WYkZrxE3wRauBb1loyVozdbamqbKm3NFYrhEKjrejOfsGgWsk2IjZ1yZCdck7A3NG8Nw
	IsrTPLHf7RebZqlI7EM+Nos38c43wTpgKC0InjU3mQ78JHsIKa9SHFE+n29OujmXpgZQ
	CxVcSL8w+LbSJJbvr9dLCzz5nkq8ORzqPJVpKbwtiZETXCENQTmr66AxQElQPYJcF7F6
	FNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zBcPPiqxGsRuw2WhGltDDS9YxH/QMmDWT3OZKf/E/x8=;
	b=bxrp7aO9XjoJJoH/Bq4GSZnlFAfZU4sbtyHeH+d08CQbzJioFfwj89+I0lESFf5gOH
	sxqjI3KzVIXkq35aB4W/7nz9QntWbD1pX/zqZHmUIAOGvbKeT7lvXxXO8jgQebWa0ycy
	Dyh9bz0eEUZmkzjMmket970Up5ZadUinzTmLH+YFi2W9cCuGwU7DYoucWVcTJjy2Ggz3
	9GPzfnPEPsqGjf97VG328OzS3GFSdY6LjYR5Mnfx1LdUieB+8eLxfOp0Q//JETDBSWSm
	E6N9ytLADpyJE/K2s8HC6LjmjHkAn878Wl67gJxOQEPP9vM8CZ4W4VPIJWWHon+JGfPY
	E2mg==
X-Gm-Message-State: APjAAAWNO6BiWPExmaHObE/CKnLQNVEgGcON5MQROuVFOV4ton+vFUhS
	zYGuRiw2e9Tf1ruiOR5dGkcIVmW9ziLreK29nJ0=
X-Google-Smtp-Source: APXvYqy9Ezzcvi8/iaYFEe5Oxlsgdb4OJdIexv7gkVRD9Q6q9kBs9a3kwaDbIxatJqQJBEFWkKnI/m/+mDMrkRVMlAs=
X-Received: by 2002:a2e:9e57:: with SMTP id g23mr4352099ljk.124.1551932630356; 
	Wed, 06 Mar 2019 20:23:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<088fa1a03d1ff2ec9eb08d419e2a7c7bc1ee3406.camel@linuxfoundation.org>
	<CADkTA4NdgcGNtD2RdFSURG7=t1dUna8CC7uGU+Dv4BcHYD=yTQ@mail.gmail.com>
In-Reply-To: <CADkTA4NdgcGNtD2RdFSURG7=t1dUna8CC7uGU+Dv4BcHYD=yTQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Mar 2019 23:23:39 -0500
Message-ID: <CADkTA4MowcWPK_k5egUx=GY4SEVcSrOwWsey2h66KgvOHKfLOQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Mar 2019 04:23:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 6, 2019 at 11:21 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Mar 6, 2019 at 6:05 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2019-03-06 at 11:37 -0500, bruce.ashfield@gmail.com wrote:
> > > The -rc8 of the kernel pushed this out a week longer than I would
> > > have liked, but luckily the -dev kernel has been running 5.0 for
> > > quite a while, so most of the issues had been worked out already.
> > >
> > > In this series we have the bump of the libc-headers to 5.0, I've
> > > built all arches for both musl and glibc, with no issues popping
> > > up due to the headers bump. A few patches were dropped, since they
> > > are now upstream.
> > >
> > > I've also introduce the 5.0 versioned recipe in this series and
> > > adjusted the two machines that still have a preferred version to
> > > use it. Again, this was built and booted on all arches and over
> > > several image types (minimal, sato, kernel-dev).
> > >
> > > As usual lttng was tweaked to work with 5.0, but I was able to
> > > keep it on the same 2.10 stable branch and only pull in a few
> > > pending patches that haven't been formally released yet.
> > >
> > > Once we get the h/w reference boards, and reference distros moved
> > > to 4.19 and 5.0, I'll send a follow up patch to remove 4.18
> > > from master.
> > >
> > > I'll send follow up patches to the yocto-bsps and poky as
> > > appropriate, but until the last few issues are resolved, they can
> > > stay out of tree.
> > >
> > > I captured as many details as possible in the commit messages of
> > > the individual patches.
> >
> > Thanks Bruce!
> >
> > Just to summarise where we're at:
> >
> > a) The runtime stap tests fail everywhere, we probably need systemtap
> >    patches.
>
> Fixes. Patches out shortly.
>
> > b) Issue with KMACHINE_qemuarm = "qemuarma15" not working, blocks
> >    qemuarm armv7 switch
>
> I can have a look at this on Thursday.
>
> > c) qemumips and qemuppc:
> >    https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/365/steps/7/logs/step1c
> >    https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/365/steps/7/logs/step1c
> >    RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase 1541: FAILED
>
> Fixed, patches out shortly.
>
> > d) perf do_compile race seen on qemuarm64 (didn't reproduce locally):
> >    https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/366/steps/7/logs/step1b
>
> I can't reproduce this one either.

I did notice that the AB log seems to show 4.19 being built for this,
is that just a red herring ?

NOTE: recipe iptables-1.6.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.6.2-r0: task do_package_qa: Succeeded
NOTE: recipe ofono-1.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-4.19.19+gitAUTOINC+41fe45f7c5_11e0e616ed-r0:
task do_package_write_deb: Succeeded
NOTE: recipe ofono-1.25-r0: task do_package_write_deb: Succeeded
NOTE: recipe linux-yocto-4.19.19+gitAUTOINC+41fe45f7c5_11e0e616ed-r0:
task do_package_write_rpm: Succeeded

Bruce

>
> > e) qemuarm64 graphics startup issue
> >
>
> Not sure on this one.
>
> Bruce
>
> > Cheers,
> >
> > Richard
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

