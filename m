Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0A65479D5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:18:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,276,1549900800"; d="scan'208";a="57813514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Mar 2019 16:18:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 66EE34CD5BDE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 16:18:17 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 27 Mar 2019 16:18:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 16:18:50 +0800
Message-ID: <20190327081852.20155-2-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
References: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 66EE34CD5BDE.AC7A4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 1/3] atk:upgrade 2.30.0 -> 2.32.0
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
X-List-Received-Date: Wed, 27 Mar 2019 08:18:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

upgrade from atk_2.30.0.bb to atk_2.32.0.bb
delete atk/0001-Switch-from-filename-to-basename.patch beacuse of this
patch has been fixed

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...001-Switch-from-filename-to-basename.patch | 38 -------------------
 .../atk/{atk_2.30.0.bb => atk_2.32.0.bb}      |  5 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
 rename meta/recipes-support/atk/{atk_2.30.0.bb => atk_2.32.0.bb} (86%)

diff --git a/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch b/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
deleted file mode 100644
index 047e81fb61..0000000000
--- a/meta/recipes-support/atk/atk/0001-Switch-from-filename-to-basename.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Submitted
-
-From 0330251715fee908f2f162565d4fa1df5030d0c0 Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Thu, 14 Jun 2018 17:21:49 +0000
-Subject: [PATCH] Switch from filename to basename
-
-When atk-enum-types.h is installed in to a system, the user likely has
-no access to the location where the headers were built, especially if
-the software was built in a sysroot environment. If the headers were
-built for a mulitlib environment, the build pathing may be different.
-Subsequently, if two mulitlib variants of atk are installed together the
-headers conflict for no other reason then they were built in two
-different locations. Switching from filename to basename, still should
-provide sufficient information on the providence of the enums, while not
-conflicting for really no good reason.
-
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
----
- atk/atk-enum-types.h.template | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atk/atk-enum-types.h.template b/atk/atk-enum-types.h.template
-index 7b4cec4..8321c24 100644
---- a/atk/atk-enum-types.h.template
-+++ b/atk/atk-enum-types.h.template
-@@ -14,7 +14,7 @@ G_BEGIN_DECLS
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
--- 
-2.14.1.459.g238e487
-
diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.32.0.bb
similarity index 86%
rename from meta/recipes-support/atk/atk_2.30.0.bb
rename to meta/recipes-support/atk/atk_2.32.0.bb
index 4e2dacbc4d..5425c8e57e 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.32.0.bb
@@ -30,10 +30,9 @@ EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'Tr
 
 SRC_URI_append = " \
                    file://0001-meson.build-enable-introspection-for-cross-compile.patch \
-                   file://0001-Switch-from-filename-to-basename.patch \
                    "
-SRC_URI[archive.md5sum] = "769c85005d392ad17ffbc063f2d26454"
-SRC_URI[archive.sha256sum] = "dd4d90d4217f2a0c1fee708a555596c2c19d26fef0952e1ead1938ab632c027b"
+SRC_URI[archive.md5sum] = "c10b0b2af3c199e42caa6275b845c49d"
+SRC_URI[archive.sha256sum] = "cb41feda7fe4ef0daa024471438ea0219592baf7c291347e5a858bb64e4091cc"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1




