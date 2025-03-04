Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF316C35FEE
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.18205.1741079372541791062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TtOhltTn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079372; x=1772615372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IHWZ53s6Yj9LuW4qMhDwFLTT/kb7FjCrc+bbM8y1h6g=;
  b=TtOhltTn4sVupx8Tn5pLveOvpbLu4s9wQ3B05xeN94M5XKfMJo1MYdlj
   sugxWihZfwOype1kHNBzq7mnNjvs9kAFSAv056de/0hrc+pzxitIxAPuO
   X5ECkNHeysEIuCOZRceCpmW2IkUsXqzOZWBeNS4kPVBoirpeFQihpR8C8
   rL13kCP2wDXe3fSA0ASaXYs/kboD0Opd9Kkk91k1zneid+ptqFUxWY7BF
   j2M0HCXjcRanPybTb8l2JngTPPqBS5zUsOe30sQg4YvPxqWDUXSA3xWZF
   MdzCtI80hJCl/xSEgKDNjuqykXRux2oqt0xsBVua+2PlPS+If3FsFEYvq
   A==;
X-CSE-ConnectionGUID: kLOfIkrRQEOO1A3JTNNF+A==
X-CSE-MsgGUID: 9m4hjZI6Rs2MVCOypFLONw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="179875851"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="179875851"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C3F0BE9E9D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 88891D8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 481B81A0071;
	Tue,  4 Mar 2025 17:09:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/31] man-pages: upgrade 6.11 -> 6.12
Date: Tue,  4 Mar 2025 17:08:57 +0800
Message-Id: <1741079356-13445-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212248

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../man-pages/{man-pages_6.11.bb => man-pages_6.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.11.bb => man-pages_6.12.bb} (96%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.11.bb b/meta/recipes-extended/man-pages/man-pages_6.12.bb
similarity index 96%
rename from meta/recipes-extended/man-pages/man-pages_6.11.bb
rename to meta/recipes-extended/man-pages/man-pages_6.12.bb
index 52a1fbda14..7c79e71704 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.11.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.12.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "44c09f43ae7a0b327efef5285a30d56ecc5fd4a07056f77e806f6c65196ba7f3"
+SRC_URI[sha256sum] = "23c6817f89b481c8ae2232a523ce66c06e5cc5b41873bb6675318777155d6a89"
 
 inherit manpages lib_package
 
-- 
2.43.0


