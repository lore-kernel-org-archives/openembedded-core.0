Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7E41770C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 15:34:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 1so4703280wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Jh0AqC+yypSaBTiEWSGpq3/UkZ4Mplxhcvb01qFCFvc=;
	b=XrpH3pSAmxHofW/Wm+e+DeV5hqsjQCXlgnWblV4p+LchH4C11V+a2ij4i6jSp4P/XI
	KT+If/ukA+6ogkCDfRuQLEnaPJKDR2WRiqI+QV3JauaaNx+2BV8rFp/0VSVRHvJrLLBq
	zvvm2Up9iVqr8gDbDYKM/QvVLs7ytPlmzyM4R53pF/rXZwzpRpjzS/sJr0+iHuUasg/m
	jb13q104X0N49ymhVzGr8nfhwu6SpSbk0pE3uAu6p8G+cumVWL37JHM8X9uVfhjke8IQ
	e9Kne8Bg9x7MUj+FO2Di2b5fQ4Jor49v7HH0laLHgBanc7fkYMheIm3neELYHG6tDial
	/hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Jh0AqC+yypSaBTiEWSGpq3/UkZ4Mplxhcvb01qFCFvc=;
	b=lpOFyWva4vBEE+LDURSUF+uhoOcT6kzjact1JLhVTsBuKLmEUNhCJZU04k2W/1uHRK
	QSDc0bBDDsPjTuI3cC2BqrO9QY/XiyLOoLnjC3vz3Im8KxhG+HiI5QIj2hQfRW9nKOUH
	4HEFTA0sAtsaF78tbzqQzQ3dBHPg9gt7HXMMFQ1DHfjlPHkHKSad1t6Iou8AevcC0aV6
	VOp7/r6ooxUggnYLgUrZwz9hqpJNMk1YNYpdNv0jS02nFlaPN0pbb8suJgf+I6+zKaNz
	AYsIc/xfd4lgpLnpiXc8Kq58TdOnPnv9Lu86RcBJc6jJOd/rBCt5l8Ygno2Nlcv7OBVD
	gvhQ==
X-Gm-Message-State: AD7BkJJlmLaNBRAtyl7l+Si0FjiO59QwTlGif2odFbeA/AyNgXyUotDFkqzBr1JZLusZyA==
X-Received: by 10.28.87.139 with SMTP id l133mr4036066wmb.38.1457019295835;
	Thu, 03 Mar 2016 07:34:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s206sm7924151wmf.23.2016.03.03.07.34.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 07:34:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2016 16:36:59 +0100
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20160303153659.GG2569@jama>
References: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Thu, 03 Mar 2016 15:34:56 -0000
X-Groupsio-MsgNum: 79074
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline

--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2016 at 11:34:10PM +0000, Alejandro Hernandez wrote:
> udev has started to fail on new kernels (4.4), due to being deprecated in=
 favor
> of systemd's udev implementation. To maintain a sysvinit alternative we a=
lso
> need to provide an alternative to udev. Eudev is a fork of systemds udev,
> this new eudev recipe provides upstream udev 220 funcitonality.
>=20
> - libgudev is not provided by eudev as it was with udev before
> - We can now drop usbutils_007 since usbutils_008 is now compatible
>   also with eudev, and not only with systemd's udev
> - Adds new eudev package to maintainers.inc

is it expected that old udev package was only 0.5MB, eudev is 6MB?

Most of it is probably caused by /etc/udev/hwdb.d

> The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6e=
d9:
>=20
>   uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0=
000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib hsalejandro/eudev
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dhsalejandro/=
eudev
>=20
> Alejandro Hernandez (4):
>   eudev: Replaces udev with eudev for compatibility when sysvinit on
>     newer kernels
>   libgudev: Fix for new eudev implementation
>   usbutils: Fix for new eudev implementation
>   maintainers.inc: Add new eudev package and change maintainership for
>     udev
>=20
>  meta-yocto/conf/distro/include/maintainers.inc     |   2 +-
>  meta/conf/distro/include/default-providers.inc     |   2 +-
>  meta/recipes-bsp/usbutils/usbutils-008/iconv.patch |  41 --------
>  meta/recipes-bsp/usbutils/usbutils/iconv.patch     |  29 +++---
>  meta/recipes-bsp/usbutils/usbutils_007.bb          |  31 ------
>  meta/recipes-bsp/usbutils/usbutils_008.bb          |   5 +-
>  .../udev/{udev =3D> eudev}/devfs-udev.rules          |   0
>  meta/recipes-core/udev/{udev =3D> eudev}/init        |   0
>  meta/recipes-core/udev/{udev =3D> eudev}/links.conf  |   0
>  meta/recipes-core/udev/{udev =3D> eudev}/local.rules |   0
>  .../udev/{udev =3D> eudev}/permissions.rules         |   0
>  meta/recipes-core/udev/{udev =3D> eudev}/run.rules   |   0
>  meta/recipes-core/udev/{udev =3D> eudev}/udev-cache  |   0
>  .../udev/{udev =3D> eudev}/udev-cache.default        |   0
>  meta/recipes-core/udev/{udev =3D> eudev}/udev.rules  |   0
>  meta/recipes-core/udev/eudev_3.1.5.bb              |  83 +++++++++++++++
>  meta/recipes-core/udev/udev.inc                    | 112 ---------------=
------
>  ...yboard_force_release.sh-shell-script-path.patch |  35 -------
>  ...-Add-stdint.h-as-it-was-removed-from-mtd-.patch |  29 ------
>  ...c-Makefile.am-Check-for-input.h-and-input.patch |  52 ----------
>  .../recipes-core/udev/udev/add-install-ptest.patch |  86 ----------------
>  .../udev/udev/avoid-mouse-autosuspend.patch        |  25 -----
>  .../udev/udev/fix_rule-syntax-regex-ptest.patch    |  58 -----------
>  meta/recipes-core/udev/udev/run-ptest              |   5 -
>  meta/recipes-core/udev/udev_182.bb                 |   9 --
>  meta/recipes-gnome/libgudev/libgudev_230.bb        |   3 +-
>  26 files changed, 102 insertions(+), 505 deletions(-)
>  delete mode 100644 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
>  delete mode 100644 meta/recipes-bsp/usbutils/usbutils_007.bb
>  rename meta/recipes-core/udev/{udev =3D> eudev}/devfs-udev.rules (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/init (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/links.conf (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/local.rules (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/permissions.rules (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/run.rules (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/udev-cache (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/udev-cache.default (100%)
>  rename meta/recipes-core/udev/{udev =3D> eudev}/udev.rules (100%)
>  create mode 100644 meta/recipes-core/udev/eudev_3.1.5.bb
>  delete mode 100644 meta/recipes-core/udev/udev.inc
>  delete mode 100644 meta/recipes-core/udev/udev/0001-Fixing-keyboard_forc=
e_release.sh-shell-script-path.patch
>  delete mode 100644 meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdi=
nt.h-as-it-was-removed-from-mtd-.patch
>  delete mode 100644 meta/recipes-core/udev/udev/0002-configure.ac-Makefil=
e.am-Check-for-input.h-and-input.patch
>  delete mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
>  delete mode 100644 meta/recipes-core/udev/udev/avoid-mouse-autosuspend.p=
atch
>  delete mode 100644 meta/recipes-core/udev/udev/fix_rule-syntax-regex-pte=
st.patch
>  delete mode 100644 meta/recipes-core/udev/udev/run-ptest
>  delete mode 100644 meta/recipes-core/udev/udev_182.bb
>=20
> --=20
> 2.6.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbYWhoACgkQN1Ujt2V2gBytBQCeMCd/2eO1duMJg98Ag+pWm2cU
69sAn3ugoXbH8CYhJj7oKeGHTkERWAFF
=DahB
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
