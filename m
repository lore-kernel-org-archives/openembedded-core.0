Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QCCco-0008Q7-HC
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 17:13:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2011 08:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,240,1301900400"; d="scan'208";a="911686767"
Received: from unknown (HELO localhost) ([10.255.12.227])
	by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2011 08:11:35 -0700
Message-Id: <cover.1303170477.git.dvhart@linux.intel.com>
Old-Date: Mon, 18 Apr 2011 16:47:57 -0700
Date: Tue, 19 Apr 2011  8:11:35 -0700
To: openembedded-core@lists.openembedded.org
From: Darren Hart <dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/2] kernel.bbclass fix and cleanup
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
X-List-Received-Date: Tue, 19 Apr 2011 15:13:59 -0000

From: Darren Hart <dvhart@linux.intel.com>

The following commit introduced a build bug and left some debug lying around.

commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58
Author: Darren Hart <dvhart@linux.intel.com>
Date:   Tue Mar 8 17:09:10 2011 -0800
kernel/bbclass: rework kernel and module classes to allow for building
out-of-tree modules

The following 2 patches address that.

Thanks,
    Darren Hart <dvhart@linux.intel.com>
---


Darren Hart (2):
  kernel: Copy over bzImage to sysroots during install
  kernel: Remove debug statements

 meta/classes/kernel.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

-- 
1.7.3.4



