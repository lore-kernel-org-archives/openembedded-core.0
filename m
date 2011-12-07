Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RYJuI-0001Ji-Sl
	for openembedded-core@openembedded.org; Wed, 07 Dec 2011 16:59:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2011 07:51:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,313,1320652800"; d="scan'208";a="99675580"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2011 07:51:18 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Wed,  7 Dec 2011 23:49:16 +0800
Message-Id: <cover.1323272370.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2]dropbear:Upgrade from 0.53.1 to 2011.54
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
X-List-Received-Date: Wed, 07 Dec 2011 15:59:43 -0000

Hi all,
	This patch upgrade dropbear from 0.53.1 to 2011.54. The new release added ALLOW_BLANK_PASSWORD option, we can enable empty passwd login funciton in options.h.
	So change the allow-nopw.patch content to enable this function.
	Please review it.
Thanks,
Lei
The following changes since commit 493746f1d7f1410284880203c1ac462d61ab5299:
  Martin Jansa (1):
        matchbox-session-sato: respect VIRTUAL-RUNTIME_initscripts settings

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/dropbear
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/dropbear

Mei Lei (2):
  dropbear: Upgrade from 0.53.1 to 2011.54
  distro_tracking_fields.inc: Update dropbear,iproute2,net-tools
    tracking information.

 .../conf/distro/include/distro_tracking_fields.inc |   19 ++++---
 .../configure.patch                                |    0
 .../dropbear/dropbear/allow-nopw.patch             |   55 ++++++--------------
 meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 --
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    6 ++
 5 files changed, 33 insertions(+), 53 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-0.53.1 => dropbear-2011.54}/configure.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2011.54.bb



