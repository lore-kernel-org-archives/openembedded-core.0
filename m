Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5182FC35FF9
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5383.1742278930210236646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fvSGdIb1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278930; x=1773814930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7JV+b/O8068T5s5ymK6Z0k55GV1B5VgxB+mNAFx8cyw=;
  b=fvSGdIb1nTNDSQBWrqXhc1ubqp5PK5PRXX4NeOTWG1vPDB2Q/10q1NGw
   Q3KIbg/ooURPxh9e0LpkvO0UoZgrKiN0HxR8B++9oQQZoxHGDXSoE01ka
   2Lq0Z1pBCIfrDJrGTLH6k49LyuMhaMtcbqAiRqOgyOzY1eyw+lX+sTgGU
   BikZcd2aD4hU3X0LRBXbk1Y2xAUVVSI04FyEJ/GDpGuHHrQoJ9Nh1FfRL
   Nc+gQgUfIUKuIOUQUCWVeVgrAiFaExftA2O1fZV0jIBE6PZDLL8Fo2+Lc
   1ScpbRPq6NX1ZmN6MDgg5FA+Bno/wrvSP6iDhhu/zRwJQR10e7K4TrWxv
   A==;
X-CSE-ConnectionGUID: LKlNAzjrS1STwM5WJG52Dg==
X-CSE-MsgGUID: YlFteeAvRFO4Oa/pXa52kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="181431200"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="181431200"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:08 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 45EBDD480D
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C9DCBDCA4
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C52831A009A;
	Tue, 18 Mar 2025 14:22:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/12] python3-pygobject: upgrade 3.50.0 -> 3.52.2
Date: Tue, 18 Mar 2025 14:21:51 +0800
Message-Id: <1742278912-2989-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213177

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pygobject_3.50.0.bb => python3-pygobject_3.52.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.50.0.bb => python3-pygobject_3.52.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pygobject_3.50.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
index 533c2e02aa..08f7dc67b0 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.2.bb
@@ -18,8 +18,8 @@ DEPENDS += "python3 glib-2.0"
 
 SRCNAME = "pygobject"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "869f42ee70dcf6de50bce267072e2c35cee7fcd2e32ea1af3a3a99a88901850a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.43.0


