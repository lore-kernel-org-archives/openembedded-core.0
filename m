Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S8WAP-0003EA-NP
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 13:21:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2012 05:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129726087"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2012 05:12:04 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 19:57:01 +0800
Message-Id: <cover.1331897967.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] qemugl fix
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
X-List-Received-Date: Fri, 16 Mar 2012 12:21:58 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

RP,
This fixed [YOCTO #1927]. Pls. help to review and pull.

Thanks,
Edwin

The following changes since commit be0f9dd483af2a2f55b2ae8ef9ca172e7c90819c:

  python-imaging: bring in fixes from meta-oe (2012-03-16 10:57:09 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2

Zhai Edwin (1):
  qemugl: Hide some GLX extensions by default

 .../mesa/qemugl/extensions_emulation.patch         |   34 ++++++++++++++++++++
 meta/recipes-graphics/mesa/qemugl_git.bb           |    5 ++-
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/qemugl/extensions_emulation.patch

-- 
1.7.5.4



