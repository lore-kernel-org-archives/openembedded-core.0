Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgY-0000Oi-3D
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 04:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="1285873"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 04:01:10 -0700
Message-Id: <98a4c94ade498a06897a28dd6d2d315fd4d0a33d.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:53:19 +0800
Date: Thu, 12 May 2011 19:01:07 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 17/54] libowl-av: Add Upstream-Status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2011 11:04:03 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../libowl-av/gst_change_state.patch               |    2 ++
 .../owl-video-widget/libowl-av/make-382.patch      |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch b/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
index cc09587..5bc279a 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
+++ b/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
@@ -9,6 +9,8 @@ We will revisit it in next period.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 diff -ruN libowl-av-orig/libowl-av/owl-tag-reader.c libowl-av/libowl-av/owl-tag-reader.c
 --- libowl-av-orig/libowl-av/owl-tag-reader.c	2010-10-12 14:30:26.000000000 +0800
 +++ libowl-av/libowl-av/owl-tag-reader.c	2010-10-12 14:32:39.000000000 +0800
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch b/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
index 6ba37fb..a8be781 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
+++ b/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libowl-av/Makefile.am
 ===================================================================
 --- libowl-av.orig/Makefile.am
-- 
1.7.1



