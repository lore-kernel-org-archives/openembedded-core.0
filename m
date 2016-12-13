Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EDB7171C00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:18 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885871"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:40 +1300
Message-Id: <6c98c5538f0b1d27ded9a4278abe9320273f5246.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/14] recipetool: add OE lib path
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:19 -0000

The autotools code imports oe.package; we weren't experiencing a problem
with this probably due to OE itself adding that path previously.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/recipetool | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/recipetool b/scripts/recipetool
index 1052cd2..882b702 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -73,6 +73,7 @@ def main():
         logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
         sys.exit(1)
     logger.debug('Found bitbake path: %s' % bitbakepath)
+    scriptpath.add_oe_lib_path()
 
     scriptutils.logger_setup_color(logger, global_args.color)
 
-- 
2.5.5


