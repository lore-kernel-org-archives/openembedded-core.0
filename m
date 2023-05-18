Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDF0C77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 02:31:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.5731.1684377084465781346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 19:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Flv7Z7No;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684377087; x=1715913087;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DHzeL/WxbXHSkLkPTx1uYdSsSzr5PXT02Em2pLYeeFo=;
  b=Flv7Z7NoLCMY4QR8XWKERXlu8fsYXGpfLBwT98hfvwBJ4a2lMxLBRgGT
   qa8Fj904rKHCWjpKDzLSPuulPz7ai/PsN/Zbhbl+B8HzXoXYahhVVRNEa
   QlI371d2nzbuKjWXHyu2LJjs1GKymaSGjbQnyFDRsDOTwib2rwPFwffIK
   Eda8QhLwl6Dye6wNo7Ft3OAfA9IAqtiaKMxbnPj6P9OV9nz57lBPfmelD
   T7kY1DFwgCozYQFYPXp6y1DnmlrRbrPuwMpQjrKqvJRn5Lux1MIq9VDdx
   lpWQC01NynXy+zUIERg/w+TNgg8ctYn7I9LzP4Dxw82YPWUq34WbSO9KK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336506812"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="336506812"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732693020"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="732693020"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.171.143])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 19:31:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libevdev: upgrade 1.13.0 -> 1.13.1
Date: Thu, 18 May 2023 10:31:16 +0800
Message-Id: <20230518023118.16406-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518023118.16406-1-anuj.mittal@intel.com>
References: <20230518023118.16406-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 02:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181509

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libevdev/{libevdev_1.13.0.bb => libevdev_1.13.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.0.bb => libevdev_1.13.1.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.0.bb b/meta/recipes-support/libevdev/libevdev_1.13.1.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.0.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.1.bb
index ddcc4b6129..85cfd78507 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9edf2006cc86a5055279647c38ec923d11a821ee4dc2c3033e8d20e8ee237cd9"
+SRC_URI[sha256sum] = "06a77bf2ac5c993305882bc1641017f5bec1592d6d1b64787bad492ab34f2f36"
 
 inherit autotools pkgconfig
 
-- 
2.40.1


