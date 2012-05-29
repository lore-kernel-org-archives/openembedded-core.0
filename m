Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SZHxJ-0003w5-IR
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 10:39:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 May 2012 01:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172198583"
Received: from yocto-build3.sh.intel.com ([10.239.48.5])
	by fmsmga002.fm.intel.com with ESMTP; 29 May 2012 01:27:47 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2012 16:30:32 +0800
Message-Id: <cover.1338280083.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] [v2]qemu: Add an option to remove host sdl/gl checking
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
X-List-Received-Date: Tue, 29 May 2012 08:39:05 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Saul,
This is the V2 version to fix build error for qemu and qemu-nativesdk.

Add an PACKAGECONFIG in qemu to disable GL acceleration:
* By default configure try best to enable GL acceleration and fail when missing
  host dependency(libSDL and libGL).
* End user can also choose to turn off GL capability, thus remove the host
  dependence in building.

[YOCTO #2407] got fixed.

Thanks,
Edwin

The following changes since commit 54f38111868775c85bfe921592d8443a61952c62:

  pango: Fix modules load failure in multilib environment (2012-05-14 21:50:55 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/fix2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix2

Zhai Edwin (1):
  qemu: Add an option to remove host sdl/gl checking

 .../qemu/qemu-0.15.1/dummy-gl-config.patch         |   31 +++++
 .../qemu/qemu-0.15.1/glflags.patch                 |   40 ++++--
 .../qemu/qemu-0.15.1/opengl-disable-option.patch   |  137 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |   23 +---
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    4 +-
 5 files changed, 203 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/dummy-gl-config.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch



