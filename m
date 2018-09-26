Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 680FC793DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 475036E68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:53 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:33 +0200
Message-Id: <20180926174244.20989-1-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/12] gstreamer1.0: upgrade to version 1.14.3
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:43 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gstreamer1.0_1.14.2.bb => gstreamer1.0_1.14.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.14.2.bb => gstreamer1.0_1.14.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.3.bb
index 7f291f6630..199b3386c0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.3.bb
@@ -27,8 +27,8 @@ SRC_URI = " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "9f4177c1752e44cbd72f6311ee61e1ba"
-SRC_URI[sha256sum] = "4bd6127299f3f29379046bbd58a526e6353b569e0e72f7b4df2ae70df6882e09"
+SRC_URI[md5sum] = "c790c0d002164cafe93e67cdf78c8ace"
+SRC_URI[sha256sum] = "13ae530eb1d4566c3aa0cff1bbb8e64c643065bb12e2e7c707f311ab4a390456"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
-- 
2.17.1


