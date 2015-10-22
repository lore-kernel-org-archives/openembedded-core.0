Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E421C60232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 21:49:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 22 Oct 2015 14:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,184,1444719600"; d="scan'208";a="669848751"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 14:49:59 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 13:39:18 +0000
Message-Id: <cover.1445520365.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2] Enable logs for ping test fail
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
X-List-Received-Date: Thu, 22 Oct 2015 21:50:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These two patches add some logging and checking on the interfaces
when qemu is started.

The following changes since commit 8578bc17b54da97d42b257b3c8f398ac52b91a9f:

  libc-package: Fix localedef multilib dependency issues (2015-10-20 10:12:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8550
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8550

Mariano Lopez (2):
  qemurunner: Show the output of runqemu script
  runqemu-ifup: Check if the tap interface is set up correctly

 meta/lib/oeqa/utils/qemurunner.py |  1 +
 scripts/runqemu-ifup              | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

-- 
1.8.4.5


