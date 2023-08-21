Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EB4EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 01:36:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.1898.1692581769790444141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 18:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=GFhej+Wh;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692581770; x=1724117770;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mV+VTk3qgiJDfsvGugm6IldbkEJfJX9x2k658kmJQIA=;
  b=GFhej+WhGxSoXz37lnVyNJLIQFOUoN2NODY8w40mpsPskNMDrSTLAob7
   B2vLpJFi5BTo6Hv8AEBHhuwKbZxzKg3YbIQsQd5SBWyyU16GPrHADV6yF
   F0/9nOWke7xIfPPpQXdr/8bOTWbOnGdBhc8MwjHm//6SnUJ8UoWamk556
   pp23fLkBtmm1YRjIQdY6+M0cHgRd1kxIK1irSfMw6y74AdMQIo7lSIk/n
   euPcKX7b9KOvKHIvbEqqcPDGdEkLYTYalj7XY+19MJdIjce/ACzrEwxru
   QRgAYoeeAuhxuh7aGHtfj+ctSZZQgWwgQJlzib0Q5QYwKGpP7bR/p74VQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="437397400"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="437397400"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2023 18:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="805767065"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="805767065"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2023 18:36:07 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch] tiff: CVE-2022-3599.patch also fix CVE-2022-4645 CVE-2023-30774
Date: Mon, 21 Aug 2023 09:16:31 +0800
Message-Id: <20230821011631.617255-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 01:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186417

From: Chee Yang Lee <chee.yang.lee@intel.com>

The same patch also fix CVE-2022-4645 CVE-2023-30774
CVE-2022-4645 - https://gitlab.com/libtiff/libtiff/-/issues/277
CVE-2023-30774 - https://gitlab.com/libtiff/libtiff/-/issues/463

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
index 9689a99638..b3232d9002 100644
--- a/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
@@ -4,7 +4,7 @@ Date: Tue, 30 Aug 2022 16:56:48 +0200
 Subject: [PATCH] Revised handling of TIFFTAG_INKNAMES and related
 
 Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u7.debian.tar.xz ]
-CVE: CVE-2022-3599
+CVE: CVE-2022-3599 CVE-2022-4645 CVE-2023-30774
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
 
 Origin: https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246
-- 
2.37.3


