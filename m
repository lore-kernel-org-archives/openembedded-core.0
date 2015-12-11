Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 053916FF7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 03:45:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Dec 2015 19:45:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,411,1444719600"; d="scan'208";a="869306321"
Received: from exxie-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.26])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2015 19:45:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 16:44:26 +1300
Message-Id: <cover.1449805448.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [jethro][PATCH 00/20] Backports from master (cover letter only)
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
X-List-Received-Date: Fri, 11 Dec 2015 03:45:11 -0000

Backports to jethro, mostly of fixes relating to the SDK and extensible
SDK.


The following changes since commit 224bcc2ead676600bcd9e290ed23d9b2ed2f481e:

  rpcbind: Security Advisory - rpcbind - CVE-2015-7236 (2015-12-08 00:18:12 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/jethro-fixes-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/jethro-fixes-oecore

Fang Jia (1):
  toolchain-scripts.bbclass: unset command_not_found_handle

Jean-Francois Dagenais (1):
  toolchain-shar-relocate: don't assume last state of env_setup_script
    is good

Mark Hatle (1):
  populate_sdk_ext.bbclass: Be more permissive on the name of the
    buildtools

Paul Eggleton (16):
  classes/distrodata: split SRC_URI properly before determining type
  oeqa/selftest/devtool: fix test if build directory is not inside
    COREBASE
  oeqa/selftest/layerappend: fix test if build directory is not inside
    COREBASE
  classes/metadata_scm: fix git errors showing up on non-git
    repositories
  classes/license: fix intermittent license collection warning
  classes/populate_sdk_ext: tidy up preparation log file writing
  classes/populate_sdk_ext: make it clear when SDK installation has
    failed
  classes/populate_sdk_ext: tweak reporting of workspace exclusion
  classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH
  toolchain-shar-extract.sh: proper fix for additional env setup scripts
  scripts/gen-lockedsig-cache: improve output
  toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
  devtool: upgrade: fix removing other recipes from workspace on reset
  devtool: upgrade: fix updating PV and SRCREV
  devtool: upgrade: remove erroneous error when not renaming recipe
  devtool: upgrade: fetch remote repository before checking out new
    revision

Tzu-Jung Lee (1):
  devtool: include do_patch in SRCTREECOVEREDTASKS

 meta/classes/distrodata.bbclass        |  4 ++--
 meta/classes/license.bbclass           |  1 +
 meta/classes/metadata_scm.bbclass      | 20 +++++++++----------
 meta/classes/populate_sdk_ext.bbclass  | 15 ++++++++------
 meta/classes/toolchain-scripts.bbclass |  1 +
 meta/files/toolchain-shar-extract.sh   | 15 ++++++++++++--
 meta/lib/oe/copy_buildsystem.py        |  5 +++--
 meta/lib/oeqa/selftest/devtool.py      |  2 +-
 meta/lib/oeqa/selftest/layerappend.py  |  9 ++++++---
 scripts/gen-lockedsig-cache            | 13 +++++++++---
 scripts/lib/devtool/standard.py        |  4 ++--
 scripts/lib/devtool/upgrade.py         | 36 ++++++++++++++++++++--------------
 12 files changed, 79 insertions(+), 46 deletions(-)

-- 
2.5.0


