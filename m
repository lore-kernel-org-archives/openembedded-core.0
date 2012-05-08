Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SRdBO-0001QD-RT
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 07:41:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2012 22:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163245595"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 07 May 2012 22:32:05 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 13:28:29 +0800
Message-Id: <cover.1336454749.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1 v3][PULL] Fix bug 2355
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
X-List-Received-Date: Tue, 08 May 2012 05:41:59 -0000

Hi Richard and Saul,

This pull request is to fix bug 2355, please help to review and pull.

Change from v2:
Keep the qt4_arch.inc file and put set_arch() and set_endian() functions there.

Thanks,
Dongxiao

The following changes since commit 2929e7d590862d9649458c90804e79a1dce40423:

  glib-2.0: Fix issues with libelf dependency creeping in (2012-05-07 10:53:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/multilib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/multilib

Dongxiao Xu (1):
  qt4: move functions from python to shell style

 meta/recipes-qt/qt4/qt4-embedded.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    5 ++-
 meta/recipes-qt/qt4/qt4-x11-free.inc        |    2 +-
 meta/recipes-qt/qt4/qt4.inc                 |    5 ++-
 meta/recipes-qt/qt4/qt4_arch.inc            |   36 ++++++++++++---------------
 5 files changed, 24 insertions(+), 26 deletions(-)

-- 
1.7.4.1



