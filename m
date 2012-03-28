Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SCqDB-0003sv-H1
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 12:34:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2012 03:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="122592902"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2012 03:25:38 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 18:10:25 +0800
Message-Id: <cover.1332929227.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] gl fix on qemuarm/qemumips
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
X-List-Received-Date: Wed, 28 Mar 2012 10:34:41 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

RP,
This fix make GL apps runs on qemuarm with emulated GLX interface from mesa-xlib.
[YOCTO #2066] got fixed.

Thanks,
Edwin

The following changes since commit 265903bdffb10c95ceaf7a892151a50b67939c71:

  procps: don't print error message with kernel 3.0+ (2012-03-28 10:16:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2

Martin Jansa (1):
  virtual/libgl: switch back to mesa-xlib for qemuarm/qemumips

 meta/conf/distro/include/default-providers.inc |    2 +-
 meta/recipes-graphics/mesa/mesa-xlib.inc       |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.5.4



