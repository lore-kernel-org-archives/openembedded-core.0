Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNsSB-0006Vh-A8
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 21:39:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Nov 2011 12:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72540280"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by orsmga001.jf.intel.com with ESMTP; 08 Nov 2011 12:33:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 12:33:13 -0800
Message-Id: <cover.1320784301.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] Fix Sanity Test Failure
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
X-List-Received-Date: Tue, 08 Nov 2011 20:39:31 -0000

Don't automount /dev/md0 via udev, so blacklist it.

Sau!

The following changes since commit 157db263b50fabf4afcbea3c2a5364c0752ae0e2:

  clutter-gst: fix patch filename (2011-11-08 17:33:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  udev: Blacklist /dev/md

 meta/recipes-core/udev/files/mount.blacklist |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.6.4



