Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CCCA970F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 16:11:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 09:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="593549166"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2014 09:11:42 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 19:11:38 +0300
Message-Id: <cover.1409069458.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Upgrade gdb
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
X-List-Received-Date: Tue, 26 Aug 2014 16:11:51 -0000

The following changes since commit 34436672f3ef4915e7526770a0fa8dcff328f93d:

  bitbake: runqueue.py: Fix typoes/grammar in comments. (2014-08-19 20:41:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/gdb
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/gdb

Roxana Ciobanu (1):
  gdb: Upgrade gdb 7.7.1 -> 7.8

 meta/recipes-devtools/gdb/{gdb-7.7.1.inc => gdb-7.8.inc}              | 4 ++--
 .../gdb/{gdb-cross-canadian_7.7.1.bb => gdb-cross-canadian_7.8.bb}    | 0
 meta/recipes-devtools/gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.bb}    | 0
 meta/recipes-devtools/gdb/{gdb_7.7.1.bb => gdb_7.8.bb}                | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.7.1.inc => gdb-7.8.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.7.1.bb => gdb-cross-canadian_7.8.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.7.1.bb => gdb_7.8.bb} (100%)

-- 
1.9.1


