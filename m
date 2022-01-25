Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B26C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:45 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=B/tiK30K;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118404; x=1674654404;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eFNr3OMtk5TL6mzIRfz+982qC+YccEfDNZvBTuicaaM=;
  b=B/tiK30Kyv9bUziyVdstjP5X/A9VMcjV4idZ3Egd7W1YDZrExt3SMlQy
   KpTC+spe7r4erHgfpipPm31VTuzChng3DaSKs1K0dlYRvChwScUoFZoJO
   XD9+CY6PQw73W/kz0tLWS0dDUZTmH5FC0eWyyQjBIYe3GyAPJofc4zy45
   t+2CHmAn4djxpJSsFGUSSiUXY3RdpcEPnJRySaNpwZDXeJceivDUjQeYe
   sywK626NulLNRsyk7q+eIbciOTATaQ3Vsjb8lwBeMTjBLgv34cnsgKZ7Y
   TYR3phwymnFmWHXS0F4DTrlg39UGeRRqcVx80vREiwdE+GvZLnixhyrf0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016500"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016500"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494357"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/13] expat: Upgrade 2.4.2 -> 2.4.3
Date: Tue, 25 Jan 2022 21:46:02 +0800
Message-Id: 
 <226d8ae449366379c3f9704b0c9f284d9c3baf2d.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160929

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Primarily a security fix release which includes:

    CVE-2021-45960
    CVE-2021-46143
    CVE-2022-22822
    CVE-2022-22823
    CVE-2022-22824
    CVE-2022-22825
    CVE-2022-22826
    CVE-2022-22827

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9dbd9540f3e19d92ef38c8537792bd028ed174ad)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/{expat_2.4.2.bb => expat_2.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.2.bb => expat_2.4.3.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.2.bb b/meta/recipes-core/expat/expat_2.4.3.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.2.bb
rename to meta/recipes-core/expat/expat_2.4.3.bb
index 771f14eb3e..088ce81500 100644
--- a/meta/recipes-core/expat/expat_2.4.2.bb
+++ b/meta/recipes-core/expat/expat_2.4.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "e40737134bdc08b8ea7d23a2c0a5cd11c04d5be152fe562d3253c1e4a0be6686"
+SRC_URI[sha256sum] = "6f262e216a494fbf42d8c22bc841b3e117c21f2467a19dc4c27c991b5622f986"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.34.1


