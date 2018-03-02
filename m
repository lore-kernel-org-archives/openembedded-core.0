Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 17153719C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 22:09:23 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 07514209F3;
	Fri,  2 Mar 2018 17:09:25 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Fri, 02 Mar 2018 17:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=v72qC36JkZyCXbJM1sz0TyuqfOXDLmiCJlAb1s
	MSn9c=; b=miVJFJLAvCGPlFpWp12DRzVFBNqGgYBe1nlyvLpOK+ve0Kjg1iVx61
	uGGEjEILExYO+Lb4St2xEDfD6W6hNV5F9fq6Lgoe2my/u3QTBNh23qTJq9CvMASG
	YHnK/wXiLh5viZ3iMw2AyLZ4JzwprNl83HzHUxITEjjDedpU1d68Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=v72qC36JkZyCXbJM1
	sz0TyuqfOXDLmiCJlAb1sMSn9c=; b=T4ExLeIiNo/KqAOLdGkX181VYQUcDfbRB
	W6FJSfKIoxzL7/EajwDjNctUezr/GjttqWRWf13qfaMP6xYtxgXmRSplxo+5JvOa
	Y4H3pwvEX9A1TA03Bm85jzWI/PJ/+byDU6sOtyMYlQ2ImhduXcqVwL6B67/UFP4V
	b6mAAGwNSjLGgIoTPRl8wpdtHj6OPGwxrhKI9U3OZw8VpGKRemGzVpVvR5Ln34xX
	d0iX+kT9gIzITJDhUZEPMcyopMS9LPHaF6Z6c14Bwd/pK2WFXbd/DeBbtThTRx16
	8oO5SJ54ZwOLhS+joZwH7TYgoquxb8UR2UN728BoZiwU9FkQxeuEA==
X-ME-Sender: <xms:lMuZWmXU5jeFhFVo3xAb0ZRUqNEQVxiNlQ9hO1FZ10pbMsvqI3vZHw>
Received: from localhost (unknown [96.237.180.55])
	by mail.messagingengine.com (Postfix) with ESMTPA id BB17024733;
	Fri,  2 Mar 2018 17:09:24 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 17:09:21 -0500
Message-Id: <20180302220921.21176-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH v2] ccache: update to 3.4.1
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
X-List-Received-Date: Fri, 02 Mar 2018 22:09:24 -0000

https://ccache.samba.org/releasenotes.html#_ccache_3_4_1

License-Update: copyright years and file paths updated

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/recipes-devtools/ccache/ccache_3.3.5.bb | 12 ------------
 meta/recipes-devtools/ccache/ccache_3.4.1.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.5.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.1.bb

diff --git a/meta/recipes-devtools/ccache/ccache_3.3.5.bb b/meta/recipes-devtools/ccache/ccache_3.3.5.bb
deleted file mode 100644
index 929f0f1276..0000000000
--- a/meta/recipes-devtools/ccache/ccache_3.3.5.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=dae379a85bb6e9d594773e0aa64876f6"
-
-SRC_URI[md5sum] = "eee58db7cce892febddb989308dc568f"
-SRC_URI[sha256sum] = "190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6"
-
-SRC_URI += " \
-            file://0002-dev.mk.in-fix-file-name-too-long.patch \
-            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
-"
diff --git a/meta/recipes-devtools/ccache/ccache_3.4.1.bb b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
new file mode 100644
index 0000000000..e3bf74e9c6
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
@@ -0,0 +1,12 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fa0d99234a05c3a32d380379d5d064a"
+
+SRC_URI[md5sum] = "39492aea565c3e6d5affa633672a93bd"
+SRC_URI[sha256sum] = "8c2e260d4245e362552e47bec359941210a96419ac5adf582046ceb92489f7de"
+
+SRC_URI += " \
+            file://0002-dev.mk.in-fix-file-name-too-long.patch \
+            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
+"
-- 
2.13.6


