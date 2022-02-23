Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC786C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 06:19:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.4453.1645597154138382376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 22:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fcYyzBYX;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645597154; x=1677133154;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6eHBQa/7/fStGZxFyd+WQQmOTyTCpWHVvCGg47u6na4=;
  b=fcYyzBYXi6uoAMCeSvELHyG1H416sioeWlIZhnEgHlsh/e/lfRE59Av/
   xfr+77NmACibgsbmSbQmiBuirsBKqsX4COXw7qqLelBESRBpcR/Aa+sxn
   DGejFeGor4RIcfs4hi0f+SIM8jsQcOnJ5Bw8xhItCKfnrkAMZ/Usk8zRi
   n+emUTOWXD9c6C1Ca60MRWlZydLYPsfOoYZ871wdO9sdO3iLUo6/Jx7zA
   63CpGsHf9cTEtTJofOy316iUo5LmiFosgDoIRMSmD0xXZEZUcwDwHEij0
   TkxQCtS7sTiE+nl6uchj0eHD08WllXCG/wExtYC89VvzjdAx6XL9dcEf4
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338330761"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600";
   d="scan'208";a="338330761"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 22:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600";
   d="scan'208";a="548102430"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga008.jf.intel.com with ESMTP; 22 Feb 2022 22:19:12 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] ruby: 2.7.4 -> 2.7.5
Date: Wed, 23 Feb 2022 14:17:30 +0800
Message-Id: <20220223061730.2179962-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 06:19:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162241

From: Chee Yang Lee <chee.yang.lee@intel.com>

This release includes security fixes.
CVE-2021-41817: Regular Expression Denial of Service Vulnerability of Date Parsing Methods
CVE-2021-41816: Buffer Overrun in CGI.escape_html
CVE-2021-41819: Cookie Prefix Spoofing in CGI::Cookie.parse

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/ruby/{ruby_2.7.4.bb => ruby_2.7.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.4.bb => ruby_2.7.5.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.4.bb b/meta/recipes-devtools/ruby/ruby_2.7.5.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.4.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.5.bb
index dafa7d2f6b..44a2527ee7 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.5.bb
@@ -9,8 +9,8 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "823cd21d93c69e4168b03dd127369343"
-SRC_URI[sha256sum] = "3043099089608859fc8cce7f9fdccaa1f53a462457e3838ec3b25a7d609fbc5b"
+SRC_URI[md5sum] = "ede247b56fb862f1f67f9471189b04d4"
+SRC_URI[sha256sum] = "2755b900a21235b443bb16dadd9032f784d4a88f143d852bc5d154f22b8781f1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1


