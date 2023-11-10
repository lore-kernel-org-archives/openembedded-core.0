Return-Path: <wen.yan.tan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35523C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 09:50:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.24121.1699609828356446598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 01:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jZgPa55b;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: wen.yan.tan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699609828; x=1731145828;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FZ9mWYIwOWwsgX6JpqhckDVn23nBwcvhaTtMRKzKFDk=;
  b=jZgPa55bB9+S+98u+mOzKk6L1k5k8wRIN7qigjt+GDFgNZyE982czrdQ
   p2IM58EzRhxLZkD4nefEztEuZ4v0FGQgAr+xVi/jG6A641Qc/i9u/ZhAN
   A0rUJynFGjqDqgJd2owEHYk/VzFPLbJ/cOAHtdQNjBYtDIkRM+PjeSegi
   c9sn8TOc27BENOK8oROmJGYfUyUPUGHjzPUB4HwF9JKYz7vydnPpecI52
   u0IjosYnXnlJs67VTf7c4PmV0jlps4GTQFydRauQRvBZ9ojjffozQk0fV
   rRHbXd+5eIb23VB/1SCWYMURt/TgQQThrvJcbzqIlleiFIFoQx142aPw7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="456660925"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456660925"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="854356493"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="854356493"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:50:26 -0800
From: Tan Wen Yan <wen.yan.tan@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tan Wen Yan <wen.yan.tan@intel.com>
Subject: [mickledore][PATCH] python3-urllib3: update to v1.26.18
Date: Fri, 10 Nov 2023 17:30:42 +0800
Message-Id: <20231110093042.3004156-1-wen.yan.tan@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 09:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190404

https://github.com/urllib3/urllib3/releases/tag/1.26.18

Major changes in python3-urllib3 1.26.18:
- Made body stripped from HTTP requests changing the request method to GET after HTTP 303 "See Other" redirect responses. (CVE-2023-45803)

Signed-off-by: Tan Wen Yan <wen.yan.tan@intel.com>
---
 .../{python3-urllib3_1.26.17.bb => python3-urllib3_1.26.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.17.bb => python3-urllib3_1.26.18.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
index 57b166870a..d384b5eb2f 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "24d6a242c28d29af46c3fae832c36db3bbebcc533dd1bb549172cd739c82df21"
+SRC_URI[sha256sum] = "f8ecc1bba5667413457c529ab955bf8c67b45db799d159066261719e328580a0"
 
 inherit pypi setuptools3
 
-- 
2.37.3


