Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3023D6B48F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:17:21 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2013 10:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="340243465"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.169])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2013 10:17:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:17:17 +0100
Message-Id: <3b75fb5b6349ec4e06a28eeab093a55f0eca0b53.1375377305.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375377305.git.paul.eggleton@linux.intel.com>
References: <cover.1375377305.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1375377305.git.paul.eggleton@linux.intel.com>
References: <cover.1375377305.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/2] classes/sanity: fix some grammatical errors in messages
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
X-List-Received-Date: Thu, 01 Aug 2013 17:17:21 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cc67490..4df3ca8 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -522,7 +522,7 @@ def check_sanity_version_change(status, d):
         status.addresult("Your gcc version is older than 4.5, please add the following param to local.conf\n \
         %s\n" % message)
     if not result:
-        status.addresult("Your gcc version is older then 4.5 or is not working properly.  Please verify you can build")
+        status.addresult("Your gcc version is older than 4.5 or is not working properly.  Please verify you can build")
         status.addresult(" and link something that uses atomic operations, such as: \n")
         status.addresult("        __sync_bool_compare_and_swap (&atomic, 2, 3);\n")
 
@@ -567,7 +567,7 @@ def check_sanity_version_change(status, d):
 
     oes_bb_conf = d.getVar( 'OES_BITBAKE_CONF', True)
     if not oes_bb_conf:
-        status.addresult('You do not include the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
+        status.addresult('You are not using the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
 
     # The length of tmpdir can't be longer than 410
     status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
@@ -631,7 +631,7 @@ def check_sanity_everybuild(status, d):
     if d.getVar( 'IMAGETEST', True ) == 'qemu':
         display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
         if not display:
-            status.addresult('qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
+            status.addresult('qemuimagetest needs an X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
 
     omask = os.umask(022)
     if omask & 0755:
-- 
1.8.1.2


