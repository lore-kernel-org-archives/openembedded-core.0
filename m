Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9113C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.378.1637080325948614472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214448460"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="214448460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956664"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/17] mirrors: Add uninative mirror on kernel.org
Date: Wed, 17 Nov 2021 00:31:43 +0800
Message-Id: 
 <20d7be2f3b481bc9a2f034f84eff1c48a4a13d92.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158350

From: Richard Purdie <richard.purdie@linuxfoundation.org>

At the last nas outage, we realised that we don't have good mirrors of the
uninative tarball if our main system can't be accessed. kernel.org mirrors
some Yocto Project data so we've ensured uninative is there. Add the appropriate
mirror url to make use of that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1833cb0c5841afafb468b963b74b63366b09a134)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ba325a658b..75eb86a724 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -62,6 +62,7 @@ ftp://.*/.*     http://sources.openembedded.org/ \n \
 npm://.*/?.*    http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
+https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \n \
 "
 
 # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
-- 
2.33.1


