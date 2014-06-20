Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A113670268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 15:38:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2014 08:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,514,1400050800"; d="scan'208";a="447997166"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 20 Jun 2014 08:38:38 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jun 2014 18:42:15 +0300
Message-Id: <cover.1403277454.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] Automated hardware testing bugfixes and grub target controller feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jun 2014 15:38:57 -0000

Various fixes related to master image install script and
GRUB targets controller implemented.

The following changes since commit 7c1a975a1c2fd884aa9f6f4736656d854a6c5edb:

  bitbake: toaster: Fix spacing and layout in no image files notification (2014-06-20 14:03:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB5615
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB5615

Cristian Iorga (5):
  init-install-testfs: add grub serial line support
  oe-core/init-install-testfs.sh: do not overwrite /etc/mtab if the link
    already exist
  init-install-testfs: fix typo
  init-install-testfs: create signature file for master image
  meta-yocto-bsp: oeqa/controllers: add GrubTarget

 meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py  | 71 ++++++++++++++++++++++
 .../initrdscripts/files/init-install-testfs.sh     | 15 ++++-
 2 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 meta-yocto-bsp/lib/oeqa/controllers/grubtarget.py

-- 
1.9.1


