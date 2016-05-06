Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B20E776FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 14:44:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r12so9120129wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kBAj+LUHz5qcEdCG6dn/Apfjdb8pe/Ty4uIs02jB8+I=;
	b=bPK+CRYYcv9JLLPUwPhXoIRXHwJ/E9e0Iv7MVaQgpof0hIzDWATllOb3QLHD67buZn
	6JE1Rur8FUfWpy+XUIhcA/1ndk1i2EwytWEdlYbBIl9Wj13n5Btwec1TrCcRimhnyYZW
	xM0vr83KEP8UYRHcPYKOXVdljAzpFPpAFyTtTpDZyIDJozegeWEKw8fOtcv+iLfiNzDt
	iY+g8s+2YxWvmhyD/FcFJCTkBpGhEmkivIjmChmKH5BDVq7JQ05cNLcCAwEcM3WFxXwN
	fEMewWzaFWDKcf9QHWwG5hofFg3YjCs1HoNXcHd/4idj1kgRA/cZRIrPal9RHbLm4F9R
	Dypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kBAj+LUHz5qcEdCG6dn/Apfjdb8pe/Ty4uIs02jB8+I=;
	b=W7FFPGbb6lXUZ2HHtywbHew1Otpg/oIB3g2eh4k2OrkpWv4Y1pzgiH9F9leWm9LnsV
	xBuYgBYGAwojbxm7xrJ+brKEwJ74IWA55nSqxazmM9P4bdg2XiL51Bh8G1wIsv4PZCAg
	X5ZaNCYeTYsUHldAaYHkBMabFk1ZJwGJhrdRqnecnIDWDwWZCxa0aY2MuviaDKYqbTRF
	7NitBeXflMBZW+vb52H54ychkeb/p1dHbm8CvC0B45dPc/ySkuoiL1CtvgM9SAyW8iWe
	Z98JObd7WiPmj9AJxl5r1D8Qn42Y87xe+S0U3QZ5ozGeHA4tLau8B1MSS1BkLUsn4TTM
	+aOg==
X-Gm-Message-State: AOPr4FXtAf8FElFFZx8yQUG/p9XqPtMx2eUCT3GKoC2aBu5ElTXkCpk59Y7isfzW7B/yhg==
X-Received: by 10.28.168.76 with SMTP id r73mr9502153wme.44.1462545872213;
	Fri, 06 May 2016 07:44:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id y1sm3956118wjy.36.2016.05.06.07.44.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:44:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 May 2016 16:46:02 +0200
To: Joshua Lock <joshua.g.lock@intel.com>
Message-ID: <20160506144602.GG2544@jama>
References: <cover.1462544086.git.joshua.g.lock@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1462544086.git.joshua.g.lock@intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Fido][PATCH 00/21] Consolidated pull request
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
X-List-Received-Date: Fri, 06 May 2016 14:44:33 -0000
X-Groupsio-MsgNum: 81674
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YH9Qf6Fh2G5kB/85"
Content-Disposition: inline

--YH9Qf6Fh2G5kB/85
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2016 at 03:34:11PM +0100, Joshua Lock wrote:
> The following changes consist of:
> * security fixes
> * tzdata & tzcode backports
> * fido specific fixes submitted by the community
> * backports to support building on the updated Yocto Project autobuilder
>   cluster, with various newer distro versions than when fido was last rel=
eased
>=20
> A slightly divergent poky repository, with the correct change backported =
=66rom
> meta-yocto to update that local.conf.sample, has been pushed to:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Djoshuagl/=
fido-next
>=20
> The following changes since commit 1ebf604cae8d9bd3d2c10d06cd126e79e13732=
ee:
>=20
>   build-appliance-image: Update to fido head revision (2016-03-13 10:52:3=
7 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djoshuagl/fido-next
>=20
> Armin Kuster (6):
>   tzdata: update to 2016b
>   tzcode: update to 2016b
>   tzdata: update to 2016c
>   tzcode: update to 2016c
>   tzcode: update to 2016d
>   tzdata: update to 2016d
>=20
> Brad Mouring (2):
>   busybox: Backport patch to fix zcip false-conflict
>   busybox_git: Fix SRCREV
>=20
> Joshua Lock (1):
>   gtk+_2.24.25: backport a fix for building with newer host perl
>=20
> Mariano Lopez (1):
>   dhcp: CVE-2015-8605
>=20
> Richard Purdie (3):
>   testimage: Handle ipk/deb packaging format tests correctly
>   scripts/oe-pkgdata-util: Fix variable name in error handling
>   populate_sdk_base: Ensure PKGDATA_DIR exists
>=20
> Robert Yang (2):
>   libsdl: depends on libglu when x11
>   libsdl: depends on libglu when both x11 and opengl
>=20
> Ross Burton (5):
>   Revert "libsdl: depends on libglu when x11"

Why do you want to backport the change and also its revert?

>   libsdl: expand PACKAGECONFIG and enable native builds
>   base: check for existing prefix when expanding names in PACKAGECONFIG
>   xorg-lib: allow native building without x11 DISTRO_FEATURES
>   conf/local.conf.sample: comment out ASSUME_PROVIDED=3Dlibsdl-native
>=20
> Sona Sarmadi (1):
>   bind: CVE-2016-1285 CVE-2016-1286
>=20
>  meta/classes/base.bbclass                          |   5 +-
>  meta/classes/populate_sdk_base.bbclass             |   2 +-
>  meta/classes/testimage.bbclass                     |   6 +-
>  meta/conf/local.conf.sample                        |   7 +-
>  .../bind/bind/CVE-2016-1285.patch                  | 141 +++++++++
>  .../bind/bind/CVE-2016-1286_1.patch                |  78 +++++
>  .../bind/bind/CVE-2016-1286_2.patch                | 318 +++++++++++++++=
++++++
>  .../bind/bind/fix-typo-in-CVE-2016-1285.patch      |  31 ++
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |   4 +
>  .../dhcp/dhcp/CVE-2015-8605.patch                  | 101 +++++++
>  .../dhcp/dhcp/CVE-2015-8605_1.patch                | 131 +++++++++
>  meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb       |   2 +
>  ...wrong-comparison-of-source-IP-with-our-IP.patch |  34 +++
>  meta/recipes-core/busybox/busybox_1.23.1.bb        |   1 +
>  meta/recipes-core/busybox/busybox_git.bb           |   2 +-
>  ...code-native_2016a.bb =3D> tzcode-native_2016d.bb} |  12 +-
>  .../tzdata/{tzdata_2016a.bb =3D> tzdata_2016d.bb}    |   6 +-
>  .../gtk+/gtk+/Avoid-perl-warnings.patch            |  75 +++++
>  meta/recipes-gnome/gtk+/gtk+_2.24.25.bb            |   1 +
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  34 +--
>  meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |   1 +
>  scripts/oe-pkgdata-util                            |   2 +-
>  22 files changed, 960 insertions(+), 34 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.pat=
ch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.p=
atch
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.p=
atch
>  create mode 100644 meta/recipes-connectivity/bind/bind/fix-typo-in-CVE-2=
016-1285.patch
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.pat=
ch
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605_1.p=
atch
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong=
-comparison-of-source-IP-with-our-IP.patch
>  rename meta/recipes-extended/tzcode/{tzcode-native_2016a.bb =3D> tzcode-=
native_2016d.bb} (48%)
>  rename meta/recipes-extended/tzdata/{tzdata_2016a.bb =3D> tzdata_2016d.b=
b} (97%)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+/Avoid-perl-warnings.patch
>=20
> --
> 2.5.5
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YH9Qf6Fh2G5kB/85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcsrikACgkQN1Ujt2V2gByMOwCeMQLIMT1NQVKi26CNG0p03lOF
8IgAn3ijqNZUejTbx7oPodBMAlQXs2tV
=X1ws
-----END PGP SIGNATURE-----

--YH9Qf6Fh2G5kB/85--
