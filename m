Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC0BC52CDA
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.46594.1722215430009041958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o1dn6c6n;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215430; x=1753751430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VPYGNhWOYNKvo2Rk0Hc81ef1Ci8v5DXkfY6w2puztGw=;
  b=o1dn6c6n9zIXzTzZhRDFYByBfKkTThXW+1SQordPAQ9TlheN0tUogiVu
   B2L74MSl9swvz0r7ReNC5Xn3ELpSrPeZojl3oLHKvSuBlv+m89/JPids3
   VWCsOvkpi93C/Y0wY2B1bwl4JpkJ4scTGlpYibSENhgJFOcGHvs0S37hD
   OTZNDNqxsVw8fCAKfDfl7eqE34ONWamgPUtvlvE2UV2BDJUP+pYAUleLG
   sQXqUVaHZT1JiSOr/ZoXvgJxq5F7hl1ntr8QYiL91a53XXU8NiNgprbsI
   UJrLycrEMhSOlh51NwAxCMdyF2+b/xGgDjgGoJNa690Gmn2U6fSMJqeH6
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="156246509"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="156246509"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56C77C68E5
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 956D2D5086
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1748E20071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C5B41A000C;
	Mon, 29 Jul 2024 09:10:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/33] python3-hypothesis: upgrade 6.105.1 -> 6.108.4
Date: Mon, 29 Jul 2024 09:09:49 +0800
Message-Id: <1722215408-27541-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BzNCdGumZsSZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62Sefyoc4pnuZlseY9z+f4H8ZWveXC07NlTiu4rLYyw+hx2s8
	5lw7QQSnYp+O9wFA+DvZ5kcEmRVstv5LI3/JjpsPECdGE/5jHZS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202590

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.105.1.bb => python3-hypothesis_6.108.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.105.1.bb => python3-hypothesis_6.108.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.108.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.108.4.bb
index e582289062..c2dcefcb67 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.105.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.108.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "d4eedb42193da9507623f4fe27fd38f715ec19ad30ad7c30e3b25594c0b491dc"
+SRC_URI[sha256sum] = "bab99a308ea39be53882f1d89ab77db48e0c03b5c37fbedd2f59f9b656ada301"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


