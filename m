Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7840F731B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:43:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 18 Dec 2015 07:43:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710464751"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 07:43:21 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:40:52 +0200
Message-Id: <cover.1450453089.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/6] web/browser update
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
X-List-Received-Date: Fri, 18 Dec 2015 15:43:43 -0000

This patchset updates the epiphany browser and webkitgtk engine
to latest upstream versions.

The following changes since commit 04e6fcc99d548660ab89ab06d05b25952fa38817:

  mobile-broadband-provider-info: update to tagged release 20151214 (2015-12-18 16:43:30 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (6):
  gcr: update to 3.18.0
  gnome-desktop3: update to 3.18.2
  libsecret: update to 0.18.3
  libwebp: update to 0.4.4
  epiphany: update to 3.18.2
  webkitgtk: update to 2.10.4

 .../{epiphany_3.16.3.bb => epiphany_3.18.2.bb}     |  4 +-
 .../gcr/{gcr_3.16.0.bb => gcr_3.18.0.bb}           |  4 +-
 ...desktop3_3.16.2.bb => gnome-desktop3_3.18.2.bb} |  4 +-
 .../{libsecret_0.18.2.bb => libsecret_0.18.3.bb}   |  4 +-
 .../webp/{libwebp_0.4.3.bb => libwebp_0.4.4.bb}    |  6 +-
 ...fixes-a-command-line-that-is-too-long-ove.patch | 91 ----------------------
 ...ailure-with-ACCELERATED_2D_CANVAS-when-ca.patch | 35 ---------
 meta/recipes-sato/webkit/webkitgtk/gcc5.patch      | 26 -------
 .../{webkitgtk_2.8.5.bb => webkitgtk_2.10.4.bb}    | 20 ++---
 9 files changed, 22 insertions(+), 172 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.16.3.bb => epiphany_3.18.2.bb} (84%)
 rename meta/recipes-gnome/gcr/{gcr_3.16.0.bb => gcr_3.18.0.bb} (79%)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.16.2.bb => gnome-desktop3_3.18.2.bb} (83%)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.2.bb => libsecret_0.18.3.bb} (71%)
 rename meta/recipes-multimedia/webp/{libwebp_0.4.3.bb => libwebp_0.4.4.bb} (89%)
 delete mode 100644 meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
 delete mode 100644 meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc5.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.8.5.bb => webkitgtk_2.10.4.bb} (83%)

-- 
2.6.2


