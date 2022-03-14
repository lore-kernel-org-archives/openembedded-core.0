Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA255C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:03 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.21809.1647223382157051029
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=lO2LInbK;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647223383; x=1678759383;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1bznVXn4snBsPCyhT694B9UgymaR1hzx6wr7cy4eIqA=;
  b=lO2LInbKfpet8VbNBClNNIcsR9eDl7ewA1GRKn7TkIVxQiS0kAHwSNg3
   DifNxH056fDciFNlbJrRQS7iml8zZqTxNBK2OKWllkeQIhPft+zqxUDmK
   DqZje18QTI3/PIv7qtGOmbRzK9rOHjPZh2o6EXeP29V5HdY3ykWdqb9cV
   eTGp1o3SV/PfWH2RZ44TgzMNofMo6BfsKVxhXYyDnQukCjUfyfVayx33g
   fIDhvzG3eRGzib1D4VxUSoEp7O+2wit9e0serSn/GcQyaQoLroW+tW9Jz
   Xl1a5toAaseH9UlWPGqFWajX/zxXuiOvmsr52c92S7NhEcGTMFcaQK91b
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="316641560"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="316641560"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="515229550"
Received: from lsim7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.229.232])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 5/6] util-linux: upgrade 2.37.3 -> 2.37.4
Date: Mon, 14 Mar 2022 10:02:04 +0800
Message-Id: 
 <ff7d5af61066eee1fdcf9b8704d60a4dc3a9da14.1647222224.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647222224.git.anuj.mittal@intel.com>
References: <cover.1647222224.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163120

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a3289c4786c4d278e2bf0ec1a5e04363772d8bc)
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...til-linux-libuuid_2.37.3.bb => util-linux-libuuid_2.37.4.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.37.3.bb => util-linux_2.37.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.3.bb => util-linux-libuuid_2.37.4.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.37.3.bb => util-linux_2.37.4.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0309332722..c48f9572f5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776"
+SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.3.bb b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.4.bb
-- 
2.35.1


