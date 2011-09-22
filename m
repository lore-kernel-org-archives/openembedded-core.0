Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R6esm-0007Xb-VY
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 10:43:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Sep 2011 01:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,421,1312182000"; d="scan'208";a="59486762"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2011 01:38:28 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 16:38:34 +0800
Message-Id: <cover.1316680595.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix to bug 1507
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
X-List-Received-Date: Thu, 22 Sep 2011 08:43:49 -0000

Thanks a lot for RP's suggestion about how to make the patch.

The following changes since commit 468e4a2f0e63e9d33e88b98a7d075b186ef481b2:

  glib-2.0: Drop old 2.27.5 development version (2011-09-22 08:47:22 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/bug-1507
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bug-1507

Dexuan Cui (1):
  qemu-config: use pkg_postinst to generate the proper shutdown.desktop

 meta/recipes-bsp/qemu-config/qemu-config.bb        |    7 ++++++-
 .../qemu-config/qemuarm/shutdown.desktop           |   10 ----------
 2 files changed, 6 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config/qemuarm/shutdown.desktop

-- 
1.7.6



