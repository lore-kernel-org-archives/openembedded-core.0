Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 602A47F311
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 05:06:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,352,1559491200"; d="scan'208";a="73043975"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 13:06:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 186914CDFAD4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 13:06:38 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019 13:06:36 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 13:05:56 +0800
Message-ID: <20190806050556.10787-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 186914CDFAD4.AF6B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nettle:upgrade 3.4.1 -> 3.5.1
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
X-List-Received-Date: Tue, 06 Aug 2019 05:06:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

nettle-stdint.h was no longer use.
Remove nettle/nettle-stdint.h in do_install_append() of .bb file.

Changelog in ChangeLog file as follows:

2019-01-06  Niels Möller  <nisse@lysator.liu.se>

        * nettle-types.h: Don't use nettle-stdint.h, include <stdint.h>
        directly.
        * nettle-write.h: Likewise.
        * configure.ac: Delete use of AX_CREATE_STDINT_H.
        * aclocal.m4 (AX_CREATE_STDINT_H): Delete.
        * Makefile.in (INSTALL_HEADERS, distclean-here): Delete mention of
        nettle-stdint.h.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../Add-target-to-only-build-tests-not-run-them.patch               | 0
 .../check-header-files-of-openssl-only-if-enable_.patch             | 0
 .../nettle/{nettle-3.4.1 => nettle-3.5.1}/dlopen-test.patch         | 0
 .../recipes-support/nettle/{nettle-3.4.1 => nettle-3.5.1}/run-ptest | 0
 meta/recipes-support/nettle/{nettle_3.4.1.bb => nettle_3.5.1.bb}    | 6 +++---
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/nettle/{nettle-3.4.1 => nettle-3.5.1}/Add-target-to-only-build-tests-not-run-them.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4.1 => nettle-3.5.1}/check-header-files-of-openssl-only-if-enable_.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4.1 => nettle-3.5.1}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.4.1 => nettle-3.5.1}/run-ptest (100%)
 rename meta/recipes-support/nettle/{nettle_3.4.1.bb => nettle_3.5.1.bb} (89%)

diff --git a/meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.5.1/Add-target-to-only-build-tests-not-run-them.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
rename to meta/recipes-support/nettle/nettle-3.5.1/Add-target-to-only-build-tests-not-run-them.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.5.1/check-header-files-of-openssl-only-if-enable_.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
rename to meta/recipes-support/nettle/nettle-3.5.1/check-header-files-of-openssl-only-if-enable_.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.5.1/dlopen-test.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
rename to meta/recipes-support/nettle/nettle-3.5.1/dlopen-test.patch
diff --git a/meta/recipes-support/nettle/nettle-3.4.1/run-ptest b/meta/recipes-support/nettle/nettle-3.5.1/run-ptest
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.4.1/run-ptest
rename to meta/recipes-support/nettle/nettle-3.5.1/run-ptest
diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.5.1.bb
similarity index 89%
rename from meta/recipes-support/nettle/nettle_3.4.1.bb
rename to meta/recipes-support/nettle/nettle_3.5.1.bb
index cd8024f..d92db0e 100644
--- a/meta/recipes-support/nettle/nettle_3.4.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.5.1.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
-SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
+SRC_URI[md5sum] = "0e5707b418c3826768d41130fbe4ee86"
+SRC_URI[sha256sum] = "75cca1998761b02e16f2db56da52992aef622bf55a3b45ec538bc2eedadc9419"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -37,7 +37,7 @@ do_compile_ptest() {
 }
 
 do_install_append() {
-    oe_multilib_header nettle/nettle-stdint.h nettle/version.h
+    oe_multilib_header nettle/version.h
 }
 
 do_install_ptest() {
-- 
2.7.4




