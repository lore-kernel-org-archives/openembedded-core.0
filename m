Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF2DC25B79
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.11789.1713948185480832297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gH2NLe7V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948187; x=1745484187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AWAzipJBBt7B1c4vSuDmtmBnVrGWisqSPXWIchajq70=;
  b=gH2NLe7VS7kp7rA5zYEnG0sAoGAAuI++n8KxaiFW0B2+PN8kct0cRMBM
   UpmvmBm3PoIkyDNHbeho5Xp3TREoFvptxI6mNn97E4Qqm0hZf2kHYGLUs
   c+iH9CcFC8d0VqwCcytE1VLZYOv1OiNZf4SSJLyZAddVBmRWR3bIZ1X1F
   nbcjQrjRWdvcN+kOHXQTbBC+gGdIAgyTvjNuay8OYA+SmyBibBFCVXQid
   sMjjZeElE47udle/Mc9SQFvj+sjhVLzAR0OfOnvfWx9NzCh1v8r4l5Jgf
   0268cWHj6jAq7m79REYMA1HJC0Gf7p5A3kdf2jCXu502nKQECrN9uQSPE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156433050"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156433050"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A190C53D0
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B7DFD53F2
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0D332B1CC7
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3BA9B1A000B;
	Wed, 24 Apr 2024 16:43:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/38] python3-dtschema: upgrade 2024.2 -> 2024.4
Date: Wed, 24 Apr 2024 16:42:16 +0800
Message-Id: <1713948152-13501-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--8.648900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy+f7ap9DJaDYHD
	3YtqYl61kDxuPhjo/LRJtskS4r/ddY8iv1am7Rhc+GYt8f/VhTt7tnRTJA7lM2zUivg1nMWaC7Q
	OCeQlM0Vvu+EAUOCx06553zSg9UdKPAsVz96OPtQD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpitqAfZ9rgr9rlRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7iBSK
	6YFfXwWTESxS2c8ay/fmMQp7fP1bjnV8udm+GX0WClYJu9r4yY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198666

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-fixups: Convert anyOf/oneOf + const to enum
-dt-validate: Add an 'only matching compatible' schema validation mode
-schemas: pci: allow additional device properties in pci-pci-bridge
-validator: Rework selecting schemas for validation
-validator: Add a version to the processed schemas
-schemas: chosen: Remove 'linux,tpm-kexec-buffer'
-README: fix broken link to json-schema.org
-schemas: Add schema for post-init-providers
-fixups: Fix dropping of array 'items' schema
-schemas: chosen: Change address+size properties' type to 'address'
-Add a dedicated type for address properties
-dtb: Filter out types with the wrong length multiple
-schemas: dma: Ensure 'dma-names' entries are unique (mostly)
-schemas: Ensure -names properties' entries are unique
-dtb: Skip decoding strings if not nul terminated

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dtschema_2024.2.bb => python3-dtschema_2024.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.2.bb => python3-dtschema_2024.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.2.bb b/meta/recipes-devtools/python/python3-dtschema_2024.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.2.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.4.bb
index 0e911dfb3d..9583cd57b9 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.2.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.4.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "df4e5afb35bda93894209d2465e87fb7103f1a95a05909ebcb594fc4cf4fdd1e"
+SRC_URI[sha256sum] = "18dd1d34b4a5e451291e5444e9ceb4a6febc605871cdaef22673b6f80aa4a131"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.34.1


