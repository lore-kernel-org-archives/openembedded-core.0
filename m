Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id DEA1673257
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:09:09 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z14so153634181igp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 09:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zqSR3ikSrB1GPWIpMfcXjpi9DclAS8HwR+wkHveRBoA=;
	b=Jjg3V2C7WtLvZbVG0dlRgDEzyAljSSjCHzd37UpE3NR/LkV1W7fYjIwJC6JgaeAkfy
	QEwXJ1asby4gBy4EiL0WDX5qn/txcP7FKrFWvzLpoZb8YBqfyy3KoD2+nd1KfC+1i/E2
	KmOwz3TBahzVpsVp3E2whtKIBhFjWslwrNvyiXL4qg3Y5192v1uTBaCu/P3DzAc6Vrnn
	QsN576eWMEGGSieU0zRYAJMj/cWt37zlvIMDdxmm4DO0PZL0huRagV/DphtOP9SaZPYj
	JmqghPO1ZsFX43/Gnu0xxNvKgOfJj89cBpJD1eI8kJGulEOby4bDWzJBueap2/K50WFO
	qu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zqSR3ikSrB1GPWIpMfcXjpi9DclAS8HwR+wkHveRBoA=;
	b=hRNs6oLoeEjnAKynoh/H7i3BGXdUgTGTv/+CtKdKrdDHQQnQ4V/aI5HgEFX7iiZ9tE
	VFX1r1GIMXUWyOJCJCcK0/Bov351aG3M3UCOEej2R0MnYAylV+tQMfrjVT+gwpdKfXGt
	H0dQw5DDLy7seN+i9CYUNvOYW63loXspzgInkMmtsqJbIWt2pPIjFKKerzVEfzcyXHMo
	l0NDrOBBAz1PqoY1k4NenJ87sms0pRMnyxOqMUkS5O6ooRbGSzIdLmfa1Vp1Qblzb3sK
	/wfE8e4ZNRlIh7DDk0vvzoJ3K9BqavkOnalgVQcQthZi0HVP8tRGAacFKZo+SGQynUHJ
	Sc/Q==
X-Gm-Message-State: AG10YORsXVfJ5Kmpn/wDKq8oZpZzP+/w9tyFJfqsC2vS9wH+9x77RfJiZM2futokhCEOzBnVGodS/sPY34CLQQ==
X-Received: by 10.50.13.102 with SMTP id g6mr4861109igc.77.1453482550476; Fri,
	22 Jan 2016 09:09:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 09:08:41 -0800 (PST)
In-Reply-To: <CAJTo0LZa9oM8gpqcG7baZa30gree1ijxJsdj9Y1-YttxZ3OqYA@mail.gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<a430918d3d3c0fe58d3cc8ea3d8178e3980c571e.1453029952.git.raj.khem@gmail.com>
	<CAJTo0LZa9oM8gpqcG7baZa30gree1ijxJsdj9Y1-YttxZ3OqYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 09:08:41 -0800
Message-ID: <CAMKF1sqvJ8eZBbwwqVDO=nv9Ase_YQTVaBqcCTAUpWOdhXdwbw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 51/73] db: Use cross libtool
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
X-List-Received-Date: Fri, 22 Jan 2016 17:09:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 4:41 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> db is not reconfigured like usual autotools based components so it
>> generates its own libtool, and this libtool is not equipped to do cross
>> builds, e.g. when building using clang on musl, it misdirects linker to
>> use libstdc++.so from build host instead of target, the reason being it
>> does not understand sysroot.
>>
>> Use cross libtool instead to build the target versions
>>
>> Fixes errors like below
>>
>> | libtool: link: arm-oe-linux-musleabi-ranlib .libs/libdb-6.0.a
>> |
>>
>> /a/builder/mnt/build-oe/tmp-musl/sysroots/x86_64-linux/usr/bin/arm-oe-linux-musleabi/arm-oe-linux-musleabi-ld:
>> error: /usr/lib/libstdc++.so: incompatible target
>
>
> This fails to build on the autobuilder in poky-lsb configurations (which
> turns on securityflags.inc):
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
> In function `__libc_csu_init':
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/i586-poky-linux/glibc/2.22-r0/git/csu/elf-init.c:87:
> undefined reference to `__init_array_start'
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/5.3.0/ld:
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
> relocation R_386_GOTOFF against undefined hidden symbol `__init_array_start'

You can drop this one from this patch set I will submit it another
time after finding the cause and fix.
I need to reproduce it locally here. I think the issue might be that
the makefiles are calling linker directly which works
in common cases but not when -pie is used. Do you have full errors log
somewhere to look into ?

> can not be used when making a shared object
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/5.3.0/ld:
> final link failed: Bad value
> collect2: error: ld returned 1 exit status
> Makefile:884: recipe for target 'libdb_cxx-6.0.la' failed
>
> Ross

