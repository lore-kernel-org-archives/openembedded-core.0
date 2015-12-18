Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DE0BB731BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:56:59 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l126so661533wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FcRUgMcvWyw6odtluoqBUwWS3On9bHwq6Fd0jj8KOvI=;
	b=V6AxdnyQi54kbwb1KpyIISRVPUqyxaOZNFn/JsDN3A1f6hhWHHrqH6BhWd77sekEci
	NF9xZTJEKAkcY1fX+s4nDGRLMhXKXANGLj4uI//WHgPHIMYFusxfkt4pmAzvW7FLk14I
	CZibvLDQntyIHOWIV6g1Uqr9P6KA0xMPvOPMayTZFolKyyyixHRtVcjQhYNEmjJLLgoS
	HiT6j57466+HZjKMJ0Tqvc9XGUOV2pcuzO3Bdjm6VYACQN/MEcCzIWA7SGmNymaFqVcw
	XAt079Po3l2O3t/wW9SqvwwtRyOOjAWhputmFUy46gCUKoatEFKqGQ7a/F3MH4XLdb8z
	8kHA==
MIME-Version: 1.0
X-Received: by 10.194.223.39 with SMTP id qr7mr6015546wjc.63.1450472220372;
	Fri, 18 Dec 2015 12:57:00 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 18 Dec 2015 12:57:00 -0800 (PST)
In-Reply-To: <CAJ86T=V7ytRq_E5hMMx9GxQaUfo9s-TRsf-63rG=wUc67RfVKg@mail.gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
	<491ead1c0e8db7f1c919c163431be7bb9b087ddd.1449754344.git.Martin.Jansa@gmail.com>
	<CAJ86T=Vg-Q-oqiVuZXLU-rMwr=vwypdE2PUBMXuxJqQ6_a4+Bg@mail.gmail.com>
	<20151218131333.GJ2563@jama>
	<CAJ86T=VqZQb_QfS2Px8CP4u0NqoOnC0b_qpEbU-BnRuxoGF-Uw@mail.gmail.com>
	<CA+chaQcWrSYA3O9rLesY8TwaAgz+efqWE=G-Pp0ZAgubh_AgGg@mail.gmail.com>
	<CAJ86T=UaBymFVsUhNxOt=Rf3OVUCKMTTYx021Kz1_WDObEt0fQ@mail.gmail.com>
	<CA+chaQcQYQHfR5NQ811w9jZz03MN-cSnmyxRDe=p8HSJQ_NU9g@mail.gmail.com>
	<CAJ86T=V7ytRq_E5hMMx9GxQaUfo9s-TRsf-63rG=wUc67RfVKg@mail.gmail.com>
Date: Fri, 18 Dec 2015 21:57:00 +0100
Message-ID: <CA+chaQfU4WKnHqaPvJzOnuU0bxKKOBS-MkpyC__4miapHdAb0A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Fri, 18 Dec 2015 20:57:04 -0000
Content-Type: multipart/alternative; boundary=001a11c3b79473b69605273261b8

--001a11c3b79473b69605273261b8
Content-Type: text/plain; charset=UTF-8

Sorry I've meant that you (DISTRO) cannot select it with DEFAULTTUNE. I
shouldn't mention cortexm3 which was only confusing...

On Fri, Dec 18, 2015 at 9:50 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Dec 18, 2015 at 12:45 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> Machines should let the distro decide, not the other way around
> >
> > I agree, but that's IMHO argument for keeping thumb-less tunes available.
> >
> > MACHINEs should define what they can support and DISTRO decides what
> > features they want to use for given MACHINE(s).
> >
> > Dropping thumb-less tunes would indicate that MACHINE doesn't support arm
> > ISA, which isn't true for armv7ve (only cortexm3 is currently using
> that).
>
> Huh? Dropping thumb-less tunes doesn't have any impact on whether or
> not a MACHINE supports for ARM.
>
> > On Fri, Dec 18, 2015 at 9:29 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >>
> >> On Fri, Dec 18, 2015 at 12:13 PM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >> > I've meant that the DISTRO can enable thumb with ARM_INSTRUCTION_SET
> >> > while
> >> > still using DEFAULTTUNE without thumb as common denominator for some
> >> > group
> >> > of MACHINEs.
> >>
> >> That seems like inverting the normal priority. Machines should let the
> >> distro decide, not the other way around - so we should discourage that
> >> situation, not try to support it!
> >>
> >> > I'm not saying that it's common scenario and really has to be
> supported,
> >> > but
> >> > having thumb-less tunes in armv7ve like we have in armv7a is IMHO
> worth
> >> > it
> >> > at least for consistency sake between these 2.
> >>
> >> Yes, maybe. Consistency is a good argument. My own preference would be
> >> to remove the thumb-less tunes from armv7a too, but maybe that's too
> >> radical...
> >>
> >> > On Fri, Dec 18, 2015 at 9:08 PM, Andre McCurdy <armccurdy@gmail.com>
> >> > wrote:
> >> >>
> >> >> On Fri, Dec 18, 2015 at 5:13 AM, Martin Jansa <
> martin.jansa@gmail.com>
> >> >> wrote:
> >> >> > On Thu, Dec 17, 2015 at 07:13:55PM -0800, Andre McCurdy wrote:
> >> >> >> On Thu, Dec 10, 2015 at 5:48 AM, Martin Jansa
> >> >> >> <martin.jansa@gmail.com>
> >> >> >> wrote:
> >> >> >> > * be aware that this -march value is available only in gcc-4.9
> and
> >> >> >> >   newer:
> >> >> >> >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907
> >> >> >> > * -mcpu=cortex15 and -mcpu=cortexa7 conflict with -march=armv7a
> >> >> >> >   We either have to stop putting -march in default CCARGS or at
> >> >> >> >   least set it compatible one like this patch does.
> >> >> >>
> >> >> >> Can we drop the concept of armv7ve without Thumb support?
> >> >> >>
> >> >> >> Thumb was optional for armv4 but from armv5 onwards every ARM core
> >> >> >> has
> >> >> >> been able to support Thumb as well. Unfortunately the cpu tuning
> >> >> >> .inc
> >> >> >> files in oe-core for armv5 and above just seem to have copied any
> >> >> >> pasted from armv4 and so provide bogus non-thumb capable tuning
> >> >> >> options, which just add a lot of unnecessary complexity (the only
> >> >> >> real
> >> >> >> difference between them is that the thumb capable versions respect
> >> >> >> ARM_INSTRUCTION_SET and the non-thumb capable versions ignore it).
> >> >> >>
> >> >> >> To avoid breaking existing machine configs and package feeds, I
> >> >> >> guess
> >> >> >> we might be stuck with the existing AVAILTUNES for armv7a and
> below,
> >> >> >> but can we at least fix it for armv7ve ?
> >> >> >
> >> >> > Well even when the HW supports the thumb, some DISTROs tend to
> >> >> > disable
> >> >> > it for whatever reasons (e.g. you can use very low common
> denominator
> >> >> > DEFAULTTUNE for many MACHINEs - which cannot be controlled by
> >> >> > ARM_INSTRUCTION_SET only).
> >> >>
> >> >> Could you explain a little more about that? Can't ARM_INSTRUCTION_SET
> >> >> always be used to force ARM for cores which support both?
> >> >>
> >> >> > What harm do you see from keeping tunes without Thumb? Only the
> >> >> > maintenance of the tune file? That's not so bad because it's exact
> >> >> > copy
> >> >> > of arch-armv7a.inc with s/7a/7ve/g.
> >> >> >
> >> >> >> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> >> >> > ---
> >> >> >> >  meta/conf/machine/include/arm/arch-armv7ve.inc     | 141
> >> >> >> > +++++++++++++++++++++
> >> >> >> >  .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
> >> >> >> >  meta/conf/machine/include/tune-cortexa15.inc       |  52
> ++++----
> >> >> >> >  meta/conf/machine/include/tune-cortexa7.inc        |  52
> ++++----
> >> >> >> >  4 files changed, 194 insertions(+), 52 deletions(-)
> >> >> >> >  create mode 100644
> meta/conf/machine/include/arm/arch-armv7ve.inc
> >> >> >> >
> >> >> >> > diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> >> >> > b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> >> >> > new file mode 100644
> >> >> >> > index 0000000..79e1ef6
> >> >> >> > --- /dev/null
> >> >> >> > +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> >> >> >> > @@ -0,0 +1,141 @@
> >> >> >> > +DEFAULTTUNE ?= "armv7ve"
> >> >> >> > +
> >> >> >> > +TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
> >> >> >> > +TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
> >> >> >> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'armv7ve',
> >> >> >> > '
> >> >> >> > -march=armv7ve', '', d)}"
> >> >> >> > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
> >> >> >> > 'armv7ve', 'armv7ve:', '' ,d)}"
> >> >> >> > +
> >> >> >> > +require conf/machine/include/arm/arch-armv6.inc
> >> >> >> > +require conf/machine/include/arm/feature-arm-neon.inc
> >> >> >> > +
> >> >> >> > +# Little Endian base configs
> >> >> >> > +AVAILTUNES += "armv7ve armv7vet armv7ve-vfpv3d16
> >> >> >> > armv7vet-vfpv3d16
> >> >> >> > armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon armv7vet-neon
> >> >> >> > armv7ve-neon-vfpv4
> >> >> >> > armv7vet-neon-vfpv4"
> >> >> >> > +ARMPKGARCH_tune-armv7ve             ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vet            ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7ve-vfpv3d16    ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vet-vfpv3d16   ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7ve-vfpv3       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vet-vfpv3      ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7ve-neon        ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vet-neon       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7ve-neon-vfpv4  ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vet-neon-vfpv4 ?= "armv7ve"
> >> >> >> > +TUNE_FEATURES_tune-armv7ve             = "arm armv7ve vfp"
> >> >> >> > +TUNE_FEATURES_tune-armv7vet            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve} thumb"
> >> >> >> > +TUNE_FEATURES_tune-armv7ve-vfpv3d16    =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve}  vfpv3d16"
> >> >> >> > +TUNE_FEATURES_tune-armv7vet-vfpv3d16   =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet} vfpv3d16"
> >> >> >> > +TUNE_FEATURES_tune-armv7ve-vfpv3       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}  vfpv3"
> >> >> >> > +TUNE_FEATURES_tune-armv7vet-vfpv3      =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} vfpv3"
> >> >> >> > +TUNE_FEATURES_tune-armv7ve-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve}  neon"
> >> >> >> > +TUNE_FEATURES_tune-armv7vet-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet} neon"
> >> >> >> > +TUNE_FEATURES_tune-armv7ve-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}  vfpv4"
> >> >> >> > +TUNE_FEATURES_tune-armv7vet-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon} vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7ve armv7ve-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7ve armv7ve-vfp
> >> >> >> > armv7vet2-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16   =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfpv3d16
> >> >> >> > armv7vet2-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16}  armv7ve-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3      =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16} armv7ve-vfpv3
> >> >> >> > armv7vet2-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-neon
> armv7vet2-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  armv7ve-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} armv7ve-neon-vfpv4
> >> >> >> > armv7vet2-neon-vfpv4"
> >> >> >> > +
> >> >> >> > +# HF Tunes
> >> >> >> > +AVAILTUNES += "armv7vehf armv7vethf armv7vehf-vfpv3d16
> >> >> >> > armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3
> >> >> >> > armv7vehf-neon
> >> >> >> > armv7vethf-neon armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4"
> >> >> >> > +ARMPKGARCH_tune-armv7vehf             ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethf            ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehf-vfpv3d16    ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethf-vfpv3d16   ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehf-vfpv3       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethf-vfpv3      ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehf-neon        ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethf-neon       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehf-neon-vfpv4  ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethf-neon-vfpv4 ?= "armv7ve"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehf             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve}             callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethf            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet}            callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehf-vfpv3d16    =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethf-vfpv3d16   =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehf-vfpv3       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3}       callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethf-vfpv3      =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3}      callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehf-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethf-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  callconvention-hard"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} callconvention-hard"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7vehf-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7vehf-vfp
> >> >> >> > armv7vet2hf-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16   =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfpv3d16
> >> >> >> > armv7vet2hf-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16}
> armv7vehf-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3      =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16} armv7vehf-vfpv3
> >> >> >> > armv7vet2hf-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-neon
> >> >> >> > armv7vet2hf-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}
> armv7vehf-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon}
> armv7vehf-neon-vfpv4
> >> >> >> > armv7vet2hf-neon-vfpv4"
> >> >> >> > +
> >> >> >> > +# Big Endian
> >> >> >> > +AVAILTUNES += "armv7veb armv7vetb armv7veb-vfpv3d16
> >> >> >> > armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3 armv7veb-neon
> >> >> >> > armv7vetb-neon armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4"
> >> >> >> > +ARMPKGARCH_tune-armv7veb             ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vetb            ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7veb-vfpv3d16    ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vetb-vfpv3d16   ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7veb-vfpv3       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vetb-vfpv3      ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7veb-neon        ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vetb-neon       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7veb-neon-vfpv4  ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vetb-neon-vfpv4 ?= "armv7ve"
> >> >> >> > +TUNE_FEATURES_tune-armv7veb             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve}             bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vetb            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet}            bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7veb-vfpv3d16    =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vetb-vfpv3d16   =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7veb-vfpv3       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-vfpv3}       bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vetb-vfpv3      =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-vfpv3}      bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7veb-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vetb-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7veb-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vetb-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} bigendian"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7veb-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7veb-vfp
> armv7vet2b-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16   =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfpv3d16
> >> >> >> > armv7vet2b-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16}  armv7veb-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3      =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16} armv7veb-vfpv3
> >> >> >> > armv7vet2b-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-neon
> >> >> >> > armv7vet2b-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon}  armv7veb-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon} armv7veb-neon-vfpv4
> >> >> >> > armv7vet2b-neon-vfpv4"
> >> >> >> > +
> >> >> >> > +# Big Endian + HF
> >> >> >> > +AVAILTUNES += "armv7vehfb armv7vethfb armv7vehfb-vfpv3d16
> >> >> >> > armv7vethfb-vfpv3d16 armv7vehfb-vfpv3 armv7vethfb-vfpv3
> >> >> >> > armv7vehfb-neon
> >> >> >> > armv7vethfb-neon armv7vehfb-neon-vfpv4 armv7vethfb-neon-vfpv4"
> >> >> >> > +ARMPKGARCH_tune-armv7vehfb             ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethfb            ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehfb-vfpv3d16    ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethfb-vfpv3d16   ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehfb-vfpv3       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethfb-vfpv3      ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehfb-neon        ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethfb-neon       ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vehfb-neon-vfpv4  ?= "armv7ve"
> >> >> >> > +ARMPKGARCH_tune-armv7vethfb-neon-vfpv4 ?= "armv7ve"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehfb             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf}             bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethfb            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf}            bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehfb-vfpv3d16    =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-vfpv3d16}    bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethfb-vfpv3d16   =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-vfpv3d16}   bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehfb-vfpv3       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-vfpv3}       bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethfb-vfpv3      =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-vfpv3}      bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehfb-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon}        bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethfb-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon}       bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  bigendian"
> >> >> >> > +TUNE_FEATURES_tune-armv7vethfb-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} bigendian"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7vehfb-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7vehfb-vfp
> >> >> >> > armv7vet2hfb-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16   =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfpv3d16
> >> >> >> > armv7vet2hfb-vfpv3d16"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16}
> >> >> >> > armv7vehfb-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3      =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16}
> armv7vehfb-vfpv3
> >> >> >> > armv7vet2hfb-vfpv3"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-neon
> >> >> >> > armv7vet2hfb-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon}
> >> >> >> > armv7vehfb-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon}
> >> >> >> > armv7vehfb-neon-vfpv4
> >> >> >> > armv7vet2hfb-neon-vfpv4"
> >> >> >> > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> >> >> > b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> >> >> > index 5632171..54c0cee 100644
> >> >> >> > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> >> >> > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> >> >> >> > @@ -12,6 +12,7 @@ ARM_THUMB_SUFFIX .=
> >> >> >> > "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d
> >> >> >> >  ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
> >> >> >> > 'armv7a',
> >> >> >> > 't2', '', d)}"
> >> >> >> >  ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
> >> >> >> > 'armv7r',
> >> >> >> > 't2', '', d)}"
> >> >> >> >  ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
> >> >> >> > 'armv7m',
> >> >> >> > 't2', '', d)}"
> >> >> >> > +ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES',
> >> >> >> > 'armv7ve', 't2', '', d)}"
> >> >> >> >
> >> >> >> >  # If the device supports ARM, then respect ARM_THUMB_OPT (which
> >> >> >> > can
> >> >> >> > be "arm" or "thumb")
> >> >> >> >  # If the defice doesn't support ARM, then always set "thumb"
> even
> >> >> >> > when
> >> >> >> > diff --git a/meta/conf/machine/include/tune-cortexa15.inc
> >> >> >> > b/meta/conf/machine/include/tune-cortexa15.inc
> >> >> >> > index 8b34bb2..cfc8151 100644
> >> >> >> > --- a/meta/conf/machine/include/tune-cortexa15.inc
> >> >> >> > +++ b/meta/conf/machine/include/tune-cortexa15.inc
> >> >> >> > @@ -1,6 +1,6 @@
> >> >> >> > -DEFAULTTUNE ?= "armv7a-neon"
> >> >> >> > +DEFAULTTUNE ?= "armv7ve-neon"
> >> >> >> >
> >> >> >> > -require conf/machine/include/arm/arch-armv7a.inc
> >> >> >> > +require conf/machine/include/arm/arch-armv7ve.inc
> >> >> >> >
> >> >> >> >  TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor
> >> >> >> > optimizations"
> >> >> >> >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> >> >> >> > 'cortexa15', '
> >> >> >> > -mtune=cortex-a15', '', d)}"
> >> >> >> > @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa15-neon        =
> >> >> >> > "cortexa15"
> >> >> >> >  ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
> >> >> >> >  ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
> >> >> >> >  ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7a}             cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15t            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7at}            cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7a-neon}        cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15t-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7at-neon}       cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa15"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa15-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp
> >> >> >> > cortexa15t2-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp
> >> >> >> > cortexa15-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp
> >> >> >> > cortexa15-neon
> >> >> >> > cortexa15t2-vfp cortexa15t2-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa15-vfp
> >> >> >> > cortexa15-neon
> >> >> >> > cortexa15-neon-vfpv4"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa15-vfp
> >> >> >> > cortexa15-neon
> >> >> >> > cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon
> >> >> >> > cortexa15t2-neon-vfpv4"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve}             cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15t            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet}            cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15t-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa15"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa15-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp
> >> >> >> > cortexa15t2-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa15-vfp
> >> >> >> > cortexa15-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa15-vfp
> >> >> >> > cortexa15-neon
> >> >> >> > cortexa15t2-vfp cortexa15t2-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa15-vfp
> >> >> >> > cortexa15-neon cortexa15-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp
> >> >> >> > cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp
> >> >> >> > cortexa15t2-neon
> >> >> >> > cortexa15t2-neon-vfpv4"
> >> >> >> >
> >> >> >> >  # HF Tunes
> >> >> >> >  AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon
> >> >> >> > cortexa15thf-neon cortexa15hf-neon-vfpv4
> cortexa15thf-neon-vfpv4"
> >> >> >> > @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa15hf-neon        =
> >> >> >> > "cortexa15"
> >> >> >> >  ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
> >> >> >> >  ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
> >> >> >> >  ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15hf             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ahf}             cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15thf            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7athf}            cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15hf-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15thf-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa15"
> >> >> >> > -TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa15"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp
> >> >> >> > cortexa15t2hf-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon
> >> >> >> > cortexa15t2hf-vfp cortexa15t2hf-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}
> cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4}
> cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp
> >> >> >> > cortexa15t2hf-neon
> >> >> >> > cortexa15t2hf-neon-vfpv4"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15hf             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf}             cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15thf            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf}            cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15hf-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15thf-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa15"
> >> >> >> > +TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa15"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa15hf-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp
> >> >> >> > cortexa15t2hf-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}
> cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4}
> cortexa15hf-vfp
> >> >> >> > cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp
> >> >> >> > cortexa15t2hf-neon
> >> >> >> > cortexa15t2hf-neon-vfpv4"
> >> >> >> > diff --git a/meta/conf/machine/include/tune-cortexa7.inc
> >> >> >> > b/meta/conf/machine/include/tune-cortexa7.inc
> >> >> >> > index 4fea36f..84432bd 100644
> >> >> >> > --- a/meta/conf/machine/include/tune-cortexa7.inc
> >> >> >> > +++ b/meta/conf/machine/include/tune-cortexa7.inc
> >> >> >> > @@ -1,6 +1,6 @@
> >> >> >> > -DEFAULTTUNE ?= "armv7a-neon"
> >> >> >> > +DEFAULTTUNE ?= "armv7ve-neon"
> >> >> >> >
> >> >> >> > -require conf/machine/include/arm/arch-armv7a.inc
> >> >> >> > +require conf/machine/include/arm/arch-armv7ve.inc
> >> >> >> >
> >> >> >> >  TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor
> >> >> >> > optimizations"
> >> >> >> >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexa7',
> >> >> >> > '
> >> >> >> > -mtune=cortex-a7', '', d)}"
> >> >> >> > @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa7-neon        =
> >> >> >> > "cortexa7"
> >> >> >> >  ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
> >> >> >> >  ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
> >> >> >> >  ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7a}             cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7t            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7at}            cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7a-neon}        cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7t-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7at-neon}       cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa7"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa7-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp
> cortexa7t2-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp
> >> >> >> > cortexa7-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp
> >> >> >> > cortexa7-neon
> >> >> >> > cortexa7t2-vfp cortexa7t2-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa7-vfp
> >> >> >> > cortexa7-neon
> >> >> >> > cortexa7-neon-vfpv4"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa7-vfp
> >> >> >> > cortexa7-neon
> >> >> >> > cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon
> >> >> >> > cortexa7t2-neon-vfpv4"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve}             cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7t            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet}            cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7t-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa7"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa7-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp
> cortexa7t2-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa7-vfp
> >> >> >> > cortexa7-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa7-vfp
> >> >> >> > cortexa7-neon
> >> >> >> > cortexa7t2-vfp cortexa7t2-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa7-vfp
> >> >> >> > cortexa7-neon
> >> >> >> > cortexa7-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa7-vfp
> >> >> >> > cortexa7-neon
> >> >> >> > cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon
> >> >> >> > cortexa7t2-neon-vfpv4"
> >> >> >> >
> >> >> >> >  # HF Tunes
> >> >> >> >  AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon
> >> >> >> > cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
> >> >> >> > @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa7hf-neon        =
> >> >> >> > "cortexa7"
> >> >> >> >  ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
> >> >> >> >  ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
> >> >> >> >  ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7hf             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ahf}             cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7thf            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7athf}            cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7hf-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7thf-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa7"
> >> >> >> > -TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa7hf-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp
> >> >> >> > cortexa7t2hf-vfp"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon
> >> >> >> > cortexa7t2hf-vfp cortexa7t2hf-neon"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4"
> >> >> >> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp
> >> >> >> > cortexa7t2hf-neon
> >> >> >> > cortexa7t2hf-neon-vfpv4"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7hf             =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf}             cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7thf            =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf}            cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7hf-neon        =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7thf-neon       =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa7"
> >> >> >> > +TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =
> >> >> >> > "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa7"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa7hf-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp
> >> >> >> > cortexa7t2hf-vfp"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon
> >> >> >> > cortexa7t2hf-vfp cortexa7t2hf-neon"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}
> cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4"
> >> >> >> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =
> >> >> >> > "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4}
> cortexa7hf-vfp
> >> >> >> > cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp
> >> >> >> > cortexa7t2hf-neon
> >> >> >> > cortexa7t2hf-neon-vfpv4"
> >> >> >> > --
> >> >> >> > 2.6.3
> >> >> >> >
> >> >> >> > --
> >> >> >> > _______________________________________________
> >> >> >> > Openembedded-core mailing list
> >> >> >> > Openembedded-core@lists.openembedded.org
> >> >> >> >
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >> >
> >> >> > --
> >> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> >
> >> >
> >
> >
>

--001a11c3b79473b69605273261b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry I&#39;ve meant that you (DISTRO) cannot select =
it with DEFAULTTUNE. I shouldn&#39;t mention cortexm3 which was only confus=
ing...</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Fri, Dec 18, 2015 at 9:50 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fr=
i, Dec 18, 2015 at 12:45 PM, Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Machines should let the distro decide, not the other way around<br=
>
&gt;<br>
&gt; I agree, but that&#39;s IMHO argument for keeping thumb-less tunes ava=
ilable.<br>
&gt;<br>
&gt; MACHINEs should define what they can support and DISTRO decides what<b=
r>
&gt; features they want to use for given MACHINE(s).<br>
&gt;<br>
&gt; Dropping thumb-less tunes would indicate that MACHINE doesn&#39;t supp=
ort arm<br>
&gt; ISA, which isn&#39;t true for armv7ve (only cortexm3 is currently usin=
g that).<br>
<br>
</span>Huh? Dropping thumb-less tunes doesn&#39;t have any impact on whethe=
r or<br>
not a MACHINE supports for ARM.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; On Fri, Dec 18, 2015 at 9:29 PM, Andre McCurdy &lt;<a href=3D"mailto:a=
rmccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Dec 18, 2015 at 12:13 PM, Martin Jansa &lt;<a href=3D"mail=
to:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; I&#39;ve meant that the DISTRO can enable thumb with ARM_INST=
RUCTION_SET<br>
&gt;&gt; &gt; while<br>
&gt;&gt; &gt; still using DEFAULTTUNE without thumb as common denominator f=
or some<br>
&gt;&gt; &gt; group<br>
&gt;&gt; &gt; of MACHINEs.<br>
&gt;&gt;<br>
&gt;&gt; That seems like inverting the normal priority. Machines should let=
 the<br>
&gt;&gt; distro decide, not the other way around - so we should discourage =
that<br>
&gt;&gt; situation, not try to support it!<br>
&gt;&gt;<br>
&gt;&gt; &gt; I&#39;m not saying that it&#39;s common scenario and really h=
as to be supported,<br>
&gt;&gt; &gt; but<br>
&gt;&gt; &gt; having thumb-less tunes in armv7ve like we have in armv7a is =
IMHO worth<br>
&gt;&gt; &gt; it<br>
&gt;&gt; &gt; at least for consistency sake between these 2.<br>
&gt;&gt;<br>
&gt;&gt; Yes, maybe. Consistency is a good argument. My own preference woul=
d be<br>
&gt;&gt; to remove the thumb-less tunes from armv7a too, but maybe that&#39=
;s too<br>
&gt;&gt; radical...<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Fri, Dec 18, 2015 at 9:08 PM, Andre McCurdy &lt;<a href=3D=
"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt;<br>
&gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, Dec 18, 2015 at 5:13 AM, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; On Thu, Dec 17, 2015 at 07:13:55PM -0800, Andre McCu=
rdy wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; On Thu, Dec 10, 2015 at 5:48 AM, Martin Jansa<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:martin.jansa@gmail.com">ma=
rtin.jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; * be aware that this -march value is availa=
ble only in gcc-4.9 and<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0newer:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gcc.gnu.org/=
bugzilla/show_bug.cgi?id=3D57907" rel=3D"noreferrer" target=3D"_blank">http=
s://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57907</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; * -mcpu=3Dcortex15 and -mcpu=3Dcortexa7 con=
flict with -march=3Darmv7a<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0We either have to stop putting =
-march in default CCARGS or at<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0least set it compatible one lik=
e this patch does.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Can we drop the concept of armv7ve without Thumb=
 support?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Thumb was optional for armv4 but from armv5 onwa=
rds every ARM core<br>
&gt;&gt; &gt;&gt; &gt;&gt; has<br>
&gt;&gt; &gt;&gt; &gt;&gt; been able to support Thumb as well. Unfortunatel=
y the cpu tuning<br>
&gt;&gt; &gt;&gt; &gt;&gt; .inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; files in oe-core for armv5 and above just seem t=
o have copied any<br>
&gt;&gt; &gt;&gt; &gt;&gt; pasted from armv4 and so provide bogus non-thumb=
 capable tuning<br>
&gt;&gt; &gt;&gt; &gt;&gt; options, which just add a lot of unnecessary com=
plexity (the only<br>
&gt;&gt; &gt;&gt; &gt;&gt; real<br>
&gt;&gt; &gt;&gt; &gt;&gt; difference between them is that the thumb capabl=
e versions respect<br>
&gt;&gt; &gt;&gt; &gt;&gt; ARM_INSTRUCTION_SET and the non-thumb capable ve=
rsions ignore it).<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; To avoid breaking existing machine configs and p=
ackage feeds, I<br>
&gt;&gt; &gt;&gt; &gt;&gt; guess<br>
&gt;&gt; &gt;&gt; &gt;&gt; we might be stuck with the existing AVAILTUNES f=
or armv7a and below,<br>
&gt;&gt; &gt;&gt; &gt;&gt; but can we at least fix it for armv7ve ?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Well even when the HW supports the thumb, some DISTR=
Os tend to<br>
&gt;&gt; &gt;&gt; &gt; disable<br>
&gt;&gt; &gt;&gt; &gt; it for whatever reasons (e.g. you can use very low c=
ommon denominator<br>
&gt;&gt; &gt;&gt; &gt; DEFAULTTUNE for many MACHINEs - which cannot be cont=
rolled by<br>
&gt;&gt; &gt;&gt; &gt; ARM_INSTRUCTION_SET only).<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Could you explain a little more about that? Can&#39;t ARM=
_INSTRUCTION_SET<br>
&gt;&gt; &gt;&gt; always be used to force ARM for cores which support both?=
<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; What harm do you see from keeping tunes without Thum=
b? Only the<br>
&gt;&gt; &gt;&gt; &gt; maintenance of the tune file? That&#39;s not so bad =
because it&#39;s exact<br>
&gt;&gt; &gt;&gt; &gt; copy<br>
&gt;&gt; &gt;&gt; &gt; of arch-armv7a.inc with s/7a/7ve/g.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"=
mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-ar=
mv7ve.inc=C2=A0 =C2=A0 =C2=A0| 141<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++++++++++++++++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 .../conf/machine/include/arm/feature-=
arm-thumb.inc |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortex=
a15.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 52 ++++----<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortex=
a7.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 52 ++++----<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 4 files changed, 194 insertions(+), 5=
2 deletions(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/conf/machine/=
include/arm/arch-armv7ve.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/conf/machine/include/arm/=
arch-armv7ve.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; b/meta/conf/machine/include/arm/arch-armv7v=
e.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; index 0000000..79e1ef6<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/conf/machine/include/arm/arch-ar=
mv7ve.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -0,0 +1,141 @@<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +DEFAULTTUNE ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNEVALID[armv7ve] =3D &quot;Enable instru=
ctions for ARMv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNECONFLICTS[armv7ve] =3D &quot;armv4 arm=
v5 armv6 armv7 armv7a&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contain=
s(&#39;TUNE_FEATURES&#39;, &#39;armv7ve&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -march=3Darmv7ve&#39;, &#39;&#39;, d)}&quot=
;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +MACHINEOVERRIDES =3D. &quot;${@bb.utils.co=
ntains(&#39;TUNE_FEATURES&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;armv7ve&#39;, &#39;armv7ve:&#39;, &#39=
;&#39; ,d)}&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +require conf/machine/include/arm/arch-armv=
6.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +require conf/machine/include/arm/feature-a=
rm-neon.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +# Little Endian base configs<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +AVAILTUNES +=3D &quot;armv7ve armv7vet arm=
v7ve-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon a=
rmv7vet-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7ve-neon-vfpv4<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7ve=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vet=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7ve-vfpv3d16=C2=A0 =C2=
=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vet-vfpv3d16=C2=A0 =
=C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7ve-vfpv3=C2=A0 =C2=A0=
 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vet-vfpv3=C2=A0 =C2=
=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7ve-neon=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vet-neon=C2=A0 =C2=A0=
 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7ve-neon-vfpv4=C2=A0 ?=
=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vet-neon-vfpv4 ?=3D &=
quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7ve=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7ve vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vet=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve} thumb&q=
uot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7ve-vfpv3d16=C2=A0 =
=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve}=C2=A0 v=
fpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vet-vfpv3d16=C2=A0=
 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet} vfpv3d=
16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7ve-vfpv3=C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-vfpv3d16=
}=C2=A0 vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vet-vfpv3=C2=A0 =
=C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-vfpv3d1=
6} vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7ve-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve}=C2=A0 n=
eon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vet-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet} neon&q=
uot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7ve-neon-vfpv4=C2=
=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon}=C2=
=A0 vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vet-neon-vfpv4 =3D=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon} v=
fpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7ve=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6}=C2=
=A0 armv7ve armv7ve-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vet=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6t} ar=
mv7ve armv7ve-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16=
=C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve}=
=C2=A0 armv7ve-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16=
=C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet} =
armv7ve-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vf=
pv3d16}=C2=A0 armv7ve-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3=C2=
=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet-v=
fpv3d16} armv7ve-vfpv3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve}=
=C2=A0 armv7ve-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet} =
armv7ve-neon armv7vet2-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv=
4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve-ne=
on}=C2=A0 armv7ve-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfp=
v4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet-n=
eon} armv7ve-neon-vfpv4<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +# HF Tunes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +AVAILTUNES +=3D &quot;armv7vehf armv7vethf=
 armv7vehf-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7ve=
thf-vfpv3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vehf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vethf-neon armv7vehf-neon-vfpv4 armv7v=
ethf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehf-vfpv3d16=C2=A0 =
=C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethf-vfpv3d16=C2=A0 =
=C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehf-vfpv3=C2=A0 =C2=
=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethf-vfpv3=C2=A0 =C2=
=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehf-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethf-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehf-neon-vfpv4=C2=A0=
 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethf-neon-vfpv4 ?=3D=
 &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehf-vfpv3d16=C2=
=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-vfpv3d16=
}=C2=A0 =C2=A0 callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethf-vfpv3d16=C2=
=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-vfpv3d1=
6}=C2=A0 =C2=A0callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehf-vfpv3=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-vfpv3}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethf-vfpv3=C2=A0 =
=C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-vfpv3}=
=C2=A0 =C2=A0 =C2=A0 callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehf-neon-vfpv4=C2=
=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon-vfp=
v4}=C2=A0 callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon-vf=
pv4} callconvention-hard&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehf=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6hf}=
=C2=A0 armv7vehf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethf=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6thf} =
armv7vehf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d1=
6=C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}=
=C2=A0 armv7vehf-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d=
16=C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
} armv7vehf-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hf-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-=
vfpv3d16}=C2=A0 armv7vehf-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3=
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
-vfpv3d16} armv7vehf-vfpv3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hf-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}=
=C2=A0 armv7vehf-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
} armv7vehf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hf-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vf=
pv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-=
neon}=C2=A0 armv7vehf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-v=
fpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
-neon} armv7vehf-neon-vfpv4<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +# Big Endian<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +AVAILTUNES +=3D &quot;armv7veb armv7vetb a=
rmv7veb-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb=
-vfpv3 armv7veb-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vetb-neon armv7veb-neon-vfpv4 armv7vet=
b-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7veb=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vetb=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7veb-vfpv3d16=C2=A0 =
=C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vetb-vfpv3d16=C2=A0 =
=C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7veb-vfpv3=C2=A0 =C2=
=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vetb-vfpv3=C2=A0 =C2=
=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7veb-neon=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vetb-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7veb-neon-vfpv4=C2=A0 =
?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vetb-neon-vfpv4 ?=3D =
&quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7veb=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vetb=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7veb-vfpv3d16=C2=A0=
 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-vfpv3d16=
}=C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vetb-vfpv3d16=C2=
=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-vfpv3d1=
6}=C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7veb-vfpv3=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-vfpv3}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vetb-vfpv3=C2=A0 =
=C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-vfpv3}=
=C2=A0 =C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7veb-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vetb-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7veb-neon-vfpv4=C2=
=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon-vfp=
v4}=C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vetb-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon-vf=
pv4} bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7veb=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6b}=C2=
=A0 armv7veb-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vetb=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6tb} a=
rmv7veb-vfp armv7vet2b-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16=
=C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7veb}=
=C2=A0 armv7veb-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d1=
6=C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vetb}=
 armv7veb-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2b-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7veb-v=
fpv3d16}=C2=A0 armv7veb-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3=
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-=
vfpv3d16} armv7veb-vfpv3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2b-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7veb}=
=C2=A0 armv7veb-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vetb}=
 armv7veb-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2b-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfp=
v4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7veb-n=
eon}=C2=A0 armv7veb-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon-vf=
pv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-=
neon} armv7veb-neon-vfpv4<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2b-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +# Big Endian + HF<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +AVAILTUNES +=3D &quot;armv7vehfb armv7veth=
fb armv7vehfb-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vethfb-vfpv3d16 armv7vehfb-vfpv3 armv7=
vethfb-vfpv3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vehfb-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vethfb-neon armv7vehfb-neon-vfpv4 armv=
7vethfb-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehfb=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethfb=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehfb-vfpv3d16=C2=A0 =
=C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethfb-vfpv3d16=C2=A0=
 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehfb-vfpv3=C2=A0 =C2=
=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethfb-vfpv3=C2=A0 =
=C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehfb-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethfb-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vehfb-neon-vfpv4=C2=
=A0 ?=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARMPKGARCH_tune-armv7vethfb-neon-vfpv4 ?=
=3D &quot;armv7ve&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehfb=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethfb=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehfb-vfpv3d16=C2=
=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-vfpv3d=
16}=C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethfb-vfpv3d16=C2=
=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-vfpv3=
d16}=C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehfb-vfpv3=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-vfpv3}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethfb-vfpv3=C2=A0=
 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-vfpv3=
}=C2=A0 =C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehfb-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethfb-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4=
=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-neon-v=
fpv4}=C2=A0 bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-armv7vethfb-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-neon-=
vfpv4} bigendian&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}=
=C2=A0 armv7vehfb-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv6thfb}=
 armv7vehfb-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hfb-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d=
16=C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb=
}=C2=A0 armv7vehfb-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3=
d16=C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
b} armv7vehfb-vfpv3d16<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hfb-vfpv3d16&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb=
-vfpv3d16}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vehfb-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3=
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
b-vfpv3d16} armv7vehfb-vfpv3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hfb-vfpv3&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb=
}=C2=A0 armv7vehfb-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
b} armv7vehfb-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hfb-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-v=
fpv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb=
-neon}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vehfb-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon-=
vfpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
b-neon}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vehfb-neon-vfpv4<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; armv7vet2hfb-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/conf/machine/include/arm/=
feature-arm-thumb.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; b/meta/conf/machine/include/arm/feature-arm=
-thumb.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; index 5632171..54c0cee 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --- a/meta/conf/machine/include/arm/feature=
-arm-thumb.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/conf/machine/include/arm/feature=
-arm-thumb.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -12,6 +12,7 @@ ARM_THUMB_SUFFIX .=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${@bb.utils.contains(&#39;TUNE_FEATUR=
ES&#39;, &#39;armv6&#39;,=C2=A0 &#39;t&#39;,=C2=A0 &#39;&#39;, d<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARM_THUMB_SUFFIX .=3D &quot;${@bb.uti=
ls.contains(&#39;TUNE_FEATURES&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;armv7a&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;t2&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARM_THUMB_SUFFIX .=3D &quot;${@bb.uti=
ls.contains(&#39;TUNE_FEATURES&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;armv7r&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;t2&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARM_THUMB_SUFFIX .=3D &quot;${@bb.uti=
ls.contains(&#39;TUNE_FEATURES&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;armv7m&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;t2&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +ARM_THUMB_SUFFIX .=3D &quot;${@bb.utils.co=
ntains(&#39;TUNE_FEATURES&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;armv7ve&#39;, &#39;t2&#39;, &#39;&#39;=
, d)}&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 # If the device supports ARM, then re=
spect ARM_THUMB_OPT (which<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; can<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; be &quot;arm&quot; or &quot;thumb&quot;)<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 # If the defice doesn&#39;t support A=
RM, then always set &quot;thumb&quot; even<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; when<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/conf/machine/include/tune=
-cortexa15.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; b/meta/conf/machine/include/tune-cortexa15.=
inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; index 8b34bb2..cfc8151 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --- a/meta/conf/machine/include/tune-cortex=
a15.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/conf/machine/include/tune-cortex=
a15.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -require conf/machine/include/arm/arch-armv=
7a.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +require conf/machine/include/arm/arch-armv=
7ve.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 TUNEVALID[cortexa15] =3D &quot;Enable=
 Cortex-A15 specific processor<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; optimizations&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 TUNE_CCARGS .=3D &quot;${@bb.utils.co=
ntains(&#39;TUNE_FEATURES&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;cortexa15&#39;, &#39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -mtune=3Dcortex-a15&#39;, &#39;&#39;, d)}&q=
uot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa=
15-neon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa15t-neon=C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa15-neon-vfpv4=
=C2=A0 =3D &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa15t-neon-vfpv4=
 =3D &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7a}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15t=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7at}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7a-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15t-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7at-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15-neon-vfpv4=C2=
=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7a-neon-vfpv=
4}=C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7at-neon-vfp=
v4} cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a}=C2=
=A0 cortexa15-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15t=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at} c=
ortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a-neo=
n}=C2=A0 cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at-ne=
on} cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2-vfp cortexa15t2-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vf=
pv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a-neo=
n-vfpv4}=C2=A0 cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-v=
fpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at-ne=
on-vfpv4} cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon-vfpv4 cortexa15t2-vfp cortex=
a15t2-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15t=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15t-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15-neon-vfpv4=C2=
=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon-vfp=
v4}=C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon-vf=
pv4} cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve}=
=C2=A0 cortexa15-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15t=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet} =
cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve-ne=
on}=C2=A0 cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet-n=
eon} cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2-vfp cortexa15t2-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vf=
pv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve-ne=
on-vfpv4}=C2=A0 cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon cortexa15-neon-vfpv4&quot;<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-v=
fpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet-n=
eon-vfpv4} cortexa15-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15-neon cortexa15-neon-vfpv4 cortexa=
15t2-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 # HF Tunes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 AVAILTUNES +=3D &quot;cortexa15hf cor=
texa15thf cortexa15hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15thf-neon cortexa15hf-neon-vfpv4 co=
rtexa15thf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa=
15hf-neon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa15thf-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa15hf-neon-vfpv=
4=C2=A0 =3D &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa15thf-neon-vfp=
v4 =3D &quot;cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15hf=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ahf}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15thf=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7athf}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15hf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ahf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15thf-neon=C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7athf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4=
=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ahf-neon-vf=
pv4}=C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4=
 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7athf-neon-v=
fpv4} cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}=
=C2=A0 cortexa15hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf}=
 cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-n=
eon}=C2=A0 cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf-=
neon} cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2hf-vfp cortexa15t2hf-neon&quot;<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-=
vfpv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-n=
eon-vfpv4}=C2=A0 cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon cortexa15hf-neon-vfpv4&quo=
t;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon=
-vfpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf-=
neon-vfpv4} cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon cortexa15hf-neon-vfpv4 cor=
texa15t2hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2hf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15hf=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15thf=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15hf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15thf-neon=C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4=
=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-neon-v=
fpv4}=C2=A0 cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4=
 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-neon-=
vfpv4} cortexa15&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}=
=C2=A0 cortexa15hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
} cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-=
neon}=C2=A0 cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
-neon} cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon cortexa15t2hf-vfp cortexa1=
5t2hf-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-=
vfpv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-=
neon-vfpv4}=C2=A0 cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon cortexa15hf-neon-vfpv4&quo=
t;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon=
-vfpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
-neon-vfpv4} cortexa15hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15hf-neon cortexa15hf-neon-vfpv4 cor=
texa15t2hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa15t2hf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/conf/machine/include/tune=
-cortexa7.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; b/meta/conf/machine/include/tune-cortexa7.i=
nc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; index 4fea36f..84432bd 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --- a/meta/conf/machine/include/tune-cortex=
a7.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/conf/machine/include/tune-cortex=
a7.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -require conf/machine/include/arm/arch-armv=
7a.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +require conf/machine/include/arm/arch-armv=
7ve.inc<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 TUNEVALID[cortexa7] =3D &quot;Enable =
Cortex-A7 specific processor<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; optimizations&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 TUNE_CCARGS .=3D &quot;${@bb.utils.co=
ntains(&#39;TUNE_FEATURES&#39;, &#39;cortexa7&#39;,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &#39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -mtune=3Dcortex-a7&#39;, &#39;&#39;, d)}&qu=
ot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa=
7-neon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa7t-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa7-neon-vfpv4=
=C2=A0 =3D &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa7t-neon-vfpv4 =
=3D &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7a}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7at}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7a-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7t-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7at-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7-neon-vfpv4=C2=
=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7a-neon-vfpv=
4}=C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7at-neon-vfp=
v4} cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a}=C2=
=A0 cortexa7-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7t=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at} c=
ortexa7-vfp cortexa7t2-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a-neo=
n}=C2=A0 cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at-ne=
on} cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2-vfp cortexa7t2-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfp=
v4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7a-neo=
n-vfpv4}=C2=A0 cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vf=
pv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7at-ne=
on-vfpv4} cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7=
t2-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7-neon=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7t-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7-neon-vfpv4=C2=
=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ve-neon-vfp=
v4}=C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vet-neon-vf=
pv4} cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve}=
=C2=A0 cortexa7-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7t=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet} =
cortexa7-vfp cortexa7t2-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve-ne=
on}=C2=A0 cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet-n=
eon} cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2-vfp cortexa7t2-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfp=
v4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ve-ne=
on-vfpv4}=C2=A0 cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vf=
pv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vet-n=
eon-vfpv4} cortexa7-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7=
t2-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 # HF Tunes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 AVAILTUNES +=3D &quot;cortexa7hf cort=
exa7thf cortexa7hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7thf-neon cortexa7hf-neon-vfpv4 cort=
exa7thf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa=
7hf-neon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa7thf-neon=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa7hf-neon-vfpv4=
=C2=A0 =3D &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ARMPKGARCH_tune-cortexa7thf-neon-vfpv=
4 =3D &quot;cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7hf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ahf}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7thf=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7athf}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7hf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ahf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7thf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7athf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4=
=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7ahf-neon-vf=
pv4}=C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7athf-neon-v=
fpv4} cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}=
=C2=A0 cortexa7hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf}=
 cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-n=
eon}=C2=A0 cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf-=
neon} cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-vfp cortexa7t2hf-neon&quot;<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-v=
fpv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-n=
eon-vfpv4}=C2=A0 cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon cortexa7hf-neon-vfpv4&quot;=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-=
vfpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7athf-=
neon-vfpv4} cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon cortexa7hf-neon-vfpv4 corte=
xa7t2hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7hf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7thf=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7hf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7thf-neon=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-neon}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4=
=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vehf-neon-v=
fpv4}=C2=A0 cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =
=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${TUNE_FEATURES_tune-armv7vethf-neon-=
vfpv4} cortexa7&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}=
=C2=A0 cortexa7hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
} cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-vfp&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-=
neon}=C2=A0 cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
-neon} cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-vfp cortexa7t2hf-neon&quot;<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-v=
fpv4=C2=A0 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-=
neon-vfpv4}=C2=A0 cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon cortexa7hf-neon-vfpv4&quot;=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-=
vfpv4 =3D<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; &quot;${PACKAGE_EXTRA_ARCHS_tune-armv7vethf=
-neon-vfpv4} cortexa7hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7hf-neon cortexa7hf-neon-vfpv4 corte=
xa7t2hf-vfp<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-neon<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; cortexa7t2hf-neon-vfpv4&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; 2.6.3<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; ___________________________________________=
____<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.o=
penembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/ma=
ilman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http=
://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabbe=
r: <a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a11c3b79473b69605273261b8--
