Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qo8DZ-0001UU-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 08:12:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2011 23:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,305,1309762800"; d="scan'208";a="36936717"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2011 23:08:18 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 14:08:31 +0800
Message-Id: <cover.1312265186.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix to bug 671
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
X-List-Received-Date: Tue, 02 Aug 2011 06:12:41 -0000

The following changes since commit 46cf540e63a848512617b20fd8492f81bfb2f704:

  arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case (2011-08-01 16:49:11 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/bug-671
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bug-671

Dexuan Cui (1):
  oe-init-build-env, scripts/oe-buildenv-internal: add error detecting
    for $BDIR

 oe-init-build-env            |    6 +++---
 scripts/oe-buildenv-internal |   13 +++++++++++--
 2 files changed, 14 insertions(+), 5 deletions(-)

-- 
1.7.6



