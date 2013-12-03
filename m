Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9F0C6D3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 17:09:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Dec 2013 09:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,819,1378882800"; d="scan'208";a="443929715"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.200])
	by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2013 09:09:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Dec 2013 17:09:09 +0000
Message-Id: <cover.1386089633.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 00/11] Backports from master (cover letter only)
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
X-List-Received-Date: Tue, 03 Dec 2013 17:09:36 -0000

Backports of patches from master to the dylan branch, plus one
dylan-only patch to fix kern-tools-native.


The following changes since commit 3549f5f203363302256848bb33c05c4fd4871948:

  busybox: configure system user id to range from 100 to 999 (2013-10-10 12:21:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Bruce Ashfield (1):
  kern-tools: use dylan branch

Chen Qi (1):
  license.bbclass: fix missing of license files on ubuntu build host

Christopher Larson (1):
  license.bbclass: include all licenses in the manifest

Khem Raj (1):
  elfutils-native: Update the patch to include the missing pieces needed
    for tests

Laurentiu Palcu (2):
  nativesdk-qt4-tools: create qt.conf file
  meta-toolchain-qt: put QT_CONF_PATH in environment script

Martin Jansa (1):
  db: Fix build with high PARALLEL_MAKE

Richard Purdie (3):
  classes: tar 1.27 fixes
  lib/oe/path: Fix copytree functions for tar 1.27
  metadata_scm: Avoid crashing on new svn version layouts

Roy Li (1):
  dropbear: pass SFTPSERVER_PATH explicitly

 meta/classes/libc-package.bbclass                   |  8 ++++----
 meta/classes/license.bbclass                        | 11 +++++------
 meta/classes/metadata_scm.bbclass                   |  7 +++++--
 meta/classes/package.bbclass                        |  2 +-
 meta/classes/populate_sdk_deb.bbclass               |  2 +-
 meta/classes/staging.bbclass                        |  2 +-
 meta/lib/oe/path.py                                 |  4 ++--
 meta/recipes-core/dropbear/dropbear.inc             |  1 +
 .../elfutils/elfutils/fix-build-gcc-4.8.patch       | 21 +++++++++++++++++----
 .../kern-tools/kern-tools-native_git.bb             |  4 ++--
 meta/recipes-qt/meta/meta-toolchain-qt.inc          |  1 +
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc         |  6 ++++++
 meta/recipes-support/db/db/fix-parallel-build.patch | 19 +++++++++++++++++++
 meta/recipes-support/db/db_5.3.21.bb                |  3 ++-
 14 files changed, 67 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-support/db/db/fix-parallel-build.patch

-- 
1.8.1.2


