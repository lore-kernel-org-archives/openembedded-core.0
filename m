Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Q9RGX-0007Hb-D1
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 02:15:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2011 17:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="732024413"
Received: from yocto-build8.sh.intel.com (HELO localhost) ([10.239.48.1])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2011 17:13:19 -0700
Message-Id: <cover.1302565606.git.edwin.zhai@intel.com>
Old-Date: Tue, 12 Apr 2011 07:46:46 +0800
Date: Tue, 12 Apr 2011  8:10:59 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 0/1] [PULL] [QEMU] fix GL Apps start failure
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
X-List-Received-Date: Tue, 12 Apr 2011 00:15:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This is the patch to fix the GL apps like glxgears start failure on qemux86 image.
Pls. review and pull.

Thanks,
edwin

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: gzhai/fix3
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3

Thanks,
    Zhai Edwin <edwin.zhai@intel.com>
---


Zhai Edwin (1):
  qemu: Fix the qemu GL application start failure.

 .../qemu/qemu-0.14.0/qemugl-fix.patch              |   70 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    1 +
 meta/recipes-sato/pimlico/dates_git.bb             |    2 +
 3 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch



