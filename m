Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RWYl9-0004vX-O6
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 20:27:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 11:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43382320"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.18])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 11:20:15 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 11:20:14 -0800
Message-Id: <cover.1322853315.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 0/1] Make missing checksums an error
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
X-List-Received-Date: Fri, 02 Dec 2011 19:27:00 -0000

NOTE: this requires a patch I sent to the BitBake list[1] to error cleanly,
otherwise you'll see a Python backtrace and the build fail...

Per some discussion on the list recently this patch sets BB_STRICT_CHECKSUM
in the default-distrovars.inc so that missing checksums in recipes raises an
error.

Cheers,
Joshua

1. lists.linuxtogo.org/pipermail/bitbake-devel/2011-December/thread.html 

The following changes since commit 044324465bd54d53ae768f3c1e7468ae0e0c6200:

  dpkg-native: Fix perl path (2011-12-02 15:31:03 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/checksums
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/checksums

Joshua Lock (1):
  default-distrovars: missing checksums should raise an error

 meta/conf/distro/include/default-distrovars.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.7.3



