Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD671C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 05:47:26 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.2523.1664516831558383180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 22:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LCeQYUvc;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664516842; x=1696052842;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=421OwMiDx8BZdRBoYNf9MMM3fysoRBn+zo5GPzF7utU=;
  b=LCeQYUvcVJCM7brEcAZ5JThLMoeLmyHMLhxnhoUqe8Q0lOAqPLy7WLcL
   Pdo4xDDd3q/f+A8ZYxxNxVK4jrDKEZzzs1JR4lXPoBQTyGiW/zU72fn8N
   JHHECm56ETYFMVAqERFJ8frKtC7cTOrM7GfSfuLHIDC2i39BaU+RB9Roc
   OaVFDvkxVXO0DrO74izsrpYWlkrfl84Q+eeTtz+AGKHkRZdd0Hebuq0cy
   L21iBWF7bkHfy93JyfN5xPD6EMY5m9ih19AQQ06FN94D8CuQEjo06J8Sf
   w+OaRYdJTlNtlzd+qRmFvd33L6SRz9n3aWI5GxEVFAjP2qm4xbh+AaCeV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303023343"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="303023343"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="622654747"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200";
   d="scan'208";a="622654747"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 29 Sep 2022 22:47:21 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch 4/4] rpm: update 4.18.0-rc1 ->
 4.18.0-release
Date: Fri, 30 Sep 2022 13:47:03 +0800
Message-Id: <20220930054703.1799739-4-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930054703.1799739-1-jay.shen.teoh@intel.com>
References: <20220930054703.1799739-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 05:47:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171210

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: 0e9594bdd95a70580e5c10d5b362eb149876ed34)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.0.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.0.bb} (97%)

diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
similarity index 97%
rename from meta/recipes-devtools/rpm/rpm_4.17.1.bb
rename to meta/recipes-devtools/rpm/rpm_4.18.0.bb
index 36ab90d91e..5f3986d8a3 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -43,10 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            "
 
 PE = "1"
-SRCREV = "07a6cca98489106b93467ecfaf5700368983a9b4"
-PV = "4.17.1+4.18-rc1"
-# can be removed in 4.18
-CVE_CHECK_IGNORE += "CVE-2021-35937 CVE-2021-35938 CVE-2021-35939"
+SRCREV = "ea0d77c52e176e2876fdb1d07ad41e9e2635a93e"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


