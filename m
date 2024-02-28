Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C812C54E55
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8422.1709105612417738887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CvLa1C2u;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105618; x=1740641618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vxVZdkYjJG3e7KxHZt98bAHHtD1fmfKJv/iqlB3P184=;
  b=CvLa1C2uptmwu7Y8d8ec0s4IcH0GBoRIWgMtgQw0peHSqWSeCdV2jLDp
   dgf3wwRrbAdX1RqRbfFfR4ayCwC6JVYKT6QEH3k/cOChtvV+3+3kHLYn/
   lrSNclU79mQj+bgk0/0Ct92LYtbgQY+k31fhl+D6+1Rz1XZOgGG0pAEr0
   aqluz0vUrzVHZyUXoPV42zmwQR9PpiBQRwtSBLym/o4vAr8JLy5ohZz1U
   VasYhbwYYvmocc2e2mdXMwD2/d6xuB2dFUphxFSDbCnTZNMV8nq8478r9
   yH/D3j/xf0y+/6sH6B2aG4ZMDCA3hyKRDit73qg6Fy40jMRNUbERP5Fu8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150123434"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150123434"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CCC8912E231
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04328D6210
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FC6C41180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 389A41A006A;
	Wed, 28 Feb 2024 15:33:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/48] python3-hypothesis: upgrade 6.97.3 -> 6.98.12
Date: Wed, 28 Feb 2024 15:32:40 +0800
Message-Id: <1709105575-24259-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DCHpeB2SdtvoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLKly+G58QYkShoD+KOV19u2AtX0Awo1a7Hxf
	R9xX2q2rM+Xx1OTH6HMJMpdvDXL/i7fvNXZSNMI+QS6f9EzICcO6IcZa5Rz0f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196358

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-hypothesis_6.97.3.bb => python3-hypothesis_6.98.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.97.3.bb => python3-hypothesis_6.98.12.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb
index 52ed2da575..a74c3af401 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "00216ddadaee17ba73451e262f973970a97d34fd75ec34ef57510147264c34d1"
+SRC_URI[sha256sum] = "584ef03a847464b0d14a63e53fcc3335a75b1f1eb3bcc770a03ff950ee4e279e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


