Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED33EC43217
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:01 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.22154.1647223380546326960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=aQrHv8j9;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647223380; x=1678759380;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=m6oiWXgacvI+6wxyPafDN+0JLgx55OY27o5z9eEfiiE=;
  b=aQrHv8j9OIKB94TfvxYfCurBOhc8jUVmvjwyIcD4qJh099HX7jZTbATm
   s+GScoLWuoclkO08mN9q6IkMB5KRvzds1eG+IqZ2P1LtpxFq5wYw7vsCs
   4IWr4ngldt9NZf8C3mqywLKEZcDZqR34mKvjre4mmDOK8t9r8bVK5M/Mf
   eeQwvR9nZtt3sP+Pa8/wMCEpM4t43giPnGQ7X05L8EMdI2WSNe9SQ7zgK
   2g76FNZ/rfmCZMMqYjJ2dkxQq441ROzxOxJeBUwRwP4WggrWDVYAejOKw
   jRiQPXutoH2as2og4KzaRWxp3bfYzHhHoBNklvmEvqguOzljESw9WQn5u
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="316641496"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="316641496"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="515229477"
Received: from lsim7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.229.232])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 2/6] vim: Update to 8.2.4524 for further CVE fixes
Date: Mon, 14 Mar 2022 10:02:01 +0800
Message-Id: 
 <4fa9357473eb62703b1df1b1fb529b4c0ba452a9.1647222224.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647222224.git.anuj.mittal@intel.com>
References: <cover.1647222224.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163117

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes CVE-2022-0696, CVE-2022-0714, CVE-2022-0729.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d29988958e48534a0076307bb2393a3c1309e03)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 59e0b4ed7a..a05e91fe20 100644
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


