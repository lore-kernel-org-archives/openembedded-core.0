Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5900C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.64296.1744073524785885673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CvgSWktQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073526; x=1775609526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EGcFz+vqftRUFmMiL4XYbeuDkScrv+Vw6vDyZhvKiBE=;
  b=CvgSWktQY3ecOw4b4S8OAphxEVOGxu/VgVzMoq85pjED9lI9gB20BZq3
   8CLnOEPNiBMfM56A/XL6ayUpsYCHGeXyO29yoFscbfMSMGGq2c4+rM6NI
   My8B6hkodS51V2ospQdYWVqPwxFrLKTdu61sAjw0dtc6Ic7uTaVZ4MsxD
   nygfPFUEYJtH8gH+Dr/JnlBlnSowpO444qmf27QbKW9Q3JgMYTBMPwRUE
   4MKPavqewDfuf0gweaW9lONROjhJgZB17jSi042jpLvannnRHY+KBhuTu
   rXIFgj9U7o2H486ALW/ywFMflws9K1ChuEUK7ITL99U2dSVNcLvBvZZQ4
   w==;
X-CSE-ConnectionGUID: hUW5PQ77T9WqWaQK2CS2sw==
X-CSE-MsgGUID: IJHTyWoxT1W/eL1ffpAS4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="195727216"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="195727216"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 732BCEAC02
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37388D4BC2
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E87A31A009A;
	Tue,  8 Apr 2025 08:51:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/15] python3-lxml: upgrade 5.3.1 -> 5.3.2
Date: Tue,  8 Apr 2025 08:51:39 +0800
Message-Id: <1744073502-27695-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214485

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 * Binary wheels use libxml2 2.12.10 and libxslt 1.1.42.
 * Binary wheels for Windows use a patched libxml2 2.11.9 and libxslt 1.1.39.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_5.3.1.bb => python3-lxml_5.3.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.3.1.bb => python3-lxml_5.3.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.3.1.bb b/meta/recipes-devtools/python/python3-lxml_5.3.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.3.1.bb
rename to meta/recipes-devtools/python/python3-lxml_5.3.2.bb
index 8a3ec862f7..cc0d4ecd25 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.3.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.3.2.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "106b7b5d2977b339f1e97efe2778e2ab20e99994cbb0ec5e55771ed0795920c8"
+SRC_URI[sha256sum] = "773947d0ed809ddad824b7b14467e1a481b8976e87278ac4a730c2f7c7fcddc1"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.43.0


