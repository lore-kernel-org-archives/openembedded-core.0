Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28EEF65CBB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 19:27:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 28 May 2016 12:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,380,1459839600"; d="scan'208";a="816832851"
Received: from riturkis-mobl1.amr.corp.intel.com (HELO localhost)
	([10.252.207.19])
	by orsmga003.jf.intel.com with ESMTP; 28 May 2016 12:27:17 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	richard.purdie@linuxfoundation.org
Date: Sat, 28 May 2016 14:27:15 -0500
Message-Id: <cover.1464450270.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1][krogoth] Update KBRANCH for linux-yocto-rt_4.4
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
X-List-Received-Date: Sat, 28 May 2016 19:27:20 -0000

In order to enable branch creation based off of standard/preempt-rt in
the 4.4 kernel, standard/preeempt-rt/base was created, which meant
standard/preempt-rt had to be removed.

This patch updates the 4.4 linux-yocto-rt recipe to point to the new
branch (4.1 and previous versions already had standard/preempt-rt/base
and therefore don't need updates - only 4.4 is affected).

The following changes since commit da4bfbef46e52d2b647a837a47d0f5cb813ba8b2:

  gdb: Backport patch to changes with AVX and MPX (2016-05-22 08:43:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib tzanussi/preempt-rt-kbranch-update-krogoth
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/preempt-rt-kbranch-update-krogoth

Tom Zanussi (1):
  linux-yocto-rt/4.4: Update KBRANCH

 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.3


