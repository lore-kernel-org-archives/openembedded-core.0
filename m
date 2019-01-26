Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 002457C3E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 21:04:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r24so7327685wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UTwtV1q+y4jCdltHFdcfJK8lktP7KkHH14M6uSTG0Hg=;
	b=WUusH/d4dJD0DZ7sdJKQVI49zxFrb28Oj9KJf+jOUjnkoUBohZR2n3qc68jAz/rykV
	AWbrMJW+k20BeK9H1HDwk7JwxtxFScBuXvgfkZUIYs8DuW4zDT8higYGX4ZanA33nJ/s
	8MvA2cfOSl9cVanah8OD/e3fZYImdARdnRWI3dJlwg1CSILyq8Pf4JvO+KoU3wEMS6/8
	sdGz4a7e8wdXLgRlAtmsHCPHWqecSIv0PxFBHW9FblGQxaVwpftX8VXi6fb+hYK1UPT7
	DVickQv+YGnNvEmsrDEisyXYIvgRPmG8Bj7gF3mTJXwgE/qF5Sd6z8kb6ajz4OlYp3Fw
	ltUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UTwtV1q+y4jCdltHFdcfJK8lktP7KkHH14M6uSTG0Hg=;
	b=Fgw49P0qzQv1rP3B7Mig1SISvDr+NnmliiMopcaBHCnNnpLwiopPQEOoXXMSsPEU0d
	CgsczdP9PQxQOBsYtj6fKawZ8IRomTFCFunnqSsKR5c9Bv+NnJZzURth9l50nRakLGu+
	vjgTy7aqT5XViV13AY8Jn+jOiMnej0fKK9oZ8iJFtow8JVflsfr1PWSwr0D8h/jY98pY
	iBeeW2+M+hO3trT0OSOvB6U2Q2XejGI7eXkpmMZwDT2NbtVAZOPPOglN/yCq7vaJzjre
	GNNnCxB6WR9O9SJcx3QY2XWpSZ4t0utDRbarp7XZAHBqljWMLaQqLigAz8m9+462sysr
	hMQg==
X-Gm-Message-State: AJcUukcgPSy0id4XGKpO9EDBvo6jHnygLL++t2iXFSzpuYkBoD6brbJo
	0ONjDFba2AGziw//i/DgwWwB6GGsrEVkZJKdQXw=
X-Google-Smtp-Source: ALg8bN46KgzMZW2z0UaQO1qwKsgbGJpzCiHAYaN1ObTWbU/JQ8u1AMufbLUe+Byi2hBSaFi0zSHSUntwfjqTnybynJ8=
X-Received: by 2002:a1c:4301:: with SMTP id q1mr11325896wma.44.1548536663143; 
	Sat, 26 Jan 2019 13:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20190123200520.14956-1-raj.khem@gmail.com>
	<CAJ86T=XF3Xr0x6zEH2nsHhLQ3afEMP3Ot31pbK9-66ORrCjnsg@mail.gmail.com>
	<CAMKF1srPt+fiSotytF2jczPEoCsCP5x7U=bODNe23476CA_ABQ@mail.gmail.com>
	<CAJ86T=Xp_KgsZWv=oj4kEdWqAihMNASpOMc0s7nLHgcpVozWsg@mail.gmail.com>
	<CAMKF1sqcKnd1ZaGxjQqPH2oYVhyuO=h1wSREii2jXsGkf=5QFQ@mail.gmail.com>
	<8cb035d4-2213-905e-68ec-4903758499e8@windriver.com>
	<CAMKF1sq_eLh0ahLm0fC7+ZHPbR28-1jj6scFFZwDXxWjxupEFg@mail.gmail.com>
	<CA+chaQcQ_eauCeAZykSOE2WgbQkCaZCcf5TAyBTVXGewyn0NFA@mail.gmail.com>
	<CAMKF1sp10CWNkFe3jEdNX7T_ThsDA08mMDvzM70kFi09nhNLdg@mail.gmail.com>
In-Reply-To: <CAMKF1sp10CWNkFe3jEdNX7T_ThsDA08mMDvzM70kFi09nhNLdg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 26 Jan 2019 22:04:13 +0100
Message-ID: <CA+chaQd+jryMbczj0duzvcOub1FozskRECe=aRM6JC3GefGm_A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-arm: Do not add -march options for arm architecture
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
X-List-Received-Date: Sat, 26 Jan 2019 21:04:23 -0000
Content-Type: multipart/alternative; boundary="000000000000ba9802058062c9c8"

--000000000000ba9802058062c9c8
Content-Type: text/plain; charset="UTF-8"

>  2. Just use -mcpu and do not use -march/-mtune and may be
provide mechanism to override -mcpu, which is done by packages anyway (
maps directly to package architectures )

This would be my preferred solution, I know that tune files are already
quite complicated, but another variable which will hold either just march
(for more generic DEFAULTTUNEs as Andre reported) or mcpu (for DEFAULTTUNEs
targeting specific cpu) or possibly mtune as well (if someone really wants
and overrides this variable in his DISTRO) doesn't make it much more
complicated and should work fine for everybody.



On Sat, Jan 26, 2019 at 7:45 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Jan 26, 2019 at 9:39 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Which -mcpu/-march combination is causing issue in gcc9?
>
> Its when using cortex-a5 tunes, -march=armv7-a -mcpu=cortex-a5, but if
> we move the needle to fix the issue or test coverage then we miss the
> point here, the fact that this keeps coming up means we have a
> fundamental problem.
>
> >
> > I know we had this issue with armv7a tunes before, that's why I've added
> separate armv7ve before the switch from -mtune to -mcpu.
> >
>
> Thats fine, however as I have explained before -mcpu is a combination
> of implicit -march and -mtune, so for best results should not be mixed
> with them. Originally the tune design in OE is one to one if we used
> -march + -mtune
> method. That does not mean that -mcpu approach is inferior on the
> contrary might be better in certain cases and in fact in majority of
> cases we have.
>
> > I still believe -mcpu (with or without -march) is better option.
> >
>
> I think on one hand it is, but there is another part which Mark
> brought up of customized CPU implementations with not to common
> choices of subsystems, which may not be exactly represented by -mcpu
> options. I am inclined to
> provide provisions to make it happen but I am not in favor of
> designing it to address these corner implementations. I would rather
> make it easy for 99% usecases.
>
> > Using -mtune without indicating which -mtune was actually used in the
> package arch is bad (especially if you have multiple MACHINEs with
> different DEFAULTTUNEs e.g. cortexa7, cortexa8 in -mtune, but both ending
> in armv7a package arch, unpacking all packages from sstate every time you
> switch MACHINE and the package manager on target never knowing which -mtune
> was used to build given package upgrade from feed).
> >
>
> Yes this was a change for better.
>
> > Switching from -mcpu to -mtune while keeping the current cpu-specific
> package architectures is better, but then the use case, that I build
> everything e.g. with cortexa8 in -mtune and install this cortexa8 package
> feed on cortexa7 MACHINEs also looks strange, yes it will work in runtime,
> but why not use generic armv7a DEFAULTTUNE to make it clear (to package
> manager as well as end user) that I'm not really optimizing for given CPU).
> >
>
> In current design I think we have design for using more optimized for
> a CPU and be able to generate feeds which are cpu specific which is
> great for certain use cases and hopefully more tunes to that CPU
> implementation.
>
> > From the naive openssl benchmarks I did few years back, there was very
> small difference between mtune/mcpu/just-march, but still for projects
> where I have separate package feeds for each device (e.g. LG TVs) I prefer
> to use -mcpu (because I really know that such packages won't ever be used
> on device with different CPU) and e.g. in LuneOS we're more concerned about
> package feed size and build time, so we select more generic DEFAULTTUNE
> which is shared across many MACHINEs and that doesn't have any -mcpu (nor
> -mtune) options in it, so should be fine as well.
>
> Exactly, the point here, we will be best served if we make it one way
> or other, e.g. raspbian used thumb1 ISA across all rpi implementations
> and they can use same feeds across all RPis that have even existed. It
> has advantages of
> its own to be able to do that, especially for people who work on
> higher stacks they would be happy with such a setup.
>
> So I have to suggest on of three approached
>
> 1. Change -mcpu to -mtune and keep everything same. This make feed
> arches point to tuned packages but fundamentally same for base
> architecture ( e.g. armv7-a),
> 2. Just use -mcpu and do not use -march/-mtune and may be provide
> mechanism to override -mcpu, which is done by packages anyway ( maps
> directly to package architectures )
> 3. Just use -march and drop -mcpu and -mtune - Rename feed arches to
> map to arch+features conventions instead of being CPU specific, this
> will freak the users since it will be overwhelming to understand the
> combinations
>     e.g.  armv7ve+neon+vfpv4 etc. so the combination becomes
> equivalent to -mcpu, current tune architecture we can construct this
> easily by appending to march based on TUNE_FEATURES but I think
> package arches will be a              massive to deal with and users
> might ask what is this long -march/-mtune pointing to in terms of CPU,
> but it will address Mark's usecase and will bring us closer to using
> mcpu usecase, We can probaly do a bettter error reporting
>     as well for conflicting tune features.
>
> I can cook up patches for option 3 from tunes part, packaging part I
> am not sure maybe we can live with what we have
> option 2 I already have posted a patch, option 1 would be a simplest
> patch of all which can be done quickly as well.
>
> >
> > We can easily extend the tune-test script I've used back then when
> switching to -mcpu to not only use bitbake -e, but also call gcc-cross to
> check for possible warnings from incompatible march/mcpu combinations and
> fix those. The old version is here:
> >
> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
> > it was used in mcpu switch here:
> >
> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune3
> >
> > From the gcc git log I don't see many changes in:
> >
> https://github.com/gcc-mirror/gcc/commits/master/gcc/config/arm/driver-arm.c
> > nor
> >
> https://github.com/gcc-mirror/gcc/commits/master/gcc/config/arm/arm-cpus.in
> > so I'm really interested which combination issues the warning now.
> >
> > Regards,
> >
> > On Sat, Jan 26, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >> On Fri, Jan 25, 2019 at 12:32 PM Mark Hatle <mark.hatle@windriver.com>
> wrote:
> >> >
> >> > On 1/24/19 9:22 PM, Khem Raj wrote:
> >> > > On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> > >>
> >> > >> On Wed, Jan 23, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> >> > >>>
> >> > >>> On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy <
> armccurdy@gmail.com> wrote:
> >> > >>>>
> >> > >>>> On Wed, Jan 23, 2019 at 12:05 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> >> > >>>>>
> >> > >>>>> tune files which inherit the arch definitions already define
> appropriate
> >> > >>>>> -mcpu option, which is equivalent of right -march and -mtune
> combination
> >> > >>>>
> >> > >>>> And what about machines which inherit an arch definition instead
> of a
> >> > >>>> cpu definition? Is that no longer supported?
> >> > >>>
> >> > >>> I could not find such a machine configuration in several BSP
> layers I looked at.
> >> > >>> Do you know of machine definitions where these files are included
> >> > >>> directly in machine configs ?
> >> > >>
> >> > >> Using a CPU specific include but then leaving the generic
> DEFAULTTUNE
> >> > >> (ie not enabling any CPU specific TUNE_CCARGS) is equivalent, and I
> >> > >> guess quite common.
> >> > >
> >> > > defaulttune does not play much part in appending -mcpu option to
> >> > > compiler flags, A case
> >> > > where this could bypass the setting mcpu is when we do not include a
> >> > > tune-* for arm based machine
> >> > > and thats the case I was interested to know.
> >> > >
> >> > > again if there is such a BSP I would be interested to test it out.
> >> > >>
> >> > >>> if so, then we have to either use _remove or introduce a weak
> variable
> >> > >>> to set march only if
> >> > >>> mcpu is not set which
> >> > >>
> >> > >> I think the solution is to ensure that the CPU specific tuning
> options
> >> > >> are always compatible with any architecture specific options which
> may
> >> > >> be active.
> >> > >>
> >> > >> In general our CPU specific tuning files are a little sloppy (e.g.
> >> > >> defaulting to combinations of VFP versions and architecture levels
> >> > >> which never exist in the real world). If newer versions of gcc are
> >> > >> making those issues more apparent then why not take the
> opportunity to
> >> > >> fix them properly?
> >> > >
> >> > > the mcpu option is helping with right march/mtune combination.
> while we can
> >> > > use specific -march=arch(+-)features syntax and combine with right
> >> > > -mtune to match -mcpu I think we should use
> >> > > compiler defaults and not try to recreate something that -mcpu would
> >> > > do it easily for us.
> >> > >
> >> > > So either we drop the idea of setting mcpu and use basic -march
> value
> >> > > combined with -mtune ( which btw. was default in past)
> >> > > or if we want to let compiler use ISA for a particular arch
> >> > > implementation ( cortexXXX ) then we should just use -mcpu and drop
> >> > > using -mtune and -march.
> >> > >
> >> > > I would include towards option 1.
> >> >
> >> > I know this is a bit of a 'me too' response, but we have to pick one
> format and
> >> > stay with it.  Either option, but not both.
> >>
> >> I concur.
> >>
> >>
> >> >
> >> > -IF- we know that the appropriate -mcpu options are available for all
> of the
> >> > potential combinations out there, then this is by far the preferred
> method in my
> >> > mind.  Much easier to handle and manage...
> >>
> >> -mcpu options are available for known CPU implementations. But there
> always will
> >> be weird ones, given how people can pick and choose subsystems for SOC
> on this
> >> architecture, and its highly probable that they wont be in gcc. so real
> question we need to answer for is, should we design for those cases and how
> often does this often.
> >>
> >>
> >> >
> >> > However, the more complex route came out as various 'odd-ball' (and
> people claim
> >> > don't exist, but they do) custom ARM cores get released without
> 'mandatory' math
> >> > units, or some other odd ball variation.  (I've seen this numerous
> times over
> >> > the last 20 years that something that doesn't exist, does... all
> because it's a
> >> > custom part.)
> >>
> >> Yes, I am dealing with one such design even today
> >>
> >>
> >> >
> >> > If we have an easy way to define the -mcpu= means some magic
> combination of
> >> > -march/-mtune within the GCC spec itself, then I'm 100% for moving to
> -mcpu to
> >> > rid ourselves of this mess.. and then we still have the flexibility
> to easily
> >> > update/add tunes and GCC configuration for the odd-balls that seem to
> crop up
> >> > regularly.
> >>
> >> So yes we can do nearly same but not exactly same. We have to start
> adding or deleting
> >> features via -march and -mtune would be same value, but there are cases
> where gcc defines
> >> internal properties based on mcpu, that is not representable in those
> suffixes we will add. so
> >> we will come very close but not exact and I think compiler is right in
> this case because we
> >> are not exactly telling it about a CPU implementation, but we are
> telling the cpu has these properties, so it really may not be one of
> standard cpu implementation.
> >>
> >>
> >> >
> >> > (I know -I- can always patch GCC for new -mcpu combinations, but I'm
> not
> >> > thinking about 'me', I'm thinking about the user of OE who is told
> 'use this
> >> > CPU, it has this set of functions' and is NOT a compiler expert who
> can wade
> >> > through GCC spec files and generate patches with any confidence.)
> >> >
> >>
> >> I would think we can solve this for these niche cases, via using
> -march/-mtune and drop
> >> -mcpu, we can append adding/deleting a given feature e.g. neon or vfp
> or vfpv3 etc.
> >> but this would mean we have to rename our package feed names as well to
> match this
> >> new representation, which currently is mapped to mcpu values. This is
> quite a departure
> >> from package feeds point of view. but its more aligned with how we have
> defined arch and tunes.
> >> so pick the battles.
> >>
> >>
> >> > --Mark
> >> >
> >> > >>
> >> > >>>>> and is preferred since gcc is getting stricter and stricter
> with option
> >> > >>>>> check semantics and can now find incompatible -march and -mcpu
> options
> >> > >>>>> better with every release. It does internal feature consistency
> check
> >> > >>>>> and if it finds out discrepency between what -mcpu would expand
> to as
> >> > >>>>> compared to -march it will flag the options to be incompatible,
> for
> >> > >>>>> naked eye it sounds wrong but gcc would translate -mcpu to a
> given
> >> > >>>>> -march internally and it might not match to what we set in
> these arch
> >> > >>>>> files.
> >> > >>>>>
> >> > >>>>> The effects are quite subtle, where this can result in
> configure test
> >> > >>>>> failing to compile due to these incompatible options and a
> feature
> >> > >>>>> option getting disabled for a recipe for no reason.
> >> > >>>>>
> >> > >>>>> e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
> >> > >>>>> -march=armv7-a are incompatible, many features in libstdc++
> ends up
> >> > >>>>> disabled due to configure check failures e.g. size_t size,
> ptrdiff_t
> >> > >>>>> sizes, which inturn results in compiling libstdc++ with unwanted
> >> > >>>>> disabled features.
> >> > >>>>
> >> > >>>> It would be interesting to see more specific details of this.
> >> > >>>
> >> > >>> These are configure tests which fail when -Werror is in use and
> is not
> >> > >>> limited to libstdc++
> >> > >>> it can happen in any package. Since the diagnostic about
> incompatible
> >> > >>> march mcpu pair
> >> > >>> is a warning in general, it does not matter, but when we have
> -Werror
> >> > >>> enabled this turns
> >> > >>> into error, You can simply try a small helloworld example to see
> the effects.
> >> > >>>
> >> > >>>>
> >> > >>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > >>>>> ---
> >> > >>>>>  meta/conf/machine/include/arm/arch-armv4.inc   | 1 -
> >> > >>>>>  meta/conf/machine/include/arm/arch-armv5.inc   | 1 -
> >> > >>>>>  meta/conf/machine/include/arm/arch-armv6.inc   | 1 -
> >> > >>>>>  meta/conf/machine/include/arm/arch-armv7a.inc  | 1 -
> >> > >>>>>  meta/conf/machine/include/arm/arch-armv7ve.inc | 1 -
> >> > >>>>>  meta/conf/machine/include/tune-iwmmxt.inc      | 2 +-
> >> > >>>>>  6 files changed, 1 insertion(+), 6 deletions(-)
> >> > >>>>>
> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv4.inc
> b/meta/conf/machine/include/arm/arch-armv4.inc
> >> > >>>>> index 47a7ad2830..52d8ab1e8f 100644
> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv4.inc
> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv4.inc
> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv4"
> >> > >>>>>
> >> > >>>>>  TUNEVALID[arm] = "Enable ARM instruction set"
> >> > >>>>>  TUNEVALID[armv4] = "Enable instructions for ARMv4"
> >> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4',
> ' -march=armv4t', '', d)}"
> >> > >>>>>  # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but
> then disable it when we have also armv5 or thumb
> >> > >>>>>  # maybe we should extend bb.utils.contains to support check
> for any checkvalues in value, now it does
> >> > >>>>>  # checkvalues.issubset(val) which cannot be used for negative
> test of foo neither bar in value
> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc
> b/meta/conf/machine/include/arm/arch-armv5.inc
> >> > >>>>> index f9068af9de..1fe1b6b8e4 100644
> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv5.inc
> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv5"
> >> > >>>>>
> >> > >>>>>  TUNEVALID[armv5] = "Enable instructions for ARMv5"
> >> > >>>>>  TUNECONFLICTS[armv5] = "armv4"
> >> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5',
> ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
> >> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv5', 'armv5:', '' ,d)}"
> >> > >>>>>
> >> > >>>>>  require conf/machine/include/arm/arch-armv4.inc
> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc
> b/meta/conf/machine/include/arm/arch-armv6.inc
> >> > >>>>> index 6c838e999c..adb9be8050 100644
> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv6hf"
> >> > >>>>>
> >> > >>>>>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
> >> > >>>>>  TUNECONFLICTS[armv6] = "armv4 armv5"
> >> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',
> ' -march=armv6', '', d)}"
> >> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv6', 'armv6:', '' ,d)}"
> >> > >>>>>
> >> > >>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
> b/meta/conf/machine/include/arm/arch-armv7a.inc
> >> > >>>>> index a2663d8008..09d2c03a5d 100644
> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> >> > >>>>> @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?= "thumb"
> >> > >>>>>
> >> > >>>>>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
> >> > >>>>>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> >> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'armv7a', ' -march=armv7-a', '', d)}"
> >> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv7a', 'armv7a:', '' ,d)}"
> >> > >>>>>
> >> > >>>>>  require conf/machine/include/arm/arch-armv6.inc
> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
> b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> > >>>>> index 4d9260fecb..31e334f645 100644
> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv7vethf"
> >> > >>>>>
> >> > >>>>>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
> >> > >>>>>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
> >> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'armv7ve', ' -march=armv7ve', '', d)}"
> >> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv7ve', 'armv7ve:', '' ,d)}"
> >> > >>>>>
> >> > >>>>>  require conf/machine/include/arm/arch-armv7a.inc
> >> > >>>>> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc
> b/meta/conf/machine/include/tune-iwmmxt.inc
> >> > >>>>> index f27423cb2e..6e577697cc 100644
> >> > >>>>> --- a/meta/conf/machine/include/tune-iwmmxt.inc
> >> > >>>>> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
> >> > >>>>> @@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
> >> > >>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
> >> > >>>>>
> >> > >>>>>  TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor
> optimizations"
> >> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
> >> > >>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
> >> > >>>>>
> >> > >>>>>  AVAILTUNES += "iwmmxt"
> >> > >>>>>  ARMPKGARCH_tune-iwmmxt = "iwmmxt"
> >> > >>>>> --
> >> > >>>>> 2.20.1
> >> > >>>>>
> >> > >>>>> --
> >> > >>>>> _______________________________________________
> >> > >>>>> Openembedded-core mailing list
> >> > >>>>> Openembedded-core@lists.openembedded.org
> >> > >>>>>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ba9802058062c9c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0

2. Just use -mcpu and do not use -march/-mtune and may be provide=C2=A0mech=
anism to override -mcpu, which is done by packages anyway ( maps=C2=A0direc=
tly to package architectures )<div><br></div><div>This would be my preferre=
d solution, I know that tune files are already quite complicated, but anoth=
er variable which will hold either just march (for more generic DEFAULTTUNE=
s as Andre reported) or mcpu (for DEFAULTTUNEs targeting specific cpu) or p=
ossibly mtune as well (if someone really wants and overrides this variable =
in his DISTRO) doesn&#39;t make it much more complicated and should work fi=
ne for everybody.</div><div><br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 26, 2019=
 at 7:45 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sat, Jan 26, 2019 at 9:39 AM Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Which -mcpu/-march combination is causing issue in gcc9?<br>
<br>
Its when using cortex-a5 tunes, -march=3Darmv7-a -mcpu=3Dcortex-a5, but if<=
br>
we move the needle to fix the issue or test coverage then we miss the<br>
point here, the fact that this keeps coming up means we have a<br>
fundamental problem.<br>
<br>
&gt;<br>
&gt; I know we had this issue with armv7a tunes before, that&#39;s why I&#3=
9;ve added separate armv7ve before the switch from -mtune to -mcpu.<br>
&gt;<br>
<br>
Thats fine, however as I have explained before -mcpu is a combination<br>
of implicit -march and -mtune, so for best results should not be mixed<br>
with them. Originally the tune design in OE is one to one if we used<br>
-march + -mtune<br>
method. That does not mean that -mcpu approach is inferior on the<br>
contrary might be better in certain cases and in fact in majority of<br>
cases we have.<br>
<br>
&gt; I still believe -mcpu (with or without -march) is better option.<br>
&gt;<br>
<br>
I think on one hand it is, but there is another part which Mark<br>
brought up of customized CPU implementations with not to common<br>
choices of subsystems, which may not be exactly represented by -mcpu<br>
options. I am inclined to<br>
provide provisions to make it happen but I am not in favor of<br>
designing it to address these corner implementations. I would rather<br>
make it easy for 99% usecases.<br>
<br>
&gt; Using -mtune without indicating which -mtune was actually used in the =
package arch is bad (especially if you have multiple MACHINEs with differen=
t DEFAULTTUNEs e.g. cortexa7, cortexa8 in -mtune, but both ending in armv7a=
 package arch, unpacking all packages from sstate every time you switch MAC=
HINE and the package manager on target never knowing which -mtune was used =
to build given package upgrade from feed).<br>
&gt;<br>
<br>
Yes this was a change for better.<br>
<br>
&gt; Switching from -mcpu to -mtune while keeping the current cpu-specific =
package architectures is better, but then the use case, that I build everyt=
hing e.g. with cortexa8 in -mtune and install this cortexa8 package feed on=
 cortexa7 MACHINEs also looks strange, yes it will work in runtime, but why=
 not use generic armv7a DEFAULTTUNE to make it clear (to package manager as=
 well as end user) that I&#39;m not really optimizing for given CPU).<br>
&gt;<br>
<br>
In current design I think we have design for using more optimized for<br>
a CPU and be able to generate feeds which are cpu specific which is<br>
great for certain use cases and hopefully more tunes to that CPU<br>
implementation.<br>
<br>
&gt; From the naive openssl benchmarks I did few years back, there was very=
 small difference between mtune/mcpu/just-march, but still for projects whe=
re I have separate package feeds for each device (e.g. LG TVs) I prefer to =
use -mcpu (because I really know that such packages won&#39;t ever be used =
on device with different CPU) and e.g. in LuneOS we&#39;re more concerned a=
bout package feed size and build time, so we select more generic DEFAULTTUN=
E which is shared across many MACHINEs and that doesn&#39;t have any -mcpu =
(nor -mtune) options in it, so should be fine as well.<br>
<br>
Exactly, the point here, we will be best served if we make it one way<br>
or other, e.g. raspbian used thumb1 ISA across all rpi implementations<br>
and they can use same feeds across all RPis that have even existed. It<br>
has advantages of<br>
its own to be able to do that, especially for people who work on<br>
higher stacks they would be happy with such a setup.<br>
<br>
So I have to suggest on of three approached<br>
<br>
1. Change -mcpu to -mtune and keep everything same. This make feed<br>
arches point to tuned packages but fundamentally same for base<br>
architecture ( e.g. armv7-a),<br>
2. Just use -mcpu and do not use -march/-mtune and may be provide<br>
mechanism to override -mcpu, which is done by packages anyway ( maps<br>
directly to package architectures )<br>
3. Just use -march and drop -mcpu and -mtune - Rename feed arches to<br>
map to arch+features conventions instead of being CPU specific, this<br>
will freak the users since it will be overwhelming to understand the<br>
combinations<br>
=C2=A0 =C2=A0 e.g.=C2=A0 armv7ve+neon+vfpv4 etc. so the combination becomes=
<br>
equivalent to -mcpu, current tune architecture we can construct this<br>
easily by appending to march based on TUNE_FEATURES but I think<br>
package arches will be a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ma=
ssive to deal with and users<br>
might ask what is this long -march/-mtune pointing to in terms of CPU,<br>
but it will address Mark&#39;s usecase and will bring us closer to using<br=
>
mcpu usecase, We can probaly do a bettter error reporting<br>
=C2=A0 =C2=A0 as well for conflicting tune features.<br>
<br>
I can cook up patches for option 3 from tunes part, packaging part I<br>
am not sure maybe we can live with what we have<br>
option 2 I already have posted a patch, option 1 would be a simplest<br>
patch of all which can be done quickly as well.<br>
<br>
&gt;<br>
&gt; We can easily extend the tune-test script I&#39;ve used back then when=
 switching to -mcpu to not only use bitbake -e, but also call gcc-cross to =
check for possible warnings from incompatible march/mcpu combinations and f=
ix those. The old version is here:<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?=
h=3Djansa/tune-test" rel=3D"noreferrer" target=3D"_blank">http://git.openem=
bedded.org/openembedded-core-contrib/log/?h=3Djansa/tune-test</a><br>
&gt; it was used in mcpu switch here:<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?=
h=3Djansa/tune2-test" rel=3D"noreferrer" target=3D"_blank">http://git.opene=
mbedded.org/openembedded-core-contrib/log/?h=3Djansa/tune2-test</a><br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?=
h=3Djansa/tune3" rel=3D"noreferrer" target=3D"_blank">http://git.openembedd=
ed.org/openembedded-core-contrib/log/?h=3Djansa/tune3</a><br>
&gt;<br>
&gt; From the gcc git log I don&#39;t see many changes in:<br>
&gt; <a href=3D"https://github.com/gcc-mirror/gcc/commits/master/gcc/config=
/arm/driver-arm.c" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
gcc-mirror/gcc/commits/master/gcc/config/arm/driver-arm.c</a><br>
&gt; nor<br>
&gt; <a href=3D"https://github.com/gcc-mirror/gcc/commits/master/gcc/config=
/arm/arm-cpus.in" rel=3D"noreferrer" target=3D"_blank">https://github.com/g=
cc-mirror/gcc/commits/master/gcc/config/arm/arm-cpus.in</a><br>
&gt; so I&#39;m really interested which combination issues the warning now.=
<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; On Sat, Jan 26, 2019 at 5:29 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Jan 25, 2019 at 12:32 PM Mark Hatle &lt;<a href=3D"mailto:=
mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt=
; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 1/24/19 9:22 PM, Khem Raj wrote:<br>
&gt;&gt; &gt; &gt; On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy &lt;<a hre=
f=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&=
gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Wed, Jan 23, 2019 at 2:50 PM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy &l=
t;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.=
com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; On Wed, Jan 23, 2019 at 12:05 PM Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; tune files which inherit the arch defini=
tions already define appropriate<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -mcpu option, which is equivalent of rig=
ht -march and -mtune combination<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; And what about machines which inherit an arc=
h definition instead of a<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; cpu definition? Is that no longer supported?=
<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; I could not find such a machine configuration in=
 several BSP layers I looked at.<br>
&gt;&gt; &gt; &gt;&gt;&gt; Do you know of machine definitions where these f=
iles are included<br>
&gt;&gt; &gt; &gt;&gt;&gt; directly in machine configs ?<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Using a CPU specific include but then leaving the ge=
neric DEFAULTTUNE<br>
&gt;&gt; &gt; &gt;&gt; (ie not enabling any CPU specific TUNE_CCARGS) is eq=
uivalent, and I<br>
&gt;&gt; &gt; &gt;&gt; guess quite common.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; defaulttune does not play much part in appending -mcpu o=
ption to<br>
&gt;&gt; &gt; &gt; compiler flags, A case<br>
&gt;&gt; &gt; &gt; where this could bypass the setting mcpu is when we do n=
ot include a<br>
&gt;&gt; &gt; &gt; tune-* for arm based machine<br>
&gt;&gt; &gt; &gt; and thats the case I was interested to know.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; again if there is such a BSP I would be interested to te=
st it out.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; if so, then we have to either use _remove or int=
roduce a weak variable<br>
&gt;&gt; &gt; &gt;&gt;&gt; to set march only if<br>
&gt;&gt; &gt; &gt;&gt;&gt; mcpu is not set which<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I think the solution is to ensure that the CPU speci=
fic tuning options<br>
&gt;&gt; &gt; &gt;&gt; are always compatible with any architecture specific=
 options which may<br>
&gt;&gt; &gt; &gt;&gt; be active.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; In general our CPU specific tuning files are a littl=
e sloppy (e.g.<br>
&gt;&gt; &gt; &gt;&gt; defaulting to combinations of VFP versions and archi=
tecture levels<br>
&gt;&gt; &gt; &gt;&gt; which never exist in the real world). If newer versi=
ons of gcc are<br>
&gt;&gt; &gt; &gt;&gt; making those issues more apparent then why not take =
the opportunity to<br>
&gt;&gt; &gt; &gt;&gt; fix them properly?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; the mcpu option is helping with right march/mtune combin=
ation. while we can<br>
&gt;&gt; &gt; &gt; use specific -march=3Darch(+-)features syntax and combin=
e with right<br>
&gt;&gt; &gt; &gt; -mtune to match -mcpu I think we should use<br>
&gt;&gt; &gt; &gt; compiler defaults and not try to recreate something that=
 -mcpu would<br>
&gt;&gt; &gt; &gt; do it easily for us.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; So either we drop the idea of setting mcpu and use basic=
 -march value<br>
&gt;&gt; &gt; &gt; combined with -mtune ( which btw. was default in past)<b=
r>
&gt;&gt; &gt; &gt; or if we want to let compiler use ISA for a particular a=
rch<br>
&gt;&gt; &gt; &gt; implementation ( cortexXXX ) then we should just use -mc=
pu and drop<br>
&gt;&gt; &gt; &gt; using -mtune and -march.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I would include towards option 1.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I know this is a bit of a &#39;me too&#39; response, but we h=
ave to pick one format and<br>
&gt;&gt; &gt; stay with it.=C2=A0 Either option, but not both.<br>
&gt;&gt;<br>
&gt;&gt; I concur.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -IF- we know that the appropriate -mcpu options are available=
 for all of the<br>
&gt;&gt; &gt; potential combinations out there, then this is by far the pre=
ferred method in my<br>
&gt;&gt; &gt; mind.=C2=A0 Much easier to handle and manage...<br>
&gt;&gt;<br>
&gt;&gt; -mcpu options are available for known CPU implementations. But the=
re always will<br>
&gt;&gt; be weird ones, given how people can pick and choose subsystems for=
 SOC on this<br>
&gt;&gt; architecture, and its highly probable that they wont be in gcc. so=
 real question we need to answer for is, should we design for those cases a=
nd how often does this often.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; However, the more complex route came out as various &#39;odd-=
ball&#39; (and people claim<br>
&gt;&gt; &gt; don&#39;t exist, but they do) custom ARM cores get released w=
ithout &#39;mandatory&#39; math<br>
&gt;&gt; &gt; units, or some other odd ball variation.=C2=A0 (I&#39;ve seen=
 this numerous times over<br>
&gt;&gt; &gt; the last 20 years that something that doesn&#39;t exist, does=
... all because it&#39;s a<br>
&gt;&gt; &gt; custom part.)<br>
&gt;&gt;<br>
&gt;&gt; Yes, I am dealing with one such design even today<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If we have an easy way to define the -mcpu=3D means some magi=
c combination of<br>
&gt;&gt; &gt; -march/-mtune within the GCC spec itself, then I&#39;m 100% f=
or moving to -mcpu to<br>
&gt;&gt; &gt; rid ourselves of this mess.. and then we still have the flexi=
bility to easily<br>
&gt;&gt; &gt; update/add tunes and GCC configuration for the odd-balls that=
 seem to crop up<br>
&gt;&gt; &gt; regularly.<br>
&gt;&gt;<br>
&gt;&gt; So yes we can do nearly same but not exactly same. We have to star=
t adding or deleting<br>
&gt;&gt; features via -march and -mtune would be same value, but there are =
cases where gcc defines<br>
&gt;&gt; internal properties based on mcpu, that is not representable in th=
ose suffixes we will add. so<br>
&gt;&gt; we will come very close but not exact and I think compiler is righ=
t in this case because we<br>
&gt;&gt; are not exactly telling it about a CPU implementation, but we are =
telling the cpu has these properties, so it really may not be one of standa=
rd cpu implementation.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; (I know -I- can always patch GCC for new -mcpu combinations, =
but I&#39;m not<br>
&gt;&gt; &gt; thinking about &#39;me&#39;, I&#39;m thinking about the user =
of OE who is told &#39;use this<br>
&gt;&gt; &gt; CPU, it has this set of functions&#39; and is NOT a compiler =
expert who can wade<br>
&gt;&gt; &gt; through GCC spec files and generate patches with any confiden=
ce.)<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; I would think we can solve this for these niche cases, via using -=
march/-mtune and drop<br>
&gt;&gt; -mcpu, we can append adding/deleting a given feature e.g. neon or =
vfp or vfpv3 etc.<br>
&gt;&gt; but this would mean we have to rename our package feed names as we=
ll to match this<br>
&gt;&gt; new representation, which currently is mapped to mcpu values. This=
 is quite a departure<br>
&gt;&gt; from package feeds point of view. but its more aligned with how we=
 have defined arch and tunes.<br>
&gt;&gt; so pick the battles.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; --Mark<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; and is preferred since gcc is getting st=
ricter and stricter with option<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; check semantics and can now find incompa=
tible -march and -mcpu options<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; better with every release. It does inter=
nal feature consistency check<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; and if it finds out discrepency between =
what -mcpu would expand to as<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; compared to -march it will flag the opti=
ons to be incompatible, for<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; naked eye it sounds wrong but gcc would =
translate -mcpu to a given<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -march internally and it might not match=
 to what we set in these arch<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; files.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; The effects are quite subtle, where this=
 can result in configure test<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; failing to compile due to these incompat=
ible options and a feature<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; option getting disabled for a recipe for=
 no reason.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; e.g. with gcc9 which can now detect that=
 -mcpu=3Dcortex-a5 and<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -march=3Darmv7-a are incompatible, many =
features in libstdc++ ends up<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; disabled due to configure check failures=
 e.g. size_t size, ptrdiff_t<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; sizes, which inturn results in compiling=
 libstdc++ with unwanted<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; disabled features.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; It would be interesting to see more specific=
 details of this.<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; These are configure tests which fail when -Werro=
r is in use and is not<br>
&gt;&gt; &gt; &gt;&gt;&gt; limited to libstdc++<br>
&gt;&gt; &gt; &gt;&gt;&gt; it can happen in any package. Since the diagnost=
ic about incompatible<br>
&gt;&gt; &gt; &gt;&gt;&gt; march mcpu pair<br>
&gt;&gt; &gt; &gt;&gt;&gt; is a warning in general, it does not matter, but=
 when we have -Werror<br>
&gt;&gt; &gt; &gt;&gt;&gt; enabled this turns<br>
&gt;&gt; &gt; &gt;&gt;&gt; into error, You can simply try a small helloworl=
d example to see the effects.<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch=
-armv4.inc=C2=A0 =C2=A0| 1 -<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch=
-armv5.inc=C2=A0 =C2=A0| 1 -<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch=
-armv6.inc=C2=A0 =C2=A0| 1 -<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch=
-armv7a.inc=C2=A0 | 1 -<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch=
-armv7ve.inc | 1 -<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/tune-iwm=
mxt.inc=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 6 files changed, 1 insertion(+), 6=
 deletions(-)<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/a=
rm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; index 47a7ad2830..52d8ab1e8f 100644<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch=
-armv4.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch=
-armv4.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;a=
rmv4&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[arm] =3D &quot;Enable AR=
M instruction set&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv4] =3D &quot;Enable =
instructions for ARMv4&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.cont=
ains(&#39;TUNE_FEATURES&#39;, &#39;armv4&#39;, &#39; -march=3Darmv4t&#39;, =
&#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 # enable --fix-v4bx when we have a=
rmv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb=
<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 # maybe we should extend bb.utils.=
contains to support check for any checkvalues in value, now it does<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 # checkvalues.issubset(val) which =
cannot be used for negative test of foo neither bar in value<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/a=
rm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; index f9068af9de..1fe1b6b8e4 100644<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch=
-armv5.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch=
-armv5.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;a=
rmv5&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv5] =3D &quot;Enable =
instructions for ARMv5&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv5] =3D &quot;arm=
v4&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.cont=
ains(&#39;TUNE_FEATURES&#39;, &#39;armv5&#39;, &#39; -march=3Darmv5t${ARMPK=
GSFX_DSP}&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.=
utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv5&#39;, &#39;armv5:&#39;, =
&#39;&#39; ,d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/a=
rch-armv4.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/a=
rm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; index 6c838e999c..adb9be8050 100644<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch=
-armv6.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch=
-armv6.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;a=
rmv6hf&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv6] =3D &quot;Enable =
instructions for ARMv6&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv6] =3D &quot;arm=
v4 armv5&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.cont=
ains(&#39;TUNE_FEATURES&#39;, &#39;armv6&#39;, &#39; -march=3Darmv6&#39;, &=
#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.=
utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv6&#39;, &#39;armv6:&#39;, =
&#39;&#39; ,d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/a=
rch-armv5-dsp.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/a=
rm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; index a2663d8008..09d2c03a5d 100644<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch=
-armv7a.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch=
-armv7a.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?=3D=
 &quot;thumb&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv7a] =3D &quot;Enable=
 instructions for ARMv7-a&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv7a] =3D &quot;ar=
mv4 armv5 armv6 armv7&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.cont=
ains(&#39;TUNE_FEATURES&#39;, &#39;armv7a&#39;, &#39; -march=3Darmv7-a&#39;=
, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.=
utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv7a&#39;, &#39;armv7a:&#39;=
, &#39;&#39; ,d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/a=
rch-armv6.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/a=
rm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; index 4d9260fecb..31e334f645 100644<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch=
-armv7ve.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch=
-armv7ve.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;a=
rmv7vethf&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv7ve] =3D &quot;Enabl=
e instructions for ARMv7ve&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv7ve] =3D &quot;a=
rmv4 armv5 armv6 armv7 armv7a&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.cont=
ains(&#39;TUNE_FEATURES&#39;, &#39;armv7ve&#39;, &#39; -march=3Darmv7ve&#39=
;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.=
utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv7ve&#39;, &#39;armv7ve:&#3=
9;, &#39;&#39; ,d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/a=
rch-armv7a.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/t=
une-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; index f27423cb2e..6e577697cc 100644<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/tune-iwm=
mxt.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/tune-iwm=
mxt.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; @@ -6,7 +6,7 @@ DEFAULTTUNE ?=3D &quot;i=
wmmxt&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/a=
rch-armv5-dsp.inc<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[iwmmxt] =3D &quot;Enable=
 Intel PXA27x specific processor optimizations&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.cont=
ains(&#39;TUNE_FEATURES&#39;, &#39;iwmmxt&#39;, &#39; -march=3Diwmmxt -mcpu=
=3Diwmmxt&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.cont=
ains(&#39;TUNE_FEATURES&#39;, &#39;iwmmxt&#39;, &#39; -mcpu=3Diwmmxt&#39;, =
&#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 AVAILTUNES +=3D &quot;iwmmxt&quot;=
<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 ARMPKGARCH_tune-iwmmxt =3D &quot;i=
wmmxt&quot;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; 2.20.1<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; ________________________________________=
_______<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a><br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org=
/mailman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">h=
ttp://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ba9802058062c9c8--
