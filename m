Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 193CE77026
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2015 04:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="796215156"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 04:00:36 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 59A246A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:44 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:17 +0300
Message-Id: <c61718de6ba29c9a5536b32d404a33e2b617361a.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 17/17] image.py: rename _write_env -> _write_wic_env
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:35 -0000

Renamed this function as it's too generic name for it.
It writes variables, which are used by wic to .env file,
so _write_wic_env is better name for it.

Thanks Christopher Larson for poining out to this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/image.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 95c62dc..5b77306 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -326,7 +326,7 @@ class Image(ImageDepGraph):
 
         return image_cmd_groups
 
-    def _write_env(self):
+    def _write_wic_env(self):
         """
         Write environment variables used by wic
         to tmp/sysroots/<machine>/imgdata/<image>.env
@@ -353,7 +353,7 @@ class Image(ImageDepGraph):
 
         image_cmd_groups = self._get_imagecmds()
 
-        self._write_env()
+        self._write_wic_env()
 
         for image_cmds in image_cmd_groups:
             # create the images in parallel
-- 
2.1.4


