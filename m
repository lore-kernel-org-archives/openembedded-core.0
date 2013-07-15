Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 89254619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:43:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Jul 2013 07:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="268483214"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jul 2013 07:41:43 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 0BC076A4091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:41:41 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 17:42:21 +0300
Message-Id: <cover.1373899189.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2 0/9] Some fixes for the testimage class
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
X-List-Received-Date: Mon, 15 Jul 2013 14:43:05 -0000

Hello,

These are some fixes for the testimage.bbclass and tests and
also two new tests.

Changed in v2:
   - fixed the syslog tests for systemd builds
   - new patch (9) which fixes the dependency check between tests

Cheers,
Stefan


The following changes since commit 74e403705e25afec656b5e40921771a9c29bdc40:

  yocto-kernel: make BBLAYERS parsing more robust (2013-07-13 18:23:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/oeqa9

for you to fetch changes up to 4d06d05ef481537369dd646b114f617a2bc7f8a4:

  lib/oeqa: fix dependecy check (2013-07-15 17:37:57 +0300)

----------------------------------------------------------------
Alexandru Palalau (1):
      lib/oeqa/runtime: add tests for syslog and df

Stefan Stanacar (8):
      lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net interface name
      lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
      testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout configurable and increase it
      lib/oeqa/runtime/multilib.py: use readelf instead of file
      lib/oeqa/oetest.py: provide a ps command for all tests
      classes/testimage.bbclass: use a copy of rootfs for tests
      testimage.bbclass, lib/oeqa: add headers and comments
      lib/oeqa: fix dependecy check

 meta/classes/testimage.bbclass    | 43 +++++++++++++++++++++++++++++++---
 meta/lib/oeqa/oetest.py           | 14 ++++++++---
 meta/lib/oeqa/runtime/connman.py  |  5 ----
 meta/lib/oeqa/runtime/df.py       | 13 +++++++++++
 meta/lib/oeqa/runtime/dmesg.py    |  2 +-
 meta/lib/oeqa/runtime/multilib.py |  9 ++++---
 meta/lib/oeqa/runtime/smart.py    |  1 +
 meta/lib/oeqa/runtime/syslog.py   | 37 +++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/decorators.py | 12 +++++++++-
 meta/lib/oeqa/utils/qemurunner.py | 12 +++++-----
 meta/lib/oeqa/utils/sshcontrol.py | 49 +++++++++++++++++++++------------------
 11 files changed, 152 insertions(+), 45 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py

Alexandru Palalau (1):
  lib/oeqa/runtime: add tests for syslog and df

Stefan Stanacar (8):
  lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net
    interface name
  lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
  testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout
    configurable and increase it
  lib/oeqa/runtime/multilib.py: use readelf instead of file
  lib/oeqa/oetest.py: provide a ps command for all tests
  classes/testimage.bbclass: use a copy of rootfs for tests
  testimage.bbclass, lib/oeqa: add headers and comments
  lib/oeqa: fix dependecy check

 meta/classes/testimage.bbclass    | 43 +++++++++++++++++++++++++++++++---
 meta/lib/oeqa/oetest.py           | 14 ++++++++---
 meta/lib/oeqa/runtime/connman.py  |  5 ----
 meta/lib/oeqa/runtime/df.py       | 13 +++++++++++
 meta/lib/oeqa/runtime/dmesg.py    |  2 +-
 meta/lib/oeqa/runtime/multilib.py |  9 ++++---
 meta/lib/oeqa/runtime/smart.py    |  1 +
 meta/lib/oeqa/runtime/syslog.py   | 37 +++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/decorators.py | 12 +++++++++-
 meta/lib/oeqa/utils/qemurunner.py | 12 +++++-----
 meta/lib/oeqa/utils/sshcontrol.py | 49 +++++++++++++++++++++------------------
 11 files changed, 152 insertions(+), 45 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py

-- 
1.8.3.1


