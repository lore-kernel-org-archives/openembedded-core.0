Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE05FCDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 11:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.36290.1697196893892836383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 04:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VXWxAEv/;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697196893; x=1728732893;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NOcxuVlbxoa91aQfDuLoV7iXD/X/cfkUHlj+MO/Y/B0=;
  b=VXWxAEv/W5KcUEUNsAKkmwQ04sIqf8ENRjcoql55VdSvG9bGG22GVZhu
   qtcZMySo8p+YhQYXWWrfTnX0YyzhmSfwIrrH7WniZ/u65wkN3CigoUX7R
   sHqhKHjfP9BCmFjh7LZDCNdoycv3RpXDe0JrDw3STRSNXBw64wV5LuxQ9
   pddvhWUWWyugo9+98zj/UapStNvX40nOxA6n9PXF+gvr9vrT4dLCzZTrB
   MXdZT46gwx8QWM5MDp/nIJEoQTI7kWPKPfsA/IyB3WYsjs75zaY7OZ+NH
   aGvWoxHMl4YpmuBy012PgZRrQOzKrm4zUx9o98LVlpkL0AylKmNuf6DN9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="385000138"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385000138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789834367"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="789834367"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 04:29:19 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/7] python3-urllib3: upgrade 1.26.9 -> 1.26.10
Date: Fri, 13 Oct 2023 19:09:35 +0800
Message-Id: <20231013110941.2223228-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 11:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189062

From: wangmy <wangmy@fujitsu.com>

Add dependence python3-logging.

Changelog:
=========
* Removed support for Python 3.5
* Fixed an issue where a "ProxyError" recommending configuring the proxy as HTTP
  instead of HTTPS could appear even when an HTTPS proxy wasn't configured.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8a26a92dfe367472daf086a33a1b30ff6d17540)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_1.26.9.bb => python3-urllib3_1.26.10.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.9.bb => python3-urllib3_1.26.10.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
index 95ae4a54a40..a8e2073d71e 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e"
+SRC_URI[sha256sum] = "879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6"
 
 inherit pypi setuptools3
 
@@ -15,6 +15,7 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-pyopenssl \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-logging \
 "
 
 CVE_PRODUCT = "urllib3"
-- 
2.37.3


