Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8737A6E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220021"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:20 +0200
Message-Id: <2f10603e27d2068e12016955e0e23493d51b94b6.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/19] pcmanfm: update to 1.2.4
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/pcmanfm/files/no-desktop.patch                 | 2 +-
 meta/recipes-sato/pcmanfm/{pcmanfm_1.2.3.bb => pcmanfm_1.2.4.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.2.3.bb => pcmanfm_1.2.4.bb} (90%)

diff --git a/meta/recipes-sato/pcmanfm/files/no-desktop.patch b/meta/recipes-sato/pcmanfm/files/no-desktop.patch
index 103d6d1..ae54dbd 100644
--- a/meta/recipes-sato/pcmanfm/files/no-desktop.patch
+++ b/meta/recipes-sato/pcmanfm/files/no-desktop.patch
@@ -11,5 +11,5 @@ index ccf8abb..3f6fc1c 100644
 @@ -7,3 +7,4 @@ Exec=pcmanfm --desktop-pref
  StartupNotify=true
  Terminal=false
- NotShowIn=GNOME;XFCE;KDE;
+ NotShowIn=GNOME;XFCE;KDE;MATE;
 +NoDisplay=true
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
similarity index 90%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
index c8b42ab..a6b0aac 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb
@@ -20,8 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://emblem-symbolic-link.png \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "c993402d407b0a3fc076f842ac1bc5c9"
-SRC_URI[sha256sum] = "cfa8d82fc63be147045174bef074807e1e32ce8c6bf4dbd8fad49e260bcf6380"
+SRC_URI[md5sum] = "19764c2f59653724c8713e0064fa6829"
+SRC_URI[sha256sum] = "38cdbb5f01d24483b41b8e6846e4aa66a5751bb3982a8618899e88a853dbe313"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
-- 
2.7.0


