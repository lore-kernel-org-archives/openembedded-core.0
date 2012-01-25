Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RpvPu-0003BG-8x
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 06:29:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2012 21:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="102406644"
Received: from unknown (HELO localhost) ([10.255.14.109])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2012 21:21:18 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Tue, 24 Jan 2012 21:20:50 -0800
Message-Id: <cover.1327468756.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] bootimg: Fix a math thinko in the block count calculation
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
X-List-Received-Date: Wed, 25 Jan 2012 05:29:06 -0000

The following changes since commit 6b2cb8280211d2e28ce75d6a107f99a3fa7868ae:

  gcc-common.inc: Fix comment (2012-01-24 14:38:39 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/bug/1852
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/bug/1852

Darren Hart (1):
  bootimg: Fix a math thinko in the block count calculation

 meta/classes/bootimg.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6.5



