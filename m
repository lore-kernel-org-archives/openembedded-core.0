Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 612A778303
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:48:50 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 07:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="129748634"
Received: from rpieper-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.39.83])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2017 07:48:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:48:07 +0200
Message-Id: <0efe132c9641f854622e61607f71555adbad4d60.1500561823.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500561823.git.paul.eggleton@linux.intel.com>
References: <cover.1500561823.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/7] classes/staging: change fixme debug message from note to debug
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
X-List-Received-Date: Thu, 20 Jul 2017 14:48:50 -0000

These messages were added for debugging during the recipe specific
sysroot work. They may still be useful but they don't need to be notes -
if they are they show up in recipetool / devtool output when fetching
source.

(From OE-Core rev: a0e93d5c5dcf59d1898a3db727a5ab2d75e3d20e)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 8f470d5..162c8e9 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -170,7 +170,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR']:
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
-    bb.note(cmd)
+    bb.debug(2, cmd)
     subprocess.check_output(cmd, shell=True)
 
 
-- 
2.9.4


