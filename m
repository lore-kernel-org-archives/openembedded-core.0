Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNRbU-0006SL-Ur
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 16:59:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2011 07:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,470,1315206000"; d="scan'208";a="87070050"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2011 07:53:01 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 09:53:32 -0600
Message-Id: <cover.1320638388.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/6] Add some intel-specific tune files, and related fixes
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
X-List-Received-Date: Mon, 07 Nov 2011 15:59:21 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset adds some new tune files for corei7, ivb, and atom.

The corei7 and atom were build- and boot-tested on sugarbay (with
corei7-avx), jasperforest (corei7), crownbay, fri2, fishriver (atom).
The ivb is one I'll be using for new Ivy Bridge development and
hasn't been tested yet, but will be needed for that.

This patchset also contains a few patches for packages that had build
problems with the corei7-avx tuning.  The python and gmp packages had
problems because they tried to execute target code on the host and caused
illegal instruction errors.  The libzypp failed compilation because of
the hyphens in the tune name (corei7-avx).

Tom Zanussi (6):
  tune-corei7: Add tune file for Intel Core i7 machines
  tune-ivb: Add tune file for Intel Ivy Bridge machines
  machine/include/tune-atom.inc: add atom-specific settings
  gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
  libzypp: fix mishandling of hyphenated arches
  python: skip setup.py

 meta/conf/machine/include/tune-atom.inc            |   26 +++++++++++++++++-
 meta/conf/machine/include/tune-corei7.inc          |   17 ++++++++++++
 meta/conf/machine/include/tune-ivb.inc             |   11 ++++++++
 .../python/setup_py_skip_cross_import_check.patch  |   27 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    7 ++++-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    8 +++---
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    3 +-
 7 files changed, 91 insertions(+), 8 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-corei7.inc
 create mode 100644 meta/conf/machine/include/tune-ivb.inc
 create mode 100644 meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch



