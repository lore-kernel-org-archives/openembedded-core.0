Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11928.1625242832205213805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043519"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043519"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:36 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776495"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:35 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 19/22] kern-tools: add dropped options to audit output
Date: Sat,  3 Jul 2021 00:20:01 +0800
Message-Id: <a8edc2ddfcc1288101508eeedd9c2500e3fed296.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The rewrite of the configuration audit code dropped the ability to
generate warnings for configuration options that didn't make it into
the final .config.

We integrated the following commit to restore those warnings:

    symbol_why: classify based on config.queue hints

    The config.queue has typing hints inline with each fragment,
    we should be using them to further classify the options, and
    not only relying on the special hardware.cfg, etc, files that
    are part of the meta data

    We also should be checking for options that were set to a
    non 'no' value, and that don't make it into the final .config,
    since without that check it means we are missing some warnings.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5e8a8c52386317607e333e55f710bf0393186c8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 1d900d85fa..70b8518304 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "8f6aaab7f64c6de30d267e31a73f7c3bb30125a9"
+SRCREV = "00dfcab64b85bcb61208724a1588662184ebdd59"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.31.1

