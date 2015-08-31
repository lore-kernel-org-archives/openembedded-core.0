Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id A78FC74197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:41:33 +0000 (UTC)
Received: by ykax124 with SMTP id x124so340140yka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f3QGPJQLeEfpljI7fVdc7Vr4/gGtcthqRy5Lz4Kj0rk=;
	b=upB5xhMPYuzotNCC/uGGQEjnYvZVTOfCaidlw+pHwlq7r1D1ag5t1hwm/dRzD3XEV+
	VUY/oYIDmnTqr4wHhWWQQFpzdFwy+OF+NmrY4+5rcAUxHTNAQgdKUrX/L0gw2zCA+zbv
	dyTCs25m5sidKiu2Yn3gSyH32IGCYQe1/Rulh1A5Hm3gzlZwTJ0Uz6xUXN25SJVpgdJZ
	HW3L+ViZ4vRIEAA5dPXpqlrybbmJHp8Yug0j/6RkCuq8STW5RIouVJvk3b9woFxtH0L+
	pfho+xBJ1WM85UUk0RnOmQJNVbN6SrZG4M2BzWxpg0SFLnlYUJeOr291XR3GWfOE8/vz
	9qPw==
MIME-Version: 1.0
X-Received: by 10.129.130.134 with SMTP id s128mr21013253ywf.62.1441024893340; 
	Mon, 31 Aug 2015 05:41:33 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Mon, 31 Aug 2015 05:41:33 -0700 (PDT)
In-Reply-To: <1441005290.26554.6.camel@linuxfoundation.org>
References: <cover.1440642427.git.bruce.ashfield@windriver.com>
	<a31e3e1e7be69c7cdfeb2f5ce4913c9dc6256acf.1440642427.git.bruce.ashfield@windriver.com>
	<1440943034.32588.70.camel@linuxfoundation.org>
	<CADkTA4NBF4q4hzKvSPvrhd6XT6e9gPpA6Au3qW0dom8=Nk+nig@mail.gmail.com>
	<CADkTA4M+Vkqg2LSgLXiryOTJtCHNwGOQJbp-8pjUifXNFADsaA@mail.gmail.com>
	<1440949789.32588.73.camel@linuxfoundation.org>
	<CADkTA4Oaih1Ea6uf3_BdUfBZO+cr4LeKk+FgPd-zKvKNzEc7+w@mail.gmail.com>
	<1441005290.26554.6.camel@linuxfoundation.org>
Date: Mon, 31 Aug 2015 08:41:33 -0400
Message-ID: <CADkTA4PV3ZZv3ABZ4R=KRxec+5-gFHhkbOP2edEswmr33W+LfQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] linux-yocto/3.14: cleanups and gcc5 ARM build fixes
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
X-List-Received-Date: Mon, 31 Aug 2015 12:41:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 3:14 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2015-08-30 at 23:17 -0400, Bruce Ashfield wrote:
>> On Sun, Aug 30, 2015 at 11:49 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Sun, 2015-08-30 at 10:34 -0400, Bruce Ashfield wrote:
>> >> On Sun, Aug 30, 2015 at 10:30 AM, Bruce Ashfield
>> >> <bruce.ashfield@gmail.com> wrote:
>> >> > On Sun, Aug 30, 2015 at 9:57 AM, Richard Purdie
>> >> > <richard.purdie@linuxfoundation.org> wrote:
>> >> >> On Wed, 2015-08-26 at 22:31 -0400, Bruce Ashfield wrote:
>> >> >>> Updating the 3.14 SRCREVs to match the latest kernel meta data updates
>> >> >>> and also to merge four patches Richard Purdie located that fix the
>> >> >>> gcc 5.x ARM build (we still have boot issues, but building is the
>> >> >>> first step).
>> >> >>>
>> >> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> >>> ---
>> >> >>>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
>> >> >>>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
>> >> >>>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
>> >> >>>  3 files changed, 14 insertions(+), 14 deletions(-)
>> >> >>>
>> >> >>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
>> >> >>> index 0bd94f0c600d..d59f06b81c04 100644
>> >> >>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
>> >> >>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
>> >> >>> @@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
>> >> >>>
>> >> >>>  require recipes-kernel/linux/linux-yocto.inc
>> >> >>>
>> >> >>> -SRCREV_machine ?= "863ba0912f559ba9d64ab94bf04f0226fdf0cb49"
>> >> >>> -SRCREV_machine_qemuppc ?= "9d464d6696a0fc755c65a2cf75ad7a4656ac6e1e"
>> >> >>> -SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
>> >> >>> +SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
>> >> >>> +SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
>> >> >>> +SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
>> >> >>>
>> >> >>
>> >> >> I can't find e4847afbb42583fa05e6a94c8d0c8f8e37ed5622 on the
>> >> >> standard/qemuppc branch? Did you miss a push?
>> >> >>
>> >> >> I merged this to master not realising this issue and the autobuilder is
>> >> >> now unhappy so need to get this resolved one way or another ASAP :/.
>> >> >
>> >> > I'm out until tomorrow morning. So a revert is the only way to fix it quickly.
>> >> >
>> >> > As I mentioned in my pull request, I had to update all my scripts that do the
>> >> > SRCREV updates for the meta branch split out .. so I warned that something
>> >> > unexpected may have happened (with three kernel versions, and 3 types of
>> >> > kernels across 8 boards ..).
>> >>
>> >> That being said, I did sneak in and check:
>> >>
>> >> > git push origin standard/preempt-rt/qemuppc
>> >> Everything up-to-date
>> >> > git branch --contains e4847afbb42583fa05e6a94c8d0c8f8e37ed5622
>> >>   standard/preempt-rt/qemuppc
>> >>
>> >> That's a merge commit on the top of the branch.
>> >>
>> >> If I get back early enough tonight, I'll look more.
>> >
>> > If I have to guess, your scripts have taken the qemuppc -rt revision and
>> > applied it to the qemuppc standard kernel (the non -rt version).
>>
>> The revs still look right to me.
>>
>> Do you have a link to the autobuilder failure for this one ?
>>
>> You said that e4847afbb42583fa05e6a94c8d0c8f8e37ed5622 wasn't being found
>> for qemuppc on standard/base, in the -rt recipe (at least that's what the first
>> email in the thread seems to indicate).
>>
>> But KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc" is set, which matches
>> the SRCREV that I pushed.
>>
>> So if you point me in the direction of a log, I'll figure out what
>> part I'm missing.
>>
>
> I think I confusingly quoted the wrong part of the diff. The issue is
> more clearly shown by my patch:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=92c3f03b790bdb92d5b81ad00c4815d330a4f832
>
> SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
>
> is set in the non -rt recipe, despite that being a -rt revision.
>
> (the failure is
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/468/steps/BuildImages/logs/stdio)
>
> I can also confirm my patch does fix this one.

Excellent. It was late, so I knew I was misreading something. I won't do
anything for this (except make sure that my scripts are updating recipes
properly).

>
>> > I'll try changing it to the standard/qemuppc revision instead (patch
>> > pushed for that).
>> >
>> > We also have an issue with 3.14 qemumips failing in do_patch:
>> >
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds/464/steps/BuildImages/logs/stdio
>> >
>>
>> I'll have a look at this on in the morning, I've launched a build.
>
> Thanks. Oddly enough, the do_patch succeeded this time. The original
> failure was:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds/464/steps/BuildImages/logs/stdio
>
> ERROR: Function failed: do_patch (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/3.14.36+gitAUTOINC+3a09b38a9f_9c6fdae475-r0/temp/log.do_patch.23426)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/3.14.36+gitAUTOINC+3a09b38a9f_9c6fdae475-r0/temp/log.do_patch.23426
> Log data follows:
> | DEBUG: Executing shell function do_patch
> | [INFO] validating against known patches  (qemumips-standard-meta)
> | fatal: unable to read tree 81509f2de024e7f1d82d95b56fa6b03650ea556e
> | ERROR: could not checkout branch standard/mti-malta32
> | ERROR. could not update git tree
> | WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/3.14.36+gitAUTOINC+3a09b38a9f_9c6fdae475-r0/temp/run.do_patch.23426:1 exit 1 from
> |   patchme qemumips
> | ERROR: Function failed: do_patch (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work/qemumips-poky-linux/linux-yocto/3.14.36+gitAUTOINC+3a09b38a9f_9c6fdae475-r0/temp/log.do_patch.23426)
> NOTE: recipe linux-yocto-3.14.36+gitAUTOINC+3a09b38a9f_9c6fdae475-r0: task do_patch: Failed
>
> this was on centos 6.6, in case its something related to the version of
> git present. The next build which worked was ubuntu1204.

odd.

>
> The other issue is edgerouter:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/builds/464/steps/BuildImages_1/logs/stdio
>
> | {standard input}: Assembler messages:
> | {standard input}:157: Error: opcode not supported on this processor: octeon (mips64r2) `saa $2,($4)'
> |   CC      arch/mips/lib/uncached.o
> |   HOSTCC  lib/gen_crc32table
> |   CC      crypto/rng.o
> | {standard input}:5385: Error: opcode not supported on this processor: octeon (mips64r2) `saa $11,($2)'
> | {standard input}:5810: Error: opcode not supported on this processor: octeon (mips64r2) `saa $10,($2)'
> | {standard input}:6158: Error: opcode not supported on this processor: octeon (mips64r2) `saa $3,($7)'
> |   CC      block/bsg.o
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work-shared/edgerouter/kernel-source/scripts/Makefile.build:308: recipe for target 'arch/mips/cavium-octeon/executive/cvmx-srio.o' failed
> | make[5]: *** [arch/mips/cavium-octeon/executive/cvmx-srio.o] Error 1
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work-shared/edgerouter/kernel-source/scripts/Makefile.build:455: recipe for target 'arch/mips/cavium-octeon/executive' failed
> | make[4]: *** [arch/mips/cavium-octeon/executive] Error 2
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/build/tmp/work-shared/edgerouter/kernel-source/scripts/Makefile.build:455: recipe for target 'arch/mips/cavium-octeon' failed
> | make[3]: *** [arch/mips/cavium-octeon] Error 2
> | make[3]: *** Waiting for unfinished jobs....
>
> We 'cheat' could bump some of the machines to 4.1 at this point...
>

I had assigned this one to Kevin on Friday, so hopefully we'll get a
fix. But yes, all
the h/w references will hopefully bump .. and we can push 3.14 off a
cliff for those
boards.

Bruce

> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

