Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00648E94137
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61236.1767086245384769660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K7cakZST;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086245; x=1798622245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bFsyR6LmEuZGDaAUJf+TM+QyzlHDJ/ahrALBoDUdYWA=;
  b=K7cakZSTCP9QYbzzlYm/QcH6754UBm1tRfJJqXZ2dNexH7GxyF42kdpF
   i07peIfEz6bM/vFtXsoNCk7mfX9Oo8Yn5ePzR0joFGVaVekYgJYvFvpkF
   W4D88p651rK815WJI0mQEBLYWVmEKAGNQWCSjTgF66nquS8UuIw2jxnu3
   u8sPGoBtBRhXOK3yevQYxnUHlrmOVJQMPras4X/redHpZeQsgKikQ2fw9
   VKbOjM7Vvkp7LfYYj8gdi7DS6Xqe+N6I+xkotaBbKMZqAfyeW2Dj6CVWi
   e53MowqfeB1sDUDpMD8DwVxjax/duZcfUHjXhJ19iehJmDhrG1rOmPq5s
   w==;
X-CSE-ConnectionGUID: zWw6dKvLQaiD0K3PZ4+Wjw==
X-CSE-MsgGUID: YUptjjsgQJy9q0U8nCm+Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="203147426"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="203147426"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:23 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 789AF1C00081
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:23 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 21D3E1C002E0
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id AF9EC180058B;
	Tue, 30 Dec 2025 09:17:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/12] boost: upgrade 1.89.0 -> 1.90.0
Date: Tue, 30 Dec 2025 17:17:03 +0800
Message-ID: <20251230091714.1501-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228644

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost/{boost-1.89.0.inc => boost-1.90.0.inc}                | 2 +-
 meta/recipes-support/boost/{boost_1.89.0.bb => boost_1.90.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-1.89.0.inc => boost-1.90.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.89.0.bb => boost_1.90.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.89.0.inc b/meta/recipes-support/boost/boost-1.90.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.89.0.inc
rename to meta/recipes-support/boost/boost-1.90.0.inc
index ea2827ec14..9b0ce592d9 100644
--- a/meta/recipes-support/boost/boost-1.89.0.inc
+++ b/meta/recipes-support/boost/boost-1.90.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "85a33fa22621b4f314f8e85e1a5e2a9363d22e4f4992925d4bb3bc631b5a0c7a"
+SRC_URI[sha256sum] = "49551aff3b22cbc5c5a9ed3dbc92f0e23ea50a0f7325b0d198b705e8ee3fc305"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost_1.89.0.bb b/meta/recipes-support/boost/boost_1.90.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.89.0.bb
rename to meta/recipes-support/boost/boost_1.90.0.bb
-- 
2.43.0


