Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1DCC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 11:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.36290.1697196893892836383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 04:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Hu1fJIOy;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697196894; x=1728732894;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4PcFubNOU4GhDZku2gbHkF9876BbNZZ2K3/wGeSxyE4=;
  b=Hu1fJIOyLlXr+QdkPpcx/9Be9z6ODYn6t/ObT9/zjGSYj/2iWWYOJYBe
   obilc5jqhRGRmUmyfrBfcnh3A2CzGOv3TOPFmxna8LZft3XkHK7ZAfegK
   FGuShfzO6wFHvLSaT9P8C4zjZImMgmevPWHZtjOD2GM5dEJbPLVxI0G+6
   CkqYYxWAjV7JYYRTl3zophOIZp8iOnJBw9IPCS3a5bn50PeucEQwqwKsq
   zTZamK77+GwXsDHBP70IIDkUe/nzPwPEtQYaf/5NaJoFqHvDaT+Rob93G
   cfcOZK68WoLY3x/7IewkUyuQFKlA98lDCfqg6NbWeuTgD2BdF/hQsfzm/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="385000177"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385000177"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789834395"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="789834395"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 04:29:22 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 5/7] python3-urllib3: upgrade 1.26.13 -> 1.26.14
Date: Fri, 13 Oct 2023 19:09:39 +0800
Message-Id: <20231013110941.2223228-5-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231013110941.2223228-1-chee.yang.lee@intel.com>
References: <20231013110941.2223228-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 11:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189066

From: Tim Orling <ticotimo@gmail.com>

https://github.com/urllib3/urllib3/blob/1.26.14/CHANGES.rst#12614-2023-01-11

1.26.14 (2023-01-11)
    Fixed parsing of port 0 (zero) returning None, instead of 0. (#2850)
    Removed deprecated getheaders() calls in contrib module.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55ab1bf20e6893088acb6460e9004dac8e205559)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_1.26.13.bb => python3-urllib3_1.26.14.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.13.bb => python3-urllib3_1.26.14.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
index 7af95117cf1..f35a141df26 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8"
+SRC_URI[sha256sum] = "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
 
 inherit pypi setuptools3
 
-- 
2.37.3


