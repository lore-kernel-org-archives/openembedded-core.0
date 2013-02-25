Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1UA6Vn-00024Q-5b
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 23:27:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2013 14:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="267466830"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.69])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2013 14:09:42 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 14:20:51 -0800
Message-Id: <cover.1361830589.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Add kernel arch variable in SDK environment variable list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2013 22:27:24 -0000

The following changes since commit 2cc4fe4a0874c42421b1bf3fa100160a9e60a9da:

  upstream_tracking.inc: Coonectivity and multimedia packages updates (2013-02-25 05:58:20 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/kernel-arch-variable
  http://git.yoctoproject.org/cgit.cgi//log/?h=master

Jessica Zhang (1):
  Add kernel arch variable in SDK environment variable list for
    supporting build external kernel module using SDK

 meta/classes/toolchain-scripts.bbclass |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.9.5



