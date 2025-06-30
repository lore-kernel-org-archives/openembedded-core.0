Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A8FC8303A
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35170.1751274803700367122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VZyhdGjn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274807; x=1782810807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDwlSJgVoynF/M1rJQPhc1Sq8O8psxrVy4WPzakHnLY=;
  b=VZyhdGjnfH824T0osUa1W+dquFGQJsh75ItxxoopoG2vkyyBpmdJgPMT
   jIGRBEWL1BlpH53YAyWwGz8mOR0lWCpgH/SNgeP6QJ7V1eU+XIUOyDds8
   9EsDCxRDjcA3Zk7hVYcpbUFh4M0oqXoI82dGLhsXFxDavzQAnjQi4qE9v
   hiRsZRyVFX50uF+VkNOdwnAELdXb+AtCPnUTji7A0H1+GYsbDOIKzpdtO
   UmtiqhGCQz9Uu+aGFZlly08on5bxXkFsiRns25rBIeSN2MRm2JuPDPEhK
   QXK/ByQ3A+Msa412302zINNMF/uEAjUef2cO6G3IAW8WQNj9UpskRoo5B
   A==;
X-CSE-ConnectionGUID: 6YIIGet5RrWVH0YlJC0Ivw==
X-CSE-MsgGUID: ygIB65EcS+eI+wV8F/2rEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="205056013"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="205056013"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3D114188F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id ABDEC18009C1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1632ABF3C1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:25 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B7DA1A000B;
	Mon, 30 Jun 2025 17:13:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/37] gstreamer1.0-plugins-ugly: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:49 +0800
Message-ID: <20250630091315.1897-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219470

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.26.2.bb => gstreamer1.0-plugins-ugly_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.2.bb => gstreamer1.0-plugins-ugly_1.26.3.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
index fcd97e4245..cc3da89556 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.3.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "ec2d7556c6b8c2694f9b918ab9c4c6c998fb908c6b6a6ad57441702dad14ce73"
+SRC_URI[sha256sum] = "417f5ee895f734ac0341b3719c175fff16b4c8eae8806e29e170b3bcb3d9dba5"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


