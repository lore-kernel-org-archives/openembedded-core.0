Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ShMyV-0001dP-6R
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:37:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2012 08:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158695973"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.124])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2012 08:26:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 08:26:56 -0700
Message-Id: <cover.1340168446.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/55] Cover Letter Only!
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
X-List-Received-Date: Wed, 20 Jun 2012 15:37:43 -0000

Richard,

I have build this on the AB so all arches have been built,
I found and fix the connman and getext GPLv2 issues in this
request.

Mark and I have reviewed the buildhistory diffs and they seem
correct to us at this point. This did fix a number of broken
packages.

I also am including changes from others as I built those changes
and reviewed them to the best of my ability.

Thanks for your patience on this long awaited change!

Sau!


The following changes since commit 6d761ae17ddbd3d936e7fe985b40825ad62b2418:

  debian.bbclass: invoke target objdump (2012-06-18 13:20:29 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Darren Hart (1):
  cml1.bbclass: Only delay exit if the command fails

Martin Jansa (3):
  opkg-utils: bump SRCREV
  kernel.bbclass: pass KERNEL_VERSION to depmod calls in postinst
  openssl: add deprecated and unmaintained find.pl from perl-5.14 to
    fix perlpath.pl

Paul Eggleton (2):
  classes/cml1: ensure -c menuconfig forces a rebuild next time
  conf/bitbake.conf: fix reparsing after -p is used

Ross Burton (6):
  connman: rationalise configure options
  connman: add compat RPROVIDES for older packaging
  connman: upgrade to 1.0
  connman-gnome: fix build depends (Yocto #2556)
  connman-gnome: clean up runtime dependencies
  connman-gnome: upgrade to 0.7, which works with connman 1.0

Saul Wold (43):
  curl: Use gnutls for target and openssl for native
  bitbake.conf: reorder PACKAGES list
  binconfig: add *-config files to the -dev package
  lib_package: remove the -dev list
  bitbake.conf: add PN-bin and cleanup lib_package.bbclass
  pmutils: reorder file for correctness
  eglibc-package: Update PACKAGES and files based on new ordering
  taglib: correct location of taglib-config to -dev
  pth: clean-up FILES list due to PACKAGE reorder
  libusb-compat: clean up FILE after PACKAGE reorder
  libproxy: clean up FILE after PACKAGE reorder
  libgpg-error: clean up FILE after PACKAGE reorder
  libgcrypt: clean up FILE after PACKAGE reorder
  gpgme: clean up FILE after PACKAGE reorder
  gnutls: clean up FILE after PACKAGE reorder
  db: Ensure the library version matches package version
  libpng: clean up FILE after PACKAGE reorder
  libxml2: clean up FILE after PACKAGE reorder
  groff: clean up FILE after PACKAGE reorder
  icu: clean up FILE after PACKAGE reorder
  gettext: clean up FILE after PACKAGE reorder
  cups: clean up FILE after PACKAGE reorder
  procps: clean up FILE after PACKAGE reorder
  gnome-keyring: clean up FILE after PACKAGE reorder
  slang: clean up FILE after PACKAGE reorder
  gthumb: clean up FILE after PACKAGE reorder
  freetype: clean up FILE after PACKAGE reorder
  gtk-sato-engine: clean up FILE after PACKAGE reorder
  libidn: clean up FILE after PACKAGE reorder
  lttng-viewer: clean up FILE after PACKAGE reorder
  js: clean up FILE after PACKAGE reorder
  webkit-gtk: remove /usr/libexec since it's empty
  libtool: add ${PN} in middle of package list to ensure .m4 get with
    ${PN}
  grub: Clean up FILES_* after PACKAGES reoder
  hdparam: Clean up FILES_* after PACKAGES reoder
  man-pages: Clean up FILES_* after PACKAGES reoder
  curl: Clean up FILES_* after PACKAGES reoder
  PR bumps for PACKAGES reorder
  libevent: disable openssl by default
  libpcre:  Clean up FILES_* after PACKAGES reoder
  connman: Fix plugin package order
  libpcre: clean up FILE after PACKAGE reorder
  gettext 0.16.1: Update FILES for post PACKAGE reoder

 diff                                               |   75 ++++++++++++++++++++
 meta/classes/binconfig.bbclass                     |    2 +
 meta/classes/cml1.bbclass                          |   16 ++++
 meta/classes/kernel.bbclass                        |    4 +-
 meta/classes/lib_package.bbclass                   |   16 ++---
 meta/conf/bitbake.conf                             |   12 ++-
 meta/recipes-bsp/grub/grub_0.97.bb                 |    5 +-
 meta/recipes-bsp/grub/grub_1.99.bb                 |    4 +-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   11 ++-
 .../connman/connman-gnome_0.5.bb                   |   38 ----------
 .../connman/connman-gnome_0.7.bb                   |   19 +++++
 meta/recipes-connectivity/connman/connman.inc      |   29 +++++---
 .../connman/connman/disable_alg-test.patch         |   46 ------------
 .../connman/connman/ethernet_default.patch         |   22 ------
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 -------------
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------
 .../connman/{connman_0.79.bb => connman_1.0.bb}    |   10 +--
 .../nfs-utils/libnfsidmap_0.24.bb                  |    2 +-
 .../openssl/openssl-1.0.0i/find.pl                 |   54 ++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    7 ++-
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |   38 ++++++++++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    2 +
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   12 ++-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    7 ++-
 .../opkg-utils/opkg-utils/shr.patch                |   26 +++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
 meta/recipes-extended/cups/cups14.inc              |    1 +
 meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |    2 +
 meta/recipes-extended/hdparm/hdparm_9.39.bb        |    1 -
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |    6 ++-
 meta/recipes-extended/libidn/libidn_1.24.bb        |    3 +-
 meta/recipes-extended/libuser/libuser_0.57.1.bb    |    2 +-
 meta/recipes-extended/man-pages/man-pages_3.41.bb  |    6 +-
 meta/recipes-extended/procps/procps.inc            |    6 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    2 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    4 +-
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   14 +++-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |   12 ++-
 meta/recipes-graphics/freetype/freetype_2.4.9.bb   |    5 +-
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |    3 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    6 +-
 meta/recipes-multimedia/libpng/libpng_1.2.49.bb    |    4 +-
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    2 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 ++-
 meta/recipes-support/curl/curl_7.24.0.bb           |   22 ++----
 meta/recipes-support/db/db_5.3.15.bb               |    9 ++-
 meta/recipes-support/gnutls/gnutls.inc             |    5 +-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    5 +-
 meta/recipes-support/icu/icu-3.6.inc               |    2 +
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    3 +-
 meta/recipes-support/libevent/libevent_2.0.16.bb   |    4 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    6 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb  |    2 +-
 .../libgpg-error/libgpg-error_1.10.bb              |    8 +--
 meta/recipes-support/libksba/libksba_1.2.0.bb      |    1 +
 meta/recipes-support/libpcre/libpcre_8.30.bb       |    7 +--
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 +-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    4 +-
 meta/recipes-support/pth/pth_2.0.7.bb              |    3 -
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    3 +-
 68 files changed, 404 insertions(+), 354 deletions(-)
 create mode 100644 diff
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.5.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.7.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 rename meta/recipes-connectivity/connman/{connman_0.79.bb => connman_1.0.bb} (53%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch

-- 
1.7.7.6



