Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Qswaj-0007QG-PG
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:48:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2011 05:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37873747"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2011 05:43:52 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 20:40:44 +0800
Message-Id: <cover.1313411858.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] building qemu inside qemuppc/x86, Edwin, Aug 15, 2011
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
X-List-Received-Date: Mon, 15 Aug 2011 12:48:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

This patch makes qemu can be built inside qemuppc/x86, so that world build is happy. Also add some distro-trackings update.

Pls. help to review and pull.

Thanks,
Edwin

The following changes since commit d31d5e5b34c889809af408aed7d4f353d0133750:

  gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 21:23:58 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (2):
  distro-tracking: Update info for gpgme, libassuan, apr... after last
    upgrade.
  qemu: Make qemu buildable inside qemux86/qemuppc target

 .../conf/distro/include/distro_tracking_fields.inc |   48 ++++++++++---------
 meta/recipes-devtools/qemu/qemu.inc                |    5 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |   27 +++++++++--
 3 files changed, 49 insertions(+), 31 deletions(-)



