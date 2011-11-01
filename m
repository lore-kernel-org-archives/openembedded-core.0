Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RL53A-000277-9x
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 04:30:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Oct 2011 20:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,435,1315206000"; d="scan'208";a="69105204"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 31 Oct 2011 20:24:01 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 11:38:26 +0800
Message-Id: <cover.1320118475.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2 v2][PULL] iptables: recipe upgrade
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
X-List-Received-Date: Tue, 01 Nov 2011 03:30:08 -0000

Hi Richard and Saul,

This is the second pull request for iptables and connman, please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 4ce1f57e723cb6ccfd67ed1570228602547bd112:

  distro_tracking: polkit, libsndfile, etc (2011-10-31 23:03:11 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/upgrade

Dongxiao Xu (2):
  iptables: upgrade to version 1.4.12.1
  connman: add xtables_version to fix xtables API change

 .../connman/connman-0.75/xtables_version.patch     |   64 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.75.bb  |    3 +-
 .../{iptables_1.4.9.bb => iptables_1.4.12.1.bb}    |   16 +++--
 3 files changed, 75 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.9.bb => iptables_1.4.12.1.bb} (64%)



