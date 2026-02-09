Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B91E78D68
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:36 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43642.1770627865962572903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lTaz29L3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627866; x=1802163866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ehjV148GxKqJcdTY7lyGeEdS90a1hpJadL4H7YhIeu0=;
  b=lTaz29L3xZCRYGL4V4kdMUkEHvqEgRsz+MyjvefDl8Ov5j/VqeA1gdN4
   28gRssTnezsvOuBWiwVv29rWx9kNd16KcHkYLiV29d6gTzwATgrrD5A6b
   4JZSFNAsREJ7q9S0VH9iDhNfyh92qOgmIb6Scf5g8YO7zO+DruY4+A5Al
   gbYRt1+jXyTE3b17+NrXjP9+0gp536yWE4IWqrWdKzAUjx2fQS5iWuOyD
   wK8riX4P1DJEenftf91NcNgx151cHBP+ljXrJWjkPUfJQeljISIZl2fvP
   jY1HCuQ3jLgUYJLEwI5BqJowtu8hizJaNXQIYPHA8xr+Xce4yMEyzPcKn
   w==;
X-CSE-ConnectionGUID: 2pZh9gV+RuW66PocP4VJIg==
X-CSE-MsgGUID: K6jXw5slTYKGwM90tAS0XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="207844096"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="207844096"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:14 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id D05231C000FC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:14 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 881841000879
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E9F5B101A429;
	Mon,  9 Feb 2026 09:04:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/39] python3-psutil: upgrade 7.2.1 -> 7.2.2
Date: Mon,  9 Feb 2026 17:03:06 +0800
Message-ID: <20260209090317.1468-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230743

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_7.2.1.bb => python3-psutil_7.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_7.2.1.bb => python3-psutil_7.2.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_7.2.1.bb b/meta/recipes-devtools/python/python3-psutil_7.2.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_7.2.1.bb
rename to meta/recipes-devtools/python/python3-psutil_7.2.2.bb
index 0a9b073855..98270defab 100644
--- a/meta/recipes-devtools/python/python3-psutil_7.2.1.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.2.2.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "f7583aec590485b43ca601dd9cea0dcd65bd7bb21d30ef4ddbf4ea6b5ed1bdd3"
+SRC_URI[sha256sum] = "0746f5f8d406af344fd547f1c8daa5f5c33dbc293bb8d6a16d80b4bb88f59372"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


