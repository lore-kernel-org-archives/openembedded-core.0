Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 28ABF76BE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 10:56:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 05 Oct 2015 03:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,638,1437462000"; d="scan'208";a="819599750"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2015 03:56:10 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 616FC6A4083
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 03:55:13 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 09:09:34 +0300
Message-Id: <1444025374-32574-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] insane.bbclass: remove misleading path in warning
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
X-List-Received-Date: Mon, 05 Oct 2015 10:56:12 -0000

cross-compilation warning from insane.bbclass is slightly misleading.
So, remove the misleading path from warning.

[YOCTO #7540]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 05e31a7..f7be61b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1146,7 +1146,7 @@ python do_qa_configure() {
         if "config.log" in files:
             if subprocess.call(statement, shell=True) == 0:
                 bb.fatal("""This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
-Rerun configure task after fixing this. The path was '%s'""" % root)
+Rerun configure task after fixing this.""")
 
         if "configure.ac" in files:
             configs.append(os.path.join(root,"configure.ac"))
-- 
2.4.0


