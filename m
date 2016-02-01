Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7D08177261
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 17:02:57 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id 5so16177934igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 09:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HayKLTB2Vsnmp3z7aMyBsQtsrGhOLiwVUH7QhTQIRyw=;
	b=IEcJRq3In4SoTrlNLBQN830NLPrEYkW2g1ShzDJ88SIlHeO1D0ykLv/AH6E6nL54Pp
	5jGud3kRf/3Ul+2Gf3BYn3nFN7+XCRwcQVVOYDZNIZd57BwZrV4QsGogaOxMa0x98L15
	yFpzgsUx/AKW2Y+kcbPXuUHf6606cT6FoxQMqP6yeZdQ2ewAT2I3FCjNeeMZ/gwYOJvR
	0Op06suPNo05bizxmNHBt035QrD1l5Q1LCibCVvTJUzLXVYa8/JkTqnJnpIWi0n0PP1I
	I3UOMWdAoBVx4s60pazB/+gusFzkhwwl2ttC72huM+EIsgEilzvsrBMdsGIEMx9u4+TH
	uoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HayKLTB2Vsnmp3z7aMyBsQtsrGhOLiwVUH7QhTQIRyw=;
	b=lwtz3uR/yek0fpKU9r1fXiuVYktgNNJGFB+qVUriWor8WpQNdres7li2XaiATZWwSR
	oX9ggR1bSwcmQnes7EpmTUzKRhTrlpimB+/IWshnhmeAK7Os/jyyhwKQNxOz8mXuzQen
	BgOmbgwwIb4ODLbSN8R5PWmzT+fhYFjgPOxJ4dw/t0oV4bhi27Ce27MOWSZ640HxrcuP
	A9a30gIuwB0HQ9811fp8f+irJ9H3HSFKJJsPn/HmbpFPqgonEuuLKlKEo24O70AwoVGv
	Yt97WX0c8kPD0b3OawoG4qWq/s5sakdaqvaKHTEYiwch20eOlADQfjGZcRWfd9sL+7Zp
	MfUA==
X-Gm-Message-State: AG10YOSuwJZYL3sZC8b8KYwapDtV4bPPSSTDKr+CRvuV+AqjFUsjafEM5g3kLrm4S2/moR/cbuGjY/qsb2b6GQ==
X-Received: by 10.50.171.200 with SMTP id aw8mr12656779igc.77.1454346178121;
	Mon, 01 Feb 2016 09:02:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 09:02:28 -0800 (PST)
In-Reply-To: <1454317955.27087.33.camel@linuxfoundation.org>
References: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
	<56AB73C0.8030505@linux.intel.com>
	<CAMKF1spkRPwBzY+6j6pVM_epfB2sVYS37-i+s9rJw4-rTXOMbQ@mail.gmail.com>
	<1454229127.27087.11.camel@linuxfoundation.org>
	<1454317955.27087.33.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 09:02:28 -0800
Message-ID: <CAMKF1sqwScCqKAQy0RF1D8Z4D_3Uk2wp-h_m5U0Z4xqLkzAY2A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Glibc 2.23 and binutils 2.26
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
X-List-Received-Date: Mon, 01 Feb 2016 17:02:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 1:12 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2016-01-31 at 08:32 +0000, Richard Purdie wrote:
>> On Fri, 2016-01-29 at 06:44 -0800, Khem Raj wrote:
>> > On Fri, Jan 29, 2016 at 6:14 AM, Alexander Kanavin
>> > <alexander.kanavin@linux.intel.com> wrote:
>> > > On 01/17/2016 01:54 PM, Khem Raj wrote:
>> > > >
>> > > > upstream glibc and binutils release branches have been cut out
>> > > > and are
>> > > > being made ready for next release
>> > > > I have put together update patchset for both of them
>> > > >
>> > > > here are the branches
>> > > >
>> > > > https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.
>> > > > 26
>> > > > https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23
>> > >
>> > >
>> > > Hello Khem,
>> > >
>> > > when are you planning to submit these?
>> >
>> > binutils exposes a problem for ppc as a result kernel fails to
>> > build.
>> > The fix is to drop
>> > http://git.openembedded.org/openembedded-core/tree/meta/recipes-dev
>> > to
>> > ols/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux
>> > -target.patch
>> >
>> > that patch makes generic ppc configs to be specific to fsl ppc.
>> > but we need context as to why this was done
>> >
>> > glibc is still not released.
>>
>> I ran the binutils upgrade in -next on the autobuilder. It looked
>> mostly good but with poky-lsb we did see:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb
>> /b
>> uilds/635/steps/BuildImages/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb
>> /b
>> uilds/635/steps/BuildImages_1/logs/stdio
>
> Good news is I fixed the binutils build issues.
>
> There was a window of available time on the autobuilder so I tested
> glibc 2.23 which failed in ltp with:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/634/steps/BuildImages/logs/stdio
>
> bdflush01.c:84:25: fatal error: sys/kdaemon.h: No such file or directory
>
> That made the builds rather red with many failures but was the only
> error I could spot.

yes this is fixed and has been upstreamed as well :) see
https://github.com/linux-test-project/ltp/commit/739bcd5619250b67f7d4eb28eb3ac68ac05db0f1

locally I am carrying a bigger set of fixes ( for musl ) so I did not
propose it yet.
I was expecting that we will upgrade ltp to latest release (20160126)
and get the above fix directly from upstream
before we upgrade to new glibc. If no one is upgrading ltp, I will put
an upgrade patch in my tree.


>
> Cheers,
>
> Richard
>
>

