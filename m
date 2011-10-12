Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RDoae-0001nu-As
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 04:30:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Oct 2011 19:24:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="62005499"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2011 19:24:56 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 10:20:10 +0800
Message-Id: <cover.1318385789.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Upgrade libfm/pcmanfm
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
X-List-Received-Date: Wed, 12 Oct 2011 02:30:40 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
These 2 patches upgrade libfm and pcmanfm. Pls. help to review and pull.

Thanks,
Edwin

The following changes since commit 0d8c8cf462e5df446669355b554b3d5fdc532a11:

  mutter: update to 2.29.1 and fix SRC_URI (2011-10-07 11:35:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (2):
  libfm: Upgrade to 0.1.16
  pcmanfm: Upgrade to 0.9.9

 .../pcmanfm/files/owl-window-menu.patch            |   53 ++++++++++----------
 .../pcmanfm/{pcmanfm_0.9.8.bb => pcmanfm_0.9.9.bb} |    6 +-
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |   13 -----
 .../libfm/libfm-0.1.16/configure_fix.patch         |   19 +++++++
 .../libfm/{libfm_0.1.14.bb => libfm_0.1.16.bb}     |    8 ++--
 5 files changed, 52 insertions(+), 47 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.8.bb => pcmanfm_0.9.9.bb} (87%)
 delete mode 100644 meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.16/configure_fix.patch
 rename meta/recipes-support/libfm/{libfm_0.1.14.bb => libfm_0.1.16.bb} (73%)



