Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D08C83034
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35170.1751274803700367122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AMilibWE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274803; x=1782810803;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fGZDULkuN523R0K5FKUFJi1JkTFeXmyTW6fUG4eyMN4=;
  b=AMilibWEpt4pnAW5Eqv5cChqqv+nYLvvjHIjBHZvwo5wNwXhFJ7uWlZ/
   xGQWNRdppYqnbGjuyZgDtQSvChx7JwjK2wD5DsY71/T0PzmDZDhGD9ne6
   0c3zT+hEvbBEMhmcqUDpbmK6zNDDk+4QAtv3S7obHzDIBj87mU8q9jusm
   oO9YTMArH1wUltO1rI+1o8eqLmq8ZBX7+/f0DvwfNuNaatISilOZVibyG
   4bYvNDWnSMrNtRwBgAEsWeH/vJPW/T4+RYAPg/uEHQ8dEqcwIm5oBdZ6h
   XIkASvPR3nLLAMAOeMoL73Iy7M4mTMA2eKEguZUbUFQ8TociXbWQLwntw
   w==;
X-CSE-ConnectionGUID: 98svFAYGSBS/SdPvpEi+hQ==
X-CSE-MsgGUID: N05og2y8QPKLjk/2tXnYQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="205055997"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="205055997"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:22 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 199411C0008E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:22 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id 8B24A180032A
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:21 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5210F8117
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:19 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F3E61A000B;
	Mon, 30 Jun 2025 17:13:19 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/37] bind: upgrade 9.20.9 -> 9.20.10
Date: Mon, 30 Jun 2025 17:12:39 +0800
Message-ID: <20250630091315.1897-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219461

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.20.9.bb => bind_9.20.10.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.9.bb => bind_9.20.10.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.9.bb b/meta/recipes-connectivity/bind/bind_9.20.10.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.9.bb
rename to meta/recipes-connectivity/bind/bind_9.20.10.bb
index 93ff957fc5..32f0bdf7b5 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.10.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3d26900ed9c9a859073ffea9b97e292c1248dad18279b17b05fcb23c3091f86d"
+SRC_URI[sha256sum] = "0fb3ba2c337bb488ca68f5df296c435cd255058fb63d0822e91db0235c905716"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


