Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RSjnP-00062Y-7U
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 07:25:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Nov 2011 22:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,551,1315206000"; d="scan'208";a="77837151"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 21 Nov 2011 22:17:54 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:15:07 +0800
Message-Id: <cover.1321942325.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Fix matchbox-window-manager variable type error on x86-64
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
X-List-Received-Date: Tue, 22 Nov 2011 06:25:32 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

RP,
This fix the blank screen of matchbox-desktop caused by wrong variable type for
_NET_WORKAREA in matchbox-window-manager.

[YOCTO #1689] fixed.

The following changes since commit 17a92c4c9801396ce6aa82f7c1532b49b18dbad4:

  netbase: update 4.46 -> 4.47 (2011-11-21 18:49:40 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (1):
  matchbox-wm: Fix variable type in _NET_WORKAREA setting

 .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



