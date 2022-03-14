Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F78C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 02:03:02 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.21809.1647223382157051029
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 19:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cEFAf1p1;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647223382; x=1678759382;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AHEmNTusG/1/rQLIpnVctHLi+13MGt6HID0Dh0pEaKc=;
  b=cEFAf1p1UavOh92Cd8Tv4GdsCdz5P7051gcuPbsiSc0iAi9Ef35VbWot
   MXAJZ5lA0yEjXbCLZpfbdgYdK8D2MWLWZ/Td/ZWUnMGX+GhtpjEwF6hrL
   6gZgR6V5HbxyV4rbSCCF64SRlAZw8lu0tJfups9Y9QujlThcksHhW82YR
   CwwqYlhXOMV349FSBpKIvLAaMsA6oB9tjcUjLgv9rCAliVQAiRknjGZjI
   ldQlMsCmNf18wgRu4mE3IkrKzZhM+zi8smOf2qu0t/l1V2NVDaEyYaDTz
   u4n76izRXusJTFabCTDeE1ckGzQKuCIR0aGOzynxmFX5gmlAEfQNJm6P9
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="316641538"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="316641538"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400";
   d="scan'208";a="515229516"
Received: from lsim7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.229.232])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 19:02:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 4/6] util-linux: update 2.37.2 -> 2.37.3
Date: Mon, 14 Mar 2022 10:02:03 +0800
Message-Id: 
 <5bf810a46db77e3136e7c49dae7394e513a3e71d.1647222224.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647222224.git.anuj.mittal@intel.com>
References: <cover.1647222224.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 02:03:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163119

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e543d4407fdc91559a77d6c5cd41bcb75bc8c73c)
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...til-linux-libuuid_2.37.2.bb => util-linux-libuuid_2.37.3.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.37.2.bb => util-linux_2.37.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.2.bb => util-linux-libuuid_2.37.3.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.37.2.bb => util-linux_2.37.3.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1e3cd28801..0309332722 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9"
+SRC_URI[sha256sum] = "590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776"
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb b/meta/recipes-core/util-linux/util-linux_2.37.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.3.bb
-- 
2.35.1


