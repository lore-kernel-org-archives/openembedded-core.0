Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D07AC4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:53 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7386.1648734471130321746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hwa9C5VE;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734472; x=1680270472;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/nRSR/kSfbsd8EVxQOKhup3RERiSedBt5qOWPpO8jDs=;
  b=hwa9C5VE2mvpL49Iiq0ZSkE1bWyMoHolCzCL9cu6OHvwW+10tkpKX4w6
   0XDzGrJt6f/zCMLZac6dj0fSJLFjX4bUVGGE7rfijA/5vvpUOlJ/NjIT0
   Poh24gMLXI0R+vrZx8yZJv36SG4DVXUAnuJmghSD3ZPGM58jB1/Z+4fmT
   38x08aF8q69aIr3+/9OEtnEVhsvwJkJNs23APdYVVeJYh8n8HNzcta37W
   kEZNQO/kF+kgu0cejYtGlA22rAdQsOnLQXJfZXSDa6bsaKMEJ4rKhpKB3
   s+CTXS3qqX8Sscth16D7+JQIXZZpsfTE/FX9m8pLQ/p/M4KN0C8U2AWfq
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551777"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542075"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/20] gnu-config: update SRC_URI
Date: Thu, 31 Mar 2022 21:47:07 +0800
Message-Id: 
 <ad18c905273fee91b9b41bbdf32b9e6dbc9cdfd8.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163816

From: Minjae Kim <flowergom@gmail.com>

The git repo for gnu-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index ecbd60e72a..da52c943f5 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "6faca61810d335c7837f320733fe8e15a1431fc2"
 PV = "20210125+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.35.1


