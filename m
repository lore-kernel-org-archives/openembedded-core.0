Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl41-0003nR-R1
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769973"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:47 -0800
Message-Id: <cover.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 00/13] Updates for M4
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000


Richard,

This is my set of update for M4 inclusion

Built and tested.

Thanks
	Sau!

 
The following changes since commit ab692ed618f83df2ce452769165314e70b867345:

  gettext: Fix build with uclibc remove upstreamed patches (2013-01-27 13:52:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (13):
  libnl: Update to 3.2.21
  rgb: Update to 1.0.5
  sysstat: Update to 10.1.3
  mc: Update to 4.8.7
  man-pages: Update to 3.45
  libidn: Update to 1.26
  cracklib: Update to 2.8.22
  file: Update to 5.12
  dhcp: Update to 4.2.5
  util-linux: Update to 2.22.2
  resolvconf: Update to 1.69
  libcgroup: Update to 0.38
  sqlite3: Update to 3.7.15.2

 .../dhcp-3.0.3-dhclient-dbus.patch                        |  0
 .../{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-client-path.patch   |  0
 .../{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-external-bind.patch |  0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fixincludes.patch  |  0
 .../{dhcp-4.2.4-P2 => dhcp-4.2.5}/link-with-lcrypto.patch |  0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/noattrmode.patch   |  0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/site.h             |  0
 .../dhcp/{dhcp_4.2.4-P2.bb => dhcp_4.2.5.bb}              |  4 ++--
 .../resolvconf/{resolvconf_1.68.bb => resolvconf_1.69.bb} |  4 ++--
 .../libcgroup/{libcgroup_0.37.1.bb => libcgroup_0.38.bb}  |  4 +---
 .../{util-linux_2.22.1.bb => util-linux_2.22.2.bb}        |  6 +++---
 .../file/file/obsolete_automake_macros.patch              | 15 ---------------
 meta/recipes-devtools/file/{file_5.11.bb => file_5.12.bb} |  7 +++----
 .../cracklib/{cracklib_2.8.19.bb => cracklib_2.8.22.bb}   |  4 ++--
 .../libidn/{libidn_1.25.bb => libidn_1.26.bb}             |  8 ++++----
 .../man-pages/{man-pages_3.44.bb => man-pages_3.45.bb}    |  4 ++--
 meta/recipes-extended/mc/{mc_4.8.6.bb => mc_4.8.7.bb}     |  4 ++--
 .../sysstat/{sysstat_10.1.2.bb => sysstat_10.1.3.bb}      |  6 +++---
 .../xorg-app/rgb-1.0.4/obsolete_automake_macros.patch     | 15 ---------------
 .../xorg-app/{rgb_1.0.4.bb => rgb_1.0.5.bb}               |  8 +++-----
 .../libnl/{libnl_3.2.18.bb => libnl_3.2.21.bb}            |  4 ++--
 .../sqlite/{sqlite3_3.7.15.1.bb => sqlite3_3.7.15.2.bb}   |  6 +++---
 22 files changed, 32 insertions(+), 67 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.4-P2.bb => dhcp_4.2.5.bb} (62%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.68.bb => resolvconf_1.69.bb} (88%)
 rename meta/recipes-core/libcgroup/{libcgroup_0.37.1.bb => libcgroup_0.38.bb} (85%)
 rename meta/recipes-core/util-linux/{util-linux_2.22.1.bb => util-linux_2.22.2.bb} (89%)
 delete mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch
 rename meta/recipes-devtools/file/{file_5.11.bb => file_5.12.bb} (81%)
 rename meta/recipes-extended/cracklib/{cracklib_2.8.19.bb => cracklib_2.8.22.bb} (72%)
 rename meta/recipes-extended/libidn/{libidn_1.25.bb => libidn_1.26.bb} (85%)
 rename meta/recipes-extended/man-pages/{man-pages_3.44.bb => man-pages_3.45.bb} (82%)
 rename meta/recipes-extended/mc/{mc_4.8.6.bb => mc_4.8.7.bb} (82%)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.2.bb => sysstat_10.1.3.bb} (44%)
 delete mode 100644 meta/recipes-graphics/xorg-app/rgb-1.0.4/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-app/{rgb_1.0.4.bb => rgb_1.0.5.bb} (45%)
 rename meta/recipes-support/libnl/{libnl_3.2.18.bb => libnl_3.2.21.bb} (90%)
 rename meta/recipes-support/sqlite/{sqlite3_3.7.15.1.bb => sqlite3_3.7.15.2.bb} (59%)

-- 
1.8.0.2



