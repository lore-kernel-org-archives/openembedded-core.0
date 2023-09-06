Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA50EB8FA7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:40:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.292.1693968057863853420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QJbd7lVi;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693968057; x=1725504057;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hMLzb3xgI1tNutPY0G6pGacJ7QuoJ6kExKF1GDcpEns=;
  b=QJbd7lViVxh6of1vPib9q9k7L0rin6f32i1JEpAeEwdC0E0u7Ma46mJ8
   S8LZkDNF4EZgkGHFK4LDPnHhMw1waPyL5vFm1fb6bFOo9RzsFm7QEpXyk
   nxHt6Cs701u60Ol/ur1rzEs/sBOLsk4lzbv0KmCp5ihwRRazUuXIKCvVv
   iCn4pQp/CvhFxVsnhg/DgIPB4OZgdSx1LGi50JBXV/qX6pvrqV5akFRRc
   R7Xyr+H/FMXxDU3fYk/k0dkWkdGlGRiuPVnKXFzHIxlIJLnArilgkphbe
   U2EuTeeqfz8dMkX+wma/izTZU4mUuuJrLZqe9DSaHATNzJrQQsdm9RCza
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407953256"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407953256"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 19:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776408648"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="776408648"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 19:40:55 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/5] python3: update to 3.8.18
Date: Wed,  6 Sep 2023 10:21:14 +0800
Message-Id: <20230906022118.1593547-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 02:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187268

From: Lee Chee Yang <chee.yang.lee@intel.com>

https://docs.python.org/release/3.8.18/whatsnew/changelog.html#changelog

Release date: 2023-08-24

Security
gh-108310: Fixed an issue where instances of ssl.SSLSocket were
vulnerable to a bypass of the TLS handshake and included protections
(like certificate verification) and treating sent unencrypted data as if
it were post-handshake TLS encrypted data. Security issue reported as
CVE-2023-40217 by Aapo Oksman. Patch by Gregory P. Smith.

Library
gh-107845: tarfile.data_filter() now takes the location of symlinks into
account when determining their target, so it will no longer reject some
valid tarballs with LinkOutsideDestinationError.

Tools/Demos
gh-107565: Update multissltests and GitHub CI workflows to use OpenSSL
1.1.1v, 3.0.10, and 3.1.2.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/{python3_3.8.17.bb => python3_3.8.18.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.17.bb => python3_3.8.18.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.17.bb b/meta/recipes-devtools/python/python3_3.8.18.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.17.bb
rename to meta/recipes-devtools/python/python3_3.8.18.bb
index 00c4ff497a..9d0f72ecf9 100644
--- a/meta/recipes-devtools/python/python3_3.8.17.bb
+++ b/meta/recipes-devtools/python/python3_3.8.18.bb
@@ -43,8 +43,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "70223497e664524303ca2364208647e1"
-SRC_URI[sha256sum] = "2e54b0c68191f16552f6de2e97a2396540572a219f6bbb28591a137cecc490a9"
+SRC_URI[md5sum] = "5ea6267ea00513fc31d3746feb35842d"
+SRC_URI[sha256sum] = "3ffb71cd349a326ba7b2fadc7e7df86ba577dd9c4917e52a8401adbda7405e3f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.37.3


