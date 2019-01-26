Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0186C3E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 21:06:44 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t13so14484114qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IXw0fOMFF8QyyJwqiDg6li7p9rtBojXAuunwyuBndk4=;
	b=WLJz68/PqXsPmWD8XyT9jvuLUtehWTKLsFSedSOqpQQ81MQAVipzxoR/JYMKGOzmOZ
	f2jlZJXsMw6eklc/7qkb5uxsEN5dPpdXcv5W08e3QmjCpXOeMK3QIDQ89LeHxKfuafv0
	ARfZp5NO+qPbeD1d3KPCBJTe7FFu1CYM8xiGBmI1UxwdRG9h8GTvsBMRrdx6aW2f+JBA
	49QxKycbka+pIFNIawRdQMOK9W3BaxuVcuTw+b8xrILIMv4gTniNVJj1ciZZFPKLuf9a
	b9i3sRxGoPtc7QsO5apPIBwThu+NisKozZYWZMte1ey7gRZowj4EvmwkSG+LSJ7NdGhc
	0xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IXw0fOMFF8QyyJwqiDg6li7p9rtBojXAuunwyuBndk4=;
	b=t0CZnYgu/e/23n8VIUdqDjLg4WiTgeC7vNWpDNh6QTuEAvXtE0sGUhCtzn8Zvxq260
	hH6gzH0K9Vh3Fth1seqUTqxVw9Z+tXtWvsIeWuMyvWhKrU/bg0c8jFb/io/NWb1HO9i2
	tGw9R8ZIUDmn/aNaKhAcZ5B3Ch48zu4N8U7e/uhSG5AuAPAAaAlO7LbQX8/MPFb+U2hA
	kY/1yZuH/Z4Dy8v9yM+OxHfXIWE8xzOu/YKNBXKwisglPIrNfjl/TL6Qh/ymaBEQdDI9
	1D5kvygj+ACQIJJlnWtbKkBgVYkKtHD+fGrJ79Nvez7R9G8hDulw2/EKBe5M6fuzTU55
	gYmA==
X-Gm-Message-State: AJcUukdMF9E0KvK3ntbh0C8WPYxzkadwJSeS45B4Ejdi+G+STVrqWXnX
	7dxgQy1x1S+BxdgzPlsuFPUGRKzjpJUmBaI/Uxw=
X-Google-Smtp-Source: ALg8bN4InQv1rWi/FuUsZSjnUznovkANSFUK0Zv9qpvXpk+DbROes1LaQ8MtXswJjMufnBaEdN+cOPm/kQNBJjX512M=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr15440406qvj.228.1548536804900;
	Sat, 26 Jan 2019 13:06:44 -0800 (PST)
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
	<CA+chaQd+jryMbczj0duzvcOub1FozskRECe=aRM6JC3GefGm_A@mail.gmail.com>
In-Reply-To: <CA+chaQd+jryMbczj0duzvcOub1FozskRECe=aRM6JC3GefGm_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Jan 2019 13:06:18 -0800
Message-ID: <CAMKF1srbQ880STFFMJ04krLaZZydoxLoh=FPHWQVmkQxv=csYw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Sat, 26 Jan 2019 21:06:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 26, 2019 at 1:04 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> >  2. Just use -mcpu and do not use -march/-mtune and may be provide mech=
anism to override -mcpu, which is done by packages anyway ( maps directly t=
o package architectures )
>
> This would be my preferred solution, I know that tune files are already q=
uite complicated, but another variable which will hold either just march (f=
or more generic DEFAULTTUNEs as Andre reported) or mcpu (for DEFAULTTUNEs t=
argeting specific cpu) or possibly mtune as well (if someone really wants a=
nd overrides this variable in his DISTRO) doesn't make it much more complic=
ated and should work fine for everybody.

is it something that does this fine ?
https://patchwork.openembedded.org/patch/158189/

>
>
>
> On Sat, Jan 26, 2019 at 7:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sat, Jan 26, 2019 at 9:39 AM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> >
>> > Which -mcpu/-march combination is causing issue in gcc9?
>>
>> Its when using cortex-a5 tunes, -march=3Darmv7-a -mcpu=3Dcortex-a5, but =
if
>> we move the needle to fix the issue or test coverage then we miss the
>> point here, the fact that this keeps coming up means we have a
>> fundamental problem.
>>
>> >
>> > I know we had this issue with armv7a tunes before, that's why I've add=
ed separate armv7ve before the switch from -mtune to -mcpu.
>> >
>>
>> Thats fine, however as I have explained before -mcpu is a combination
>> of implicit -march and -mtune, so for best results should not be mixed
>> with them. Originally the tune design in OE is one to one if we used
>> -march + -mtune
>> method. That does not mean that -mcpu approach is inferior on the
>> contrary might be better in certain cases and in fact in majority of
>> cases we have.
>>
>> > I still believe -mcpu (with or without -march) is better option.
>> >
>>
>> I think on one hand it is, but there is another part which Mark
>> brought up of customized CPU implementations with not to common
>> choices of subsystems, which may not be exactly represented by -mcpu
>> options. I am inclined to
>> provide provisions to make it happen but I am not in favor of
>> designing it to address these corner implementations. I would rather
>> make it easy for 99% usecases.
>>
>> > Using -mtune without indicating which -mtune was actually used in the =
package arch is bad (especially if you have multiple MACHINEs with differen=
t DEFAULTTUNEs e.g. cortexa7, cortexa8 in -mtune, but both ending in armv7a=
 package arch, unpacking all packages from sstate every time you switch MAC=
HINE and the package manager on target never knowing which -mtune was used =
to build given package upgrade from feed).
>> >
>>
>> Yes this was a change for better.
>>
>> > Switching from -mcpu to -mtune while keeping the current cpu-specific =
package architectures is better, but then the use case, that I build everyt=
hing e.g. with cortexa8 in -mtune and install this cortexa8 package feed on=
 cortexa7 MACHINEs also looks strange, yes it will work in runtime, but why=
 not use generic armv7a DEFAULTTUNE to make it clear (to package manager as=
 well as end user) that I'm not really optimizing for given CPU).
>> >
>>
>> In current design I think we have design for using more optimized for
>> a CPU and be able to generate feeds which are cpu specific which is
>> great for certain use cases and hopefully more tunes to that CPU
>> implementation.
>>
>> > From the naive openssl benchmarks I did few years back, there was very=
 small difference between mtune/mcpu/just-march, but still for projects whe=
re I have separate package feeds for each device (e.g. LG TVs) I prefer to =
use -mcpu (because I really know that such packages won't ever be used on d=
evice with different CPU) and e.g. in LuneOS we're more concerned about pac=
kage feed size and build time, so we select more generic DEFAULTTUNE which =
is shared across many MACHINEs and that doesn't have any -mcpu (nor -mtune)=
 options in it, so should be fine as well.
>>
>> Exactly, the point here, we will be best served if we make it one way
>> or other, e.g. raspbian used thumb1 ISA across all rpi implementations
>> and they can use same feeds across all RPis that have even existed. It
>> has advantages of
>> its own to be able to do that, especially for people who work on
>> higher stacks they would be happy with such a setup.
>>
>> So I have to suggest on of three approached
>>
>> 1. Change -mcpu to -mtune and keep everything same. This make feed
>> arches point to tuned packages but fundamentally same for base
>> architecture ( e.g. armv7-a),
>> 2. Just use -mcpu and do not use -march/-mtune and may be provide
>> mechanism to override -mcpu, which is done by packages anyway ( maps
>> directly to package architectures )
>> 3. Just use -march and drop -mcpu and -mtune - Rename feed arches to
>> map to arch+features conventions instead of being CPU specific, this
>> will freak the users since it will be overwhelming to understand the
>> combinations
>>     e.g.  armv7ve+neon+vfpv4 etc. so the combination becomes
>> equivalent to -mcpu, current tune architecture we can construct this
>> easily by appending to march based on TUNE_FEATURES but I think
>> package arches will be a              massive to deal with and users
>> might ask what is this long -march/-mtune pointing to in terms of CPU,
>> but it will address Mark's usecase and will bring us closer to using
>> mcpu usecase, We can probaly do a bettter error reporting
>>     as well for conflicting tune features.
>>
>> I can cook up patches for option 3 from tunes part, packaging part I
>> am not sure maybe we can live with what we have
>> option 2 I already have posted a patch, option 1 would be a simplest
>> patch of all which can be done quickly as well.
>>
>> >
>> > We can easily extend the tune-test script I've used back then when swi=
tching to -mcpu to not only use bitbake -e, but also call gcc-cross to chec=
k for possible warnings from incompatible march/mcpu combinations and fix t=
hose. The old version is here:
>> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/t=
une-test
>> > it was used in mcpu switch here:
>> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/t=
une2-test
>> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/t=
une3
>> >
>> > From the gcc git log I don't see many changes in:
>> > https://github.com/gcc-mirror/gcc/commits/master/gcc/config/arm/driver=
-arm.c
>> > nor
>> > https://github.com/gcc-mirror/gcc/commits/master/gcc/config/arm/arm-cp=
us.in
>> > so I'm really interested which combination issues the warning now.
>> >
>> > Regards,
>> >
>> > On Sat, Jan 26, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >>
>> >> On Fri, Jan 25, 2019 at 12:32 PM Mark Hatle <mark.hatle@windriver.com=
> wrote:
>> >> >
>> >> > On 1/24/19 9:22 PM, Khem Raj wrote:
>> >> > > On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy <armccurdy@gmail.co=
m> wrote:
>> >> > >>
>> >> > >> On Wed, Jan 23, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wr=
ote:
>> >> > >>>
>> >> > >>> On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy <armccurdy@gmail.=
com> wrote:
>> >> > >>>>
>> >> > >>>> On Wed, Jan 23, 2019 at 12:05 PM Khem Raj <raj.khem@gmail.com>=
 wrote:
>> >> > >>>>>
>> >> > >>>>> tune files which inherit the arch definitions already define =
appropriate
>> >> > >>>>> -mcpu option, which is equivalent of right -march and -mtune =
combination
>> >> > >>>>
>> >> > >>>> And what about machines which inherit an arch definition inste=
ad of a
>> >> > >>>> cpu definition? Is that no longer supported?
>> >> > >>>
>> >> > >>> I could not find such a machine configuration in several BSP la=
yers I looked at.
>> >> > >>> Do you know of machine definitions where these files are includ=
ed
>> >> > >>> directly in machine configs ?
>> >> > >>
>> >> > >> Using a CPU specific include but then leaving the generic DEFAUL=
TTUNE
>> >> > >> (ie not enabling any CPU specific TUNE_CCARGS) is equivalent, an=
d I
>> >> > >> guess quite common.
>> >> > >
>> >> > > defaulttune does not play much part in appending -mcpu option to
>> >> > > compiler flags, A case
>> >> > > where this could bypass the setting mcpu is when we do not includ=
e a
>> >> > > tune-* for arm based machine
>> >> > > and thats the case I was interested to know.
>> >> > >
>> >> > > again if there is such a BSP I would be interested to test it out=
.
>> >> > >>
>> >> > >>> if so, then we have to either use _remove or introduce a weak v=
ariable
>> >> > >>> to set march only if
>> >> > >>> mcpu is not set which
>> >> > >>
>> >> > >> I think the solution is to ensure that the CPU specific tuning o=
ptions
>> >> > >> are always compatible with any architecture specific options whi=
ch may
>> >> > >> be active.
>> >> > >>
>> >> > >> In general our CPU specific tuning files are a little sloppy (e.=
g.
>> >> > >> defaulting to combinations of VFP versions and architecture leve=
ls
>> >> > >> which never exist in the real world). If newer versions of gcc a=
re
>> >> > >> making those issues more apparent then why not take the opportun=
ity to
>> >> > >> fix them properly?
>> >> > >
>> >> > > the mcpu option is helping with right march/mtune combination. wh=
ile we can
>> >> > > use specific -march=3Darch(+-)features syntax and combine with ri=
ght
>> >> > > -mtune to match -mcpu I think we should use
>> >> > > compiler defaults and not try to recreate something that -mcpu wo=
uld
>> >> > > do it easily for us.
>> >> > >
>> >> > > So either we drop the idea of setting mcpu and use basic -march v=
alue
>> >> > > combined with -mtune ( which btw. was default in past)
>> >> > > or if we want to let compiler use ISA for a particular arch
>> >> > > implementation ( cortexXXX ) then we should just use -mcpu and dr=
op
>> >> > > using -mtune and -march.
>> >> > >
>> >> > > I would include towards option 1.
>> >> >
>> >> > I know this is a bit of a 'me too' response, but we have to pick on=
e format and
>> >> > stay with it.  Either option, but not both.
>> >>
>> >> I concur.
>> >>
>> >>
>> >> >
>> >> > -IF- we know that the appropriate -mcpu options are available for a=
ll of the
>> >> > potential combinations out there, then this is by far the preferred=
 method in my
>> >> > mind.  Much easier to handle and manage...
>> >>
>> >> -mcpu options are available for known CPU implementations. But there =
always will
>> >> be weird ones, given how people can pick and choose subsystems for SO=
C on this
>> >> architecture, and its highly probable that they wont be in gcc. so re=
al question we need to answer for is, should we design for those cases and =
how often does this often.
>> >>
>> >>
>> >> >
>> >> > However, the more complex route came out as various 'odd-ball' (and=
 people claim
>> >> > don't exist, but they do) custom ARM cores get released without 'ma=
ndatory' math
>> >> > units, or some other odd ball variation.  (I've seen this numerous =
times over
>> >> > the last 20 years that something that doesn't exist, does... all be=
cause it's a
>> >> > custom part.)
>> >>
>> >> Yes, I am dealing with one such design even today
>> >>
>> >>
>> >> >
>> >> > If we have an easy way to define the -mcpu=3D means some magic comb=
ination of
>> >> > -march/-mtune within the GCC spec itself, then I'm 100% for moving =
to -mcpu to
>> >> > rid ourselves of this mess.. and then we still have the flexibility=
 to easily
>> >> > update/add tunes and GCC configuration for the odd-balls that seem =
to crop up
>> >> > regularly.
>> >>
>> >> So yes we can do nearly same but not exactly same. We have to start a=
dding or deleting
>> >> features via -march and -mtune would be same value, but there are cas=
es where gcc defines
>> >> internal properties based on mcpu, that is not representable in those=
 suffixes we will add. so
>> >> we will come very close but not exact and I think compiler is right i=
n this case because we
>> >> are not exactly telling it about a CPU implementation, but we are tel=
ling the cpu has these properties, so it really may not be one of standard =
cpu implementation.
>> >>
>> >>
>> >> >
>> >> > (I know -I- can always patch GCC for new -mcpu combinations, but I'=
m not
>> >> > thinking about 'me', I'm thinking about the user of OE who is told =
'use this
>> >> > CPU, it has this set of functions' and is NOT a compiler expert who=
 can wade
>> >> > through GCC spec files and generate patches with any confidence.)
>> >> >
>> >>
>> >> I would think we can solve this for these niche cases, via using -mar=
ch/-mtune and drop
>> >> -mcpu, we can append adding/deleting a given feature e.g. neon or vfp=
 or vfpv3 etc.
>> >> but this would mean we have to rename our package feed names as well =
to match this
>> >> new representation, which currently is mapped to mcpu values. This is=
 quite a departure
>> >> from package feeds point of view. but its more aligned with how we ha=
ve defined arch and tunes.
>> >> so pick the battles.
>> >>
>> >>
>> >> > --Mark
>> >> >
>> >> > >>
>> >> > >>>>> and is preferred since gcc is getting stricter and stricter w=
ith option
>> >> > >>>>> check semantics and can now find incompatible -march and -mcp=
u options
>> >> > >>>>> better with every release. It does internal feature consisten=
cy check
>> >> > >>>>> and if it finds out discrepency between what -mcpu would expa=
nd to as
>> >> > >>>>> compared to -march it will flag the options to be incompatibl=
e, for
>> >> > >>>>> naked eye it sounds wrong but gcc would translate -mcpu to a =
given
>> >> > >>>>> -march internally and it might not match to what we set in th=
ese arch
>> >> > >>>>> files.
>> >> > >>>>>
>> >> > >>>>> The effects are quite subtle, where this can result in config=
ure test
>> >> > >>>>> failing to compile due to these incompatible options and a fe=
ature
>> >> > >>>>> option getting disabled for a recipe for no reason.
>> >> > >>>>>
>> >> > >>>>> e.g. with gcc9 which can now detect that -mcpu=3Dcortex-a5 an=
d
>> >> > >>>>> -march=3Darmv7-a are incompatible, many features in libstdc++=
 ends up
>> >> > >>>>> disabled due to configure check failures e.g. size_t size, pt=
rdiff_t
>> >> > >>>>> sizes, which inturn results in compiling libstdc++ with unwan=
ted
>> >> > >>>>> disabled features.
>> >> > >>>>
>> >> > >>>> It would be interesting to see more specific details of this.
>> >> > >>>
>> >> > >>> These are configure tests which fail when -Werror is in use and=
 is not
>> >> > >>> limited to libstdc++
>> >> > >>> it can happen in any package. Since the diagnostic about incomp=
atible
>> >> > >>> march mcpu pair
>> >> > >>> is a warning in general, it does not matter, but when we have -=
Werror
>> >> > >>> enabled this turns
>> >> > >>> into error, You can simply try a small helloworld example to se=
e the effects.
>> >> > >>>
>> >> > >>>>
>> >> > >>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> > >>>>> ---
>> >> > >>>>>  meta/conf/machine/include/arm/arch-armv4.inc   | 1 -
>> >> > >>>>>  meta/conf/machine/include/arm/arch-armv5.inc   | 1 -
>> >> > >>>>>  meta/conf/machine/include/arm/arch-armv6.inc   | 1 -
>> >> > >>>>>  meta/conf/machine/include/arm/arch-armv7a.inc  | 1 -
>> >> > >>>>>  meta/conf/machine/include/arm/arch-armv7ve.inc | 1 -
>> >> > >>>>>  meta/conf/machine/include/tune-iwmmxt.inc      | 2 +-
>> >> > >>>>>  6 files changed, 1 insertion(+), 6 deletions(-)
>> >> > >>>>>
>> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/m=
eta/conf/machine/include/arm/arch-armv4.inc
>> >> > >>>>> index 47a7ad2830..52d8ab1e8f 100644
>> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv4.inc
>> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv4.inc
>> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D "armv4"
>> >> > >>>>>
>> >> > >>>>>  TUNEVALID[arm] =3D "Enable ARM instruction set"
>> >> > >>>>>  TUNEVALID[armv4] =3D "Enable instructions for ARMv4"
>> >> > >>>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm=
v4', ' -march=3Darmv4t', '', d)}"
>> >> > >>>>>  # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but=
 then disable it when we have also armv5 or thumb
>> >> > >>>>>  # maybe we should extend bb.utils.contains to support check =
for any checkvalues in value, now it does
>> >> > >>>>>  # checkvalues.issubset(val) which cannot be used for negativ=
e test of foo neither bar in value
>> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/m=
eta/conf/machine/include/arm/arch-armv5.inc
>> >> > >>>>> index f9068af9de..1fe1b6b8e4 100644
>> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv5.inc
>> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
>> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D "armv5"
>> >> > >>>>>
>> >> > >>>>>  TUNEVALID[armv5] =3D "Enable instructions for ARMv5"
>> >> > >>>>>  TUNECONFLICTS[armv5] =3D "armv4"
>> >> > >>>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm=
v5', ' -march=3Darmv5t${ARMPKGSFX_DSP}', '', d)}"
>> >> > >>>>>  MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES',=
 'armv5', 'armv5:', '' ,d)}"
>> >> > >>>>>
>> >> > >>>>>  require conf/machine/include/arm/arch-armv4.inc
>> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/m=
eta/conf/machine/include/arm/arch-armv6.inc
>> >> > >>>>> index 6c838e999c..adb9be8050 100644
>> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv6.inc
>> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
>> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D "armv6hf"
>> >> > >>>>>
>> >> > >>>>>  TUNEVALID[armv6] =3D "Enable instructions for ARMv6"
>> >> > >>>>>  TUNECONFLICTS[armv6] =3D "armv4 armv5"
>> >> > >>>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm=
v6', ' -march=3Darmv6', '', d)}"
>> >> > >>>>>  MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES',=
 'armv6', 'armv6:', '' ,d)}"
>> >> > >>>>>
>> >> > >>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
>> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/=
meta/conf/machine/include/arm/arch-armv7a.inc
>> >> > >>>>> index a2663d8008..09d2c03a5d 100644
>> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> >> > >>>>> @@ -3,7 +3,6 @@ ARM_INSTRUCTION_SET ?=3D "thumb"
>> >> > >>>>>
>> >> > >>>>>  TUNEVALID[armv7a] =3D "Enable instructions for ARMv7-a"
>> >> > >>>>>  TUNECONFLICTS[armv7a] =3D "armv4 armv5 armv6 armv7"
>> >> > >>>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm=
v7a', ' -march=3Darmv7-a', '', d)}"
>> >> > >>>>>  MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES',=
 'armv7a', 'armv7a:', '' ,d)}"
>> >> > >>>>>
>> >> > >>>>>  require conf/machine/include/arm/arch-armv6.inc
>> >> > >>>>> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b=
/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> > >>>>> index 4d9260fecb..31e334f645 100644
>> >> > >>>>> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> > >>>>> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> > >>>>> @@ -2,7 +2,6 @@ DEFAULTTUNE ?=3D "armv7vethf"
>> >> > >>>>>
>> >> > >>>>>  TUNEVALID[armv7ve] =3D "Enable instructions for ARMv7ve"
>> >> > >>>>>  TUNECONFLICTS[armv7ve] =3D "armv4 armv5 armv6 armv7 armv7a"
>> >> > >>>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm=
v7ve', ' -march=3Darmv7ve', '', d)}"
>> >> > >>>>>  MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES',=
 'armv7ve', 'armv7ve:', '' ,d)}"
>> >> > >>>>>
>> >> > >>>>>  require conf/machine/include/arm/arch-armv7a.inc
>> >> > >>>>> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta=
/conf/machine/include/tune-iwmmxt.inc
>> >> > >>>>> index f27423cb2e..6e577697cc 100644
>> >> > >>>>> --- a/meta/conf/machine/include/tune-iwmmxt.inc
>> >> > >>>>> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
>> >> > >>>>> @@ -6,7 +6,7 @@ DEFAULTTUNE ?=3D "iwmmxt"
>> >> > >>>>>  require conf/machine/include/arm/arch-armv5-dsp.inc
>> >> > >>>>>
>> >> > >>>>>  TUNEVALID[iwmmxt] =3D "Enable Intel PXA27x specific processo=
r optimizations"
>> >> > >>>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'iwm=
mxt', ' -march=3Diwmmxt -mcpu=3Diwmmxt', '', d)}"
>> >> > >>>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'iwm=
mxt', ' -mcpu=3Diwmmxt', '', d)}"
>> >> > >>>>>
>> >> > >>>>>  AVAILTUNES +=3D "iwmmxt"
>> >> > >>>>>  ARMPKGARCH_tune-iwmmxt =3D "iwmmxt"
>> >> > >>>>> --
>> >> > >>>>> 2.20.1
>> >> > >>>>>
>> >> > >>>>> --
>> >> > >>>>> _______________________________________________
>> >> > >>>>> Openembedded-core mailing list
>> >> > >>>>> Openembedded-core@lists.openembedded.org
>> >> > >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-c=
ore
>> >> >
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

