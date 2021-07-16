Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494646"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494646"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075521"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/28] glibc-testsuite: Fix build failures when directly running recipe
Date: Fri, 16 Jul 2021 10:42:14 +0800
Message-Id: <eccfb470229164a106a32126db53dcf155af2569.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you try and run the glibc-testsuite's build task, you see failures
as do_populate_sysroot can't work. We don't have a do_install, get
rid of do_populate_sysroot as well.

The recipe is not included in world builds by default which is why
we don't see the issue more widely.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f7de32dfcc2e6b1872fbd5ea61dcba944d5553a8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.33.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.33.bb b/meta/recipes-core/glibc/glibc-testsuite_2.33.bb
index d887aeff79..659d3132fa 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.33.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.33.bb
@@ -61,3 +61,4 @@ addtask do_check after do_compile
 inherit nopackages
 deltask do_stash_locale
 deltask do_install
+deltask do_populate_sysroot
-- 
2.31.1

