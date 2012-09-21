Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TF8px-0000v3-VW
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 21:24:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Sep 2012 12:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="225025808"
Received: from unknown (HELO localhost) ([10.255.13.250])
	by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2012 12:11:44 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 14:11:42 -0500
Message-Id: <cover.1348254442.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1] mount debugfs when applicable
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
X-List-Received-Date: Fri, 21 Sep 2012 19:24:30 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

If debugfs is available, it should be mounted and made available
to users.  This patch mounts it if present.

The following changes since commit df74f8d9a8b1500da3fffd77f12ec8d1900d0bf6:

  gcc: Use 4.7.2 release tarball (2012-09-21 14:55:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/debugfs-mount
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/debugfs-mount

Tom Zanussi (1):
  initscripts/sysfs.sh: mount debugfs if present

 meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh | 4 ++++
 meta/recipes-core/initscripts/initscripts_1.0.bb       | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.11.4



