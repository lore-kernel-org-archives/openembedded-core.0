Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaKXP-00043w-Uz
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 07:08:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2012 21:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,276,1352102400"; d="scan'208";a="221530191"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2012 21:54:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2012 21:54:33 -0800
Message-Id: <cover.1353304234.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 00/17] Recipe Updates
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
X-List-Received-Date: Mon, 19 Nov 2012 06:08:56 -0000
X-List-Received-Date: Mon, 19 Nov 2012 06:08:56 -0000

Richard,

Here is a batch of tested updates.

I found 1 issue with cmake and libproxy, which I addressed, I hope
there are not any others lurking.  I did rebuild all the cmake related
packages.

Thanks
Sau!


The following changes since commit d109b24ad354382cd40b28e86211e53929a0910f:

  pulseaudio: explicitly disable xen, rather than letting it detect (2012-11-18 16:39:43 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (17):
  sysstat: Update to 10.1.2
  libcheck: Update to 0.9.9
  sqlite3: Update to 3.7.14.1
  builder: Add password for user
  libtasn1: Update to 2.14
  gnutls: Update to 2.12.21
  libksba: Update to 1.3.0
  dhcp: Update to 4.2.4-P2
  libxml2: Update to 2.9.0
  resolvconf: Update to 1.68
  mc: Update to 4.8.6
  man-pages: Update to 3.44
  tiff: Update to 4.0.3
  rt-tests/hwlatdetect: Update to 0.84
  libdumpvalue-perl: Update to 1.17
  cmake: Update to 2.8.10.1
  libproxy: set LIBEXEC_INSTALL_DIR

 .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
 .../fix-client-path.patch                          |    0
 .../fix-external-bind.patch                        |    0
 .../fixincludes.patch                              |    0
 .../link-with-lcrypto.patch                        |    0
 .../noattrmode.patch                               |    0
 .../dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/site.h   |    0
 .../dhcp/{dhcp_4.2.4-P1.bb => dhcp_4.2.4-P2.bb}    |    5 +-
 .../{resolvconf_1.67.bb => resolvconf_1.68.bb}     |    4 +-
 meta/recipes-core/libxml/libxml2_2.8.0.bb          |    6 ---
 meta/recipes-core/libxml/libxml2_2.9.0.bb          |    6 +++
 .../cmake/cmake-native_2.8.10.1.bb                 |    4 ++
 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb  |    8 ---
 meta/recipes-devtools/cmake/cmake.inc              |    3 +
 .../cmake/cmake/dont-run-cross-binaries.patch      |   19 ++++----
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   46 ++++++++++----------
 .../cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb}    |    3 -
 .../{man-pages_3.42.bb => man-pages_3.44.bb}       |    4 +-
 .../mc/{mc_4.8.4.bb => mc_4.8.6.bb}                |    4 +-
 .../{sysstat_10.1.1.bb => sysstat_10.1.2.bb}       |    4 +-
 meta/recipes-graphics/builder/builder_0.1.bb       |    7 ++-
 ...alue-perl_1.16.bb => libdumpvalue-perl_1.17.bb} |    6 +-
 .../libtiff/{tiff_4.0.2.bb => tiff_4.0.3.bb}       |    4 +-
 .../{hwlatdetect_0.84.bb => hwlatdetect_0.85.bb}   |    0
 .../{rt-tests_0.84.bb => rt-tests_0.85.bb}         |    0
 .../{gnutls_2.12.20.bb => gnutls_2.12.21.bb}       |    5 +-
 .../gnutls/{libtasn1_2.13.bb => libtasn1_2.14.bb}  |    4 +-
 .../{libcheck_0.9.8.bb => libcheck_0.9.9.bb}       |    7 ++-
 meta/recipes-support/libksba/libksba_1.2.0.bb      |   14 ------
 meta/recipes-support/libksba/libksba_1.3.0.bb      |   18 ++++++++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    4 +-
 meta/recipes-support/sqlite/sqlite3_3.7.13.bb      |   11 -----
 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb    |   11 +++++
 33 files changed, 105 insertions(+), 102 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.4-P1.bb => dhcp_4.2.4-P2.bb} (62%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.67.bb => resolvconf_1.68.bb} (88%)
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.8.0.bb
 create mode 100644 meta/recipes-core/libxml/libxml2_2.9.0.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb} (88%)
 rename meta/recipes-extended/man-pages/{man-pages_3.42.bb => man-pages_3.44.bb} (82%)
 rename meta/recipes-extended/mc/{mc_4.8.4.bb => mc_4.8.6.bb} (82%)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.1.bb => sysstat_10.1.2.bb} (44%)
 rename meta/recipes-lsb4/perl/{libdumpvalue-perl_1.16.bb => libdumpvalue-perl_1.17.bb} (65%)
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.2.bb => tiff_4.0.3.bb} (85%)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.84.bb => hwlatdetect_0.85.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.84.bb => rt-tests_0.85.bb} (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.20.bb => gnutls_2.12.21.bb} (79%)
 rename meta/recipes-support/gnutls/{libtasn1_2.13.bb => libtasn1_2.14.bb} (81%)
 rename meta/recipes-support/libcheck/{libcheck_0.9.8.bb => libcheck_0.9.9.bb} (74%)
 delete mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
 create mode 100644 meta/recipes-support/libksba/libksba_1.3.0.bb
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.13.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb

-- 
1.7.7.6



