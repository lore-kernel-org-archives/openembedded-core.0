Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CF51975B98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:30:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Oct 2015 20:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,185,1444719600"; d="scan'208";a="670011200"
Received: from bitbang.jf.intel.com ([10.7.199.99])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 20:30:42 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 20:30:35 -0700
Message-Id: <68fc57bf3f820905b791d07f4311ea6ab6c9bf4a.1445570852.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
References: <4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1445570852.git.randy.e.witt@linux.intel.com>
References: <cover.1445570852.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/5] scripts/oe-pkgdata-util: Fix variable name in error handling
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
X-List-Received-Date: Fri, 23 Oct 2015 03:30:42 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix:
    logger.error('Unable to find pkgdata directory %s' % pkgdata_dir)
NameError: global name 'pkgdata_dir' is not defined

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-pkgdata-util | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 116cfae..cb19cc4 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -496,7 +496,7 @@ def main():
             sys.exit(1)
 
     if not os.path.exists(args.pkgdata_dir):
-        logger.error('Unable to find pkgdata directory %s' % pkgdata_dir)
+        logger.error('Unable to find pkgdata directory %s' % args.pkgdata_dir)
         sys.exit(1)
 
     ret = args.func(args)
-- 
2.4.3


