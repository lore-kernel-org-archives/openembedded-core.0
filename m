Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1TyWZN-0001fR-KN
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 00:51:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2013 15:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,532,1355126400"; d="scan'208";a="252058023"
Received: from wrk.jf.intel.com ([10.7.202.72])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2013 15:35:19 -0800
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 15:34:03 -0800
Message-Id: <cover.1359069690.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] archiver.bbclass: fix copyleft filter behavior
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
X-List-Received-Date: Thu, 24 Jan 2013 23:51:00 -0000

The following changes since commit 2e2a91025ca9c113365c810ce08b48201fe792b8:

  systemd: Fix build on ppc (2013-01-24 20:08:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib strassek/archiver_copyleft_filter
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=strassek/archiver_copyleft_filter

Kevin Strasser (1):
  archvier.bbclass: fix copyleft filter behavior

 meta/classes/archiver.bbclass |    6 ++++--
 meta/lib/oe/license.py        |    4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.9.5



