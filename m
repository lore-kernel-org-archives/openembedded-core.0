Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SfWDT-0002KJ-T2
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 15:05:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2012 05:54:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158041521"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 05:54:51 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 15:54:47 +0300
Message-Id: <1339764889-25852-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] An upgrade and a fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 13:05:33 -0000

Basically, the subject says it all. For puzzles, I did some basic sanity tests
in qemu using core-image-sato.

Laurentiu Palcu (2):
  directfb: added missing Upstream-status
  puzzles: upgrade to r9561

 ...ibdirect-remove-include-of-linux-config.h.patch |    2 ++
 .../puzzles/{puzzles_r9375.bb => puzzles_r9561.bb} |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/puzzles/{puzzles_r9375.bb => puzzles_r9561.bb} (88%)

-- 
1.7.9.5



