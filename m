Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AEEC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:58:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6480.1652237869110482622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=flHLI+J0;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237883; x=1683773883;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/l4tA2aH6Iea+Q0sYYbYWJmfzNmPYFtsimNVwlQbB58=;
  b=flHLI+J0XOfkr54mGVc1/2HHg5Tncw/0t+Ic1k0LeR6D4FqY2z858VOU
   wvXZpNyL0lsI4yK6L9vWYHcw7PGIZNFRaTF6fZthxEyKcq0HndzQyTXeX
   IU1YVekiNmboa3sfW30Vs3e2opwnCjm/uHWIc1mgnbULl8k+SmmEvqYD8
   tita8k0pI4NV8I5Qr8bryRpDvMtEL6a9mjnGiso/376IO85+AF3NUzN58
   +P3+TkRIjMYgvfuGxlXEx8fE/N44hpusJxAhYD+2qn0cxe2pZuRDtVyn3
   LEmmb13S2wf7cWzNA6mAvZ7v97YSu2NkBVy936o78jjNo2A8JIj/4jhbk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106071"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106071"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754839"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:58:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/17] lttng-modules: upgrade 2.13.2 -> 2.13.3
Date: Wed, 11 May 2022 10:57:29 +0800
Message-Id: 
 <346d7e6acabbaac3563dbf4df51b425a228ead81.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165482

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f9b3727b9f4014a8b08c2ba9c03b8b5f96f01083)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../lttng/{lttng-modules_2.13.2.bb => lttng-modules_2.13.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.2.bb => lttng-modules_2.13.3.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
index b438d06c6c..a959ce9211 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2"
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "dfd547d9041c8c545ae5b7bfef3f0ef2d9f2520d6ab44188c9ea8de56d5d298a"
+SRC_URI[sha256sum] = "7cf1acbb50b84116acc9b4281b81dcc2643d6018bbd1e8514ad1270239896c4b"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.35.3


