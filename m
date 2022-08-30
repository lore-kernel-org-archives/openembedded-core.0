Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90220ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 09:00:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.9423.1661850010424489664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 02:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jsu5r+O/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661850008; i=@fujitsu.com;
	bh=Gy8tdNsBkzZYIzbrf/toTwysDHwdxmgwOGuTKrkExVM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jsu5r+O/EzUdz/NNDCHLRf6IXpoiWu/AEn8ZUPqFeiwqvmKs/8Qnis+Rny/dVlrue
	 YK5X3JGG0UtBgf5qSrlE2iGPVBRXm2AOa3U9OpBrAsxgmXzQU8zrlgyIFhRTJCcaRd
	 +3/e5mkEjoIypcf4+EmHCsOjaSZ7Zj0OgqDIx4cUOrwW+1Pdt+e5SeKrf0CZ6ggOUL
	 BVWNm9sr1UjtY1kwxnri90yuTLG9zwgc8V7PoFOHx48glqP7slaXdzsjSmCwYPUnIF
	 CIpeiBiowhm4s9QQMKyGV/YIGSXlLW/qxJ7KMpqp6WdXbT9aTA3FjjKzeTIH8UKLim
	 0EP9mDlaRXcyg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8OxWXfGRd5
  kg+trOS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxPPR0sBRdsKnau2cTUwHjYvIuRi0NI4AGj
  xKqvB9kgnCtMEpfPP2CHcPYySlyec4+li5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBRwljnU9ZwIpYRFQlTi8LxokzCvgJHHn0h6wEgkBBYkpD98zQ8QFJU7OfMICMUZC4u
  CLF8wQNYoSsy83s0DYlRJ7ZvUzQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJxVlpmeU5CZm5ug
  aGhjoGhqa6hpb6hoZGOglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgQGZUqx
  +okdjE9X/tQ7xCjJwaQkytuwjTdZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv13NAOcGi1PTUi
  rTMHGCEwKQlOHiURHi7zgCleYsLEnOLM9MhUqcYvTmuXrmyl5lj6ux/+5k5loPJmV/bDjBztG
  /vApKb9gFJIZa8/LxUKXFetwNAIwRARmSU5sEtgEX6JUZZKWFeRgYGBiGegtSi3MwSVPlXjOI
  cjErCvO9A7uTJzCuBu+MV0IlMQCc+XMINcmJJIkJKqoHpvMOGoqLTO0qdD7Oks7S7hL38y6g8
  k2P+5KrEO6v25vHuF9FL2HQg3VT9rs7r1v3+fbMPtBnmrHxd7lYwbbnO+lnSRTP2iN+Q/OWq6
  nDu4laPhO6pC9UYGC7HLeh7/uj/tL4tX1clxrhznzjduNhfNITzn7Rd5rQOj3nXDRUilL99Pf
  Z0hv0EX8MzB18eq9jDHHZknlBElNTHG5MFU3bc2cwWxf91cWmRaMn7h/nqE5J3B3QfDbiTGZr
  DaWEr/tb1L8uFkrpN9TlPuXP6/J9ELTScu35XO/fMzEsxilvifWTv7Ct8cufx3GdXLqbGX3n5
  WS3WUa93/uoanUuiSfWe02Munq2982xFcvG0mpxHSizFGYmGWsxFxYkApnf+KG8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1661850008!433906!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23128 invoked from network); 30 Aug 2022 09:00:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 09:00:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AD906155
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 10:00:07 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A3635142
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 10:00:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 10:00:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vulkan: upgrade 1.3.216.0 -> 1.3.224.1
Date: Tue, 30 Aug 2022 16:59:50 +0800
Message-ID: <1661849990-14381-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 09:00:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170068

spirv-tools:
 0001-Remove-default-copy-constructor-in-header.-4879.patch
 removed since it's included in 1.3.224.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lang_1.3.216.0.bb => glslang_1.3.224.1.bb} |  2 +-
 ....3.216.0.bb => spirv-headers_1.3.224.1.bb} |  0
 ...ult-copy-constructor-in-header.-4879.patch | 34 -------------------
 ..._1.3.216.0.bb => spirv-tools_1.3.224.1.bb} |  6 ++--
 ...3.216.0.bb => vulkan-headers_1.3.224.1.bb} |  2 +-
 ....3.216.0.bb => vulkan-loader_1.3.224.1.bb} |  4 +--
 ...1.3.216.0.bb => vulkan-tools_1.3.224.1.bb} |  2 +-
 7 files changed, 7 insertions(+), 43 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.216.0.bb => glslang_1.3.224.1.bb} (95%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.1.bb} (100%)
 delete mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.1.bb} (88%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.216.0.bb => vulkan-headers_1.3.224.1.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.216.0.bb => vulkan-loader_1.3.224.1.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.216.0.bb => vulkan-tools_1.3.224.1.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
index 69d9a0a84e..dd8df15fc7 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "adbf0d3106b26daa237b10b9bf72b1af7c31092d"
+SRCREV = "10423ec659d301a0ff2daac8bbf38980abf27590"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.224.1.bb
diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch b/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
deleted file mode 100644
index 044c366a75..0000000000
--- a/meta/recipes-graphics/spir/spirv-tools/0001-Remove-default-copy-constructor-in-header.-4879.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a90ccc240501bf3362b23f67771f65b7dec2ccf9 Mon Sep 17 00:00:00 2001
-From: Jamie Madill <jmadill@chromium.org>
-Date: Fri, 29 Jul 2022 14:26:37 -0400
-Subject: [PATCH] Remove default copy constructor in header. (#4879)
-
-A recent libc++ roll in Chrome warned of a deprecated copy. We're
-still looking if this is a bug in libc++ or a valid warning, but
-removing the redundant line is a safe workaround or fix in either
-case.
-
-See discussion in https://crrev.com/c/3791771
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/pull/4879]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- source/opt/merge_return_pass.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/source/opt/merge_return_pass.h b/source/opt/merge_return_pass.h
-index a35cf269..d15db2f6 100644
---- a/source/opt/merge_return_pass.h
-+++ b/source/opt/merge_return_pass.h
-@@ -118,8 +118,6 @@ class MergeReturnPass : public MemPass {
-     StructuredControlState(Instruction* break_merge, Instruction* merge)
-         : break_merge_(break_merge), current_merge_(merge) {}
- 
--    StructuredControlState(const StructuredControlState&) = default;
--
-     bool InBreakable() const { return break_merge_; }
-     bool InStructuredFlow() const { return CurrentMergeId() != 0; }
- 
--- 
-2.37.2
-
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
similarity index 88%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
index fc1074d8b8..cfea28a6ef 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb
@@ -7,10 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https \
-           file://0001-Remove-default-copy-constructor-in-header.-4879.patch \
-          "
+SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
index 5f7917ae82..8d34738ad7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "3ef4c97fd6ea001d75a8e9da408ee473c180e456"
+SRCREV = "c896e2f920273bfee852da9cca2a356bc1c2031e"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
index 15a079879b..f24db87962 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.216;protocol=https"
-SRCREV = "322f7e3212b4fd9d70d7f48972963c83d24d06e4"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.224;protocol=https"
+SRCREV = "09afdf64210b11ec653a1001e013b5af4fce8559"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
index e26f4504f1..bed10afef1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
-SRCREV = "ef9db7a8ec52f6c56158d83f5d57ef388c1abec1"
+SRCREV = "497f232680b046db34ba9e9da065e6303a125851"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


