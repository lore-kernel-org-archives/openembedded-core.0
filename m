Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RbSr7-0004o5-KW
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 09:09:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2011 00:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87202609"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2011 00:01:20 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 15:53:21 +0800
Message-Id: <cover.1324021777.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Some bug fixing, Edwin, Dec16, 2011
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
X-List-Received-Date: Fri, 16 Dec 2011 08:09:25 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

all,
    These patches fix rootless X start failure and dates launch hang. Pls. pull.

Thanks,
Edwin

The following changes since commit 6036845d1c07420a99b78421bb3479adf7d754e7:

  Patch Upstream Status Updates (2011-12-15 14:36:26 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (2):
  xserver-nodm-init: Fix xuser creation
  libical: Fix deadlock in pthread

 .../x11-common/xserver-nodm-init.bb                |    6 +-
 meta/recipes-sato/libical/files/pthread-fix.patch  |   52 ++++++++++++++++++++
 meta/recipes-sato/libical/libical_0.47.bb          |    5 ++-
 3 files changed, 59 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-sato/libical/files/pthread-fix.patch



