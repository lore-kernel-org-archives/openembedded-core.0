Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8C3EC049D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14949.1772532609412824253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c8eJxFve;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532610; x=1804068610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QbdW7C6k8H2ZqSA6ghqRO0XVBmHe1PI0czx9YnUkxJg=;
  b=c8eJxFvecRxXr9S0KJmSYHRpH5G7KqYiAuUlcVI8C+DLBnFn8XCZSoV6
   KkecWhVQWRcQ7UqxxFQzvaR6cHkSbwlGTjzC8xjEqORbAtScd+I294H5O
   JYHq5+MlpmunOMNT00rIve+/MUteXBXJLCXkrcrZtMUHFL/90hL5mf/BS
   m2tQzSCEdJ67qMcR41gUmhMGE4L8WdL9hJsaa+ZRPu1tWSwc+VTyWHe2E
   iu10tse7QQBOTk+pmMEXdDCgH2PrUBCqY9/OIGfL1RKWTgMZeWgJ3KOqv
   /alLFgMW2ThRiro5BUNzs1RJdLwBgLpunXl9vQyl5fM1jPSbaBkXrVBMm
   A==;
X-CSE-ConnectionGUID: u96bI6ifTU6Ltds5aL8xHA==
X-CSE-MsgGUID: tPhUy4BJQGqwEelrrheJmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="232410399"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="232410399"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id D105582008F
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8BE4718000C2
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E76271001CDC;
	Tue,  3 Mar 2026 10:10:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/23] libxmlb: upgrade 0.3.24 -> 0.3.25
Date: Tue,  3 Mar 2026 18:09:20 +0800
Message-ID: <20260303100929.1624-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232291

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
 - Correctly decompress heavily compressed zstd streams

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
index 24eb62c98c..8687436052 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
+SRCREV = "b31dec072f4428123db3866c18bf32bc5db04d35"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.43.0


