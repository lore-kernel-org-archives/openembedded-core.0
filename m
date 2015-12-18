Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id A2953731C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:50:27 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p187so228944wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Kn1yua/azgVyP2t2ndMIVGk7Kd3ExDAhR2cViyCBnxk=;
	b=Gz8rOQ2mn6NXbmIhR1Vp42ikDRFqN3ISx5Siesy6qkpCv6rUhoRtsrnOMbMbjQW4I9
	D4nWvCF0/er2OKjBvJuC7H289VgkP9c6cqNsqUP2ax15Y9P/XV4J+jTaFFoEsuMIWHVL
	Mlk50/DQzAJrhAT1qq1TLQBId7XbQjlgT22XxMgpTKpePLxeR3SXajLQCF+/+NDg83k0
	oYOJR9XlkBHBEDUEHJqZ2rPaB3pOyr4emYz5APWumHRDYiE+Q5zBOeowtwxArIz7Uln8
	0TPRvT8z9AbYIS6IuANms+1DuGbeMObNRvS2dTrP2e0yz+Spf6ja7adPW/PSiC9VU/qq
	T5EQ==
MIME-Version: 1.0
X-Received: by 10.28.177.10 with SMTP id a10mr5229688wmf.4.1450471827676; Fri,
	18 Dec 2015 12:50:27 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Fri, 18 Dec 2015 12:50:27 -0800 (PST)
In-Reply-To: <CA+chaQcQYQHfR5NQ811w9jZz03MN-cSnmyxRDe=p8HSJQ_NU9g@mail.gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
	<491ead1c0e8db7f1c919c163431be7bb9b087ddd.1449754344.git.Martin.Jansa@gmail.com>
	<CAJ86T=Vg-Q-oqiVuZXLU-rMwr=vwypdE2PUBMXuxJqQ6_a4+Bg@mail.gmail.com>
	<20151218131333.GJ2563@jama>
	<CAJ86T=VqZQb_QfS2Px8CP4u0NqoOnC0b_qpEbU-BnRuxoGF-Uw@mail.gmail.com>
	<CA+chaQcWrSYA3O9rLesY8TwaAgz+efqWE=G-Pp0ZAgubh_AgGg@mail.gmail.com>
	<CAJ86T=UaBymFVsUhNxOt=Rf3OVUCKMTTYx021Kz1_WDObEt0fQ@mail.gmail.com>
	<CA+chaQcQYQHfR5NQ811w9jZz03MN-cSnmyxRDe=p8HSJQ_NU9g@mail.gmail.com>
Date: Fri, 18 Dec 2015 12:50:27 -0800
Message-ID: <CAJ86T=V7ytRq_E5hMMx9GxQaUfo9s-TRsf-63rG=wUc67RfVKg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master][RESEND 14/15] arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
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
X-List-Received-Date: Fri, 18 Dec 2015 20:50:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 12:45 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Machines should let the distro decide, not the other way around
>
> I agree, but that's IMHO argument for keeping thumb-less tunes available.
>
> MACHINEs should define what they can support and DISTRO decides what
> features they want to use for given MACHINE(s).
>
> Dropping thumb-less tunes would indicate that MACHINE doesn't support arm
> ISA, which isn't true for armv7ve (only cortexm3 is currently using that).

Huh? Dropping thumb-less tunes doesn't have any impact on whether or
not a MACHINE supports for ARM.

> On Fri, Dec 18, 2015 at 9:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Fri, Dec 18, 2015 at 12:13 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > I've meant that the DISTRO can enable thumb with ARM_INSTRUCTION_SET
>> > while
>> > still using DEFAULTTUNE without thumb as common denominator for some
>> > group
>> > of MACHINEs.
>>
>> That seems like inverting the normal priority. Machines should let the
>> distro decide, not the other way around - so we should discourage that
>> situation, not try to support it!
>>
>> > I'm not saying that it's common scenario and really has to be supported,
>> > but
>> > having thumb-less tunes in armv7ve like we have in armv7a is IMHO worth
>> > it
>> > at least for consistency sake between these 2.
>>
>> Yes, maybe. Consistency is a good argument. My own preference would be
>> to remove the thumb-less tunes from armv7a too, but maybe that's too
>> radical...
>>
>> > On Fri, Dec 18, 2015 at 9:08 PM, Andre McCurdy <armccurdy@gmail.com>
>> > wrote:
>> >>
>> >> On Fri, Dec 18, 2015 at 5:13 AM, Martin Jansa <martin.jansa@gmail.com>
>> >> wrote:
>> >> > On Thu, Dec 17, 2015 at 07:13:55PM -0800, Andre McCurdy wrote:
>> >> >> On Thu, Dec 10, 2015 at 5:48 AM, Martin Jansa
>> >> >> <martin.jansa@gmail.com>
>> >> >> wrote:
>> >> >> > * be aware that this -march value is available only in gcc-4.9 and
>> >> >> >   newer:
>> >> >> >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907
>> >> >> > * -mcpu=cortex15 and -mcpu=cortexa7 conflict with -march=armv7a
>> >> >> >   We either have to stop putting -march in default CCARGS or at
>> >> >> >   least set it compatible one like this patch does.
>> >> >>
>> >> >> Can we drop the concept of armv7ve without Thumb support?
>> >> >>
>> >> >> Thumb was optional for armv4 but from armv5 onwards every ARM core
>> >> >> has
>> >> >> been able to support Thumb as well. Unfortunately the cpu tuning
>> >> >> .inc
>> >> >> files in oe-core for armv5 and above just seem to have copied any
>> >> >> pasted from armv4 and so provide bogus non-thumb capable tuning
>> >> >> options, which just add a lot of unnecessary complexity (the only
>> >> >> real
>> >> >> difference between them is that the thumb capable versions respect
>> >> >> ARM_INSTRUCTION_SET and the non-thumb capable versions ignore it).
>> >> >>
>> >> >> To avoid breaking existing machine configs and package feeds, I
>> >> >> guess
>> >> >> we might be stuck with the existing AVAILTUNES for armv7a and below,
>> >> >> but can we at least fix it for armv7ve ?
>> >> >
>> >> > Well even when the HW supports the thumb, some DISTROs tend to
>> >> > disable
>> >> > it for whatever reasons (e.g. you can use very low common denominator
>> >> > DEFAULTTUNE for many MACHINEs - which cannot be controlled by
>> >> > ARM_INSTRUCTION_SET only).
>> >>
>> >> Could you explain a little more about that? Can't ARM_INSTRUCTION_SET
>> >> always be used to force ARM for cores which support both?
>> >>
>> >> > What harm do you see from keeping tunes without Thumb? Only the
>> >> > maintenance of the tune file? That's not so bad because it's exact
>> >> > copy
>> >> > of arch-armv7a.inc with s/7a/7ve/g.
>> >> >
>> >> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >> >> > ---
>> >> >> >  meta/conf/machine/include/arm/arch-armv7ve.inc     | 141
>> >> >> > +++++++++++++++++++++
>> >> >> >  .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
>> >> >> >  meta/conf/machine/include/tune-cortexa15.inc       |  52 ++++----
>> >> >> >  meta/conf/machine/include/tune-cortexa7.inc        |  52 ++++----
>> >> >> >  4 files changed, 194 insertions(+), 52 deletions(-)
>> >> >> >  create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> >> >
>> >> >> > diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> >> > b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> >> > new file mode 100644
>> >> >> > index 0000000..79e1ef6
>> >> >> > --- /dev/null
>> >> >> > +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> >> > @@ -0,0 +1,141 @@
>> >> >> > +DEFAULTTUNE ?= "armv7ve"
>> >> >> > +
>> >> >> > +TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>> >> >> > +TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>> >> >> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve',
>> >> >> > '
>> >> >> > -march=armv7ve', '', d)}"
>> >> >> > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
>> >> >> > 'armv7ve', 'armv7ve:', '' ,d)}"
>> >> >> > +
>> >> >> > +require conf/machine/include/arm/arch-armv6.inc
>> >> >> > +require conf/machine/include/arm/feature-arm-neon.inc
>> >> >> > +
>> >> >> > +# Little Endian base configs
>> >> >> > +AVAILTUNES += "armv7ve armv7vet armv7ve-vfpv3d16
>> >> >> > armv7vet-vfpv3d16
>> >> >> > armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon armv7vet-neon
>> >> >> > armv7ve-neon-vfpv4
>> >> >> > armv7vet-neon-vfpv4"
>> >> >> > +ARMPKGARCH_tune-armv7ve             ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vet            ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7ve-vfpv3d16    ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vet-vfpv3d16   ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7ve-vfpv3       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vet-vfpv3      ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7ve-neon        ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vet-neon       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7ve-neon-vfpv4  ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vet-neon-vfpv4 ?= "armv7ve"
>> >> >> > +TUNE_FEATURES_tune-armv7ve             = "arm armv7ve vfp"
>> >> >> > +TUNE_FEATURES_tune-armv7vet            =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve} thumb"
>> >> >> > +TUNE_FEATURES_tune-armv7ve-vfpv3d16    =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve}  vfpv3d16"
>> >> >> > +TUNE_FEATURES_tune-armv7vet-vfpv3d16   =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet} vfpv3d16"
>> >> >> > +TUNE_FEATURES_tune-armv7ve-vfpv3       =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}  vfpv3"
>> >> >> > +TUNE_FEATURES_tune-armv7vet-vfpv3      =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} vfpv3"
>> >> >> > +TUNE_FEATURES_tune-armv7ve-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve}  neon"
>> >> >> > +TUNE_FEATURES_tune-armv7vet-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet} neon"
>> >> >> > +TUNE_FEATURES_tune-armv7ve-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}  vfpv4"
>> >> >> > +TUNE_FEATURES_tune-armv7vet-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon} vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7ve armv7ve-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7ve armv7ve-vfp
>> >> >> > armv7vet2-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16   =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfpv3d16
>> >> >> > armv7vet2-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16}  armv7ve-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3      =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16} armv7ve-vfpv3
>> >> >> > armv7vet2-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-neon armv7vet2-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  armv7ve-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} armv7ve-neon-vfpv4
>> >> >> > armv7vet2-neon-vfpv4"
>> >> >> > +
>> >> >> > +# HF Tunes
>> >> >> > +AVAILTUNES += "armv7vehf armv7vethf armv7vehf-vfpv3d16
>> >> >> > armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3
>> >> >> > armv7vehf-neon
>> >> >> > armv7vethf-neon armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4"
>> >> >> > +ARMPKGARCH_tune-armv7vehf             ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethf            ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehf-vfpv3d16    ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethf-vfpv3d16   ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehf-vfpv3       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethf-vfpv3      ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehf-neon        ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethf-neon       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehf-neon-vfpv4  ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethf-neon-vfpv4 ?= "armv7ve"
>> >> >> > +TUNE_FEATURES_tune-armv7vehf             =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve}             callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vethf            =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet}            callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vehf-vfpv3d16    =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vethf-vfpv3d16   =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vehf-vfpv3       =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3}       callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vethf-vfpv3      =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3}      callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vehf-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vethf-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  callconvention-hard"
>> >> >> > +TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} callconvention-hard"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7vehf-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7vehf-vfp
>> >> >> > armv7vet2hf-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16   =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfpv3d16
>> >> >> > armv7vet2hf-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16}  armv7vehf-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3      =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16} armv7vehf-vfpv3
>> >> >> > armv7vet2hf-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-neon
>> >> >> > armv7vet2hf-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  armv7vehf-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} armv7vehf-neon-vfpv4
>> >> >> > armv7vet2hf-neon-vfpv4"
>> >> >> > +
>> >> >> > +# Big Endian
>> >> >> > +AVAILTUNES += "armv7veb armv7vetb armv7veb-vfpv3d16
>> >> >> > armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3 armv7veb-neon
>> >> >> > armv7vetb-neon armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4"
>> >> >> > +ARMPKGARCH_tune-armv7veb             ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vetb            ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7veb-vfpv3d16    ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vetb-vfpv3d16   ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7veb-vfpv3       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vetb-vfpv3      ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7veb-neon        ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vetb-neon       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7veb-neon-vfpv4  ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vetb-neon-vfpv4 ?= "armv7ve"
>> >> >> > +TUNE_FEATURES_tune-armv7veb             =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve}             bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vetb            =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet}            bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7veb-vfpv3d16    =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vetb-vfpv3d16   =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7veb-vfpv3       =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3}       bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vetb-vfpv3      =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3}      bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7veb-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vetb-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7veb-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vetb-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} bigendian"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7veb-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7veb-vfp armv7vet2b-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16   =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfpv3d16
>> >> >> > armv7vet2b-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16}  armv7veb-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3      =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16} armv7veb-vfpv3
>> >> >> > armv7vet2b-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-neon
>> >> >> > armv7vet2b-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon}  armv7veb-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon} armv7veb-neon-vfpv4
>> >> >> > armv7vet2b-neon-vfpv4"
>> >> >> > +
>> >> >> > +# Big Endian + HF
>> >> >> > +AVAILTUNES += "armv7vehfb armv7vethfb armv7vehfb-vfpv3d16
>> >> >> > armv7vethfb-vfpv3d16 armv7vehfb-vfpv3 armv7vethfb-vfpv3
>> >> >> > armv7vehfb-neon
>> >> >> > armv7vethfb-neon armv7vehfb-neon-vfpv4 armv7vethfb-neon-vfpv4"
>> >> >> > +ARMPKGARCH_tune-armv7vehfb             ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethfb            ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehfb-vfpv3d16    ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethfb-vfpv3d16   ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehfb-vfpv3       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethfb-vfpv3      ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehfb-neon        ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethfb-neon       ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vehfb-neon-vfpv4  ?= "armv7ve"
>> >> >> > +ARMPKGARCH_tune-armv7vethfb-neon-vfpv4 ?= "armv7ve"
>> >> >> > +TUNE_FEATURES_tune-armv7vehfb             =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf}             bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vethfb            =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf}            bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vehfb-vfpv3d16    =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-vfpv3d16}    bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vethfb-vfpv3d16   =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-vfpv3d16}   bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vehfb-vfpv3       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-vfpv3}       bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vethfb-vfpv3      =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-vfpv3}      bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vehfb-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon}        bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vethfb-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon}       bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  bigendian"
>> >> >> > +TUNE_FEATURES_tune-armv7vethfb-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} bigendian"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7vehfb-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7vehfb-vfp
>> >> >> > armv7vet2hfb-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16   =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfpv3d16
>> >> >> > armv7vet2hfb-vfpv3d16"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16}
>> >> >> > armv7vehfb-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3      =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16} armv7vehfb-vfpv3
>> >> >> > armv7vet2hfb-vfpv3"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-neon
>> >> >> > armv7vet2hfb-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon}
>> >> >> > armv7vehfb-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon}
>> >> >> > armv7vehfb-neon-vfpv4
>> >> >> > armv7vet2hfb-neon-vfpv4"
>> >> >> > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> >> >> > b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> >> >> > index 5632171..54c0cee 100644
>> >> >> > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> >> >> > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> >> >> > @@ -12,6 +12,7 @@ ARM_THUMB_SUFFIX .=
>> >> >> > "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d
>> >> >> >  ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
>> >> >> > 'armv7a',
>> >> >> > 't2', '', d)}"
>> >> >> >  ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
>> >> >> > 'armv7r',
>> >> >> > 't2', '', d)}"
>> >> >> >  ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
>> >> >> > 'armv7m',
>> >> >> > 't2', '', d)}"
>> >> >> > +ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
>> >> >> > 'armv7ve', 't2', '', d)}"
>> >> >> >
>> >> >> >  # If the device supports ARM, then respect ARM_THUMB_OPT (which
>> >> >> > can
>> >> >> > be "arm" or "thumb")
>> >> >> >  # If the defice doesn't support ARM, then always set "thumb" even
>> >> >> > when
>> >> >> > diff --git a/meta/conf/machine/include/tune-cortexa15.inc
>> >> >> > b/meta/conf/machine/include/tune-cortexa15.inc
>> >> >> > index 8b34bb2..cfc8151 100644
>> >> >> > --- a/meta/conf/machine/include/tune-cortexa15.inc
>> >> >> > +++ b/meta/conf/machine/include/tune-cortexa15.inc
>> >> >> > @@ -1,6 +1,6 @@
>> >> >> > -DEFAULTTUNE ?= "armv7a-neon"
>> >> >> > +DEFAULTTUNE ?= "armv7ve-neon"
>> >> >> >
>> >> >> > -require conf/machine/include/arm/arch-armv7a.inc
>> >> >> > +require conf/machine/include/arm/arch-armv7ve.inc
>> >> >> >
>> >> >> >  TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor
>> >> >> > optimizations"
>> >> >> >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
>> >> >> > 'cortexa15', '
>> >> >> > -mtune=cortex-a15', '', d)}"
>> >> >> > @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa15-neon        =
>> >> >> > "cortexa15"
>> >> >> >  ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
>> >> >> >  ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
>> >> >> >  ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15             =
>> >> >> > "${TUNE_FEATURES_tune-armv7a}             cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15t            =
>> >> >> > "${TUNE_FEATURES_tune-armv7at}            cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7a-neon}        cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15t-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7at-neon}       cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa15"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa15-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp
>> >> >> > cortexa15t2-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp
>> >> >> > cortexa15-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp
>> >> >> > cortexa15-neon
>> >> >> > cortexa15t2-vfp cortexa15t2-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa15-vfp
>> >> >> > cortexa15-neon
>> >> >> > cortexa15-neon-vfpv4"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa15-vfp
>> >> >> > cortexa15-neon
>> >> >> > cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon
>> >> >> > cortexa15t2-neon-vfpv4"
>> >> >> > +TUNE_FEATURES_tune-cortexa15             =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve}             cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15t            =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet}            cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15t-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa15"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa15-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp
>> >> >> > cortexa15t2-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa15-vfp
>> >> >> > cortexa15-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa15-vfp
>> >> >> > cortexa15-neon
>> >> >> > cortexa15t2-vfp cortexa15t2-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa15-vfp
>> >> >> > cortexa15-neon cortexa15-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp
>> >> >> > cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp
>> >> >> > cortexa15t2-neon
>> >> >> > cortexa15t2-neon-vfpv4"
>> >> >> >
>> >> >> >  # HF Tunes
>> >> >> >  AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon
>> >> >> > cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
>> >> >> > @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa15hf-neon        =
>> >> >> > "cortexa15"
>> >> >> >  ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
>> >> >> >  ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
>> >> >> >  ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15hf             =
>> >> >> > "${TUNE_FEATURES_tune-armv7ahf}             cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15thf            =
>> >> >> > "${TUNE_FEATURES_tune-armv7athf}            cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15hf-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15thf-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa15"
>> >> >> > -TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa15"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp
>> >> >> > cortexa15t2hf-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp
>> >> >> > cortexa15hf-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp
>> >> >> > cortexa15hf-neon
>> >> >> > cortexa15t2hf-vfp cortexa15t2hf-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa15hf-vfp
>> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa15hf-vfp
>> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp
>> >> >> > cortexa15t2hf-neon
>> >> >> > cortexa15t2hf-neon-vfpv4"
>> >> >> > +TUNE_FEATURES_tune-cortexa15hf             =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf}             cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15thf            =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf}            cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15hf-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15thf-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa15"
>> >> >> > +TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa15"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa15hf-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp
>> >> >> > cortexa15t2hf-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa15hf-vfp
>> >> >> > cortexa15hf-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp
>> >> >> > cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa15hf-vfp
>> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa15hf-vfp
>> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp
>> >> >> > cortexa15t2hf-neon
>> >> >> > cortexa15t2hf-neon-vfpv4"
>> >> >> > diff --git a/meta/conf/machine/include/tune-cortexa7.inc
>> >> >> > b/meta/conf/machine/include/tune-cortexa7.inc
>> >> >> > index 4fea36f..84432bd 100644
>> >> >> > --- a/meta/conf/machine/include/tune-cortexa7.inc
>> >> >> > +++ b/meta/conf/machine/include/tune-cortexa7.inc
>> >> >> > @@ -1,6 +1,6 @@
>> >> >> > -DEFAULTTUNE ?= "armv7a-neon"
>> >> >> > +DEFAULTTUNE ?= "armv7ve-neon"
>> >> >> >
>> >> >> > -require conf/machine/include/arm/arch-armv7a.inc
>> >> >> > +require conf/machine/include/arm/arch-armv7ve.inc
>> >> >> >
>> >> >> >  TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor
>> >> >> > optimizations"
>> >> >> >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7',
>> >> >> > '
>> >> >> > -mtune=cortex-a7', '', d)}"
>> >> >> > @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa7-neon        =
>> >> >> > "cortexa7"
>> >> >> >  ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
>> >> >> >  ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
>> >> >> >  ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7             =
>> >> >> > "${TUNE_FEATURES_tune-armv7a}             cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7t            =
>> >> >> > "${TUNE_FEATURES_tune-armv7at}            cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7a-neon}        cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7t-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7at-neon}       cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa7"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa7-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp
>> >> >> > cortexa7-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp
>> >> >> > cortexa7-neon
>> >> >> > cortexa7t2-vfp cortexa7t2-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa7-vfp
>> >> >> > cortexa7-neon
>> >> >> > cortexa7-neon-vfpv4"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa7-vfp
>> >> >> > cortexa7-neon
>> >> >> > cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon
>> >> >> > cortexa7t2-neon-vfpv4"
>> >> >> > +TUNE_FEATURES_tune-cortexa7             =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve}             cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7t            =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet}            cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7t-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa7"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa7-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa7-vfp
>> >> >> > cortexa7-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa7-vfp
>> >> >> > cortexa7-neon
>> >> >> > cortexa7t2-vfp cortexa7t2-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa7-vfp
>> >> >> > cortexa7-neon
>> >> >> > cortexa7-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa7-vfp
>> >> >> > cortexa7-neon
>> >> >> > cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon
>> >> >> > cortexa7t2-neon-vfpv4"
>> >> >> >
>> >> >> >  # HF Tunes
>> >> >> >  AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon
>> >> >> > cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
>> >> >> > @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa7hf-neon        =
>> >> >> > "cortexa7"
>> >> >> >  ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
>> >> >> >  ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
>> >> >> >  ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7hf             =
>> >> >> > "${TUNE_FEATURES_tune-armv7ahf}             cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7thf            =
>> >> >> > "${TUNE_FEATURES_tune-armv7athf}            cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7hf-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7thf-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa7"
>> >> >> > -TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa7hf-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp
>> >> >> > cortexa7t2hf-vfp"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp
>> >> >> > cortexa7hf-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp
>> >> >> > cortexa7hf-neon
>> >> >> > cortexa7t2hf-vfp cortexa7t2hf-neon"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp
>> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4"
>> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp
>> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp
>> >> >> > cortexa7t2hf-neon
>> >> >> > cortexa7t2hf-neon-vfpv4"
>> >> >> > +TUNE_FEATURES_tune-cortexa7hf             =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf}             cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7thf            =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf}            cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7hf-neon        =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7thf-neon       =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  =
>> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa7"
>> >> >> > +TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =
>> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa7"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa7hf-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp
>> >> >> > cortexa7t2hf-vfp"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa7hf-vfp
>> >> >> > cortexa7hf-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa7hf-vfp
>> >> >> > cortexa7hf-neon
>> >> >> > cortexa7t2hf-vfp cortexa7t2hf-neon"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa7hf-vfp
>> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4"
>> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =
>> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa7hf-vfp
>> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp
>> >> >> > cortexa7t2hf-neon
>> >> >> > cortexa7t2hf-neon-vfpv4"
>> >> >> > --
>> >> >> > 2.6.3
>> >> >> >
>> >> >> > --
>> >> >> > _______________________________________________
>> >> >> > Openembedded-core mailing list
>> >> >> > Openembedded-core@lists.openembedded.org
>> >> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >> >
>> >> > --
>> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> >
>
>

