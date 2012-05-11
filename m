Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStgw-00033L-Ar
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:31:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 May 2012 10:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99043270"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 10:21:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 10:21:44 -0700
Message-Id: <cover.1336756650.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 0/4] QEMU Transition to xserver_xorg
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
X-List-Received-Date: Fri, 11 May 2012 17:31:46 -0000

Richard,

This has been run thought the AB and I have ran QEMU locally with 
the new xserver change.

There were a few issues noted and Khen and I have cleaned then up 
at this time.

Sau!

The following changes since commit 74daad03ca29a03b0005f7d2b90a0347d5b583a5:

  package.bbclass: Drop EXPORT_FUNCTIONS use against mapping_rename_hook (2012-05-11 18:03:26 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (3):
  qemumachines: Enable xserver-xorg as default xserver
  xserver-xf86-config: Add xorg.conf for arm,mips,ppc,sh qemu machines
  xserver-xorg: Fix build on powerpc

Saul Wold (1):
  qemu.inc: Remove mesa-xlib as PREFERRED_PROVIDER

 meta/conf/machine/include/qemu.inc                 |   10 ++-
 meta/conf/machine/qemux86-64.conf                  |    3 +-
 meta/conf/machine/qemux86.conf                     |    3 +-
 .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 ++-
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 +++++++++
 11 files changed, 396 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch

-- 
1.7.7.6



