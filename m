Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67C4C6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 17:18:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Jan 2016 09:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,553,1444719600"; d="scan'208";a="879142613"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2016 09:18:24 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 388D06A4004;
	Mon, 11 Jan 2016 10:06:21 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 17:21:47 +0200
Message-Id: <1452525707-1734-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452166779-16328-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1452166779-16328-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH] bitbake.conf: rename python-native-runtime
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 17:18:50 -0000

The code in native.bbclass adds -native suffix to the package
names that don't have it.

Renamed python-native-runtime -> hostpython-runtime-native to avoid
mangling it and to conform with the naming convetion for native
packages.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fe6fff0..5938d6a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -172,7 +172,7 @@ ASSUME_PROVIDED = "\
     diffstat-native \
     patch-native \
     perl-native-runtime \
-    python-native-runtime \
+    hostpython-runtime-native \
     tar-native \
     virtual/libintl-native \
     virtual/libiconv-native \
-- 
2.1.4


