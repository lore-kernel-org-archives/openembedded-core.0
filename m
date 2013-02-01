Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U1Dww-0005d1-TC
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:34:49 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so2225935pac.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 02:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6MYrcwhQz5xUCA2leoAuXALkYMlmNmzv9zSceFiKZ0U=;
	b=qpM68SdbowTwbWM9m6TQU4Grl8DyYDLlVaV5Jwpy+nFmP9XKvNBlRZ2+z7t+aVt8lj
	19oIOvuKrUMWJY6LppcvmC4icsJ56zVfs9+6ZdNEsKqR3lO3zKwit2/BJ/LMmL6BRErf
	jedqvop6zFxs5+930cNLyyomt7v5aiLN42Y+ZKx//KWRlmcb8m6eorO0eeUyyLY9Ezud
	NK/bg9FRqc3LvEFwc9HkU1s2nmtsXVecVZ6MYI5/IkSpNMjEQT88Kvv+Fs5l3TeWaMUw
	GOgT6UfeBwHA8ygoovFeLftIX6sgK7kedjqsC5Yj0X1AndJB4S71wCymL9v4bjlt8Eds
	ViKw==
X-Received: by 10.68.135.98 with SMTP id pr2mr30767087pbb.101.1359713922309;
	Fri, 01 Feb 2013 02:18:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ot3sm8029646pbb.38.2013.02.01.02.18.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 02:18:41 -0800 (PST)
Date: Fri, 1 Feb 2013 11:18:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130201101842.GB3234@jama.dyndns-home.com>
References: <cover.1359706204.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1359706204.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/69] master-next & MUT (post M3)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 10:35:02 -0000
X-Groupsio-MsgNum: 34797
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2013 at 12:19:04AM -0800, Saul Wold wrote:
> Richard,
>=20
> Here is a group of M4 patches and updates that have been
> pending. I fixed a small issue I found with the package.bbclass
> changes in gkt-icon-cache.bbclass
>=20
> I have included the DEB Incremental image set along with
> the READ-Only Rootfs changes, this way they can get broader=20
> views and usage by the community.
>=20
> I have also include the GCC Multilib changes.
>=20
> I just started the AB on MUT without some failing patches
> (netbase and flex).
>=20
> Please watch it's status, There was a failure in the x86 GRUB
> build which may also point back to Flex.
>=20
> Sau!
>=20
> This include
> The following changes since commit 1489a69cecb1dcc3502a4c24beaea81e6ca6da=
cc:
>=20
>   harfbuzz: fix install of version.h (2013-01-31 12:29:18 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
>=20
> Andreas M=FCller (2):
>   systemd: systemd-analyse has moved to base_bindir
>   systemd: systemd-analyze remove python runtime dependencies
>=20
> Andrei Dinu (5):
>   blktool : upgrade to 4-6.1
>   libevent : upgrade to 4.0.21
>   Sudo : upgrade to 1.8.6p4
>   icu : upgrade to 50.1.2
>   e2fsprogs : upgrade to 1.42.6
>=20
> Bogdan Marinescu (3):
>   python-smartpm: multilib fixes
>   git: updated to 1.8.1.2
>   eglibc: don't list the same path twice in RTLDLIST
>=20
> Bruce Ashfield (1):
>   multilib: skip packages that provide virtual/kernel
>=20
> Chen Qi (6):
>   sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
>   image.bbclass: add a hook funtion to support readonly rootfs
>   core-image.bbclass: support read-only rootfs
>   populate-volatile.sh: improve this script
>   initscripts: let populate-volatile.sh create the /tmp link
>   initscripts: add read-only-rootfs-hook.sh script
>=20
> Constantin Musca (3):
>   autotools.bbclass: add EXTRACONFFUNCS variable
>   multilib.conf: add TARGET_ARCH & TARGET_SYS to MULTILIB_SAVE_VARNAME
>   gcc: enable multilib for target gcc
>=20
> Darren Hart (1):
>   qemux86-64: Disable paravirt guest, causes test failure on older
>     kernels
>=20
> David Nystr=F6m (1):
>   Lets face it, adding python dependencies is really a painful manual
>     process, due to setuptools/distutils, ignoring anything other than
>     python dependencies.
>=20
> Enrico Scholz (1):
>   systemd: honor ROOT_HOME
>=20
> Hongxu Jia (4):
>   apt-native:fix support configuring etc dir in apt.conf
>   rootfs_deb.bbclass:support incremental deb image generation
>   image.bbclass:support incremental deb image generation
>   package_deb.bbclass:support incremental deb image generation
>=20
> Ian Reinhart Geiser (1):
>   mesa-dri: add extra dri drivers
>=20
> Jeremy Stashluk (1):
>   gst-plugins-gl: add package recipe
>=20
> Kang Kai (1):
>   busybox: update test case du-k-works
>=20
> Khem Raj (3):
>   rpcbind: Dont use nss with uclibc
>   systemd: Drop ppc build breakage patch for test-unit-file
>   module-base.bbclass: Call make instead of oe_runmake in
>     do_make_scripts
>=20
> Marcin Juszkiewicz (1):
>   Flex: use proper m4 binary on target
>=20
> Mark Asselstine (1):
>   kernel: avoid copying unnecessary files during do_install
>=20
> Martin Jansa (6):
>   systemd: bump PE to provide upgrade path from meta-systemd recipe
>   license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
>   libfm: add dependency on libexif
>   console-tools, kbd: add RREPLACES/RPROVIDES/RCONFLICTS combo between
>     PN-dbg
>   initrdscripts: exclude conflicting packages from world-image

>   oe-core: add world-image

Please skip world-image, I'm working on better solution. Well it won't
break things, if you don't mind that it will be changed again next week
or so.
=20
> Peter Seebach (1):
>   pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3
>=20
> Phil Staub (1):
>   libaio: Fix MIPS system call interface
>=20
> Radu Moisan (2):
>   systemd: Remove -systemd postfix
>   avahi: Remove -systemd postfix
>=20
> Richard Purdie (12):
>   multilib.conf: Use BASELIB to set baselib, not hardcode the value
>   package: Rename splitfile functions to something more descriptive
>   package.bbclass: Improve kernel module handling
>   package.bbclass: Add a shortcut exit from the mkdir function
>   package.bbclass: Check FILES once, not once per loop iteration
>   package.bbclass: Avoid copying the datastore for FILES handling
>   package.bbclass: Move PKG handling code to emit_pkgdata
>   package.bbclass: Split out package_fixsymlinks function
>   package.bbclass: Tweak PACKAGEFUNCS
>   package.bbclass: Improve package_fixsymlinks
>   package: Create global package file list and use throughout
>     PACKAGEFUNCS
>   package.bbclass: Use expanded RDEPENDS in read_shlibdeps
>=20
> Ross Burton (4):
>   libcanberra: remove, migrated to meta-gnome
>   metacity: remove, migrated to meta-gnome
>   gst-plugins-bad: remove musicbrainz build-dependency
>   polkit: respect systemd DISTRO_FEATURE
>=20
> Roy.Li (1):
>   xinetd: enable tcp-wrappers support
>=20
> Saul Wold (5):
>   sqlite3: Update to 3.7.15.2
>   libnl: Update to 3.2.21
>   dhcp: Fix unshipped WARNINGS
>   module.bbclass: Allow for modules to be packaged seperate from ${PN}
>   gtk-icon-cache: Fix rdepends construction
>=20
> Tom Zanussi (2):
>   oprofile: add kernel dependency
>   oprofile: remove AX_KERNEL_VERSION from acinclude.m4
>=20
>  meta/classes/autotools.bbclass                     |   4 +-
>  meta/classes/buildhistory.bbclass                  |  11 +-
>  meta/classes/core-image.bbclass                    |   4 +
>  meta/classes/debian.bbclass                        |  28 +-
>  meta/classes/gtk-icon-cache.bbclass                |   5 +-
>  meta/classes/image.bbclass                         |  39 ++-
>  meta/classes/insane.bbclass                        |   4 +-
>  meta/classes/kernel.bbclass                        |   7 +-
>  meta/classes/license.bbclass                       |   3 +-
>  meta/classes/module-base.bbclass                   |   2 +-
>  meta/classes/module.bbclass                        |  19 +-
>  meta/classes/multilib.bbclass                      |   4 +-
>  meta/classes/package.bbclass                       | 202 +++++------
>  meta/classes/package_deb.bbclass                   | 377 +++++++++++++++=
++++--
>  meta/classes/rootfs_deb.bbclass                    |  58 +++-
>  meta/conf/multilib.conf                            |   4 +-
>  meta/lib/oe/classextend.py                         |   2 +-
>  meta/recipes-connectivity/avahi/avahi.inc          |   8 +-
>  meta/recipes-connectivity/dhcp/dhcp.inc            |   4 +-
>  meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb       |   2 +-
>  ...estsuite-du-du-k-works-fix-false-positive.patch |  35 ++
>  meta/recipes-core/busybox/busybox_1.20.2.bb        |   5 +-
>  .../console-tools/console-tools_0.3.2.bb           |   7 +
>  meta/recipes-core/eglibc/eglibc_2.17.bb            |   9 +-
>  meta/recipes-core/images/world-image.bb            |  10 +
>  .../initrdscripts/initramfs-framework_1.0.bb       |   2 +
>  .../initrdscripts/initramfs-live-boot_1.0.bb       |   2 +
>  .../initscripts/initscripts-1.0/bootmisc.sh        |   9 +-
>  .../initscripts-1.0/populate-volatile.sh           | 287 ++++++++--------
>  .../initscripts-1.0/read-only-rootfs-hook.sh       |  19 ++
>  .../initscripts/initscripts-1.0/volatiles          |   1 +
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |   3 +
>  meta/recipes-core/kbd/kbd_1.15.2.bb                |   3 +
>  ...it-file-Add-libsystemd-daemon.la-to-LDADD.patch |  32 --
>  meta/recipes-core/systemd/systemd_197.bb           |  20 +-
>  meta/recipes-core/sysvinit/sysvinit/rcS-default    |   4 +
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   2 +-
>  meta/recipes-devtools/apt/files/apt.conf           |   2 +-
>  .../e2fsprogs-1.42.1/remove.ldconfig.call.patch    |  33 --
>  .../acinclude.m4                                   |   0
>  .../fallocate.patch                                |   0
>  .../mkdir.patch                                    |   0
>  .../e2fsprogs-1.42.6/remove.ldconfig.call.patch    |  44 +++
>  .../{e2fsprogs_1.42.1.bb =3D> e2fsprogs_1.42.6.bb}   |   9 +-
>  meta/recipes-devtools/flex/flex.inc                |   7 +-
>  meta/recipes-devtools/gcc/gcc-4.7.inc              |   3 +-
>  .../gcc/gcc-4.7/use-ml-conf-files-from-B.patch     |  87 +++++
>  meta/recipes-devtools/gcc/gcc-common.inc           |  24 ++
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
>  meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 190 +++++++++++
>  meta/recipes-devtools/gcc/libgcc_4.7.bb            |  73 ++++
>  .../git/{git_1.8.0.2.bb =3D> git_1.8.1.2.bb}         |   6 +-
>  meta/recipes-devtools/pseudo/pseudo.inc            |   8 +-
>  meta/recipes-devtools/pseudo/pseudo_1.4.1.bb       |   8 -
>  meta/recipes-devtools/pseudo/pseudo_1.4.3.bb       |   8 +
>  meta/recipes-devtools/pseudo/pseudo_git.bb         |   4 +-
>  .../python-smartpm/smart-multilib-fixes.patch      |  22 ++
>  .../python/python-smartpm_1.4.1.bb                 |   3 +-
>  .../blktool/{blktool_4-6.bb =3D> blktool_4-6.1.bb}   |   6 +-
>  .../libaio/libaio_fix_for_mips_syscalls.patch      |  62 ++++
>  meta/recipes-extended/libaio/libaio_0.3.109.bb     |   3 +-
>  meta/recipes-extended/polkit/polkit_0.104.bb       |   4 +-
>  .../rpcbind/rpcbind/0001-uclibc-nss.patch          |  30 ++
>  .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |  60 ++++
>  meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |   6 +
>  meta/recipes-extended/sudo/files/libtool.patch     |  28 +-
>  .../sudo/{sudo_1.8.5p2.bb =3D> sudo_1.8.6p4.bb}      |   6 +-
>  meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   5 +-
>  .../metacity/remove-yelp-help-rules-var.patch      |  28 --
>  meta/recipes-gnome/gnome/metacity_2.34.13.bb       |  30 --
>  meta/recipes-graphics/mesa/mesa-dri.inc            |   4 +-
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   2 +-
>  meta/recipes-kernel/oprofile/oprofile.inc          |   2 +-
>  meta/recipes-kernel/oprofile/oprofile/acinclude.m4 |  19 --
>  meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |   2 +
>  .../gstreamer/gst-plugins-bad_0.10.23.bb           |   4 +-
>  .../gstreamer/gst-plugins-gl_0.10.3.bb             |  11 +
>  .../pulseaudio/libcanberra_0.29.bb                 |  32 --
>  .../icu/{icu_50.1.1.bb =3D> icu_50.1.2.bb}           |   6 +-
>  .../libevent/libevent-2.0.16_fix_for_x32.patch     |  47 ---
>  .../{libevent_2.0.16.bb =3D> libevent_2.0.21.bb}     |  11 +-
>  meta/recipes-support/libfm/libfm_1.1.0.bb          |   2 +-
>  .../libnl/{libnl_3.2.19.bb =3D> libnl_3.2.21.bb}     |   4 +-
>  .../{sqlite3_3.7.15.1.bb =3D> sqlite3_3.7.15.2.bb}   |   6 +-
>  scripts/create-recipe                              |  64 ++--
>  86 files changed, 1589 insertions(+), 667 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/testsuite-du=
-du-k-works-fix-false-positive.patch
>  create mode 100644 meta/recipes-core/images/world-image.bb
>  create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/read-on=
ly-rootfs-hook.sh
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-unit-file=
-Add-libsystemd-daemon.la-to-LDADD.patch
>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.1/remo=
ve.ldconfig.call.patch
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 =3D> e2fsprogs-=
1.42.6}/acinclude.m4 (100%)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 =3D> e2fsprogs-=
1.42.6}/fallocate.patch (100%)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.1 =3D> e2fsprogs-=
1.42.6}/mkdir.patch (100%)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.6/remo=
ve.ldconfig.call.patch
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.1.bb =3D> e2fspro=
gs_1.42.6.bb} (90%)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-f=
rom-B.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc
>  rename meta/recipes-devtools/git/{git_1.8.0.2.bb =3D> git_1.8.1.2.bb} (6=
6%)
>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
>  create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
>  create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-mul=
tilib-fixes.patch
>  rename meta/recipes-extended/blktool/{blktool_4-6.bb =3D> blktool_4-6.1.=
bb} (77%)
>  create mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_mi=
ps_syscalls.patch
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss=
=2Epatch
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpc=
svc-defines.patch
>  rename meta/recipes-extended/sudo/{sudo_1.8.5p2.bb =3D> sudo_1.8.6p4.bb}=
 (83%)
>  delete mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-ru=
les-var.patch
>  delete mode 100644 meta/recipes-gnome/gnome/metacity_2.34.13.bb
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10=
=2E3.bb
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
>  rename meta/recipes-support/icu/{icu_50.1.1.bb =3D> icu_50.1.2.bb} (55%)
>  delete mode 100644 meta/recipes-support/libevent/libevent/libevent-2.0.1=
6_fix_for_x32.patch
>  rename meta/recipes-support/libevent/{libevent_2.0.16.bb =3D> libevent_2=
=2E0.21.bb} (61%)
>  rename meta/recipes-support/libnl/{libnl_3.2.19.bb =3D> libnl_3.2.21.bb}=
 (90%)
>  rename meta/recipes-support/sqlite/{sqlite3_3.7.15.1.bb =3D> sqlite3_3.7=
=2E15.2.bb} (59%)
>=20
> --=20
> 1.8.0.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlELloIACgkQN1Ujt2V2gBwj4gCZAV2ZPgqmGVjOQbt4h9oNgzaA
33cAn0CZXdcy1I1zS3CFaHKVnNP2dzSC
=2r1t
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
