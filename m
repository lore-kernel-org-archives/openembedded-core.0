Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 73B4572DC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:45:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2016 04:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="45548520"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2016 04:45:53 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:42:40 +0200
Message-Id: <bf79b8e49b3711f0cfab737973c638e6a01f1626.1455107972.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/7] gstreamer1.0: fix upstream check for unstable versions from git
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
X-List-Received-Date: Wed, 10 Feb 2016 12:45:53 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb        | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb  | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb              | 1 +
 6 files changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 0937be2..4cd51cd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
 "
 
 PV = "1.7.1+git${SRCPV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV_base = "0993ec8fa5cf6b09e33741f268c938719a1534d5"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 0ebf622..e22a210 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
 "
 
 PV = "1.7.1+git${SRCPV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV_base = "3a088ecc9330d5cb8888ff43de0fe4f61c23a607"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index 956b24a..a07c35b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
 "
 
 PV = "1.7.1+git${SRCPV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV_base = "641428966e09d16b0a46540040f2faf3791eb7c9"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 915be73..20dfb83 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
 "
 
 PV = "1.7.1+git${SRCPV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV_base = "e016a70a7c97fc61c6cb5cd3821d38bc5ae5c9a4"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index f99b300..ccf6ece 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
 "
 
 PV = "1.7.1+git${SRCPV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV_base = "c9c37983babad909d01c1c4c417d42a0cf252c1d"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index 4fff533..cb55c9a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
 "
 
 PV = "1.7.1+git${SRCPV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV_base = "2a188848eb2af3c3b357978ff7786a78aad9dd55"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
-- 
2.7.0


