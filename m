Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C453C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:53 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7386.1648734471130321746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=TRePe9pP;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734471; x=1680270471;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=f0zLOG6MK7lQ9FptZlj8jL09zU/1Apr9KQ9YfL7Qm0M=;
  b=TRePe9pPyvo/yDlLEOgv/KS2zzPi7slwKWgSKBgvo1Tf17zstQ9ykwgB
   YMiOapcIsglRhtXhwezeetYjzD3KdX3irexqY7EnKx1l8PGxMH2Q7Y++5
   EKGKj5XklizGC2zKSdEeny/qb9bS86o8zQOfbhd8LFCD2gMJzJqndFvJF
   67JwQkBVLiBYsDwhP8946/haiwagNnVfYnSE3O8XbgUvP1kexrjAcq5+J
   BMwGAoeP8J6j/queE6ffieioug1giZgCpPTpIOk3KqUqI3JRugIgYWQ/b
   3Hf1S8YHslxKytZPaXCnExz6tSEpb2dGfwVBdA21i/LjrrqfApQ9wBoK1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551781"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551781"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542080"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/20] virglrenderer: update SRC_URI
Date: Thu, 31 Mar 2022 21:47:08 +0800
Message-Id: 
 <53c9090b2dd1508868a31cf92ce3c4ff1d124eff.1648734169.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/163815

From: Minjae Kim <flowergom@gmail.com>

The git repo for virglrenderer was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index d92359565a..1c32a573b2 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm virtual/libgl libepoxy"
 SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
+SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://cve-2022-0135.patch \
-- 
2.35.1


