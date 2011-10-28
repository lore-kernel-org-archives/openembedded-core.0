Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd74-00066R-5X
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Oct 2011 20:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,416,1315206000"; d="scan'208";a="30942454"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Oct 2011 20:22:07 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:39 +0800
Message-Id: <cover.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 00/11][PULL] package upgrade, 2011/10/28
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:10 -0000

Hi Saul,

This pull request upgrade several recipes, please help to review and pull.

Thanks,
Dongxiao

The following changes since commit ddc9a58b8553599d2328ac1c4449b41681ae45d1:

  Add readline as dependecy for gdb-cross-canadian (2011-10-27 08:37:53 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/upgrade

Dongxiao Xu (11):
  polkit: upgrade to latest 0.102
  libsndfile1: upgrade to version 1.0.25
  neon: upgrade to version 0.29.6
  netbase: upgrade to version 4.46
  libogg: upgrade to version 1.3.0
  telepathy-idle: upgrade to version 0.1.10
  telepathy-glib: upgrade to version 0.16.0
  telepathy-mission-control: Upgrade to version 5.9.3
  iptables: upgrade to version 1.4.12.1
  connman: add xtables_version to fix xtables API change
  distro_tracking: polkit, libsndfile, etc

 .../conf/distro/include/distro_tracking_fields.inc |   66 ++++++++++----------
 .../connman/connman-0.75/xtables_version.patch     |   64 +++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.75.bb  |    3 +-
 ...thy-glib_0.14.3.bb => telepathy-glib_0.16.0.bb} |    4 +-
 ...athy-idle_0.1.8.bb => telepathy-idle_0.1.10.bb} |    4 +-
 ...5.7.9.bb => telepathy-mission-control_5.9.3.bb} |    4 +-
 .../netbase/{netbase-4.45 => netbase-4.46}/hosts   |    0
 .../netbase/{netbase-4.45 => netbase-4.46}/init    |    0
 .../{netbase-4.45 => netbase-4.46}/interfaces      |    0
 .../netbase/{netbase-4.45 => netbase-4.46}/nfsroot |    0
 .../qemuarm/interfaces                             |    0
 .../qemuarmv6/interfaces                           |    0
 .../qemuarmv7/interfaces                           |    0
 .../qemumips/interfaces                            |    0
 .../qemuppc/interfaces                             |    0
 .../qemux86-64/interfaces                          |    0
 .../qemux86/interfaces                             |    0
 .../netbase/{netbase_4.45.bb => netbase_4.46.bb}   |    6 +-
 .../{iptables_1.4.9.bb => iptables_1.4.12.1.bb}    |   16 ++---
 .../introspection.patch                            |    0
 .../polkit-1_pam.patch                             |    0
 .../polkit/{polkit_0.101.bb => polkit_0.102.bb}    |    8 +-
 .../libogg/{libogg_1.2.2.bb => libogg_1.3.0.bb}    |    4 +-
 ...libsndfile1_1.0.24.bb => libsndfile1_1.0.25.bb} |    6 +-
 .../{neon-0.29.5 => neon-0.29.6}/pkgconfig.patch   |    0
 .../neon/{neon_0.29.5.bb => neon_0.29.6.bb}        |    6 +-
 26 files changed, 126 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.14.3.bb => telepathy-glib_0.16.0.bb} (80%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.8.bb => telepathy-idle_0.1.10.bb} (81%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.7.9.bb => telepathy-mission-control_5.9.3.bb} (92%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/init (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/nfsroot (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuarm/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuarmv6/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuarmv7/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemumips/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemuppc/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemux86-64/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase-4.45 => netbase-4.46}/qemux86/interfaces (100%)
 rename meta/recipes-core/netbase/{netbase_4.45.bb => netbase_4.46.bb} (92%)
 rename meta/recipes-extended/iptables/{iptables_1.4.9.bb => iptables_1.4.12.1.bb} (69%)
 rename meta/recipes-extended/polkit/{polkit-0.101 => polkit-0.102}/introspection.patch (100%)
 rename meta/recipes-extended/polkit/{polkit-0.101 => polkit-0.102}/polkit-1_pam.patch (100%)
 rename meta/recipes-extended/polkit/{polkit_0.101.bb => polkit_0.102.bb} (83%)
 rename meta/recipes-multimedia/libogg/{libogg_1.2.2.bb => libogg_1.3.0.bb} (81%)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.24.bb => libsndfile1_1.0.25.bb} (79%)
 rename meta/recipes-support/neon/{neon-0.29.5 => neon-0.29.6}/pkgconfig.patch (100%)
 rename meta/recipes-support/neon/{neon_0.29.5.bb => neon_0.29.6.bb} (82%)



