Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749CACD98CE
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16347.1781084993782230018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iMlznC3D;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084994; x=1812620994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ThOiKWDcduo9DXHLYMsOykgL/NYbJ/wwLWd18lQvABA=;
  b=iMlznC3D4jEdfiWJXltcI9ofD2Ji8RW1SJk3gn2Bvocs8u4Gpv+DtlA/
   EmFbldeIK+Lto7IcqHYIfrOzqgu2jZPKnzESGRedFiAzx6cNc90GoU5YH
   viFZihD4tWQvkxXukMRL3l+yQv+hcKm6QyaP2f5K9x1aD1RBbBco2uQKx
   iQ7A6VXMIZFK3RL+PJnT6qbLruTSL0t1+uIa1nPii5MI2Fwu3d6nkxr39
   /G0xR+YmNQeXsl7iAinS5GUDzfFwVJ3hO+HmQl4xGQoEHqXVDOnOJcE1m
   9salH40UIpDPsikKbLL+KtenCqC0BHMyF+vp+Qhmjy1PkumbIe97/mPgI
   Q==;
X-CSE-ConnectionGUID: NG3bKlNrQsq742Tns9vDkg==
X-CSE-MsgGUID: H8W852WbTsql2Jkl7s+F5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="243080988"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="243080988"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:52 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1E42F8203C3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:52 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CA8E7C0608A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id ECB16140027A;
	Wed, 10 Jun 2026 09:49:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/16] dropbear: upgrade 2025.89 -> 2026.91
Date: Wed, 10 Jun 2026 17:49:21 +0800
Message-ID: <20260610094932.2264-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238331

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dropbear/{dropbear_2025.89.bb => dropbear_2026.91.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dropbear/{dropbear_2025.89.bb => dropbear_2026.91.bb} (98%)

diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipes-core/dropbear/dropbear_2026.91.bb
similarity index 98%
rename from meta/recipes-core/dropbear/dropbear_2025.89.bb
rename to meta/recipes-core/dropbear/dropbear_2026.91.bb
index ece065265f..826a691b04 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
+++ b/meta/recipes-core/dropbear/dropbear_2026.91.bb
@@ -23,7 +23,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-SRC_URI[sha256sum] = "0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634"
+SRC_URI[sha256sum] = "defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34"
 MIRRORS += "http://matt.ucc.asn.au/dropbear/releases/ https://dropbear.nl/mirror/releases/"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
-- 
2.43.0


