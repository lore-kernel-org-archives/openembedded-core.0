Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S04zQ-0004uy-It
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 06:43:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 21:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109294425"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 21:34:17 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 13:33:41 +0800
Message-Id: <cover.1329888524.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/3] Fixes for multilib
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
X-List-Received-Date: Wed, 22 Feb 2012 05:43:44 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
These are fixes for multilib, and [Yocto 1906].

Pls. help to pull.

Thanks,
Edwin

The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:

  guile: fix cross configure failure (2012-02-10 17:01:42 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (3):
  quicky: Fix for multilib
  texi2html: Fix for multilib
  vte: fix scroll issue

 meta/recipes-extended/texi2html/texi2html_5.0.bb |    2 +-
 meta/recipes-qt/qt-apps/quicky_0.4.bb            |    2 +-
 meta/recipes-support/vte/vte.inc                 |    3 +-
 meta/recipes-support/vte/vte/scrollbar_fix.patch |  122 ++++++++++++++++++++++
 meta/recipes-support/vte/vte_0.28.2.bb           |    2 +-
 5 files changed, 127 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/scrollbar_fix.patch



