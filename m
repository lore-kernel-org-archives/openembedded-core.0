Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2878F60621
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 10:34:12 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id k204so54028086wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3r8OjHlwE8LzWe/tKdq5xEi8LzTW9UY56eIzWWLwPk0=;
	b=tjVUdsgrbgEF59M0qKFTXV3Vq0pdzI1k+1pRGFXMuaUgJ4/dvQ1xTw7wp7cT3ryKuL
	+vMPtnlXtidHHb+CamRNH7w1Hx2mcjr0xINXdblxUfV4b6qeONBtMBJIzxQFye/NA61p
	6AGCqU/Fn1TS5CHvEg7fdDt9jNXxe8sW4pUP/11Rj20DIwq4s7bxHWGBPX/OBAsxJSHb
	e0PiWQHj/6r1h57Y6lxJhx4gB256vhufzOW0QbmMBVwSqvfftxeRi+teZjmXc0F5qJ6R
	PiS99MWeujYxW7Ix1wnsa3yt+XDMPI6MRDzTqck4pAvD9TZTMhEE/rvXTx5Ns5JckwMB
	60PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3r8OjHlwE8LzWe/tKdq5xEi8LzTW9UY56eIzWWLwPk0=;
	b=OvqYrCPoGsMDnAdCrLsUgJyhj89EoMDyLFWH7o6sFoFQpo6WXCppvcZvRHXTYHHtrg
	GU2pcqa9YS8muRJDm7qX1SZ1iQUxGsXuxchJ391KRfcsyGquteelAqAeD0kuWCc3xoH8
	VygsTH8hfP/MLQN+HYyRAFSazt2HzJXrYSZdCQ9/fj2eIMQ6CCBR3T4iNVTv6N7yOHsc
	3U/TreiIN9oDMXVbUW1huqW8+c40hMGekEhpyWbpLJ719BgVBbeANiXCcd3BaTkfW2li
	8Ik0nQ9KmcbAWuiIwM+p8tX1IX+ER8OQwVWrDE0Kioje7t7cn6EsEItlBT6XAlexrWj3
	dqTw==
X-Gm-Message-State: ALyK8tLg12mhfkusx9w1kdVRWZslOELLDOT8gXJH+8nFD3JTZXxZMHpLRnt/sQHcHHPZWA==
X-Received: by 10.195.11.103 with SMTP id eh7mr9018033wjd.56.1465468453000;
	Thu, 09 Jun 2016 03:34:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id k3sm6329655wjh.7.2016.06.09.03.34.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Jun 2016 03:34:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 9 Jun 2016 12:34:38 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160609103438.GA2586@jama>
References: <cover.1464025858.git.akuster808@gmail.com>
	<57593804.9040403@gmail.com>
MIME-Version: 1.0
In-Reply-To: <57593804.9040403@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/72] Krogoth-next V2, pull request
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
X-List-Received-Date: Thu, 09 Jun 2016 10:34:13 -0000
X-Groupsio-MsgNum: 83244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2016 at 02:33:56AM -0700, akuster808 wrote:
> ping
>=20
> On 05/23/2016 09:55 PM, Armin Kuster wrote:
> > Rebased, removed per feedback and add a few new ones.
> >
> > Please consider this for krogoth-next.
> >
> > The following changes since commit da4bfbef46e52d2b647a837a47d0f5cb813b=
a8b2:
> >
> >    gdb: Backport patch to changes with AVX and MPX (2016-05-22 08:43:01=
 +0100)
> >
> > are available in the git repository at:
> >
> >    git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
> >    http://git.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/krogoth-next

This link is generated incorrectly, missing repository name.

> >
> > Alexander D. Kanevskiy (1):
> >    image.bbclass: don't execute compression commands multiple times
> >
> > Alexander Kanavin (1):
> >    arch-powerpc64.inc: disable the use of qemu usermode on ppc64
> >
> > Anders Darander (1):
> >    lib/oe/rootfs: Fix DEBUGFS generation, without openssl
> >
> > Andre McCurdy (1):
> >    image.bbclass: don't emit redundant IMAGE_CMD_xxx functions
> >
> > Andr=E9 Draszik (2):
> >    gdb: fix QA warning (uClibc)
> >    feature-arm-neon.inc: restore vfpv3-d16 support
> >
> > An=EDbal Lim=F3n (1):
> >    classes/base: get_lic_checksum_file_list imporve validaton of url's
> >
> > Armin Kuster (2):
> >    librsvg: Security fixes via update to 2.40.15
> >    python-numpy: fix build failure with python-matplotlib
> >
> > Awais Belal (1):
> >    mesa-demos: remove demos using obsolete screen surface
> >
> > Christopher Clark (1):
> >    linux-firmware: break out bnx2 mips firmware and WHENCE license
> >
> > Dengke Du (3):
> >    bash: fixed ptest run-builtins failed
> >    lttng-tools: filter random filename of ptest output
> >    coreutils: fix for native and nativesdk
> >
> > Denys Dmytriyenko (1):
> >    arch-armv7ve: inherit armv7a tunes file
> >
> > Diego Rondini (1):
> >    base-files: add some safety checks in profile
> >
> > Felipe F. Tonello (1):
> >    packagegroup-core-tools-profile: Enable valgrind on ARMv7a and above
> >
> > George McCollister (1):
> >    wic: fix path parsing, use last occurrence
> >
> > Ian Reinhart Geiser (1):
> >    classes/image_vm: allow different filesystems to be used for VM
> >      images.
> >
> > Ioan-Adrian Ratiu (2):
> >    wic: isoimage-isohybrid: add grubefi configfile support
> >    wic: isoimage-isohybrid: fix splash file paths
> >
> > Ismo Puustinen (1):
> >    libpcre: Fix CVE-2016-3191
> >
> > Joshua Lock (2):
> >    packagegroup-core-lsb: fix whitespace in meta-qt* warnings
> >    openssl: prevent ABI break from earlier krogoth releases

Krogoth was released with this ABI, so this is actually breaking the
ABI.

The ABI was changed in:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakuster/krogo=
th-next&id=3D73a43fc15e0463c39baaadecab78fb3ef51b8cd0
before krogoth was released, and I don't think that 1.0.2h introduced
more ABI changes in:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Dakuster/krogo=
th-next&id=3Df000d117532cdd4053ee3b3d9ee0c00a13da41ec

Please don't include this one in krogoth.

> >
> > Jussi Kukkonen (1):
> >    gcc-sanitizers: Depend on target gcc
> >
> > Klauer, Daniel (1):
> >    python-smartpm: Fix channel command --remove-all option (again)
> >
> > Leonardo Sandoval (2):
> >    scripts/lib/bsp/kernel.py: force patching when branch is machine
> >      branch is re-use
> >    populate_sdk_ext.bbclass : Show logfile in case the SDK EXT
> >      installation failed
> >
> > Maxin B. John (3):
> >    popt: fix dependencies and QA Issue
> >    bash: fix dependencies and QA Issue
> >    libxml2: fix dependencies and QA Issues
> >
> > Paul Eggleton (2):
> >    recipetool: create: fix picking up false npm package directories
> >    recipetool: create: fix falling back to declared license for npm
> >      packages
> >
> > Peter Kjellerstedt (1):
> >    metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo
> >
> > Randy Witt (1):
> >    populate_sdk_ext: Change lockedsigs task mismatch to a warning
> >
> > Raymond Tan (1):
> >    mkefidisk.sh: mount images as read-only
> >
> > Robert Yang (5):
> >    grub_git: set COMPATIBLE_HOST_armv7a to null
> >    insane.bbclass: remove workdir from package_qa_check_license()
> >    libxsettings-client: fix COPYING file
> >    cogl-1.0: set COMPATIBLE_HOST_armv4 to null
> >    gnu-efi: set COMPATIBLE_HOST_armv4 to null
> >
> > Ross Burton (25):
> >    package: ensure do_split_packages doesn't return duplicates
> >    busybox: don't build ar
> >    meta: add comments to explain autotools-brokensep use
> >    mx-1.0: inherit gtk-doc
> >    mx: move to autotools instead of autotools-brokensep
> >    bluez5: enable out-of-tree builds
> >    oeqa/sstatetests: add http_proxy to no-op hash test
> >    oeqa/sstatetests: remove temporary DL_DIRs in noop_samesigs
> >    autotools: add default for CACHED_CONFIGUREVARS
> >    python-pygobject: remove redundant gnome-common dependency
> >    gnome-desktop3: remove redundant gnome-common dependency
> >    webkitgtk: remove gnome-common dependency
> >    qemu: remove explicit but redundant native build dependencies
> >    mesa-gl: add missing MESA_CRYPTO to PACKAGECONFIG
> >    oeqa/selftest/buildoptions: remove buildhistory signature test
> >    eudev: add PACKAGECONFIG for hwdb
> >    dbus-test: install executables not libtool wrapper scripts
> >    mesa: add PACKAGECONFIG for gbm
> >    bitbake.conf: change APACHE_MIRROR to point at archive.apache.org
> >    image_types: fix image/compression dependency collection
> >    bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
> >    bitbake: fetch2: export DBUS_SESSION_BUS_ADDRESS to support
> >      authentication agents
> >    unzip: update SRC_URI
> >    openssh: change URI to http:
> >    zip: update SRC_URI
> >
> > Ruslan Bilovol (2):
> >    kernel-uimage: change target image to vmlinux
> >    libunwind: backport aarch64_be support
> >
> > Stephano Cetola (2):
> >    toolchain-scripts: replace source built-in call
> >    sysvinit-inittab: restrict labels to 4 chars
> >
> > Tristan Van Berkom (1):
> >    cross-localedef-native_2.22.bb: Use autotools configure
> >
> > Yuqing Zhu (1):
> >    alsa-lib: Fix incorrect appl pointer when mmap_commit() returns erro=
r.
> >
> >   bitbake/lib/bb/fetch2/__init__.py                  |    5 +-
> >   meta/classes/autotools.bbclass                     |    2 +
> >   meta/classes/base.bbclass                          |    3 +
> >   meta/classes/image-vm.bbclass                      |   13 +-
> >   meta/classes/image.bbclass                         |   12 +-
> >   meta/classes/image_types.bbclass                   |   36 +-
> >   meta/classes/insane.bbclass                        |    4 +-
> >   meta/classes/kernel-uimage.bbclass                 |    2 +-
> >   meta/classes/metadata_scm.bbclass                  |    5 +-
> >   meta/classes/package.bbclass                       |    6 +-
> >   meta/classes/populate_sdk_ext.bbclass              |    4 +-
> >   meta/classes/toolchain-scripts.bbclass             |    4 +-
> >   meta/conf/bitbake.conf                             |    3 +-
> >   meta/conf/machine/include/arm/arch-armv7ve.inc     |   19 +-
> >   meta/conf/machine/include/arm/feature-arm-neon.inc |    2 +-
> >   meta/conf/machine/include/arm/feature-arm-vfp.inc  |    2 +-
> >   .../machine/include/powerpc/arch-powerpc64.inc     |    3 +
> >   meta/lib/oe/package.py                             |    2 +-
> >   meta/lib/oe/rootfs.py                              |    2 +
> >   meta/lib/oeqa/selftest/buildoptions.py             |   59 -
> >   meta/lib/oeqa/selftest/sstatetests.py              |    8 +-
> >   meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb          |    1 +
> >   meta/recipes-bsp/grub/grub_git.bb                  |    1 +
> >   meta/recipes-connectivity/bluez5/bluez5.inc        |    5 +-
> >   .../bluez5/bluez5/out-of-tree.patch                |   26 +
> >   meta/recipes-connectivity/openssh/openssh_7.1p2.bb |    2 +-
> >   .../openssl/debian1.0.2/version-script.patch       |   31 +-
> >   meta/recipes-core/base-files/base-files/profile    |    6 +-
> >   meta/recipes-core/busybox/busybox/defconfig        |    2 +-
> >   meta/recipes-core/coreutils/coreutils_8.25.bb      |   14 +-
> >   meta/recipes-core/dbus/dbus-test_1.10.6.bb         |   13 +-
> >   .../glibc/cross-localedef-native_2.23.bb           |    9 +-
> >   meta/recipes-core/libxml/libxml2_2.9.3.bb          |    2 +-
> >   .../packagegroup-core-tools-profile.bb             |    6 +-
> >   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    3 +-
> >   meta/recipes-core/udev/eudev_3.1.5.bb              |    4 +-
> >   meta/recipes-devtools/gcc/gcc-sanitizers.inc       |    2 +-
> >   meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
> >   meta/recipes-devtools/git/git.inc                  |    1 +
> >   .../python/python-numpy/aarch64/_numpyconfig.h     |    1 +
> >   .../python/python-numpy/mips64/_numpyconfig.h      |    1 +
> >   .../python/python-numpy/powerpc64/_numpyconfig.h   |    1 +
> >   .../python/python-pygobject_3.18.2.bb              |    2 +-
> >   .../python-smartpm/smart-channel-remove-all.patch  |   33 +
> >   meta/recipes-devtools/python/python-smartpm_git.bb |    1 +
> >   meta/recipes-devtools/qemu/qemu.inc                |    5 +-
> >   meta/recipes-extended/bash/bash.inc                |    2 +-
> >   .../bash/bash/fix-run-builtins.patch               |   33 +
> >   meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
> >   .../packagegroups/packagegroup-core-lsb.bb         |    8 +-
> >   meta/recipes-extended/sysstat/sysstat.inc          |    1 +
> >   meta/recipes-extended/unzip/unzip_6.0.bb           |    2 +-
> >   meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb |    1 +
> >   meta/recipes-extended/zip/zip.inc                  |   26 -
> >   meta/recipes-extended/zip/zip_3.0.bb               |   39 +-
> >   .../gnome-desktop/gnome-desktop3_3.18.2.bb         |    2 +-
> >   .../{librsvg_2.40.13.bb =3D> librsvg_2.40.15.bb}     |    4 +-
> >   meta/recipes-graphics/cogl/cogl-1.0.inc            |    2 +
> >   .../libxsettings-client_0.10.bb                    |   13 +-
> >   ...dependant-on-obsolete-MESA_screen_surface.patch | 1592 +++++++++++=
+++++++++
> >   meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |    1 +
> >   meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb       |    2 +-
> >   meta/recipes-graphics/mesa/mesa.inc                |    6 +-
> >   .../recipes-graphics/mx/mx-1.0/fix-build-dir.patch |   46 -
> >   meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |    1 -
> >   meta/recipes-graphics/mx/mx.inc                    |    5 +-
> >   .../linux-firmware/linux-firmware_git.bb           |   20 +
> >   ...ls-filter-random-filename-of-tests-output.patch |   55 +
> >   meta/recipes-kernel/lttng/lttng-tools_git.bb       |    1 +
> >   ...fix-appl-pointer-not-correct-when-mmap_co.patch |  137 ++
> >   meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb     |    1 +
> >   meta/recipes-sato/webkit/webkitgtk_2.10.7.bb       |    3 +-
> >   .../libpcre/libpcre/CVE-2016-3191.patch            |  174 +++
> >   meta/recipes-support/libpcre/libpcre_8.38.bb       |    1 +
> >   ...roduce-build-support-for-aarch64_be-targe.patch |   33 +
> >   ...-wrong-big_endian-flag-in-aarch64_be-case.patch |   34 +
> >   meta/recipes-support/libunwind/libunwind_1.1.bb    |    2 +
> >   meta/recipes-support/popt/popt_1.16.bb             |    2 +
> >   scripts/contrib/mkefidisk.sh                       |    4 +-
> >   scripts/lib/bsp/kernel.py                          |    1 +
> >   scripts/lib/recipetool/create.py                   |    2 +-
> >   scripts/lib/recipetool/create_npm.py               |    2 +-
> >   scripts/lib/wic/plugin.py                          |    2 +-
> >   .../lib/wic/plugins/source/isoimage-isohybrid.py   |   55 +-
> >   84 files changed, 2395 insertions(+), 291 deletions(-)
> >   create mode 100644 meta/recipes-connectivity/bluez5/bluez5/out-of-tre=
e.patch
> >   create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-=
channel-remove-all.patch
> >   create mode 100644 meta/recipes-extended/bash/bash/fix-run-builtins.p=
atch
> >   delete mode 100644 meta/recipes-extended/zip/zip.inc
> >   rename meta/recipes-gnome/librsvg/{librsvg_2.40.13.bb =3D> librsvg_2.=
40.15.bb} (91%)
> >   create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0011-drop-de=
mos-dependant-on-obsolete-MESA_screen_surface.patch
> >   delete mode 100644 meta/recipes-graphics/mx/mx-1.0/fix-build-dir.patch
> >   create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-lttng-t=
ools-filter-random-filename-of-tests-output.patch
> >   create mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plu=
gin-fix-appl-pointer-not-correct-when-mmap_co.patch
> >   create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191=
=2Epatch
> >   create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-=
aarch64-introduce-build-support-for-aarch64_be-targe.patch
> >   create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0002-=
aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch
> >
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldZRjIACgkQN1Ujt2V2gBxnmQCePqKb42pBPZd9sLqPxlPc8u95
zqwAniXEl0MuQiYJhPrGviC0HWSKjNCI
=bT5K
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
