Return-Path: <kamensky@cisco.com>
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id 9A77F6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=7048; q=dns/txt; s=iport;
	t=1520821510; x=1522031110;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=EMJO2OZQVSKApt+5ob/ucIN94uYvIap+hOZ0rU+09mw=;
	b=FNrrbBEuAdmHG3K08k52S4q6LebXF/SKIqek0VywZrUAzYMEpEAvIkjV
	MZ/WEf79bEUq5uefygAV0YAD5FJUIkGgytub2l2TuX5QcctHDBveNGuoS
	C9/fEcV6VsKcOZN1gRoDHESlbz35TR9rhS0pnaoX/FbvFxoszR9QzajX8 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DsAACm5KVa/5BdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNQgVUojW9zjH2BWyl7G5QyghUKhSUCgxEhNBgBAgEBAQEBAQJ?=
	=?us-ascii?q?rJ4UjAQEBAwEnEQI/BQsLGC5XBhOFEAisRjqIWoIahTWCLoM8NYJDNoULhgAEh?=
	=?us-ascii?q?gKCE4ZSRospCYlTgx6SU5EhAgQLAhMBgSweOIFSTSMVgn2EZyA3jQEBAQE?=
X-IronPort-AV: E=Sophos;i="5.47,459,1515456000"; d="scan'208";a="82022570"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2018 02:25:09 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id w2C2P8XN012883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 12 Mar 2018 02:25:08 GMT
Date: Sun, 11 Mar 2018 19:25:08 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA-d6-_tVRWKbZpVsQtece4fjuUqF+o+-m-AG4jPUHPY4g@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1803111848530.64087@sjc-ads-6991.cisco.com>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
	<412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
	<alpine.LRH.2.00.1803101241080.24419@sjc-ads-6991.cisco.com>
	<CAFEAcA-d6-_tVRWKbZpVsQtece4fjuUqF+o+-m-AG4jPUHPY4g@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Need arm64/qemu help
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
X-List-Received-Date: Mon, 12 Mar 2018 02:25:08 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Sun, 11 Mar 2018, Peter Maydell wrote:

> On 11 March 2018 at 00:11, Victor Kamensky <kamensky@cisco.com> wrote:
>> Hi Richard, Ian,
>>
>> Any progress on the issue? In case if not, I am adding few Linaro guys
>> who work on aarch64 qemu. Maybe they can give some insight.
>
> No immediate answers, but we might be able to have a look
> if you can provide a repro case (image, commandline, etc)
> that doesn't require us to know anything about OE and your
> build/test infra to look at.

Peter, thank you! Appreciate your attention and response to
this. It is fair ask, I should have tried to narrow test
case down before punting it to you guys.

> (QEMU's currently just about
> to head into codefreeze for our next release, so I'm a bit
> busy for the next week or so. Alex, do you have time to
> take a look at this?)
>
> Does this repro with the current head-of-git QEMU?

I've tried head-of-git QEMU (Mar 9) on my ubuntu-16.04
with the same target Image and rootfs I could not reproduce
the issue.

I've started to play around more trying to reduce the test
case. In my setup with OE qith qemu 2.11.1, if I just passed
'-serial sdtio' or '-nographic', instead of '-serial mon:vc'
- with all things the same image boots fine.

So, I started to suspect, even if problem manifests itself
as some functional failure of qemu, the issue could be some
nasty memory corruption of some qemu operational data.
And since qemu pull bunch of dependent
libraries, problem might be not even in qemu.

I realized that in OE in order to disconnect itself from
underlying host, OE builds a lot of its own "native"
libaries and OE qemu uses them. So I've tried to build
head-of-git QEMU but with all native libraries that OE
builds - now such combinations hangs in the same way.

Also I noticed that OE qemu is built with SDL (v1.2),
and libsdl is one that reponsible for '-serial mon:vc'
handling. And I noticed in default OE conf/local.conf
the following statements:

#
# Qemu configuration
#
# By default qemu will build with a builtin VNC server where graphical 
output can be
# seen. The two lines below enable the SDL backend too. By default 
libsdl-native will
# be built, if you want to use your host's libSDL instead of the minimal 
libsdl built
# by libsdl-native then uncomment the ASSUME_PROVIDED line below.
PACKAGECONFIG_append_pn-qemu-native = " sdl"
PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
#ASSUME_PROVIDED += "libsdl-native"

I've tried to build against my host's libSDL and uncommented
above line. It actually failed to build, because my host libSDL
were not happy about ncurses native libraries, so I ended up
adding this as well:

ASSUME_PROVIDED += "ncurses-native"

After that I had to rebuild qemu-native and qemu-helper-native.
With resulting qemu and the same target files, image boots
OK.

With such nasty corruption problem, it always hard to say for
sure, it maybe just timing changes .. , but now it seems it
somewhat points to some issue in OE libsdl version ... And
still it is fairly bizarre, libsdl
that in OE (1.2.15) is the same that I have on my ubuntu
machine and there is no additional patches for it in OE,
although configure options might be quite different.

Thanks,
Victor

>> If for experiment sake I disable loop that tries to find
>> jiffies transition. I.e have something like this:
>>
>> diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
>> index 4769947..e0199fc 100644
>> --- a/lib/raid6/algos.c
>> +++ b/lib/raid6/algos.c
>> @@ -166,8 +166,12 @@ static inline const struct raid6_calls
>> *raid6_choose_gen(
>>
>>                         preempt_disable();
>>                         j0 = jiffies;
>> +#if 0
>>                         while ((j1 = jiffies) == j0)
>>                                 cpu_relax();
>> +#else
>> +                        j1 = jiffies;
>> +#endif /* 0 */
>>                         while (time_before(jiffies,
>>                                             j1 +
>> (1<<RAID6_TIME_JIFFIES_LG2))) {
>>                                 (*algo)->gen_syndrome(disks, PAGE_SIZE,
>> *dptrs);
>> @@ -189,8 +193,12 @@ static inline const struct raid6_calls
>> *raid6_choose_gen(
>>
>>                         preempt_disable();
>>                         j0 = jiffies;
>> +#if 0
>>                         while ((j1 = jiffies) == j0)
>>                                 cpu_relax();
>> +#else
>> +                        j1 = jiffies;
>> +#endif /* 0 */
>>                         while (time_before(jiffies,
>>                                             j1 +
>> (1<<RAID6_TIME_JIFFIES_LG2))) {
>>                                 (*algo)->xor_syndrome(disks, start, stop,
>>
>> Image boots fine after that.
>>
>> I.e it looks as some strange effect in aarch64 qemu that seems does not
>> progress jiffies and code stuck.
>
>> Another observation is that if I put breakpoint for example
>> in do_timer, it actually hits the breakpoint, ie timer interrupt
>> happens in this case, and strangely raid6_choose_gen sequence
>> does progress, ie debugger breakpoints make this case unstuck.
>> Actually several pressing Ctrl-C to interrupt target, followed
>> by continue in gdb let code eventually go out of raid6_choose_gen.
>>
>> Also whenever I presss Ctrl-C in gdb to stop target it always
>> in stalled case drops with $pc into first instruction of el1_irq,
>> I never saw different $pc hang code interrupt. Does it mean qemu
>> hangged on first instruction of el1_irq handler? Note once I do
>> stepi after that it ables to proceseed. If I continue steping
>> eventually it gets to arch_timer_handler_virt and do_timer.
>
> This is definitely rather weird and suggestive of a QEMU bug...
>
>> For Linaro qemu aarch64 guys more details:
>>
>> Situation happens on latest openembedded-core, for qemuarm64 MACHINE.
>> It does not happens always, i.e sometimes it works.
>>
>> Qemu version is 2.11.1 and it is invoked like this (through regular
>> oe runqemu helper utility):
>>
>> /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-aarch64
>> -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev
>> tap,id=net0,ifname=tap0,script=no,downscript=no -drive
>> id=disk0,file=/wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/deploy/images/qemuarm64/core-image-minimal-qemuarm64-20180305025002.rootfs.ext4,if=none,format=raw
>> -device virtio-blk-device,drive=disk0 -show-cursor -device virtio-rng-pci
>> -monitor null -machine virt -cpu cortex-a57 -m 512 -serial mon:vc -serial
>> null -kernel
>> /wd6/oe/20180304/systemtap-oe-sysroot/build/tmp-glibc/deploy/images/qemuarm64/Image
>> -append root=/dev/vda rw highres=off  mem=512M
>> ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyAMA0,38400
>
> Well, you're not running an SMP config, which rules a few
> things out at least.
>
> thanks
> -- PMM
>

