Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8XAH-0005m7-IR
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 15:58:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 06:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217553076"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 06:45:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 14:45:35 +0100
Message-Id: <cover.1346679751.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] qemu-config split
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 13:58:09 -0000

This is the qemu-config split as posted as an RFC a few weeks ago,
rebased on top of the package group changes (since it adds a package
group), and additionally with anjuta-remote-run removed from the final
package group.


The following changes since commit fe1a13be8e1d170100147308822458f494c930ed:

  packagegroup-*: add RPROVIDES for backwards compatibility (2012-09-03 14:20:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qemu-config2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qemu-config2

Paul Eggleton (7):
  qemu-config: relicense as MIT
  oprofileui: split server to separate recipe to avoid X11 dependency
  qemu-config: split out anjuta-remote-run
  oprofileui-server: move initscript from qemu-config
  qemu-config: split out shutdown icon to its own recipe
  qemu-config: split out export of root via NFS to its own recipe
  qemu-config: turn into distcc-config and a package group

 meta/recipes-bsp/qemu-config/qemu-config.bb        |   45 ---
 .../qemu-config/qemu-config/COPYING.GPL            |  339 --------------------
 .../devel-config/anjuta-remote-run.bb              |   19 ++
 .../anjuta-remote-run}/anjuta-remote-run           |    0
 .../recipes-devtools/devel-config/distcc-config.bb |   25 ++
 .../devel-config/distcc-config}/distcc.sh          |    2 +-
 .../devel-config/nfs-export-root.bb                |   17 +
 .../devel-config/nfs-export-root}/exports          |    0
 .../packagegroup-core-device-devel.bb              |   15 +
 .../oprofile/oprofileui-server/init}               |    8 +-
 .../oprofile/oprofileui-server_git.bb              |   24 ++
 meta/recipes-kernel/oprofile/oprofileui.inc        |   11 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |   10 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |    1 +
 .../shutdown-desktop/shutdown-desktop.bb           |   20 ++
 .../shutdown-desktop}/shutdown.desktop             |    0
 16 files changed, 137 insertions(+), 399 deletions(-)
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config.bb
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config/COPYING.GPL
 create mode 100644 meta/recipes-devtools/devel-config/anjuta-remote-run.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/anjuta-remote-run}/anjuta-remote-run (100%)
 create mode 100644 meta/recipes-devtools/devel-config/distcc-config.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/distcc-config}/distcc.sh (57%)
 create mode 100644 meta/recipes-devtools/devel-config/nfs-export-root.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/nfs-export-root}/exports (100%)
 create mode 100644 meta/recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config/qemu-autostart => recipes-kernel/oprofile/oprofileui-server/init} (74%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server_git.bb
 create mode 100644 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-sato/shutdown-desktop/shutdown-desktop}/shutdown.desktop (100%)

-- 
1.7.9.5



