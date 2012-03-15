Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8GHU-00032W-9g
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:24:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 12:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121397447"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 12:15:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 12:15:12 -0700
Message-Id: <cover.1331837170.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 00/11] Warning Fixes
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
X-List-Received-Date: Thu, 15 Mar 2012 19:24:12 -0000

This addesses more warnings.  

I did a check with buildhistory, before and after the bitbake.conf
change and did not see any negative issues.

We can discuss this further and I can send you logs if needed

Sau!


The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:

  qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/warns
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/warns

Saul Wold (11):
  bitbake.conf: Modify PACKAGE list ordering to insert -staticdev file
    before PN
  dtc: Fix License warning
  eee-acpi-scripts: Fix License warning
  usbinit: Fix License warning
  wget: Fix License warning
  watchdog: Fix License warning
  libnewt: fix license warnings
  glib-networking: Fix packaging warnings
  texi2html: fix packages warning
  telepathy-glib: remove package warnings
  gtk-theme-torturer: Fix license warning

 meta/conf/bitbake.conf                             |    4 ++--
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    2 +-
 meta/recipes-bsp/usbinit/usbinit.bb                |    2 +-
 .../telepathy/telepathy-glib_0.17.4.bb             |    7 ++++++-
 .../glib-networking/glib-networking_2.28.7.bb      |    6 ++++--
 meta/recipes-extended/newt/libnewt_0.52.14.bb      |    2 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |    4 +++-
 meta/recipes-extended/watchdog/watchdog_5.11.bb    |    2 +-
 meta/recipes-extended/wget/wget.inc                |    2 +-
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |    2 +-
 meta/recipes-kernel/dtc/dtc.inc                    |    2 +-
 11 files changed, 22 insertions(+), 13 deletions(-)

-- 
1.7.7.6



