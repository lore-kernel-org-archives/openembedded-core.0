Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SNWVn-0007GI-VF
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 23:46:04 +0200
Received: by lagw12 with SMTP id w12so59298lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=5SWD8Xy990IdrNS7of8xVv6yRwYuybqPDMRlilyaEIM=;
	b=QSWhIhzPKdA4DxPWJUMTD/OjEOchIG19LDS6C2JX81kiuaRIYMsiLRRLMEB38q8m0r
	l2eynR7HHOBVhPOPvdCoYqNITtkwUHIlpHAPBacu3xA19bF6IFnGPf7rudUPqG3Iyu5h
	84+6kY56ZGhDLT/66M1ni/+HKL0PU08fELW5egvVqXMGKEUryx75hhtAB2I85+gOhJzq
	CtJXUV/cVBSaFqFn3TStGSFs+94m1sGtqOW7c+2VPJjTvh503oKe2l01IcGU91fNI8k6
	dYXSTphZLmDrG4Bk7kL+yqOuskA8EpVABIGnsYWuunAokggEbcGfxc1tkIxz/Mj6eTdc
	L2Aw==
Received: by 10.152.133.144 with SMTP id pc16mr8286671lab.0.1335476186341;
	Thu, 26 Apr 2012 14:36:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 26 Apr 2012 14:35:56 -0700 (PDT)
In-Reply-To: <1335474399.20130.35.camel@ted>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Apr 2012 14:35:56 -0700
Message-ID: <CAMKF1sowSgW0DzQb=94UYb2RqSKKnN8+B8t9Wswtne_y6jf3Rg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.7 + mips64 architecture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2012 21:46:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 26, 2012 at 2:06 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-04-26 at 20:30 +0100, Richard Purdie wrote:
>> On Thu, 2012-04-26 at 15:47 +0100, Richard Purdie wrote:
>> > On Wed, 2012-04-25 at 16:31 -0700, Khem Raj wrote:
>> > > Hello
>> > >
>> > > Now that release is almost out of door. I would like some eyes on the
>> > > gcc-4.7 work
>> > > and mips64 architecture support that I have done meanwhile
>> > >
>> > > I have made sure that gcc-4.6 still keeps working and I have patches
>> > > for gcc-4.5 too
>> > > for meta-oe too. I have repeatedly built core-image-sato and
>> > > core-image-minimal for uclibc/eglibc
>> > > but more coverage would be nicer.
>> > >
>> > > The patches are posted here
>> > >
>> > > http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc
>> > >
>> > > I would appreciate any feedback or testing on this
>> >
>> > I had a look through the patch series. I've posted an altered version of
>> > the class override patch. I've pulled the gcc 4.7 part into master-next,
>> > have get gcc 4.7 as the default and am running it though the
>> > autobuilder. That should see how we stand with our usual regression
>> > tests.
>>
>> The builds shows the following failures (I've kept duplication so you
>> can see the patterns). Not too bad considering:
>>
>> MACHINE=qemux86, failure in:
>> gst-ffmpeg:do_configure
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/66/steps/shell_24/logs/stdio
>>
>> MACHINE=qemuarm, failures in:
>> clutter-1.8:do_configure
>> glew:do_compile
>> qt4-x11-free:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_19/logs/stdio
>>
>> MACHINE=qemuppc, failures in:
>> clutter-1.8:do_configure
>> glew:do_compile
>> qt4-x11-free:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_19/logs/stdio
>>
>> MACHINE=mpc8315e-rdb, failure in:
>> mesa-dri:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_35/logs/stdio
>>
>> MACHINE=qemumips, failures in:
>> clutter-1.8:do_configure
>> glew:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_19/logs/stdio
>>
>> MACHINE=beagleboard, failure in:
>> mesa-dri:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_35/logs/stdio
>>
>> MACHINE=routerstationpro, failure in:
>> mesa-dri:do_compile
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_35/logs/stdio
>>
>>
>> Also, adding meta-qt3 and building lsb targets with DISTRO=poky-lsb adds
>> the failure:
>> qt-x11-free:do_compile
>> <plus repeats of the above>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_76/logs/stdio
>

I just looked at this quickly
| powerpc-poky-linux-g++: error: unrecognized command line option '-mmmx'

Its passing x86 options to ppc compiler that is wrong.

I will get to other failures later when I am at home


