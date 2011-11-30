Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RVtGK-0003KA-PL
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:08:24 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Nov 2011 15:01:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,272,1320652800"; d="scan'208";a="42685917"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 15:01:42 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 07:21:34 +0800
Message-Id: <cover.1322695203.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/5][PULL] Recipe upgrades for glib and telepathy-*.
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
X-List-Received-Date: Wed, 30 Nov 2011 23:08:25 -0000

Hi Saul,

This pull request upgrades some recipes.
Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 36654d6d393cb8c8a545835184a96be4ae0c885d:

  grub: Use COMPATIBLE_HOST (2011-11-30 22:21:53 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/upgrade

Dongxiao Xu (5):
  telepathy-idle: upgrade to version 0.1.11
  telepathy-glib: upgrade to version 0.17.0
  glib-2.0: upgrade to version 2.30.1
  telepathy-mission-control: upgrade to version 5.10.1
  distro_trakcing_fields: update for glib, telepathy-idle, etc

 .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
 ...thy-glib_0.16.0.bb => telepathy-glib_0.17.0.bb} |    4 +-
 ...thy-idle_0.1.10.bb => telepathy-idle_0.1.11.bb} |    4 +-
 ....9.3.bb => telepathy-mission-control_5.10.1.bb} |    4 +-
 .../{glib-2.0_2.30.0.bb => glib-2.0_2.30.1.bb}     |    6 ++--
 5 files changed, 22 insertions(+), 22 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.16.0.bb => telepathy-glib_0.17.0.bb} (80%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.10.bb => telepathy-idle_0.1.11.bb} (81%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.9.3.bb => telepathy-mission-control_5.10.1.bb} (92%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.0.bb => glib-2.0_2.30.1.bb} (91%)



