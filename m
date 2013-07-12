Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1E96AF53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:46:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2013 09:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="369245177"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2013 09:46:42 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id EA0716A4092
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:46:40 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 19:46:48 +0300
Message-Id: <cover.1373647359.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/8] Some fixes for the testimage class
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
X-List-Received-Date: Fri, 12 Jul 2013 16:46:45 -0000

Hello,

Some fixes for the testimage.bbclass and tests.
Also two new tests.

First two patches in the series have already been sent to ML, these are the same.
The third one is a modified version of a patch already sent.
The rest of them are new and the should be safe :).

Cheers,
Stefan


The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib stefans/oeqa9

for you to fetch changes up to 1dad9f83f59020db8c50a7b0ae6fb2af75496194:

  testimage.bbclass, lib/oeqa: add headers and comments (2013-07-12 19:33:52 +0300)

----------------------------------------------------------------
Alexandru Palalau (1):
      lib/oeqa/runtime: add tests for syslog and df

Stefan Stanacar (7):
      lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net interface name
      lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
      testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout configurable and increase it
      lib/oeqa/runtime/multilib.py: use readelf instead of file
      lib/oeqa/oetest.py: provide a ps command for all tests
      classes/testimage.bbclass: use a copy of rootfs for tests
      testimage.bbclass, lib/oeqa: add headers and comments

 meta/classes/testimage.bbclass    | 43 +++++++++++++++++++++++++++++++---
 meta/lib/oeqa/oetest.py           | 14 ++++++++---
 meta/lib/oeqa/runtime/connman.py  |  5 ----
 meta/lib/oeqa/runtime/df.py       | 13 +++++++++++
 meta/lib/oeqa/runtime/dmesg.py    |  2 +-
 meta/lib/oeqa/runtime/multilib.py |  9 ++++---
 meta/lib/oeqa/runtime/syslog.py   | 34 +++++++++++++++++++++++++++
 meta/lib/oeqa/utils/decorators.py |  8 +++++++
 meta/lib/oeqa/utils/qemurunner.py | 12 +++++-----
 meta/lib/oeqa/utils/sshcontrol.py | 49 +++++++++++++++++++++------------------
 10 files changed, 145 insertions(+), 44 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py

Alexandru Palalau (1):
  lib/oeqa/runtime: add tests for syslog and df

Stefan Stanacar (7):
  lib/oeqa/runtime/dmesg.py: whitelist dmesg message for systemd net
    interface name
  lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
  testimage.bbclass, lib/oeqa/utils/qemurunner.py: make boot timeout
    configurable and increase it
  lib/oeqa/runtime/multilib.py: use readelf instead of file
  lib/oeqa/oetest.py: provide a ps command for all tests
  classes/testimage.bbclass: use a copy of rootfs for tests
  testimage.bbclass, lib/oeqa: add headers and comments

 meta/classes/testimage.bbclass    | 43 +++++++++++++++++++++++++++++++---
 meta/lib/oeqa/oetest.py           | 14 ++++++++---
 meta/lib/oeqa/runtime/connman.py  |  5 ----
 meta/lib/oeqa/runtime/df.py       | 13 +++++++++++
 meta/lib/oeqa/runtime/dmesg.py    |  2 +-
 meta/lib/oeqa/runtime/multilib.py |  9 ++++---
 meta/lib/oeqa/runtime/syslog.py   | 34 +++++++++++++++++++++++++++
 meta/lib/oeqa/utils/decorators.py |  8 +++++++
 meta/lib/oeqa/utils/qemurunner.py | 12 +++++-----
 meta/lib/oeqa/utils/sshcontrol.py | 49 +++++++++++++++++++++------------------
 10 files changed, 145 insertions(+), 44 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py

-- 
1.8.1.4


