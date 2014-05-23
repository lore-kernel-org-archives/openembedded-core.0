Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f44.google.com (unknown [209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6FA6B835
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 17:53:39 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr17so4521189lab.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s5tYqELBJtFcX58oRicBpWv6hVIuEJ9K83FJUbzVKUw=;
	b=NYOuckWCsXGEa52NgXTc7SmFe7s6+FHU4Vbu8Es5HYrpwcEtVtVIB30KyBa/nDFfk8
	5+8152PuWw1Z+pDfdxps6ynLGeNeoHNP4WM0VZsQZaWEGJ9KcnLos240Cc8qdAc/SkS5
	+KvFcgHaRJMIkTBoUoEf0MdQLxA0tNBFYf5eGRpgO4sMUvJZugZATCR4hevpOOjTgu/v
	qDI6yefNYp8CLNnHm55zB3IVzE5dj5Vvl/HrnaCDnmGX+pcIO8fXOMXAPq2I2EsyKL2f
	GqnKRHyQP8IDAvJBUyYTBynNSMRxUaW0vMNPUmG5/uCvf1FApYeGA+is1i74/CiHyGQc
	RapA==
X-Received: by 10.112.185.105 with SMTP id fb9mr2521095lbc.72.1400867619774;
	Fri, 23 May 2014 10:53:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wm10sm3555646lbb.29.2014.05.23.10.53.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 May 2014 10:53:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 23 May 2014 19:53:40 +0200
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140523175340.GB2715@jama>
References: <cover.1400861586.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1400861586.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Daisy - Initial Pull 000/111] Please Review
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
X-List-Received-Date: Fri, 23 May 2014 17:53:43 -0000
X-Groupsio-MsgNum: 53504
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline

--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2014 at 09:19:05AM -0700, Saul Wold wrote:
> Richard,
>=20
> Here is the first pass at fixes, a number of these are requests
> from the list, along with the 29 CVE Fixes.
>=20
> I also have a bitbake patch set, which I will send to bitbake-devel.
>=20
> Sau!
>=20
>=20
> The following changes since commit 20625df0f88b1948bfc05be0d2cbdaa201c3b2=
f0:
>=20
>   linux-yocto/3.10: intel BSP configuration updates (2014-04-10 17:33:54 =
+0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/daisy
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
>=20
> Adrian Calianu (1):
>   oprofileui-server_git: add avahi-daemon to RDEPENDS list
>=20
> Alexandru DAMIAN (2):
>   toaster.bbclass: read list of files in image
>   toaster.bbclass: do not fail on non-existent files
>=20
> Andreas M=FCller (2):
>   shadow: fix building systemd with useradd-staticids.bbclass enabled
>   make menuconfig work for recent xfce environment
>=20
> Andreas Oberritter (1):
>   recipe_sanity.bbclass: avoid error when running 'bitbake -e'
>=20
> Bruce Ashfield (1):
>   linux-yocto/3.14: aufs, edgerouter config and -rt
>=20
> Chen Qi (7):
>   bind: add support for read-only rootfs
>   mmc-utils: fix compilation failure for mips64 target.
>   tcf-agent: add systemd support
>   runqemu-internal: add "console=3DttyS0" to ramfs image kernel parameters
>   gdb: add PACKAGECONFIG for babeltrace
>   openssh: fix for CVE-2014-2532
>   openssh: fix for CVE-2014-2653
>=20
> Chong Lu (1):
>   syslinux-native: fix parallel building issue
>=20
> Denys Dmytriyenko (5):
>   u-boot: fix beaglebone boot issue with large kernel images
>   cryptodev-linux: move to recipes-kernel to be shared with module and
>     tests
>   cryptodev-linux: create common .inc file to be shared by module and
>     tests
>   cryptodev-module: recipe for out-of-tree cryptodev device driver
>   cryptodev-tests: recipe for cryptodev test suite based on OpenSSL
>=20
> Drew Moseley (3):
>   systemd: Check for HAVE_POSIX_FALLOCATE
>   mesa-demos: Specify the lib dir to locate glut libraries
>   mesa-demos: Specify the lib dir properly.
>=20
> Hongxu Jia (1):
>   apr: remove the use of ${SHELL} to avoid bash/dash confliction
>=20
> Irina Patru (1):
>   distrodata.bbclass: Fix checkpkg functionality
>=20
> Jacob Kroon (2):
>   console-tools: Remove floating runtime dependency on flex
>   sstate-cache-management: Minor cleanup of help text
>=20
> Joe Slater (2):
>   pixbufcache: add error exit in pixbufcache_sstate_postinst
>   qemu: define PACKAGECONFIG[] for ssh2
>=20
> Joel Fernandes (1):
>   serial-getty service: Add xterm as default TERM
>=20
> Khem Raj (4):
>   libav: Add libsdl to DEPENDS only when x11 is enabled
>   uclibc: Add libgcc-initial to DEPENDS
>   procps: Do not detect 32/64 bit compiler options
>   lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
>=20
> Koen Kooi (5):
>   grub git: workaround debugedit problems
>   xdg-utils: reinstall xdg-terminal
>   xinput-calibrator: fix XDG launch
>   curl: make PACKAGES match with FILES/RRECOMMENDS
>   ca-certificates: generate CAfile for -native in do_install
>=20
> Laurentiu Palcu (1):
>   adt_installer: run autoreconf before configuring opkg
>=20
> Li Wang (2):
>   nss: CVE-2014-1492
>   nss: CVE-2013-1740
>=20
> Mark Hatle (1):
>   rpm: Fix rpm -V usage
>=20
> Martin Jansa (11):
>   libnotify: add dbus-glib dependency
>   icecc: don't create unnecessary 'ice' dirs in sysroots when disabled
>   gsettings-desktop-schemas: add missing dependency on intltool-native
>   qt4: Explicitly disable sqlite2
>   gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11
>     depends
>   gst-plugins-bad: add PACKAGECONFIG for schro, dc1394 and faac
>   gst-plugins-good: add PACKAGECONFIG for x11
>   package.bbclass: add SHLIBSSEARCHDIRS to define where to search for
>     shlib providers

Please drop this one ^, it got into the branch by accident (after I've
sent the right changes to ML), now I've removed it again.

>   gtk+: Add PACKAGECONFIG for directfb
>   defaultsetup: enable blacklist by default
>   lttng-modules: Fix build with older kernels for 2.3.3 as 2.4.0
>=20
> Matthieu Crapet (1):
>   openssh-sshd: host contamination fix
>=20
> Maxin B. John (3):
>   openssl: fix CVE-2014-0198
>   libxml2: fix CVE-2014-0191
>   bzip2: fix ptest execution failure
>=20
> Mike Crowe (1):
>   native.bbclass: Override TARGET_ flags too
>=20
> Ming Liu (2):
>   kernel: don't populate source symbolic link
>   ldconfig-native: also default to lib32 and lib64 directories
>=20
> Philip Tricca (1):
>   grub-efi: Use a variable to specify built-in grub modules.
>=20
> Radek Dostal (1):
>   distutils.bbclass: only modify *.py file if it contains path to be
>     removed
>=20
> Ricardo Ribalda Delgado (2):
>   package_manager: Fix Argument list too long
>   package_manager: Fix NoneType Object on do_populate_sdk
>=20
> Richard Purdie (12):
>   build-appliance-image: Update to head revision
>   build-appliance-image: Set branch to daisy for release
>   build-appliance-image: Update to  head revision
>   lib/oe/sdk: Ensure target directory exists before creating the link
>   initscripts: Fix PR reversal
>   base.bbclass: Fix multilib PREFERRED_VERSION handling
>   libiconv: Fix B !=3D S with uclibc builds
>   uclibc: Set MULTILIB_DIR based on baselib
>   gcc: Handle uclibc linker relocation for multilib support
>   attr: Fix uclibc builds
>   git: Fix various makefile flags
>   rt-tests: Fix warning flag typo
>=20
> Ross Burton (1):
>   freetype: disable harfbuzz
>=20
> Saul Wold (2):
>   report-error: Add posting in the public note
>   openssh: add /var/log/lastlog to volatile list
>=20
> Sebastian Wiegand (1):
>   distro_features_check.bbclass: fix wrong indentation
>=20
> Stefan Stanacar (2):
>   scripts/send-error-report: use a real server as the default
>   scripts/send-error-report: simple hack to use proxy from the
>     enviroment
>=20
> Tim Orling (1):
>   perl: fix missing Module::Metadata
>=20
> Tudor Florea (2):
>   curl: Backport a fix for a build issue
>   curl: remove inapporpriate file from curl release
>=20
> Tyler Hall (2):
>   python3: Substitute correct python version in shebang
>   python3: Revert python-config to distutils.sysconfig
>=20
> Valentin Popa (1):
>   wpa-supplicant: add libgcrypt as a dependencie
>=20
> Yue Tao (22):
>   Screen: fix for Security Advisory CVE-2009-1214
>   screen: fix for Security Advisory CVE-2009-1215
>   subversion: fix for Security Advisory CVE-2013-1849
>   subversion: fix for Security Advisory CVE-2013-4505
>   subversion: fix for Security Advisory CVE-2013-4131
>   subversion: fix for Security Advisory CVE-2013-1845
>   subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
>   subversion: fix for Security Advisory CVE-2013-4277
>   tiff: fix for Security Advisory CVE-2013-4231
>   openssl: fix for CVE-2010-5298
>   gst-ffmpeg: fix for Security Advisory CVE-2014-2263
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0865
>   gst-ffmpeg: fix for Security Advisory CVE-2014-2099
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0868
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0845
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0852
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0858
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0851
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0854
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0856
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0850
>   gst-ffmpeg: fix for Security Advisory CVE-2013-0849
>=20
>  meta/classes/base.bbclass                          |    6 +-
>  meta/classes/distro_features_check.bbclass         |    4 +-
>  meta/classes/distrodata.bbclass                    |   40 +-
>  meta/classes/distutils.bbclass                     |    5 +-
>  meta/classes/icecc.bbclass                         |   12 +-
>  meta/classes/kernel.bbclass                        |    2 +-
>  meta/classes/native.bbclass                        |    4 +
>  meta/classes/package.bbclass                       |   26 +-
>  meta/classes/pixbufcache.bbclass                   |    6 +-
>  meta/classes/recipe_sanity.bbclass                 |    1 -
>  meta/classes/report-error.bbclass                  |    1 +
>  meta/classes/toaster.bbclass                       |   31 +-
>  meta/conf/distro/defaultsetup.conf                 |    3 +-
>  meta/lib/oe/package_manager.py                     |   14 +-
>  meta/lib/oe/sdk.py                                 |    1 +
>  meta/lib/oe/terminal.py                            |   12 +-
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |    4 +-
>  meta/recipes-bsp/grub/grub_git.bb                  |    4 +
>  ...h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch |   74 +
>  meta/recipes-bsp/u-boot/u-boot_2013.07.bb          |    4 +-
>  .../init.d-add-support-for-read-only-rootfs.patch  |   65 +
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |    2 +
>  .../openssh/openssh/openssh-CVE-2014-2532.patch    |   22 +
>  .../openssh/openssh/openssh-CVE-2014-2653.patch    |  114 +
>  .../openssh/openssh/volatiles.99_sshd              |    1 +
>  meta/recipes-connectivity/openssh/openssh_6.5p1.bb |   16 +-
>  .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     |   24 +
>  .../openssl/openssl-CVE-2014-0198-fix.patch        |   23 +
>  .../recipes-connectivity/openssl/openssl_1.0.1g.bb |    1 +
>  .../wpa-supplicant/wpa-supplicant.inc              |    2 +-
>  .../console-tools-0.3.2/no-dep-on-libfl.patch      |   19 +
>  .../console-tools/console-tools_0.3.2.bb           |    1 +
>  .../ldconfig-default-to-all-multilib-dirs.patch    |   37 +
>  meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    4 +-
>  .../images/build-appliance-image_8.0.bb            |    4 +-
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>  meta/recipes-core/libxml/libxml2.inc               |    1 +
>  .../libxml/libxml2/libxml2-CVE-2014-0191-fix.patch |   37 +
>  .../systemd-serialgetty/serial-getty@.service      |    3 +-
>  .../systemd/systemd-pam-fix-fallocate.patch        |    4 +-
>  meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    1 +
>  meta/recipes-core/uclibc/uclibc-initial_git.bb     |    2 +-
>  meta/recipes-core/uclibc/uclibc.inc                |    1 +
>  meta/recipes-core/uclibc/uclibc_git.bb             |    2 +-
>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  128 +-
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc  |   11 +-
>  meta/recipes-devtools/gdb/gdb_7.6.2.bb             |    1 +
>  meta/recipes-devtools/git/git.inc                  |    3 +-
>  .../installer/adt-installer/adt_installer          |    1 +
>  ...mc.h-don-t-include-asm-generic-int-ll64.h.patch |   28 +
>  meta/recipes-devtools/mmc/mmc-utils_git.bb         |    4 +-
>  meta/recipes-devtools/perl/perl-5.14.3/config.sh   |    2 +-
>  .../recipes-devtools/perl/perl-rdepends_5.14.3.inc |    1 +
>  .../python/python3-native_3.3.3.bb                 |    3 +-
>  .../python/python3/python-config.patch             |   46 +
>  meta/recipes-devtools/python/python3_3.3.3.bb      |    1 +
>  meta/recipes-devtools/qemu/qemu.inc                |    1 +
>  .../rpm/rpm/rpm-verify-files.patch                 |   22 +
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>  .../subversion-CVE-2013-4131.patch                 |   42 +
>  .../subversion-CVE-2013-4277.patch                 |   15 +
>  .../subversion-CVE-2013-4505.patch                 |  130 +
>  .../subversion/subversion-CVE-2013-1845.patch      |  171 +
>  .../subversion-CVE-2013-1847-CVE-2013-1846.patch   |   53 +
>  .../subversion/subversion-CVE-2013-1849.patch      |   25 +
>  .../subversion/subversion-CVE-2013-4277.patch      |   15 +
>  .../subversion/subversion-CVE-2013-4505.patch      |  127 +
>  .../subversion/subversion_1.6.15.bb                |    6 +-
>  .../subversion/subversion_1.7.10.bb                |    3 +
>  .../syslinux-fix-parallel-building-issue.patch     |   38 +
>  meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    3 +-
>  .../tcf-agent/tcf-agent/tcf-agent.service          |   10 +
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    8 +-
>  meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    3 +-
>  .../procps/procps-3.2.8/detect_bitness.patch       |   26 +
>  meta/recipes-extended/procps/procps_3.2.8.bb       |    1 +
>  .../screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch  |   27 +
>  .../screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch  |   86 +
>  meta/recipes-extended/screen/screen_4.0.3.bb       |    2 +
>  meta/recipes-extended/shadow/shadow.inc            |    1 +
>  .../xdg-utils/0001-Reinstate-xdg-terminal.patch    |  672 ++
>  .../xdg-utils/xdg-utils_1.1.0-rc1.bb               |    5 +-
>  .../gnome/gsettings-desktop-schemas_3.10.1.bb      |    2 +-
>  meta/recipes-gnome/gtk+/gtk+.inc                   |    6 +-
>  meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |    2 +-
>  meta/recipes-graphics/freetype/freetype_2.5.2.bb   |    2 +
>  meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb     |    2 +-
>  .../xinput-calibrator/xinput-calibrator_git.bb     |    4 +
>  .../cryptodev/cryptodev-linux_1.6.bb               |   15 +
>  .../cryptodev/cryptodev-module_1.6.bb              |   18 +
>  .../cryptodev/cryptodev-tests_1.6.bb               |   23 +
>  .../cryptodev/cryptodev_1.6.inc}                   |   15 +-
>  ...pile-and-install-rules-for-cryptodev-test.patch |   69 +
>  ...talling-header-file-provided-by-another-p.patch |   28 +
>  ...ests-Makefile-usage-of-LDLIBS-vs.-LDFLAGS.patch |   29 +
>  ...-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch |   86 +
>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |   27 +
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |    4 +-
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      |   16 +-
>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |    4 +-
>  .../oprofile/oprofileui-server_git.bb              |    2 +-
>  .../0001-alac-fix-nb_samples-order-case.patch      |   30 +
>  .../0001-alsdec-check-block-length.patch           |   61 +
>  ...ac3dec-Check-coding-mode-against-channels.patch |   37 +
>  ...le-use-av_image_get_linesize-to-calculate.patch |   50 +
>  ...egtsenc-Check-data-array-size-in-mpegts_w.patch |   69 +
>  .../0001-eamad-fix-out-of-array-accesses.patch     |   29 +
>  ...t-ref-count-check-and-limit-fix-out-of-ar.patch |   29 +
>  ...01-huffyuvdec-Check-init_vlc-return-codes.patch |   87 +
>  .../0001-huffyuvdec-Skip-len-0-cases.patch         |   61 +
>  .../0001-mjpegdec-check-SE.patch                   |   32 +
>  ...heck-RLE-size-before-copying.-Fix-out-of-.patch |   34 +
>  ...001-roqvideodec-check-dimensions-validity.patch |   36 +
>  ...o-check-chunk-sizes-before-reading-chunks.patch |   51 +
>  .../gstreamer/gst-ffmpeg_0.10.13.bb                |   13 +
>  .../gstreamer/gst-plugins-bad_0.10.23.bb           |    3 +
>  .../gstreamer/gst-plugins-good_0.10.31.bb          |    6 +-
>  .../gstreamer/gstreamer1.0-plugins-good.inc        |    2 +-
>  meta/recipes-multimedia/libav/libav.inc            |    4 +-
>  .../libtiff/files/libtiff-CVE-2013-4231.patch      |   44 +
>  meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |    3 +-
>  meta/recipes-qt/qt4/qt4.inc                        |    2 +-
>  meta/recipes-rt/rt-tests/rt-tests.inc              |    2 +-
>  meta/recipes-support/apr/apr_1.4.8.bb              |    2 +-
>  meta/recipes-support/attr/attr.inc                 |    2 +-
>  meta/recipes-support/attr/ea-acl.inc               |    4 +-
>  .../ca-certificates/ca-certificates_20130610.bb    |    4 +
>  .../curl/generate_code_for_disable_manual.patch    |   38 +
>  .../curl/remove_inappropriate_file_from_rel.patch  | 8148 ++++++++++++++=
++++++
>  meta/recipes-support/curl/curl_7.35.0.bb           |    4 +-
>  meta/recipes-support/libiconv/libiconv_1.14.bb     |    2 +-
>  .../nss/files/nss-CVE-2013-1740.patch              |  916 +++
>  .../nss/files/nss-CVE-2014-1492.patch              |   68 +
>  meta/recipes-support/nss/nss.inc                   |    2 +
>  scripts/runqemu-internal                           |    2 +-
>  scripts/send-error-report                          |   48 +-
>  scripts/sstate-cache-management.sh                 |    6 +-
>  137 files changed, 12448 insertions(+), 201 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-u=
se-DEFAULT_LINUX_BOOT_ENV-environm.patch
>  create mode 100644 meta/recipes-connectivity/bind/bind/init.d-add-suppor=
t-for-read-only-rootfs.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE=
-2014-2532.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE=
-2014-2653.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/open=
ssl-CVE-2010-5298.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE=
-2014-0198-fix.patch
>  create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/n=
o-dep-on-libfl.patch
>  create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldcon=
fig-default-to-all-multilib-dirs.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-019=
1-fix.patch
>  create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-=
include-asm-generic-int-ll64.h.patch
>  create mode 100644 meta/recipes-devtools/python/python3/python-config.pa=
tch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/su=
bversion-CVE-2013-4131.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/su=
bversion-CVE-2013-4277.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/su=
bversion-CVE-2013-4505.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion/subversio=
n-CVE-2013-1845.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion/subversio=
n-CVE-2013-1847-CVE-2013-1846.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion/subversio=
n-CVE-2013-1849.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion/subversio=
n-CVE-2013-4277.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion/subversio=
n-CVE-2013-4505.patch
>  create mode 100644 meta/recipes-devtools/syslinux/files/syslinux-fix-par=
allel-building-issue.patch
>  create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.s=
ervice
>  create mode 100644 meta/recipes-extended/procps/procps-3.2.8/detect_bitn=
ess.patch
>  create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.=
2-CVE-2009-1215.patch
>  create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.=
3-CVE-2009-1214.patch
>  create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinst=
ate-xdg-terminal.patch
>  create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-linux_1.6.bb
>  create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
>  create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.6.bb
>  rename meta/{recipes-connectivity/openssl/cryptodev-linux_1.6.bb =3D> re=
cipes-kernel/cryptodev/cryptodev_1.6.inc} (43%)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Add-the-comp=
ile-and-install-rules-for-cryptodev-test.patch
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-inst=
alling-header-file-provided-by-another-p.patch
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0002-Fix-tests-Ma=
kefile-usage-of-LDLIBS-vs.-LDFLAGS.patch
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-=
rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-alac-fix-nb_samples-order-case.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-alsdec-check-block-length.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-atrac3dec-Check-coding-mode-against-channels.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-eamad-fix-out-of-array-accesses.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-huffyuvdec-Check-init_vlc-return-codes.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-huffyuvdec-Skip-len-0-cases.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-mjpegdec-check-SE.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-roqvideodec-check-dimensions-validity.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/=
0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch
>  create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-201=
3-4231.patch
>  create mode 100644 meta/recipes-support/curl/curl/generate_code_for_disa=
ble_manual.patch
>  create mode 100644 meta/recipes-support/curl/curl/remove_inappropriate_f=
ile_from_rel.patch
>  create mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
>  create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
>=20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN/iyQACgkQN1Ujt2V2gBwSaQCfRBzrA95ZajJz69hi931Bwrvc
8MoAn0EtEHE9shi6zpIkUQhadiY5DdJ8
=KM00
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
