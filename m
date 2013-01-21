Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tx9QU-0008SE-QJ
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 05:56:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2013 20:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,504,1355126400"; d="scan'208";a="279580664"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.40])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2013 20:40:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2013 20:40:36 -0800
Message-Id: <cover.1358742751.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 0/5] Fixes for M3
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
X-List-Received-Date: Mon, 21 Jan 2013 04:56:10 -0000

Richard,

This contains a better fix for the Oprofile/PPC issue from
Matthew along with the fix for non-GPLv3 issue from Chris L.

Thanks
	Sau!

The following changes since commit 5892db9a34c188b8a9bdaa86e19ba62a7f4793b5:

  oprofile: set correct kernel path (2013-01-20 13:13:54 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Christopher Larson (1):
  package.bbclass: drop unnecessary and broken packages.remove()

Cristian Iorga (1):
  dbus: upgrade to 1.6.8

Darren Hart (1):
  bb-matrix: Fix min and max calculations

Khem Raj (1):
  boost: Upgrade 1.51 -> 1.52

Matthew McClintock (1):
  oprofile: backport patches to fix ppc build issues

 meta/classes/package.bbclass                       |   1 -
 .../dbus/{dbus-1.6.4 => dbus-1.6.8}/dbus-1.init    |   0
 .../dbus/{dbus-1.6.4 => dbus-1.6.8}/ptest.patch    |   0
 .../dbus/{dbus-1.6.4 => dbus-1.6.8}/run-ptest      |   0
 .../{dbus-1.6.4 => dbus-1.6.8}/test-run-path.patch |   0
 .../dbus/{dbus-1.6.4 => dbus-1.6.8}/tmpdir.patch   |   0
 .../{dbus-ptest_1.6.4.bb => dbus-ptest_1.6.8.bb}   |   4 +-
 meta/recipes-core/dbus/dbus_1.6.4.bb               |   6 -
 meta/recipes-core/dbus/dbus_1.6.8.bb               |   6 +
 ...igure-to-look-for-libpfm4-function-first-.patch |  49 +++++++
 ...igure-to-handle-architectures-that-do-not.patch | 163 +++++++++++++++++++++
 ...y-perf_events-kernel-without-PERF_RECORD_.patch | 107 ++++++++++++++
 ...esn-t-build-for-32-bit-ppc-the-operf_util.patch |  32 ++++
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |   8 +-
 meta/recipes-support/boost/boost.inc               |   2 -
 .../boost/{boost_1.51.0.bb => boost_1.52.0.bb}     |   8 +-
 meta/recipes-support/boost/files/hash_enums.patch  |  45 ------
 scripts/contrib/bb-perf/bb-matrix-plot.sh          |  12 +-
 scripts/contrib/bb-perf/bb-matrix.sh               |   5 +-
 19 files changed, 378 insertions(+), 70 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/ptest.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/run-ptest (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/test-run-path.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.4 => dbus-1.6.8}/tmpdir.patch (100%)
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.4.bb => dbus-ptest_1.6.8.bb} (91%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.4.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.6.8.bb
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Change-configure-to-look-for-libpfm4-function-first-.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-up-configure-to-handle-architectures-that-do-not.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Handle-early-perf_events-kernel-without-PERF_RECORD_.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-OProfile-doesn-t-build-for-32-bit-ppc-the-operf_util.patch
 rename meta/recipes-support/boost/{boost_1.51.0.bb => boost_1.52.0.bb} (44%)
 delete mode 100644 meta/recipes-support/boost/files/hash_enums.patch

-- 
1.8.0.2



