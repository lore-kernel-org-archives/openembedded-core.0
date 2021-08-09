Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466938"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466938"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462995"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/23] nettle: update 3.7.2 -> 3.7.3
Date: Mon,  9 Aug 2021 23:35:55 +0800
Message-Id: <49868162a1a1d088fbaabeffcc2debcbfc17b026.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

fix CVE-2021-3580

(From OE-Core rev: 219c89310264f99c2c43bb80e437a8a1e8e3217a)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.7.2.bb => nettle_3.7.3.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.7.2.bb b/meta/recipes-support/nettle/nettle_3.7.3.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.7.2.bb
rename to meta/recipes-support/nettle/nettle_3.7.3.bb
index f8f3360086..031500d741 100644
--- a/meta/recipes-support/nettle/nettle_3.7.2.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e78b3352e0ef162"
+SRC_URI[sha256sum] = "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.31.1

