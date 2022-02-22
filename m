Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC24C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:58 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.13741.1645542537762329827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RJnZAYHE;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542537; x=1677078537;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mxMa8IKDOBd++S7fCbiNNWvjc7g+jHExzsji6HyFp08=;
  b=RJnZAYHEZbMx86HAsb4XxsQuWrX5kuEKYDIr2atVTInVVTSR/Bcwj+bh
   enxQP/pnpSDf3pyLFL7hRCxWNX7GqWqjet/24S1K0eEMu4SeMclkma4ki
   a/FRk2etAlo3G55PQQfkYIbwGSZTts7icMBMDZFAhAY54ohj1eVew/aqc
   GcN+4VVEPDYPyAntTB3/kcuwTGBlaNzkx1vELs9lFO2u55X8amOaOXXBq
   rpabsib2WGGB0rv76ATBvVCqyVmTKM9FUKPAphqf/SqPgRPH5su3QrnkE
   RwT+AYl5e/TeSkmhAuBJMyHGrcGQqAh2KNi/kSDR1NcjrtXcPwyuXyLdE
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305366"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305366"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258881"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 37/38] expat: Upgrade 2.4.5 -> 2.4.6
Date: Tue, 22 Feb 2022 23:07:38 +0800
Message-Id: 
 <a55061f2811596ea0515e558eb2d626d5fd86819.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162173

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91aa5e3f94a7f82be7949ecfde2764d51384ad42)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/{expat_2.4.5.bb => expat_2.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.5.bb => expat_2.4.6.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.5.bb b/meta/recipes-core/expat/expat_2.4.6.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.5.bb
rename to meta/recipes-core/expat/expat_2.4.6.bb
index 2d9894a057..3e779c3dea 100644
--- a/meta/recipes-core/expat/expat_2.4.5.bb
+++ b/meta/recipes-core/expat/expat_2.4.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "fbb430f964c7a2db2626452b6769e6a8d5d23593a453ccbc21701b74deabedff"
+SRC_URI[sha256sum] = "ce317706b07cae150f90cddd4253f5b4fba929607488af5ac47bf2bc08e31f09"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.35.1


