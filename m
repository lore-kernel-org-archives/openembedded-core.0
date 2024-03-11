Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D5AC54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.57746.1710146410684632311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=CsDDiIqL;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710146411; x=1741682411;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tcKaXhgccVLmwC6GUCykjz6znrgNPHN4s2c2zxsjPrU=;
  b=CsDDiIqLL+wv7EDvqg4GHzDJegdrv46UJv/SgRmn9QbFCObJwqv0T78k
   ZE1PHfy54x14Zag6Ek/xWi57kKYmypk8UMMZbAflXQ/9wj0Lo6F9Hzscz
   Kc+mcYvdlSGx6CHRPCWYHxgYx9sR8WncSOwOkTTRQJDJ8KikcwLPPNLjP
   YP/XrU07M3HudwPtp/D9z97y/e1Z0QlMFPSpMzjhc0J+ZF21ongnxMZCt
   T6Yo7+YE3IRVOSkFU3Qn1gxE+k1nd5pA4agRHF1f4Twk+KgSNaP+3cu1e
   +s70/0lu3xHJWBH2SzRWNbAJWVloDLafO3819sJ6U7dQY49nUsUgM4ydT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656118"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656118"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 01:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15593970"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 01:40:09 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 1/7] libxml2: upgrade to 2.11.7
Date: Mon, 11 Mar 2024 16:39:48 +0800
Message-Id: <20240311083954.418271-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196920

From: Lee Chee Yang <chee.yang.lee@intel.com>

libxml2 2.11.7
Security
[CVE-2024-25062] xmlreader: Don't expand XIncludes when backtracking

libxml2 2.11.6
Regressions
threads: Fix --with-thread-alloc
xinclude: Fix 'last' pointer in xmlXIncludeCopyNode

Bug fixes
parser: Fix potential use-after-free in xmlParseCharDataInternal

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libxml/{libxml2_2.11.5.bb => libxml2_2.11.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.11.7.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.11.7.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.11.7.bb
index fc82912df2..482ce9042d 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.7.bb
@@ -18,7 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
+SRC_URI[archive.sha256sum] = "fb27720e25eaf457f94fd3d7189bcf2626c6dccf4201553bc8874d50e3560162"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.37.3


