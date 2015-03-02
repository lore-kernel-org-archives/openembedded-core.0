Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B528673820
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 18:55:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2015 10:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,676,1418112000"; d="scan'208";a="692853703"
Received: from localhost.jf.intel.com ([10.7.201.37])
	by orsmga002.jf.intel.com with ESMTP; 02 Mar 2015 10:55:41 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 10:55:36 -0800
Message-Id: <1425322538-40169-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] Add fix and test for [Yocto #6450]
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
X-List-Received-Date: Mon, 02 Mar 2015 18:55:44 -0000

The following changes since commit bf1a68e97f2069a4f66664c351d4bafd416358eb:

  taglib: Fix cmake floating dependency on boost (2015-03-02 18:06:53 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/license_fix

for you to fetch changes up to a35e9afe37fe87921f0e9e915208364a271d89c3:

  lib/oeqa/selftest/lic-checksum: Verify failure when checksum changes. (2015-03-02 10:28:23 -0800)

----------------------------------------------------------------
Randy Witt (2):
      base.bbclass: Add LIC_FILES_CHKSUM files to checksum files.
      lib/oeqa/selftest/lic-checksum: Verify failure when checksum changes.

 meta-selftest/recipes-test/emptytest/emptytest.bb |  5 ++++
 meta/classes/base.bbclass                         | 17 ++++++++++++++
 meta/lib/oeqa/selftest/lic-checksum.py            | 28 +++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 meta-selftest/recipes-test/emptytest/emptytest.bb
 create mode 100644 meta/lib/oeqa/selftest/lic-checksum.py

