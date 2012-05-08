Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SRlkD-0002k9-6O
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 16:50:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2012 07:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163439113"
Received: from yocto-build3.sh.intel.com ([10.239.48.5])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2012 07:40:36 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:43:48 +0800
Message-Id: <cover.1336487657.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][V2] Fix pango modules load failure in multilib environment, Edwin, May8, 2012
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
X-List-Received-Date: Tue, 08 May 2012 14:50:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
This is the new version based on RP's comments:
* Use MLPREFIX rather than ${baselib} dir to separate config/util
* Pass MLPREFIX as configure option so that pango can use it directly.

This patch doesn't change anying in non-multilib environment. Pls. help to pull.

Thanks,
Edwin

The following changes since commit 2c3d4f5beee8f57a74244495511b9294df1085ea:

  documentation/bsp-guide/bsp.xml: spelling corrected. (2012-04-18 16:42:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2

Zhai Edwin (1):
  pango: Fix modules load failure in multilib environment

 .../pango/pango-1.28.4/multilib-fix-clean.patch    |   40 ++++++++++++++++++++
 meta/recipes-graphics/pango/pango.inc              |   13 +++++-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    7 ++-
 3 files changed, 55 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch



