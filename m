Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56C7C5B555
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11714.1749026734027549999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=trJroGTr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026735; x=1780562735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=66kkX9GkjYXctRC+PoE5q3gUm4/qGFPTT3rJ1fy+uc0=;
  b=trJroGTrwYZDOGIsRVuFBVfIVpRudHdJFcEc2KjHkI/CohMuQj5LOJWf
   En5N4DnOA3iuMgUQcEQjzhQtY+BBpX//myTDoIFk+rI8qw67fOB79O3iA
   6xaN7fC10pkAe8/6RPJClTsJ2XeGNtLeUcG2v2eXYmXwIH4Yf1G5V8m+x
   o7XTd5Ye2OxLHMLeyMUzKp7+5taVmKhDePv/b66LSg2BjCKyLC9hDDnCJ
   ijlbrG2Rk4lX9WTBCpT7z3mFMudDnBP5Qbe+c0RZnCoHnF7BXI42T3FlS
   fjWHp7OvrwhVlxnRlt2Cu1eJonsfdiW1FqpQoWQh4lrZuY58fcjEgzh26
   g==;
X-CSE-ConnectionGUID: QjdViyYcTkaguCN/4e5T/Q==
X-CSE-MsgGUID: MrKCltYSRD+wUjohn/lDwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201724453"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201724453"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C1C7D6861
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 586CF296E7E
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:28 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D174E1A0078;
	Wed,  4 Jun 2025 16:45:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/45] dhcpcd: upgrade 10.2.2 -> 10.2.4
Date: Wed,  4 Jun 2025 16:44:41 +0800
Message-ID: <20250604084524.864-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217852

From: Wang Mingyu <wangmy@fujitsu.com>

0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
refreshed for 10.2.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.2.2.bb => dhcpcd_10.2.4.bb}         | 2 +-
 ...esolv.conf-improve-the-sitation-of-working-with-.patch | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.2.2.bb => dhcpcd_10.2.4.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
index f9dfd2e245..dee921d21c 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"
+SRCREV = "93df2b254caf9639f9ffb66e0fe2b584eeba6220"
 S = "${WORKDIR}/git"
 
 # Doesn't use automake so we can't do out-of-tree builds
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 4f687b0292..512e33aebf 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From 33710a648a805d96abf49d5adf6ca55b89f9c858 Mon Sep 17 00:00:00 2001
+From d1581ce103db0a5db0b1761907fff9ddd6b55a8a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
@@ -27,7 +27,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/hooks/20-resolv.conf b/hooks/20-resolv.conf
-index 7c29e276..becc019f 100644
+index bd0b0df5..9c7721de 100644
 --- a/hooks/20-resolv.conf
 +++ b/hooks/20-resolv.conf
 @@ -11,8 +11,12 @@ nocarrier_roaming_dir="$state_dir/roaming"
@@ -59,7 +59,7 @@ index 7c29e276..becc019f 100644
  	fi
  	rm -f "$cf"
  }
-@@ -170,7 +179,7 @@ add_resolv_conf()
+@@ -179,7 +188,7 @@ add_resolv_conf()
  	for x in ${new_domain_name_servers}; do
  		conf="${conf}nameserver $x$NL"
  	done
@@ -68,7 +68,7 @@ index 7c29e276..becc019f 100644
  		[ -n "$ifmetric" ] && export IF_METRIC="$ifmetric"
  		printf %s "$conf" | "$resolvconf" -a "$ifname"
  		return $?
-@@ -186,7 +195,7 @@ add_resolv_conf()
+@@ -195,7 +204,7 @@ add_resolv_conf()
  
  remove_resolv_conf()
  {
-- 
2.43.0


