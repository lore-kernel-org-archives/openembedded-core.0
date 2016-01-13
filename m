Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A761865CB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 09:59:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 13 Jan 2016 01:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,288,1449561600"; d="scan'208";a="892228381"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2016 01:59:40 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 780486A4004;
	Wed, 13 Jan 2016 02:47:36 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 10:03:04 +0200
Message-Id: <1452672184-30919-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452525707-1734-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1452525707-1734-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v2] bitbake.conf: rename python-native-runtime
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
X-List-Received-Date: Wed, 13 Jan 2016 09:59:41 -0000

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
index 2fe6b24..fc57a58 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -172,7 +172,7 @@ ASSUME_PROVIDED = "\
     diffstat-native \
     patch-native \
     hostperl-runtime-native \
-    python-native-runtime \
+    hostpython-runtime-native \
     tar-native \
     virtual/libintl-native \
     virtual/libiconv-native \
-- 
2.1.4


