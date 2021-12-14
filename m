Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB0EC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:22 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=C9c+hE8b;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444881; x=1670980881;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pg9Ih81yDr7e+D+qPnbInjxJBp6Unbvi25afyJzfqfg=;
  b=C9c+hE8bvvHYB4I+of0uRdDMpcFgkIRoijMrHssWSzHEo1IbIX7Y99PF
   Ybp89cflCCPydmbZQGVXm7PrK2YFK6ZweLC5z5TEkQ15EPZR6wN2mNS4j
   ofBCMbxFn+SZxgPiBleNt1I4BL+mY1lyTyvwrt3DQV/gWzX08LE9jVXON
   a27NTQNtGFF4eCzLs11z6Y1r/iPTqkNSVpSFYuCGf1VgXoXdCxF1ztl9a
   A6cHzknJ8J5MEHLD5pdJ9F/go0/zsPYM3uAFwdISUv5tq8ic1BPtmd5Y6
   keuhVzsqtekQ6K/BjN2FxQfNIxYgigTyVSd1T1Gjkg+ww3HYqMdLXEyTg
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682549"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682549"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869223"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/17] cve-extra-exclusions: add db CVEs to
 exclusion list
Date: Tue, 14 Dec 2021 09:20:48 +0800
Message-Id: 
 <05abb98d8efc13e53f44908a405d2f318466cb04.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159675

From: Steve Sakoman <steve@sakoman.com>

Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 679fc70f907fb221f4541ebf30c1610e937209b7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index a6f52b5de7..e02a4d1fde 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -44,7 +44,14 @@ CVE_CHECK_WHITELIST += "CVE-2010-4756"
 # exposing this interface in an exploitable way
 CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
 
-
+# db
+# Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
+# supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
+CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
+CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
+CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
+CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
+CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
 
 #### CPE update pending ####
 
-- 
2.33.1


