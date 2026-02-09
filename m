Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE74E78D5E
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43630.1770627853187140817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=npl7RjN+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627853; x=1802163853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rD5BQzm3eOr2ssQepsZMawBl5SoFDzhyAyVixhowtU=;
  b=npl7RjN+34HUkel3tJldokeJiODxih7S/ODgYBRNtztHXvWI/h/L6F7Q
   toBl70IPSGAhOoIhlDDkffzt3DYCWxMT9Vi32F9Hz55Im1k9jcOPuiMVk
   tDQy/zBAZafxkZhHbyHAYJEXad8cWtnxiLqRn2wGIFzIQoZhU9ugeZvvz
   VvnETRNI8/UHd4+zRGkG44jCrXDiTVQmO0twqgsv1ZLo+kbFyioVgICeq
   zzcvN3e5W7/3Cj3yu7/17hyyc0wJhgW9WSK2lhxs9UZQJpoCZ4xs+/UEU
   0S1g3KwBC0t4n5tGBM00lIc9F2IUNB3Wl1Bz7yIZBDomqPx/ZEzpy2FP0
   Q==;
X-CSE-ConnectionGUID: SDPQ2AIAQkeR/hTHgznPww==
X-CSE-MsgGUID: c7I9QzaxQzCwaFrINi9Z4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229032596"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229032596"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:11 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 5ADD84DF1
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:11 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id F20A214003BC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5C79B101A412;
	Mon,  9 Feb 2026 09:04:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/39] python3-pip: upgrade 25.3 -> 26.0
Date: Mon,  9 Feb 2026 17:03:04 +0800
Message-ID: <20260209090317.1468-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230737

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updted to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_25.3.bb => python3-pip_26.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_25.3.bb => python3-pip_26.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pip_25.3.bb b/meta/recipes-devtools/python/python3-pip_26.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pip_25.3.bb
rename to meta/recipes-devtools/python/python3-pip_26.0.bb
index bbc70e3eae..0a284a1f6b 100644
--- a/meta/recipes-devtools/python/python3-pip_25.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/certifi/LICENSE;md5=11618cb6a975948679286b1211bd573c \
                     file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
                     file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
-                    file://src/pip/_vendor/idna/LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1 \
+                    file://src/pip/_vendor/idna/LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
                     file://src/pip/_vendor/pkg_resources/LICENSE;md5=141643e11c48898150daa83802dbc65f \
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343"
+SRC_URI[sha256sum] = "3ce220a0a17915972fbf1ab451baae1521c4539e778b28127efa79b974aff0fa"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.43.0


