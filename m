Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7A1C9EC68
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:35:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30201.1768214150533649468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M5+cGWRb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768214150; x=1799750150;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fba76zXEYA1dNpA4NvDWorQTZyU69fG/VEAhfmzwaNY=;
  b=M5+cGWRb6g8CefbxmIDxAsFISh+0XQFCyKuThIJXp+FXXo7qN4ZNujig
   dFXldXclVGE1SiTsl9TWwXeiKk39h8AqbUc3rjJRSSyKZB5z6jnvZaHpV
   O5aBsv/0NGiZr/vpTIeFo4t3MFxNHnXlhMneeY2dbnaWFCg5D00cfbIfz
   FhQixwGxq4UTz05xnHocvetcKfq7sMbFh27fo67waN/HbKdCA50Ptqk+k
   SbDt1f2JPJuq4Cjp2JWGialfnM7WbyMqLZs0YDBHHWL4NzM9F7rIqTC3k
   rQ+pAawhIEX0C5+Pz3way1AkeNZV9VspUBeLRGY5O4QIXVSt4OytkT1uc
   Q==;
X-CSE-ConnectionGUID: Ww1kQQ+ESyiu7BnLP2s4Ig==
X-CSE-MsgGUID: navFsJ9JTBql3jIFhs4GbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="226135464"
X-IronPort-AV: E=Sophos;i="6.21,219,1763391600"; 
   d="scan'208";a="226135464"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:35:48 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id CC37D1000341
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:35:48 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 786AB1800E8C
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:35:48 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 324394046BC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:35:45 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2 1/2] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0
Date: Mon, 12 Jan 2026 18:35:38 +0800
Message-ID: <20260112103539.7305-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229203

1. Upstream has renamed roman_numerals-py to roman_numerals
https://pypi.org/project/roman-numerals-py/4.1.0/

2. Changelog
https://github.com/AA-Turner/roman-numerals/blob/master/CHANGES.rst

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/conf/distro/include/maintainers.inc                    | 2 +-
 ...numerals-py_3.1.0.bb => python3-roman-numerals_4.1.0.bb} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-roman-numerals-py_3.1.0.bb => python3-roman-numerals_4.1.0.bb} (60%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 846a12a07b..d67014f5c8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -710,7 +710,7 @@ RECIPE_MAINTAINER:pn-python3-referencing = "Trevor Gamblin <tgamblin@baylibre.co
 RECIPE_MAINTAINER:pn-python3-requests = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-python3-roman-numerals-py = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-roman-numerals = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-rpds-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
rename to meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
index 9a76df0de2..7a97fd3b19 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/AA-Turner/roman-numerals/"
 LICENSE = "0BSD & CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
-SRC_URI[sha256sum] = "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4e5f250aa5ff5bd2d"
-PYPI_PACKAGE = "roman_numerals_py"
-UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals_py"
+SRC_URI[sha256sum] = "1af8b147eb1405d5839e78aeb93131690495fe9da5c91856cb33ad55a7f1e5b2"
+PYPI_PACKAGE = "roman_numerals"
+UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


