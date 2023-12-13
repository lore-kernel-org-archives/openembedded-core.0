Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1AEC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 03:53:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.25594.1702439628421583079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 19:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dOJPNWuQ;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702439628; x=1733975628;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wz+fKkFmn+CnkLVAxAHlMPLddAm4fDu16XZBr0P57vo=;
  b=dOJPNWuQrIoCIqRCijKpC0qrLlLzQbDCAXDx48k3Y28S0rHh0UG0DPhr
   Z3kjs3DYMVY9u0skqHxJHGSUmi5r37v/OK1dhizuFEtnIBCqDnx3trWTf
   wJNzmM6tfsHYSZ85Px9MKpf+mYOU5378eEIdRgcP4AYgiDX5vobb/MjPg
   vRMdbALjp1uoWB5K4ASgi9+I37XjDG9sAqF4kRM2SMMjisl4+DQTIDeSv
   Ypv9QOi0hBMXbKgrxMexup5VQHslzzKupLX9hHt6ENTBA2SqEIWeGZxCt
   02bSobcH3PQlOQUkNtnYnTvuy6VB+LsDwXX3HM8swOu5QwT6Z9+rhDLZ/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481109629"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="481109629"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 19:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917523919"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="917523919"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2023 19:53:47 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 1/6] avahi: add CVE-2023-38473.patch to SRC_URL
Date: Wed, 13 Dec 2023 11:34:04 +0800
Message-Id: <20231213033409.2101308-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 03:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192260

From: Lee Chee Yang <chee.yang.lee@intel.com>

patch file added since Oe-Core rev a9203c46cd64c3ec5e5b00e381bbac85733f85df but not part of SRC_URI.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index aa395beaf9..bfd945c7ae 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38471-1.patch \
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
+           file://CVE-2023-38473.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
-- 
2.37.3


