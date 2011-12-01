Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RW2Y8-0005pm-0Y
	for openembedded-core@openembedded.org; Thu, 01 Dec 2011 10:03:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 00:55:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,277,1320652800"; d="scan'208";a="80999408"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 00:55:36 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 16:54:41 +0800
Message-Id: <cover.1322729357.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1]Fix some recipes check upstream version issue
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
X-List-Received-Date: Thu, 01 Dec 2011 09:03:26 -0000

Hi all,
	Some recipes(like rt-tests,clutter-box2d,iproute2) didn't check the right upstream version because lack of protocal declaration.
	Fix this by add their upstream protocal at the end of SRC_URI.

Thanks,
Lei

The following changes since commit f4efaa0f472b4bf0ba0a0297cc9ecc8b5a671f72:
  Martin Jansa (1):
        squashfs-tools: fix PR, those should start with 'r'

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/fix-upver-check
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/fix-upver-check

Mei Lei (1):
  Fix some recipes upstream version check issue

 .../iproute2/iproute2_3.1.0.bb                     |    2 +-
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb          |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)



