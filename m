Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C3E336D909
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 17:59:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Nov 2013 09:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,769,1378882800"; d="scan'208";a="414500995"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 25 Nov 2013 09:58:58 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id ABAB26A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 09:58:56 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 19:59:36 +0200
Message-Id: <cover.1385402073.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/2] Run tests on a remote machine
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
X-List-Received-Date: Mon, 25 Nov 2013 17:59:06 -0000

Hello,

These patches add some abstraction on how we control a target, so that we can also
run the tests on real hardware.
The "backend" is controlled by setting TEST_TARGET to "qemu" or "simpleremote". (a very simple
remote implementation which does not deploy the image but runs the tests on a remote machine
via ssh to a specified IP address).

Cheers,
Stefan


The following changes since commit 381cd842caa3db5eabf8973305b6979014d9d0a8:

  linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package (2013-11-25 16:14:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/hwtest3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/hwtest3

Stefan Stanacar (2):
  lib/oeqa: targetcontrol.py: add abstraction for running tests on
    different targets
  testimage: use the new targetcontrol.py module for running tests

 meta/classes/testimage-auto.bbclass |   3 +-
 meta/classes/testimage.bbclass      | 104 ++++++++++-----------------
 meta/lib/oeqa/oetest.py             |  20 +++---
 meta/lib/oeqa/runtime/ping.py       |   2 +-
 meta/lib/oeqa/runtime/smart.py      |   4 +-
 meta/lib/oeqa/targetcontrol.py      | 137 ++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/qemurunner.py   |  50 +++++++------
 meta/lib/oeqa/utils/sshcontrol.py   |  20 ++----
 8 files changed, 224 insertions(+), 116 deletions(-)
 create mode 100644 meta/lib/oeqa/targetcontrol.py

-- 
1.8.3.1


