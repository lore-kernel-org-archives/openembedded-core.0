Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD25710D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 17:36:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 10:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="593594928"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.68])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2014 10:36:54 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 10:34:08 -0700
Message-Id: <cover.1409074419.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/5] Add xf86-video-fbdev and xf86-video-cirrus to qemux86 and qemux86-64 [v4]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Aug 2014 17:36:59 -0000

Hello list,

This series adds additional x.org drivers to the qemux86 and qemux86-64
machines. Now, instead of just including the "vmware" driver, GUI images for
these machines will also include "cirrus" and "fbdev" drivers. Rationale: now
that the runqemu script allows users to select which VGA adapter they want
qemu to emulate, the qemu images should be able to start X servers with any
adapter without requiring a rebuild of the image.

Note that the drivers have only been added to the qemux86 and qemux86-64
machines. If someone is interested in trying them on the other qemu machines,
they shouldn't be hard to add.

xf86-video-cirrus did not previously have a recipe, so a new one is also added
as part of this series.

REVISED AGAIN: split xorg.conf changes into their own commits.

Regards,
-Max Eliaser
The following changes since commit 6882d2d9993c8655a292c93e84ea01b4738a700d:

  yocto-project-qs, ref-manual: Added 'socat' package to essentials. (2014-08-12 13:50:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib meliaser/qemu-x-drivers
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/qemu-x-drivers

Max Eliaser (5):
  xorg-drivers: xf86-video-cirrus: add a recipe for the Cirrus Logic
    X.Org driver
  qemux86: xorg.conf: allow X.Org driver to be selected automatically.
  qemux86: support X11 when QEMU is emulating a different GPU than
    vmware
  qemux86-64: xorg.conf: allow X.Org driver to be selected
    automatically.
  qemux86-64: support X11 when QEMU is emulating a different GPU than
    vmware

 meta/conf/machine/qemux86-64.conf                           |  2 ++
 meta/conf/machine/qemux86.conf                              |  2 ++
 .../recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb | 13 +++++++++++++
 .../xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf   |  5 -----
 .../xorg-xserver/xserver-xf86-config/qemux86/xorg.conf      |  5 -----
 5 files changed, 17 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb

-- 
1.8.3.2


