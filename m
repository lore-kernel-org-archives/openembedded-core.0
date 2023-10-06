Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E797E936F8
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 10:56:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9864.1696589771010130225
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 03:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fgcn+awm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4B90E0010;
	Fri,  6 Oct 2023 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696589768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUwuxRyij/brl8kYeeI9LzuHoo8MvmJtYItIhhH/IaQ=;
	b=fgcn+awm+HvjOxTkY/lMYvzGhjV97hWPs3B/baef5xLHH45RJoKOknDFBpHaLRUawQRrmd
	v9Io779OhVHeq2QwJMEU5nnhryIy79mp/bQCk8V8jamc6uzsD302qD9aIndXNKR0fBTq+H
	s4QGdee3/YASaVUSC8A+tdceSu8UsIFGd/+GEQkbPJAjTqk1mOpiruXqg63LDFUO9jv8lE
	m6XgTyLEKTlsEeBOrAAlmt4UfdO2geaatrKZvsHeg+kstbC12n2AXPi/Bq3Jo9AUY9UgA2
	fW7xeRS9JQi7WlkroKh1yAiTv9JQBPnbmi9dAGmA2EXy9IDv+OKaGn5HNYsHBA==
Date: Fri, 6 Oct 2023 12:56:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
Message-ID: <2023100610560712ef25f4@mail.local>
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local>
 <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
 <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org>
 <CAEHHSvYc-mDkfG0ok=thQ8OLcHae7M+rUNkMk7MKjiEd+S2GMA@mail.gmail.com>
 <CANPvuR=nx1dQcshoXU6m6NATHsSvQmAYc9=WS8+qv5u_8OBTdw@mail.gmail.com>
 <CAEHHSvbZUi4Awcv9+d3KkdbURD5DM6aGUOKa_F-7Le-PEoemRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvbZUi4Awcv9+d3KkdbURD5DM6aGUOKa_F-7Le-PEoemRQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 10:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188753

I started an oe-selftest that passed, I'm going to carry that in my
branch to see whether there are other issues.

On 05/10/2023 10:02:22+0200, Julien Stephan wrote:
> Hi Jose,
> 
> I just pushed my branch on poky-contrib
> (https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/bblock)
> with the fix you just suggested.
> 
> I do not reproduce the issue locally, so I am not sure this fix the problem..
> Richard, Alexandre what do you think?  Can you restart a build on autobuidler?
> 
> Cheers
> Julien
> 
> Le lun. 2 oct. 2023 � 12:25, Jose Quaresma <quaresma.jose@gmail.com> a �crit :
> >
> > Hi Julien,
> >
> > Julien Stephan <jstephan@baylibre.com> escreveu no dia s�bado, 30/09/2023 �(s) 15:13:
> >>
> >> Le mer. 27 sept. 2023 � 23:17, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> a �crit :
> >> >
> >> > On Wed, 2023-09-27 at 14:47 +0200, Julien Stephan wrote:
> >> > > Le mer. 27 sept. 2023 � 12:16, Alexandre Belloni
> >> > > <alexandre.belloni@bootlin.com> a �crit :
> >> > > >
> >> > > > Hello,
> >> > > >
> >> > > > I had a build were all the tests passed, then I had this failure:
> >> > > >
> >> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/steps/14/logs/stdio
> >> > > >
> >> > >
> >> > > Hi Alexandre,
> >> > > I only see
> >> > >
> >> > >    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
> >> > >
> >> > > but I can't see the actual error :( Is it possible to have it somewhere?
> >> >
> >> > I am a bit worried this will be hard to reproduce/debug so I had a look
> >> > at things as I do really want to get things resolved.
> >> >
> >> > The error log says:
> >> >
> >> > WARNING: The quilt:do_build sig is computed to be 255536826e64d835fcc6b5a277e9a3dacaae75318e608fa2df289bdfa23df40e, but the sig is locked to 0f48875f011499948d53edc6abbe9e4efd617d5ef9233055e4b61411cf01cb87 in SIGGEN_LOCKEDSIGS_core2-64
> >> >
> >> > and I couldn't reproduce those stamps in a local build or on the
> >> > builder where it failed (once I got access which took a while).
> >> >
> >> > The "while" is important as I think in the meantime things changed
> >> > which effected the results.
> >> >
> >> > On the autobuilder, "bitbake quilt -S none" generated stamp files for
> >> > quilt. I did this for "build" and "build-st-3046552", the latter being
> >> > the one where the test failed. There were two different do_build stamps
> >> > generated. The diff:
> >> >
> >> > bitbake-diffsigs tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.b502a759bb6bceb6c8ccd76b57db2612501bb66bd9c46ece5f99f8bf16d7ac4a  ../build/tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.7cf16a1f87d5058e134f3f6fc02612515e28784625413c87d3545e93ae0ab407
> >> > NOTE: Reconnecting to bitbake server...
> >> > Hash for task dependency diffstat:do_package_write_rpm changed from 41171f7938a2ddbe244372c1cc4300d91b7dca425eb8b214c19262e4949a7f18 to 2211ac20553e9dddc710970cf1a663412ece5b5a2071e47c5471b3ee01efa2ce
> >> >     Hash for task dependency diffstat:do_package changed from f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec to e5ff0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec
> >> >     Unable to find matching sigdata for diffstat:do_package with hash e5ff0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec
> >> >
> >> > i.e. a couple of dependencies were different.
> >> >
> >> > bitbake-diffsigs tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sigdata.f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec  ../build/tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sigdata.af8ebe96c5cf424e1094c1599400a56096302e16d0f691daaeec380b963f37b2
> >> >
> >> > showed no output, i.e. they appear to be the same but different.
> >> >
> >> > My best guess at what is going on here is hash equivalence causing
> >> > problems.
> >> >
> >> > So in summary, I think the best solution will be to disable hash
> >> > equivalence for these tests.
> >> >
> >> >
> >>
> >> Hi Richard,
> >>
> >> Thank you a lot for digging into this!
> >> How can I disable the hash equivalence for these tests?
> >
> >
> > Can you try with BB_SIGNATURE_HANDLER using the bibake default config
> >
> > self.write_config('BB_SIGNATURE_HANDLER = "OEBasicHash"')
> >
> > Jose
> >
> >>
> >> Should I use BB_BASEHASH_IGNORE_VARS for that?
> >>
> >> I tried the following:
> >> self.write_config("BB_BASEHASH_IGNORE_VARS += \"TOPDIR\"")
> >>
> >> But this doesn't work, I get a lot of errors like the following:
> >> ERROR: When reparsing
> >> /home/jstephan/upstream/yocto/poky/meta/recipes-devtools/quilt/quilt_0.67.bb:do_packagedata,
> >> the basehash value changed from
> >> 8b6adb69d1f05eddb3e86143bf9a51060f4fac153742964bb4a3d53bee93d377 to
> >> 9dee5dada20d7f8ccfc89ed3114c428af8c96d665234fead22c25fb118f9f62b. The
> >> metadata is not deterministic and this needs to be fixed.
> >> ERROR: The following commands may help:
> >> ERROR: $ bitbake quilt -cdo_packagedata -Snone
> >> ERROR: Then:
> >> ERROR: $ bitbake quilt -cdo_packagedata -Sprintdiff
> >>
> >>
> >>
> >> Cheers
> >> Julien
> >>
> >> > Cheers,
> >> >
> >>
> >> > Richard
> >>
> >> 
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos� Quaresma

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188705): https://lists.openembedded.org/g/openembedded-core/message/188705
> Mute This Topic: https://lists.openembedded.org/mt/101570279/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

