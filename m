Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 16F7C60123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 23:57:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2016 16:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="1016966640"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2016 16:57:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:57:12 +1200
Message-Id: <353972ade9bce1a35f889dd8a9496ea104a1470e.1467849364.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] scripts/contrib/devtool-stress: exclude more recipes by default
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
X-List-Received-Date: Wed, 06 Jul 2016 23:57:47 -0000

These recipes can't be used with devtool because they can't be unpacked
in the normal way.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/devtool-stress.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index ab77a2d..5f396aa 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -210,7 +210,7 @@ def main():
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-r', '--resume-from', help='Resume from specified recipe', metavar='PN')
     parser.add_argument('-o', '--only', help='Only test specified recipes (comma-separated without spaces, wildcards allowed)', metavar='PNLIST')
-    parser.add_argument('-s', '--skip', help='Skip specified recipes (comma-separated without spaces, wildcards allowed)', metavar='PNLIST')
+    parser.add_argument('-s', '--skip', help='Skip specified recipes (comma-separated without spaces, wildcards allowed)', metavar='PNLIST', default='gcc-source-*,kernel-devsrc,package-index,perf,meta-world-pkgdata,glibc-locale,glibc-mtrace,glibc-scripts,os-release')
     parser.add_argument('-c', '--skip-classes', help='Skip recipes inheriting specified classes (comma-separated) - default %(default)s', metavar='CLASSLIST', default='native,nativesdk,cross,cross-canadian,image,populate_sdk,meta,packagegroup')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
     subparsers.required = True
-- 
2.5.5


