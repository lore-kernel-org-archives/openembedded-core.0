Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7748961663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 15:12:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2013 08:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="370478041"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.97])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2013 08:12:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 08:12:12 -0700
Message-Id: <cover.1373900913.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/15] Ready to Pull
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
X-List-Received-Date: Mon, 15 Jul 2013 15:12:14 -0000


Richard,

Here is a set of changes, mostly OE-QA change with a a few
package updates and a LSB fix.

Thanks
	Sau!

The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:

  distrodata.bbaclass: change in git and svn package reporting (2013-07-12 10:12:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru Palalau (1):
  lib/oeqa/runtime: add tests for syslog and df

Chen Qi (1):
  core-image-lsb.bb: add 'package-management' to IMAGE_FEATURES

Saul Wold (3):
  libidn: upgrade to 1.28
  mc: upgrade to 4.8.9
  initscripts: Update to 9.48

Stefan Stanacar (10):
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
  lib/oeqa/runtime/df.py: limit output to /
  lib/oeqa/runtime/syslog.py: fix restart in case of systemd

 meta/classes/testimage.bbclass                     | 43 +++++++++++++++++--
 meta/lib/oeqa/oetest.py                            | 14 +++++--
 meta/lib/oeqa/runtime/connman.py                   |  5 ---
 meta/lib/oeqa/runtime/df.py                        | 13 ++++++
 meta/lib/oeqa/runtime/dmesg.py                     |  2 +-
 meta/lib/oeqa/runtime/multilib.py                  |  9 ++--
 meta/lib/oeqa/runtime/smart.py                     |  1 +
 meta/lib/oeqa/runtime/syslog.py                    | 37 ++++++++++++++++
 meta/lib/oeqa/utils/decorators.py                  | 12 +++++-
 meta/lib/oeqa/utils/qemurunner.py                  | 12 +++---
 meta/lib/oeqa/utils/sshcontrol.py                  | 49 ++++++++++++----------
 meta/recipes-extended/images/core-image-lsb.bb     |  2 +-
 .../libidn/{libidn_1.27.bb => libidn_1.28.bb}      |  4 +-
 ...binitscripts_9.47.bb => lsbinitscripts_9.48.bb} |  6 +--
 .../mc/{mc_4.8.8.bb => mc_4.8.9.bb}                |  4 +-
 15 files changed, 160 insertions(+), 53 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/df.py
 create mode 100644 meta/lib/oeqa/runtime/syslog.py
 rename meta/recipes-extended/libidn/{libidn_1.27.bb => libidn_1.28.bb} (91%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.47.bb => lsbinitscripts_9.48.bb} (78%)
 rename meta/recipes-extended/mc/{mc_4.8.8.bb => mc_4.8.9.bb} (93%)

-- 
1.8.1.4


