Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3A76FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:52:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 16 Sep 2016 05:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="1031537831"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.107])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2016 05:52:43 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 13:52:27 +0100
Message-Id: <cover.1474030160.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/6] runqemu fixes
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
X-List-Received-Date: Fri, 16 Sep 2016 12:52:43 -0000

This series includes several fixes and enhancements for runqemu to better align
with the previous shell based implementation.

The following changes since commit 059d475b6bce1e5414170a4fe2e7989f6b0eacd6:

  oeqa/utils/decorators: LogResults fix race condition in linkfile (2016-09-15 12:14:40 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/runqemu

Joshua Lock (6):
  runqemu: add guidance to resolve issues with missing files
  qemuboot: write the full kernel filename, not the link name
  runqemu: clarify an INFO message
  qemuboot: also write the kernel link name to the conf file
  runqemu: try symlinks when kernel or rootfs can't be found
  runqemu: work even if a *.qemuboot.conf isn't found

 meta/classes/qemuboot.bbclass | 13 +++++++++++--
 scripts/runqemu               | 43 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 47 insertions(+), 9 deletions(-)

-- 
2.7.4

