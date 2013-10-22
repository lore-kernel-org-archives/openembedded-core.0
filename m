Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ECAAA6D2E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Oct 2013 07:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,548,1378882800"; d="scan'208";a="420829880"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2013 07:24:08 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:23:57 -0500
Message-Id: <0c85ec038e7d922dffe4dd8cf69c8ebf7df29b06.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 02/10] wic: eliminate module checks
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:08 -0000

We're removing all external dependencies including rpm and urlgrabber,
so we don't need this check.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/wic | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 08473d3..b6fd16c 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -38,16 +38,6 @@ import optparse
 import logging
 
 # External modules
-try:
-    import rpm
-    import urlgrabber
-except ImportError:
-    print("ERROR: failed to import necessary modules.")
-    print("Please ensure the following modules are installed:")
-    print("\trpm");
-    print("\turlgrabber");
-    sys.exit(1)
-
 scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
-- 
1.8.3.1


