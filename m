Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D33B575E2D
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 19:37:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2016 12:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,485,1459839600"; d="scan'208";a="124146631"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2016 12:37:42 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 22:37:35 +0300
Message-Id: <cover.1466191636.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Fixes for qemu, gtk+3
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
X-List-Received-Date: Fri, 17 Jun 2016 19:37:43 -0000

Qemu has a non-default PACKAGECONFIG "gtk+", the patch updates that
to work with gtk+3. Also included is a fix for the first bug I
already found in the gtk+3 "--disable-opengl" patch.

Have good weekend,
 Jussi


The following changes since commit 7b9e1f5ad8a427356f2ec516b1718138a7d3c64e:

  cmake.bbclass: set the modules directory correctly (2016-06-17 17:14:55 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/qemu-vte
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/qemu-vte

Jussi Kukkonen (2):
  gtk+3: Make sure gdkx.h is updated
  qemu: Use Gtk+3, add configure patch to find vte

 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 .../qemu/0001-configure-support-vte-2.91.patch     | 79 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
 .../0001-Add-disable-opengl-configure-option.patch | 19 +++---
 4 files changed, 91 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch

-- 
2.1.4


