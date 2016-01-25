Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D9F1677117
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:11:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641144009"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:11:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:26 +0200
Message-Id: <7ddc681595d12058128a499a50b92e059a8e5c98.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/16] rxvt-unicode: update to 9.22
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:49 -0000

License checksum change due to new copyright year.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc                     | 2 +-
 .../rxvt-unicode/{rxvt-unicode_9.21.bb => rxvt-unicode_9.22.bb}     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.21.bb => rxvt-unicode_9.22.bb} (50%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 04a43c0..4d5daa6 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -5,7 +5,7 @@ terminal emulator rxvt, modified to store text in Unicode \
 (either UCS-2 or UCS-4) and to use locale-correct input and \
 output. It also supports mixing multiple fonts at the \
 same time, including Xft fonts."
-DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
+DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf libxmu"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
similarity index 50%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
index 7049495..bfa8a61 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
@@ -2,7 +2,7 @@ require rxvt-unicode.inc
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://src/main.C;beginline=1;endline=31;md5=7dac0395806570856e037f98aba8513b"
+                    file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI[md5sum] = "a9a06c608258c5fd247c3725d8f44582"
-SRC_URI[sha256sum] = "75270ed72bc5895a64a1d7392bf45a622204192371c3965bd3dd978dc088956b"
+SRC_URI[md5sum] = "93782dec27494eb079467dacf6e48185"
+SRC_URI[sha256sum] = "e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd"
-- 
2.7.0.rc3


