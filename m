Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF33C28B25
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.18201.1741079370122954640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=onvODE+J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079371; x=1772615371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kpgG4p77HeVJsm/AfVfgpzX+/MXJ1r4BzzTWF53ALRc=;
  b=onvODE+JElA2KTJSlwod7XJigdYenaxKUXxVF1pz00iQZaCpuKdasboe
   OJ80SE39a7HY1LMVi+Y3ItWhLRu3h52CctqJnjj0VMOLi3YieJ+rh41wj
   uxrgTqHrf7p5Vbmiqdvg28Rd2lT0s59Lq/3nH4eXPXdObNHF6ko2WR2/X
   roZj9DnfK2H0FGP/KuGk+1GtDqwAGKECumb9DSRi2TJLBRGBw/sAFpFI8
   7+NseIMxksC34nTAHQAHjel6aUhI8017nHmWH+sA2NmXQ9O04eMTmlg/F
   bJkKQQu/hNvRfRhJ0r8xiKdGbvSkhD4Y0BCiFdX2rfoI7g1pzXySiHQNx
   A==;
X-CSE-ConnectionGUID: gKiBLV/XR6e861bguzoHSg==
X-CSE-MsgGUID: vWv8emaAQC6g8Db2cSSzRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191869477"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191869477"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C09BE6142
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E447D8B84
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C79FE1A009A;
	Tue,  4 Mar 2025 17:09:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/31] inetutils: upgrade 2.5 -> 2.6
Date: Tue,  4 Mar 2025 17:08:51 +0800
Message-Id: <1741079356-13445-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212233

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../inetutils/{inetutils_2.5.bb => inetutils_2.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/inetutils/{inetutils_2.5.bb => inetutils_2.6.bb} (99%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
similarity index 99%
rename from meta/recipes-connectivity/inetutils/inetutils_2.5.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.6.bb
index 19bf7e1539..ef453d3bb2 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.6.bb
@@ -11,7 +11,7 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "87697d60a31e10b5cb86a9f0651e1ec7bee98320d048c0739431aac3d5764fb6"
+SRC_URI[sha256sum] = "68bedbfeaf73f7d86be2a7d99bcfbd4093d829f52770893919ae174c0b2357ca"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://rexec.xinetd.inetutils \
            file://rlogin.xinetd.inetutils \
-- 
2.43.0


