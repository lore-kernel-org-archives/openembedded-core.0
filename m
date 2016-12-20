Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id A99A777338
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:14:03 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id y124so22806393iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K9RGte2rgMjhd2fsdb8Ag/qUMOLBTxk3G5dVMzUcB7I=;
	b=tPCqPGaKciuhhtSFc4fTpB7aGTymuMqQn60iRuoxQMfui3qynSo1HnKYhiWVCF8tLh
	9R+kbAq6ArOBLJqXUtXKZ8IV+kOgJf5jELwcPslyoFgEjekXBPmlKDZC2GPcwDzW+SSu
	xNw7Ab4qZsNsOC+ZkmxQuv9YBMtsZjDi6RhTu/COFgWVp0I0YfL1oZVQoVd4FJWBD1vL
	qXcXYpCFN7CttlHqNDeidjDf5cUHOYThWey5T6yXlinyKxegEYrqUHA7t8ZjZgyzdq1Z
	ToxvqKqpzlJ2duUvO6iuuJXUUJr0A1eEZNiwWNqWMbihAM4PH8gsC9GPilImeNp7fnv0
	+8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K9RGte2rgMjhd2fsdb8Ag/qUMOLBTxk3G5dVMzUcB7I=;
	b=cIi6MZaLzmyCOWa7VIrwTxDqltQgZkScflErJoB/Jm94X/+rhjWEXp88kc4sK/EVO0
	IsZiCd/y9lsuhbfFLbIk+/c2cJRf17iyVMVPsz6/I0T5BfuFMNkW8gNDd/KiAuUFPAI/
	jg+6dQ3Jvo06YtyvTGjFcMGGc9B6JUMzCy9ibggghWtJLk4gL30cpuvT1axcYnyHkEQu
	Pm9EGITJO2Yi2KQnYIIv3OwlrkDn3ahZLVJg8CsDY5YA50GKVQQTSWeNm9P3SKOQyQuu
	1AVLbhlkxvRb8Z8fao8AtteHdMhOniF1mhZ4trq39n82Jq/SLcu27n3c3klZMFr5pTs6
	Xztg==
X-Gm-Message-State: AIkVDXKstabVlrJYVHW53W6XK5uU4wLP6vMd8j6Nvd7IC2dZ/6MiqraEtoLf1AHIQ9R4mA==
X-Received: by 10.107.10.11 with SMTP id u11mr477849ioi.29.1482246844624;
	Tue, 20 Dec 2016 07:14:04 -0800 (PST)
Received: from openSUSE-i7.site ([45.72.129.229])
	by smtp.gmail.com with ESMTPSA id
	w192sm9029576itw.3.2016.12.20.07.14.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 07:14:03 -0800 (PST)
Date: Tue, 20 Dec 2016 10:14:01 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161220151401.GB11748@openSUSE-i7.site>
References: <CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
	<CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
	<20161220145554.GA11748@openSUSE-i7.site>
	<CAJTo0LajFQ85DckLMqS7Tbza4NJNNc4A6QMuACa4XDb6PiHJnQ@mail.gmail.com>
	<CAJTo0LYzEZpgspkijcDOUUwPSRBaiWsYbts02NkBy4FJW28jOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYzEZpgspkijcDOUUwPSRBaiWsYbts02NkBy4FJW28jOg@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 15:14:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue 2016-12-20 @ 03:05:20 PM, Burton, Ross wrote:
> On 20 December 2016 at 15:00, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > This would be the autoconf macro UL_NCURSES_CHECK in m4/ul.m4, which calls
> > ncurses6-config.  I thought the sysroot was ahead of the host so it should
> > find our broken script before the hosts...
> >
> 
> $ bitbake -e util-linux-native -e
> ...
> export
> PATH="/home/ross/Yocto/poky/scripts/native-intercept:/data/poky-master/tmp-glibc/sysroots-uninative/x86_64-linux/usr/bin:/home/ross/Yocto/poky/scripts:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/sbin:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/sbin:/data/poky-master/tmp-glibc/sysroots/x86_64-linux/bin:/home/ross/Yocto/poky/scripts:/home/ross/Yocto/poky/bitbake/bin:/home/ross/BUILD/bin:/home/ross/bin:/home/ross/Yocto/bb/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
> 
> Definitely the sysroot before the host.

I have:

	export PATH="/z/layerindex-master/layers/openembedded-core/scripts/native-intercept:/z/layerindex-master/raspi3/tmp-glibc/sysroots-uninative/x86_64-linux/usr/bin:/z/layerindex-master/layers/openembedded-core/scripts:/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/usr/bin:/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/usr/sbin:/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/usr/bin:/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/sbin:/z/layerindex-master/raspi3/tmp-glibc/sysroots/x86_64-linux/bin:/z/layerindex-master/layers/openembedded-core/scripts:/z/layerindex-master/layers/bitbake/bin:/home/trevor/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/trevor/local/packages/apache-maven-2.2.1/bin"

which also shows my sysroots before the host.

In my sysroot I have:

	$ find . -name "*curse*" -print | grep config
	./x86_64-linux/usr/share/x86_64-linux_config_site.d/ncurses_config
	./x86_64-linux/usr/lib/pkgconfig/ncurses++.pc
	./x86_64-linux/usr/lib/pkgconfig/ncurses.pc
	./x86_64-linux/usr/lib/pkgconfig/ncursesw.pc
	./x86_64-linux/usr/lib/pkgconfig/ncurses++w.pc
	./x86_64-linux/usr/bin/crossscripts/ncurses5-config
	./x86_64-linux/usr/bin/crossscripts/ncursesw5-config
	./x86_64-linux/usr/bin/ncurses5-config
	./x86_64-linux/usr/bin/ncursesw5-config
	./raspberrypi3/usr/share/arm-oe-linux-gnueabi_config_site.d/ncurses_config
	./raspberrypi3/usr/lib/pkgconfig/ncurses++.pc
	./raspberrypi3/usr/lib/pkgconfig/ncurses.pc
	./raspberrypi3/usr/lib/pkgconfig/ncursesw.pc
	./raspberrypi3/usr/lib/pkgconfig/ncurses++w.pc
	./raspberrypi3/usr/bin/crossscripts/ncurses5-config
	./raspberrypi3/usr/bin/crossscripts/ncursesw5-config

So I only have the version 5 -config scripts, but my host has version 5 and
version 6 -config scripts. I'm guessing we need a dummy ncurses{w}6-config
script in the sysroot too (?)

