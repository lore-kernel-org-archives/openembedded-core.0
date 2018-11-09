Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 628046C18A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 08:57:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA98uioi032422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 00:56:54 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 00:56:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:07:04 +0800
Message-ID: <067461f0dbda4384854005b1abc2b845cda1bf95.1541754319.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1541754319.git.hongxu.jia@windriver.com>
References: <cover.1541754319.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] gnupg: upgrade 2.2.9 -> 2.2.10
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
X-List-Received-Date: Fri, 09 Nov 2018 08:57:24 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...onfigure.ac-use-a-custom-value-for-the-location-of-.patch |  4 ++--
 meta/recipes-support/gnupg/gnupg/relocate.patch              | 12 ++++++++++--
 .../gnupg/{gnupg_2.2.9.bb => gnupg_2.2.10.bb}                |  4 ++--
 3 files changed, 14 insertions(+), 6 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.9.bb => gnupg_2.2.10.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 5f1dd30..26ac99e 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 7eb7efb9ce89c66e14c194773c4dcf6478a6ca4d Mon Sep 17 00:00:00 2001
+From e30c1d3f3bb40bfaa83f768b8651f587c9d17e6f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 59a2e60..12d390b 100644
+index f77317f..749fcaa 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1841,7 +1841,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 87ec409..616f32a 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,10 +1,18 @@
-Allow the environment to override where gnupg looks for its own files. Useful in native builds.
+From 5a8258dde5ad17b4a53463d7184cf782a7594977 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 19 Sep 2018 14:44:40 +0100
+Subject: [PATCH] Allow the environment to override where gnupg looks for its
+ own files. Useful in native builds.
 
 Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ common/homedir.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
 diff --git a/common/homedir.c b/common/homedir.c
-index e9e75d01e..19140aa0d 100644
+index e9e75d0..19140aa 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
 @@ -760,7 +760,7 @@ gnupg_socketdir (void)
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.9.bb b/meta/recipes-support/gnupg/gnupg_2.2.10.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.9.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.10.bb
index b7d23b8..fba2fdf 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.9.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.10.bb
@@ -19,8 +19,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "52c895a81f514a65e08923736c38654a"
-SRC_URI[sha256sum] = "6278eaabffa1ebc9fa2ceb3dc53eea9a1505ab02a668a86dd6fec06951af2164"
+SRC_URI[md5sum] = "3ae8bd6246367602e72571f7a6588bcd"
+SRC_URI[sha256sum] = "799dd37a86a1448732e339bd20440f4f5ee6e69755f6fd7a73ee8af30840c915"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.7.4


