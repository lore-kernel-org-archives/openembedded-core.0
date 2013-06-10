Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 27C1C61FB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 15:20:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2013 08:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,837,1363158000"; d="scan'208";a="347607711"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.12])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2013 08:21:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 16:20:24 +0100
Message-Id: <cover.1370877465.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 0/9] Stable branch cherry-picks (cover letter only)
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
X-List-Received-Date: Mon, 10 Jun 2013 15:20:36 -0000

These are cherry-picks from master to be applied to the dylan branch for
inclusion in the next 1.4 stable release (1.4.1).

Please review this series for suitability for inclusion into the stable
branch.



The following changes since commit e174486f04e81ec342ab4ec854d4194bb372b96b:

  build-appliance-image: update to latest dylan revision for release (2013-06-03 17:45:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Carlos Rafael Giani (1):
  gstreamer: fixed -meta package rdepends

Jackie Huang (1):
  grub-0.97: fix the objcopy error in configure

Jonathan Liu (1):
  classes/buildhistory: record removals in buildhistory directory

Paul Barker (1):
  qt4: remove trailing slash from prefix

Phil Blundell (1):
  openssl: Disable parallel make

Richard Purdie (2):
  autotools.bbclass: Factor out aclocal copying function
  alsa-tools: Fix configure race

Saul Wold (2):
  self-hosted: Add libssp libraries to packagegroup/image
  libxi: Add libxfixes as dependency

 meta/classes/autotools.bbclass                     | 37 ++++++++++++--------
 meta/classes/buildhistory.bbclass                  |  2 +-
 .../grub/grub-0.97/objcopy-absolute.patch          | 40 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |  1 +
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 .../packagegroups/packagegroup-self-hosted.bb      |  3 ++
 meta/recipes-graphics/xorg-lib/libxi_1.7.bb        |  2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |  8 ++++-
 .../gstreamer/gst-plugins-package.inc              | 27 ++++++++++++---
 meta/recipes-qt/qt4/qt4.inc                        |  6 ++--
 10 files changed, 101 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/objcopy-absolute.patch

-- 
1.8.1.2


