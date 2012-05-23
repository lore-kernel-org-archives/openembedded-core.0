Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXKXw-0004SN-Qk
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 01:00:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 15:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103525776"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 15:50:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 15:46:11 -0700
Message-Id: <cover.1337805812.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [Consolidated Pull 0/5] Xorg & Qemu Updates
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
X-List-Received-Date: Wed, 23 May 2012 23:00:49 -0000

Richard,

I am pulling together tested subsets that have been lingering
in the queue.  I have built / rebuilt these qemu updates to use
xorg-xserver.  I have verified that X starts on mips/ppc/x86 and
they correctly report X Server 1.11.2, which is the xorg-xserver
version.


Sau!

The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/xorg
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/xorg

Khem Raj (2):
  qemumachines: Enable xserver-xorg as default xserver
  xserver-xf86-config: Add xorg.conf for arm,mips,ppc,sh qemu machines

Saul Wold (2):
  qemu.inc: Remove mesa-xlib as PREFERRED_PROVIDER
  qemu: disable vnc-jpeg compression

Zhai Edwin (1):
  qemu: Add an option to remove host sdl/gl checking

 meta/conf/machine/include/qemu.inc                 |   10 +-
 meta/conf/machine/qemux86-64.conf                  |    3 +-
 meta/conf/machine/qemux86.conf                     |    3 +-
 .../qemu/qemu-0.15.1/opengl-disable-option.patch   |  172 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |   25 +---
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++
 .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++
 .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++
 .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++
 .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
 12 files changed, 536 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-disable-option.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf

-- 
1.7.7.6



