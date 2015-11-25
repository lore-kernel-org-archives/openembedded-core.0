Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F42B6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:01:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2015 05:01:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,342,1444719600"; d="scan'208";a="606912123"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2015 05:01:33 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Wed, 25 Nov 2015 15:05:03 +0200
Message-Id: <cover.1448455166.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/5] Add gudev to OE-Core + bug fixes
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
X-List-Received-Date: Wed, 25 Nov 2015 13:01:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gudev was split from systemd into its own project. There's a recipe in
meta-oe already and most of the changes required to support both
providers of gudev (gudev and udev) have been made. This patchset only
moves gudev to oe-core and fixes some small dependency issues.

There's also a couple of other unrelated fixes.



The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gudev-and-bug-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gudev-and-bug-fixes

Jussi Kukkonen (5):
  connman-gnome: rrecommend connman, don't rdepend
  gstreamer1.0-plugins-good: Fix gudev dependency
  gstreamer1.0-plugins-bad: Fix gudev dependency
  gudev: Add from meta-oe
  gcr: Require x11 DISTRO_FEATURE

 meta/recipes-connectivity/connman/connman-gnome_0.7.bb    |  2 +-
 meta/recipes-gnome/gcr/gcr_3.16.0.bb                      |  4 ++--
 meta/recipes-gnome/libgudev/libgudev_230.bb               | 15 +++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad.inc                |  2 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc               |  2 +-
 5 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-gnome/libgudev/libgudev_230.bb

-- 
2.1.4


