Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274F3CA0EF8
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.5629.1755574541006345691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gs8B50C+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574545; x=1787110545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jfzBxXQaPMvxQpukhmr8QcyI3rQGiqQ/uz8sACbCD+4=;
  b=Gs8B50C+qpwxtYB3KZqYlBlf+X3zVMXP0FdfrhRlmzDUyIDRc0ptA6SB
   ybvudJjPm3FC5TA3scejskMx2K+jJon/FdfCJPRDyyyJyEIpQ7u4cH0PA
   Qrm9ziYwN+sHtk2xxzL5YV9pGuLI9Gu/66iUrq8iZnmnNoFs2M2l9GD5V
   u+erUq5QzRV5E+aeeWewAPHcq9mCA9nosKBJTrlMJamN1gBJZYogq9yFY
   JGz7/M12D2C8pwV32H4Hmzf7f5PPxPsmEzMUMxs8yf50HuAQj688T+p+T
   2nfR122jJm2y/iFD+Z7kSs2tf0mzrf5HzXrEzNcGr+g78W+fkwknqRgJW
   w==;
X-CSE-ConnectionGUID: 1KMWCXteSh+7tBOFj85ASw==
X-CSE-MsgGUID: z/SI67oIRUyVCa1s0Q9dgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="197097630"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="197097630"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C97F41C00087
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 842A01C01DDD
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 670A540552D
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:42 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB4911A008B;
	Tue, 19 Aug 2025 11:35:38 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 10/11] gstreamer1.0-plugins-ugly: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:31 +0800
Message-ID: <20250819033433.390-10-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222068

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ugins-ugly_1.26.3.bb => gstreamer1.0-plugins-ugly_1.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.3.bb => gstreamer1.0-plugins-ugly_1.26.5.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
index cc3da89556..5583c2f128 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "417f5ee895f734ac0341b3719c175fff16b4c8eae8806e29e170b3bcb3d9dba5"
+SRC_URI[sha256sum] = "3dfc43435be97e110816bac6d602b0f206a038546279683d9d25372ff127db52"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


