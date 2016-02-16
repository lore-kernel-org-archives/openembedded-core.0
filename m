Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 191C173163
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:15:59 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b205so117284139wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TTUA01OtwlfbqwG5FKPI9fzmGNDfMbBwRXzoxiLnJsg=;
	b=yNa4y9WaOnsyn3Na6vQcFWvWLRl8UbDfEo5nBK9fP9nFS1lPHqtfxWMUBJ8thez+iJ
	7qyy0utLCGJ+GzM8qQGlqGBrVDtBT9nRjh//esOKpQ0a0Cf6crRc2gCYDzsB2qqF6e9V
	GxTqzkTQ4S2QjdxX6QQ8T+U8zvC3ZlxyquRHQ1X18ivxpGEf/5U040rwL34XfV7eLL5C
	v/fn2wFbJEZ2kuZNxOQEaqL8fp/l0jo0+Mvl/DMdH71qeGtbRrN41+g2b5IT8ezHUPHb
	I3D5fj1DiGB9ViFLr4Qmekm2i8PNwYra+tx/vvj1ZAoh0qFMJbmWxUipcTmioBXvdgyo
	CDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=TTUA01OtwlfbqwG5FKPI9fzmGNDfMbBwRXzoxiLnJsg=;
	b=QEJ09axCrkoOj6qZZGLwgt2NafqhZu7pTfI8DXrmaIABaE1Qta5hoTvd11VyHd6fZH
	JYXg2b46pk56aE0tkuac6m0w+uvGkNlezQpmVwLnLCQJxPrJ2mh0oYJjMcrbGTWKvZsm
	ubUDxT5DYv9BgNyfGQx2oCUc2kYaGUP2TWv9PETI1gU0ffSIMq2cYMWZIcUcNZkAJ/2B
	5cTvp4fYK8+q7qJve13TbbRjD7OI6Mkn1lN2qPUWQvRcoDxqehdeeKIn1mYzc+XWRR4M
	cfiPNXJe4td/a+k1RIDzZNVtfSUl1QvfSr6nH2tsb0QJO6eoLt7CdmRS7hEmOANRqAHU
	sXfQ==
X-Gm-Message-State: AG10YOTWV2Grz2pkGQicPKjgvvTHOyRStDzTtwvMdR4uOc+6wdjM8yIDjJnHIWrCyTXHsw==
X-Received: by 10.28.222.68 with SMTP id v65mr20907940wmg.66.1455639360032;
	Tue, 16 Feb 2016 08:16:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	et11sm30912207wjc.30.2016.02.16.08.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 08:15:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Feb 2016 17:20:20 +0100
To: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <20160216162020.GB2581@jama>
References: <1455632918-31605-1-git-send-email-daniel.dragomir@windriver.com>
	<1455632918-31605-2-git-send-email-daniel.dragomir@windriver.com>
	<20160216145436.GA2581@jama> <56C3498D.1020508@windriver.com>
MIME-Version: 1.0
In-Reply-To: <56C3498D.1020508@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Cristian Bercaru <cristian.bercaru@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] add tunings for 32-bit ARMv8-a
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
X-List-Received-Date: Tue, 16 Feb 2016 16:16:01 -0000
X-Groupsio-MsgNum: 78229
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 06:08:45PM +0200, Dragomir Daniel wrote:
>=20
>=20
> On 02/16/2016 04:54 PM, Martin Jansa wrote:
> > On Tue, Feb 16, 2016 at 04:28:38PM +0200, Daniel Dragomir wrote:
> >> From: Cristian Bercaru <cristian.bercaru@windriver.com>
> >>
> >> This patch adds tunes for 32-bit armv8 platforms. The user can select
> >> the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
> >> and the Neon, crc and crypto extensions.
> > This adds TUNEVALID for various tune features which aren't valid for
> > armv7a and lower (keep in mind that feature-arm-vfp.inc is included fro=
m arch-armv5.inc)
> >
> > Did you test this with tune-test script to at least confirm that it at
> > least still parses for all arm* DEFAULTTUNEs?
> >
>=20
> I just took over my colleague work and I need to continue it.
> Tunnings are new for meand I'm looking for a review about the actual=20
> approach
> from my colleague for adding ARMv8-a tunning for 32-bit.
>=20
> No, I didn't ran such script.
> Can you please tell me how to run it or at least where is this located.
> It's scripts/tune/test.sh from
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
2-test=20
> ?
> It's there any Readme for it?

There isn't one, basically run the script (update it if needed) and push
your results somewhere (ideally in branch which contains results from
jansa/tune2-test so that it shows only the smaller diffs in parsed
results.

It was shortly discussed in previous tune thread:
http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117=
395.html

>=20
> Thanks,
> Daniel
>=20
> >> Signed-off-by: Cristian Bercaru <cristian.bercaru@windriver.com>
> >> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> >> ---
> >>   meta/conf/machine/include/arm/arch-armv7a.inc      |  1 -
> >>   meta/conf/machine/include/arm/arch-armv8a.inc      | 65 ++++++++++++=
++++++++++
> >>   meta/conf/machine/include/arm/feature-arm-neon.inc |  3 -
> >>   meta/conf/machine/include/arm/feature-arm-vfp.inc  | 59 ++++++++++++=
++++----
> >>   4 files changed, 112 insertions(+), 16 deletions(-)
> >>   create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
> >>   delete mode 100644 meta/conf/machine/include/arm/feature-arm-neon.inc
> >>
> >> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf=
/machine/include/arm/arch-armv7a.inc
> >> index d3b6f64..ac85fda 100644
> >> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> >> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> >> @@ -6,7 +6,6 @@ TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES"=
, "armv7a", " -march=3Darmv7-a
> >>   MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "armv7a=
", "armv7a:", "" ,d)}"
> >>  =20
> >>   require conf/machine/include/arm/arch-armv6.inc
> >> -require conf/machine/include/arm/feature-arm-neon.inc
> >>  =20
> >>   # Little Endian base configs
> >>   AVAILTUNES +=3D "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 arm=
v7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon"
> >> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf=
/machine/include/arm/arch-armv8a.inc
> >> new file mode 100644
> >> index 0000000..1b062b8
> >> --- /dev/null
> >> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> >> @@ -0,0 +1,65 @@
> >> +DEFAULTTUNE ?=3D "armv8a"
> >> +
> >> +TUNEVALID[armv8a] =3D "Enable instructions for ARMv8-a"
> >> +TUNEVALID[crc] =3D "Enable CRC instrucitons for ARMv8-a"
> >> +TUNECONFLICTS[armv8a] =3D "armv4 armv5 armv6 armv7 armv7a"
> >> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "armv8a", " -=
march=3Darmv8-a", "", d)}"
> >> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "crc", "+crc"=
, "", d)}"
> >> +MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "armv8a"=
, "armv8a:", "" ,d)}"
> >> +
> >> +require conf/machine/include/arm/arch-armv7a.inc
> >> +
> >> +# Little Endian base configs
> >> +AVAILTUNES +=3D "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4 armv8a-=
neon-vfpv4 armv8a-fp-armv8 armv8a-neon-fp-armv8 armv8a-crypto-neon-fp-armv8"
> >> +ARMPKGARCH_tune-armv8a ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-vfpv3 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-neon ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-vfpv4 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-neon-vfpv4 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-fp-armv8 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-neon-fp-armv8 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crypto-neon-fp-armv8 ?=3D "armv8a"
> >> +TUNE_FEATURES_tune-armv8a ?=3D "arm armv8a vfp"
> >> +TUNE_FEATURES_tune-armv8a-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv8a} vf=
pv3"
> >> +TUNE_FEATURES_tune-armv8a-neon ?=3D "${TUNE_FEATURES_tune-armv8a} neo=
n"
> >> +TUNE_FEATURES_tune-armv8a-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv8a} vf=
pv4"
> >> +TUNE_FEATURES_tune-armv8a-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv8=
a} neon vfpv4"
> >> +TUNE_FEATURES_tune-armv8a-fp-armv8 ?=3D "${TUNE_FEATURES_tune-armv8a}=
 fp-armv8"
> >> +TUNE_FEATURES_tune-armv8a-neon-fp-armv8 ?=3D "${TUNE_FEATURES_tune-ar=
mv8a} neon fp-armv8"
> >> +TUNE_FEATURES_tune-armv8a-crypto-neon-fp-armv8 ?=3D "${TUNE_FEATURES_=
tune-armv8a} crypto neon fp-armv8"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
a} armv8a armv8a-vfp"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv8a} armv8a-vfp-vfpv3"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv8a-vfpv3} armv8a-vfp-neon"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv8a-vfpv3} armv8a-vfp-vfpv4"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARCHS=
_tune-armv8a-vfpv4} armv8a-vfp-neon armv8a-vfp-neon-vfpv4"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =3D "${PACKAGE_EXTRA_ARCHS_t=
une-armv8a} armv8a-vfp-fp-armv8"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-fp-armv8 =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv8a-fp-armv8} armv8a-vfp-neon-fp-armv8"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-neon-fp-armv8 =3D "${PACKAGE_E=
XTRA_ARCHS_tune-armv8a-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-armv8"
> >> +
> >> +# CRC configs
> >> +AVAILTUNES +=3D "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon armv8a-c=
rc-vfpv4 armv8a-crc-neon-vfpv4 armv8a-crc-fp-armv8 armv8a-crc-neon-fp-armv8=
 armv8a-crc-crypto-neon-fp-armv8"
> >> +ARMPKGARCH_tune-armv8a-crc ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crc-neon ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crc-neon-vfpv4 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crc-neon-fp-armv8 ?=3D "armv8a"
> >> +ARMPKGARCH_tune-armv8a-crc-crypto-neon-fp-armv8 ?=3D "armv8a"
> >> +TUNE_FEATURES_tune-armv8a-crc ?=3D "${TUNE_FEATURES_tune-armv8a} crc"
> >> +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv8a=
-vfpv3} crc"
> >> +TUNE_FEATURES_tune-armv8a-crc-neon ?=3D "${TUNE_FEATURES_tune-armv8a-=
neon} crc"
> >> +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv8a=
-vfpv4} crc"
> >> +TUNE_FEATURES_tune-armv8a-crc-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune-a=
rmv8a-neon-vfpv4} crc"
> >> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=3D "${TUNE_FEATURES_tune-arm=
v8a-fp-armv8} crc"
> >> +TUNE_FEATURES_tune-armv8a-crc-neon-fp-armv8 ?=3D "${TUNE_FEATURES_tun=
e-armv8a-neon-fp-armv8} crc"
> >> +TUNE_FEATURES_tune-armv8a-crc-crypto-neon-fp-armv8 ?=3D "${TUNE_FEATU=
RES_tune-armv8a-crypto-neon-fp-armv8} crc"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv8a} armv8a-crc-vfp"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a-crc} armv8a-vfp-vfpv3 armv8a-crc-vfp-vfpv3"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =3D "${PACKAGE_EXTRA_ARCHS_t=
une-armv8a-crc-vfpv3} armv8a-vfp-neon armv8a-crc-vfp-neon"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a-crc-vfpv3} armv8a-vfp-vfpv4 armv8a-crc-vfp-vfpv4"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-vfpv4 =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv8a-crc-vfpv4} armv8a-vfp-neon armv8a-crc-vfp-neon armv8a-vfp-=
neon-vfpv4 armv8a-crc-vfp-neon-vfpv4"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv8a-crc} armv8a-vfp-fp-armv8 armv8a-vfp-fp-crc-armv8"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8 =3D "${PACKAGE_EXTR=
A_ARCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon-fp-armv8 armv8a-crc-vfp-n=
eon-fp-armv8"
> >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-neon-fp-armv8 =3D "${PACKA=
GE_EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-arm=
v8 armv8a-crc-vfp-crypto-neon-fp-armv8"
> >> +
> >> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta=
/conf/machine/include/arm/feature-arm-neon.inc
> >> deleted file mode 100644
> >> index e8b2b85..0000000
> >> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> >> +++ /dev/null
> >> @@ -1,3 +0,0 @@
> >> -TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
> >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", bb.ut=
ils.contains("TUNE_FEATURES", "vfpv4", " -mfpu=3Dneon-vfpv4", " -mfpu=3Dneo=
n", d), "" , d)}"
> >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", "-n=
eon", "", d)}"
> >> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/=
conf/machine/include/arm/feature-arm-vfp.inc
> >> index 3dfbeac..12a4e81 100644
> >> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> >> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> >> @@ -1,17 +1,52 @@
> >>   TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vf=
p", "" ,d)}"
> >> -
> >>   TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with=
 16 registers (vfpv3-d16) unit."
> >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", "=
 -mfpu=3Dvfpv3-d16", "", d)}"
> >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16",=
 "-vfpv3d16", "" ,d)}"
> >> -
> >>   TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32=
 registers (vfpv3) unit."
> >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", " -m=
fpu=3Dvfpv3", "", d)}"
> >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", "-=
vfpv3", "" ,d)}"
> >> -
> >>   TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4)=
 unit."
> >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-=
vfpv4", "" ,d)}"
> >> -
> >> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
> >> +TUNEVALID[neon] =3D "Enable vfpv3 and Neon SIMD accelerator unit."
> >> +TUNEVALID[crypto] =3D "Enable ARMv8 crypto extension."
> >>   TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call conv=
ention, requires VFP."
> >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.uti=
ls.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=3Dhard", =
" -mfloat-abi=3Dsoftfp", d), "" ,d)}"
> >> -ARMPKGSFX_EABI .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "callcon=
vention-hard", "vfp" ], "hf", "", d)}"
> >> +
> >> +python () {
> >> +	if bb.utils.contains("TUNE_FEATURES", "crc", True, False, d):
> >> +		d.appendVar("ARMPKGSFX_FPU", "-crc")
> >> +
> >> +	if bb.utils.contains("TUNE_FEATURES", "vfp", True, False, d):
> >> +		d.appendVar("ARMPKGSFX_FPU", "-vfp")
> >> +
> >> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3d16", True, False, d):
> >> +		d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv3-d16")
> >> +		d.appendVar("ARMPKGSFX_FPU", "-vfpv3d16")
> >> +
> >> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3", True, False, d):
> >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv3")
> >> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv3")
> >> +	elif bb.utils.contains("TUNE_FEATURES", "vfpv4", True, False, d):
> >> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon-vfpv4")
> >> +			d.appendVar("ARMPKGSFX_FPU", "-neon-vfpv4")
> >> +		else:
> >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv4")
> >> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv4")
> >> +	elif bb.utils.contains("TUNE_FEATURES", "fp-armv8", True, False, d):
> >> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> >> +			if bb.utils.contains("TUNE_FEATURES", "crypto", True, False, d):
> >> +				d.appendVar("TUNE_CCARGS", " -mfpu=3Dcrypto-neon-fp-armv8")
> >> +				d.appendVar("ARMPKGSFX_FPU", "-crypto-neon-fp-armv8")
> >> +			else:
> >> +				d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon-fp-armv8")
> >> +				d.appendVar("ARMPKGSFX_FPU", "-neon-fp-armv8")
> >> +		else:
> >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dfp-armv8")
> >> +			d.appendVar("ARMPKGSFX_FPU", "-fp-armv8")
> >> +	elif bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> >> +		d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon")
> >> +		d.appendVar("ARMPKGSFX_FPU", "-neon")
> >> +
> >> +	if bb.utils.contains("TUNE_FEATURES", "callconvention-hard", True, F=
alse, d):
> >> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=3Dhard")
> >> +	else:
> >> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=3Dsoftfp")
> >> +	if bb.utils.contains("TUNE_FEATURES", [ "vfp", "callconvention-hard"=
 ], True, False, d):
> >> +		d.appendVar("ARMPKGSFX_EABI", "hf")
> >> +}
> >> --=20
> >> 1.9.1
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbDTEMACgkQN1Ujt2V2gBwVsgCgkjqZyHDQ7CmdRJS7bXXRJldu
BqYAnjyvSw+FngAeE38PW72ZMsCl0/Ve
=HZt6
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
