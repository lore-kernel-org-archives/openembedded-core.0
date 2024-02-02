Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC97DC4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:14:24 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11675.1706832856004653384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Yz5u5kXb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706832856; x=1738368856;
  h=from:to:cc:subject:date:message-id;
  bh=amfOXwp0FUZP+z72UXQ33Nn+VNBpETfWgJrnTV9Kxcs=;
  b=Yz5u5kXb0hJ+4e/8NJtQZnQSQUA1P9ZJaIJsGhtnLfP0XQ/9ybSN/6E/
   nrgmC1b3rRn+u0aNXP66oDCqQNj97gjZgRjspaC0IPZsHYI4QOaCa35rK
   /reZGJfviQ5mMBow4/OBEnsqTF3hCVR3nwRIbMBVUr/mRpwqBRGLzl3ip
   /zj0qGkfBb9EXvC5OfDWT3r8ehSYpMpHDHLIbZGdpKHZmuMRFuwW7SHps
   tMI9c+I6EL/pJVUwBEhQrOUiNxja2YnS+lP66+clZ0OCZJtUuRSoFndG2
   a5qoLDS0VJv5Dz6rkQtGpix3zgV7CswA5MfH5W2xkpmh0/WUPeaJzeNAO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148079522"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="148079522"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:14:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 660EBB6AE1
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:14:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C0C1107059
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:14:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB1F66B4DB
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:14:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 931691A009A;
	Fri,  2 Feb 2024 08:14:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.92.9 -> 6.97.3
Date: Fri,  2 Feb 2024 08:13:43 +0800
Message-Id: <1706832823-19845-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DCHpeB2SdtvoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJUkBtPHEm7pqv+BAJcbABMca6KJ8GJs/tQJL
	qLECWAjFnXxgOivlGoMJMpdvDXL/i7fvNXZSNMI+QS6f9EzICcO6IcZa5Rz0f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194768

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.92.9.bb => python3-hypothesis_6.97.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.92.9.bb => python3-hypothesis_6.97.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb b/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
index ae64391e33..c93727f36c 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.97.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "629f31788243559d35d3101ef8e94caf736cf8efaad3f0dd66ec7dbb31b8ef19"
+SRC_URI[sha256sum] = "00216ddadaee17ba73451e262f973970a97d34fd75ec34ef57510147264c34d1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


