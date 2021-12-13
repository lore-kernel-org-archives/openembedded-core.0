Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB22C43217
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=dehkxP6g;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369065; x=1670905065;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QzUoGQ5sWRBoFW77ybuwk84y/aN2UZ+d13r2xgafkvU=;
  b=dehkxP6g6kNjK+GSot4dnh34XmeC3FPeFyEMTwgRt67GuXICfG8pxWIU
   IMY/VOXZMvraxJTEQq/cjxgyWqX5WwLxthN8j7XiH0DJY+8cUpwJ7yzsJ
   rmkWoeClT84nV+aUqxGAvoTFhgzD8Ia3YNEBmN8zayApgAXM+QBKw53oS
   6hxjGfLU8zj2EV9BpWrM8g7B1ehBj6IBYByqF/+xb+9c7/uLvr5susJ/h
   5Bcjgh6wuLPl5jehr590y1ramgIUihdESYVLE8/JJvyO0Atj4wQj1IpgT
   v+BdEd1ez76IqdxgKup4h7QwAMQYGzh6lb64GP7E4jgtwpPEn2jmm7Kgd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602240"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602240"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589298"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/20] cve-extra-exclusions: add db CVEs to
 exclusion list
Date: Mon, 13 Dec 2021 12:17:10 +0800
Message-Id: 
 <b3056b937a76ddd6c02cd6b17e7a0c178931add4.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159601

From: Steve Sakoman <steve@sakoman.com>

Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 679fc70f907fb221f4541ebf30c1610e937209b7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 561386b706..0b8bec312b 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -43,3 +43,12 @@ CVE_CHECK_WHITELIST += "CVE-2010-4756"
 # CVE applies to a netapp product as well as flagging a general issue. We don't ship anything
 # exposing this interface in an exploitable way
 CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
+
+# db
+# Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
+# supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
+CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
+CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
+CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
+CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
+CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
-- 
2.33.1


