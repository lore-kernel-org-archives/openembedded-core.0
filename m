Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A11C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7686.1787732323727519517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T9RSbe2E;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732324; x=1819268324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z4Nvw9lX+Xi1/3MNg+rAaQ9oYP6OfDnbZ9r1FJ5RCzE=;
  b=T9RSbe2Ex27O7V+ORl0sUQs+mxtm5q8a3T8L3SzJqxd1PvV6H/WB9ESO
   RxnaIh9QgClu0+MMW1o/A8MJ9moWuW8OKiksFg3NxRW90Rx9/IQvQNQx+
   S0jkR8yyV6bRPQrgO1gHXHrngHzBKU+6hXK2ljze6pGWyomn/XF/EeB+E
   NG2VX0O+97uSx5+KVaGwcoQAXUx78kQZWceLE9FRrLci5OOC8w8j9GfF2
   19yG4yyEtCszHMlwI8STDvva2vP5z4wr/6ieDNZ51sZf1XwQ/qDNNTWRH
   F7hmYn1KLoO7JgmB++bYhK6neiAlhykTcioh+3rZa+SuZAJ3s/hVMslTf
   w==;
X-CSE-ConnectionGUID: WpZqhgQIQAexZPK01MdGrg==
X-CSE-MsgGUID: mrfgKxsdSqKEH9RcUWnoIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252632908"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252632908"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:42 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0807AC020CF
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:42 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B3F3C182632C
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B9F3F8214FF;
	Wed, 26 Aug 2026 08:18:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/17] gstreamer1.0: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:18:25 +0800
Message-ID: <20260826081832.1059-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244350

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0_1.28.5.bb => gstreamer1.0_1.28.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.5.bb => gstreamer1.0_1.28.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.6.bb
index 2bdb1dc802..9376fbe67e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "a5a9f783809b17a8eb774f4a7695b2cb8cba6b15520129906f87eaf30e7f8469"
+SRC_URI[sha256sum] = "62b6b9f0ad3147a6dd6420ac64a91180b14e990695bddd353b96041611d052ca"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


