Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA2B6612C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:22:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 21 Nov 2016 04:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="33947681"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 21 Nov 2016 04:22:28 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 49E8A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:21:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:22:51 +0200
Message-Id: <1479730971-23120-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
References: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] libsolv: upgrade to 0.6.24
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
X-List-Received-Date: Mon, 21 Nov 2016 12:22:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refreshed the following patch:
        a) 0001-Add-fallback-fopencookie-implementation.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-Add-fallback-fopencookie-implementation.patch   | 16 +++++++---------
 .../libsolv/{libsolv_0.6.23.bb => libsolv_0.6.24.bb}     |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.23.bb => libsolv_0.6.24.bb} (94%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
index 24e2228..851fe57 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
@@ -1,8 +1,6 @@
-From 5b6e113f548bd8a2b100267bc5d54cee861a4b98 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Neal=20Gompa=20=28=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB?=
- =?UTF-8?q?=E3=82=B3=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A=29?=
- <ngompa13@gmail.com>
-Date: Wed, 11 Nov 2015 20:32:17 -0500
+From 0a8e50f7322832efdaf33da87839fbba05a755de Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Mon, 21 Nov 2016 11:46:00 +0200
 Subject: [PATCH] Add fallback fopencookie() implementation
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -12,9 +10,9 @@ In environments where neither fopencookie() nor funopen()
 are implemented, we need to provide a suitable implementation
 of fopencookie() that we can use.
 
-Upstream-Status: Submitted [ https://github.com/openSUSE/libsolv/pull/112 ]
+Upstream-Status: Denied [ https://github.com/openSUSE/libsolv/pull/112 ]
 
-Signed-off-by: Neal Gompa (ニール・ゴンパ) <ngompa13@gmail.com>com>
+Signed-off-by: Neal Gompa (ニール・ゴンパ) <ngompa13@gmail.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
  ext/CMakeLists.txt                     |   7 ++
@@ -26,7 +24,7 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  create mode 100644 ext/solv_xfopen_fallback_fopencookie.h
 
 diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index ad52495..4f282ce 100644
+index 586eda8..477a2ef 100644
 --- a/ext/CMakeLists.txt
 +++ b/ext/CMakeLists.txt
 @@ -4,6 +4,13 @@ SET (libsolvext_SRCS
@@ -40,7 +38,7 @@ index ad52495..4f282ce 100644
 +        solv_xfopen_fallback_fopencookie.h)
 +ENDIF (NOT HAVE_FOPENCOOKIE AND NOT HAVE_FUNOPEN)
 +
- IF (ENABLE_RPMDB)
+ IF (ENABLE_RPMDB OR ENABLE_RPMPKG)
      SET (libsolvext_SRCS ${libsolvext_SRCS}
          pool_fileconflicts.c repo_rpmdb.c)
 diff --git a/ext/solv_xfopen.c b/ext/solv_xfopen.c
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.23.bb b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
similarity index 94%
rename from meta/recipes-extended/libsolv/libsolv_0.6.23.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.24.bb
index f3f3d6e..a5d7b5a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.23.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git \
           "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
 
-SRCREV = "f654c8cfa52427ed42d7142e58452dae08c0c2d0"
+SRCREV = "4049d57b026d3a67c8c164ed20db85ff62b87728"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


