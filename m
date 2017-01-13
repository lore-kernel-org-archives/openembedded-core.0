Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F01F6071F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 22:37:30 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2017 14:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,223,1477983600"; d="scan'208";a="53643584"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2017 14:37:30 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:33:53 +0000
Message-Id: <cover.1484317844.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/2] Be sure to kill qemu-system on testimage
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
X-List-Received-Date: Fri, 13 Jan 2017 22:37:33 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

With refactor of runqemu to use python instead of shel scripting,
the qemu-system process keeps running if runqemu fails. This series
will fix this and will terminate qemu-system explicity.

The following changes since commit 81021bc0aa0f64e67535f6a9551e921a64fe4395:

  yocto-project-qs, ref-manual: Added note for "resources temporarily unavailable" error (2017-01-11 17:23:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/qemu_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/qemu_fix

Mariano Lopez (2):
  oeqa/utils/qemurunner.py: Add missing sys module
  oeqa/utils/qemurunner.py: Be sure to stop qemu-system

 meta/classes/testimage.bbclass    |  2 ++
 meta/lib/oeqa/utils/qemurunner.py | 10 ++++++++++
 2 files changed, 12 insertions(+)

-- 
2.6.6


