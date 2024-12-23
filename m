Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA03AE77198
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10447.1734945084131192814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hvxtv65b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945084; x=1766481084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B27wze6wDc5Sv6UGOQSK3qs2S+MZTNQIP5z7gDYgev4=;
  b=hvxtv65bSGG0MgxIWvSy6x7cLHUTDHLV8FV05PQQnycQs8mtRMNCb+wg
   /p8wZOjHG2smxevt4d5JVJa3MY4Oeiuv39HfKrsi8mkN4TbjpCVA2erPM
   x8kKYpIa9KYmweNpz5BLx/MXsAceeFYisp/yl/9bsAwHe+fYGGLpeNcC/
   RPrPUyZ+4goDm7MwCCBOyZEmTiUMfoJ2hFfzD6vFyO5uxp0kOaoMVteWi
   rhxvAegf147rzjgptUAr4BdD7dkZq/I2fPGolDtIyWIxzgCGpBEuhZGAV
   u/vSPEoI1e8NuZQRbQddE54EuIT6K9w08OPg2xZXtcgXQkrkNkGl+5Zgg
   A==;
X-CSE-ConnectionGUID: h0SIfrMKQPqqNGUywh4opQ==
X-CSE-MsgGUID: Wp7qonRWS+2ubRQxkMmxoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184687224"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184687224"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC4A9C2266
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C465DD8B32
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 391D5200930C0
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D77421A0071;
	Mon, 23 Dec 2024 17:11:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/22] python3-hypothesis: upgrade 6.119.4 -> 6.122.6
Date: Mon, 23 Dec 2024 17:10:52 +0800
Message-Id: <1734945065-4373-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BzNCdGumZsSZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S9ck968Uzm8ZhD17TbAzU0kx/OAWzUK4wXzDqt+9Rnabbta
	o0BT6XLHYp+O9wFA+DvZ5kcEmRVstv5LI3/JjpsPECdGE/5jHZS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.119.4.bb => python3-hypothesis_6.122.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.119.4.bb => python3-hypothesis_6.122.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.119.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.119.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb
index 66e7b2e967..37eac3a1a5 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.119.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "1a7d12709c0e96c1d85aca76d1594b34b5958623e00511592eba674acd4f3392"
+SRC_URI[sha256sum] = "2642598dc4426945d62b849a915d0d3e2d53f0fb17090f0cf10d8a545a421dc1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


