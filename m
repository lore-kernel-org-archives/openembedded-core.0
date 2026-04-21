Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C881FF8922B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20398.1776765402563688773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jbcQ9Z/+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765408; x=1808301408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9c0fo/gJUJ/jHhY1dnV384Qqywl8/tA4u/loiMw2vWk=;
  b=jbcQ9Z/+K4wz0LqzqTOvMMdKHhRRWnQoFdahVKXsdYREN4Cva60EvJcL
   TgWIqy8ih9Xozc9bJqWxdGqMJWBGkkLiKCT+mY5B1rD63i65+GcT0mTwN
   vbIdZGcn0PFHhCdLNmiynhA1q+iJTppiZq3sq/fiLfacxkbN7G/KO1lif
   kPLDQQUK3bDEy8cdsmGSyxJ9d7Bn7FaEnzl7jFj6/UJaS73+v0mIBhOKQ
   Dk2TDy/oGY/HXwRz5WFqEoW1Q0l3KxGuBQaPtwUSh1XD5EpiT75DdvBlN
   OVMWPJXj2sa4tGT/WWKIVyEmdK5RpZtBdRPLYY8Ozva4jDiJD5kxyCsJC
   w==;
X-CSE-ConnectionGUID: bRZrg2PjTjqAiUm8VUUIGw==
X-CSE-MsgGUID: gc1/6v41TNKQRRpk9r4TjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225608222"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225608222"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:47 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6A1591C1C720
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:47 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 204AF140036C
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B4641140025F;
	Tue, 21 Apr 2026 09:56:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/49] pciutils: upgrade 3.14.0 -> 3.15.0
Date: Tue, 21 Apr 2026 17:55:32 +0800
Message-ID: <20260421095559.1856-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235630

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* New capabilities are decoded: MMIO Register Block Locator,
  Flit Error Injection, Flit Logging.
* Decoding of PCIe capabilities updated to Gen7.
* Both lspci and setpci warn when the "-s" or "-d" option
  is given multiple times.
* Improved display of interrupts in "lspci -vv". Routing of
  interrupt pins is shown only if the pins are not disabled.
  Routing of MSI(X) interrupts is shown when available
  (which is currently supported by the sysfs back-end only).
* Minor improvements to Windows back-ends.
* The dump back-end can read the dump from stdin when given "-"
  as a file name.
* FreeBSD supports 64-bit addresses.
* Added README.DJGPP.
* Updated pci.ids.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pciutils/{pciutils_3.14.0.bb => pciutils_3.15.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.14.0.bb => pciutils_3.15.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
index a267ea34b7..ee3dde9ae4 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.14.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.15.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "make-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f"
+SRC_URI[sha256sum] = "c02940f430841ecf158d5d9a50007afc4d5353c8678a2455003ca0b2c4e9f5ff"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.43.0


