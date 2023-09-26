Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA08E7D250
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:22:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.14088.1695716543014385960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gttRSWYp;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695716543; x=1727252543;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cxErc9QRJThQ1lhWwyskPydC9cAKGWjoXMA+y/oLNrE=;
  b=gttRSWYpd3GSimqYmIsOLN3sAODsNiBNRTDG7rpYmztPLEvE0mqUbX/n
   elldxPGkgka1bAYQL2u4Cn0tW3AEkA7DS7ZHQHM69LaDyALxckhXnp187
   3tKdKVyy5hQDBqgnOFLkG1Ozjf5QIuya9OhA9JXvMAfbaLa0j3PE9huzm
   emET8SIn03zDAtZQwWNUlbEXLR2nQJw+9Lhb4b4GJV4mLPPuM3RjpjsR/
   38Q/vJWorT3BLWLUKZaO5sQUbm9ctXhyJwAl4V0NCRuD8DPk4tekgGBB+
   r+2HlYctm9D6spzaHlgflAuDFD2N5tFEake40kevT+FKzmHxkBsmxcxed
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467799834"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="467799834"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 01:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725361701"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="725361701"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 01:22:21 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH 1/3] bind: upgrade 9.18.17 -> 9.18.18
Date: Tue, 26 Sep 2023 16:02:41 +0800
Message-Id: <20230926080243.2169021-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188221

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Deprecate the 'dialup' and 'heartbeat-interval' options.
 Ignore 'max-zone-ttl' on 'dnssec-policy insecure'.
 Return REFUSED to GSS-API TKEY requests if GSS-API support is not configured.
 Mark a primary server as temporarily unreachable if the TCP connection attempt times out.
 Don't process detach and close netmgr events when the netmgr has been paused.

(cherry-pick from commit e78ec619beea6e541b2d83a5dc845ce57ff12564)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../bind/{bind_9.18.17.bb => bind_9.18.18.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.17.bb => bind_9.18.18.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.17.bb b/meta/recipes-connectivity/bind/bind_9.18.18.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.17.bb
rename to meta/recipes-connectivity/bind/bind_9.18.18.bb
index fa1249b370..b9579ab52a 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.17.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.18.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
+SRC_URI[sha256sum] = "d735cdc127a6c5709bde475b5bf16fa2133f36fdba202f7c3c37d134e5192160"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.37.3


