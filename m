Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5504E73D8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 15:43:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2015 08:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,595,1422950400"; d="scan'208";a="710920350"
Received: from pbrao1-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.13.156])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2015 08:43:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Apr 2015 16:43:09 +0100
Message-Id: <f5cd2b3652fda1cab198fd5bc6778255ce9a2d22.1429285210.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429285210.git.paul.eggleton@linux.intel.com>
References: <cover.1429285210.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429285210.git.paul.eggleton@linux.intel.com>
References: <cover.1429285210.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/3] classes/base: clarify S not set correctly warning
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
X-List-Received-Date: Fri, 17 Apr 2015 15:43:28 -0000

Hopefully make it a bit clearer to the user which recipe needs fixing
and what needs to be done to fix it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3d9235e..0032b30 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -151,7 +151,7 @@ python base_do_unpack() {
         raise bb.build.FuncFailed(e)
 
     if not os.path.exists(s_dir):
-        bb.warn("%s ('S') doesn't exist, please set 'S' to a proper value" % s_dir)
+        bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN', True), d.getVar('S', False), s_dir))
 }
 
 def pkgarch_mapping(d):
-- 
2.1.0


