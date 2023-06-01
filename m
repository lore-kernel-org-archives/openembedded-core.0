Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2D7C7EE43
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.26241.1685610238393525359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119084626"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119084626"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:04 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AA4FCD7E4
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:02 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E325141C4
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DF6B88857;
	Thu,  1 Jun 2023 18:04:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinx: upgrade 6.1.3 -> 7.0.1
Date: Thu,  1 Jun 2023 17:03:25 +0800
Message-Id: <1685610221-29015-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-1.550100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yRIRh9wkXSlFpxAd6mi1Ga2syZtMIIHe576p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeBV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrZjLXlUphQ9HY7l5gzPpGyOK8YVLlA3OTfJdClD3zeY8uc4tUzoeM3FRpL8B6C9qfGC/q
	7fWaJSOJhoUOsn966VVtOCXoiShzx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182073

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Remove smartypants from LICENSE

Changelog:
===========
 #11411: Support Docutils 0.20.
 #11418: Clean up remaining references to sphinx.setup_command following the removal of support for setuptools.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-sphinx_6.1.3.bb => python3-sphinx_7.0.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_6.1.3.bb => python3-sphinx_7.0.1.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb b/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
index 0de19af8d9..7af4582861 100644
--- a/meta/recipes-devtools/python/python3-sphinx_6.1.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
@@ -2,11 +2,11 @@ SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=066da51ab732319a06beae4f10788577"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "0dac3b698538ffef41716cf97ba26c1c7788dba73ce6f150c1ff5b4720786dd2"
+SRC_URI[sha256sum] = "61e025f788c5977d9412587e733733a289e2b9fdc2fef8868ddfbfc4ccfe881d"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


