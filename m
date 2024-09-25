Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D2DCF9C73
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.9321.1727246989241421908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RoUtMdIl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246993; x=1758782993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mT/gbGu1WRhLCL7sHlAjwA9ItzspS3sDEQdcODIXSSs=;
  b=RoUtMdIlpMGxjNOMkM4AOPhInSXfWGDqpmlPOMj6WRgUL9RZXFVzC8VG
   mYOxjV/Upa0jNhix5Xo3xUUy1m7uQogWXdARTThtdV/2BugpVEOwT1Cxh
   3fa6tc4Aweszgd4k02k10uzWo+/AraxhHJk9QS5GkKxiSPbJA05xQUt4v
   scZpHlkU8JUPzVmU4gwa0YOcZ7x6MY0OAu6Bp/MDR12w3GmdxBWCBHDXj
   ONXBupddyzFiIeQdlM0MVnjPVfsl5ulrcFVguazlecwFiCrSBBJLomjfB
   Li94L2HYPyyaJL5ry9h2yAAuN/lz+gu0qC2cpsz5Sia9qNLRs/N66/nZW
   w==;
X-CSE-ConnectionGUID: h6ucm460SOukaHbAAZ/8AA==
X-CSE-MsgGUID: DL4aWfhIRMuUEFJl+bt6fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="176849316"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="176849316"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 32A9FC8B41
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 77656D5BAD
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CBC27401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7A4FA1A000A;
	Wed, 25 Sep 2024 14:49:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/47] ruby: upgrade 3.3.4 -> 3.3.5
Date: Wed, 25 Sep 2024 14:49:13 +0800
Message-Id: <1727246960-20665-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--4.165500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yTiEPRj9j9rvnJdsOLB4zv7QarzCEH4/6ojA
	+sAfyIsypXroF0mcF3N527+BW5DJ4FpCIuRr0RxKuce7gFxhKa3Vy4hHC3/gyMC5DTEMxpeQFH0
	IKehhaoYDCvV3UwP6eJRBa3u5J+EMr78SC5iivxwURSScn+QSXt0H8LFZNFG7/nnwJ52QYi+Std
	83kHCpUVLb/LvIyq1OojYp6rpASg7fHygu5tCCS9LCl0hGy+xqzPuu/2fDqNwuYo4AFhOQtJNnZ
	PFDEHlzzF4NejGsgQm+98a8HXJ7V4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204934

From: Wang Mingyu <wangmy@fujitsu.com>

0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
refreshed for 3.3.5

Changelog:
 https://github.com/ruby/ruby/releases/tag/v3_3_5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 meta/recipes-devtools/ruby/{ruby_3.3.4.bb => ruby_3.3.5.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.4.bb => ruby_3.3.5.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 5570cdfcaa..c2daa627e6 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 91304f26dd4153ecae752ea875eec9ce2d5d3963 Mon Sep 17 00:00:00 2001
+From 33814428ef00e1805ae34a7684e53d249658289c Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 05ce483..5f2dbd1 100644
+index d6eac7f..4b2e95e 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1698,7 +1698,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.4.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.4.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.5.bb
index d39b7ae520..5a7b8137aa 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "fe6a30f97d54e029768f2ddf4923699c416cdbc3a6e96db3e2d5716c7db96a34"
+SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


