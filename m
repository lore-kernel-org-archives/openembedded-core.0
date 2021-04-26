Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.909.1619398455294766979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: yEf3gVK7kMo6qYaru/i/ypCT09/MDQj/P4vA5V2458pygtqx7Vk1w9aVjB8oGFZscLtpt3v6hS
 PZHPv75MEpKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818094"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818094"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:19 -0700
IronPort-SDR: XZ4HPufiOD7b1lCDlwHGrylJLeq8qrFiBPqBC7tQurY80u1/4Z1oSNTtJ29wZ4f2Gs1S+7vIo3
 gjWE2N5S6Lvw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067317"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/64] nettle: upgrade 3.7.1 -> 3.7.2
Date: Mon, 26 Apr 2021 08:52:49 +0800
Message-Id: <95f038986eb53c3e1ae1b5aac96e1f2b9a235e63.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Version 3.7.2 includes a fix for CVE-2021-20305.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 29f0ef2e32a9b55d8271fde240a4469070d57729)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-support/nettle/{nettle_3.7.1.bb => nettle_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.7.1.bb => nettle_3.7.2.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.7.1.bb b/meta/recipes-support/nettle/nettle_3.7.2.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.7.1.bb
rename to meta/recipes-support/nettle/nettle_3.7.2.bb
index 3bbcf17c7a..f8f3360086 100644
--- a/meta/recipes-support/nettle/nettle_3.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.2.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "156621427c7b00a75ff9b34b770b95d34f80ef7a55c3407de94b16cbf436c42e"
+SRC_URI[sha256sum] = "8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2

