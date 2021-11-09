Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC818C433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915953"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915953"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:32 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956922"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/26] libx11-compose-data: Update LICENSE to better
 reflect reality
Date: Tue,  9 Nov 2021 22:37:51 +0800
Message-Id: 
 <b7fc3411dba82e87b626d110b3951a7dbf910f83.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158037

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There are no traces of neither the BSD-2-Clause license nor the
BSD-4-Clause license being used in the code. There is one occurrence
of the BSD-1-Clause license. On the other hand, HPND and
HPND-sell-variant are all over the place.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0f30792fd0ea41f1d1590dbe0452c956e018c82)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
index e53ccc6aea..796980b7ca 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.6.8.bb
@@ -8,7 +8,7 @@ python () {
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
+LICENSE = "MIT & MIT-style & BSD-1-Clause & HPND & HPND-sell-variant"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
 SRC_URI[md5sum] = "c5fa5a86a20e3591bed6c046498d4b8f"
-- 
2.31.1


