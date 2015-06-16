Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1C074051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:38:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 16 Jun 2015 04:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="711879809"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2015 04:38:33 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 14:38:57 +0300
Message-Id: <cover.1434454325.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Upgrade D-Bus
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
X-List-Received-Date: Tue, 16 Jun 2015 11:38:36 -0000

Upgrade dbus and bring dbus-test to matching version.

Ptests pass.


The following changes since commit 379a030702c985c6e69831173f765a47dfeb8841:

  bitbake: toastergui: prevent contamination of libtoaster context (2015-06-12 00:01:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/dbus
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/dbus

Jussi Kukkonen (2):
  dbus: Upgrade 1.8.16 -> 1.8.18
  dbus-test: Upgrade 1.8.10 -> 1.8.18

 meta/recipes-core/dbus/{dbus-test_1.8.10.bb => dbus-test_1.8.18.bb} | 4 ++--
 meta/recipes-core/dbus/dbus_1.8.16.bb                               | 4 ----
 meta/recipes-core/dbus/dbus_1.8.18.bb                               | 4 ++++
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.10.bb => dbus-test_1.8.18.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.16.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.18.bb

-- 
2.1.4


