Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E39C25B5F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 02:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.2336.1715048594666835286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 19:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Hd/qZ6RK;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715048596; x=1746584596;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IdPw7l9/hV3rvvzb114fVPr8DhNfH/10booH0rrIGv8=;
  b=Hd/qZ6RKV5CdZkfrmFhp/2DKAAaB+6pePS+qp7tEVNJYW9dd7uhb0BoK
   EL0SVN+4dl251CnaVCDsbvTZ2m4xvDwEhy1BG5Prr+gKAFcWam5dygx+n
   KcFAV3lkEwSSKkkg8QLu7/f/sB52LptzeGgZShkWs6DcKt5N3dgDxhqES
   cxG+LP2Qld+UWyVep2ooz9GzGa5lzlN028scIcXnpU+QY463pWAWhxFK1
   jAtXg5JThnJxUN1IBSWLYjlvMsNfvc5ldqP0WcqLisnik3oeLnTe8FZF6
   5aBE4ebTdGyKt/VbM6URgjv3JPMPrl6tvoQX2LhvLKsXNF/vUTFR9YFhX
   A==;
X-CSE-ConnectionGUID: 5YpTXopISWGhsaV7MX7IUg==
X-CSE-MsgGUID: y7KYyCoaTo2S7sUuu1i6jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21432113"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="21432113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:16 -0700
X-CSE-ConnectionGUID: 0W/v+OUGQOeGvr3IZnV5Tw==
X-CSE-MsgGUID: +bOH/6axR4GrctC4G3TsMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28445778"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.119.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] harfbuzz: upgrade 8.3.1 -> 8.4.0
Date: Tue,  7 May 2024 10:23:04 +0800
Message-ID: <20240507022308.13637-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507022308.13637-1-anuj.mittal@intel.com>
References: <20240507022308.13637-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 02:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199059

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_8.3.1.bb => harfbuzz_8.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.3.1.bb => harfbuzz_8.4.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
index fd4dcc23380..fc6951d9edb 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f73e1eacd7e2ffae687bc3f056bb0c705b7a05aee86337686e09da8fc1c2030c"
+SRC_URI[sha256sum] = "af4ea73e25ab748c8c063b78c2f88e48833db9b2ac369e29bd115702e789755e"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.45.0


