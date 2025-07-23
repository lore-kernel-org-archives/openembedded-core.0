Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B027BC83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:06:52 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.3838.1753232804076971043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UqlOEJPm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232804; x=1784768804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gn6VANl7PezLRsU91rRMThvux0/7u6fcWsfMu6izqx8=;
  b=UqlOEJPm+f/JEbJrxXa9r7NVgiFkc3DAgGhrKMoWdyoH7aGY7QT4mnv7
   UCynEQfijmXJRPJpT6uJOnjQwvnasGoHjVkk/5eAevevaRDE+Ht3QVMrG
   UhaRxLgqcxFwxYcthMvEiQJrDqFJs1qk/6SqqhC48JE+64tshhlnbBuOS
   /ttMkq4hi/EdHv11TohdbokGtTkv5B/L+jN4obNzlBNzB6LbRjoylRoA3
   AIFprxGSG25HPY9OOcy8RMcZdCqceeI2kA4uxmYJwJVA0aiO4URVNFC28
   et0vNSx5BQwkKcXA8iLlh54a8wBuEV96KjPltxUi4ViXLcWTGgn+cC0Xh
   g==;
X-CSE-ConnectionGUID: hXSJMlicTCuK236IoHXsZg==
X-CSE-MsgGUID: lxcu1iAvS9KqKz5+adAeVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="207036515"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="207036515"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:06:42 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6C393C00233
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:42 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DA6698D65F3
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:41 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 188DD1A0074;
	Wed, 23 Jul 2025 09:06:39 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 04/12] at-spi2-core: upgrade 2.56.2 -> 2.56.3
Date: Wed, 23 Jul 2025 09:06:06 +0800
Message-ID: <20250723010614.926-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220763

Changelog:
==========
- DeviceEventController: update mouse coordinates before sending button events
- Return localized role name for ATSPI_ROLE_EDITBAR
- Revert "Return localized role name for ATSPI_ROLE_EDITBAR"
- Return localized role name for ATSPI_ROLE_EDITBAR
- atspi-device-legacy: Don't crash when XkbGetMap fails

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../atk/{at-spi2-core_2.56.2.bb => at-spi2-core_2.56.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.2.bb => at-spi2-core_2.56.3.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.2.bb b/meta/recipes-support/atk/at-spi2-core_2.56.3.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.2.bb
rename to meta/recipes-support/atk/at-spi2-core_2.56.3.bb
index 59eed4b5ab..dd4929c349 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.2.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.56.3.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e1b1c9836a8947852f7440c32e23179234c76bd98cd9cc4001f376405f8b783b"
+SRC_URI[sha256sum] = "0e41e1fc6a1961b38b4f9c0bea64bad30efff75949b7cdb988d2f2fdab72267a"
 
 DEPENDS = " \
 	dbus \
-- 
2.43.0


