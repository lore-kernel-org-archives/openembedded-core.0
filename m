Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18AAC25B5C
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11727.1713948189749062313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D5HjjFHW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948189; x=1745484189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vZrrFhzq5AFhbB/BMSNmGux5VhohqFLOuOvT53t+Ges=;
  b=D5HjjFHWtUF2Du+BgnaVZLahdc8E1KtC4IirKIjZyoDl/sewwua4MaYx
   kUPqQtSmoKPm5IkS+61svA+sxjbwolSLTETkmOgXoRQ9/E5eHwK3D+/4x
   IE5n98qjDbiKU6W0ZrYUx5FzCit8EHN2U1lPNrlTGhZgelKKRP3MKWjsL
   tKSqGZ0Off3xrptGnLLfbxR9utJRRCcxfZu4pniJMwyzTkwhRKcS6ownQ
   70VYDqalOrZ8KfOA/Q9oVRXRwhmLeU3Yu6u+0wZfsiRbRw5P5HVNAd61S
   emlGNUi1UjzMAD6QGc/gd8vYRVf1w/fm+VVrOcgoAv8PjNdo1rb4kwCz9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156834840"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156834840"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:07 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 901C8D4C24
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3F33D53F2
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 680DA220024
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 143C91A000B;
	Wed, 24 Apr 2024 16:43:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/38] python3-lxml: upgrade 5.1.0 -> 5.2.1
Date: Wed, 24 Apr 2024 16:42:20 +0800
Message-Id: <1713948152-13501-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--0.615900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrCIFiJP1XZ1Jaer+1iaJkEBRc
	qLOELivDwbDws1ZN2tFBAiJopeTv0O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrLBX9IFybbhU/FG28gxa2LWnoarujAfY3VlqArftiRMVjsQInd4Xa6LBR8ENIlw6eJ4RC
	ZTXzJQkIKij/E1+NS8jb84R4tQSePIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198671

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* LP#2059910: The minimum CPU architecture for the Linux x86 binary wheels was set back to
  "core2", but with SSE 4.2 enabled.
* LP#2059977: "Element.iterfind("//absolute_path")" failed with a "SyntaxError"
  where it should have issued a warning.
* GH#416: The documentation build was using the non-standard "which" command.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_5.1.0.bb => python3-lxml_5.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.1.0.bb => python3-lxml_5.2.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.1.0.bb b/meta/recipes-devtools/python/python3-lxml_5.2.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.1.0.bb
rename to meta/recipes-devtools/python/python3-lxml_5.2.1.bb
index 43719086f0..44a10505f3 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.1.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.2.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "3eea6ed6e6c918e468e693c41ef07f3c3acc310b70ddd9cc72d9ef84bc9564ca"
+SRC_URI[sha256sum] = "3f7765e69bbce0906a7c74d5fe46d2c7a7596147318dbc08e4a2431f3060e306"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.34.1


