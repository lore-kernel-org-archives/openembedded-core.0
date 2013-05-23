Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id BD0FC6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 07:43:46 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id z11so2604901pdj.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+NRX/UeAH0s4PWH6PoNd1zPag5U2U8pRrNjvgT3SuN0=;
	b=P4UjgDbOmgsQZ1k3lirxe8nittzyFkGl7L50QdpQ9K2ogEEr75anQ+UqFBXPETHMlb
	jUsC+HTCezXU4LS/k3Ux/j7T8EzYvs9c/ORQoPwpjZG5lTIgYwMt2Kq3icDVMUmf6qpk
	ajALadXlLSfkdgpo5hOV/31XUBrEgqKHXJ3EFlduGxq6Syxj6evg7QwT7PuFwl4ekDuh
	kAYU+Qy+NDr52KpjkW3wuGR98+JOqfld02IOmcaOp4yfc8c6qhw08xEWYyu6YJeMCz9D
	T8jZfvE1B0//7FIfFnYovaYTfa9xxSjeCBdKs+ZtDX1PtvwU3zbqYK5UMIOaYSdsTzW9
	1jNA==
X-Received: by 10.68.230.193 with SMTP id ta1mr11786642pbc.68.1369295027529;
	Thu, 23 May 2013 00:43:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	gh9sm10672064pbc.37.2013.05.23.00.43.44 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 23 May 2013 00:43:46 -0700 (PDT)
Date: Thu, 23 May 2013 09:43:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130523074342.GP32431@jama>
References: <cover.1369263517.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1369263517.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/34] Update patch set
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
X-List-Received-Date: Thu, 23 May 2013 07:43:47 -0000
X-Groupsio-MsgNum: 39628
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+Rs1qz93vBJxC1z"
Content-Disposition: inline

--R+Rs1qz93vBJxC1z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 04:03:05PM -0700, Saul Wold wrote:
> Richard,
>=20
> Here is a build and lightly boot tested.  There were some issues on the A=
B, but
> not related to this patch set.=20
>=20
> You probably need to look at Phil's cross patch and I think that Martin's=
 buildhistory
> patch is correct, if fixed my fetch issues locally.

buildhistory patch was sent only as RFC, because I did it quickly just
to be able to start new build (and check buildhistory results later) and
I believe that we should try to support both APIs if possible (or change
required bitbake version to include this fetcher change).

> Sau!
>=20
> The following changes since commit aeb704fee8b4ffeaeddcdb36ae4e1d62c264ce=
42:
>=20
>   scripts/bitbake: Handle the case where git isn't installed cleanly (201=
3-05-21 10:06:11 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/updates
>=20
> Andreas M=FCller (2):
>   glib-2.0: update to 2.36.2
>   glib-networking: update to 2.36.2
>=20
> Andrei Dinu (1):
>   SLiRP support in runqemu
>=20
> Cristian Iorga (1):
>   connman: upgrade to 1.14
>=20
> Ionut Radu (1):
>   qemu: Updated from 1.4.0 to 1.4.1
>=20
> Jack Mitchell (1):
>   sqlite3: update to 3.7.17
>=20
> Jesse Zhang (1):
>   perl-tests: convert to ptest
>=20
> Jonathan Liu (3):
>   util-linux: Update to 2.23
>   populate-volatile.sh: remove repeated leading slashes in TNAME
>   busybox: backport sulogin empty root password fix
>=20
> Kang Kai (1):
>   sudo: set CFLAGS for build mksigname and mksiglist
>=20
> Laurentiu Palcu (1):
>   runqemu: fix networking issues
>=20
> Martin Jansa (2):
>   kernel: Remove unnecessary cd and rm, fix MODULE_TARBALL_SYMLINK_NAME
>     creation
>   buildhistory: adapt to fetcher changes
>=20
> Phil Blundell (1):
>   cross: Clear do_populate_sysroot[stamp-extra-info] so that stamps are
>     not MACHINE specific
>=20
> Riku Voipio (1):
>   xserver-xorg: enable xvfb
>=20
> Ross Burton (6):
>   pixbufcache: update the loader cache when installing natively
>   gdk-pixbuf: remove native loader cache generation, use the class
>   librsvg: add more PACKAGECONFIG options
>   librsvg: clean up native depends
>   librsvg: small cleanups
>   librsvg: add sstate dependencies so that the SVG loader works at
>     staging time
>=20
> Saul Wold (8):
>   gnupg: Update to 2.0.20
>   desktop-file-utils: Update to 0.21
>   mklibs: Update to 0.1.37
>   libnl: Update to 3.2.22
>   mc: Update to 4.8.8
>   cmake: Update to 2.8.11
>   resolvconf: Update to 1.72
>   patch: diable xattr as default
>=20
> Tomas Frydrych (4):
>   cogl: further improvements
>   clutter.bbclass: removed unused function
>   clutter: further improvements
>   clutter-gst: removed no longer required configure fragment
>=20
>  meta/classes/buildhistory.bbclass                  |   5 +-
>  meta/classes/clutter.bbclass                       |   5 -
>  meta/classes/cross.bbclass                         |   1 +
>  meta/classes/kernel.bbclass                        |   9 +-
>  meta/classes/pixbufcache.bbclass                   |  20 ++
>  .../connman/{connman_1.13.bb =3D> connman_1.14.bb}   |   9 +-
>  .../{resolvconf_1.71.bb =3D> resolvconf_1.72.bb}     |   4 +-
>  .../busybox-sulogin-empty-root-password.patch      |  58 +++++
>  meta/recipes-core/busybox/busybox_1.20.2.bb        |   1 +
>  .../{glib-2.0_2.36.1.bb =3D> glib-2.0_2.36.2.bb}     |   4 +-
>  ...working_2.36.0.bb =3D> glib-networking_2.36.2.bb} |   4 +-
>  .../initscripts-1.0/populate-volatile.sh           |  14 +-
>  meta/recipes-core/util-linux/util-linux.inc        |   5 +-
>  ...-fix-loopcxt_check_size-to-work-with-blkd.patch |  60 +++++
>  ...etup-use-warn_size-for-regular-files-only.patch |  29 +++
>  .../util-linux/util-linux/mbsalign-license.patch   |  78 ------
>  .../util-linux/uclibc-__progname-conflict.patch    |  15 +-
>  .../{util-linux_2.22.2.bb =3D> util-linux_2.23.bb}   |  11 +-
>  .../cmake/cmake-native_2.8.10.2.bb                 |   7 -
>  meta/recipes-devtools/cmake/cmake-native_2.8.11.bb |   5 +
>  meta/recipes-devtools/cmake/cmake.inc              |   2 -
>  .../cmake/cmake/support-oe-qt4-tools-names.patch   |  70 ++----
>  .../cmake/{cmake_2.8.10.2.bb =3D> cmake_2.8.11.bb}   |   6 +-
>  ...e_0.15.bb =3D> desktop-file-utils-native_0.21.bb} |  10 +-
>  ...bs-native_0.1.35.bb =3D> mklibs-native_0.1.37.bb} |   4 +-
>  meta/recipes-devtools/patch/patch_2.7.1.bb         |   2 +
>  meta/recipes-devtools/perl/perl-5.14.3/run-ptest   |   2 +
>  meta/recipes-devtools/perl/perl-ptest.inc          |  49 ++++
>  meta/recipes-devtools/perl/perl-tests.inc          |  36 ---
>  meta/recipes-devtools/perl/perl_5.14.3.bb          |   2 +-
>  meta/recipes-devtools/qemu/qemu.inc                |   1 -
>  .../qemu/{qemu_1.4.0.bb =3D> qemu_1.4.1.bb}          |   8 +-
>  .../mc/{mc_4.8.7.bb =3D> mc_4.8.8.bb}                |   6 +-
>  meta/recipes-extended/sudo/sudo.inc                |   2 +-
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |   3 -
>  meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |  41 ++--
>  meta/recipes-graphics/clutter/clutter-1.0.inc      |  22 +-
>  meta/recipes-graphics/clutter/clutter-gst-1.0.inc  |   5 -
>  meta/recipes-graphics/cogl/cogl-1.0.inc            |  24 +-
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +-
>  .../gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch  |  63 -----
>  .../gnupg/{gnupg_2.0.19.bb =3D> gnupg_2.0.20.bb}     |   8 +-
>  .../libnl/{libnl_3.2.21.bb =3D> libnl_3.2.22.bb}     |   5 +-
>  .../{sqlite3_3071602.bb =3D> sqlite3_3071700.bb}     |   4 +-
>  scripts/runqemu                                    |   3 +
>  scripts/runqemu-ifup                               |  15 +-
>  scripts/runqemu-internal                           | 272 +++++++++++----=
------
>  47 files changed, 488 insertions(+), 523 deletions(-)
>  rename meta/recipes-connectivity/connman/{connman_1.13.bb =3D> connman_1=
=2E14.bb} (59%)
>  rename meta/recipes-connectivity/resolvconf/{resolvconf_1.71.bb =3D> res=
olvconf_1.72.bb} (88%)
>  create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-sulo=
gin-empty-root-password.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.1.bb =3D> glib-2.0_2.36=
=2E2.bb} (92%)
>  rename meta/recipes-core/glib-networking/{glib-networking_2.36.0.bb =3D>=
 glib-networking_2.36.2.bb} (85%)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-loop=
dev-fix-loopcxt_check_size-to-work-with-blkd.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-losetup-=
use-warn_size-for-regular-files-only.patch
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/mbsalign-lice=
nse.patch
>  rename meta/recipes-core/util-linux/{util-linux_2.22.2.bb =3D> util-linu=
x_2.23.bb} (55%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb
>  rename meta/recipes-devtools/cmake/{cmake_2.8.10.2.bb =3D> cmake_2.8.11.=
bb} (86%)
>  rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-nati=
ve_0.15.bb =3D> desktop-file-utils-native_0.21.bb} (57%)
>  rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.35.bb =3D> mklibs=
-native_0.1.37.bb} (80%)
>  create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/run-ptest
>  create mode 100644 meta/recipes-devtools/perl/perl-ptest.inc
>  delete mode 100644 meta/recipes-devtools/perl/perl-tests.inc
>  rename meta/recipes-devtools/qemu/{qemu_1.4.0.bb =3D> qemu_1.4.1.bb} (49=
%)
>  rename meta/recipes-extended/mc/{mc_4.8.7.bb =3D> mc_4.8.8.bb} (81%)
>  delete mode 100644 meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-20=
12-6085.patch
>  rename meta/recipes-support/gnupg/{gnupg_2.0.19.bb =3D> gnupg_2.0.20.bb}=
 (80%)
>  rename meta/recipes-support/libnl/{libnl_3.2.21.bb =3D> libnl_3.2.22.bb}=
 (90%)
>  rename meta/recipes-support/sqlite/{sqlite3_3071602.bb =3D> sqlite3_3071=
700.bb} (60%)
>=20
> --=20
> 1.8.1.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+Rs1qz93vBJxC1z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGdyK4ACgkQN1Ujt2V2gBw9ugCfaBjZeFT7FKuHRfx3n6S+RJvF
RjoAoJCtMc5KforE27EJJhCVLJdjvvBb
=/NoP
-----END PGP SIGNATURE-----

--R+Rs1qz93vBJxC1z--
