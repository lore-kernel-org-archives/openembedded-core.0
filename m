Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 25E3A731C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718728043"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:22 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:42 +0300
Message-Id: <e0d177590f06ef32155cf1a03868f62aac68660d.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 18/30] libowl: Remove as unused
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:22 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/libowl/libowl_git.bb | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta/recipes-sato/libowl/libowl_git.bb

diff --git a/meta/recipes-sato/libowl/libowl_git.bb b/meta/recipes-sato/libowl/libowl_git.bb
deleted file mode 100644
index 9cc47db..0000000
--- a/meta/recipes-sato/libowl/libowl_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "OpenedHand Widget Library"
-HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-LICENSE = "GPLv2 & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libowl/owlpaned.h;endline=20;md5=7fef844c4cc01b10541a7ab6ab5971af \
-                    file://libowl/owltreemodelslice.h;endline=20;md5=a5421f2cdae8debe5e4c48c09a02beb9 \
-                    file://libowl/owlcolourswatch.h;endline=24;md5=063c415c58719d536990ca8f606b5730"
-
-SECTION = "libs"
-DEPENDS = "gtk+"
-SRCREV = "6ebc8ac8f8575278dd40a535cadefa26374e44b1"
-PV = "0.1+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig distro_features_check
-
-# Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.1.4


