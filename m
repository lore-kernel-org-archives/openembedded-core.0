Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB736BA22
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 12:52:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Sep 2013 05:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1007,1367996400"; d="scan'208";a="397040757"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.155])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2013 05:52:10 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 15:50:50 +0300
Message-Id: <cover.1378125322.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Fix MACHINE regex in runqemu
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
X-List-Received-Date: Mon, 02 Sep 2013 12:52:11 -0000

The MACHINE variable wasn't correcty detected from a kernel filename.

The following changes since commit c7994f83baa678a4670472e1f037bfc16cb1e3be:

  bitbake: runqueue: Fix scenequeue to pass file descriptors, not a float (2013-09-02 09:16:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/b2890
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihaip/b2890

Mihai Prica (1):
  scripts/runqemu: Fix MACHINE regex

 scripts/runqemu |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


