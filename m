Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B23C61D97
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mApgID/W;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530500; x=1732066500;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Qfi5p5iWlRvogmUehy7IqrjwTshCUZe9uTkUDQfhN1g=;
  b=mApgID/WnZUQrQoXr7LVEn61aYrd5yfXWtVZFrrr1ZseJdvY7/Z1jUnX
   CEBXWeX9PpU9THJ/MmK0vtQfiCwv2XAfa6lR5dGleFNUF1TpZhxEuJN1F
   zM+GfAqGBJF7bqug7k7iyfd5489FyQVA8s3AnVRjruamvMZr0zvgqwtCq
   QpEfSYhy2c7t3rR/qOxNqLMDVULuIfc/Q3kAaom0MLjQu2Kj6C5pb92Ar
   QRuSAyjtR/fvDczka1E09Iw9dNBydGHHc2t5sTBf0+um/voNlf7efbL0n
   oT1ZNyoh/2PRs0fH7V8JFI5sMTLp/hHCQFtoHDi8jV07q8NyBWmhmMpf8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584382"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584382"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:35:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952169"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952169"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:59 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] mmc-utils: upgrade to latest revision
Date: Tue, 21 Nov 2023 09:34:44 +0800
Message-ID: <20231121013448.8478-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190946

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 2d02927af7b..a7e4d369ffc 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "613495ecaca97a19fa7f8f3ea23306472b36453c"
+SRCREV = "b5ca140312d279ad2f22068fd72a6230eea13436"
 
 PV = "0.1+git"
 
-- 
2.42.0


