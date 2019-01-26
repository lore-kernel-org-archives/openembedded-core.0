Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 333EB7C374
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 17:39:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so9509525wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IuZYxe04zTm5YbOcMy3W09ITrn+zHx18LRvGW0etd9A=;
	b=OV95Rn90K3dQ0B0SYbS06Vbka0iXxV3JuGAPN4IbLZJDh0oTJKUgsZFhEv+PaLUmxS
	71YK403CGEq1cX2AkaTJG8sMFQtWugU1F5F7nB9T58QSG7e3fzfoRTi0DbdLyiwH2sfu
	kvgAH+FU+dGJjlu5/EFTtGsYO0YsL70OZR0d8sh0TA+eG+WuZyk7eYPa082cUAxejQJZ
	kmXOl22T7xsxoYPA01vS/gXbZsyvOeRW/lALurND6PzoUkxXGXvZIeIe99IEghOBIznC
	6IciCwmcEldb21QkJY/BKylqmsrXt6v3W1vFcXZd1ycQOC691xNo9RmGdvNdlukvreYJ
	A0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IuZYxe04zTm5YbOcMy3W09ITrn+zHx18LRvGW0etd9A=;
	b=JuZJUdruMlzE0fFnYxhKW9hq18j3qQLWhBV+Yi/DWf66GCNwKqBD7NLy9myLO67VMm
	2t8j01OkexGnGlIL6e6lfBHYGgOAdK0UbuTZI3kQc5fsE3uJFtFWcMnpY7FXhdJHVkFS
	rUrU78IdD6f+r4VW1HV+RpGze4ImirWVMim/w8wQrab/xO2aFaTdfc+zFsQ9IwW9Yclz
	3hiWffMYs8fVKm7xfwLtdSlNtqOGksGT014/+kUQhq+Lh2VXZ5a/8F3PBsh3ra3Z1JnL
	bpgjsY2ssNtNLOgwNhRbEMVRgM1x+5i+vaInIhBA5Nn3pNZwm8b/K6XC+E5wWdgYqL4/
	WSTw==
X-Gm-Message-State: AJcUukchCXSCes49/K1uCATLm4zf6gqvqU4FVTSKokOOZSjRFKOIpyAs
	VXyd8hWO4ByqOP/jFCB9zoUjFDFCQHVjy/AB910=
X-Google-Smtp-Source: ALg8bN5Ub6+Tb4onCAOOJNKOyudiQ3jW1vZAkqkftUtWQ60L6Ibe7jZ8+jRaYPnieeR/4YGK/Lu4YSES/zMUNJsjz28=
X-Received: by 2002:a1c:9c15:: with SMTP id f21mr10363499wme.94.1548524392551; 
	Sat, 26 Jan 2019 09:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20190123200520.14956-1-raj.khem@gmail.com>
	<CAJ86T=XF3Xr0x6zEH2nsHhLQ3afEMP3Ot31pbK9-66ORrCjnsg@mail.gmail.com>
	<CAMKF1srPt+fiSotytF2jczPEoCsCP5x7U=bODNe23476CA_ABQ@mail.gmail.com>
	<CAJ86T=Xp_KgsZWv=oj4kEdWqAihMNASpOMc0s7nLHgcpVozWsg@mail.gmail.com>
	<CAMKF1sqcKnd1ZaGxjQqPH2oYVhyuO=h1wSREii2jXsGkf=5QFQ@mail.gmail.com>
	<8cb035d4-2213-905e-68ec-4903758499e8@windriver.com>
	<CAMKF1sq_eLh0ahLm0fC7+ZHPbR28-1jj6scFFZwDXxWjxupEFg@mail.gmail.com>
In-Reply-To: <CAMKF1sq_eLh0ahLm0fC7+ZHPbR28-1jj6scFFZwDXxWjxupEFg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 26 Jan 2019 18:39:42 +0100
Message-ID: <CA+chaQcQ_eauCeAZykSOE2WgbQkCaZCcf5TAyBTVXGewyn0NFA@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Jan 2019 17:39:52 -0000
Content-Type: multipart/alternative; boundary="000000000000581c0c05805feed3"

--000000000000581c0c05805feed3
Content-Type: text/plain; charset="UTF-8"

Which -mcpu/-march combination is causing issue in gcc9?

I know we had this issue with armv7a tunes before, that's why I've added
separate armv7ve before the switch from -mtune to -mcpu.

I still believe -mcpu (with or without -march) is better option.

Using -mtune without indicating which -mtune was actually used in the
package arch is bad (especially if you have multiple MACHINEs with
different DEFAULTTUNEs e.g. cortexa7, cortexa8 in -mtune, but both ending
in armv7a package arch, unpacking all packages from sstate every time you
switch MACHINE and the package manager on target never knowing which -mtune
was used to build given package upgrade from feed).

Switching from -mcpu to -mtune while keeping the current cpu-specific
package architectures is better, but then the use case, that I build
everything e.g. with cortexa8 in -mtune and install this cortexa8 package
feed on cortexa7 MACHINEs also looks strange, yes it will work in runtime,
but why not use generic armv7a DEFAULTTUNE to make it clear (to package
manager as well as end user) that I'm not really optimizing for given CPU).

From the naive openssl benchmarks I did few years back, there was very
small difference between mtune/mcpu/just-march, but still for projects
where I have separate package feeds for each device (e.g. LG TVs) I prefer
to use -mcpu (because I really know that such packages won't ever be used
on device with different CPU) and e.g. in LuneOS we're more concerned about
package feed size and build time, so we select more generic DEFAULTTUNE
which is shared across many MACHINEs and that doesn't have any -mcpu (nor
-mtune) options in it, so should be fine as well.

We can easily extend the tune-test script I've used back then when
switching to -mcpu to not only use bitbake -e, but also call gcc-cross to
check for possible warnings from incompatible march/mcpu combinations and
fix those. The old version is here:
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
it was used in mcpu switch here:
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test

http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune3

From the gcc git log I don't see many changes in:
https://github.com/gcc-mirror/gcc/commits/master/gcc/config/arm/driver-arm.c
nor
https://github.com/gcc-mirror/gcc/commits/master/gcc/config/arm/arm-cpus.in
so I'm really interested which combination issues the warning now.

Regards,

On Sat, Jan 26, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:

>
> On Fri, Jan 25, 2019 at 12:32 PM Mark Hatle <mark.hatle@windriver.com>
> wrote:
> >
> > On 1/24/19 9:22 PM, Khem Raj wrote:
> > > On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > >>
> > >> On Wed, Jan 23, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>>
> > >>> On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > >>>>
> > >>>> On Wed, Jan 23, 2019 at 12:05 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> > >>>>>
> > >>>>> tune files which inherit the arch definitions already define
> appropriate
> > >>>>> -mcpu option, which is equivalent of right -march and -mtune
> combination
> > >>>>
> > >>>> And what about machines which inherit an arch definition instead of
> a
> > >>>> cpu definition? Is that no longer supported?
> > >>>
> > >>> I could not find such a machine configuration in several BSP layers
> I looked at.
> > >>> Do you know of machine definitions where these files are included
> > >>> directly in machine configs ?
> > >>
> > >> Using a CPU specific include but then leaving the generic DEFAULTTUNE
> > >> (ie not enabling any CPU specific TUNE_CCARGS) is equivalent, and I
> > >> guess quite common.
> > >
> > > defaulttune does not play much part in appending -mcpu option to
> > > compiler flags, A case
> > > where this could bypass the setting mcpu is when we do not include a
> > > tune-* for arm based machine
> > > and thats the case I was interested to know.
> > >
> > > again if there is such a BSP I would be interested to test it out.
> > >>
> > >>> if so, then we have to either use _remove or introduce a weak
> variable
> > >>> to set march only if
> > >>> mcpu is not set which
> > >>
> > >> I think the solution is to ensure that the CPU specific tuning options
> > >> are always compatible with any architecture specific options which may
> > >> be active.
> > >>
> > >> In general our CPU specific tuning files are a little sloppy (e.g.
> > >> defaulting to combinations of VFP versions and architecture levels
> > >> which never exist in the real world). If newer versions of gcc are
> > >> making those issues more apparent then why not take the opportunity to
> > >> fix them properly?
> > >
> > > the mcpu option is helping with right march/mtune combination. while
> we can
> > > use specific -march=arch(+-)features syntax and combine with right
> > > -mtune to match -mcpu I think we should use
> > > compiler defaults and not try to recreate something that -mcpu would
> > > do it easily for us.
> > >
> > > So either we drop the idea of setting mcpu and use basic -march value
> > > combined with -mtune ( which btw. was default in past)
> > > or if we want to let compiler use ISA for a particular arch
> > > implementation ( cortexXXX ) then we should just use -mcpu and drop
> > > using -mtune and -march.
> > >
> > > I would include towards option 1.
> >
> > I know this is a bit of a 'me too' response, but we have to pick one
> format and
> > stay with it.  Either option, but not both.
>
> I concur.
>
>
> >
> > -IF- we know that the appropriate -mcpu options are available for all of
> the
> > potential combinations out there, then this is by far the preferred
> method in my
> > mind.  Much easier to handle and manage...
>
> -mcpu options are available for known CPU implementations. But there
> always will
> be weird ones, given how people can pick and choose subsystems for SOC on
> this
> architecture, and its highly probable that they wont be in gcc. so real
> question we need to answer for is, should we design for those cases and how
> often does this often.
>
>
> >
> > However, the more complex route came out as various 'odd-ball' (and
> people claim
> > don't exist, but they do) custom ARM cores get released without
> 'mandatory' math
> > units, or some other odd ball variation.  (I've seen this numerous times
> over
> > the last 20 years that something that doesn't exist, does... all because
> it's a
> > custom part.)
>
> Yes, I am dealing with one such design even today
>
>
> >
> > If we have an easy way to define the -mcpu= means some magic combination
> of
> > -march/-mtune within the GCC spec itself, then I'm 100% for moving to
> -mcpu to
> > rid ourselves of this mess.. and then we still have the flexibility to
> easily
> > update/add tunes and GCC configuration for the odd-balls that seem to
> crop up
> > regularly.
>
> So yes we can do nearly same but not exactly same. We have to start adding
> or deleting
> features via -march and -mtune would be same value, but there are cases
> where gcc defines
> internal properties based on mcpu, that is not representable in those
> suffixes we will add. so
> we will come very close but not exact and I think compiler is right in
> this case because we
> are not exactly telling it about a CPU implementation, but we are telling
> the cpu has these properties, so it really may not be one of standard cpu
> implementation.
>
>
> >
> > (I know -I- can always patch GCC for new -mcpu combinations, but I'm not
> > thinking about 'me', I'm thinking about the user of OE who is told 'use
> this
> > CPU, it has this set of functions' and is NOT a compiler expert who can
> wade
> > through GCC spec files and generate patches with any confidence.)
> >
>
> I would think we can solve this for these niche cases, via using
> -march/-mtune and drop
> -mcpu, we can append adding/deleting a given feature e.g. neon or vfp or
> vfpv3 etc.
> but this would mean we have to rename our package feed names as well to
> match this
> new representation, which currently is mapped to mcpu values. This is
> quite a departure
> from package feeds point of view. but its more aligned with how we have
> defined arch and tunes.
> so pick the battles.
>
>
> > --Mark
> >
> > >>
> > >>>>> and is preferred since gcc is getting stricter and stricter with
> option
> > >>>>> check semantics and can now find incompatible -march and -mcpu
> options
> > >>>>> better with every release. It does internal feature consistency
> check
> > >>>>> and if it finds out discrepency between what -mcpu would expand to
> as
> > >>>>> compared to -march it will flag the options to be incompatible, for
> > >>>>> naked eye it sounds wrong but gcc would translate -mcpu to a given
> > >>>>> -march internally and it might not match to what we set in these
> arch
> > >>>>> files.
> > >>>>>
> > >>>>> The effects are quite subtle, where this can result in configure
> test
> > >>>>> failing to compile due to these incompatible options and a feature
> > >>>>> option getting disabled for a recipe for no reason.
> > >>>>>
> > >>>>> e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
> > >>>>> -march=armv7-a are incompatible, many features in libstdc++ ends up
> > >>>>> disabled due to configure check failures e.g. size_t size,
> ptrdiff_t
> > >>>>> sizes, which inturn results in compiling libstdc++ with unwanted
> > >>>>> disabled features.
> > >>>>
> > >>>> It would be interesting to see more specific details of this.
> > >>>
> > >>> These are configure tests which fail when -Werror is in use and is
> not
> > >>> limited to libstdc++
> > >>> it can happen in any package. Since the diagnostic about incompatible
> > >>> march mcpu pair
> > >>> is a warning in general, it does not matter, but when we have -Werror
> > >>> enabled this turns
> > >>> into error, You can simply try a small helloworld example to see the
> effects.
> > >>>
> > >>>>
> > >>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >>>>> ---
> > >>>>>  meta/conf/machine/include/arm/arch-armv4.inc   | 1 -
> > >>>>>  meta/conf/machine/include/arm/arch-armv5.inc   | 1 -
> > >>>>>  meta/conf/machine/include/arm/arch-armv6.inc   | 1 -
> > >>>>>  meta/conf/machine/include/arm/arch-armv7a.inc  | 1 -
> > >>>>>  meta/conf/machine/include/arm/arch-armv7ve.inc | 1 -
> > >>>>>  meta/conf/machine/include/tune-iwmmxt.inc      | 2 +-
> > >>>>>  6 files changed, 1 insertion(+), 6 deletions(-)
> > >>>>>
> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv4.inc
> b/meta/conf/machine/include/arm/arch-armv4.inc
> > >>>>> index 47a7ad2830..52d8ab1e8f 100644
> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv4.inc
> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv4.inc
> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv4"
> > >>>>>
> > >>>>>  TUNEVALID[arm] = "Enable ARM instruction set"
> > >>>>>  TUNEVALID[armv4] = "Enable instructions for ARMv4"
> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
> -march=armv4t', '', d)}"
> > >>>>>  # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then
> disable it when we have also armv5 or thumb
> > >>>>>  # maybe we should extend bb.utils.contains to support check for
> any checkvalues in value, now it does
> > >>>>>  # checkvalues.issubset(val) which cannot be used for negative
> test of foo neither bar in value
> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc
> b/meta/conf/machine/include/arm/arch-armv5.inc
> > >>>>> index f9068af9de..1fe1b6b8e4 100644
> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv5.inc
> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv5"
> > >>>>>
> > >>>>>  TUNEVALID[armv5] = "Enable instructions for ARMv5"
> > >>>>>  TUNECONFLICTS[armv5] = "armv4"
> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', '
> -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv5', 'armv5:', '' ,d)}"
> > >>>>>
> > >>>>>  require conf/machine/include/arm/arch-armv4.inc
> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc
> b/meta/conf/machine/include/arm/arch-armv6.inc
> > >>>>> index 6c838e999c..adb9be8050 100644
> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv6hf"
> > >>>>>
> > >>>>>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
> > >>>>>  TUNECONFLICTS[armv6] = "armv4 armv5"
> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', '
> -march=armv6', '', d)}"
> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv6', 'armv6:', '' ,d)}"
> > >>>>>
> > >>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
> b/meta/conf/machine/include/arm/arch-armv7a.inc
> > >>>>> index a2663d8008..09d2c03a5d 100644
> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> > >>>>> @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?= "thumb"
> > >>>>>
> > >>>>>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
> > >>>>>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', '
> -march=armv7-a', '', d)}"
> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv7a', 'armv7a:', '' ,d)}"
> > >>>>>
> > >>>>>  require conf/machine/include/arm/arch-armv6.inc
> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
> b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > >>>>> index 4d9260fecb..31e334f645 100644
> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?= "armv7vethf"
> > >>>>>
> > >>>>>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
> > >>>>>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve',
> ' -march=armv7ve', '', d)}"
> > >>>>>  MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> 'armv7ve', 'armv7ve:', '' ,d)}"
> > >>>>>
> > >>>>>  require conf/machine/include/arm/arch-armv7a.inc
> > >>>>> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc
> b/meta/conf/machine/include/tune-iwmmxt.inc
> > >>>>> index f27423cb2e..6e577697cc 100644
> > >>>>> --- a/meta/conf/machine/include/tune-iwmmxt.inc
> > >>>>> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
> > >>>>> @@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
> > >>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
> > >>>>>
> > >>>>>  TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor
> optimizations"
> > >>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', '
> -march=iwmmxt -mcpu=iwmmxt', '', d)}"
> > >>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', '
> -mcpu=iwmmxt', '', d)}"
> > >>>>>
> > >>>>>  AVAILTUNES += "iwmmxt"
> > >>>>>  ARMPKGARCH_tune-iwmmxt = "iwmmxt"
> > >>>>> --
> > >>>>> 2.20.1
> > >>>>>
> > >>>>> --
> > >>>>> _______________________________________________
> > >>>>> Openembedded-core mailing list
> > >>>>> Openembedded-core@lists.openembedded.org
> > >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000581c0c05805feed3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Which -mcpu/-march combination is causing issue =
in gcc9?<div><br></div><div>I know we had this issue with armv7a tunes befo=
re, that&#39;s why I&#39;ve added separate armv7ve before the switch from -=
mtune to -mcpu.</div><div><br></div><div>I still believe -mcpu (with or wit=
hout -march) is better option.</div><div><br></div><div>Using -mtune withou=
t indicating which -mtune was actually used in the package arch is bad (esp=
ecially if you have multiple MACHINEs with different DEFAULTTUNEs e.g. cort=
exa7, cortexa8 in -mtune, but both ending in armv7a package arch, unpacking=
 all packages from sstate every time you switch MACHINE and the package man=
ager on target never knowing which -mtune was used to build given package u=
pgrade from feed).</div><div><br></div><div>Switching from -mcpu to -mtune =
while keeping the current cpu-specific package architectures is better, but=
 then the use case, that I build everything e.g. with cortexa8 in -mtune an=
d install this cortexa8 package feed on cortexa7 MACHINEs also looks strang=
e, yes it will work in runtime, but why not use generic armv7a DEFAULTTUNE =
to make it clear (to package manager as well as end user) that I&#39;m not =
really optimizing for given CPU).</div><div><br></div><div>From the naive o=
penssl benchmarks I did few years back, there was very small difference bet=
ween mtune/mcpu/just-march, but still for projects where I have separate pa=
ckage feeds for each device (e.g. LG TVs) I prefer to use -mcpu (because I =
really know that such packages won&#39;t ever be used on device with differ=
ent CPU) and e.g. in LuneOS we&#39;re more concerned about package feed siz=
e and build time, so we select more generic DEFAULTTUNE which is shared acr=
oss many MACHINEs and that doesn&#39;t have any -mcpu (nor -mtune) options =
in it, so should be fine as well.</div><div><br></div><div>We can easily ex=
tend the tune-test script I&#39;ve used back then when switching to -mcpu t=
o not only use bitbake -e, but also call gcc-cross to check for possible wa=
rnings from incompatible march/mcpu combinations and fix those. The old ver=
sion is here:</div><div><a href=3D"http://git.openembedded.org/openembedded=
-core-contrib/log/?h=3Djansa/tune-test">http://git.openembedded.org/openemb=
edded-core-contrib/log/?h=3Djansa/tune-test</a><br></div><div>it was used i=
n mcpu switch here:</div><div><a href=3D"http://git.openembedded.org/openem=
bedded-core-contrib/log/?h=3Djansa/tune2-test">http://git.openembedded.org/=
openembedded-core-contrib/log/?h=3Djansa/tune2-test</a>=C2=A0=C2=A0<br></di=
v><div><a href=3D"http://git.openembedded.org/openembedded-core-contrib/log=
/?h=3Djansa/tune3">http://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Djansa/tune3</a></div><div><br></div><div>From the gcc git log I don&=
#39;t see many changes in:</div><div><a href=3D"https://github.com/gcc-mirr=
or/gcc/commits/master/gcc/config/arm/driver-arm.c">https://github.com/gcc-m=
irror/gcc/commits/master/gcc/config/arm/driver-arm.c</a><br></div><div>nor<=
/div><div><a href=3D"https://github.com/gcc-mirror/gcc/commits/master/gcc/c=
onfig/arm/arm-cpus.in">https://github.com/gcc-mirror/gcc/commits/master/gcc=
/config/arm/arm-cpus.in</a><br></div><div>so I&#39;m really interested whic=
h combination issues the warning now.</div><div><br></div><div>Regards,</di=
v></div></div></div></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 26, 2019 at 5:29 PM Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br>
On Fri, Jan 25, 2019 at 12:32 PM Mark Hatle &lt;<a href=3D"mailto:mark.hatl=
e@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; On 1/24/19 9:22 PM, Khem Raj wrote:<br>
&gt; &gt; On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy &lt;<a href=3D"mail=
to:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Wed, Jan 23, 2019 at 2:50 PM Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<b=
r>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On Wed, Jan 23, 2019 at 12:05 PM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; tune files which inherit the arch definitions alr=
eady define appropriate<br>
&gt; &gt;&gt;&gt;&gt;&gt; -mcpu option, which is equivalent of right -march=
 and -mtune combination<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; And what about machines which inherit an arch definit=
ion instead of a<br>
&gt; &gt;&gt;&gt;&gt; cpu definition? Is that no longer supported?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I could not find such a machine configuration in several =
BSP layers I looked at.<br>
&gt; &gt;&gt;&gt; Do you know of machine definitions where these files are =
included<br>
&gt; &gt;&gt;&gt; directly in machine configs ?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Using a CPU specific include but then leaving the generic DEF=
AULTTUNE<br>
&gt; &gt;&gt; (ie not enabling any CPU specific TUNE_CCARGS) is equivalent,=
 and I<br>
&gt; &gt;&gt; guess quite common.<br>
&gt; &gt;<br>
&gt; &gt; defaulttune does not play much part in appending -mcpu option to<=
br>
&gt; &gt; compiler flags, A case<br>
&gt; &gt; where this could bypass the setting mcpu is when we do not includ=
e a<br>
&gt; &gt; tune-* for arm based machine<br>
&gt; &gt; and thats the case I was interested to know.<br>
&gt; &gt;<br>
&gt; &gt; again if there is such a BSP I would be interested to test it out=
.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; if so, then we have to either use _remove or introduce a =
weak variable<br>
&gt; &gt;&gt;&gt; to set march only if<br>
&gt; &gt;&gt;&gt; mcpu is not set which<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I think the solution is to ensure that the CPU specific tunin=
g options<br>
&gt; &gt;&gt; are always compatible with any architecture specific options =
which may<br>
&gt; &gt;&gt; be active.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; In general our CPU specific tuning files are a little sloppy =
(e.g.<br>
&gt; &gt;&gt; defaulting to combinations of VFP versions and architecture l=
evels<br>
&gt; &gt;&gt; which never exist in the real world). If newer versions of gc=
c are<br>
&gt; &gt;&gt; making those issues more apparent then why not take the oppor=
tunity to<br>
&gt; &gt;&gt; fix them properly?<br>
&gt; &gt;<br>
&gt; &gt; the mcpu option is helping with right march/mtune combination. wh=
ile we can<br>
&gt; &gt; use specific -march=3Darch(+-)features syntax and combine with ri=
ght<br>
&gt; &gt; -mtune to match -mcpu I think we should use<br>
&gt; &gt; compiler defaults and not try to recreate something that -mcpu wo=
uld<br>
&gt; &gt; do it easily for us.<br>
&gt; &gt;<br>
&gt; &gt; So either we drop the idea of setting mcpu and use basic -march v=
alue<br>
&gt; &gt; combined with -mtune ( which btw. was default in past)<br>
&gt; &gt; or if we want to let compiler use ISA for a particular arch<br>
&gt; &gt; implementation ( cortexXXX ) then we should just use -mcpu and dr=
op<br>
&gt; &gt; using -mtune and -march.<br>
&gt; &gt;<br>
&gt; &gt; I would include towards option 1.<br>
&gt;<br>
&gt; I know this is a bit of a &#39;me too&#39; response, but we have to pi=
ck one format and<br>
&gt; stay with it.=C2=A0 Either option, but not both.<br>
<br></div><div>
I concur.</div><div><br>
<br>
&gt;<br>
&gt; -IF- we know that the appropriate -mcpu options are available for all =
of the<br>
&gt; potential combinations out there, then this is by far the preferred me=
thod in my<br>
&gt; mind.=C2=A0 Much easier to handle and manage...<br>
<br></div><div>
-mcpu options are available for known CPU implementations. But there always=
 will<br>
be weird ones, given how people can pick and choose subsystems for SOC on t=
his<br>
architecture, and its highly probable that they wont be in gcc. so real que=
stion we need to answer for is, should we design for those cases and how of=
ten does this often.</div><div><br>
<br>
&gt;<br>
&gt; However, the more complex route came out as various &#39;odd-ball&#39;=
 (and people claim<br>
&gt; don&#39;t exist, but they do) custom ARM cores get released without &#=
39;mandatory&#39; math<br>
&gt; units, or some other odd ball variation.=C2=A0 (I&#39;ve seen this num=
erous times over<br>
&gt; the last 20 years that something that doesn&#39;t exist, does... all b=
ecause it&#39;s a<br>
&gt; custom part.)<br>
<br></div><div><div dir=3D"auto">
Yes, I am dealing with one such design even today</div></div><div><br>
<br>
&gt;<br>
&gt; If we have an easy way to define the -mcpu=3D means some magic combina=
tion of<br>
&gt; -march/-mtune within the GCC spec itself, then I&#39;m 100% for moving=
 to -mcpu to<br>
&gt; rid ourselves of this mess.. and then we still have the flexibility to=
 easily<br>
&gt; update/add tunes and GCC configuration for the odd-balls that seem to =
crop up<br>
&gt; regularly.<br>
<br></div><div>
So yes we can do nearly same but not exactly same. We have to start adding =
or deleting<br>
features via -march and -mtune would be same value, but there are cases whe=
re gcc defines<br>
internal properties based on mcpu, that is not representable in those suffi=
xes we will add. so<br>
we will come very close but not exact and I think compiler is right in this=
 case because we<br>
are not exactly telling it about a CPU implementation, but we are telling t=
he cpu has these properties, so it really may not be one of standard cpu im=
plementation.</div><div><br>
<br>
&gt;<br>
&gt; (I know -I- can always patch GCC for new -mcpu combinations, but I&#39=
;m not<br>
&gt; thinking about &#39;me&#39;, I&#39;m thinking about the user of OE who=
 is told &#39;use this<br>
&gt; CPU, it has this set of functions&#39; and is NOT a compiler expert wh=
o can wade<br>
&gt; through GCC spec files and generate patches with any confidence.)<br>
&gt;<br>
<br></div><div>
I would think we can solve this for these niche cases, via using -march/-mt=
une and drop<br>
-mcpu, we can append adding/deleting a given feature e.g. neon or vfp or vf=
pv3 etc.<br>
but this would mean we have to rename our package feed names as well to mat=
ch this<br>
new representation, which currently is mapped to mcpu values. This is quite=
 a departure<br>
from package feeds point of view. but its more aligned with how we have def=
ined arch and tunes.<br>
so pick the battles.</div><div><br>
<br>
&gt; --Mark<br>
&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; and is preferred since gcc is getting stricter an=
d stricter with option<br>
&gt; &gt;&gt;&gt;&gt;&gt; check semantics and can now find incompatible -ma=
rch and -mcpu options<br>
&gt; &gt;&gt;&gt;&gt;&gt; better with every release. It does internal featu=
re consistency check<br>
&gt; &gt;&gt;&gt;&gt;&gt; and if it finds out discrepency between what -mcp=
u would expand to as<br>
&gt; &gt;&gt;&gt;&gt;&gt; compared to -march it will flag the options to be=
 incompatible, for<br>
&gt; &gt;&gt;&gt;&gt;&gt; naked eye it sounds wrong but gcc would translate=
 -mcpu to a given<br>
&gt; &gt;&gt;&gt;&gt;&gt; -march internally and it might not match to what =
we set in these arch<br>
&gt; &gt;&gt;&gt;&gt;&gt; files.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; The effects are quite subtle, where this can resu=
lt in configure test<br>
&gt; &gt;&gt;&gt;&gt;&gt; failing to compile due to these incompatible opti=
ons and a feature<br>
&gt; &gt;&gt;&gt;&gt;&gt; option getting disabled for a recipe for no reaso=
n.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; e.g. with gcc9 which can now detect that -mcpu=3D=
cortex-a5 and<br>
&gt; &gt;&gt;&gt;&gt;&gt; -march=3Darmv7-a are incompatible, many features =
in libstdc++ ends up<br>
&gt; &gt;&gt;&gt;&gt;&gt; disabled due to configure check failures e.g. siz=
e_t size, ptrdiff_t<br>
&gt; &gt;&gt;&gt;&gt;&gt; sizes, which inturn results in compiling libstdc+=
+ with unwanted<br>
&gt; &gt;&gt;&gt;&gt;&gt; disabled features.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; It would be interesting to see more specific details =
of this.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; These are configure tests which fail when -Werror is in u=
se and is not<br>
&gt; &gt;&gt;&gt; limited to libstdc++<br>
&gt; &gt;&gt;&gt; it can happen in any package. Since the diagnostic about =
incompatible<br>
&gt; &gt;&gt;&gt; march mcpu pair<br>
&gt; &gt;&gt;&gt; is a warning in general, it does not matter, but when we =
have -Werror<br>
&gt; &gt;&gt;&gt; enabled this turns<br>
&gt; &gt;&gt;&gt; into error, You can simply try a small helloworld example=
 to see the effects.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv4.in=
c=C2=A0 =C2=A0| 1 -<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv5.in=
c=C2=A0 =C2=A0| 1 -<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv6.in=
c=C2=A0 =C2=A0| 1 -<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv7a.i=
nc=C2=A0 | 1 -<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/arm/arch-armv7ve.=
inc | 1 -<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 meta/conf/machine/include/tune-iwmmxt.inc=
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 6 files changed, 1 insertion(+), 6 deletion=
s(-)<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-a=
rmv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; index 47a7ad2830..52d8ab1e8f 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv4.in=
c<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv4.in=
c<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;armv4&quot=
;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[arm] =3D &quot;Enable ARM instruc=
tion set&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv4] =3D &quot;Enable instructi=
ons for ARMv4&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;armv4&#39;, &#39; -march=3Darmv4t&#39;, &#39;&#39=
;, d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 # enable --fix-v4bx when we have armv4 in T=
UNE_FEATURES, but then disable it when we have also armv5 or thumb<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 # maybe we should extend bb.utils.contains =
to support check for any checkvalues in value, now it does<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 # checkvalues.issubset(val) which cannot be=
 used for negative test of foo neither bar in value<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-a=
rmv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; index f9068af9de..1fe1b6b8e4 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv5.in=
c<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv5.in=
c<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;armv5&quot=
;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv5] =3D &quot;Enable instructi=
ons for ARMv5&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv5] =3D &quot;armv4&quot;<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;armv5&#39;, &#39; -march=3Darmv5t${ARMPKGSFX_DSP}=
&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;armv5&#39;, &#39;armv5:&#39;, &#39;&#39=
; ,d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv4=
.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-a=
rmv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; index 6c838e999c..adb9be8050 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv6.in=
c<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv6.in=
c<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;armv6hf&qu=
ot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv6] =3D &quot;Enable instructi=
ons for ARMv6&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv6] =3D &quot;armv4 armv5&=
quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;armv6&#39;, &#39; -march=3Darmv6&#39;, &#39;&#39;=
, d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;armv6&#39;, &#39;armv6:&#39;, &#39;&#39=
; ,d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv5=
-dsp.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-a=
rmv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; index a2663d8008..09d2c03a5d 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv7a.i=
nc<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv7a.i=
nc<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?=3D &quot;th=
umb&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv7a] =3D &quot;Enable instruct=
ions for ARMv7-a&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv7a] =3D &quot;armv4 armv5=
 armv6 armv7&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;armv7a&#39;, &#39; -march=3Darmv7-a&#39;, &#39;&#=
39;, d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;armv7a&#39;, &#39;armv7a:&#39;, &#39;&#=
39; ,d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv6=
.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/arm/arch-a=
rmv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; index 4d9260fecb..31e334f645 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/arm/arch-armv7ve.=
inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/arm/arch-armv7ve.=
inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D &quot;armv7vethf=
&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[armv7ve] =3D &quot;Enable instruc=
tions for ARMv7ve&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNECONFLICTS[armv7ve] =3D &quot;armv4 armv=
5 armv6 armv7 armv7a&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;armv7ve&#39;, &#39; -march=3Darmv7ve&#39;, &#39;&=
#39;, d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 MACHINEOVERRIDES =3D. &quot;${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;armv7ve&#39;, &#39;armv7ve:&#39;, &#39;=
&#39; ,d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv7=
a.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/meta/conf/machine/include/tune-iwmmx=
t.inc b/meta/conf/machine/include/tune-iwmmxt.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt; index f27423cb2e..6e577697cc 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/meta/conf/machine/include/tune-iwmmxt.inc<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/meta/conf/machine/include/tune-iwmmxt.inc<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -6,7 +6,7 @@ DEFAULTTUNE ?=3D &quot;iwmmxt&quo=
t;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-armv5=
-dsp.inc<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 TUNEVALID[iwmmxt] =3D &quot;Enable Intel PX=
A27x specific processor optimizations&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; -TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;iwmmxt&#39;, &#39; -march=3Diwmmxt -mcpu=3Diwmmxt=
&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39=
;TUNE_FEATURES&#39;, &#39;iwmmxt&#39;, &#39; -mcpu=3Diwmmxt&#39;, &#39;&#39=
;, d)}&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 AVAILTUNES +=3D &quot;iwmmxt&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 ARMPKGARCH_tune-iwmmxt =3D &quot;iwmmxt&quo=
t;<br>
&gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt;&gt;&gt; 2.20.1<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt;&gt;&gt; _______________________________________________<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openemb=
edded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><b=
r>
&gt; &gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/=
listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
</div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000581c0c05805feed3--
