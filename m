Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3515F6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:23:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2016 04:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,295,1473145200"; d="scan'208";a="768700630"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2016 04:23:51 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 14:23:43 +0300
Message-Id: <cover.1475503407.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Fix network applet rendering issues
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
X-List-Received-Date: Tue, 04 Oct 2016 11:23:55 -0000

Revert the change that made the network applet render at exactly
the available size (because this revealed multiple bugs in the
stack), instead pack the applets better so they look ok even if the
icons are a little small.

 - Jussi


The following changes since commit 3a73fe0efcb7aeefcca7011bba887caad03d4d03:

  beaglebone.conf: produce wic images for Beaglebone (2016-10-01 21:45:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/systray
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/systray

Jussi Kukkonen (2):
  Revert "connman-gnome: StatusIcon adapts to size changes"
  matchbox-panel-2: Fix small systray icon drawing

 .../connman/connman-gnome/0001-Port-to-Gtk3.patch  | 136 +++------------------
 ...applets-systray-Allow-icons-to-be-smaller.patch |  34 ++++++
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb      |   4 +-
 3 files changed, 52 insertions(+), 122 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-applets-systray-Allow-icons-to-be-smaller.patch

-- 
2.1.4


