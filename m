Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89278C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 06:28:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.33526.1698992906418595547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 23:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Ld7wGKYI;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698992906; x=1730528906;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=trJjrIrD4QgUc7gdUEQcQHEu5xXpNe+9gKVquildqmU=;
  b=Ld7wGKYIqNUOXydJt2ZunsOf9qBI7yK4JVsQm/aRmiGYLaXbr665pMgG
   6p4jmoqpMWsPagLPISizBqN2oA/n/NTyza12UKFkhF6MtHFC5dY1yQBcC
   iu6CadzPPL+ZGPYawU6p+njaMLkZMhTazOYwObA4AR5jHvulA2TcykE0F
   LC6SjaBHhBcJA8BR0acDIIpOQL2hwn1jlrGNWDFiOIT7Sq2FbjjADwpJn
   eUXl2SUMD1zWhhRi5Ri6NPrim+mtNBPIUFCp2DaAwmWqny3uMg2QgCaFP
   y8ICfKvAIqNqqLTpasRKvrJ8uYEzQqTMD2eKa9X9ZLaMfl4lj6uJGG5GV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379288880"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="379288880"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 23:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="796525468"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="796525468"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orsmga001.jf.intel.com with ESMTP; 02 Nov 2023 23:28:22 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] documentation.conf: drop SERIAL_CONSOLES_CHECK
Date: Fri,  3 Nov 2023 14:25:54 +0800
Message-Id: <20231103062554.3881836-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 06:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190108

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove obsolete SERIAL_CONSOLES_CHECK.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 23a9c0fe7b..d03c497c0e 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -379,7 +379,6 @@ SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
 SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
-SERIAL_CONSOLES_CHECK[doc] = "Similar to SERIAL_CONSOLES except the device is checked for existence before attempting to enable it. Supported only by SysVinit."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
 SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU."
-- 
2.34.1


