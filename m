Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.5989.1588598652569761093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 06:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SUaKf3C6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id y3so1875404wrt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qVNbQOa8mJ6E4ynEcIaXcODbtmm7+I6/bRDyF1PPvD8=;
        b=SUaKf3C6694Z3coOp3teFkVNuh+L7S6xXXMoMC+EzFbuBMqlth9u+WMrDkw+qsz+FI
         NbDMVXzdBubzld/hohOUdwoxDs8aTQMi3safhADGWzJR+llFDFD3zzbX5/Z+dBtZChx9
         rY/cfejNJtgxD745LlDALQxDMmEy97i0GD8Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qVNbQOa8mJ6E4ynEcIaXcODbtmm7+I6/bRDyF1PPvD8=;
        b=kcrIHQYfse0fuDJ8HlP5xANv0kp9hqVfJ6RJWqzKBuXlRHuvYdgP5UJiJnmv9j/krm
         uWUlGxSdH+HzmZDrDIGOe4GQFgqcKqDmKWZXpGVr7jVclivh94jDF7zdYwwqGsm7Rvzl
         dK6UWiH10N4KZv68KmV7iZ/Lg1Av5z07Fo1+cZyOLT/YVvhwjG5bQrLXZWmyP036ALgJ
         APKa9sMim+kzH3EZkmYzNtM6phZOCJmyHhgVb8u35tnWsebpbVJNgj/irGWDXmINNmaq
         viG8oJOk45Mv5Kd24ucA9KxpbwHAThMZiGu0JXvob0kbTz9dDLh+h+skDeiYMZgP2II4
         BlOQ==
X-Gm-Message-State: AGi0PuZlVMaGkFYuFZw4DI996ANxy9h3OVcngo9POtBswIf6D5ba7cJe
	D2FxK3UEwD0Fi98PIpI0DmMbpA==
X-Google-Smtp-Source: APiQypKNekJKamrdvvUoAJ3vUpdFukOdfswX8LnyeB4lXfecxkHCr4Urj+2Z/grhAtb7iO+iEmQ4eg==
X-Received: by 2002:adf:b256:: with SMTP id y22mr18840899wra.355.1588598651033;
        Mon, 04 May 2020 06:24:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c190sm13852975wme.10.2020.05.04.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 06:24:09 -0700 (PDT)
Message-ID: <ded31e364a1c6c5bcc5bd791b9bf49d9b8747b4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: steve@sakoman.com
Date: Mon, 04 May 2020 14:24:06 +0100
In-Reply-To: <CADkTA4PjNUb8BcP3oS9Ey8atrvuP1YAhJzfoUES0Ya8eunddng@mail.gmail.com>
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
	 <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org>
	 <160BD489BF65999D.29536@lists.openembedded.org>
	 <CADkTA4PjNUb8BcP3oS9Ey8atrvuP1YAhJzfoUES0Ya8eunddng@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-05-04 at 09:06 -0400, Bruce Ashfield wrote:
> On Mon, May 4, 2020 at 8:56 AM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > On Mon, May 4, 2020 at 4:31 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Hi Bruce,
> > > 
> > > On Sun, 2020-05-03 at 11:44 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > 
> > > > Hi all,
> > > > 
> > > > Here are the -stable updates I've collected since m3 of dunfell. I
> > > > ran things through the autobuilder, and no new kernel issues were
> > > > picked up.
> > > > 
> > > > The -dev bump is good for master, while all of the 5.4-stable bumps
> > > > are good for both master and dunfell.
> > > 
> > > I pulled these into master-next and saw reproducibility issues. I
> > > wondered why your test build didn't show it, turns out it also did:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/1024
> > > 
> > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - ======================================================================
> > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - FAIL: reproducible.ReproducibleTests.test_reproducible_builds (subunit.RemotedTestCase)
> > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - ----------------------------------------------------------------------
> > > 2020-05-04 05:18:46,864 - oe-selftest - INFO - testtools.testresult.real._StringException:
> > > 
> > > AssertionError: The following deb packages are missing or different: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp/deploy/deb/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38+git0+f405543442_6cb5b11e83-r0_amd64.deb
> > > The following ipk packages are missing or different: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp/deploy/ipk/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38+git0+f405543442_6cb5b11e83-r0_qemux86_64.ipk
> > > 
> > 
> > I don't see any changes in the kernels that would have triggered it,
> > but they never are obvious.
> 
> I am working on some kernel reproducibility changes that were
> discussed about three weeks ago.
> 
> Is the default for reproducible builds in master-next different from
> what it was before dunfell was releases ? If so, that might explain
> why I'm not seeing a change that would have triggered it (i.e. this is
> unrelated to my -stable changes).

There are no reproducibility changes between master-next and dunfell.

> Like I was mentioning before, if there's a document or pastebin of
> steps I can follow, I can run the tests against my pending changes and
> finish them for master. They of course would not necessarily be
> suitable for dunfell.

The good news is the autobuilder has some debugging built in for this
kind of problem. You can see the diffoscope output here:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-vhr0o_t9/packages/diff-html/

which tells us its kheaders.ko in .rodata by the looks of it. Some
changes are cause, some are effect, e.g. the build ID is different as
the sections are different so that isn't the issue but an effect of it.
It looks like diffoscope doesn't know how to decode the .rodata which
could be compressed?

The raw data is also there (the packages that differ), e.g.:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-vhr0o_t9/packages/reproducibleA/tmp/deploy/deb/qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64.deb

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-vhr0o_t9/packages/reproducibleB/tmp/deploy/deb/qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64.debe

which would allow you to look further at them by hand.

You can manually run this test locally with:

oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

but it will take a while to run as it has to run two builds and compare
them and only uses sstate for one of them. To make it faster since you
know where the issue is, edit
meta/lib/oeqa/selftest/cases/reproducible.py to change images (core-
image-sato, core-image-minimal and friends to simply "virtual/kernel".

Cheers,

Richard








