Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEC3CF9C79
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9309.1727246978484995218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XyVvoDN5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246980; x=1758782980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T2h31EWQvueFUUDCK0LEZyZnmmdkSbaIBIcAHoZgUzE=;
  b=XyVvoDN5JE2VBNBG5k92rnAF/kHdCUqf7npXm/WjCcvQstGahWsjGMED
   4NY30MZwLu1IfbOmXdqEpuynKqlYHIyWmoN9LYvAbxSTGMf9+dYUs1yOg
   U5Hc1OMMkqBj9kxT61nSq9t/VPy2A6cI4pp8QDFL5z6YENwEaJH3JZ2ps
   LO9DElLaSvzjNYfB/8uCeL8VaZbbT6QIjsyjunnrGb6f+P4wOknrvWE+4
   tIVIpkCZLzJkgMKlJLiGe2DNHvM9WkocGNYWBZWpEZlSO9VfNj3oxMA59
   vgv+4GxtrKMr+FJ0PIpJLJmGU2qkn2cNmdvMFbPd3TZ4t7J30qfEaRsjr
   Q==;
X-CSE-ConnectionGUID: 6ggVEI8MTnyRBuHNjyBZWw==
X-CSE-MsgGUID: 4KPTGXJlQs25A1PxYOZbFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174735892"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174735892"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CDAE3D8008
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D730D7480
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E21420086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D34C1A000A;
	Wed, 25 Sep 2024 14:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/47] ghostscript: upgrade 10.03.1 -> 10.04.0
Date: Wed, 25 Sep 2024 14:48:39 +0800
Message-Id: <1727246960-20665-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-7.149400-10.000000
X-TMASE-MatchedRID: oE24wyR5wS8FWIzFaWZsv31zro62qhdCnJdsOLB4zv4H4DTIEE89jHMW
	fmr8UEU8OBIdC4YNVZ02G9h3TM4Rov7Hq500c78wwiTNOovcT9ZAxn1/Ndzxqd9RlPzeVuQQ1vZ
	7s3YIVDL7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgNjcp1jLslnxtXl9IxEPXOq43g
	AM6cgX+w1RxwBNHJ3UeoliiyNJe2Po4oSmK0WehnV7tdtvoibafS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtIFgEzOKKV2Zdh8XcNdqJHaM+1f0SsRB+CgcqtgdX4VzYvtWUIlx/KQDUZtnUYe8A5Scp
	70j8wSFC15vM0P9He4l8hZz7JGCYI5vZ8n+nN5M=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204899

From: Wang Mingyu <wangmy@fujitsu.com>

avoid-host-contamination.patch
refreshed for 10.04.0

Changelog:
===========
- addresses CVEs: CVE-2024-46951, CVE-2024-46952, CVE-2024-46953, CVE-2024-46954, CVE-2024-46955, CVE-2024-46956
- add protection for device selection from PostScript input.
- efforts in code hygiene and maintainability continue.
- The usual round of bug fixes, compatibility changes, and incremental improvements.
- add the capability to build with the Tesseract OCR engine.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ghostscript/ghostscript/avoid-host-contamination.patch  | 6 +++---
 .../{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb}      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index 67f14bd368..0546fdf8f0 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From b36713c8f1ba0e5755b78845a433354a63663b1a Mon Sep 17 00:00:00 2001
+From 095bb1db8b2e68cac40e985f347a7039573e1e80 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index 186f704..88ab8c9 100644
+index a5dbc7a..27b55f2 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
-@@ -397,7 +397,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
+@@ -403,7 +403,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
  ### NON PORTABLE, ONLY UNIX WITH GCC SUPPORT
  
  $(DEVOBJ)X11.so : $(x11alt_) $(x11_) $(DEVS_MAK) $(MAKEDIRS)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
index 0504f5244f..546d734333 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "31cd01682ad23a801cc3bbc222a55f07c4ea3e068bdfb447792d54db21a2e8ad"
+SRC_URI[sha256sum] = "c764dfbb7b13fc71a7a05c634e014f9bb1fb83b899fe39efc0b6c3522a9998b1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.34.1


