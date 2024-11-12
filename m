Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9465AD32D7A
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.82445.1731403558262355014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dSPU3Uzv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403558; x=1762939558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=copDRbuLsA4bAll/hsndV+sVepmkzyzwXFVnC1ZMFas=;
  b=dSPU3UzvBxZKqtP8Yg3Ejcy3Ht8rjT7YtFLlrswi4CMoa+9/ZjCzsr+r
   YpGaJnXFJlRNodB0fi2tKpW2vlzCgkreuAn1WMRmRGccAlvSmH+nivdN9
   7AzIMjAm4SgiNBqzMdcwwBnDOv64Do9Nnz0VhlAFdW2OfpW2Vp+GqX4HE
   GcDTYPRfSgyp0GHoxfO0FAWU7SnFwBQyVxQ/VoUl7ayIkRXQ61mYuDXFi
   7e+4Q8TZ+7imhLas75upWIsNM36wltuS/IPjeUWeM4qAC/r/zw6bRAcj7
   vF9AkgdmNL1ySVMIrkgv3X2mTr02XtL2SRnracvaq5wr8t4cl+9VhFlWn
   A==;
X-CSE-ConnectionGUID: v5j9rrHqQlehPB1FnrczHQ==
X-CSE-MsgGUID: dw+4vb6uR9G8ypvG8uTTeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="158940947"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="158940947"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D7838D5011
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 708D928EB9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F9A120071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B33891A000A;
	Tue, 12 Nov 2024 17:25:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 41/47] ruby: upgrade 3.3.5 -> 3.3.6
Date: Tue, 12 Nov 2024 17:24:37 +0800
Message-Id: <1731403483-21399-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--2.137400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yTiEPRj9j9rvkdS3kPlaZyXfUZT83lbkEO79
	DJRUi35pWwhqFGcExMuK8WnR386CVmVjCRquYdk+EXjPIvKd74AZskwWqoib3F/TJVF6hUztwC2
	kFlMIyYni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZK2HX27HBEZnLy5XRsV4hpcQFHLTyooITWdci
	rCvhR1lAIfPHjsUvxmP0JfMBSd7F5esT0K/jgdpZh2q6Rpu5V3/bMXPDhCIYtLv5Eyr/YIrqsDh
	ztRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207028

From: Wang Mingyu <wangmy@fujitsu.com>

0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
refreshed for 3.3.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.3.6.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.3.6.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 5570cdfcaa..248158b6dc 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 91304f26dd4153ecae752ea875eec9ce2d5d3963 Mon Sep 17 00:00:00 2001
+From d2376d94b4d285062b67803dc3278d58c14a5297 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 05ce483..5f2dbd1 100644
+index e438669..3ce9af8 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1698,7 +1698,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.6.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.6.bb
index c5609893ca..6751b36a44 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.6.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
+SRC_URI[sha256sum] = "8dc48fffaf270f86f1019053f28e51e4da4cce32a36760a0603a9aee67d7fd8d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.34.1


