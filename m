Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53721794FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:00:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N80nkB019889
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:00:49 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:00:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:21 +0800
Message-ID: <7945afdb9a06f3f121f2c14d7c52743b4a7b6cd3.1535011774.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011774.git.liezhi.yang@windriver.com>
References: <cover.1535011774.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] diffstat: 1.61 -> 1.62
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
X-List-Received-Date: Thu, 23 Aug 2018 08:00:48 -0000
Content-Type: text/plain

Refresh avoid-check-user-break-cc.patch to fix fuzz warning.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../diffstat/diffstat/avoid-check-user-break-cc.patch        | 12 +++++++++---
 .../diffstat/{diffstat_1.61.bb => diffstat_1.62.bb}          |  4 ++--
 2 files changed, 11 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.61.bb => diffstat_1.62.bb} (84%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
index 2df2d00..811faa4 100644
--- a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
@@ -1,3 +1,8 @@
+From 1046593aacb74ff888a0d68c0ff89b20c4bc9ed4 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 15 May 2018 17:17:01 +0800
+Subject: [PATCH] diffstat: fix wrong evaluation of CC
+
 Upstream-Status: Inappropriate [oe specific]
 
 m4 function CF_CC_ENV_FLAGS checks whether variable CC contains options '-I', '-U'
@@ -7,15 +12,16 @@ be included in CC. And then CC will be wrongly filtered.
 So comment out CF_CC_ENV_FLAGS from function CF_PROG_CC.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
  aclocal.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 420fe83..eb73ea9 100644
+index 9281aa8..dd57b7a 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1114,7 +1114,7 @@ CF_GCC_VERSION
+@@ -1239,7 +1239,7 @@ CF_GCC_VERSION
  CF_ACVERSION_CHECK(2.52,
  	[AC_PROG_CC_STDC],
  	[CF_ANSI_CC_REQD])
@@ -23,4 +29,4 @@ index 420fe83..eb73ea9 100644
 +dnl CF_CC_ENV_FLAGS
  ])dnl
  dnl ---------------------------------------------------------------------------
- dnl CF_PROG_GROFF version: 2 updated: 2015/07/04 11:16:27
+ dnl CF_PROG_GROFF version: 3 updated: 2018/01/07 13:16:19
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.61.bb b/meta/recipes-devtools/diffstat/diffstat_1.62.bb
similarity index 84%
rename from meta/recipes-devtools/diffstat/diffstat_1.61.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.62.bb
index 1a76e78..93d7779 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.61.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.62.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://avoid-check-user-break-cc.patch \
 "
 
-SRC_URI[md5sum] = "c048a32d55d8bd6724f382baf41f325f"
-SRC_URI[sha256sum] = "25359e0c27183f997b36c9202583b5dc2df390c20e22a92606af4bf7856a55ee"
+SRC_URI[md5sum] = "91e106bb34cb097750db7ddc0ba1d8fc"
+SRC_URI[sha256sum] = "7f09183644ed77a156b15346bbad4e89c93543e140add9dab18747e30522591f"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
2.7.4


