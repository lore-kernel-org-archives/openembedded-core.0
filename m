Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA43C54E68
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:42 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8397.1709105616748395131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G1RX13M4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105621; x=1740641621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VtKyQb5dxjNZ2k/2WCQNEU2Amg3xfUxIMcBNLrrsvBA=;
  b=G1RX13M4udtiwmMZlUMjX2f424TO3UHTtFuN9ZRjmyEsyHzidUFk/4Ny
   Sm3lQiJOwvDPR1FFi95d93oTm0hI5mJl06ZbKmprPp1Zu6AM/xX7srgkv
   WBDo/U0X4sWgbmjYU2XOtzd5a2l1on1GnuqpNnXuEfUQ6EECZ4LQC74lE
   Kr2rqbUh9eJ0D1LunKb0ITEiM/prF8IvB6C0qi+x2gd47Ox433uR0etqJ
   sZe4hlNBBgTDSWY4jpkzoFX3vbhJhmmwtRQnspFNqlvtXA0w2ri83L84R
   8sK9HCKfdptMO2vmMhLX26eF7+8XZmYyHIKC8cN8vMg9YNKBXBgd14cQt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150649128"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150649128"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:40 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 500A41590F3
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EF63FD860
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D03541180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF3DA1A006A;
	Wed, 28 Feb 2024 15:33:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/48] python3-trove-classifiers: upgrade 2024.1.8 -> 2024.2.23
Date: Wed, 28 Feb 2024 15:32:47 +0800
Message-Id: <1709105575-24259-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--2.623300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwli8Y5a0svL88L
	GTNFqWKaAye6NYYDq+DE0/GnRGyw5m0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7U9a
	6zfLFA1bss9r//dw7twYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtXvzbqjMVwdaQL59MTDMsGDEqyaQiZMFxmplN5e00EYBuG/t7nj8sgSKAx
	QFH/XSl6FzO64Yw/3fohCm5AAQdo0QpIRwakNKqHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196364

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
*Add classifier: 'License :: OSI Approved :: Educational Community License'
*PR for Issue #170
*fix spurious line
*Update src/trove_classifiers/__init__.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fiers_2024.1.8.bb => python3-trove-classifiers_2024.2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.1.8.bb => python3-trove-classifiers_2024.2.23.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb
index 6b923bb43f..8514a52616 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6e36caf430ff6485c4b57a4c6b364a13f6a898d16b9417c6c37467e59c14b05a"
+SRC_URI[sha256sum] = "8385160a12aac69c93fff058fb613472ed773a24a27eb3cd4b144cfbdd79f38c"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


