Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B66856102E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 08:06:15 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Sep 2013 01:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,941,1371106800"; d="scan'208";a="297206051"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Sep 2013 01:06:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 11:06:06 +0300
Message-Id: <cover.1379662642.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] runqemu: set qemuarm memory size back to 128MB
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
X-List-Received-Date: Fri, 20 Sep 2013 08:06:16 -0000

Hi,

I investigated this issue(#5133) for some time but failed to find the root
cause, so far.  I reverted the memory back to 128MB so that it can be tested on
AB to see if the smart sanity tests (which was the cause for this increase)
pass. Apparently, those tests failed only on x86 qemu machines. This patch is
only a workaround, if a proper solution cannot be found in time for the
release.

However, if there are people on this list that could help on tracking this
down, feel free to reply to this. You can also find more info about the issue
itself in the commit message.

Thanks,
Laurentiu

The following changes since commit 853bc53cd58a621918f0e5ce662dba263d1befb4:

  qemu: Fix broken patch (2013-09-18 21:56:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5133_sudoku_savant_issue
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5133_sudoku_savant_issue

Laurentiu Palcu (1):
  runqemu: set qemuarm memory size back to 128MB

 scripts/runqemu-internal |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


