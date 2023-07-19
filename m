Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04AAEB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 09:20:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9846.1689758417642152370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 02:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N70CIAR1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B91B71BF207;
	Wed, 19 Jul 2023 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689758415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NoEdX/oi/0ODVMiP4Sd1r5lp6OzpvWwvZAeeamos1eA=;
	b=N70CIAR19Hp4VmrGfXB4Ktrm7dOG1StYnhyi7XQ4tM6EiYaacos8s66mo+NWgZH1ENHB08
	4iRpYKl6kXwGlSpm3CCmgBxD0YyE1RS+I1eoNOeEjQJ0Go0mTsmqzlOZtXOIAnaoDJ+7NU
	tfY+UupSfsKcSzBlcsQBvKZhPO8zbsZ8Mq1nx80SkfU4V1i1TgWFzjL/GMc1S/l8lqCu53
	L7dqK1x682ECMR8qFGMCGf+0jRLen4IFiJKDeWY9dDtAK3+m3mh+tx5zncqFKGNw5ir3I1
	hFaP8PyP2RRVV++rkFn/hXCWR80GmvjyNrl/zmLFufx4Pxx88Dr40gBXUJSFPA==
Date: Wed, 19 Jul 2023 11:20:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
Message-ID: <20230719092014d84e04f9@mail.local>
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
 <2023071611474165f97b23@mail.local>
 <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
 <202307171246212fd06366@mail.local>
 <9441c96a-33fe-19d4-4228-54a8f4ea413a@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9441c96a-33fe-19d4-4228-54a8f4ea413a@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 09:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184571

On 19/07/2023 17:10:37+0800, Yu, Mingli wrote:
> Hi Alex,
> 
> On 7/17/23 20:46, Alexandre Belloni wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > On 17/07/2023 15:10:35+0800, Yu, Mingli wrote:
> > > Hi Alex,
> > > 
> > > On 7/16/23 19:47, Alexandre Belloni wrote:
> > > > CAUTION: This email comes from a non Wind River email account!
> > > > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > > > 
> > > > Hello,
> > > > 
> > > > This causes the following meta-mingw error on the AB:
> > > > 
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio
> > > 
> > > I didn't find the core-image-mingw-sdktest recipe which I noticed in the
> > > above log, so I cannot reproduce the issue as you mentioned.
> > 
> > As stated above, this is part of meta-mingw:
> > 
> > https://git.yoctoproject.org/meta-mingw/tree/recipes-core/images?h=master-next
> 
> Thanks for your pointer!
> 
> BTW, the below error which in https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio
> seems irrelevant to the added nativesdk dependency though I have removed the
> nativesdk dependency in https://patchwork.yoctoproject.org/project/oe-core/patch/20230717071114.2734859-1-mingli.yu@eng.windriver.com/.
> 
> | /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld:
> ../obj_s/lib_kernel.o:lib_kernel.c:(.text+0x5c): undefined reference to
> `_nc_mingw_tcflush'
> | /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld:
> ../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0x2c): undefined reference to
> `_nc_mingw_tcgetattr'
> | /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld:
> ../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0xbb): undefined reference to
> `_nc_mingw_tcsetattr'
> 

It is relevant, this is because of the dependency that this gets built
and fails. I've seen v4 but didn't have the time to test it yet.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

