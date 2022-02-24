Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1A7C4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 06:30:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.7260.1645684241176371553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=E/DVN5uN;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645684243; x=1677220243;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4UCQMU8FmjMFfZd63Wfp3Zw8uZDJOzFhnVJI7ae4BOw=;
  b=E/DVN5uNUeQ8hGBAbtbDg7ixNoacIEN90FWD7R+yI7NcRgsidhKkdN1w
   USmpOqUVUUrs8ESbS9XhX1r3O0L9jHnUFR+/4NkenYNDYWMyLiXwddE//
   eDLu3cRnitVPBodJyNMdNhuza9wFZaWC99qtUVKIRoEYvKiKvuqLkItGG
   vy6IIkmQSluvq4EcVLUIG4fBnJ/whUaLsQo4PLvzKJJW/EoCVp9aGp2Pz
   UFuzJ+AoYNXUMQwzLspJmLjxx9we/ZJRFWi5r8QeFx8vsDJbSnMWaWmQv
   AcV4v4WjB7zKZEKKzJ/ZWkZac5MqtIvFMoK162fN5XAt/Q0aL7LsDr3df
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338600485"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="338600485"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 22:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="574101899"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 22:30:42 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][honister 4/4] libarchive : update to 3.5.3
Date: Thu, 24 Feb 2022 14:28:56 +0800
Message-Id: <20220224062856.2249762-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224062856.2249762-1-chee.yang.lee@intel.com>
References: <20220224062856.2249762-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 06:30:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162301

From: Lee Chee Yang <chee.yang.lee@intel.com>

Libarchive 3.5.3 is a security release

Security Fixes:

extended fix for following symlinks when processing the fixup list (#1566, #1617, CVE-2021-31566)
fix invalid memory access and out of bounds read in RAR5 reader (#1491, #1492, #1493, CVE-2021-36976)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libarchive/{libarchive_3.5.2.bb => libarchive_3.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.5.2.bb => libarchive_3.5.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.2.bb b/meta/recipes-extended/libarchive/libarchive_3.5.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.5.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.3.bb
index 385bcef6e9..dd607aca0a 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.3.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5f245bd5176bc5f67428eb0aa497e09979264a153a074d35416521a5b8e86189"
+SRC_URI[sha256sum] = "72788e5f58d16febddfa262a5215e05fc9c79f2670f641ac039e6df44330ef51"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.25.1


