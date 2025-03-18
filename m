Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEA5C35FFF
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5383.1742278930210236646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RWjJJ3Lm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278930; x=1773814930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zWvSfA5JuOiS26awgk+KqbIKQKdpZ+6ENZNbjSlL5MU=;
  b=RWjJJ3Lm9o+WXD8Soje2L0U+vsyhnja0nWetQH8fpzxSYQFFRDYrqJiu
   zgZWf3OBqmhortv/pfpGigfX7vO1uwoUsWbjE4AZXrrd4dFbSracf1PTE
   YgYciBlNtc/dg41AhoMQFFSOW+4GdPVgmqreTLyIFt+vK3Z83gR1ZiyFB
   9oSNxJKQhETeej8BqRKahVAbxUWXLg0II7wTycD38rO7WMSSuR8Wkexr2
   Zp2QhrB32lxg0fSU3jb4sKPynIhplGHhHGHHB8r2WmJUUnV1gZc4y3lbZ
   zilDp4ANor+POvzRUV22rrwbFOZbv9X4w/bkvEh75EbF3MQHCIf1jRF/O
   g==;
X-CSE-ConnectionGUID: 6XlvUKqgTNqfZGunuz3FSQ==
X-CSE-MsgGUID: RSywcP8lR8aX1cTemxij9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="181431198"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="181431198"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:07 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F7B9C2266
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 37048BDCA4
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F03831A009B;
	Tue, 18 Mar 2025 14:22:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/12] netbase: upgrade 6.4 -> 6.5
Date: Tue, 18 Mar 2025 14:21:47 +0800
Message-Id: <1742278912-2989-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213173

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/netbase/{netbase_6.4.bb => netbase_6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/netbase/{netbase_6.4.bb => netbase_6.5.bb} (89%)

diff --git a/meta/recipes-core/netbase/netbase_6.4.bb b/meta/recipes-core/netbase/netbase_6.5.bb
similarity index 89%
rename from meta/recipes-core/netbase/netbase_6.4.bb
rename to meta/recipes-core/netbase/netbase_6.5.bb
index 5a448a4b91..d273dbfe66 100644
--- a/meta/recipes-core/netbase/netbase_6.4.bb
+++ b/meta/recipes-core/netbase/netbase_6.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
 inherit allarch
 
-SRC_URI[sha256sum] = "fa6621826ff1150e581bd90bc3c8a4ecafe5df90404f207db6dcdf2c75f26ad7"
+SRC_URI[sha256sum] = "9116047aebbaa1698934052d01c6e09b4c3aed643e93df63d2ddcbec243c26d1"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 
-- 
2.43.0


