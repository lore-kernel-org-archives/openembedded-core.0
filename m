Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE696A9E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:47:11 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so7065834eak.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=27hgJwoMrxiNvzf2uEbbV5BUctzQXugdZibPLvDBwlw=;
	b=vDSVWBZQv/ztIp+I3OP21CzHCJe9bXYuufO8ZsS1eakLfjGEb2W+3CZGVqrVij75h/
	MvfosWvhtRRSzYGilgFK4rdK25Hdp9xRTFkOicMqZWJ3zvcnlDXzhqj3uBex4FkzwHwX
	f74jAzEDG+NE/dc+68DZ657Pxkkg2QJofZN5s8+illevEgOgsIuEw7fWPxfOkZVFbREQ
	l4wILE12abxpUKQyMLY29n6hSOfh/ipietfFu0KK/r6AG1beWOLkMoVhlMPbpbeg71fX
	ltzBkRgAmlzvPxknU974MQ2bDMFhULP14BsvwrdGuV3YPVu/LTQugj7B2UKkJJnKYtsR
	d7Dw==
X-Received: by 10.15.52.193 with SMTP id p41mr1653013eew.43.1371055631832;
	Wed, 12 Jun 2013 09:47:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bk1sm38016759eeb.5.2013.06.12.09.47.10 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 09:47:11 -0700 (PDT)
Date: Wed, 12 Jun 2013 18:47:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andy Voltz <andy.voltz@timesys.com>
Message-ID: <20130612164735.GS3233@jama>
References: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
MIME-Version: 1.0
In-Reply-To: <1371055081-15301-1-git-send-email-andy.voltz@timesys.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines.
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
X-List-Received-Date: Wed, 12 Jun 2013 16:47:12 -0000
X-Groupsio-MsgNum: 40534
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2u4WfPhYOuYlOsk"
Content-Disposition: inline

--p2u4WfPhYOuYlOsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2013 at 12:38:01PM -0400, Andy Voltz wrote:
> Using CORTEX_ID variable reference in the tuning overrides did not work.
> This reverts those changes, and adds a tuning file for the cortex-a5.
>=20
> Revert "tune-cortexa5.inc: Add tune file for cortex-a5"
> Revert "tune-cortexa.inc: create a common include for cortex-a armv7a tun=
ing"
>=20
> Signed-off-by: Andy Voltz <andy.voltz@timesys.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks

I have it reverted since it was merged..

> ---
>  meta/conf/machine/include/arm/README         |    3 ---
>  meta/conf/machine/include/tune-cortexa.inc   |   35 --------------------=
------
>  meta/conf/machine/include/tune-cortexa15.inc |   35 ++++++++++++++++++++=
++++--
>  meta/conf/machine/include/tune-cortexa5.inc  |   35 ++++++++++++++++++++=
++++--
>  meta/conf/machine/include/tune-cortexa7.inc  |   35 ++++++++++++++++++++=
++++--
>  meta/conf/machine/include/tune-cortexa8.inc  |   35 ++++++++++++++++++++=
++++--
>  meta/conf/machine/include/tune-cortexa9.inc  |   35 ++++++++++++++++++++=
++++--
>  7 files changed, 165 insertions(+), 48 deletions(-)
>  delete mode 100644 meta/conf/machine/include/tune-cortexa.inc
>=20
> diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/inc=
lude/arm/README
> index d8d7b64..a1beb75 100644
> --- a/meta/conf/machine/include/arm/README
> +++ b/meta/conf/machine/include/arm/README
> @@ -38,6 +38,3 @@ the core arch-arm.inc file.
> =20
>  ARMPKGSFX_FPU - This is the FPU specific suffix.  The suffix indicates=
=20
>  specific FPU optimizations.  'vfp' and 'neon' are both defined.
> -
> -CORTEX_ID - This is the cortex processor type, and is used to setup the
> -proper tuning (-mtune=3Dcortex-${CORTEX_ID}) in tune-cortexa.inc.
> diff --git a/meta/conf/machine/include/tune-cortexa.inc b/meta/conf/machi=
ne/include/tune-cortexa.inc
> deleted file mode 100644
> index 987e4d9..0000000
> --- a/meta/conf/machine/include/tune-cortexa.inc
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DEFAULTTUNE ?=3D "armv7a-neon"
> -
> -require conf/machine/include/arm/arch-armv7a.inc
> -
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortex${CORTEX_=
ID}", " -mcpu=3Dcortex-${CORTEX_ID}", "", d)}"
> -
> -# Little Endian base configs
> -AVAILTUNES +=3D "cortex${CORTEX_ID} cortex${CORTEX_ID}t cortex${CORTEX_I=
D}-neon cortex${CORTEX_ID}t-neon"
> -ARMPKGARCH_tune-cortex${CORTEX_ID} =3D "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}t =3D "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}-neon =3D "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon =3D "cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID} =3D "${TUNE_FEATURES_tune-armv7a} =
cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}t =3D "${TUNE_FEATURES_tune-armv7at=
} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon =3D "${TUNE_FEATURES_tune-arm=
v7a-neon} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon =3D "${TUNE_FEATURES_tune-ar=
mv7at-neon} cortex${CORTEX_ID}"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} =3D "${PACKAGE_EXTRA_ARCHS_t=
une-armv7a} cortex${CORTEX_ID}-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv7at} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon =3D "${PACKAGE_EXTRA_AR=
CHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}-vfp-neon =
cortex${CORTEX_ID}t2-vfp cortex${CORTEX_ID}t2-vfp-neon"
> -
> -# VFP Tunes
> -AVAILTUNES +=3D "cortex${CORTEX_ID}hf cortex${CORTEX_ID}thf cortex${CORT=
EX_ID}hf-neon cortex${CORTEX_ID}thf-neon"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}hf =3D "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}thf =3D "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}hf-neon =3D "cortex${CORTEX_ID}"
> -ARMPKGARCH_tune-cortex${CORTEX_ID}thf-neon =3D "cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}hf ?=3D "${TUNE_FEATURES_tune-armv7=
ahf} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}thf ?=3D "${TUNE_FEATURES_tune-armv=
7athf} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}hf-neon ?=3D "${TUNE_FEATURES_tune-=
armv7ahf-neon} cortex${CORTEX_ID}"
> -TUNE_FEATURES_tune-cortex${CORTEX_ID}thf-neon ?=3D "${TUNE_FEATURES_tune=
-armv7athf-neon} cortex${CORTEX_ID}"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}hf =3D "${PACKAGE_EXTRA_ARCHS=
_tune-armv7ahf} cortex${CORTEX_ID}hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}thf =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv7athf} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}hf-neon =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv7ahf-neon} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}hf-vfp=
-neon"
> -PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}thf-neon =3D "${PACKAGE_EXTRA=
_ARCHS_tune-armv7athf-neon} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}hf-v=
fp-neon cortex${CORTEX_ID}t2hf-vfp cortex${CORTEX_ID}t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/mac=
hine/include/tune-cortexa15.inc
> index c89bacc..5529777 100644
> --- a/meta/conf/machine/include/tune-cortexa15.inc
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID =3D "a15"
> +DEFAULTTUNE ?=3D "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> =20
>  TUNEVALID[cortexa15] =3D "Enable Cortex-A15 specific processor optimizat=
ions"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -=
mtune=3Dcortex-a15", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
> +ARMPKGARCH_tune-cortexa15 =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15t =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15-neon =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15t-neon =3D "cortexa15"
> +TUNE_FEATURES_tune-cortexa15 =3D "${TUNE_FEATURES_tune-armv7a} cortexa15"
> +TUNE_FEATURES_tune-cortexa15t =3D "${TUNE_FEATURES_tune-armv7at} cortexa=
15"
> +TUNE_FEATURES_tune-cortexa15-neon =3D "${TUNE_FEATURES_tune-armv7a-neon}=
 cortexa15"
> +TUNE_FEATURES_tune-cortexa15t-neon =3D "${TUNE_FEATURES_tune-armv7at-neo=
n} cortexa15"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
a} cortexa15-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7at} cortexa15-vfp cortexa15t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2=
-vfp-neon"
> =20
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES +=3D "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-=
neon"
> +ARMPKGARCH_tune-cortexa15hf =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15thf =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15hf-neon =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15thf-neon =3D "cortexa15"
> +TUNE_FEATURES_tune-cortexa15hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} cort=
exa15"
> +TUNE_FEATURES_tune-cortexa15thf ?=3D "${TUNE_FEATURES_tune-armv7athf} co=
rtexa15"
> +TUNE_FEATURES_tune-cortexa15hf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-=
neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15thf-neon ?=3D "${TUNE_FEATURES_tune-armv7ath=
f-neon} cortexa15"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7ahf} cortexa15hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp c=
ortexa15t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/mach=
ine/include/tune-cortexa5.inc
> index 5511c5c..139e65c 100644
> --- a/meta/conf/machine/include/tune-cortexa5.inc
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID =3D "a5"
> +DEFAULTTUNE ?=3D "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> =20
>  TUNEVALID[cortexa5] =3D "Enable Cortex-A5 specific processor optimizatio=
ns"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", " -m=
tune=3Dcortex-a5", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
> +ARMPKGARCH_tune-cortexa5 =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5t =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5-neon =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5t-neon =3D "cortexa5"
> +TUNE_FEATURES_tune-cortexa5 =3D "${TUNE_FEATURES_tune-armv7a} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t =3D "${TUNE_FEATURES_tune-armv7at} cortexa5"
> +TUNE_FEATURES_tune-cortexa5-neon =3D "${TUNE_FEATURES_tune-armv7a-neon} =
cortexa5"
> +TUNE_FEATURES_tune-cortexa5t-neon =3D "${TUNE_FEATURES_tune-armv7at-neon=
} cortexa5"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7a=
} cortexa5-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
at} cortexa5-vfp cortexa5t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-=
neon"
> =20
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES +=3D "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
> +ARMPKGARCH_tune-cortexa5hf =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5hf-neon =3D "cortexa5"
> +ARMPKGARCH_tune-cortexa5thf-neon =3D "cortexa5"
> +TUNE_FEATURES_tune-cortexa5hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} corte=
xa5"
> +TUNE_FEATURES_tune-cortexa5thf ?=3D "${TUNE_FEATURES_tune-armv7athf} cor=
texa5"
> +TUNE_FEATURES_tune-cortexa5hf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-n=
eon} cortexa5"
> +TUNE_FEATURES_tune-cortexa5thf-neon ?=3D "${TUNE_FEATURES_tune-armv7athf=
-neon} cortexa5"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7ahf} cortexa5hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp corte=
xa5t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/mach=
ine/include/tune-cortexa7.inc
> index c6bc457..f02f0a2 100644
> --- a/meta/conf/machine/include/tune-cortexa7.inc
> +++ b/meta/conf/machine/include/tune-cortexa7.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID =3D "a7"
> +DEFAULTTUNE ?=3D "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> =20
>  TUNEVALID[cortexa7] =3D "Enable Cortex-A7 specific processor optimizatio=
ns"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", " -m=
tune=3Dcortex-a7", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
> +ARMPKGARCH_tune-cortexa7 =3D "cortexa7"
> +ARMPKGARCH_tune-cortexa7t =3D "cortexa7"
> +ARMPKGARCH_tune-cortexa7-neon =3D "cortexa7"
> +ARMPKGARCH_tune-cortexa7t-neon =3D "cortexa7"
> +TUNE_FEATURES_tune-cortexa7 =3D "${TUNE_FEATURES_tune-armv7a} cortexa7"
> +TUNE_FEATURES_tune-cortexa7t =3D "${TUNE_FEATURES_tune-armv7at} cortexa7"
> +TUNE_FEATURES_tune-cortexa7-neon =3D "${TUNE_FEATURES_tune-armv7a-neon} =
cortexa7"
> +TUNE_FEATURES_tune-cortexa7t-neon =3D "${TUNE_FEATURES_tune-armv7at-neon=
} cortexa7"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7a=
} cortexa7-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
at} cortexa7-vfp cortexa7t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-=
neon"
> =20
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES +=3D "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon"
> +ARMPKGARCH_tune-cortexa7hf =3D "cortexa7"
> +ARMPKGARCH_tune-cortexa7thf =3D "cortexa7"
> +ARMPKGARCH_tune-cortexa7hf-neon =3D "cortexa7"
> +ARMPKGARCH_tune-cortexa7thf-neon =3D "cortexa7"
> +TUNE_FEATURES_tune-cortexa7hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} corte=
xa7"
> +TUNE_FEATURES_tune-cortexa7thf ?=3D "${TUNE_FEATURES_tune-armv7athf} cor=
texa7"
> +TUNE_FEATURES_tune-cortexa7hf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-n=
eon} cortexa7"
> +TUNE_FEATURES_tune-cortexa7thf-neon ?=3D "${TUNE_FEATURES_tune-armv7athf=
-neon} cortexa7"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7ahf} cortexa7hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp corte=
xa7t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/mach=
ine/include/tune-cortexa8.inc
> index c1a3325..771537f 100644
> --- a/meta/conf/machine/include/tune-cortexa8.inc
> +++ b/meta/conf/machine/include/tune-cortexa8.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID =3D "a8"
> +DEFAULTTUNE ?=3D "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> =20
>  TUNEVALID[cortexa8] =3D "Enable Cortex-A8 specific processor optimizatio=
ns"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", " -m=
tune=3Dcortex-a8", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
> +ARMPKGARCH_tune-cortexa8 =3D "cortexa8"
> +ARMPKGARCH_tune-cortexa8t =3D "cortexa8"
> +ARMPKGARCH_tune-cortexa8-neon =3D "cortexa8"
> +ARMPKGARCH_tune-cortexa8t-neon =3D "cortexa8"
> +TUNE_FEATURES_tune-cortexa8 =3D "${TUNE_FEATURES_tune-armv7a} cortexa8"
> +TUNE_FEATURES_tune-cortexa8t =3D "${TUNE_FEATURES_tune-armv7at} cortexa8"
> +TUNE_FEATURES_tune-cortexa8-neon =3D "${TUNE_FEATURES_tune-armv7a-neon} =
cortexa8"
> +TUNE_FEATURES_tune-cortexa8t-neon =3D "${TUNE_FEATURES_tune-armv7at-neon=
} cortexa8"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7a=
} cortexa8-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
at} cortexa8-vfp cortexa8t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-=
neon"
> =20
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES +=3D "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
> +ARMPKGARCH_tune-cortexa8hf =3D "cortexa8"
> +ARMPKGARCH_tune-cortexa8thf =3D "cortexa8"
> +ARMPKGARCH_tune-cortexa8hf-neon =3D "cortexa8"
> +ARMPKGARCH_tune-cortexa8thf-neon =3D "cortexa8"
> +TUNE_FEATURES_tune-cortexa8hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} corte=
xa8"
> +TUNE_FEATURES_tune-cortexa8thf ?=3D "${TUNE_FEATURES_tune-armv7athf} cor=
texa8"
> +TUNE_FEATURES_tune-cortexa8hf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-n=
eon} cortexa8"
> +TUNE_FEATURES_tune-cortexa8thf-neon ?=3D "${TUNE_FEATURES_tune-armv7athf=
-neon} cortexa8"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8hf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7ahf} cortexa8hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8thf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp corte=
xa8t2hf-vfp-neon"
> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/mach=
ine/include/tune-cortexa9.inc
> index 9b16761..700394b 100644
> --- a/meta/conf/machine/include/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> @@ -1,5 +1,36 @@
> -CORTEX_ID =3D "a9"
> +DEFAULTTUNE ?=3D "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> =20
>  TUNEVALID[cortexa9] =3D "Enable Cortex-A9 specific processor optimizatio=
ns"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", " -m=
tune=3Dcortex-a9", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
> +ARMPKGARCH_tune-cortexa9 =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9t =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9-neon =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9t-neon =3D "cortexa9"
> +TUNE_FEATURES_tune-cortexa9 =3D "${TUNE_FEATURES_tune-armv7a} cortexa9"
> +TUNE_FEATURES_tune-cortexa9t =3D "${TUNE_FEATURES_tune-armv7at} cortexa9"
> +TUNE_FEATURES_tune-cortexa9-neon =3D "${TUNE_FEATURES_tune-armv7a-neon} =
cortexa9"
> +TUNE_FEATURES_tune-cortexa9t-neon =3D "${TUNE_FEATURES_tune-armv7at-neon=
} cortexa9"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7a=
} cortexa9-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
at} cortexa9-vfp cortexa9t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-=
neon"
> =20
> -require conf/machine/include/tune-cortexa.inc
> +# VFP Tunes
> +AVAILTUNES +=3D "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
> +ARMPKGARCH_tune-cortexa9hf =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9thf =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9hf-neon =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9thf-neon =3D "cortexa9"
> +TUNE_FEATURES_tune-cortexa9hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} corte=
xa9"
> +TUNE_FEATURES_tune-cortexa9thf ?=3D "${TUNE_FEATURES_tune-armv7athf} cor=
texa9"
> +TUNE_FEATURES_tune-cortexa9hf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-n=
eon} cortexa9"
> +TUNE_FEATURES_tune-cortexa9thf-neon ?=3D "${TUNE_FEATURES_tune-armv7athf=
-neon} cortexa9"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7ahf} cortexa9hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2hf-vfp corte=
xa9t2hf-vfp-neon"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p2u4WfPhYOuYlOsk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG4picACgkQN1Ujt2V2gBzIlQCdEIvjDUa11MVRAeELkCZDbyPC
3FkAoI9wwVoAJdiQmBTY2+HbrSoYTGmW
=yEUH
-----END PGP SIGNATURE-----

--p2u4WfPhYOuYlOsk--
