Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 25186731AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 14:50:15 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id c200so165375614wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8KR3SPXK3mZDk1+f0Ll9T0c4ttsM/tm5BmslxUaSWdA=;
	b=gH6oQofitsRqUpwuO6MjwGRAL7ZmWcHGC0H3Jk2WTObznqGjBsiGE5sD/xUpviE3iy
	i1UpBszUOo/Pr1oF01Pao7H4MBR81g+wxRVf6USmezxxaEey80CWXcrn/luaze4DFunI
	RS6/KEJPmz0LGpO3UQBwbDsI19UWXJIadiXEEsxa7EyftS4A3h/U6G53gZ7uMW4Jxpz4
	8CrIw5088zRe74m7l8OWPqlgEVEPk5SNEXnhVc65u5PpgTgkm8aCLY2MG73PTjhuXjcM
	lHgYv9HIJXFswS622I2u6gDxHEEYsC9W/l0NCYkXHt7rc3pvxGOyR6BfV7tz1AsSmLyL
	7JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=8KR3SPXK3mZDk1+f0Ll9T0c4ttsM/tm5BmslxUaSWdA=;
	b=BueMOBTiOqXGe64BLdMoXUf4NoRzKHnVO5VIdC2D6l5oc1Wi0ijZ5/+CV7moKL+9fi
	VBOdVIQdHtj5PJq+OG9WvQFRMYKNr1MlE+lPTZB0SXlwzJ7vOVQcSjjjlfZ+k9JW1yPu
	BK35UEXZqhtewqAAdoH03hmpKigx2tYOe0SIZoDJirN0tf5CSzhvIQRvXn0wAEFPAyJG
	IqTx6B+vsW0E22B/VCFLdaBQNSFPnwlqfc6i4hGcal1sSDmV+zWSO2BLRbRyGD1FyvsL
	y4e4ayLpGb0Ao2VKX3InRNUIGjPWiQU/5oJWJT8G8vQ3Nb39naWHsyUZaDfBtufCHncc
	iLjw==
X-Gm-Message-State: AG10YORaWxMSkHHuR8GMWyaiMIi5qY/2PALRzEg8+k3N7m4z3mkGk4vZMm8B+J9GreN0FA==
X-Received: by 10.28.50.193 with SMTP id y184mr20031801wmy.103.1455634216295; 
	Tue, 16 Feb 2016 06:50:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ka4sm30604689wjc.47.2016.02.16.06.50.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 06:50:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Feb 2016 15:54:36 +0100
To: Daniel Dragomir <daniel.dragomir@windriver.com>
Message-ID: <20160216145436.GA2581@jama>
References: <1455632918-31605-1-git-send-email-daniel.dragomir@windriver.com>
	<1455632918-31605-2-git-send-email-daniel.dragomir@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1455632918-31605-2-git-send-email-daniel.dragomir@windriver.com>
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
X-List-Received-Date: Tue, 16 Feb 2016 14:50:21 -0000
X-Groupsio-MsgNum: 78222
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 04:28:38PM +0200, Daniel Dragomir wrote:
> From: Cristian Bercaru <cristian.bercaru@windriver.com>
>=20
> This patch adds tunes for 32-bit armv8 platforms. The user can select
> the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
> and the Neon, crc and crypto extensions.

This adds TUNEVALID for various tune features which aren't valid for
armv7a and lower (keep in mind that feature-arm-vfp.inc is included from ar=
ch-armv5.inc)

Did you test this with tune-test script to at least confirm that it at
least still parses for all arm* DEFAULTTUNEs?

> Signed-off-by: Cristian Bercaru <cristian.bercaru@windriver.com>
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> ---
>  meta/conf/machine/include/arm/arch-armv7a.inc      |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc      | 65 ++++++++++++++++=
++++++
>  meta/conf/machine/include/arm/feature-arm-neon.inc |  3 -
>  meta/conf/machine/include/arm/feature-arm-vfp.inc  | 59 ++++++++++++++++=
----
>  4 files changed, 112 insertions(+), 16 deletions(-)
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>  delete mode 100644 meta/conf/machine/include/arm/feature-arm-neon.inc
>=20
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/ma=
chine/include/arm/arch-armv7a.inc
> index d3b6f64..ac85fda 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -6,7 +6,6 @@ TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "=
armv7a", " -march=3Darmv7-a
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "=
armv7a:", "" ,d)}"
> =20
>  require conf/machine/include/arm/arch-armv6.inc
> -require conf/machine/include/arm/feature-arm-neon.inc
> =20
>  # Little Endian base configs
>  AVAILTUNES +=3D "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-=
vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon"
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/ma=
chine/include/arm/arch-armv8a.inc
> new file mode 100644
> index 0000000..1b062b8
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,65 @@
> +DEFAULTTUNE ?=3D "armv8a"
> +
> +TUNEVALID[armv8a] =3D "Enable instructions for ARMv8-a"
> +TUNEVALID[crc] =3D "Enable CRC instrucitons for ARMv8-a"
> +TUNECONFLICTS[armv8a] =3D "armv4 armv5 armv6 armv7 armv7a"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "armv8a", " -mar=
ch=3Darmv8-a", "", d)}"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "crc", "+crc", "=
", d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "armv8a", "=
armv8a:", "" ,d)}"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4 armv8a-neo=
n-vfpv4 armv8a-fp-armv8 armv8a-neon-fp-armv8 armv8a-crypto-neon-fp-armv8"
> +ARMPKGARCH_tune-armv8a ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-vfpv3 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-neon ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-vfpv4 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-neon-vfpv4 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-fp-armv8 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-neon-fp-armv8 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crypto-neon-fp-armv8 ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8a ?=3D "arm armv8a vfp"
> +TUNE_FEATURES_tune-armv8a-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv8a} vfpv3"
> +TUNE_FEATURES_tune-armv8a-neon ?=3D "${TUNE_FEATURES_tune-armv8a} neon"
> +TUNE_FEATURES_tune-armv8a-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv8a} vfpv4"
> +TUNE_FEATURES_tune-armv8a-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv8a} =
neon vfpv4"
> +TUNE_FEATURES_tune-armv8a-fp-armv8 ?=3D "${TUNE_FEATURES_tune-armv8a} fp=
-armv8"
> +TUNE_FEATURES_tune-armv8a-neon-fp-armv8 ?=3D "${TUNE_FEATURES_tune-armv8=
a} neon fp-armv8"
> +TUNE_FEATURES_tune-armv8a-crypto-neon-fp-armv8 ?=3D "${TUNE_FEATURES_tun=
e-armv8a} crypto neon fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7a} =
armv8a armv8a-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv8a} armv8a-vfp-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v8a-vfpv3} armv8a-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv8a-vfpv3} armv8a-vfp-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv8a-vfpv4} armv8a-vfp-neon armv8a-vfp-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv8a} armv8a-vfp-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-fp-armv8 =3D "${PACKAGE_EXTRA_ARCHS=
_tune-armv8a-fp-armv8} armv8a-vfp-neon-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-neon-fp-armv8 =3D "${PACKAGE_EXTR=
A_ARCHS_tune-armv8a-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-armv8"
> +
> +# CRC configs
> +AVAILTUNES +=3D "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon armv8a-crc-=
vfpv4 armv8a-crc-neon-vfpv4 armv8a-crc-fp-armv8 armv8a-crc-neon-fp-armv8 ar=
mv8a-crc-crypto-neon-fp-armv8"
> +ARMPKGARCH_tune-armv8a-crc ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-neon ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-neon-vfpv4 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-neon-fp-armv8 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-crypto-neon-fp-armv8 ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8a-crc ?=3D "${TUNE_FEATURES_tune-armv8a} crc"
> +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv8a-vf=
pv3} crc"
> +TUNE_FEATURES_tune-armv8a-crc-neon ?=3D "${TUNE_FEATURES_tune-armv8a-neo=
n} crc"
> +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv8a-vf=
pv4} crc"
> +TUNE_FEATURES_tune-armv8a-crc-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv=
8a-neon-vfpv4} crc"
> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=3D "${TUNE_FEATURES_tune-armv8a=
-fp-armv8} crc"
> +TUNE_FEATURES_tune-armv8a-crc-neon-fp-armv8 ?=3D "${TUNE_FEATURES_tune-a=
rmv8a-neon-fp-armv8} crc"
> +TUNE_FEATURES_tune-armv8a-crc-crypto-neon-fp-armv8 ?=3D "${TUNE_FEATURES=
_tune-armv8a-crypto-neon-fp-armv8} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
8a} armv8a-crc-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv8a-crc} armv8a-vfp-vfpv3 armv8a-crc-vfp-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv8a-crc-vfpv3} armv8a-vfp-neon armv8a-crc-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv8a-crc-vfpv3} armv8a-vfp-vfpv4 armv8a-crc-vfp-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv8a-crc-vfpv4} armv8a-vfp-neon armv8a-crc-vfp-neon armv8a-vfp-neo=
n-vfpv4 armv8a-crc-vfp-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a-crc} armv8a-vfp-fp-armv8 armv8a-vfp-fp-crc-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8 =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon-fp-armv8 armv8a-crc-vfp-neon=
-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-neon-fp-armv8 =3D "${PACKAGE_=
EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-armv8 =
armv8a-crc-vfp-crypto-neon-fp-armv8"
> +
> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/co=
nf/machine/include/arm/feature-arm-neon.inc
> deleted file mode 100644
> index e8b2b85..0000000
> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", bb.utils=
=2Econtains("TUNE_FEATURES", "vfpv4", " -mfpu=3Dneon-vfpv4", " -mfpu=3Dneon=
", d), "" , d)}"
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon=
", "", d)}"
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/con=
f/machine/include/arm/feature-arm-vfp.inc
> index 3dfbeac..12a4e81 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -1,17 +1,52 @@
>  TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp",=
 "" ,d)}"
> -
>  TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with 16 =
registers (vfpv3-d16) unit."
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", " -m=
fpu=3Dvfpv3-d16", "", d)}"
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", "-=
vfpv3d16", "" ,d)}"
> -
>  TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 reg=
isters (vfpv3) unit."
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", " -mfpu=
=3Dvfpv3", "", d)}"
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", "-vfp=
v3", "" ,d)}"
> -
>  TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) uni=
t."
> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-vfp=
v4", "" ,d)}"
> -
> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
> +TUNEVALID[neon] =3D "Enable vfpv3 and Neon SIMD accelerator unit."
> +TUNEVALID[crypto] =3D "Enable ARMv8 crypto extension."
>  TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call conventi=
on, requires VFP."
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.=
contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=3Dhard", " -=
mfloat-abi=3Dsoftfp", d), "" ,d)}"
> -ARMPKGSFX_EABI .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "callconven=
tion-hard", "vfp" ], "hf", "", d)}"
> +
> +python () {
> +	if bb.utils.contains("TUNE_FEATURES", "crc", True, False, d):
> +		d.appendVar("ARMPKGSFX_FPU", "-crc")
> +
> +	if bb.utils.contains("TUNE_FEATURES", "vfp", True, False, d):
> +		d.appendVar("ARMPKGSFX_FPU", "-vfp")
> +
> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3d16", True, False, d):
> +		d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv3-d16")
> +		d.appendVar("ARMPKGSFX_FPU", "-vfpv3d16")
> +
> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3", True, False, d):
> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv3")
> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv3")
> +	elif bb.utils.contains("TUNE_FEATURES", "vfpv4", True, False, d):
> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon-vfpv4")
> +			d.appendVar("ARMPKGSFX_FPU", "-neon-vfpv4")
> +		else:
> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv4")
> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv4")
> +	elif bb.utils.contains("TUNE_FEATURES", "fp-armv8", True, False, d):
> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> +			if bb.utils.contains("TUNE_FEATURES", "crypto", True, False, d):
> +				d.appendVar("TUNE_CCARGS", " -mfpu=3Dcrypto-neon-fp-armv8")
> +				d.appendVar("ARMPKGSFX_FPU", "-crypto-neon-fp-armv8")
> +			else:
> +				d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon-fp-armv8")
> +				d.appendVar("ARMPKGSFX_FPU", "-neon-fp-armv8")
> +		else:
> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dfp-armv8")
> +			d.appendVar("ARMPKGSFX_FPU", "-fp-armv8")
> +	elif bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> +		d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon")
> +		d.appendVar("ARMPKGSFX_FPU", "-neon")
> +
> +	if bb.utils.contains("TUNE_FEATURES", "callconvention-hard", True, Fals=
e, d):
> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=3Dhard")
> +	else:
> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=3Dsoftfp")
> +	if bb.utils.contains("TUNE_FEATURES", [ "vfp", "callconvention-hard" ],=
 True, False, d):
> +		d.appendVar("ARMPKGSFX_EABI", "hf")
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbDOCsACgkQN1Ujt2V2gBxX8wCfeEpd7l6Z55Y7nlDs4gKx/F+2
EAYAoIRJ9qck49Kc/gE5AO933LDm2MDt
=wMq1
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
