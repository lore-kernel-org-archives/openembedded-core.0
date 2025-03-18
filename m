Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BACC36001
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5354.1742278929917078327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZDoXBGxC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278930; x=1773814930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e/cTlco5yCW+qQQs6egW8ok2YxM3eQQIjKnXyK+LItw=;
  b=ZDoXBGxCw+aP3F35bjggLijCMIPTLO546RAklhm7jIwTzDYLLA9IFo3t
   /YVeb5EDx0ADTUpdTOELfC8dRFignu8XHiGOpSYS3j2paj+VQu/I757ja
   tcAI8qwZ3nA6PpsArRnksBKfTLtVA3lp42GowLQ+yU6Descq7UkcNjCOW
   IqWX1hxUUDOqa11sBcIjhpJjy47GRameKNIIO0yAJjrsMYVB9JEe0ec2I
   F8xMS7kNiSpaaNACdn15GDEGole5/+0b3XiIIO4bBA76yxpuvInUbfpA5
   liigw+08bD0TWMwcMc26iV5gbnW50BAigW6Apdos8bu1EPPrkrn3ZhS+i
   A==;
X-CSE-ConnectionGUID: OMRVaKlFRaaDUwc5DpdUEg==
X-CSE-MsgGUID: tfU4xM8qQrmtjtNXNGGRag==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="193742808"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="193742808"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63E99D4C36
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C0A14B1DD
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD13A1A009A;
	Tue, 18 Mar 2025 14:22:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/12] libjitterentropy: upgrade 3.6.1 -> 3.6.2
Date: Tue, 18 Mar 2025 14:21:46 +0800
Message-Id: <1742278912-2989-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213170

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year uptated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libjitterentropy_3.6.1.bb => libjitterentropy_3.6.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.1.bb => libjitterentropy_3.6.2.bb} (89%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb
similarity index 89%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb
index 35be1e2e50..54a866c432 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.2.bb
@@ -5,12 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=18a5cada7ee95e61db4180f0cb4a69cf \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e01027c4ad1fe5a4768f8488c945d491 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "16c9e5c93e614f0df25f1cb30d0730102e6f4e41"
+SRCREV = "ddcf1124801b74bcf39285b070093ab674d8ea97"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.43.0


