Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B86C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 15:40:00 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.1156.1636645199382495335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 07:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="231653868"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800";
   d="scan'208";a="231653868"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 07:39:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800";
   d="scan'208";a="452738511"
Received: from aasad-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.235.66])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 07:39:55 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc-version.inc: remove branch= from GLIBC_GIT_URI
Date: Thu, 11 Nov 2021 23:39:46 +0800
Message-Id: <20211111153946.10084-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 15:40:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158190

GLIBC_GIT_URI is used along with branch=${SRCBRANCH} so no need to add
it here.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 6dac7f0c7a..281df7ecda 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -3,6 +3,6 @@ PV = "2.34"
 SRCREV_glibc ?= "ae37d06c7d127817ba43850f0f898b793d42aea7"
 SRCREV_localedef ?= "95c0221703ad970a52445e9eaf91c4aff35eebef"
 
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;branch=master"
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-- 
2.31.1


