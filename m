Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F2AC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:59 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nmasa7Cy;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056859; x=1677592859;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pX9gKNnIYo3gZq6odvZKmMo3g5wv2LylFDtUAdZy28Y=;
  b=nmasa7Cyjhj4h+/VOzkMQ2iUxAjC0c03fTLoKwHvCZD0RANstKLIi/fK
   VD8Z/q2NVYeW+hu7e6LkkWjG3MJ0lfcWfGzBjlYC8KRrQyYSWazzkn7LV
   nbICyLcAiIkq1BQRiNtNEpGtgwiFLy+tWse9C1JrSosWqaasGSzsWV+Rt
   Hg0y9FRODVbRUggiSKtLaP5BqulurmSaH6/7vnWLeXJOgowudY0eznT8a
   kw1GvVDiKhYwLfif7HVA4Nv3QauhBy9OE7EMlPMZ1GnwkFhiTaEAyHzdt
   59mjoj0IkOkuFOUhCo994ldaGalVcJhd1W9IrWqtX2DMEoIZgr3rqAUcM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857058"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857058"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092344"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:57 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/39] gstreamer1.0-python: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 22:00:02 +0800
Message-Id: 
 <e725b559a3076415421b954d7d1152c3767140fb.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162468

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3c68529eb99c74de5a30520261f62a5544be9b39)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-python_1.18.4.bb => gstreamer1.0-python_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.4.bb => gstreamer1.0-python_1.18.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index 49de3dac84..a6ab9589ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cb68e08a7e825e08b83a12a22dcd6e4f1b328a7b02a7ac84f42f68f4ddc7098e"
+SRC_URI[sha256sum] = "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.35.1


