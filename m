Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id B503A74769
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:19:56 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id g17so12130691qkk.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4W43dMujpJrzlyvoo0YDoJoO+zbaJI2DIlkx0+rGCdg=;
	b=GC05EIUWptI2rVh141wexG8n/FgS9b6m/F7GFdyldnrP6TQDlAvihWv+S+9Mps8Fj0
	C7NUMUnaACRn3jUT/J+FHPaxTxmrSzU7mIGuHsPgNZQn4ycs6aLz3lx2Bhsj/fkLByJ7
	cTx/bF0pThMNvqTRiP0UsI5zE0b0/Ke50xj1yiqy1qP3rEio1kW31QfR6hf+nth6kuLl
	z7RzYAJ1nUCIibQ6Z+7kp8F+ol4Y976KsUwI2YmsFL8bhoX2PXVjFGNlM924c4eH+qbH
	7B6Jp/U+mHmjZ3Q/gghNa3FWwlAmMZ5hHAKxzvivzqZftsZ1EFVaq1Og8keuSkPEpqmg
	ZuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4W43dMujpJrzlyvoo0YDoJoO+zbaJI2DIlkx0+rGCdg=;
	b=sdk7OgKPduG480v/Dd42/XMPB4df96twCerH1naJxlFU+OzrqucTLWIAGHcxDGqJGI
	r9deO0Idm9zOufZbXe/zp+2joD4h0Bu5wenNpIzSBHthZMYPQ+JaXvZHg6KQiJlngB+I
	5upCWdcCQBz3qQv+dSlrAvOPKKW3fORaiI+HK3GOX5ins8GCsqwucQdiIXmxU3Vp3Ibe
	eZ8IDxTEPYR8dnC41BhfroG+KFua/Scm9E651ibCGyoLFd0CA9LPQKYww1pGv+u+WLv5
	OqvclsFjIiB76SuwqHac2V4uvaD8fsRUkSHoSgyH0xuxnYcDBuvr1rpu/TDB8IY75P0X
	zRhA==
X-Gm-Message-State: APjAAAXlC3bXmWnTTR3z0/nJVXSCO0W15yRIpSEifxaAPm7Df2hi85D4
	BZjMFyhXv2rRkhiPVAzn8ZA8rQmEs7w+82+EOjs=
X-Google-Smtp-Source: APXvYqy4mt+49vv+m5gU1RMghcwzugXeFvgidcLmdMvizo+qV+S6lKuiGhi8W6TlJYjN/TYOQi+zji2okd0pL7jnAxM=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr38794260qkg.337.1565795997139; 
	Wed, 14 Aug 2019 08:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
	<123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
	<8e7c2ed75a5f499c88fba9bf692882b4@xbox06.axis.com>
In-Reply-To: <8e7c2ed75a5f499c88fba9bf692882b4@xbox06.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Aug 2019 08:19:31 -0700
Message-ID: <CAMKF1srLANHAKHpNjsU1pxKdzT_zT1FPrdqg77qkM+9RYQ8TTA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 15:19:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 14, 2019 at 7:57 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: richard.purdie@linuxfoundation.org
> > <richard.purdie@linuxfoundation.org>
> > Sent: den 14 augusti 2019 14:56
> > To: Alexander Kanavin <alex.kanavin@gmail.com>
> > Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Khem Raj
> > <raj.khem@gmail.com>; OE-core <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] Long delays with latest bitbake (was: [PATCH
> > 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS
> > recursively)
> >
> > On Wed, 2019-08-14 at 14:08 +0200, Alexander Kanavin wrote:
> > > On Wed, 14 Aug 2019 at 13:36, <richard.purdie@linuxfoundation.org>
> > > wrote:
> > > > On Wed, 2019-08-14 at 13:25 +0200, Alexander Kanavin wrote:
> > > > > On Tue, 13 Aug 2019 at 21:18, Richard Purdie <
> > > > > richard.purdie@linuxfoundation.org> wrote:
> > > > > > I had a glance at the profile output from master-next and the
> > > > > > problem
> > > > > > wasn't where I thought it would be, it was in the scheduler
> > > > code.
> > > > > > That
> > > > > > is good as those classes are effectively independent of the
> > > > other
> > > > > > changes and hence are a separate fix.
> > > > > >
> > > > > > I've put a patch in -next which takes the above test to 36s
> > > > which
> > > > > > is
> > > > > > close to the older bitbake.
> > > > > >
> > > > > > Could be interesting to see how it looks for others and
> > > > different
> > > > > > workloads.
> > > > >
> > > > > I just tried the same test I did yesterday with
> > > > > ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately it
> > > > doesn't
> > > > > seem to improve things much: bitbake is stuck at "NOTE: Executing
> > > > > Tasks" for 15 minutes now.
> > > >
> > > > This might sound slightly crazy but can you try commenting out this
> > > > line in runqueue.py:
> > > >
> > > > logger.debug(2, "Holding off tasks %s" %
> > > > pprint.pformat(self.holdoff_tasks))
> > > >
> > > > ?
> > >
> > > Even crazier is the outcome: it helped!
> >
> > Cool, I think I can explain it.
> >
> > The holdoff_tasks list can contain a list of nearly all the tasks at
> > some points in execution. Even though the debug messages aren't being
> > printed on the console, they are being sent over the internal IPC bus
> > between the cooker, UI and other event handlers. Obviously for small
> > task lists its not a problem, for large ones its multiple 4k chunks
> > over pipes which isn't going to be fast.
> >
> > We have done a lot of optimisation in the past but its all too easy to
> > trend on something like this and upset things :/.
> >
> > > The whole thing completed after 15m49secons (with much of the time
> > > going to the empty task spin), that's some 3 minutes slower, but
> > > certainly it's usable again.
> >
> > You followed up mentioning this wasn't with master-next. I think there
> > is a patch in -next which will help with the empty task spin so both
> > together might get us back to more normal numbers.
> >
> > Cheers,
> >
> > Richard
>
> I can just confirm that removing the debug line removes almost all of
> the delays I was seeing. Here are some time statistics from my builds:
>
> 6c7c0cef: 02:50
> 7df31ff3: 06:13  (first attempt)
> a0542ed3: 06:32  (master)
> 19a88c68: 43:19* (~yesterday's master-next)
> b0a0e4a6: 06:55  (master-next)
> no debug: 03:04  (master-next + removal of "Holding off tasks" debug)
>
> * I aborted this build after about half of the 12540 tasks were done...
>
> One thing I have noticed while I was doing the timings is that I do
> not seem to be able to kill the bitbake server with bitbake -m after
> the builds have completed, but have to resort to using kill -9 most
> of the time...

me too.  My world build time came down to < 15 mins as well, Last
night it was at 45 mins and still parsing before I stopped it.

>
> //Peter
>

