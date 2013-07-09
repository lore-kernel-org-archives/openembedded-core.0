Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1F06A8E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:48:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2013 08:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1028,1363158000"; d="scan'208";a="362626718"
Received: from unknown (HELO helios.localnet) ([10.252.121.245])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2013 08:49:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2013 16:48:32 +0100
Message-ID: <2468283.k63TDDaMWn@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373384160.git.sgw@linux.intel.com>
References: <cover.1373384160.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/59] Ready for Pull
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
X-List-Received-Date: Tue, 09 Jul 2013 15:48:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 July 2013 08:38:50 Saul Wold wrote:
> Paul, Ross:
> 
> This is the updated version with some additional patches dropped
> Please ACK for RP
> 
> 
> Richard:
> 
> There is an additional patch from Bruce pending on Poky for the kenrel.
> 
> I have included Robert's DESCRIPTION changes, along with the Image Test
> code.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit ccbce75335971abf5098a492755e92ca60cf67bd:
> 
>   lib/oeqa/runtime: add gcc test (2013-07-09 10:49:20 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Andrei Dinu (1):
>   e2fsprogs: upgrade to 1.42.8
> 
> Bernhard Guillon (1):
>   populate_sdk_base.bbclass: allow $OECORE_NATIVE_SYSROOT in
>     sdk_env_script
> 
> Bruce Ashfield (1):
>   linux-yocto/3.4: update to v3.4.52
> 
> Cristian Iorga (1):
>   glib-2.0: upgrade to 2.36.3
> 
> Felipe F. Tonello (1):
>   pulseaudio: Added consolekit dependency for
>     pulseaudio-module-console-kit package
> 
> Ionut Radu (8):
>   libassuan: Updated from 2.1.0 to 2.1.1
>   augeas: Update from 1.0.0 to 1.1.0
>   libxvmc: Update from 1.0.7 to 1.0.8
>   libxi: Update from 1.7.1 to 1.7.2
>   libgpg-error: Updated from 1.11 to 1.12
>   libxrender: Updated from 0.9.7 to 0.9.8
>   libxv: Updated from 1.0.8 to 1.0.9
>   ethtool: Updated from 3.9 to 3.10
> 
> Jackie Huang (3):
>   initscripts: overwrite default hostname.sh
>   initscripts: add dmesg file to /var/log
>   glib-2.0: add -march=i486 into CFLAGS automatically when needed.
> 
> Jonathan Liu (1):
>   qt4: add upstream QTBUG-31579 patch to fix polyline drawing regression
> 
> Kang Kai (2):
>   webkit: set COMPATIBLE_HOST for mips64
>   packagegroup-core-lsb: set COMPATIBLE_HOST to mips64
> 
> Khem Raj (1):
>   eglibc: Update 2.18 recipes to fix ppc/e500 failures
> 
> Laurentiu Palcu (6):
>   populate_sdk_base: fix bashism
>   sysvinit: allow users in shutdown group to perform halt/reboot
>   xuser-account: create separate recipe for xuser creation
>   connman: remove xuser creation, RDEPEND on xuser-account
>   xserver-nodm-init: remove xuser creation, RDEPEND on xuser-account
>   shutdown-desktop: give entire path in Exec field
> 
> Martin Jansa (8):
>   (lib)telepathy*: add missing dependency on libxslt-native
>   gst-plugins-bad: inherit gsettings
>   gst-plugins-base: add missing dependency on glib-2.0-native
>   taglib: add missing dependency on zlib
>   quota: inherit pkgconfig
>   libpam: inherit pkgconfig
>   systemtap: inherit pkgconfig
>   eglibc-locale: add missing dependency on
>     virtual/${TARGET_PREFIX}binutils
> 
> Mihaela Sendrea (1):
>   libxml2: Add ptest
> 
> Nathan Rossi (2):
>   scripts/runqemu: Add support for 'qemuzynq' machine
>   scripts/runqemu: Add support for 'qemumicroblaze' machine
>
> Paul Eggleton (1):
>   cmake: fix configure error if system Qt installation is broken
> 
> Radu Moisan (7):
>   elfutils: Upgrade to v0.155
>   rxvt-unicode: Upgrade to v9.18
>   ed: Upgrade to v1.8
>   libdmx: Upgrade to v1.1.3
>   apr: Upgrade to v1.4.8
>   apr-util: Upgrade to v1.5.2
>   usbutils: Upgrade to v007
> 
> Randy Witt (1):
>   systemd: Don't enable systemd services when native.
> 
> Robert Yang (3):
>   package_rpm.bbclass: make DESCRIPTION support newline
>   package_ipk.bbclass: make DESCRIPTION support newline
>   package_deb.bbclass: make DESCRIPTION support newline
> 
> Ross Burton (2):
>   gtkdoc: set the default docdir to ${S}, not ${B}
>   pango: drop unexplainable elfutils dependency
> 
> Saul Wold (7):
>   packagegroup-core-basic: remove libpam
>   util-linux: Use PACKAGECONFIG to control pam and system config options
>   man-pages: Update to 3.52
>   cmake: Update to 2.8.11.2
>   tzcode-native: Update to 2013d
>   kconfig-frontends: Update to 3.10
>   security_flags: Add addition recipes to the non pie list
> 
> Ting Liu (1):
>   qemu: use PACKAGECONFIG to address libaio/attr/libcap dependencies
> 
>  meta/classes/gtk-doc.bbclass                       |    3 +-
>  meta/classes/package_deb.bbclass                   |   14 +-
>  meta/classes/package_ipk.bbclass                   |   13 +-
>  meta/classes/package_rpm.bbclass                   |   20 +-
>  meta/classes/populate_sdk_base.bbclass             |    4 +-
>  meta/classes/systemd.bbclass                       |    2 +
>  meta/conf/distro/include/security_flags.inc        |   45 +-
>  .../usbutils/{usbutils_006.bb => usbutils_007.bb}  |    5 +-
>  meta/recipes-connectivity/connman/connman.inc      |   10 +-
>  .../telepathy/libtelepathy_0.3.3.bb                |    2 +-
>  .../telepathy/telepathy-glib_0.20.1.bb             |    3 +-
>  .../telepathy/telepathy-idle_0.1.14.bb             |    3 +-
>  .../telepathy/telepathy-mission-control_5.14.0.bb  |    4 +-
>  .../telepathy/telepathy-python_0.15.19.bb          |    1 +
>  .../eglibc/cross-localedef-native_2.18.bb          |    6 +-
>  meta/recipes-core/eglibc/eglibc-locale.inc         |    5 +
>  meta/recipes-core/eglibc/eglibc_2.18.bb            |    6 +-
>  .../add-march-i486-into-CFLAGS-automatically.patch |   39 +
>  .../{glib-2.0_2.36.2.bb => glib-2.0_2.36.3.bb}     |    5 +-
>  .../initscripts/initscripts-1.0/dmesg.sh           |   17 +
>  .../initscripts/initscripts-1.0/hostname.sh        |   12 +-
>  .../initscripts-1.0/logrotate-dmesg.conf           |    9 +
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 +-
>  meta/recipes-core/libxml/libxml2.inc               |   14 +-
>  meta/recipes-core/libxml/libxml2/run-ptest         |    3 +
>  meta/recipes-core/libxml/libxml2/runtest.patch     |  820 +++++++++
>  meta/recipes-core/libxml/libxml2_2.9.1.bb          |    7 +-
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 +-
>  meta/recipes-core/util-linux/util-linux.inc        |   11 +-
>  .../cmake/cmake-native_2.8.11.1.bb                 |    5 -
>  .../cmake/cmake-native_2.8.11.2.bb                 |    5 +
>  meta/recipes-devtools/cmake/cmake.inc              |    1 +
>  .../cmake/cmake/qt4-fail-silent.patch              |   55 +
>  .../cmake/{cmake_2.8.11.1.bb => cmake_2.8.11.2.bb} |    3 +
>  .../acinclude.m4                                   |    0
>  .../fallocate.patch                                |    0
>  .../mkdir.patch                                    |    0
>  .../remove.ldconfig.call.patch                     |    0
>  .../{e2fsprogs_1.42.7.bb => e2fsprogs_1.42.8.bb}   |    5 +-
>  .../elfutils/elfutils-0.155/arm_backend.diff       |  450 +++++
>  .../elfutils/elfutils-0.155/do-autoreconf.diff     |  215 +++
>  .../elfutils/elfutils-0.155/dso-link-change.patch  |   32 +
>  .../elfutils/elfutils-0.155/elf_additions.diff     |   61 +
>  .../elfutils-ar-c-fix-num-passed-to-memset.patch   |   23 +
>  .../elfutils-0.155/elfutils-robustify.patch        | 1756
> +++++++++++++++++++ .../elfutils/elfutils-0.155/hppa_backend.diff      | 
> 796 +++++++++ .../elfutils/elfutils-0.155/i386_dis.h             | 1657
> ++++++++++++++++++ .../elfutils/elfutils-0.155/m68k_backend.diff      | 
> 303 ++++
>  .../elfutils/elfutils-0.155/mempcpy.patch          |   24 +
>  .../elfutils/elfutils-0.155/mips_backend.diff      |  708 ++++++++
>  ...ssed-to-snprintf-for-invalid-sh_name-case.patch |   27 +
>  .../elfutils-0.155/redhat-portability.diff         | 1775
> +++++++++++++++++++ .../elfutils/elfutils-0.155/redhat-robustify.diff  |
> 1824 ++++++++++++++++++++ .../elfutils/elfutils-0.155/uclibc-support.patch 
>  |   91 +
>  .../elfutils/elfutils-0.155/x86_64_dis.h           | 1632
> ++++++++++++++++++ meta/recipes-devtools/elfutils/elfutils_0.155.bb   |  
> 84 +
>  ...ends_3.9.0.bb => kconfig-frontends_3.10.0.0.bb} |   11 +-
>  meta/recipes-devtools/qemu/qemu.inc                |    2 +
>  meta/recipes-extended/augeas/augeas_1.0.0.bb       |    6 -
>  meta/recipes-extended/augeas/augeas_1.1.0.bb       |    6 +
>  meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch |   43 -
>  meta/recipes-extended/ed/{ed_1.7.bb => ed_1.8.bb}  |   11 +-
>  .../ethtool/{ethtool_3.9.bb => ethtool_3.10.bb}    |    4 +-
>  .../{man-pages_3.50.bb => man-pages_3.52.bb}       |    5 +-
>  .../packagegroups/packagegroup-core-basic.bb       |    1 -
>  .../packagegroups/packagegroup-core-lsb.bb         |    2 +
>  meta/recipes-extended/pam/libpam_1.1.6.bb          |    2 +-
>  meta/recipes-extended/quota/quota_4.01.bb          |    2 +-
>  ...code-native_2013c.bb => tzcode-native_2013d.bb} |    5 +-
>  meta/recipes-graphics/pango/pango.inc              |    2 +-
>  .../x11-common/xserver-nodm-init.bb                |   13 +-
>  .../xorg-lib/{libdmx_1.1.2.bb => libdmx_1.1.3.bb}  |    4 +-
>  .../xorg-lib/{libxi_1.7.1.bb => libxi_1.7.2.bb}    |    5 +-
>  .../{libxrender_0.9.7.bb => libxrender_0.9.8.bb}   |    5 +-
>  .../xorg-lib/{libxv_1.0.8.bb => libxv_1.0.9.bb}    |    6 +-
>  .../{libxvmc_1.0.7.bb => libxvmc_1.0.8.bb}         |    5 +-
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    6 +-
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 +-
>  meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
>  .../gstreamer/gst-plugins-bad_0.10.23.bb           |    2 +-
>  .../gstreamer/gst-plugins-base_0.10.36.bb          |    2 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
>  meta/recipes-qt/qt4/qt4-4.8.5.inc                  |    1 +
>  ...-of-0-width-polylines-from-outside-the-de.patch |  148 ++
>  .../rxvt.desktop                                   |    0
>  .../rxvt.png                                       |  Bin
>  .../xwc.patch                                      |    0
>  .../{rxvt-unicode_9.17.bb => rxvt-unicode_9.18.bb} |    6 +-
>  .../shutdown-desktop/shutdown-desktop.bb           |    4 +-
>  meta/recipes-sato/web/web-webkit_git.bb            |    3 +
>  meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    3 +
>  .../apr/{apr-util_1.5.1.bb => apr-util_1.5.2.bb}   |    6 +-
>  .../apr/{apr_1.4.6.bb => apr_1.4.8.bb}             |    6 +-
>  .../{libassuan_2.1.0.bb => libassuan_2.1.1.bb}     |    4 +-
>  .../pkgconfig.patch                                |    0
>  .../{libgpg-error_1.11.bb => libgpg-error_1.12.bb} |    5 +-
>  meta/recipes-support/taglib/taglib_1.8.bb          |    2 +
>  .../user-creation/xuser-account_0.1.bb             |   27 +
>  scripts/runqemu                                    |    9 +-
>  scripts/runqemu-internal                           |   28 +
>  101 files changed, 12854 insertions(+), 212 deletions(-)
>  rename meta/recipes-bsp/usbutils/{usbutils_006.bb => usbutils_007.bb} (83%)
> create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automaticall
> y.patch rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.2.bb =>
> glib-2.0_2.36.3.bb} (89%) create mode 100644
> meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh create mode 100644
> meta/recipes-core/initscripts/initscripts-1.0/logrotate-dmesg.conf create
> mode 100644 meta/recipes-core/libxml/libxml2/run-ptest
>  create mode 100644 meta/recipes-core/libxml/libxml2/runtest.patch
>  delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
>  create mode 100644 meta/recipes-devtools/cmake/cmake/qt4-fail-silent.patch
>  rename meta/recipes-devtools/cmake/{cmake_2.8.11.1.bb => cmake_2.8.11.2.bb}
> (89%) rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 =>
> e2fsprogs-1.42.8}/acinclude.m4 (100%) rename
> meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 =>
> e2fsprogs-1.42.8}/fallocate.patch (100%) rename
> meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 =>
> e2fsprogs-1.42.8}/mkdir.patch (100%) rename
> meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.7 =>
> e2fsprogs-1.42.8}/remove.ldconfig.call.patch (100%) rename
> meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.7.bb =>
> e2fsprogs_1.42.8.bb} (93%) create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/arm_backend.diff create mode
> 100644 meta/recipes-devtools/elfutils/elfutils-0.155/do-autoreconf.diff
> create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/dso-link-change.patch create
> mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/elf_additions.diff create
> mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-ar-c-fix-num-passed-
> to-memset.patch create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-robustify.patch
> create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff create mode
> 100644 meta/recipes-devtools/elfutils/elfutils-0.155/i386_dis.h create mode
> 100644 meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
> create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/mempcpy.patch create mode
> 100644 meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
> create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/nm-Fix-size-passed-to-snprint
> f-for-invalid-sh_name-case.patch create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
> create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/redhat-robustify.diff create
> mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.155/uclibc-support.patch create
> mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/x86_64_dis.h
> create mode 100644 meta/recipes-devtools/elfutils/elfutils_0.155.bb rename
> meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.9.0.bb =>
> kconfig-frontends_3.10.0.0.bb} (78%) delete mode 100644
> meta/recipes-extended/augeas/augeas_1.0.0.bb
>  create mode 100644 meta/recipes-extended/augeas/augeas_1.1.0.bb
>  delete mode 100644 meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch
>  rename meta/recipes-extended/ed/{ed_1.7.bb => ed_1.8.bb} (49%)
>  rename meta/recipes-extended/ethtool/{ethtool_3.9.bb => ethtool_3.10.bb}
> (79%) rename meta/recipes-extended/man-pages/{man-pages_3.50.bb =>
> man-pages_3.52.bb} (81%) rename
> meta/recipes-extended/tzcode/{tzcode-native_2013c.bb =>
> tzcode-native_2013d.bb} (83%) rename
> meta/recipes-graphics/xorg-lib/{libdmx_1.1.2.bb => libdmx_1.1.3.bb} (79%)
> rename meta/recipes-graphics/xorg-lib/{libxi_1.7.1.bb => libxi_1.7.2.bb}
> (80%) rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.7.bb =>
> libxrender_0.9.8.bb} (81%) rename
> meta/recipes-graphics/xorg-lib/{libxv_1.0.8.bb => libxv_1.0.9.bb} (76%)
> rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.7.bb =>
> libxvmc_1.0.8.bb} (75%) create mode 100644
> meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-ou
> tside-the-de.patch rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17
> => rxvt-unicode-9.18}/rxvt.desktop (100%) rename
> meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 =>
> rxvt-unicode-9.18}/rxvt.png (100%) rename
> meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 =>
> rxvt-unicode-9.18}/xwc.patch (100%) rename
> meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.17.bb =>
> rxvt-unicode_9.18.bb} (92%) rename
> meta/recipes-support/apr/{apr-util_1.5.1.bb => apr-util_1.5.2.bb} (91%)
> rename meta/recipes-support/apr/{apr_1.4.6.bb => apr_1.4.8.bb} (92%) rename
> meta/recipes-support/libassuan/{libassuan_2.1.0.bb => libassuan_2.1.1.bb}
> (83%) rename meta/recipes-support/libgpg-error/{libgpg-error-1.11 =>
> libgpg-error-1.12}/pkgconfig.patch (100%) rename
> meta/recipes-support/libgpg-error/{libgpg-error_1.11.bb =>
> libgpg-error_1.12.bb} (85%) create mode 100644
> meta/recipes-support/user-creation/xuser-account_0.1.bb

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

