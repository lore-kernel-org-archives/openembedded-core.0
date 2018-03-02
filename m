Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id C05D67895B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 21:58:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id BAC3020A85;
	Fri,  2 Mar 2018 16:58:22 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Fri, 02 Mar 2018 16:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=YefQKt4811OSBn5kEyGkIQ04aJRpW4HXkemkeE
	MYyiA=; b=r00C5Gco0rn/uVXGXseGZFNA3tIbzPgrfpzhgYNFlHdgFe52831lI2
	HueN0JVMup8jY+4D5UdNiBNcd+EDgzyPR69sRWBTNNwaFr+rF0l6nPu+FkMHbDjE
	HBHJwC2dmy5lh1asNeXny0LMqCX/EhKII5BNJn5B8H81bt1rqxi7I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YefQKt4811OSBn5kE
	yGkIQ04aJRpW4HXkemkeEMYyiA=; b=h8NGzFjFh2aOCpbP/cluKHCZ6Erb0uXAD
	dGid/xvGT3kP+SnB+GWe/g/5g9lSvXTY9saE7wPRbRUqyx0tdch/Vt+7bqk+QsUB
	QD+LI58xJDhTpY4tyh0tiAbRY1sIoRdPD6i2CLlOlIM6TqECR35IxTxAzLB7jH5Q
	Mibm18SKE27+uitg9n40G1yU+2vi3hPdAa7ZovOjJkFAo+rx+/UdbqzJ7uLBKr5u
	oiuQwZzJCn8b+bXzvXhS+c8ym709LXgk2mYLNbhCLt/rpNG31QQwCXMSKB9Xucl4
	gD+WTo/Xcdv0HXmLeNvti4YY6En0wY86CL0fhgPPNCZawpu+iSEXQ==
X-ME-Sender: <xms:_siZWjv9MAtxBjjoNBu-pARvoJ0ZyY1BCP-sq-GIKXSZcHQiTzTzmg>
Received: from localhost (unknown [96.237.180.55])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6F17824733;
	Fri,  2 Mar 2018 16:58:22 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 16:58:17 -0500
Message-Id: <20180302215817.20179-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] ccache: update to 3.4.1
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
X-List-Received-Date: Fri, 02 Mar 2018 21:58:21 -0000

https://ccache.samba.org/releasenotes.html#_ccache_3_4_1

License-Update: copyright years and file paths updated

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/recipes-devtools/ccache/ccache_3.3.4.bb | 12 ------------
 meta/recipes-devtools/ccache/ccache_3.4.1.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.4.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.1.bb

diff --git a/meta/recipes-devtools/ccache/ccache_3.3.4.bb b/meta/recipes-devtools/ccache/ccache_3.3.4.bb
deleted file mode 100644
index 1e535b1923..0000000000
--- a/meta/recipes-devtools/ccache/ccache_3.3.4.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7fe21f9470f2305e95e7d8a632255079"
-
-SRC_URI[md5sum] = "95ab3c56284129cc2a32460c23069516"
-SRC_URI[sha256sum] = "24f15bf389e38c41548c9c259532187774ec0cb9686c3497bbb75504c8dc404f"
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


