Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 92A9F6B6BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:47:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Apr 2014 10:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,796,1389772800"; d="scan'208";a="507126321"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2014 10:46:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 18:46:35 +0100
Message-Id: <cover.1396633542.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [dora][PATCH 0/4] Fixes backported from master
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
X-List-Received-Date: Fri, 04 Apr 2014 17:47:41 -0000

The following changes since commit 590c2135858bb5d0cfc375c0d82ca610550ccd4a:

  Revert "buildhistory_analysis: fix error when comparing image contents" (2014-04-04 16:16:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dora-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dora-next

Paul Eggleton (2):
  classes/kernel: move module postinst commands to kernel-base
  classes/image: ignore modules.* changing during multilib image
    construction

Richard Purdie (2):
  sstatesig.py: Fix image regeneration issue
  sstatesig: Anchor inherits class tests

 meta/classes/image.bbclass  | 2 +-
 meta/classes/kernel.bbclass | 7 +++++--
 meta/lib/oe/sstatesig.py    | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
1.9.0


