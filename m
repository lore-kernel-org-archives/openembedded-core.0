Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 366AB6B72B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:20:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Mar 2014 08:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,721,1389772800"; d="scan'208";a="506414706"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.64])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2014 08:18:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2014 15:18:50 +0000
Message-Id: <cover.1395674266.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/2] Fix for do_populate_sysroot signature issue
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
X-List-Received-Date: Mon, 24 Mar 2014 15:20:15 -0000

The following changes since commit 4a47c943a76e79af82d47d8fa83c6687e0d915a0:

  busybox: disable fsck.minix and mkfs.minix (2014-03-23 09:08:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/staging-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/staging-fix

Paul Eggleton (2):
  classes/staging: ensure do_populate_sysroot re-execs on changes to
    sysroot preprocessing funcs
  classes/binconfig: fix indentation in python function

 meta/classes/binconfig.bbclass | 44 +++++++++++++++++++++---------------------
 meta/classes/staging.bbclass   |  2 ++
 2 files changed, 24 insertions(+), 22 deletions(-)

-- 
1.8.5.3


