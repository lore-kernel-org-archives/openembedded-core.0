Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74255C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:29 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456833"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:28 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617206"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/36] util-linux: disable raw
Date: Wed, 27 Oct 2021 23:16:30 +0800
Message-Id: 
 <7995098ca12f624d5d4771ac6e036240c060263a.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157538

From: Markus Volk <f_l_k@t-online.de>

raw.h has been dropped in linux-libc-headers-5.14 leading to:

configure: error: raw selected, but required raw.h header file not available
WARNING: exit code 1 from a shell command.

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f577c10913104860121f682b9b3754870c4db23)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/util-linux/util-linux_2.36.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
index c79cf782d1..82cc8a3dbf 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
@@ -73,7 +73,7 @@ EXTRA_OECONF = "\
     \
     --disable-bfs --disable-chfn-chsh --disable-login \
     --disable-makeinstall-chown --disable-minix --disable-newgrp \
-    --disable-use-tty-group --disable-vipw \
+    --disable-use-tty-group --disable-vipw --disable-raw \
     \
     --without-udev \
     \
-- 
2.31.1


