Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id A44FC770C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 06:36:02 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id e18-v6so474443wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 23:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JNrGeIRIPhHg9DLF5Asa9EertFvJRLWM9Xc3wFvRKYc=;
	b=IRlRsu4Ba64CqSMjaJnK3YKr8wI5u2XbFQ+ScT1hNWvWOqFhrrvvIzHuodZFZK0YUq
	Cr2LWK77HmPxKSETAOXRgRVqOnO0G4Jm2TgMD7cqvqmwekqXxTjfxZ50Jvd6re+t+Ri5
	NxAevEWOSdh3ICW7qARCaYUmj2Ak6HvLpZJeZFBpsOc5Z79QIpawbmPVkMasoMy7eRS+
	XdSrhQe2GwHzQ/ojzuT1BhQGVAev6Pu7ggvfr/rtIrj0k2Wo3r2iVri6y/4PWm5NLO1+
	z63mO6g/NPQq1nfhp7B9zM32532hfQ/d4Z42k8OtzlbWgtEv1jR26hA9EpQY5Ok1gSTk
	OsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JNrGeIRIPhHg9DLF5Asa9EertFvJRLWM9Xc3wFvRKYc=;
	b=ggt6N7f+sKVs6E5tnSmLYzFYm5o0QCIGeBD6kby1TgglN5wmBr8KeR4qaC1UPgGUY2
	l8tR3NfoTRdyGGkq1tZ4Za3KNNqpPdHcnU/u4Ymqhqy01qNEwh07b8rBeDnwpAVF4Hqn
	NJFYv9m4w7QppFwpQvbzyIpiEop+h9rWGZEnIRe3uUH43pWekcI+GFi6tCNH8cKBa/0Z
	xk/d2vDYQ+u2jGnB37Qa9XHffvmLjhZB+86hEkbNUiuNgg8szo4IMTO4fZ/5H7HsCzKG
	Qta96Ecjl7OSjWBLDfkisLGvHCm11dIrLhjTdvXBUIswV1DCACW4fuAyPk05Ykiscd4Z
	7Ocw==
X-Gm-Message-State: APt69E2kGFSa3clWMG6tHTD2afjP4hutE0wZe3gKq+vjnqiet8QCFGNJ
	VEOw4nf79gW8oRkmSF/0lLw=
X-Google-Smtp-Source: ADUXVKKYsva/D2f8MFY6L29Usi3VrT6QE2Fboc0XM18+yYVIfBE8ptWt+W5LBwUpKTPmKiQC4Bqnhg==
X-Received: by 2002:adf:a292:: with SMTP id
	s18-v6mr487824wra.114.1528353363198; 
	Wed, 06 Jun 2018 23:36:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e188-v6sm3749421wmf.21.2018.06.06.23.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Jun 2018 23:36:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jun 2018 08:36:06 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180607063606.GC1353@jama>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<635c8757bf852c8a4248009f241c19146431cacd.1528320772.git.raj.khem@gmail.com>
	<CAJ86T=U5WPudMu_VBL_Y00DQrOjRb91=x+6+21V0ZQKhCQ7ThA@mail.gmail.com>
	<CAMKF1so4AMMhXS4VRNV2CPjvPRbzkPWEW3f=iTNio2jNC1Fgxw@mail.gmail.com>
	<CAJ86T=VCqqt_7OXT__NLtH_uayoSX_rFS=vXEyOZY3BQz3+FKQ@mail.gmail.com>
	<5c57a121-c4cd-e548-cd26-182076deb917@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5c57a121-c4cd-e548-cd26-182076deb917@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] tune/arm: Set -mtune instead of -mcpu
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
X-List-Received-Date: Thu, 07 Jun 2018 06:36:03 -0000
X-Groupsio-MsgNum: 112286
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline

--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 10:58:19PM -0700, Khem Raj wrote:
>=20
>=20
> On 6/6/18 4:42 PM, Andre McCurdy wrote:
> > On Wed, Jun 6, 2018 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Wed, Jun 6, 2018 at 3:15 PM, Andre McCurdy <armccurdy@gmail.com> wr=
ote:
> >>> On Wed, Jun 6, 2018 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>> -march option is already used to select the base architecture
> >>>> therefore using -mcpu which infact will reset march+mtune can
> >>>> cause conflicts,
> >>>
> >>> I think we need to at least understand how and why these conflicts
> >>> have started to occur with gcc 8. The tuning files themselves don't
> >>> contain any conflicts so the conflict must be coming from somewhere
> >>> else. Do we know where?
> >>
> >> I explained it in previous emails as well, mcpu is a combination of ma=
rch+mtune
> >> how it reduces to these values depends on mcpu value. e.g. setting
> >> mcpu=3Dcortex-a7
> >> would mean setting march=3Darmv7ve and mtune to cortex-a7 internally
> >> along with using code generator to use instructions available for that
> >> cpu, thats why it errors out since it does not know which march to
> >> use.
> >> when we override one of these values on cmdline which we do then this =
can cause
> >> the errors, these errors were happening before too see valgrind patch
> >> its that gcc8 is catching more cases.
> >=20
> > The -mcpu, -march and -mtune options are not new and gcc 6 and 7 catch
> > the same conflicts. It doesn't make sense that gcc8 is just catching
> > more issues.
>=20
> It does make sense. the option parsing for these specific options on arm=
=20
> have been revamped after gcc7, see
>=20
> https://github.com/kraj/gcc/compare/a99ae290af49793cd3db7a74f3dbc59e64d35=
6a1...68b54adbd7b10c66d968d74b96fba552bd46ebb7
>=20
> >=20
> > The valgrind case is not a good example. The conflict there comes
> > because we leak CFLAGS intended for the target into Makefiles which
> > valgrind uses to build test apps which are intended to only run under
> > valgrind (ie NOT directly on the target). The real fix there would be
> > to prevent the target specific flags being passed to build for those
> > few valgrind test apps.
> >=20
>=20
> it is manifesting similar conflicts
>=20
> >> example is gcc-runtime/libstdc++ which deducts arch flags based on
> >> configure options
> >> and we do not pass narrow mcpu option to it since we build SDKs which
> >> do not target
> >> just one particular sub-family of cpu but rather a sub arch
> >> do not pass --with-cpu then it enforces some lowest common
> >> denominator. When we say -mcpu then we
> >> are actually asking the code to be generated for that particular CPU.
> >=20
> > If we are trying to build something which is reusable across multiple
> > machines with the same architecture then it's a bug to be passing
> > machine specific CFLAGS. Making the machine specific CFLAGS more
> > generic is not the right solution.
>=20
> being reusable is a side-effect and a good one. Real problem is we are=20
> not matching to what we say in package arches, Probably you are=20
> confusing tunes to be meant for static code generation for a given CPU.=
=20
> I am interested to hear more ideas to what would be right solution if=20
> this is not it.

I don't agree with this part, you're basically reverting the change from:
http://git.openembedded.org/openembedded-core/commit/?id=3Df7bb2d4cf18ca8d2=
a90b4b3b5c6c48dad106ca28
but since:
http://git.openembedded.org/openembedded-core/commit/?id=3Dcffda9a821a3b83a=
8529d643c567859e091c6846
we already have different ARMPKGARCH for each DEFAULT_TUNE with
different -mcpu option.

If you want to target more generic configuration than you should use
more generic DEFAULT_TUNE and even the default configuration will select
something generic, e.g.:
http://git.openembedded.org/openembedded-core/tree/meta/conf/machine/includ=
e/tune-cortexa8.inc
sets
DEFAULTTUNE ?=3D "armv7athf-neon"
so no -mcpu options unless you explicitly ask for it by selecting
more specific DEFAULT_TUNE in DISTRO config.

> > Anyway, I suspect the real issue here is that when we build gcc to run
> > on the target we currently configure using "--with-arch=3Darmv7-a" for
> > both armv7a and armv7ve. It was done that way deliberately to try to
> > avoid rebuilds when switching between armv7a and armv7ve machines,
> > although thinking about that now I'm not sure it makes so much sense.
> > Does your original problem go away if you simply change:
> >=20
> >    EXTRA_OECONF_append_armv7ve =3D " --with-arch=3Darmv7-a"
> >=20
> > to
> >=20
> >    EXTRA_OECONF_append_armv7ve =3D " --with-arch=3Darmv7ve"
> >=20
> > in gcc-target.inc ?
>=20
> No, this is not the problem I am talking about gcc-runtime which is=20
> configured during cross build but built for target later on.
>=20
> talking about this case, changing --with-arch will make on device gcc=20
> complain about mismatches with default runtime since it is meant to use=
=20
> same runtime that will be built above.  Using armv7-a here is a=20
> conscious choice.

I've already tried this as well, because that's what I was doing long
time ago with the tune files:
http://git.openembedded.org/openembedded-core/commit/meta/conf/machine/incl=
ude?id=3D35392025f3236f5e5393f9cf0857732da9a2e503

but it's true that gcc-runtime is a bit more complicated by that, it
doesn't use gcc-target.inc (gcc-target.inc is only used by gcc itself),
so I've tried to move the --with-arch options a bit lower to
gcc-configure-common.inc where we already set the archs for MIPS, but it
didn't work well, at least as done in:
https://pastebin.com/3Cc5MYBa

and then I've moved to something else and never finished this one.

>=20
> >=20
> >>>
> >>> This patch is potentially going to hide bugs in cases where components
> >>> try to provide their own CPU specific flags rather than fully
> >>> respecting the flags set by OE. Generally we want to make those cases
> >>> fail so that we can debug and fix them.
> >>>
> >>
> >> No it wont. they can still do that. Last option wins so nothing change=
s there.
> >=20
> > The thing that changes is that after your patch, gcc will no longer
> > report a conflict!
> >=20
> >> and in many cases it should be able to override specific flags for
> >> specific packages
> >> OE is a fall back for general default case.
> >>
> >> A good change this does is that code is targeted for bigger base arch
> >> e.g. armv7-a
> >> and not for cortex-a8 but its tuned to run better on cortex-a8 when we
> >> use -mtune
> >> it will still run on other armv7-a based CPUs, so right now when we
> >> say our package
> >> arch is arm7ve but then use -mcpu=3Dcortex-a7 we are actually doing wr=
ong thing
> >> this should have meant package arch to be cortex-a7 as well. Now this
> >> will be more
> >> inline as well.
> >>
> >>
> >>>> therefore setting just mtune here will ensure
> >>>> that the code is optimized for the given tune as is the intention
> >>>> of mcpu, however with one advantage, it will be targetting broader
> >>>> march value so can be useful for pre-compiled objects where they
> >>>> can be run on wider subset
> >>>>
> >>>> This also fixed occasional conflicts like
> >>>>
> >>>> cc1: error: switch -mcpu=3Dcortex-a7 conflicts with -march=3Darmv7-a=
 switch [-Werror]
> >>>>
> >>>> which is possible combination in some case for packages in OE
> >>>>
> >>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>>> ---
> >>>>   meta/conf/machine/include/tune-arm1136jf-s.inc   | 2 +-
> >>>>   meta/conf/machine/include/tune-arm920t.inc       | 2 +-
> >>>>   meta/conf/machine/include/tune-arm926ejs.inc     | 2 +-
> >>>>   meta/conf/machine/include/tune-arm9tdmi.inc      | 2 +-
> >>>>   meta/conf/machine/include/tune-cortexa15.inc     | 2 +-
> >>>>   meta/conf/machine/include/tune-cortexa17.inc     | 2 +-
> >>>>   meta/conf/machine/include/tune-cortexa5.inc      | 2 +-
> >>>>   meta/conf/machine/include/tune-cortexa7.inc      | 2 +-
> >>>>   meta/conf/machine/include/tune-cortexa8.inc      | 2 +-
> >>>>   meta/conf/machine/include/tune-cortexa9.inc      | 2 +-
> >>>>   meta/conf/machine/include/tune-ep9312.inc        | 2 +-
> >>>>   meta/conf/machine/include/tune-iwmmxt.inc        | 2 +-
> >>>>   meta/conf/machine/include/tune-strongarm1100.inc | 2 +-
> >>>>   meta/conf/machine/include/tune-thunderx.inc      | 2 +-
> >>>>   meta/conf/machine/include/tune-xscale.inc        | 2 +-
> >>>>   15 files changed, 15 insertions(+), 15 deletions(-)
> >>>>
> >>>> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/c=
onf/machine/include/tune-arm1136jf-s.inc
> >>>> index c5de63e1cc..02114284e0 100644
> >>>> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
> >>>> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv6hf"
> >>>>   require conf/machine/include/arm/arch-armv6.inc
> >>>>
> >>>>   TUNEVALID[arm1136jfs] =3D "Enable arm1136jfs specific processor op=
timizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs=
', ' -mcpu=3Darm1136jf-s', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs=
', ' -mtune=3Darm1136jf-s', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "arm1136jfs"
> >>>>   ARMPKGARCH_tune-arm1136jfs =3D "arm1136jfs"
> >>>> diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/=
machine/include/tune-arm920t.inc
> >>>> index c6e74b6772..5e6d4cbd91 100644
> >>>> --- a/meta/conf/machine/include/tune-arm920t.inc
> >>>> +++ b/meta/conf/machine/include/tune-arm920t.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv4t"
> >>>>   require conf/machine/include/arm/arch-armv4.inc
> >>>>
> >>>>   TUNEVALID[arm920t] =3D "Enable arm920t specific processor optimiza=
tions"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', =
' -mcpu=3Darm920t', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', =
' -mtune=3Darm920t', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "arm920t"
> >>>>   ARMPKGARCH_tune-arm920t =3D "arm920t"
> >>>> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/con=
f/machine/include/tune-arm926ejs.inc
> >>>> index 81bcda339b..dddccaaae9 100644
> >>>> --- a/meta/conf/machine/include/tune-arm926ejs.inc
> >>>> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv5te"
> >>>>   require conf/machine/include/arm/arch-armv5-dsp.inc
> >>>>
> >>>>   TUNEVALID[arm926ejs] =3D "Enable arm926ejs specific processor opti=
mizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs'=
, ' -mcpu=3Darm926ej-s', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs'=
, ' -mtune=3Darm926ej-s', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "arm926ejs"
> >>>>   ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
> >>>> diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf=
/machine/include/tune-arm9tdmi.inc
> >>>> index e9c2b8fcf5..ebac472c5b 100644
> >>>> --- a/meta/conf/machine/include/tune-arm9tdmi.inc
> >>>> +++ b/meta/conf/machine/include/tune-arm9tdmi.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv4t"
> >>>>   require conf/machine/include/arm/arch-armv4.inc
> >>>>
> >>>>   TUNEVALID[arm9tdmi] =3D "Enable arm9tdmi specific processor optimi=
zations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi',=
 ' -mcpu=3Darm9tdmi', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi',=
 ' -mtune=3Darm9tdmi', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "arm9tdmi"
> >>>>   ARMPKGARCH_tune-arm9tdmi =3D "arm9tdmi"
> >>>> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/con=
f/machine/include/tune-cortexa15.inc
> >>>> index 25e99f93d7..0636306e2f 100644
> >>>> --- a/meta/conf/machine/include/tune-cortexa15.inc
> >>>> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv7vethf-neon"
> >>>>   require conf/machine/include/arm/arch-armv7ve.inc
> >>>>
> >>>>   TUNEVALID[cortexa15] =3D "Enable Cortex-A15 specific processor opt=
imizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15'=
, ' -mcpu=3Dcortex-a15', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15'=
, ' -mtune=3Dcortex-a15', '', d)}"
> >>>>
> >>>>   # Little Endian base configs
> >>>>   AVAILTUNES +=3D "cortexa15 cortexa15t cortexa15-neon cortexa15t-ne=
on cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
> >>>> diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/con=
f/machine/include/tune-cortexa17.inc
> >>>> index 40392f9bcc..f9774b8b8e 100644
> >>>> --- a/meta/conf/machine/include/tune-cortexa17.inc
> >>>> +++ b/meta/conf/machine/include/tune-cortexa17.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv7vethf-neon"
> >>>>   require conf/machine/include/arm/arch-armv7ve.inc
> >>>>
> >>>>   TUNEVALID[cortexa17] =3D "Enable Cortex-A17 specific processor opt=
imizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17'=
, ' -mcpu=3Dcortex-a17', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17'=
, ' -mtune=3Dcortex-a17', '', d)}"
> >>>>
> >>>>   # Little Endian base configs
> >>>>   AVAILTUNES +=3D "cortexa17 cortexa17t cortexa17-neon cortexa17t-ne=
on cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
> >>>> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf=
/machine/include/tune-cortexa5.inc
> >>>> index 1f0cda6640..1ececf9621 100644
> >>>> --- a/meta/conf/machine/include/tune-cortexa5.inc
> >>>> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv7athf-neon"
> >>>>   require conf/machine/include/arm/arch-armv7a.inc
> >>>>
> >>>>   TUNEVALID[cortexa5] =3D "Enable Cortex-A5 specific processor optim=
izations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5',=
 ' -mcpu=3Dcortex-a5', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5',=
 ' -mtune=3Dcortex-a5', '', d)}"
> >>>>
> >>>>   # Little Endian base configs
> >>>>   AVAILTUNES +=3D "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
> >>>> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf=
/machine/include/tune-cortexa7.inc
> >>>> index 52415d9c8b..08dd039338 100644
> >>>> --- a/meta/conf/machine/include/tune-cortexa7.inc
> >>>> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv7vethf-neon"
> >>>>   require conf/machine/include/arm/arch-armv7ve.inc
> >>>>
> >>>>   TUNEVALID[cortexa7] =3D "Enable Cortex-A7 specific processor optim=
izations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7',=
 ' -mcpu=3Dcortex-a7', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7',=
 ' -mtune=3Dcortex-a7', '', d)}"
> >>>>
> >>>>   # Little Endian base configs
> >>>>   AVAILTUNES +=3D "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon c=
ortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
> >>>> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf=
/machine/include/tune-cortexa8.inc
> >>>> index 8ee8de97f1..cdcb1c7d59 100644
> >>>> --- a/meta/conf/machine/include/tune-cortexa8.inc
> >>>> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv7athf-neon"
> >>>>   require conf/machine/include/arm/arch-armv7a.inc
> >>>>
> >>>>   TUNEVALID[cortexa8] =3D "Enable Cortex-A8 specific processor optim=
izations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8',=
 ' -mcpu=3Dcortex-a8', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8',=
 ' -mtune=3Dcortex-a8', '', d)}"
> >>>>
> >>>>   # Little Endian base configs
> >>>>   AVAILTUNES +=3D "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
> >>>> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf=
/machine/include/tune-cortexa9.inc
> >>>> index 0cf323c960..620178d18a 100644
> >>>> --- a/meta/conf/machine/include/tune-cortexa9.inc
> >>>> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv7athf-neon"
> >>>>   require conf/machine/include/arm/arch-armv7a.inc
> >>>>
> >>>>   TUNEVALID[cortexa9] =3D "Enable Cortex-A9 specific processor optim=
izations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9',=
 ' -mcpu=3Dcortex-a9', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9',=
 ' -mtune=3Dcortex-a9', '', d)}"
> >>>>
> >>>>   # Little Endian base configs
> >>>>   AVAILTUNES +=3D "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
> >>>> diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/m=
achine/include/tune-ep9312.inc
> >>>> index 84ca528d6d..897b904cd1 100644
> >>>> --- a/meta/conf/machine/include/tune-ep9312.inc
> >>>> +++ b/meta/conf/machine/include/tune-ep9312.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "ep9312"
> >>>>   require conf/machine/include/arm/arch-armv4.inc
> >>>>
> >>>>   TUNEVALID[ep9312] =3D "Enable Intel PXA27x specific processor opti=
mizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', '=
 -march=3Dep9312 -mcpu=3Dep9312', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', '=
 -march=3Dep9312 -mtune=3Dep9312', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "ep9312"
> >>>>   ARMPKGARCH_tune-ep9312 =3D "ep9312"
> >>>> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/m=
achine/include/tune-iwmmxt.inc
> >>>> index f27423cb2e..15cce8d3c5 100644
> >>>> --- a/meta/conf/machine/include/tune-iwmmxt.inc
> >>>> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
> >>>> @@ -6,7 +6,7 @@ DEFAULTTUNE ?=3D "iwmmxt"
> >>>>   require conf/machine/include/arm/arch-armv5-dsp.inc
> >>>>
> >>>>   TUNEVALID[iwmmxt] =3D "Enable Intel PXA27x specific processor opti=
mizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', '=
 -march=3Diwmmxt -mcpu=3Diwmmxt', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', '=
 -march=3Diwmmxt -mtune=3Diwmmxt', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "iwmmxt"
> >>>>   ARMPKGARCH_tune-iwmmxt =3D "iwmmxt"
> >>>> diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta=
/conf/machine/include/tune-strongarm1100.inc
> >>>> index 80cfb8ab8a..7b2fa8e3ab 100644
> >>>> --- a/meta/conf/machine/include/tune-strongarm1100.inc
> >>>> +++ b/meta/conf/machine/include/tune-strongarm1100.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv4"
> >>>>   require conf/machine/include/arm/arch-armv4.inc
> >>>>
> >>>>   TUNEVALID[strongarm] =3D "Enable Strongarm 1100 series processor o=
ptimizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'strongarm'=
, ' -mcpu=3Dstrongarm1100', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'strongarm'=
, ' -mtune=3Dstrongarm1100', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "strongarm"
> >>>>   ARMPKGARCH_tune-strongarm =3D "strongarm"
> >>>> diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf=
/machine/include/tune-thunderx.inc
> >>>> index 3d43b0f7e5..e77d1cdd2d 100644
> >>>> --- a/meta/conf/machine/include/tune-thunderx.inc
> >>>> +++ b/meta/conf/machine/include/tune-thunderx.inc
> >>>> @@ -5,7 +5,7 @@ AVAILTUNES +=3D "thunderx thunderx_be"
> >>>>
> >>>>   TUNEVALID[thunderx] =3D "Enable instructions for Cavium ThunderX"
> >>>>
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thunderx',=
 ' -mcpu=3Dthunderx ', '',d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thunderx',=
 ' -mtune=3Dthunderx ', '',d)}"
> >>>>
> >>>>   ARMPKGARCH_tune-thunderx ?=3D "thunderx"
> >>>>   ARMPKGARCH_tune-thunderx_be ?=3D "thunderx_be"
> >>>> diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/m=
achine/include/tune-xscale.inc
> >>>> index 0d07333955..2a0610fddf 100644
> >>>> --- a/meta/conf/machine/include/tune-xscale.inc
> >>>> +++ b/meta/conf/machine/include/tune-xscale.inc
> >>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?=3D "armv5te"
> >>>>   require conf/machine/include/arm/arch-armv5-dsp.inc
> >>>>
> >>>>   TUNEVALID[xscale] =3D "Enable PXA255/PXA26x Xscale specific proces=
sor optimizations"
> >>>> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'xscale', '=
 -mcpu=3Dxscale', '', d)}"
> >>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'xscale', '=
 -mtune=3Dxscale', '', d)}"
> >>>>
> >>>>   AVAILTUNES +=3D "xscale"
> >>>>   ARMPKGARCH_tune-xscale =3D "xscale"
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWxjSVQAKCRA3VSO3ZXaA
HJEXAJ0eSODFZNjCMIj0pTU7jkrAELnx6wCglUhO9qwZSWjxIlwDnHncd5jYSjY=
=V9en
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
