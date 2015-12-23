Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3852573189
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:06:54 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l126so141555957wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mhdtKKFR4Zla9g5lNEZ8oATvcAV+9uF6cB9IGzBEELU=;
	b=c/KIitGQLevPUA3uzJPML7bKbnnBFcwdxcWEgvdxA5kdlK4h5vznBOk2NEOqB1J5RC
	vRqHiIILG57bbkW1OXE307yZLTd6aG7ZstLu57B1EJeNaCVE38ZHOd79xxEIVjiz0UUI
	ZqWiJ8TpJulZKS6jXWnt8f/duihxLOUD9rpwKCQwKIhnk2Zj2LFDtWs6iTQw/dJV2t1y
	+8jyYf/2xgIinuand1b4/EHfpPUvQyS31rAdkHecazbR+AJvtAGCECpJsjvcKVIm3aA+
	i8IzQxm4pRd0Gxnn/eYgszsKHkT41UlH+9cfNjANMrh/Yrf6J9OkGKCuA/OOWvasLmGn
	b/vQ==
X-Received: by 10.194.5.231 with SMTP id v7mr33170246wjv.52.1450865215358;
	Wed, 23 Dec 2015 02:06:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 67sm28700629wmm.6.2015.12.23.02.06.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 02:06:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Dec 2015 11:10:05 +0100
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20151223101005.GC2569@jama>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][master][RESEND 00/15] ARM tune fixes and improvements
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
X-List-Received-Date: Wed, 23 Dec 2015 10:06:55 -0000
X-Groupsio-MsgNum: 75210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline

--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 02:48:37PM +0100, Martin Jansa wrote:
> You can see the test script and results in various stages of this patch
> series in jansa/tune2-test branch:
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
2-test
> I'll add more test results here a bit later (running full test for all tu=
nes again)
>=20
> The following changes since commit 192da885e92d3b163b9c4e6b8151c9ecc6062b=
14:
>=20
>   build-appliance-image: Update to master head revision (2015-12-09 08:49=
:13 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib jansa/master-submi=
tted
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djansa/master-submitted

Ping, I've rebased this again.

> Martin Jansa (15):
>   sanity.bbclass: add more information to error message about
>     TUNE_PKGARCH missing in PACKAGE_ARCHS
>   tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
>   arch-armv7a: add missing space before ?=3D
>   arch-armv7a, tune-cortexa*: improve comment VFP -> HF
>   arch-armv7a, tune-cortexa*: improve indentation
>   arm/arch-arm*, tune-cortexa*, tune-thunderx.inc,
>     powerpac/arch-powerpc64.inc: Use normal assignment
>   arch-armv[456]*.inc: improve indentation like armv7a
>   arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and
>     PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp
>   arch-armv7a.inc: Fix PACKAGE_EXTRA_ARCHS for tune-armv7atb-vfpv3,
>     tune-armv7atb-vfpv3d16, cortexa7thf-neon-vfpv4
>   arch-armv7a.inc: add vfpv4 support also to softfp and big endiand
>     tunes
>   feature-arm-{neon,vfp}.inc: refactor and fix issues
>   feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
>   cortexa{7,15,17}: add VFPv4 tunes
>   arch-armv7ve: add tune include for armv7ve and use it from cortexa7
>     and cortexa15
>   tune-*: use mcpu instead of mtune for ARM tunes
>=20
>  meta/classes/sanity.bbclass                        |   3 +-
>  meta/conf/machine/include/arm/arch-arm.inc         |   3 +-
>  meta/conf/machine/include/arm/arch-arm64.inc       |   6 +-
>  meta/conf/machine/include/arm/arch-armv4.inc       |  16 +-
>  meta/conf/machine/include/arm/arch-armv5-dsp.inc   |  56 ++---
>  meta/conf/machine/include/arm/arch-armv5.inc       |  61 +++---
>  meta/conf/machine/include/arm/arch-armv6.inc       |  64 +++---
>  meta/conf/machine/include/arm/arch-armv7a.inc      | 230 +++++++++++----=
------
>  meta/conf/machine/include/arm/arch-armv7ve.inc     | 141 +++++++++++++
>  meta/conf/machine/include/arm/feature-arm-neon.inc |  19 +-
>  .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
>  meta/conf/machine/include/arm/feature-arm-vfp.inc  |  23 +--
>  .../machine/include/powerpc/arch-powerpc64.inc     |   2 +-
>  meta/conf/machine/include/tune-arm1136jf-s.inc     |   2 +-
>  meta/conf/machine/include/tune-arm920t.inc         |   2 +-
>  meta/conf/machine/include/tune-arm926ejs.inc       |   2 +-
>  meta/conf/machine/include/tune-arm9tdmi.inc        |   2 +-
>  meta/conf/machine/include/tune-cortexa15.inc       |  72 ++++---
>  meta/conf/machine/include/tune-cortexa17.inc       |  68 +++---
>  meta/conf/machine/include/tune-cortexa5.inc        |  52 ++---
>  meta/conf/machine/include/tune-cortexa7.inc        |  74 ++++---
>  meta/conf/machine/include/tune-cortexa8.inc        |  52 ++---
>  meta/conf/machine/include/tune-cortexa9.inc        |  52 ++---
>  meta/conf/machine/include/tune-cortexm1.inc        |   2 +-
>  meta/conf/machine/include/tune-cortexm3.inc        |   2 +-
>  meta/conf/machine/include/tune-cortexr4.inc        |   4 +-
>  meta/conf/machine/include/tune-ep9312.inc          |   2 +-
>  meta/conf/machine/include/tune-iwmmxt.inc          |   2 +-
>  meta/conf/machine/include/tune-strongarm1100.inc   |   2 +-
>  meta/conf/machine/include/tune-thunderx.inc        |   4 +-
>  meta/conf/machine/include/tune-xscale.inc          |   2 +-
>  31 files changed, 611 insertions(+), 412 deletions(-)
>  create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc
>=20
> --=20
> 2.6.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ6cv0ACgkQN1Ujt2V2gBzenACeI16dBN1M+l4m+tYuGhauUKuX
k2AAn1Tuvz1Hy5eq0OKeBaJIgQh4eG7W
=9GM3
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
