Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B03CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 06:26:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.32897.1697178392521088151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 23:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YnxWY3xB;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697178392; x=1728714392;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BigSeTtSomlIaUySlLhKZXkvLZahv1I3cymi/XWrctg=;
  b=YnxWY3xB6hibSbRFSYyhUxwXquRSZSRHRM3Ig96DBaT1f7AyOvJgBGql
   m1GuByYkKrsUZvRjzwAquYKV7qoW5yB4d4Lj8QSXyd8S1cH/Jwe3rX4HL
   ELiGrm0BxQf1dPBNQ+J8h9UtYNwfqeA60iKIEPR+2gXcmyIDkxat8MiQZ
   yNeQgXSI07PMBkozkRD/GI/7O6mCm7W9xJ2eZhmPlh75Qkv9zfUfgX8U3
   KoLYp1zYATzURk4G8/6rj9m5t+u1oVL5pqwrI/+b/OS7fBFNUEUEMrjDF
   W9vua8cpDKsMe9tRLyVd4JWyG4eEQSm1bQWdfKQm5XiMItGPZdwYxPsZs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382342025"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="382342025"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 23:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789742095"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="789742095"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 12 Oct 2023 23:26:31 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-urllib3: 2.0.5 -> 2.0.6
Date: Fri, 13 Oct 2023 14:06:53 +0800
Message-Id: <20231013060653.782139-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 06:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189028

From: Lee Chee Yang <chee.yang.lee@intel.com>

changelog
Added the Cookie header to the list of headers to strip from requests
when redirecting to a different host. As before, different headers can
be set via Retry.remove_headers_on_redirect. (CVE-2023-43804)

https://github.com/urllib3/urllib3/blob/main/CHANGES.rst

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_2.0.5.bb => python3-urllib3_2.0.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.5.bb => python3-urllib3_2.0.6.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
index 9c15791d34..cd2a9dd4ef 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.5.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "13abf37382ea2ce6fb744d4dad67838eec857c9f4f57009891805e0b5e123594"
+SRC_URI[sha256sum] = "b19e1a85d206b56d7df1d5e683df4a7725252a964e3993648dd0fb5a1c157564"
 
 inherit pypi python_hatchling
 
-- 
2.37.3


