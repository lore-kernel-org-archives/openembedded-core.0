Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12577C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.64296.1744073524785885673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z3CvYnM+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073525; x=1775609525;
  h=from:to:cc:subject:date:message-id;
  bh=QNmXzYOn9Agb1XJ51bR6pHhySLONLJxWNYUDy4ZSsJ8=;
  b=Z3CvYnM+uuSACY+X28F+jq3w7t7I1rJXtKwillCGTAVrkFdMVsjyBqEr
   w1+O+5dzboM2zkcE3xH1zQS8foRZyZglOTUTMO7o9E/hnN4Vw/z+FRnpc
   l/8nGtkrpbP7WldXzFz62dE/ZW5j6p0ntP9sEy5EdzLSc/Xg4+t5zinaW
   w6ol/kJhghFGIXa1z6pmWevuwaZoKgAUEBZ590veTgBYexd7r2GskBhYH
   9mxhoFgke4paOv/Qtm5r89w9sY4DNu9CVKQLEC5mo8EDDyd2pMX0vhede
   77cm+iSXS7+tMUFpfnRVVpP1uYteizOgUcA8VibAFtu2531/716mOfioy
   Q==;
X-CSE-ConnectionGUID: pHd/Tdy3QRed/S9oyrkiKA==
X-CSE-MsgGUID: Re6WDTqkQSyFPnlPu/YKWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="195727211"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="195727211"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 46A7DD480A
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AE75D8ACD
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 292DE1A009A;
	Tue,  8 Apr 2025 08:51:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/15] curl: upgrade 8.12.1 -> 8.13.0
Date: Tue,  8 Apr 2025 08:51:28 +0800
Message-Id: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214484

From: Wang Mingyu <wangmy@fujitsu.com>

no-test-timeout.patch
refreshed for 8.13.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch        | 6 +++---
 .../recipes-support/curl/{curl_8.12.1.bb => curl_8.13.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_8.12.1.bb => curl_8.13.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 677d177302..8f58277bc6 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 239c2f04d0ccb16f9ede473efa58c601e5379f3c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,10 +11,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index a3e5edb..f75df79 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -123,7 +123,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.13.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.12.1.bb
rename to meta/recipes-support/curl/curl_8.13.0.bb
index dd1c89979a..cb2c42baa9 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.13.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
+SRC_URI[sha256sum] = "4a093979a3c2d02de2fbc00549a32771007f2e78032c6faa5ecd2f7a9e152025"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.43.0


