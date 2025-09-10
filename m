Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D2CCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13165.1757495869648527891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rQM4K1p6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495869; x=1789031869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fPK0QlCBSIU/8vuEEOv7heND4vjfYo6assb9NfimkQ8=;
  b=rQM4K1p6lUMGcYDGbME6SaNESLp+PHkK+aAQaicF/0IhKu2vpdZ5XbAm
   JbRB9wp30Dz55i1z6Dj0iBfSaU1lALaYz9qUxJBxZbiAN9LhHuHe794is
   mVSKan7jt8Rmb39OnpnvE4fkmf6/QAkuHLkoIY8E4XMAPv+Ii54iUZSIL
   jNfbxT5tqCNy2k7HpIGNjl0FBpTuEBNiJUytn0P7+U9oRn95l0+t4IevD
   d3ri4P/rUXV4esbWgA6j5m62pJn6wypC+PmDXTzyGKtkBSkUm4F1ovZX2
   gOa7z27yR+4nmCb0mUuLWU0P3aJ3RKA4cr4UCsYe2bklPQEzHFNSVNwHG
   A==;
X-CSE-ConnectionGUID: 8Iuuna6qS2O+EGncVtZKEA==
X-CSE-MsgGUID: vmbznhkhTnamKjA173b27w==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="200394433"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="200394433"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:47 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 12D001000353
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:48 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C14811000100
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:47 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 3BA54100B799
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 312821A0078;
	Wed, 10 Sep 2025 17:17:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/40] python3-pytest: upgrade 8.4.1 -> 8.4.2
Date: Wed, 10 Sep 2025 17:16:38 +0800
Message-ID: <20250910091646.998-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223183

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.4.1.bb => python3-pytest_8.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.4.1.bb => python3-pytest_8.4.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.4.1.bb b/meta/recipes-devtools/python/python3-pytest_8.4.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.4.1.bb
rename to meta/recipes-devtools/python/python3-pytest_8.4.2.bb
index 1f98b6d87e..d85033cd1f 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.4.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.4.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "7c67fd69174877359ed9371ec3af8a3d2b04741818c51e5e99cc1742251fa93c"
+SRC_URI[sha256sum] = "86c0d0b93306b961d58d62a4db4879f27fe25513d4b969df351abdddb3c30e01"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


