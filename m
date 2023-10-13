Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF787C46CA1
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 11:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.36291.1697196894455248078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 04:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YLOgAmIB;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697196894; x=1728732894;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CYoth/e3FsuKyClC8Gco04jVRZWmkh0KYOVnRCPMqnM=;
  b=YLOgAmIBXVmSFOrq8xy4Bqibajqsn+oh5z+gZkFvFQUDdrfY1IQJixuL
   rwlazQTABfU8xHwQVe6xdeUr5YIW2P/0IsmSF3vaXBPbrLdQxA2Le/SSy
   ReOEs60TtuAJhn9qNNNu30nZdOrWxw/WjYbhVps6ptttasiM4PXSxvjXN
   jcyHjX25zE6+eiYW+CkO5FgomQAMOjqJAzOn2sh8F3aaZ/MNYBWT9zctP
   lxu3zrIEuqZXR8X+7dHUexrP35Nkqtkb7BEZXSdgwhxjFtYXlW+rYGROs
   tiCTxDE+SSm90/Sicyy2WxkXdMEHI5yvnW8DNCmUZr2yn4+/y5H3QVTXw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="385000191"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385000191"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789834403"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="789834403"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 04:29:23 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 6/7] python3-urllib3: upgrade 1.26.14 -> 1.26.15
Date: Fri, 13 Oct 2023 19:09:40 +0800
Message-Id: <20231013110941.2223228-6-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231013110941.2223228-1-chee.yang.lee@intel.com>
References: <20231013110941.2223228-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 11:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189067

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix socket timeout value when "HTTPConnection" is reused ('#2645 <https://github.com/urllib3/urllib3/issues/2645>'__)
* Remove "!" character from the unreserved characters in IPv6 Zone ID parsing
  ('#2899 <https://github.com/urllib3/urllib3/issues/2899>'__)
* Fix IDNA handling of '\x80' byte ('#2901 <https://github.com/urllib3/urllib3/issues/2901>'__)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e062efbac29a81831c3060bcae601dc533d65dd)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
index f35a141df26..d2de7c4c022 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
+SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
 
 inherit pypi setuptools3
 
-- 
2.37.3


