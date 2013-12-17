Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 017EE60CFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 17:10:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 17 Dec 2013 09:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,502,1384329600"; d="scan'208";a="445763714"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.128])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2013 09:10:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 09:10:19 -0800
Message-Id: <cover.1387299930.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/11]
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
X-List-Received-Date: Tue, 17 Dec 2013 17:10:19 -0000


The following changes since commit b226ab4cf7779f4dfaa78210cb6249766ed564c1:

  insane: handle recursive configures when checking for unknown configure options (2013-12-16 12:12:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Cristian Iorga (1):
  libpcap: upgrade to 1.5.2

Kai Kang (5):
  lsb: update directory of install_initd and remove_initd
  LSB_Test.sh: update rpm platform file when enable multilib
  LSB_Test.sh: check ldconfig before update cache
  LSB_Test.sh: update locales
  lsbtest: add ppc64 support

Paul Eggleton (1):
  scripts/contrib: Add graph-tool

Ross Burton (1):
  systemd-compat-units: drop machineid.service

Saul Wold (1):
  man-pages: upgrade to 3.55

Zhong Hongbo (2):
  bluez4: Install the test script
  bluez4: use legacy pygobject instead of gobject-introspection

 .../bluez/bluez4-4.101/install-test-script.patch   | 26 ++++++
 ...pygobject-instead-ofgobject-introspection.patch | 27 +++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  7 +-
 .../libpcap/libpcap/aclocal.patch                  |  8 +-
 .../libpcap/{libpcap_1.4.0.bb => libpcap_1.5.2.bb} |  4 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |  4 -
 .../systemd/systemd-compat-units/machineid.service | 16 ----
 meta/recipes-extended/lsb/lsb_4.1.bb               |  8 +-
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      | 20 ++++-
 meta/recipes-extended/lsb/lsbtest_1.0.bb           | 12 +++
 .../{man-pages_3.54.bb => man-pages_3.55.bb}       |  4 +-
 scripts/contrib/graph-tool                         | 92 ++++++++++++++++++++++
 12 files changed, 194 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.4.0.bb => libpcap_1.5.2.bb} (80%)
 delete mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
 rename meta/recipes-extended/man-pages/{man-pages_3.54.bb => man-pages_3.55.bb} (82%)
 create mode 100755 scripts/contrib/graph-tool

-- 
1.8.3.1


