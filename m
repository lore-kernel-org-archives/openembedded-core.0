Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QIGYi-0002rb-3c
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 10:38:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 May 2011 01:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,325,1301900400"; d="scan'208";a="743220413"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 06 May 2011 01:36:06 -0700
Message-Id: <cover.1304670670.git.edwin.zhai@intel.com>
Old-Date: Fri, 6 May 2011 16:31:10 +0800
Date: Fri, 06 May 2011 16:36:14 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 0/1] qemu-script: Fix qemu segfault with Nvidia's proprietary driver
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
X-List-Received-Date: Fri, 06 May 2011 08:38:48 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Previsous solution is only giving warnings as different distro has different
path of mesa libGL. This patch try to use different path for different distro
after looking at /etc/lsb-release per Raj's suggestion. Ubuntu is there, and
other distro handling can be easily added.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: gzhai/fix3
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3

Thanks,
    Zhai Edwin <edwin.zhai@intel.com>
---


Zhai Edwin (1):
  qemu-script: Fix qemu seg fault if install Nvidia proprietary driver.

 scripts/poky-qemu-internal |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)



