Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714CAC71137
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.11716.1749026735210979061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JG/icWda;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026738; x=1780562738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2fejSV9m9aeflTy7lysQq4vUrWzRIwNqL5wg0EWtedM=;
  b=JG/icWda3wtw+QjqXlX15N7iuw8EoEw784JAI6mtUWTwmK5F7SiOXyCp
   NLe0dHC3QLWYMk/C+bUz77lwa+M1q+l7eNLADaqPDJFgoFaKw7APcA2R/
   ooaiwEMBBpeEFLUadZuaP+wSFOkULMDZPew4MQ87jkr95RSsOm+8jqu7d
   4g+mcsl3TJNna2oP5hBbQWRXr5h5ihzBlpvzl4Ea29pKstsmKE1VaYTe3
   XXLDwA3EliMM2ZMCaN7Ax9wmQlo0irTPsiz3/1oR1N0+lvm9/Eb7MHaad
   QBKMiMJW8Wbt8GMdpLQgsTv4en997OBGOPDyklhOm/He5oUacv0LNIy+Y
   g==;
X-CSE-ConnectionGUID: 1dqKX9o7QKiazq0TjCK6Pg==
X-CSE-MsgGUID: fzlfcyB1TaezufSyx/Yxhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="189666626"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="189666626"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A04AC13CA
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E0905D753E
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:34 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8BE891A009A;
	Wed,  4 Jun 2025 16:45:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/45] iproute2: upgrade 6.14.0 -> 6.15.0
Date: Wed,  4 Jun 2025 16:44:57 +0800
Message-ID: <20250604084524.864-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217866

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_6.14.0.bb => iproute2_6.15.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.14.0.bb => iproute2_6.15.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
index a32ac34245..592e3e15af 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.14.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.15.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch \
            "
 
-SRC_URI[sha256sum] = "a6d23588150096591c3d00fc27a324a82ee71d7a1a9eea78df5df17ad9b8461f"
+SRC_URI[sha256sum] = "8041854a882583ad5263466736c9c8c68c74b1a35754ab770d23343f947528fb"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.43.0


