Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA1360577;
	Sun, 30 Mar 2014 16:49:22 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id uq10so2563223igb.1
	for <multiple recipients>; Sun, 30 Mar 2014 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5Al5/FZ2kxxiUfdyrWsgveSCpkHrhs0vDjL0xOwcolc=;
	b=QinPuqVV2P8BAkJpjDiq99EoNvTLSP3NEfJ9jK5xPIHEyGXkjut9R+CLvX8GsoO2Ev
	4JRqBI1eS7XQmHnS2B+MHlDYKX3hsE+wH42bNzoIUU3dgYOw30RSfmiGfIUgpe1Zlird
	jiqIjg/+O11TPrOfGYs+iXoibsg3nkpBLbbZFhR4FfrlOKpGwR3sUZEW1TC9WjfdhlAR
	PDTTJN/NYqBcN9qcWZe8d2HmJRuqJaszocjbSTvI7DKJLnNHwfQkQWuf4D/JoWdb5ez0
	D+91vuzqY/ZNE8PLHe7vughIs80z6kuVFqjFTVVa2t4O6YtbDYgEaHzz1B8NLQeaUNJX
	BsXQ==
X-Received: by 10.42.40.83 with SMTP id k19mr24411244ice.3.1396198163685; Sun,
	30 Mar 2014 09:49:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Sun, 30 Mar 2014 09:48:53 -0700 (PDT)
In-Reply-To: <CANyK_8er+2sjvU1csLOEpZ06qCL4h+bP2ecUYYGzyiEw0kXzQw@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
	<CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
	<CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
	<CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
	<CANyK_8er+2sjvU1csLOEpZ06qCL4h+bP2ecUYYGzyiEw0kXzQw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Mar 2014 09:48:53 -0700
Message-ID: <CAMKF1spno7Np8FXr3JXw3_W72+vRkchzZ8J5X+3e4RCFY+6nLg@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Sun, 30 Mar 2014 16:49:28 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 30, 2014 at 8:43 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 30 March 2014 05:17, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Mar 27, 2014 at 5:53 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>>> On 26 March 2014 22:12, Burton, Ross <ross.burton@intel.com> wrote:
>>>> On 26 March 2014 22:04, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> There were interest in other threads in having musl as an alternative
>>>>> to eglibc/uclibc that we already have in OE, in that direction I have
>>>>> poured in my on and off work and put it into a contrib tree
>>>>
>>>> Blimey Khem that was quick. :)
>>>>
>>>
>>> Agreed!
>>>
>>> I wonder if it's worth splitting this out into its own layer though
>>
>> I thought about it and since class/conf changes that need to go in into OE-core
>> first I kept it as it is (lazyness too). I think once the core support
>> is available in OE-core
>> we can spin the recipes into a layer of its own.
>>
>>> (with fixes done via bbappends) so that it's easy for multiple people
>>> to contribute to. It would also mean it doesn't need rebasing onto
>>> master all the time.
>>>
>>> I'd definitely like to get involved with this. In particular I can
>>> ensure opkg (both current release and development branch) work with
>>> musl and see if some of my preferred software from meta-oe will build
>>> (vim, htop, etc).
>>
>> start with what we have. Once master opens up I would propose the needed
>> changes to OE-core and spin a layer
>>
>
> I did a quick 'bitbake -k core-image-minimal' to see what's currently
> failing. Full logs and config at
> http://www.paulbarker.me.uk/musl-build/
>
> Build Configuration:
> BB_VERSION        = "1.21.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "arm-oe-linux-musleabi"
> MACHINE           = "qemuarm"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "armv5 thumb dsp"
> TARGET_FPU        = "soft"
> meta              = "kraj/musl:faafa7022ed057d55c131c456d1bdd5dfa3d2517"
>
> Summary: 6 tasks failed:
>   openembedded-core/meta/recipes-support/attr/attr_2.4.47.bb, do_compile
>   openembedded-core/meta/recipes-devtools/python/python_2.7.3.bb, do_compile
>   openembedded-core/meta/recipes-core/util-linux/util-linux_2.24.1.bb,
> do_compile
>   openembedded-core/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb, do_compile
>   openembedded-core/meta/recipes-core/busybox/busybox_1.22.1.bb, do_compile
>   openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb, do_compile
>
> I can see for util-linux that we need to implement qsort_r().
>
> Busybox probably just needs config changes:
> http://wiki.musl-libc.org/wiki/Building_Busybox


I already have local fix for busy box.

