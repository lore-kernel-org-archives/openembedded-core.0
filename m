Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8DA7DEA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:38:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m20so2689098wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ruCOXyhyM20vQJfmbZW3/2QfIglMC4oBbckmmElCN6Y=;
	b=EP6bXv3jPc/1QtBFTZhmNHz+bbww2oANxTwOuTx65vyNclusfR4i/G/D2TDJiNMHxQ
	nzawNobP8Rp2qAmNe0AYZ/ga1UwuoE32VkfX9WOXE8CbyxHWgCeXVztlmeG0enHfj7C6
	DIOPX+Jp2eayZ4UsNzq4YJ8yXojsGycYxDHV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ruCOXyhyM20vQJfmbZW3/2QfIglMC4oBbckmmElCN6Y=;
	b=k4k/hDKGJWD19PpfYnlvpQF7JNzeeZ88QhUPUlHuuUpX6iCagL20swB+OJTnjN02lX
	goQslc8Vp9niyxvp3a3uHA+tKtcgt4ackpslrVw5wcPwK6dBZICtWdmcBDgcMNjF60Gi
	Y5KpzWU8ikmuGTv0eIBkJV5LU7IKuKOg3e0hJrQBcrJ19LaCdGXSCfCYGoXyhDMtmQ3I
	ltvfzV5/EI/KjzN4Fp4UiTFrPybKvUzcLwQ6WyZn14nBnf4/xQ9weLdaiLw2IQaYrfq0
	e/U+sjNRXTz+iPlwRJ4CiM4/6WfE9ybHdsbyPXmcaYYg5VxVacRfn50zGGe/V/s5+G0Y
	xP+A==
X-Gm-Message-State: APjAAAVHRs/kca1RHguCu6OJZiqPQ69GzokM702sOZO+k1t4HW5QLZyJ
	tZNrZTdRU22sjjczHlW94Gpqbw==
X-Google-Smtp-Source: APXvYqzWXfjx0q9Rv0NJJA/rLYJgoBrZD4ExtaWMhEWGKRcb3Tfyo/fBiQYxYsQJQMCGo7F6pR0YAQ==
X-Received: by 2002:a1c:9689:: with SMTP id y131mr151261wmd.74.1557347933204; 
	Wed, 08 May 2019 13:38:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r64sm10578806wmr.0.2019.05.08.13.38.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 08 May 2019 13:38:52 -0700 (PDT)
Message-ID: <7f99a5accb9261548f88e3f2787bad806eb5dd05.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>
Date: Wed, 08 May 2019 21:38:50 +0100
In-Reply-To: <20190508203052.GC18736@localhost>
References: <20190507131151.31070-12-bunk@stusta.de>
	<2396569c84a5fa3ababe93d837c025bce876cd40.camel@linuxfoundation.org>
	<20190508203052.GC18736@localhost>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 08 May 2019 20:38:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-08 at 23:30 +0300, Adrian Bunk wrote:
> On Wed, May 08, 2019 at 09:06:19PM +0100, Richard Purdie wrote:
> > On Tue, 2019-05-07 at 16:11 +0300, Adrian Bunk wrote:
> > > Remove the backported patches.
> > > 
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > 
> > Unfortunately this seemed to cause:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/574
> 
> ...
> recipe linux-yocto-4.19.14+gitAUTOINC+9bda6190bf_eebb51300a-r0: task do_compile: Succeeded
> ...
>  In file included from /home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.9/probes/lttng-kprobes.c:31:
> > /home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.9/probes/../blacklist/kprobes.h:19:4: error: #error "Your kernel is known to have buggy optimized kprobes implementation. Fixed by commit 0ac569bf6a7983c0c5747d6df8db9dc05bc92b6c \"ARM: 8834/1: Fix: kprobes: optimized kprobes illegal instruction\" in Linux. Disable CONFIG_OPTPROBES or upgrade your kernel."
> >  #  error "Your kernel is known to have buggy optimized kprobes implementation. Fixed by commit 0ac569bf6a7983c0c5747d6df8db9dc05bc92b6c \"ARM: 8834/1: Fix: kprobes: optimized kprobes illegal instruction\" in Linux. Disable CONFIG_OPTPROBES or upgrade your kernel."
> >     ^~~~~
> > make[4]: *** 
> [/home/pokybuild/yocto-worker/beaglebone-lsb/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/lttng-modules/2.10.9-r0/lttng-modules-2.10.9/probes/lttng-kprobes.o] Error 1
> ...
> 
> 
> Upstream turned a runtime breakage into a build failure:
> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2d16de12b197aed57212826187bcb0ab24ad071e
> 
> IOW, this needs an update of beaglebone-yocto in
> meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.19.bbappend
> (4.19.34 already seems to be in the git tree).

Right, sorry, I hadn't actually read the error :/.

CCing Kevin/Bruce.

Cheers,

Richard




