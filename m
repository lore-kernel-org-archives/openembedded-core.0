Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468CBC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:07:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.12123.1647356821113804643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=m2B1SSr2;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647356827; x=1678892827;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rqXAriW4c2oC2thP9UxyKeYWyuGwqkTbw4ZU0setI/Y=;
  b=m2B1SSr2e6WIyNE17Ew+lQ25fxBJ9Fk8fbgLxZ7vluPvn+2+bP9Yr+Gw
   vR9qI6x5vKzA8ZHAVZXg0TlM54m6itzUGHfqHz/FeJlYKx2D2S3RBkcw3
   7+TP75tUaMSdQpv0TUM5/zEMu7w5SG5ORs8WhMJrdqmIRfQt+nfabTFQl
   LyJb9mo0SJuf0rIlGU7fGF27eT0fo7kZqor9SEoxjdk2+6rqP4M/b9oa0
   XzcCafMx3pB4Q1CW3sXXjx0HK8sryvKSfpDgzQKNvb+wTY2MlT3fDRk+F
   atO6IIOtfLVhXrokObS+By/byPwWvsbIJ0Te3+09t4MKqF/rC92BjEwDm
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281098941"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="281098941"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400";
   d="scan'208";a="634616170"
Received: from ezulkifl-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.233.253])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:05:35 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 5/6] vim: Update to 8.2.4524 for further CVE fixes
Date: Tue, 15 Mar 2022 23:05:20 +0800
Message-Id: 
 <cbbe79e55169ebd83bd7c6d66acab6287367408c.1647356478.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647356478.git.anuj.mittal@intel.com>
References: <cover.1647356478.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 15:07:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163301

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes CVE-2022-0696, CVE-2022-0714, CVE-2022-0729.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d29988958e48534a0076307bb2393a3c1309e03)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6caa89c733..c124596e8d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
 "
 
-PV .= ".4424"
-SRCREV = "cdf717283ca70b18f20b8a2cefe7957083280c6f"
+PV .= ".4524"
+SRCREV = "d8f8629b1bf566e1dada7515e9b146c69e5d9757"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.1


