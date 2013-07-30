Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id F36356B410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:35:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2013 01:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="275197776"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 01:35:17 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id E3C842C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:35:15 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 11:35:50 +0300
Message-Id: <cover.1375171561.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Small tweaks for testimage
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
X-List-Received-Date: Tue, 30 Jul 2013 08:35:18 -0000

The following changes since commit bd1c441a210cae03fb6006c996227211cc29056b:

  bitbake: bitbake: runqueue: add warning if invalidating invalid task (2013-07-29 15:25:09 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/testimage-fix1

for you to fetch changes up to edec10deb2863c79750af25b31d39f7d0904c8a8:

  oeqa/runtime/xorg: use the right ps command for xorg test (2013-07-30 11:02:09 +0300)

----------------------------------------------------------------
Stefan Stanacar (4):
      oeqa/utils/sshcontrol: increase and log timeout in output
      oeqa/utils/qemurunner: add comment and header
      oeqa/utils/qemurunner: tweak console bootparam and ip command
      oeqa/runtime/xorg: use the right ps command for xorg test

 meta/lib/oeqa/runtime/xorg.py     |  4 ++--
 meta/lib/oeqa/utils/qemurunner.py | 11 +++++++++--
 meta/lib/oeqa/utils/sshcontrol.py | 10 ++++++----
 3 files changed, 17 insertions(+), 8 deletions(-)

Stefan Stanacar (4):
  oeqa/utils/sshcontrol: increase and log timeout in output
  oeqa/utils/qemurunner: add comment and header
  oeqa/utils/qemurunner: tweak console bootparam and ip command
  oeqa/runtime/xorg: use the right ps command for xorg test

 meta/lib/oeqa/runtime/xorg.py     |  4 ++--
 meta/lib/oeqa/utils/qemurunner.py | 11 +++++++++--
 meta/lib/oeqa/utils/sshcontrol.py | 10 ++++++----
 3 files changed, 17 insertions(+), 8 deletions(-)

-- 
1.8.3.1


