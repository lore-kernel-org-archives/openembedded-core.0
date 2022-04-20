Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AC3C47082
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.3158.1650419978333112004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=WZINg5fD;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419979; x=1681955979;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ufImI86Tx8qPtwGUne9VGiq5Pz54idsB6iHnkiPjUZM=;
  b=WZINg5fD3vdnTYbWl6KuIdmXe0zbnYFSOy6ua46DWXY0ArQGVzn3/nMe
   ix1Nm8YnlaJHjRo7LqjAlZ7CVzJth9/lVUbR4o6+1WBGaUSzcVXC0pjJy
   bt92wH8obxuSYx5b/QPYA59fR80TUZzDX+d7iu6ruObIJVchUQJ3+5ova
   /kUxm7/UTQB44MbG859TzDwglak22TEw5w0ahHz+UTdvkLA+p0lDR/Sas
   HgTR/+NxFLvqo0+RaIHpkUEQwZfz7yAggOZoYDyprcsYT4b0Vwfyl6XHf
   fYV59fCVqGFhW3DRpxDbJRmrysNV6ZKi0pKR6Ld1Tpv/Hg2cj85qN9b92
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263379406"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="263379406"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071584"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:38 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/11] tiff: Add marker for CVE-2022-1056 being
 fixed
Date: Wed, 20 Apr 2022 09:59:13 +0800
Message-Id: 
 <c3d6829f6c7979ed9836276a75c758e100798648.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164647

From: Richard Purdie <richard.purdie@linuxfoundation.org>

As far as I can tell, the patches being applied also fix CVE-2022-1056 so
mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 256d212fd1eb9b6d4b87c2c84b1ea2a3afdeb843)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...02-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
index d31e9650d1..812ffb232d 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2022-0891
+CVE: CVE-2022-1056
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-- 
2.35.1


