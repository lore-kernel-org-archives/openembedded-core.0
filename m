Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoneU-0002KU-8S
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 04:27:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2011 19:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,314,1309762800"; d="scan'208";a="35598795"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2011 19:22:49 -0700
Message-ID: <4E3A0279.5040705@linux.intel.com>
Date: Wed, 03 Aug 2011 19:22:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
Subject: Re: [CONSOLIDATED PULL v2 00/33] Re-Spun with Tom's siteinfo update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 02:27:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 03:10 PM, Saul Wold wrote:
> Richard,
>
> This has been built, I have done a first pass review over these
> and most seem correct to me, Koen's patch to make the icons dependency
> dynamic seems Ok to me, but I am not sure when the RDEPENDS are processed
> compared to when populate_packages_append() is run, will this
> RDEPENDS be updated correctly.
>
> I built world yesterday with some of the same failures seen
> in master
>
> Sau!
>
>
> The following changes since commit fbb734e5753655de30c82c0a036c9043820e02cb:
>
>    multilib: Use BPN instead of PN for style like lib${PN} (2011-08-03 18:06:04 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
> Dmitry Eremin-Solenikov (1):
>    eglibc: fix build for armv4 machines
>
> Kang Kai (1):
>    libnewt: update to 0.52.13
>
> Koen Kooi (1):
>    gtk-icon-cache bbclass: only add runtime dependencies on
>      hicolor-icon-theme when installing icons
>    ** RP - Will the RDEPENDS be updated correctly? **
>
> Kumar Gala (2):
>    binutils: Add support for powerpc e5500 core
>    eglibc_2.13: Add support for handling sqrt&  sqrtf on powerpc
>
> Lianhao Lu (1):
>    environment files: Added and unified version related variables.
>
> Martin Jansa (2):
>    polkit: depend on intltool-native instead of intltool
>    libfm: depend on intltool-native instead of intltool
>
> Mei Lei (1):
>    aspell: upgrade from 0.60.6 to 0.60.6.1
>
> Noor, Ahsan (3):
>    bison: Add dependency on flex-native
>    kernel,cml1.bbclass: Move menuconfig to cml1
>    kernel.bbcalss: Added do_savedefconfig task.
>
> Saul Wold (2):
>    glibc: Remove unused version
>    libxt: Add depends for util-linux and libxcb
>
> Tom Rini (10):
>    connman_test.sh: Rework for busybox 'ps'
>    sudo: Drop sudo_cv_uid_t_len from site files
>    tcl: Add tcl_cv_api_serial to siteinfo
>    Various site files: Drop monotone
>    Various siteinfo files: Consolidate ac_cv_func_getaddrinfo
>    Various siteinfo files: Drop enca section
>    Various siteinfo files: Consolidate va_copy/__va_copy/va_val_copy
>    site/common-linux: Add ac_cv_file__dev_zero=yes
>    siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to
>      uclibc
>    Various siteinfo: Drop rp-pppoe variables

This set from Tom has been updated in sgw/stage to patch Tom's latest
change to address a toolchain failure.

Sau!

>
> Yu Ke (1):
>    SRC_URI, S: use BPN instead of PN for multilib case
>
> Zhai Edwin (8):
>    lighttpd: Upgrade to 1.4.29
>    libsoup-2.4: Upgrade to 2.34.2
>    libassuan: Upgrade to 2.0.2
>    gpgme: Upgrade to 1.3.1
>    parted: Upgrade to 3.0
>    apr: Upgrade to 1.4.5
>    apr-util: Upgrade to 1.3.12
>    xserver-nodm-init: Fix X start failure on some platform
>
>   .../farsight/farsight2_0.0.9.bb                    |    2 +-
>   .../loudmouth/loudmouth_1.4.0.bb                   |    2 +-
>   .../opensync/libopensync-plugin_0.36.inc           |    2 +-
>   .../telepathy/telepathy-farsight_0.0.7.bb          |    2 +-
>   .../telepathy/telepathy-gabble_0.7.8.bb            |    2 +-
>   .../recipes-connectivity/wbxml/wbxml2_0.9.2.bb     |    2 +-
>   .../recipes-gnome/gcalctool/gcalctool_5.7.32.bb    |    2 +-
>   .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |    2 +-
>   .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    2 +-
>   meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb         |    2 +-
>   meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb        |    2 +-
>   .../matchbox-themes-extra_git.bb                   |    2 +-
>   .../recipes-support/poppler/poppler-data_0.1.bb    |    2 +-
>   meta-demoapps/recipes-support/poppler/poppler.inc  |    2 +-
>   meta/classes/cml1.bbclass                          |   12 +
>   meta/classes/gtk-icon-cache.bbclass                |    8 +-
>   meta/classes/kernel.bbclass                        |   17 +-
>   meta/classes/toolchain-scripts.bbclass             |    3 +
>   meta/conf/distro/include/tcmode-default.inc        |    1 -
>   .../omap3-sgx-modules_1.3.13.1397.bb               |    4 +-
>   meta/recipes-bsp/zaurusd/zaurusd_svn.bb            |    2 +-
>   .../galago/galago-daemon_0.5.1.bb                  |    2 +-
>   .../iproute2/iproute2_2.6.38.bb                    |    2 +-
>   meta/recipes-connectivity/ofono/ofono_0.50.bb      |    2 +-
>   .../telepathy/telepathy-glib_0.14.3.bb             |    2 +-
>   .../telepathy/telepathy-idle_0.1.8.bb              |    2 +-
>   .../telepathy/telepathy-python_0.15.19.bb          |    2 +-
>   meta/recipes-core/dbus-wait/dbus-wait_svn.bb       |    2 +-
>   .../eglibc-2.12/armv4-eabi-compile-fix.patch       |   25 +
>   .../eglibc-2.13/armv4-eabi-compile-fix.patch       |   25 +
>   .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 +-
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
>   .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
>   meta/recipes-core/meta/meta-environment.bb         |    2 +-
>   meta/recipes-core/meta/meta-ide-support.bb         |    2 +-
>   meta/recipes-core/meta/meta-toolchain.bb           |    2 +-
>   .../binutils/binutils/binutils-powerpc-e5500.patch |  112 ++++
>   meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    3 +-
>   meta/recipes-devtools/bison/bison_2.3.bb           |    4 +-
>   meta/recipes-devtools/bison/bison_2.5.bb           |    4 +-
>   meta/recipes-devtools/distcc/distcc_2.18.3.bb      |    2 +-
>   .../subversion/subversion_1.6.15.bb                |    2 +-
>   meta/recipes-extended/blktool/blktool_4-6.bb       |    2 +-
>   .../recipes-extended/chkconfig/chkconfig_1.3.52.bb |    2 +-
>   meta/recipes-extended/libidn/libidn_0.6.14.bb      |    2 +-
>   meta/recipes-extended/libidn/libidn_1.22.bb        |    2 +-
>   meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |    4 +-
>   .../{lighttpd_1.4.28.bb =>  lighttpd_1.4.29.bb}     |    6 +-
>   meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
>   .../newt/files/include-without-python.patch        |   73 ---
>   .../{libnewt_0.52.12.bb =>  libnewt_0.52.13.bb}     |   10 +-
>   .../{parted-2.3 =>  parted-3.0}/no_check.patch      |    0
>   .../{parted-2.3 =>  parted-3.0}/syscalls.patch      |    0
>   .../parted/{parted_2.3.bb =>  parted_3.0.bb}        |    4 +-
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    2 +-
>   meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb |    2 +-
>   .../ttf-fonts/liberation-fonts_1.06.bb             |    2 +-
>   .../x11-common/xserver-nodm-init/xserver-nodm      |    6 +-
>   .../xorg-driver/xf86-driver-common.inc             |    2 +-
>   meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb      |    2 +-
>   meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |    2 +-
>   meta/recipes-sato/eds/eds-tools_bzr.bb             |    2 +-
>   meta/recipes-sato/gaku/gaku_svn.bb                 |    2 +-
>   meta/recipes-sato/libical/libical_0.46.bb          |    2 +-
>   meta/recipes-sato/libowl/libowl_svn.bb             |    2 +-
>   .../recipes-sato/owl-video-widget/libowl-av_svn.bb |    2 +-
>   meta/recipes-sato/puzzles/oh-puzzles_svn.bb        |    2 +-
>   meta/recipes-sato/puzzles/puzzles_r9175.bb         |    2 +-
>   meta/recipes-sato/screenshot/screenshot_svn.bb     |    2 +-
>   .../apr/{apr-util_1.3.10.bb =>  apr-util_1.3.12.bb} |   14 +-
>   meta/recipes-support/apr/apr/buildconf_fix.patch   |   27 -
>   .../apr/{apr_1.4.2.bb =>  apr_1.4.5.bb}             |   15 +-
>   .../{aspell_0.60.6.bb =>  aspell_0.60.6.1.bb}       |    6 +-
>   .../disable_gpgconf_check.patch                    |    0
>   .../gpgme/{gpgme_1.3.0.bb =>  gpgme_1.3.1.bb}       |   10 +-
>   .../{libassuan_2.0.1.bb =>  libassuan_2.0.2.bb}     |    4 +-
>   meta/recipes-support/libfm/libfm_0.1.14.bb         |    2 +-
>   meta/recipes-support/liboil/liboil_0.3.17.bb       |    2 +-
>   ...libsoup-2.4_2.34.1.bb =>  libsoup-2.4_2.34.2.bb} |    4 +-
>   meta/recipes-support/neon/neon_0.29.5.bb           |    2 +-
>   meta/site/arm-common                               |   25 +-
>   meta/site/arm-linux                                |    9 -
>   meta/site/common-glibc                             |    9 +-
>   meta/site/common-linux                             |    6 +
>   meta/site/common-uclibc                            |   12 +
>   meta/site/ix86-common                              |   31 +-
>   meta/site/mips-common                              |   18 +-
>   meta/site/mips-linux                               |   25 +-
>   meta/site/mips-linux-uclibc                        |   24 +-
>   meta/site/mipsel-linux                             |   26 +-
>   meta/site/mipsel-linux-uclibc                      |   12 +-
>   meta/site/powerpc-linux                            |   13 +-
>   meta/site/powerpc32-linux                          |   17 -
>   meta/site/sh-common                                |   24 +-
>   meta/site/x86_64-linux                             |   14 +-
>   meta/site/x86_64-linux-uclibc                      |   12 +-
>   scripts/qemuimage-tests/tools/connman_test.sh      |    8 +-
>   98 files changed, 909 insertions(+), 422 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch
>   rename meta/recipes-extended/lighttpd/{lighttpd_1.4.28.bb =>  lighttpd_1.4.29.bb} (90%)
>   delete mode 100644 meta/recipes-extended/newt/files/include-without-python.patch
>   rename meta/recipes-extended/newt/{libnewt_0.52.12.bb =>  libnewt_0.52.13.bb} (80%)
>   rename meta/recipes-extended/parted/{parted-2.3 =>  parted-3.0}/no_check.patch (100%)
>   rename meta/recipes-extended/parted/{parted-2.3 =>  parted-3.0}/syscalls.patch (100%)
>   rename meta/recipes-extended/parted/{parted_2.3.bb =>  parted_3.0.bb} (78%)
>   rename meta/recipes-support/apr/{apr-util_1.3.10.bb =>  apr-util_1.3.12.bb} (63%)
>   delete mode 100644 meta/recipes-support/apr/apr/buildconf_fix.patch
>   rename meta/recipes-support/apr/{apr_1.4.2.bb =>  apr_1.4.5.bb} (79%)
>   rename meta/recipes-support/aspell/{aspell_0.60.6.bb =>  aspell_0.60.6.1.bb} (82%)
>   rename meta/recipes-support/gpgme/{gpgme-1.3.0 =>  gpgme-1.3.1}/disable_gpgconf_check.patch (100%)
>   rename meta/recipes-support/gpgme/{gpgme_1.3.0.bb =>  gpgme_1.3.1.bb} (74%)
>   rename meta/recipes-support/libassuan/{libassuan_2.0.1.bb =>  libassuan_2.0.2.bb} (82%)
>   rename meta/recipes-support/libsoup/{libsoup-2.4_2.34.1.bb =>  libsoup-2.4_2.34.2.bb} (76%)
>


