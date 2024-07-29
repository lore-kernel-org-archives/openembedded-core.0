Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E691C52CDC
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46590.1722215425506508167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IyA0SoHe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215430; x=1753751430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nskJQi9yYeOZQzesjwyK85ttbeSYwZVLy+4QrZKxAG0=;
  b=IyA0SoHeDH2wY/22lWG+yxKwCog/7R80rdno+OaMLh5sE0F+tUh7J8xA
   N4DCWlwQHgo+Bq+3NVU4QwmS+MLxoVgmX3rj+8icgqs9t1tCiI2Zsj8Pb
   wCOlIG6Vik0gDlpvA2oua0ai53EI2myZRqbWmqP+yLtjR+uJ+MBRokfer
   krS11x72RkZ7X4i6idnulna+lT+EHCUn0PokRsfnJzU5kTUFpae+3jdth
   jHxVbi5E1g0vJkr1RyhHcOi+XdKUzWqQpIcmm074H/5qg7qg/oQA6kUzh
   AN2HZCGQnW75CX0RAlfhglhnbvotQxxSaehtKGetH57i6KSHiE357OdTw
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="170816546"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="170816546"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A364D9224
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60C62BF3D8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F05E4401E8
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3C421A0002;
	Mon, 29 Jul 2024 09:10:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/33] python3-pytest: upgrade 8.2.2 -> 8.3.1
Date: Mon, 29 Jul 2024 09:09:53 +0800
Message-Id: <1722215408-27541-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-2.095700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCyfmd9HsjZ0U4wnGKAoIKJL1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz7sYqv8tMaoAcsh
	o0hBqOdYquiRXTROane11dsEczxRX5A9inmobeim9pfPD6V6szVx3wNirdHDR+V4ksxUrapGpGX
	Zr5/46EiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202587

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.pytest.org/en/stable/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.2.2.bb => python3-pytest_8.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.2.2.bb => python3-pytest_8.3.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.2.2.bb b/meta/recipes-devtools/python/python3-pytest_8.3.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.2.2.bb
rename to meta/recipes-devtools/python/python3-pytest_8.3.1.bb
index f0d16f473f..145c01a5db 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.3.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "de4bb8104e201939ccdc688b27a89a7be2079b22e2bd2b07f806b6ba71117977"
+SRC_URI[sha256sum] = "7e8e5c5abd6e93cb1cc151f23e57adc31fcf8cfd2a3ff2da63e23f732de35db6"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


