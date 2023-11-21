Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41745C61D94
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KUaL4Qxl;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530498; x=1732066498;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=r8d6Kjao6xQDRRfUZ/fUSKiBrLeB/cHD7Am4Ai5Gdr0=;
  b=KUaL4QxlE5W/U9kVDEbzSFauaYKkym9o8+OME3zmM5/3ri1FPuEf41Ii
   07SEYRHFjjtSKU0uv52uZj57fl+48gz3Vc/9VrIT8T6sucucG5+DmQIUc
   H3QQQqcYasNVVesnuHS/XjlhD1Yq59XOfLzAls1PjM3ive00eMIbzQcM2
   na973xqfKj2KqTj5MUbEpMO41Pwv9YKsADD6KygVtbRg0QK9w8oTHN0/g
   baHYvY1X7a7XvUndZbDXp1+oOdIRZWlA9h/nPHH98jtBI2Aw8iaxK/3HI
   NRLJaCUPqArzcDOuTtFWvghFym1Ih2udwBJ7C0oFDzluT/+88ncfScugE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584379"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584379"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952147"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952147"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:57 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] libsolv: upgrade 0.7.25 -> 0.7.26
Date: Tue, 21 Nov 2023 09:34:42 +0800
Message-ID: <20231121013448.8478-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190944

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsolv/{libsolv_0.7.25.bb => libsolv_0.7.26.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.25.bb => libsolv_0.7.26.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.25.bb b/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.25.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.26.bb
index 69cb3f79967..bae79601381 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.25.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "f1be8bf3dcc7dc14d331adbc97f337fa08e641c9"
+SRCREV = "48c985375134d2443eee551613161cadc278af2f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.42.0


