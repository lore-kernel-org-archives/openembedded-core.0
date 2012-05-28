Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZ1Bi-0000hH-Cg
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 16:44:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2012 07:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157931290"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.22])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2012 07:34:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 15:34:17 +0100
Message-Id: <1338215657-6618-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/sanity: remove broken TARGET_ARCH check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2012 14:44:50 -0000

The variable name has been typo'd as TARGE_ARCH since it was introduced
some time ago, so the check has never worked. Fixing the typo shows that
the test is not quite functional, so let's just remove it:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010613.html

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a2b45bc..8332105 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -248,10 +248,6 @@ def check_sanity_validmachine(sanity_data):
     if sanity_data.getVar('TUNE_ARCH', True) == 'INVALID':
         messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
 
-    # Check TARGET_ARCH is set correctly
-    if sanity_data.getVar('TARGE_ARCH', False) == '${TUNE_ARCH}':
-        messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
-    
     # Check TARGET_OS is set
     if sanity_data.getVar('TARGET_OS', True) == 'INVALID':
         messages = messages + 'Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.\n'
-- 
1.7.9.5



