Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB386C0BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:30:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN7UYlX025156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 23:30:34 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 23:30:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 15:47:21 +0800
Message-ID: <31ac4cae5b9e8349e6595e3059228c89f5524f50.1542959097.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542959097.git.hongxu.jia@windriver.com>
References: <cover.1542959097.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] gnupg: upgrade 2.2.10 -> 2.2.11
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
X-List-Received-Date: Fri, 23 Nov 2018 07:30:33 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-configure.ac-use-a-custom-value-for-the-location-of-.patch   | 4 ++--
 meta/recipes-support/gnupg/gnupg/relocate.patch                       | 2 +-
 meta/recipes-support/gnupg/{gnupg_2.2.10.bb => gnupg_2.2.11.bb}       | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.10.bb => gnupg_2.2.11.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 26ac99e..ab0b6dc 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From e30c1d3f3bb40bfaa83f768b8651f587c9d17e6f Mon Sep 17 00:00:00 2001
+From 5f38f1276a3651c30bddc508122da2e7d2d3ca92 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f77317f..749fcaa 100644
+index 8c80377..a66d393 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1841,7 +1841,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 616f32a..860f7f1 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 5a8258dde5ad17b4a53463d7184cf782a7594977 Mon Sep 17 00:00:00 2001
+From 1eaf630343cc77d8b5d41d0b0a3551fa193c5fcf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.10.bb b/meta/recipes-support/gnupg/gnupg_2.2.11.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.10.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.11.bb
index fba2fdf..d259ed5 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.10.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.11.bb
@@ -19,8 +19,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "3ae8bd6246367602e72571f7a6588bcd"
-SRC_URI[sha256sum] = "799dd37a86a1448732e339bd20440f4f5ee6e69755f6fd7a73ee8af30840c915"
+SRC_URI[md5sum] = "e23a896d634e8b81681314780f5158a4"
+SRC_URI[sha256sum] = "496c3e123ef53f35436ddccca58e82acaa901ca4e21174e77386c0cea0c49cd9"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.7.4


