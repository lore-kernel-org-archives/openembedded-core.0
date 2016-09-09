Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E15C360116
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 16:37:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Sep 2016 09:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,305,1470726000"; d="scan'208";a="1027486429"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga001.jf.intel.com with ESMTP; 09 Sep 2016 09:37:31 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2016 09:38:52 -0700
Message-Id: <cover.1473438968.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] qemurunner:log testimage qemu launch command
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
X-List-Received-Date: Fri, 09 Sep 2016 16:37:31 -0000

This logs the command that "bitbake <image> -c testimage" used to launch qemu.
This is helpful if a test failed and you would like to manually start qemu in the
same way to debug the failed test.  With this addition you can just cut and paste
the runqemu command from the log.do_testimage file.

-b

The following changes since commit 2679a347c576f5411fbe802d2f6201c94036ecb2:

  maintainers.inc: rename gtk-doc-stub to gtk-doc, reassign to me (2016-09-09 12:12:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/log-runqemu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/log-runqemu

bavery (1):
  qemurunner: print out the runqemu command

 meta/lib/oeqa/utils/qemurunner.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--
1.9.1

