Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ACDC61D95
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=LBvk3SVE;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530499; x=1732066499;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9bl05PQxgjFSReUDTMlYUxgxH+lrI9fSvU/AY8Tk5o8=;
  b=LBvk3SVEQKh7isGDdzDusKKW61xjv8pds2i0ewqqHZ1SRyBHjbPwu5Sc
   OOXPIV9ZzmIoa/xJDwDlY5tTAzxwosK5GfwM3/XVL+Q/xbfqpkT1Lak4d
   ch9J4/QqmOe8AlArK97EpfS208djMugvJzhuXxRlXikumU2DE49MOvkwT
   cUJ5zAe2L+XLXz0A67EIN5mpgYDFcHLuMgcdwMetBymOEydL/uvAnqorY
   Ee76gPjiX1TOSMi6ozolJVo2H1LfW8i/aWBjyv6Ey5mrIyBDbkSM2eHsC
   mWOEScX4uKti27rEAvSvDwXO62EwDB1r84ZsbXPyxEbLr8XdXxj0aq90Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584380"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584380"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952161"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952161"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] libtirpc: upgrade 1.3.3 -> 1.3.4
Date: Tue, 21 Nov 2023 09:34:43 +0800
Message-ID: <20231121013448.8478-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190945

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libtirpc/{libtirpc_1.3.3.bb => libtirpc_1.3.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.3.bb => libtirpc_1.3.4.bb} (93%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
similarity index 93%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
index 898a952a8b7..16c7a6007ac 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
 "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3"
+SRC_URI[sha256sum] = "1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860"
 
 CVE_STATUS[CVE-2021-46828] = "fixed-version: fixed in 1.3.3rc1 so not present in 1.3.3"
 
-- 
2.42.0


