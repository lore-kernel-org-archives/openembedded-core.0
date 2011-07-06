Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QeKVm-0001nd-0m
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 07:19:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2011 22:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,484,1304319600"; d="scan'208";a="21962839"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2011 22:15:05 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 13:20:17 +0800
Message-Id: <cover.1309928392.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/3]upgrade recipes
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
X-List-Received-Date: Wed, 06 Jul 2011 05:19:01 -0000

Upgrade recipe gupnp and gawk, also update the distro_tracking_fields.inc.

The following changes since commit c6dac094ac79f6eae6998527e025417e16b46eed:
  Yu Ke (1):
        xauth: upgrade from 1.05 to 1.06

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/upgrade-0704
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-0704

Mei Lei (3):
  gupnp: Upgrade from 0.16.0 to 0.16.1
  gawk: Upgrade from 3.1.8 to 4.0.0
  distro_tracking_fields.inc: Update recipes upgrade and manual check
    information

 .../conf/distro/include/distro_tracking_fields.inc |   17 ++--
 .../gupnp/gupnp-0.16.1/introspection.patch         |  104 ++++++++++++++++++++
 .../gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb}     |    7 +-
 .../gawk/{gawk_3.1.8.bb => gawk_4.0.0.bb}          |    4 +-
 4 files changed, 119 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-connectivity/gupnp/gupnp-0.16.1/introspection.patch
 rename meta/recipes-connectivity/gupnp/{gupnp_0.16.0.bb => gupnp_0.16.1.bb} (85%)
 rename meta/recipes-extended/gawk/{gawk_3.1.8.bb => gawk_4.0.0.bb} (85%)



