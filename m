Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A7DEC049C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14954.1772532613401149845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GhMw/Qqz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532613; x=1804068613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PLdEDUxQwdaVFKnqQZ5ZMu+txYsX4yXyjTyBoX4axA4=;
  b=GhMw/QqzGAzWeGcs+mUSSOrdZvOPwFaePkIEFa6EImueZ64rlgeq6EQh
   qRnK+VlavHk3chsPYh28XYwNKEjtcXepO2QuJyi87J2gdKnrIp7XfKyKG
   GJ0lspKRavKGGrRFYQXuvnJsb7c4+MyQtPEG/GqT5JjlweUmGBFAxhcom
   IRYv8wMoj6hkWDjMF5isgvvm2tnGrQjXM1k1WL0lRUdyGXhY4/wGBhs9m
   Z/ReWmeX4y5/pkCBzlajB23RSkUikzu+FmmK0UU3F3j09sHgifkaxkt3I
   pdBuCvAw2pRRsanOv+bz3ZvE7XVQptJDlIwqld3ab+zo7TnYISvaUjbxA
   Q==;
X-CSE-ConnectionGUID: hS+aElvlReWL2goufNyEzw==
X-CSE-MsgGUID: YGNVFzGZRQOF/Z8WIzJHRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="220364432"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="220364432"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EBED31467
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:11 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A1DF41C002AF
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id EA4CD1001CE4;
	Tue,  3 Mar 2026 10:10:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/23] p11-kit: upgrade 0.26.1 -> 0.26.2
Date: Tue,  3 Mar 2026 18:09:21 +0800
Message-ID: <20260303100929.1624-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232292

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 rpc: fix NULL dereference via C_DeriveKey with specific NULL parameters (CVE-2026-2100)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../p11-kit/{p11-kit_0.26.1.bb => p11-kit_0.26.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.1.bb => p11-kit_0.26.2.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
index 44ad776d59..fa41b45feb 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "49ccc27a1e433d6128d40a43c7ecc4624b0dbfde"
+SRCREV = "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.43.0


