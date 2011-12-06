Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RXkiA-00059f-6O
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 03:24:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 18:18:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,302,1320652800"; d="scan'208";a="82548329"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.192])
	by azsmga001.ch.intel.com with ESMTP; 05 Dec 2011 18:18:02 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 18:17:57 -0800
Message-Id: <cover.1323137480.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 0/4] Make missing checksums an error v2 + clutter-gst update
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
X-List-Received-Date: Tue, 06 Dec 2011 02:24:50 -0000

NOTE: this requires a patch I sent to the BitBake list[1] to error cleanly,
otherwise you'll see a Python backtrace and the build fail...

This is v2 of a series to add set BB_STRICT_CHECKSUM in default-distrovars.inc
so that missing checksums in recipes raises an error.

Since v1 I've run a test over OE-core to ensure to ensure I can do world
fetches for each of the qemu machines and discovered that omap3-sgx-modules
and puzzles recipes needed checksums adding.

I've snuck an extra patch lying on my disk into the queue too, an update for
clutter-gst.

Regards,
Joshua


The following changes since commit 044324465bd54d53ae768f3c1e7468ae0e0c6200:

  dpkg-native: Fix perl path (2011-12-02 15:31:03 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/checksums
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/checksums

Joshua Lock (4):
  omap3-sgx-modules: set SRC_URI checksums
  puzzles: set SRC_URI checksums
  default-distrovars: missing checksums should raise an error
  clutter-gst: upgrade to 1.4.4

 meta/conf/distro/include/default-distrovars.inc    |    3 +++
 .../omap3-sgx-modules_1.3.13.1397.bb               |    2 ++
 ...r-gst-1.8_1.4.2.bb => clutter-gst-1.8_1.4.4.bb} |    4 ++--
 meta/recipes-sato/puzzles/puzzles_r9306.bb         |    8 ++++----
 4 files changed, 11 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-1.8_1.4.2.bb => clutter-gst-1.8_1.4.4.bb} (80%)

-- 
1.7.7.3



