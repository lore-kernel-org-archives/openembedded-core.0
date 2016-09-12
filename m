Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 597E877155
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 05:30:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8C5UPWV026682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 22:30:25 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 11 Sep 2016 22:30:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Sep 2016 13:13:52 +0800
Message-ID: <20160912051352.15492-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: disable gobject-introspection on armv7a
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
X-List-Received-Date: Mon, 12 Sep 2016 05:30:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Disable gobject-introspection on armv7a to avoid
do_compile failure.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.12.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
index 941d0e2..680ee84 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
@@ -106,3 +106,7 @@ ARM_INSTRUCTION_SET_armv7ve = "thumb"
 # WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
 EXTRA_OECMAKE_append_mips64 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
+
+# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
+# Segmentation fault
+EXTRA_OECMAKE_append_armv7a = " -DENABLE_INTROSPECTION=OFF"
-- 
2.8.1


