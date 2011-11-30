Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RVdJT-0007g2-KZ
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 07:06:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 21:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,595,1315206000"; d="scan'208";a="90460091"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2011 21:58:37 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Wed, 30 Nov 2011 13:57:51 +0800
Message-Id: <cover.1322619553.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/3] Recipes upgrade for dropbear,iproute2
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
X-List-Received-Date: Wed, 30 Nov 2011 06:06:35 -0000

Hi Saul,
	These patches upgraded dropbear and iproute2, and update the distro tracking information for dropbear, iproute2 and net-tools. Please help to review and pull.

Thanks,
Lei

The following changes since commit 177df2c51927f44e3536856f4604364b38695bc2:
  Richard Purdie (1):
        qt-mobility: Add missing patch

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/upgrade1129
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade1129

Mei Lei (3):
  iproute2: Upgrade from 3.0.0 to 3.1.0
  dropbear: Upgrade from 0.53.1 to 2011.54
  distro_tracking_fields.inc: Update dropbear,iproute2,net-tools
    tracking information.

 .../conf/distro/include/distro_tracking_fields.inc |   20 +++++-----
 .../configure-cross.patch                          |    0
 .../{iproute2_3.0.0.bb => iproute2_3.1.0.bb}       |    4 +-
 .../configure.patch                                |    0
 meta/recipes-core/dropbear/dropbear.inc            |    8 ----
 .../dropbear/dropbear/allow-nopw.patch             |   40 --------------------
 meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 ---
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    6 +++
 8 files changed, 18 insertions(+), 66 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.0.0 => iproute2-3.1.0}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.0.0.bb => iproute2_3.1.0.bb} (72%)
 rename meta/recipes-core/dropbear/{dropbear-0.53.1 => dropbear-2011.54}/configure.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/allow-nopw.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2011.54.bb



