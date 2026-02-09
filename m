Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5350E78D5D
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43619.1770627840278502647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VBNM/CgL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627840; x=1802163840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lm4X0BQ+aRhJS19sqDqbm1kesUlFKd+A2zwLcf7G2xM=;
  b=VBNM/CgLJMR5yz6UpZDuuj2uV1cFPLrMl3FJ/db+n6r3RU1HiD4yYe8A
   5EFnUqQgJTqZDZo1rEEEc+xG7hCaT+URz15I6REkBEWak9r9rYW3c4dqb
   xyL4rR/Iom0WjUDBIfwyndrUtQgdO4QfSdrVbZwALBlXJW86rVNW9lLv5
   U4cuCB1lFpNj9PWW3cn5txLhzbNomo4oIyuQTqdxvRsHT/1FbTVnxavrY
   IjQZOF8ykrNFeA8DwOD+azOl9hux7KBGnftHLn5GzDj+uNXY64q0TmHqh
   uN0xzKYAN7G7o4yqIqsZTKXMKzlRjcc4LFgQ167est9htyipr7CS/py1q
   w==;
X-CSE-ConnectionGUID: y5AosmsXRReV9zEZGi0SVg==
X-CSE-MsgGUID: z3tICLndSjitGh6Ly4DzhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216965285"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216965285"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:58 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id AA05E1C000FC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:58 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4FC998D29D5
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B7340101A412;
	Mon,  9 Feb 2026 09:03:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/39] python3-babel: upgrade 2.17.0 -> 2.18.0
Date: Mon,  9 Feb 2026 17:02:57 +0800
Message-ID: <20260209090317.1468-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230730

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-babel_2.17.0.bb => python3-babel_2.18.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.17.0.bb => python3-babel_2.18.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.17.0.bb b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-babel_2.17.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.18.0.bb
index adffaa044c..b0abb2c62e 100644
--- a/meta/recipes-devtools/python/python3-babel_2.17.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e83509a66c69efcb4f3a7d4f27fd0693"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a2b86daab39fdb8ce59d97e9fecc90ee"
 
-SRC_URI[sha256sum] = "0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf0afb9d"
+SRC_URI[sha256sum] = "b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c5750937c992d"
 
 inherit pypi setuptools3
 
-- 
2.43.0


