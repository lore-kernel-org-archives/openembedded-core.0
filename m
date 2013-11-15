Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 931F56B1A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 19:58:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2013 11:58:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,709,1378882800"; d="scan'208";a="428452428"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2013 11:58:57 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 22:01:11 +0200
Message-Id: <cover.1384545568.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] Various PUs
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
X-List-Received-Date: Fri, 15 Nov 2013 19:58:57 -0000

Packages were built for various arches and targets.

The following changes since commit db7f8d4114267ed34c19dc66dd56c2372354b43f:

  kernel.bbclass: test for hardlinks before installing (2013-11-15 15:27:08 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  ofono: upgrade to 1.13
  telepathy-idle: upgrade to 0.2.0

 .../ofono-1.12/obsolete_automake_macros.patch      | 14 -------------
 .../ofono/ofono/missing-ssize_t.patch              | 23 ----------------------
 .../ofono/{ofono_1.12.bb => ofono_1.13.bb}         |  8 ++------
 .../fix-svc-gtk-doc.h-target.patch                 |  0
 ...athy-idle_0.1.16.bb => telepathy-idle_0.2.0.bb} |  4 ++--
 5 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono-1.12/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
 rename meta/recipes-connectivity/ofono/{ofono_1.12.bb => ofono_1.13.bb} (40%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.16 => telepathy-idle-0.2.0}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.16.bb => telepathy-idle_0.2.0.bb} (82%)

-- 
1.8.1.2


