Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SEAqc-0007TX-Ln
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 04:48:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Mar 2012 19:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125670253"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by azsmga001.ch.intel.com with ESMTP; 31 Mar 2012 19:39:46 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2012 10:24:27 +0800
Message-Id: <cover.1333246894.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fixed GL apps failure on qemux86/x86-64 on Ubuntu 11 with Nvidia GLX driver, Apr1, 2012
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
X-List-Received-Date: Sun, 01 Apr 2012 02:48:55 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
Previous version of nVidia GLX driver in Ubuntu 10 cause qemu segfault, so we
fall back to Mesa GLX driver if detecting nVidia driver installed. From Ubuntu
11, nVidia GLX driver works well, while previous work around cause GL apps
failure. So this work around is limited in Ubuntu 10 only, and will be removed
in future.

Pls. help to review and pull.

Thanks,
Edwin

The following changes since commit 8691a588267472eb5a32b978a0eb9ddfd0c91733:

  cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:59 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2

Zhai Edwin (1):
  qemugl: Fix GL apps failure on Ubuntu 11 host with nVidia GLX driver

 scripts/runqemu-internal |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.7.5.4



