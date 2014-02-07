Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A1C136E918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 17:06:28 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so1635519eek.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2014 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9xSKfKzkJlBPGIYTE/hWrVd4xg1SS1z0h01Gb6VFyuA=;
	b=sRQCK33xbEysMe66AmU2iGsDikKo1HEp+SmcP+EAveN/70MASAu6Z6Xgz9q+UJn7XZ
	aUYXrmNCjxOKrlP3sycrMe67V/SVYpLU4y/4IlkI2+z+uq6ig1c/Mh/Fdf1sp9lQErj0
	ppWVl+vNL/s5O4A+mFtlQlCt0Ni8iPOd48SGBOZ3fRWE0SyD61KhBq9xpzMLSKaHq3Nk
	xvfGQsrYBuqc6SvhjIJP5WGxWInHzt1vYBe0opEqGypz4NXa6WQbJT+10hZ/M0IpEdbB
	DsZEpIjccKpo9pJ3qCi8hC4rL+vmMoTnnIlWis4bQNCcH/XIufvFAgc1+VrT6Rnf/YkJ
	RqMw==
X-Received: by 10.15.111.201 with SMTP id cj49mr17679616eeb.56.1391792788939; 
	Fri, 07 Feb 2014 09:06:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k6sm18614521eep.17.2014.02.07.09.06.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Feb 2014 09:06:27 -0800 (PST)
Date: Fri, 7 Feb 2014 18:06:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140207170643.GM3698@jama>
References: <cover.1391791450.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1391791450.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Consolidated Pull 00/21] Various Patches & some updates
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
X-List-Received-Date: Fri, 07 Feb 2014 17:06:29 -0000
X-Groupsio-MsgNum: 49951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oIlomvtVtXAVxSKT"
Content-Disposition: inline

--oIlomvtVtXAVxSKT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2014 at 08:55:26AM -0800, Saul Wold wrote:
> Richard,
>=20
> This patch set has been through the Autobuilder, the current failures
> related to the kernel update as we had a clean master build prior to this.
>=20
> Thanks
> 	Sau!
>=20
> The following changes since commit cda502815c6acf789e1a0db7a7a1a7015b4ef7=
1d:
>=20
>   build-appliance-image: Update to poky commit b37dd451a52622d5b570183a81=
583cc34c2ff555 (2014-02-06 15:36:47 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
>=20
> Alexandre Belloni (1):
>   matchbox-keyboard: daemonize launch
>=20
> Bruce Ashfield (1):
>   kernel: stop using -exec rm for deleting files
>=20
> Chen Qi (1):
>   initscripts: add initscripts-functions-dev package
>=20
> Chong Lu (2):
>   acl: enable ptest support
>   attr: enable ptest support
>=20
> Cristian Iorga (2):
>   sbc: upgrade to 1.2
>   bluez5: upgrade to 5.14
>=20
> Fathi Boudra (1):
>   systemtap: add aarch64 support
>=20
> Jason Plum (1):
>   meta/oe/lib/path.py - check mount points, not device
>=20
> Kai Kang (1):
>   eglibc-dbg: provides libc6-dbg
>=20
> Khem Raj (1):
>   ossp-uuid: Use alternative source mirror
>=20
> Koen Kooi (3):
>   systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
>   openssh: package sshd PAM config inside openssh-sshd package
>   openssh: drag in required PAM modules.
>=20
> Martin Jansa (1):
>   package.bbclass: add SHLIBSSEARCHDIRS to define where to search for
>     shlib providers

You can skip this one, RP had other ideas how to fix that and we should
probably do that.

> Paul Eggleton (1):
>   classes/populate_sdk_base: remove nostamp from do_populate_sdk
>=20
> Randy MacLeod (1):
>   jpeg and directfb: cosmetic, fix perms for patches
>=20
> Saul Wold (1):
>   rootfs_deb: Fix whitespace issue
>=20
> Stefan Stanacar (3):
>   testimage: add ability to export tests
>   lib/oeqa: add module for running tests outside of the build system
>   oeqa/utils: targetbuild: don't use bb.fetch anymore
>=20
>  meta/classes/kernel.bbclass                        |  18 ++-
>  meta/classes/package.bbclass                       |  26 +++-
>  meta/classes/populate_sdk_base.bbclass             |   1 -
>  meta/classes/rootfs_deb.bbclass                    |   2 +-
>  meta/classes/testimage.bbclass                     | 107 +++++++++++++---
>  meta/lib/oe/path.py                                |  13 +-
>  meta/lib/oeqa/oetest.py                            |  17 +--
>  meta/lib/oeqa/runexported.py                       | 140 +++++++++++++++=
++++++
>  meta/lib/oeqa/utils/targetbuild.py                 |  27 ++--
>  meta/recipes-connectivity/bluez5/bluez5_5.13.bb    |   5 -
>  meta/recipes-connectivity/bluez5/bluez5_5.14.bb    |   5 +
>  meta/recipes-connectivity/openssh/openssh_6.4p1.bb |   5 +-
>  meta/recipes-core/eglibc/eglibc-package.inc        |   2 +-
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |   4 +-
>  .../jpeg/jpeg-8d/debian-libjpeg7_7-1.diff          |   0
>  meta/recipes-core/systemd/systemd_208.bb           |   6 +
>  meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |   2 +-
>  .../directfb/directfb/fusion.patch                 |   0
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |   9 +-
>  .../sbc/{sbc_1.1.bb =3D> sbc_1.2.bb}                 |  10 +-
>  .../matchbox-keyboard/files/80matchboxkeyboard.sh  |   3 +
>  ...oxkeyboard.shbg =3D> matchbox-keyboard-daemon.sh} |   1 -
>  .../matchbox-keyboard/matchbox-keyboard_git.bb     |   8 +-
>  meta/recipes-support/attr/acl.inc                  |  14 ++-
>  meta/recipes-support/attr/acl/run-ptest            |   7 ++
>  meta/recipes-support/attr/attr.inc                 |  17 ++-
>  meta/recipes-support/attr/files/run-ptest          |   5 +
>  27 files changed, 373 insertions(+), 81 deletions(-)
>  create mode 100755 meta/lib/oeqa/runexported.py
>  delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.13.bb
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.14.bb
>  mode change 100755 =3D> 100644 meta/recipes-core/jpeg/jpeg-8d/debian-lib=
jpeg7_7-1.diff
>  mode change 100755 =3D> 100644 meta/recipes-graphics/directfb/directfb/f=
usion.patch
>  rename meta/recipes-multimedia/sbc/{sbc_1.1.bb =3D> sbc_1.2.bb} (45%)
>  create mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxk=
eyboard.sh
>  rename meta/recipes-sato/matchbox-keyboard/files/{80matchboxkeyboard.shb=
g =3D> matchbox-keyboard-daemon.sh} (99%)
>  create mode 100644 meta/recipes-support/attr/acl/run-ptest
>  create mode 100644 meta/recipes-support/attr/files/run-ptest
>=20
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oIlomvtVtXAVxSKT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL1EqMACgkQN1Ujt2V2gBxhfwCggaXwApGH8DH4Cy95tcCaK/JC
q/QAmgMesNpI3QMdT2xtJXF7orBugUiq
=s1wd
-----END PGP SIGNATURE-----

--oIlomvtVtXAVxSKT--
