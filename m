Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.3654.1610079593424698357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1HIl0VMfjF7OHdb7hpxnjhBXO8F0jvSvzneQSLbN0K19H9I3ToyehPBk97oEYycrE2GYzL2y/3
 /DuAdGbtKWAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613727"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613727"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:51 -0800
IronPort-SDR: Ac/7Z168hS+z4SsKqukEx6Wi42muZQhCi6Ztnyhdlni9cSplDjvxasKTM7htEw+Wu7xMyYMbaR
 c1s6s63ijcKw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209489"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:49 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 24/30] coreutils: enable xattrs by default for nativesdk
Date: Fri,  8 Jan 2021 12:18:06 +0800
Message-Id: <9be818787872a68f8ad669e6db372c12376f5ee8.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

When using coreutils nativesdk (e.g. with buildtools-tarball) for
running oe-core builds, a number of recipes/classes/etc. expect xattr
support. This requirement is also expressed by the existing
PACKAGECONFIG_class-native default including xattrs.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80d7debffdeed165006b26dcb89cffafaaecca06)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
index 4eb357e310..320f93bdc2 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -39,6 +39,9 @@ PACKAGECONFIG_class-target ??= "\
 # The lib/oe/path.py requires xattr
 PACKAGECONFIG_class-native ??= "xattr"
 
+# oe-core builds need xattr support
+PACKAGECONFIG_class-nativesdk ??= "xattr"
+
 # with, without, depends, rdepends
 #
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-- 
2.29.2

