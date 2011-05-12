Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgO-0000J5-Mb
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860485"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:05 -0700
Message-Id: <49f236d8329fe61929a1ca25fe67915f34fbf678.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:40:26 +0800
Date: Thu, 12 May 2011 19:01:02 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 13/54] owl-video-widget: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:53 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../owl-video/gtk_multithread_safe.patch           |    2 ++
 .../owl-video-widget/owl-video/make-382.patch      |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch b/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
index e153c5e..437f72b 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
+++ b/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
@@ -7,6 +7,8 @@ multi-thread operation.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 diff -ruN video-orig/src/video.c video/src/video.c
 --- video-orig/src/video.c	2010-10-15 16:07:26.522346398 +0800
 +++ video/src/video.c	2010-10-15 16:25:51.780296717 +0800
diff --git a/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch b/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
index 7d8aff7..d219c31 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
+++ b/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
@@ -2,6 +2,8 @@ Make 3.82 is much stricter and demands tabs. Obey.
 
 JL - 15/12/10
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: video/Makefile.am
 ===================================================================
 --- video.orig/Makefile.am
-- 
1.7.1



