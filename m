Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F8C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 06:50:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web10.49113.1699253427623465442
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 22:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=d9pzDrsV;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699253428; x=1730789428;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d33ghw3+lvcnxUz1ZM5RBe4yNY+JwrcANwGbinip8oA=;
  b=d9pzDrsVQbEeVdqdAy3/CgtIvSGW+NzPdc/K8nGtFLDhSRW9O3lvSwIX
   GJ9YpLgSuyN7L0dmU6Y1V+xNJsamxnrd5cfSASdLIqzc0wfVelsPAtphA
   o6sW6/LSgpoYsUMqo+9LeJFJ0p1ZNwBmacgKl0X1rkWKUhRfbXIk3Bri7
   8D2bTc2TFM1d1qoMVotgjxJcyxxQbTpUF5OyYhRHQjhSd3VOicBtEoqRL
   ObE2+aRl7MCCFyXB27zrcveSmld4L+Wt8JV6ZqCLVgSOVeKJL33nReqBV
   znyVeKAAuFPoiEayepV9gSul6mHfIF5uNvQSlPY5ebFDQFpcv8r1hGvS9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2200990"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="2200990"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 22:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797221937"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="797221937"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 05 Nov 2023 22:50:27 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/2] resolvconf: Fix fetch error
Date: Mon,  6 Nov 2023 14:30:47 +0800
Message-Id: <20231106063047.303688-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231106063047.303688-1-naveen.kumar.saini@intel.com>
References: <20231106063047.303688-1-naveen.kumar.saini@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 06:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190197

Branch 'master' renamed to 'unstable', which causing following failure.

Error:
Fetcher failure: Unable to find revision cb19bbfbe7e52174332f68bf2f295b39d119fad3 in branch master even from upstream

Switch to 'unstanble' branch.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
index f482bd297f..5f0a5eac70 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
@@ -11,7 +11,7 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=master \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
-- 
2.37.3


