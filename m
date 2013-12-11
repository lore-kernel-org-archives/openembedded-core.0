Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 74DC36A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:21:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2013 09:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="450651261"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2013 09:21:41 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 19:24:00 +0200
Message-Id: <cover.1386782484.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/3] Comm/base package upgrades
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
X-List-Received-Date: Wed, 11 Dec 2013 17:21:43 -0000

The following changes since commit bfec6b1947b472d6f1c9c7f297e66ede5e921069:

  ref-manual: Removed "work" from the SDK_DEPLOY directory. (2013-12-11 14:20:19 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU3

Cristian Iorga (3):
  bluez5: upgrade to 5.12
  rpcbind: upgrade to 0.2.1
  glib-2.0: upgrade to 2.38.2

 meta/recipes-connectivity/bluez5/bluez5.inc              | 11 +----------
 .../bluez5/{bluez5-5.10 => bluez5}/bluetooth.conf        |  0
 meta/recipes-connectivity/bluez5/bluez5_5.10.bb          |  5 -----
 meta/recipes-connectivity/bluez5/bluez5_5.12.bb          |  5 +++++
 .../glib-2.0/{glib-2.0_2.38.1.bb => glib-2.0_2.38.2.bb}  |  4 ++--
 .../recipes-extended/rpcbind/rpcbind/fix_host_path.patch | 16 ----------------
 .../rpcbind/rpcbind/obsolete_automake_macros.patch       | 14 --------------
 .../rpcbind/{rpcbind_0.2.0.bb => rpcbind_0.2.1.bb}       |  8 ++------
 8 files changed, 10 insertions(+), 53 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.10 => bluez5}/bluetooth.conf (100%)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.10.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.12.bb
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.38.1.bb => glib-2.0_2.38.2.bb} (79%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.0.bb => rpcbind_0.2.1.bb} (88%)

-- 
1.8.3.2


