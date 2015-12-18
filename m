Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1939973198
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 13:11:04 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l126so65016352wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZW6cY7PkE07GthCDJkZlCmsHHEeaUFhr/gX0DKrA7yE=;
	b=yU2b/W3uL/VQabJFlTgmpD2yEMcXeUH75rOVZswPlfnxixuLJ0PUcmZ7FJPjamrNEJ
	3qzEZcF6tB6EfIYIw9irVu2R8206hHm1Y5iYA8HuIDgjFHU/IFNwM2dTUio32xEEFBaD
	CDDAa9HmxDwxuTD+Hs4ZwP51zV5ukSxgUEhwYFsdRi/6YEGZhOd61VQWMMyyRkM70Q0P
	9IqXQMv8yFzCKpSuZpgFQK1NfOq9bL4UWM6uzzGo4Ea5NRpWVPO8iRnFe1NF6bF3QGSz
	aEnxzzbGjlReHp3XLneTj/pqmcGJkvtxM8N2KysmwKWysMMUIfywhR0FbT6nGjI1ZlBM
	4Flg==
X-Received: by 10.194.19.226 with SMTP id i2mr4027320wje.167.1450444265102;
	Fri, 18 Dec 2015 05:11:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n7sm6629504wmf.21.2015.12.18.05.11.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 05:11:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 14:13:33 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20151218131333.GJ2563@jama>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
	<491ead1c0e8db7f1c919c163431be7bb9b087ddd.1449754344.git.Martin.Jansa@gmail.com>
	<CAJ86T=Vg-Q-oqiVuZXLU-rMwr=vwypdE2PUBMXuxJqQ6_a4+Bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vg-Q-oqiVuZXLU-rMwr=vwypdE2PUBMXuxJqQ6_a4+Bg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 18 Dec 2015 13:11:07 -0000
X-Groupsio-MsgNum: 75014
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SBT+cnFS/G3NVgv4"
Content-Disposition: inline

--SBT+cnFS/G3NVgv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 07:13:55PM -0800, Andre McCurdy wrote:
> On Thu, Dec 10, 2015 at 5:48 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * be aware that this -march value is available only in gcc-4.9 and
> >   newer:
> >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57907
> > * -mcpu=3Dcortex15 and -mcpu=3Dcortexa7 conflict with -march=3Darmv7a
> >   We either have to stop putting -march in default CCARGS or at
> >   least set it compatible one like this patch does.
>=20
> Can we drop the concept of armv7ve without Thumb support?
>=20
> Thumb was optional for armv4 but from armv5 onwards every ARM core has
> been able to support Thumb as well. Unfortunately the cpu tuning .inc
> files in oe-core for armv5 and above just seem to have copied any
> pasted from armv4 and so provide bogus non-thumb capable tuning
> options, which just add a lot of unnecessary complexity (the only real
> difference between them is that the thumb capable versions respect
> ARM_INSTRUCTION_SET and the non-thumb capable versions ignore it).
>=20
> To avoid breaking existing machine configs and package feeds, I guess
> we might be stuck with the existing AVAILTUNES for armv7a and below,
> but can we at least fix it for armv7ve ?

Well even when the HW supports the thumb, some DISTROs tend to disable
it for whatever reasons (e.g. you can use very low common denominator
DEFAULTTUNE for many MACHINEs - which cannot be controlled by
ARM_INSTRUCTION_SET only).

What harm do you see from keeping tunes without Thumb? Only the
maintenance of the tune file? That's not so bad because it's exact copy
of arch-armv7a.inc with s/7a/7ve/g.

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/arch-armv7ve.inc     | 141 +++++++++++++=
++++++++
> >  .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
> >  meta/conf/machine/include/tune-cortexa15.inc       |  52 ++++----
> >  meta/conf/machine/include/tune-cortexa7.inc        |  52 ++++----
> >  4 files changed, 194 insertions(+), 52 deletions(-)
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc
> >
> > diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf=
/machine/include/arm/arch-armv7ve.inc
> > new file mode 100644
> > index 0000000..79e1ef6
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > @@ -0,0 +1,141 @@
> > +DEFAULTTUNE ?=3D "armv7ve"
> > +
> > +TUNEVALID[armv7ve] =3D "Enable instructions for ARMv7ve"
> > +TUNECONFLICTS[armv7ve] =3D "armv4 armv5 armv6 armv7 armv7a"
> > +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -=
march=3Darmv7ve', '', d)}"
> > +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve'=
, 'armv7ve:', '' ,d)}"
> > +
> > +require conf/machine/include/arm/arch-armv6.inc
> > +require conf/machine/include/arm/feature-arm-neon.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES +=3D "armv7ve armv7vet armv7ve-vfpv3d16 armv7vet-vfpv3d16 a=
rmv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon armv7vet-neon armv7ve-neon-vfpv4 a=
rmv7vet-neon-vfpv4"
> > +ARMPKGARCH_tune-armv7ve             ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vet            ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7ve-vfpv3d16    ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vet-vfpv3d16   ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7ve-vfpv3       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vet-vfpv3      ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7ve-neon        ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vet-neon       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7ve-neon-vfpv4  ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vet-neon-vfpv4 ?=3D "armv7ve"
> > +TUNE_FEATURES_tune-armv7ve             =3D "arm armv7ve vfp"
> > +TUNE_FEATURES_tune-armv7vet            =3D "${TUNE_FEATURES_tune-armv7=
ve} thumb"
> > +TUNE_FEATURES_tune-armv7ve-vfpv3d16    =3D "${TUNE_FEATURES_tune-armv7=
ve}  vfpv3d16"
> > +TUNE_FEATURES_tune-armv7vet-vfpv3d16   =3D "${TUNE_FEATURES_tune-armv7=
vet} vfpv3d16"
> > +TUNE_FEATURES_tune-armv7ve-vfpv3       =3D "${TUNE_FEATURES_tune-armv7=
ve-vfpv3d16}  vfpv3"
> > +TUNE_FEATURES_tune-armv7vet-vfpv3      =3D "${TUNE_FEATURES_tune-armv7=
vet-vfpv3d16} vfpv3"
> > +TUNE_FEATURES_tune-armv7ve-neon        =3D "${TUNE_FEATURES_tune-armv7=
ve}  neon"
> > +TUNE_FEATURES_tune-armv7vet-neon       =3D "${TUNE_FEATURES_tune-armv7=
vet} neon"
> > +TUNE_FEATURES_tune-armv7ve-neon-vfpv4  =3D "${TUNE_FEATURES_tune-armv7=
ve-neon}  vfpv4"
> > +TUNE_FEATURES_tune-armv7vet-neon-vfpv4 =3D "${TUNE_FEATURES_tune-armv7=
vet-neon} vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve             =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv6}  armv7ve armv7ve-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet            =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv6t} armv7ve armv7ve-vfp armv7vet2-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7ve}  armv7ve-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16   =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7vet} armv7ve-vfpv3d16 armv7vet2-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7ve-vfpv3d16}  armv7ve-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3      =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7vet-vfpv3d16} armv7ve-vfpv3 armv7vet2-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon        =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7ve}  armv7ve-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon       =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7vet} armv7ve-neon armv7vet2-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4  =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7ve-neon}  armv7ve-neon-vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7vet-neon} armv7ve-neon-vfpv4 armv7vet2-neon-vfpv4"
> > +
> > +# HF Tunes
> > +AVAILTUNES +=3D "armv7vehf armv7vethf armv7vehf-vfpv3d16 armv7vethf-vf=
pv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3 armv7vehf-neon armv7vethf-neon armv=
7vehf-neon-vfpv4 armv7vethf-neon-vfpv4"
> > +ARMPKGARCH_tune-armv7vehf             ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethf            ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehf-vfpv3d16    ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethf-vfpv3d16   ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehf-vfpv3       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethf-vfpv3      ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehf-neon        ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethf-neon       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehf-neon-vfpv4  ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethf-neon-vfpv4 ?=3D "armv7ve"
> > +TUNE_FEATURES_tune-armv7vehf             =3D "${TUNE_FEATURES_tune-arm=
v7ve}             callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vethf            =3D "${TUNE_FEATURES_tune-arm=
v7vet}            callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vehf-vfpv3d16    =3D "${TUNE_FEATURES_tune-arm=
v7ve-vfpv3d16}    callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vethf-vfpv3d16   =3D "${TUNE_FEATURES_tune-arm=
v7vet-vfpv3d16}   callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vehf-vfpv3       =3D "${TUNE_FEATURES_tune-arm=
v7ve-vfpv3}       callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vethf-vfpv3      =3D "${TUNE_FEATURES_tune-arm=
v7vet-vfpv3}      callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vehf-neon        =3D "${TUNE_FEATURES_tune-arm=
v7ve-neon}        callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vethf-neon       =3D "${TUNE_FEATURES_tune-arm=
v7vet-neon}       callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  =3D "${TUNE_FEATURES_tune-arm=
v7ve-neon-vfpv4}  callconvention-hard"
> > +TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 =3D "${TUNE_FEATURES_tune-arm=
v7vet-neon-vfpv4} callconvention-hard"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf             =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv6hf}  armv7vehf-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf            =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv6thf} armv7vehf-vfp armv7vet2hf-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vehf}  armv7vehf-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16   =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vethf} armv7vehf-vfpv3d16 armv7vet2hf-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vehf-vfpv3d16}  armv7vehf-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3      =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vethf-vfpv3d16} armv7vehf-vfpv3 armv7vet2hf-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon        =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vehf}  armv7vehf-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon       =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vethf} armv7vehf-neon armv7vet2hf-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4  =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vehf-neon}  armv7vehf-neon-vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4 =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vethf-neon} armv7vehf-neon-vfpv4 armv7vet2hf-neon-vfpv4"
> > +
> > +# Big Endian
> > +AVAILTUNES +=3D "armv7veb armv7vetb armv7veb-vfpv3d16 armv7vetb-vfpv3d=
16 armv7veb-vfpv3 armv7vetb-vfpv3 armv7veb-neon armv7vetb-neon armv7veb-neo=
n-vfpv4 armv7vetb-neon-vfpv4"
> > +ARMPKGARCH_tune-armv7veb             ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vetb            ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7veb-vfpv3d16    ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vetb-vfpv3d16   ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7veb-vfpv3       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vetb-vfpv3      ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7veb-neon        ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vetb-neon       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7veb-neon-vfpv4  ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vetb-neon-vfpv4 ?=3D "armv7ve"
> > +TUNE_FEATURES_tune-armv7veb             =3D "${TUNE_FEATURES_tune-armv=
7ve}             bigendian"
> > +TUNE_FEATURES_tune-armv7vetb            =3D "${TUNE_FEATURES_tune-armv=
7vet}            bigendian"
> > +TUNE_FEATURES_tune-armv7veb-vfpv3d16    =3D "${TUNE_FEATURES_tune-armv=
7ve-vfpv3d16}    bigendian"
> > +TUNE_FEATURES_tune-armv7vetb-vfpv3d16   =3D "${TUNE_FEATURES_tune-armv=
7vet-vfpv3d16}   bigendian"
> > +TUNE_FEATURES_tune-armv7veb-vfpv3       =3D "${TUNE_FEATURES_tune-armv=
7ve-vfpv3}       bigendian"
> > +TUNE_FEATURES_tune-armv7vetb-vfpv3      =3D "${TUNE_FEATURES_tune-armv=
7vet-vfpv3}      bigendian"
> > +TUNE_FEATURES_tune-armv7veb-neon        =3D "${TUNE_FEATURES_tune-armv=
7ve-neon}        bigendian"
> > +TUNE_FEATURES_tune-armv7vetb-neon       =3D "${TUNE_FEATURES_tune-armv=
7vet-neon}       bigendian"
> > +TUNE_FEATURES_tune-armv7veb-neon-vfpv4  =3D "${TUNE_FEATURES_tune-armv=
7ve-neon-vfpv4}  bigendian"
> > +TUNE_FEATURES_tune-armv7vetb-neon-vfpv4 =3D "${TUNE_FEATURES_tune-armv=
7vet-neon-vfpv4} bigendian"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb             =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv6b}  armv7veb-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb            =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv6tb} armv7veb-vfp armv7vet2b-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7veb}  armv7veb-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16   =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7vetb} armv7veb-vfpv3d16 armv7vet2b-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7veb-vfpv3d16}  armv7veb-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3      =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7vetb-vfpv3d16} armv7veb-vfpv3 armv7vet2b-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon        =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7veb}  armv7veb-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon       =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7vetb} armv7veb-neon armv7vet2b-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfpv4  =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7veb-neon}  armv7veb-neon-vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7vetb-neon} armv7veb-neon-vfpv4 armv7vet2b-neon-vfpv4"
> > +
> > +# Big Endian + HF
> > +AVAILTUNES +=3D "armv7vehfb armv7vethfb armv7vehfb-vfpv3d16 armv7vethf=
b-vfpv3d16 armv7vehfb-vfpv3 armv7vethfb-vfpv3 armv7vehfb-neon armv7vethfb-n=
eon armv7vehfb-neon-vfpv4 armv7vethfb-neon-vfpv4"
> > +ARMPKGARCH_tune-armv7vehfb             ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethfb            ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehfb-vfpv3d16    ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethfb-vfpv3d16   ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehfb-vfpv3       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethfb-vfpv3      ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehfb-neon        ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethfb-neon       ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vehfb-neon-vfpv4  ?=3D "armv7ve"
> > +ARMPKGARCH_tune-armv7vethfb-neon-vfpv4 ?=3D "armv7ve"
> > +TUNE_FEATURES_tune-armv7vehfb             =3D "${TUNE_FEATURES_tune-ar=
mv7vehf}             bigendian"
> > +TUNE_FEATURES_tune-armv7vethfb            =3D "${TUNE_FEATURES_tune-ar=
mv7vethf}            bigendian"
> > +TUNE_FEATURES_tune-armv7vehfb-vfpv3d16    =3D "${TUNE_FEATURES_tune-ar=
mv7vehf-vfpv3d16}    bigendian"
> > +TUNE_FEATURES_tune-armv7vethfb-vfpv3d16   =3D "${TUNE_FEATURES_tune-ar=
mv7vethf-vfpv3d16}   bigendian"
> > +TUNE_FEATURES_tune-armv7vehfb-vfpv3       =3D "${TUNE_FEATURES_tune-ar=
mv7vehf-vfpv3}       bigendian"
> > +TUNE_FEATURES_tune-armv7vethfb-vfpv3      =3D "${TUNE_FEATURES_tune-ar=
mv7vethf-vfpv3}      bigendian"
> > +TUNE_FEATURES_tune-armv7vehfb-neon        =3D "${TUNE_FEATURES_tune-ar=
mv7vehf-neon}        bigendian"
> > +TUNE_FEATURES_tune-armv7vethfb-neon       =3D "${TUNE_FEATURES_tune-ar=
mv7vethf-neon}       bigendian"
> > +TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  =3D "${TUNE_FEATURES_tune-ar=
mv7vehf-neon-vfpv4}  bigendian"
> > +TUNE_FEATURES_tune-armv7vethfb-neon-vfpv4 =3D "${TUNE_FEATURES_tune-ar=
mv7vethf-neon-vfpv4} bigendian"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv6hfb}  armv7vehfb-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb            =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv6thfb} armv7vehfb-vfp armv7vet2hfb-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vehfb}  armv7vehfb-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16   =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vethfb} armv7vehfb-vfpv3d16 armv7vet2hfb-vfpv3d16"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vehfb-vfpv3d16}  armv7vehfb-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3      =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vethfb-vfpv3d16} armv7vehfb-vfpv3 armv7vet2hfb-vfpv3"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon        =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vehfb}  armv7vehfb-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon       =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vethfb} armv7vehfb-neon armv7vet2hfb-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-vfpv4  =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vehfb-neon}  armv7vehfb-neon-vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon-vfpv4 =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vethfb-neon} armv7vehfb-neon-vfpv4 armv7vet2hfb-neon-vfpv4"
> > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta=
/conf/machine/include/arm/feature-arm-thumb.inc
> > index 5632171..54c0cee 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > @@ -12,6 +12,7 @@ ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEA=
TURES', 'armv6',  't',  '', d
> >  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7a',=
 't2', '', d)}"
> >  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7r',=
 't2', '', d)}"
> >  ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7m',=
 't2', '', d)}"
> > +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve'=
, 't2', '', d)}"
> >
> >  # If the device supports ARM, then respect ARM_THUMB_OPT (which can be=
 "arm" or "thumb")
> >  # If the defice doesn't support ARM, then always set "thumb" even when
> > diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/m=
achine/include/tune-cortexa15.inc
> > index 8b34bb2..cfc8151 100644
> > --- a/meta/conf/machine/include/tune-cortexa15.inc
> > +++ b/meta/conf/machine/include/tune-cortexa15.inc
> > @@ -1,6 +1,6 @@
> > -DEFAULTTUNE ?=3D "armv7a-neon"
> > +DEFAULTTUNE ?=3D "armv7ve-neon"
> >
> > -require conf/machine/include/arm/arch-armv7a.inc
> > +require conf/machine/include/arm/arch-armv7ve.inc
> >
> >  TUNEVALID[cortexa15] =3D "Enable Cortex-A15 specific processor optimiz=
ations"
> >  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', '=
 -mtune=3Dcortex-a15', '', d)}"
> > @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa15-neon        =3D "cortexa1=
5"
> >  ARMPKGARCH_tune-cortexa15t-neon       =3D "cortexa15"
> >  ARMPKGARCH_tune-cortexa15-neon-vfpv4  =3D "cortexa15"
> >  ARMPKGARCH_tune-cortexa15t-neon-vfpv4 =3D "cortexa15"
> > -TUNE_FEATURES_tune-cortexa15             =3D "${TUNE_FEATURES_tune-arm=
v7a}             cortexa15"
> > -TUNE_FEATURES_tune-cortexa15t            =3D "${TUNE_FEATURES_tune-arm=
v7at}            cortexa15"
> > -TUNE_FEATURES_tune-cortexa15-neon        =3D "${TUNE_FEATURES_tune-arm=
v7a-neon}        cortexa15"
> > -TUNE_FEATURES_tune-cortexa15t-neon       =3D "${TUNE_FEATURES_tune-arm=
v7at-neon}       cortexa15"
> > -TUNE_FEATURES_tune-cortexa15-neon-vfpv4  =3D "${TUNE_FEATURES_tune-arm=
v7a-neon-vfpv4}  cortexa15"
> > -TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =3D "${TUNE_FEATURES_tune-arm=
v7at-neon-vfpv4} cortexa15"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15             =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7a}  cortexa15-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t            =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7a-neon}  cortexa15-vfp cortexa15-neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7at-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa=
15t2-neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7a-neon-vfpv4}  cortexa15-vfp cortexa15-neon cortexa15-neon-vf=
pv4"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7at-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vf=
pv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
> > +TUNE_FEATURES_tune-cortexa15             =3D "${TUNE_FEATURES_tune-arm=
v7ve}             cortexa15"
> > +TUNE_FEATURES_tune-cortexa15t            =3D "${TUNE_FEATURES_tune-arm=
v7vet}            cortexa15"
> > +TUNE_FEATURES_tune-cortexa15-neon        =3D "${TUNE_FEATURES_tune-arm=
v7ve-neon}        cortexa15"
> > +TUNE_FEATURES_tune-cortexa15t-neon       =3D "${TUNE_FEATURES_tune-arm=
v7vet-neon}       cortexa15"
> > +TUNE_FEATURES_tune-cortexa15-neon-vfpv4  =3D "${TUNE_FEATURES_tune-arm=
v7ve-neon-vfpv4}  cortexa15"
> > +TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 =3D "${TUNE_FEATURES_tune-arm=
v7vet-neon-vfpv4} cortexa15"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15             =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7ve}  cortexa15-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t            =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vet} cortexa15-vfp cortexa15t2-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7ve-neon}  cortexa15-vfp cortexa15-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vet-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortex=
a15t2-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7ve-neon-vfpv4}  cortexa15-vfp cortexa15-neon cortexa15-neon-v=
fpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-v=
fpv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
> >
> >  # HF Tunes
> >  AVAILTUNES +=3D "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15th=
f-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
> > @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa15hf-neon        =3D "cortex=
a15"
> >  ARMPKGARCH_tune-cortexa15thf-neon       =3D "cortexa15"
> >  ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  =3D "cortexa15"
> >  ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 =3D "cortexa15"
> > -TUNE_FEATURES_tune-cortexa15hf             =3D "${TUNE_FEATURES_tune-a=
rmv7ahf}             cortexa15"
> > -TUNE_FEATURES_tune-cortexa15thf            =3D "${TUNE_FEATURES_tune-a=
rmv7athf}            cortexa15"
> > -TUNE_FEATURES_tune-cortexa15hf-neon        =3D "${TUNE_FEATURES_tune-a=
rmv7ahf-neon}        cortexa15"
> > -TUNE_FEATURES_tune-cortexa15thf-neon       =3D "${TUNE_FEATURES_tune-a=
rmv7athf-neon}       cortexa15"
> > -TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  =3D "${TUNE_FEATURES_tune-a=
rmv7ahf-neon-vfpv4}  cortexa15"
> > -TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 =3D "${TUNE_FEATURES_tune-a=
rmv7athf-neon-vfpv4} cortexa15"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp cortexa15hf-neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-v=
fp cortexa15t2hf-neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa15hf-vfp cortexa15hf-neon cortexa15=
hf-neon-vfpv4"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7athf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15=
hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv4"
> > +TUNE_FEATURES_tune-cortexa15hf             =3D "${TUNE_FEATURES_tune-a=
rmv7vehf}             cortexa15"
> > +TUNE_FEATURES_tune-cortexa15thf            =3D "${TUNE_FEATURES_tune-a=
rmv7vethf}            cortexa15"
> > +TUNE_FEATURES_tune-cortexa15hf-neon        =3D "${TUNE_FEATURES_tune-a=
rmv7vehf-neon}        cortexa15"
> > +TUNE_FEATURES_tune-cortexa15thf-neon       =3D "${TUNE_FEATURES_tune-a=
rmv7vethf-neon}       cortexa15"
> > +TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  =3D "${TUNE_FEATURES_tune-a=
rmv7vehf-neon-vfpv4}  cortexa15"
> > +TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 =3D "${TUNE_FEATURES_tune-a=
rmv7vethf-neon-vfpv4} cortexa15"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7vehf}  cortexa15hf-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7vethf} cortexa15hf-vfp cortexa15t2hf-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7vehf-neon}  cortexa15hf-vfp cortexa15hf-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-=
vfp cortexa15t2hf-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa15hf-vfp cortexa15hf-neon cortexa1=
5hf-neon-vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7vethf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa1=
5hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv=
4"
> > diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/ma=
chine/include/tune-cortexa7.inc
> > index 4fea36f..84432bd 100644
> > --- a/meta/conf/machine/include/tune-cortexa7.inc
> > +++ b/meta/conf/machine/include/tune-cortexa7.inc
> > @@ -1,6 +1,6 @@
> > -DEFAULTTUNE ?=3D "armv7a-neon"
> > +DEFAULTTUNE ?=3D "armv7ve-neon"
> >
> > -require conf/machine/include/arm/arch-armv7a.inc
> > +require conf/machine/include/arm/arch-armv7ve.inc
> >
> >  TUNEVALID[cortexa7] =3D "Enable Cortex-A7 specific processor optimizat=
ions"
> >  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' =
-mtune=3Dcortex-a7', '', d)}"
> > @@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa7-neon        =3D "cortexa7"
> >  ARMPKGARCH_tune-cortexa7t-neon       =3D "cortexa7"
> >  ARMPKGARCH_tune-cortexa7-neon-vfpv4  =3D "cortexa7"
> >  ARMPKGARCH_tune-cortexa7t-neon-vfpv4 =3D "cortexa7"
> > -TUNE_FEATURES_tune-cortexa7             =3D "${TUNE_FEATURES_tune-armv=
7a}             cortexa7"
> > -TUNE_FEATURES_tune-cortexa7t            =3D "${TUNE_FEATURES_tune-armv=
7at}            cortexa7"
> > -TUNE_FEATURES_tune-cortexa7-neon        =3D "${TUNE_FEATURES_tune-armv=
7a-neon}        cortexa7"
> > -TUNE_FEATURES_tune-cortexa7t-neon       =3D "${TUNE_FEATURES_tune-armv=
7at-neon}       cortexa7"
> > -TUNE_FEATURES_tune-cortexa7-neon-vfpv4  =3D "${TUNE_FEATURES_tune-armv=
7a-neon-vfpv4}  cortexa7"
> > -TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =3D "${TUNE_FEATURES_tune-armv=
7at-neon-vfpv4} cortexa7"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7             =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7a}  cortexa7-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t            =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7a-neon}  cortexa7-vfp cortexa7-neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7at-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-=
neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7a-neon-vfpv4}  cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7at-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4 =
cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
> > +TUNE_FEATURES_tune-cortexa7             =3D "${TUNE_FEATURES_tune-armv=
7ve}             cortexa7"
> > +TUNE_FEATURES_tune-cortexa7t            =3D "${TUNE_FEATURES_tune-armv=
7vet}            cortexa7"
> > +TUNE_FEATURES_tune-cortexa7-neon        =3D "${TUNE_FEATURES_tune-armv=
7ve-neon}        cortexa7"
> > +TUNE_FEATURES_tune-cortexa7t-neon       =3D "${TUNE_FEATURES_tune-armv=
7vet-neon}       cortexa7"
> > +TUNE_FEATURES_tune-cortexa7-neon-vfpv4  =3D "${TUNE_FEATURES_tune-armv=
7ve-neon-vfpv4}  cortexa7"
> > +TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 =3D "${TUNE_FEATURES_tune-armv=
7vet-neon-vfpv4} cortexa7"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7             =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7ve}  cortexa7-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t            =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7ve-neon}  cortexa7-vfp cortexa7-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7vet-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2=
-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7ve-neon-vfpv4}  cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7vet-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4=
 cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
> >
> >  # HF Tunes
> >  AVAILTUNES +=3D "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-ne=
on cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
> > @@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa7hf-neon        =3D "cortexa=
7"
> >  ARMPKGARCH_tune-cortexa7thf-neon       =3D "cortexa7"
> >  ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  =3D "cortexa7"
> >  ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 =3D "cortexa7"
> > -TUNE_FEATURES_tune-cortexa7hf             =3D "${TUNE_FEATURES_tune-ar=
mv7ahf}             cortexa7"
> > -TUNE_FEATURES_tune-cortexa7thf            =3D "${TUNE_FEATURES_tune-ar=
mv7athf}            cortexa7"
> > -TUNE_FEATURES_tune-cortexa7hf-neon        =3D "${TUNE_FEATURES_tune-ar=
mv7ahf-neon}        cortexa7"
> > -TUNE_FEATURES_tune-cortexa7thf-neon       =3D "${TUNE_FEATURES_tune-ar=
mv7athf-neon}       cortexa7"
> > -TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  =3D "${TUNE_FEATURES_tune-ar=
mv7ahf-neon-vfpv4}  cortexa7"
> > -TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =3D "${TUNE_FEATURES_tune-ar=
mv7athf-neon-vfpv4} cortexa7"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7ahf}  cortexa7hf-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7ahf-neon}  cortexa7hf-vfp cortexa7hf-neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp c=
ortexa7t2hf-neon"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-neon cortexa7hf-n=
eon-vfpv4"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-n=
eon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
> > +TUNE_FEATURES_tune-cortexa7hf             =3D "${TUNE_FEATURES_tune-ar=
mv7vehf}             cortexa7"
> > +TUNE_FEATURES_tune-cortexa7thf            =3D "${TUNE_FEATURES_tune-ar=
mv7vethf}            cortexa7"
> > +TUNE_FEATURES_tune-cortexa7hf-neon        =3D "${TUNE_FEATURES_tune-ar=
mv7vehf-neon}        cortexa7"
> > +TUNE_FEATURES_tune-cortexa7thf-neon       =3D "${TUNE_FEATURES_tune-ar=
mv7vethf-neon}       cortexa7"
> > +TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  =3D "${TUNE_FEATURES_tune-ar=
mv7vehf-neon-vfpv4}  cortexa7"
> > +TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 =3D "${TUNE_FEATURES_tune-ar=
mv7vethf-neon-vfpv4} cortexa7"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vehf}  cortexa7hf-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vethf} cortexa7hf-vfp cortexa7t2hf-vfp"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vehf-neon}  cortexa7hf-vfp cortexa7hf-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vethf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp =
cortexa7t2hf-neon"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vehf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-neon cortexa7hf-=
neon-vfpv4"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7vethf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-=
neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
> > --
> > 2.6.3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SBT+cnFS/G3NVgv4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlZ0BnwACgkQN1Ujt2V2gBzE5gCdFDe4eIp/WvnP5svWRb4dOHzX
tikAlRlIbq8tBDUS0wJ0O0xL8GIS1IM=
=S6ej
-----END PGP SIGNATURE-----

--SBT+cnFS/G3NVgv4--
