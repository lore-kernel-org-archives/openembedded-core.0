Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3622DC71144
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.11663.1749026748994963949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RwRQE5Qz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026749; x=1780562749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3gf74ZRkhIXcxNRbcrEJnTYv13dabbeEGEV8T1Sqad8=;
  b=RwRQE5QzDqRQa3HoUw/YwDsMo/WVMTFlydRJ4LdalMZivElvNnUwfAsv
   CtrwmBptwkQaxdls8DUlmR6QVtlv08xz+yjp44D7lUArVrjNX7V3DfQKw
   /xnnW5CX51SfW/A1b+7q/r6xyDQpJiXQ/T3dw+qIJDUNHVVJ9p3EF+oG3
   HuivGk2bGgN8ze3a3UjhJTMlngZ7HbrZtRjtoXE/MYy5gFAHcEwGa2kIX
   xRDtTFy4azLLDqGWHCFFIFsZP6XoLNzX9v6MaNBDDhGkuVLPnc8ge2gDK
   dzpJJ+vM3T63nr+n/F3RQmwulneubhKXKnX5EZwquIrvuSZ89f8RufOw8
   A==;
X-CSE-ConnectionGUID: j9bABSdVSyCFI46YG1heFA==
X-CSE-MsgGUID: ZU982+pRSxi2fWDuNw3dHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="200884767"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="200884767"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:47 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93F04D4C2B
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 52D95D7624
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:44 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C963D1A0078;
	Wed,  4 Jun 2025 16:45:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 44/45] ruby: upgrade 3.4.3 -> 3.4.4
Date: Wed,  4 Jun 2025 16:45:22 +0800
Message-ID: <20250604084524.864-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217891

From: Wang Mingyu <wangmy@fujitsu.com>

0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
refreshed for 3.4.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 6 +++---
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 meta/recipes-devtools/ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb} | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.3.bb => ruby_3.4.4.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index bb67df0f40..84fe9aee3d 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 7e2337d8b0daf264785cb06d1d6c7d61e428a11b Mon Sep 17 00:00:00 2001
+From 2625f6c155105d352d6a1ff3a722e7896431ff91 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index 05432cd..41a05bb 100644
+index 8f996b8..c708b64 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -119,7 +119,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+@@ -120,7 +120,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
  XDLDFLAGS = @DLDFLAGS@
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index eda45dd862..190eb7d728 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From ff25f6dddcfbbb7b0464485bb5132458866ab51a Mon Sep 17 00:00:00 2001
+From 97051be9cb9317d2c4d61a82d6d953809e962f13 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 8f353ae..095125f 100644
+index 0b905a7..a102e3c 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1711,7 +1711,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1709,7 +1709,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.3.bb b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.4.3.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.4.bb
index 45047b8859..39e86fdd28 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "55a4cd1dcbe5ca27cf65e89a935a482c2bb2284832939266551c0ec68b437f46"
+SRC_URI[sha256sum] = "a0597bfdf312e010efd1effaa8d7f1d7833146fdc17950caa8158ffa3dcbfa85"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


