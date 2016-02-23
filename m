Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5D5772DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 15:03:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g62so204938905wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ccl6/c1AfuFkkI+RLCFKUKDJ/Vv3okpFnyaWlAWyn2c=;
	b=PM4+ykWnEZuQyirTiSdnW4xHipbH3JZwpd90T1sXNWPddVgm8Y1gSAAuVrTOamYfiC
	dLPhqOy2NZeoGsZG6Rwqm2PXnQaGk5ITbNgGj6nODZ3VCNYT7yUt5jmfm8lbcKqt63zj
	tfFYIk+rEFXNPXy3OSflpTnaurQLZNz3CXwNlQ48b/sSYO191SoHWk+19C9020dPAowU
	JGgvP0YdpYG2fV8bb3kULXVQDOxi0WpmbpwW9tfZbjoZly5exsXowDGp1lv2WJW9Y91K
	l56s2Rd1RFEvAp+yncUCrw3MdPfpXAQvUlqq2+7v2WJ8BNwKbsb6/rkWmOmAiF/e7KKY
	Xnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ccl6/c1AfuFkkI+RLCFKUKDJ/Vv3okpFnyaWlAWyn2c=;
	b=RbWpusqMgvYdmJbvKtiKuDBRSQihUO+JDL/+D6mP4DwsXNFeSowyN1JfK72HBIJB4N
	ahduUZUWYXptfDCcUzvK73vZlRa3s2r1LrtXh+0ACWQRKkkUrKtsEhjTpvFzkO8LCM00
	oeoIZmg8rzKZq+AFpBAx6t61SP7y/GxowVsKxuKaGzs+zFeCxZJPGoyUlqGKe5a8Nr1V
	obmrH7xQfPQldSs39d5/+gtM5APyKcfP0rc1x8USon/tPHBZD7r9Pza6OFEpTjaAx+9t
	8xUoWY69mdHg8s0mDiraQce4/9iKqR12/KvFTAmoOvNeANrgOPw1P+jk6UTwREYxa/pm
	9u/g==
X-Gm-Message-State: AG10YOQ9AOU0hkwdeNm00khxrsObz/Y3lacBKeC6RvT4jnbb/GetvoZ2ILyHbFg2y0wyLQ==
X-Received: by 10.28.50.133 with SMTP id y127mr18476634wmy.4.1456239787515;
	Tue, 23 Feb 2016 07:03:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m6sm22893532wje.21.2016.02.23.07.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 07:03:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2016 16:04:06 +0100
To: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <20160223150406.GA2564@jama>
References: <1455632918-31605-1-git-send-email-daniel.dragomir@windriver.com>
	<1455632918-31605-2-git-send-email-daniel.dragomir@windriver.com>
	<20160216145436.GA2581@jama> <56C3498D.1020508@windriver.com>
	<20160216162020.GB2581@jama>
MIME-Version: 1.0
In-Reply-To: <20160216162020.GB2581@jama>
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
X-List-Received-Date: Tue, 23 Feb 2016 15:03:09 -0000
X-Groupsio-MsgNum: 78538
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 05:20:20PM +0100, Martin Jansa wrote:
> On Tue, Feb 16, 2016 at 06:08:45PM +0200, Dragomir Daniel wrote:
> >=20
> >=20
> > On 02/16/2016 04:54 PM, Martin Jansa wrote:
> > > On Tue, Feb 16, 2016 at 04:28:38PM +0200, Daniel Dragomir wrote:
> > >> From: Cristian Bercaru <cristian.bercaru@windriver.com>
> > >>
> > >> This patch adds tunes for 32-bit armv8 platforms. The user can select
> > >> the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
> > >> and the Neon, crc and crypto extensions.
> > > This adds TUNEVALID for various tune features which aren't valid for
> > > armv7a and lower (keep in mind that feature-arm-vfp.inc is included f=
rom arch-armv5.inc)
> > >
> > > Did you test this with tune-test script to at least confirm that it at
> > > least still parses for all arm* DEFAULTTUNEs?
> > >
> >=20
> > I just took over my colleague work and I need to continue it.
> > Tunnings are new for meand I'm looking for a review about the actual=20
> > approach
> > from my colleague for adding ARMv8-a tunning for 32-bit.
> >=20
> > No, I didn't ran such script.
> > Can you please tell me how to run it or at least where is this located.
> > It's scripts/tune/test.sh from
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tu=
ne2-test=20
> > ?
> > It's there any Readme for it?
>=20
> There isn't one, basically run the script (update it if needed) and push
> your results somewhere (ideally in branch which contains results from
> jansa/tune2-test so that it shows only the smaller diffs in parsed
> results.
>=20
> It was shortly discussed in previous tune thread:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-February/1=
17395.html

Sorry I haven't received your reply
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg77=
197.html

I've imported your changes to:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/tun=
e-test&id=3D37f4a8ca7f9744520168e9407f1857e1dee3cbca

There are too many failures, can you try to run the script without your
patch first to see if it's already broken in current oe-core/master and
then again with your patch to see smaller diff?

Few tune files were removed since my last testing, but that doesn't
explain why most DEFAULTTUNEs fail in your test with:
  Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (arm1136j=
fs).
or similar.

Thanks

>=20
> >=20
> > Thanks,
> > Daniel
> >=20
> > >> Signed-off-by: Cristian Bercaru <cristian.bercaru@windriver.com>
> > >> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> > >> ---
> > >>   meta/conf/machine/include/arm/arch-armv7a.inc      |  1 -
> > >>   meta/conf/machine/include/arm/arch-armv8a.inc      | 65 ++++++++++=
++++++++++++
> > >>   meta/conf/machine/include/arm/feature-arm-neon.inc |  3 -
> > >>   meta/conf/machine/include/arm/feature-arm-vfp.inc  | 59 ++++++++++=
++++++----
> > >>   4 files changed, 112 insertions(+), 16 deletions(-)
> > >>   create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
> > >>   delete mode 100644 meta/conf/machine/include/arm/feature-arm-neon.=
inc
> > >>
> > >> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/co=
nf/machine/include/arm/arch-armv7a.inc
> > >> index d3b6f64..ac85fda 100644
> > >> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> > >> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> > >> @@ -6,7 +6,6 @@ TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURE=
S", "armv7a", " -march=3Darmv7-a
> > >>   MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "armv=
7a", "armv7a:", "" ,d)}"
> > >>  =20
> > >>   require conf/machine/include/arm/arch-armv6.inc
> > >> -require conf/machine/include/arm/feature-arm-neon.inc
> > >>  =20
> > >>   # Little Endian base configs
> > >>   AVAILTUNES +=3D "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 a=
rmv7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon"
> > >> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/co=
nf/machine/include/arm/arch-armv8a.inc
> > >> new file mode 100644
> > >> index 0000000..1b062b8
> > >> --- /dev/null
> > >> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> > >> @@ -0,0 +1,65 @@
> > >> +DEFAULTTUNE ?=3D "armv8a"
> > >> +
> > >> +TUNEVALID[armv8a] =3D "Enable instructions for ARMv8-a"
> > >> +TUNEVALID[crc] =3D "Enable CRC instrucitons for ARMv8-a"
> > >> +TUNECONFLICTS[armv8a] =3D "armv4 armv5 armv6 armv7 armv7a"
> > >> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "armv8a", "=
 -march=3Darmv8-a", "", d)}"
> > >> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "crc", "+cr=
c", "", d)}"
> > >> +MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "armv8=
a", "armv8a:", "" ,d)}"
> > >> +
> > >> +require conf/machine/include/arm/arch-armv7a.inc
> > >> +
> > >> +# Little Endian base configs
> > >> +AVAILTUNES +=3D "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4 armv8=
a-neon-vfpv4 armv8a-fp-armv8 armv8a-neon-fp-armv8 armv8a-crypto-neon-fp-arm=
v8"
> > >> +ARMPKGARCH_tune-armv8a ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-vfpv3 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-neon ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-vfpv4 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-neon-vfpv4 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-fp-armv8 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-neon-fp-armv8 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crypto-neon-fp-armv8 ?=3D "armv8a"
> > >> +TUNE_FEATURES_tune-armv8a ?=3D "arm armv8a vfp"
> > >> +TUNE_FEATURES_tune-armv8a-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv8a} =
vfpv3"
> > >> +TUNE_FEATURES_tune-armv8a-neon ?=3D "${TUNE_FEATURES_tune-armv8a} n=
eon"
> > >> +TUNE_FEATURES_tune-armv8a-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv8a} =
vfpv4"
> > >> +TUNE_FEATURES_tune-armv8a-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune-arm=
v8a} neon vfpv4"
> > >> +TUNE_FEATURES_tune-armv8a-fp-armv8 ?=3D "${TUNE_FEATURES_tune-armv8=
a} fp-armv8"
> > >> +TUNE_FEATURES_tune-armv8a-neon-fp-armv8 ?=3D "${TUNE_FEATURES_tune-=
armv8a} neon fp-armv8"
> > >> +TUNE_FEATURES_tune-armv8a-crypto-neon-fp-armv8 ?=3D "${TUNE_FEATURE=
S_tune-armv8a} crypto neon fp-armv8"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7a} armv8a armv8a-vfp"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv8a} armv8a-vfp-vfpv3"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv8a-vfpv3} armv8a-vfp-neon"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv8a-vfpv3} armv8a-vfp-vfpv4"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-vfpv4 =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv8a-vfpv4} armv8a-vfp-neon armv8a-vfp-neon-vfpv4"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 =3D "${PACKAGE_EXTRA_ARCHS=
_tune-armv8a} armv8a-vfp-fp-armv8"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-fp-armv8 =3D "${PACKAGE_EXTRA_=
ARCHS_tune-armv8a-fp-armv8} armv8a-vfp-neon-fp-armv8"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-neon-fp-armv8 =3D "${PACKAGE=
_EXTRA_ARCHS_tune-armv8a-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-armv8"
> > >> +
> > >> +# CRC configs
> > >> +AVAILTUNES +=3D "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon armv8a=
-crc-vfpv4 armv8a-crc-neon-vfpv4 armv8a-crc-fp-armv8 armv8a-crc-neon-fp-arm=
v8 armv8a-crc-crypto-neon-fp-armv8"
> > >> +ARMPKGARCH_tune-armv8a-crc ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crc-neon ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crc-neon-vfpv4 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crc-neon-fp-armv8 ?=3D "armv8a"
> > >> +ARMPKGARCH_tune-armv8a-crc-crypto-neon-fp-armv8 ?=3D "armv8a"
> > >> +TUNE_FEATURES_tune-armv8a-crc ?=3D "${TUNE_FEATURES_tune-armv8a} cr=
c"
> > >> +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?=3D "${TUNE_FEATURES_tune-armv=
8a-vfpv3} crc"
> > >> +TUNE_FEATURES_tune-armv8a-crc-neon ?=3D "${TUNE_FEATURES_tune-armv8=
a-neon} crc"
> > >> +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?=3D "${TUNE_FEATURES_tune-armv=
8a-vfpv4} crc"
> > >> +TUNE_FEATURES_tune-armv8a-crc-neon-vfpv4 ?=3D "${TUNE_FEATURES_tune=
-armv8a-neon-vfpv4} crc"
> > >> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?=3D "${TUNE_FEATURES_tune-a=
rmv8a-fp-armv8} crc"
> > >> +TUNE_FEATURES_tune-armv8a-crc-neon-fp-armv8 ?=3D "${TUNE_FEATURES_t=
une-armv8a-neon-fp-armv8} crc"
> > >> +TUNE_FEATURES_tune-armv8a-crc-crypto-neon-fp-armv8 ?=3D "${TUNE_FEA=
TURES_tune-armv8a-crypto-neon-fp-armv8} crc"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv8a} armv8a-crc-vfp"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv8a-crc} armv8a-vfp-vfpv3 armv8a-crc-vfp-vfpv3"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon =3D "${PACKAGE_EXTRA_ARCHS=
_tune-armv8a-crc-vfpv3} armv8a-vfp-neon armv8a-crc-vfp-neon"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 =3D "${PACKAGE_EXTRA_ARCH=
S_tune-armv8a-crc-vfpv3} armv8a-vfp-vfpv4 armv8a-crc-vfp-vfpv4"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-vfpv4 =3D "${PACKAGE_EXTRA=
_ARCHS_tune-armv8a-crc-vfpv4} armv8a-vfp-neon armv8a-crc-vfp-neon armv8a-vf=
p-neon-vfpv4 armv8a-crc-vfp-neon-vfpv4"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv8a-crc} armv8a-vfp-fp-armv8 armv8a-vfp-fp-crc-armv8"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8 =3D "${PACKAGE_EX=
TRA_ARCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon-fp-armv8 armv8a-crc-vfp=
-neon-fp-armv8"
> > >> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-neon-fp-armv8 =3D "${PAC=
KAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-a=
rmv8 armv8a-crc-vfp-crypto-neon-fp-armv8"
> > >> +
> > >> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/me=
ta/conf/machine/include/arm/feature-arm-neon.inc
> > >> deleted file mode 100644
> > >> index e8b2b85..0000000
> > >> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> > >> +++ /dev/null
> > >> @@ -1,3 +0,0 @@
> > >> -TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
> > >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", bb.=
utils.contains("TUNE_FEATURES", "vfpv4", " -mfpu=3Dneon-vfpv4", " -mfpu=3Dn=
eon", d), "" , d)}"
> > >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "neon", "=
-neon", "", d)}"
> > >> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/met=
a/conf/machine/include/arm/feature-arm-vfp.inc
> > >> index 3dfbeac..12a4e81 100644
> > >> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > >> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> > >> @@ -1,17 +1,52 @@
> > >>   TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
> > >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-=
vfp", "" ,d)}"
> > >> -
> > >>   TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 wi=
th 16 registers (vfpv3-d16) unit."
> > >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16",=
 " -mfpu=3Dvfpv3-d16", "", d)}"
> > >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16=
", "-vfpv3d16", "" ,d)}"
> > >> -
> > >>   TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with =
32 registers (vfpv3) unit."
> > >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", " =
-mfpu=3Dvfpv3", "", d)}"
> > >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", =
"-vfpv3", "" ,d)}"
> > >> -
> > >>   TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv=
4) unit."
> > >> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", =
"-vfpv4", "" ,d)}"
> > >> -
> > >> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
> > >> +TUNEVALID[neon] =3D "Enable vfpv3 and Neon SIMD accelerator unit."
> > >> +TUNEVALID[crypto] =3D "Enable ARMv8 crypto extension."
> > >>   TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call co=
nvention, requires VFP."
> > >> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.u=
tils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=3Dhard"=
, " -mfloat-abi=3Dsoftfp", d), "" ,d)}"
> > >> -ARMPKGSFX_EABI .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "callc=
onvention-hard", "vfp" ], "hf", "", d)}"
> > >> +
> > >> +python () {
> > >> +	if bb.utils.contains("TUNE_FEATURES", "crc", True, False, d):
> > >> +		d.appendVar("ARMPKGSFX_FPU", "-crc")
> > >> +
> > >> +	if bb.utils.contains("TUNE_FEATURES", "vfp", True, False, d):
> > >> +		d.appendVar("ARMPKGSFX_FPU", "-vfp")
> > >> +
> > >> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3d16", True, False, d):
> > >> +		d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv3-d16")
> > >> +		d.appendVar("ARMPKGSFX_FPU", "-vfpv3d16")
> > >> +
> > >> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3", True, False, d):
> > >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv3")
> > >> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv3")
> > >> +	elif bb.utils.contains("TUNE_FEATURES", "vfpv4", True, False, d):
> > >> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> > >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon-vfpv4")
> > >> +			d.appendVar("ARMPKGSFX_FPU", "-neon-vfpv4")
> > >> +		else:
> > >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dvfpv4")
> > >> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv4")
> > >> +	elif bb.utils.contains("TUNE_FEATURES", "fp-armv8", True, False, d=
):
> > >> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> > >> +			if bb.utils.contains("TUNE_FEATURES", "crypto", True, False, d):
> > >> +				d.appendVar("TUNE_CCARGS", " -mfpu=3Dcrypto-neon-fp-armv8")
> > >> +				d.appendVar("ARMPKGSFX_FPU", "-crypto-neon-fp-armv8")
> > >> +			else:
> > >> +				d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon-fp-armv8")
> > >> +				d.appendVar("ARMPKGSFX_FPU", "-neon-fp-armv8")
> > >> +		else:
> > >> +			d.appendVar("TUNE_CCARGS", " -mfpu=3Dfp-armv8")
> > >> +			d.appendVar("ARMPKGSFX_FPU", "-fp-armv8")
> > >> +	elif bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
> > >> +		d.appendVar("TUNE_CCARGS", " -mfpu=3Dneon")
> > >> +		d.appendVar("ARMPKGSFX_FPU", "-neon")
> > >> +
> > >> +	if bb.utils.contains("TUNE_FEATURES", "callconvention-hard", True,=
 False, d):
> > >> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=3Dhard")
> > >> +	else:
> > >> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=3Dsoftfp")
> > >> +	if bb.utils.contains("TUNE_FEATURES", [ "vfp", "callconvention-har=
d" ], True, False, d):
> > >> +		d.appendVar("ARMPKGSFX_EABI", "hf")
> > >> +}
> > >> --=20
> > >> 1.9.1
> > >>
> > >> --=20
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbMdOMACgkQN1Ujt2V2gBxjSQCguGosmCpjgdvBKSYS/ncF3uuk
X4gAniKv9VI7ctL2MY8wZM/0mBTXiSUF
=1+Q+
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
