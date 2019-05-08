Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 46D767DEA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:30:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zp5V71mdz4q;
	Wed,  8 May 2019 22:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557347455;
	bh=SqBzGOV/PyOIiYn3sf/4uCpO9t0GdPMXiF8e6UlTEUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eESNrImC5sMpzzH7fXTqdKCPd7PAQHqXFql7cn4ey0PaX4f3mQvEVTu5UU1SEgIIX
	aR0Av8bT+a5l2StCS2EgtRohUin3EpYXHYDFKc3+yRRExcMuexIh1gwt1L6DWSD2v2
	/U6F2DpcekI9AJ4HqhGXx02ytb9AR/XhVC7xxfRj6+4KRwBA0aUUBp32AfIhgMUV6H
	3k+ngiYLv8bMQn3/+B6F9hqPCgG2FrPl5yLwYjHHCUC0/3xgcJ5z7HwH+wQB2+quEd
	9mt2JeA3FmdCijniXdp/TLGX1HZhP2cXe48fyJh/q98OWcUIWNC/oK1BEBwBrNJYhu
	NwqPN42hvbshJWRwVNnkpGKc1EhBMZUvBCqCDx7+lDO3hFpyKrlG6Z8D9oItl8x6zv
	qjM9yFQyj2QhrrpFFKJ5QMcHHCZZ2qLwUJ44/mHvNNSsQcHG9jp/9MpgtHhqKRtrG6
	gQvM/ojFqR6NvJbIlziaCXb69nTujqci0dJSemeV59ry+uZJ4KoqumacVQCMR3EXIJ
	m6fyHlm2378bv35yVbLFegjEf9Tjp6JYhz+5uF0rzNLaXxYI+C6Hl5l+UY40CJVPy2
	TtDOj9axFV7qTujVAV1q77mcvsVS/EKN/8d4M+jUttGQauDSOVWXS9puVs+Q4f90h8
	kn/Ck3EXp7jp2btTcVfQSos8=
Date: Wed, 8 May 2019 23:30:53 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190508203052.GC18736@localhost>
References: <20190507131151.31070-12-bunk@stusta.de>
	<2396569c84a5fa3ababe93d837c025bce876cd40.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <2396569c84a5fa3ababe93d837c025bce876cd40.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: upgrade 2.10.8 -> 2.10.9
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
X-List-Received-Date: Wed, 08 May 2019 20:30:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 08, 2019 at 09:06:19PM +0100, Richard Purdie wrote:
> On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> > Remove the backported patches.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> Unfortunately this seemed to cause:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/574

...
recipe linux-yocto-4.19.14+gitAUTOINC+9bda6190bf_eebb51300a-r0: task do_compile: Succeeded
...
 In file included from /home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.9/probes/lttng-kprobes.c:31:
| /home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.9/probes/../blacklist/kprobes.h:19:4: error: #error "Your kernel is known to have buggy optimized kprobes implementation. Fixed by commit 0ac569bf6a7983c0c5747d6df8db9dc05bc92b6c \"ARM: 8834/1: Fix: kprobes: optimized kprobes illegal instruction\" in Linux. Disable CONFIG_OPTPROBES or upgrade your kernel."
|  #  error "Your kernel is known to have buggy optimized kprobes implementation. Fixed by commit 0ac569bf6a7983c0c5747d6df8db9dc05bc92b6c \"ARM: 8834/1: Fix: kprobes: optimized kprobes illegal instruction\" in Linux. Disable CONFIG_OPTPROBES or upgrade your kernel."
|     ^~~~~
| make[4]: *** 
[/home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.9/probes/lttng-kprobes.o] Error 1
...


Upstream turned a runtime breakage into a build failure:
http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2d16de12b197aed57212826187bcb0ab24ad071e

IOW, this needs an update of beaglebone-yocto in
meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.19.bbappend
(4.19.34 already seems to be in the git tree).


> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


