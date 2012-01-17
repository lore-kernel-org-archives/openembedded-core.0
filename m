Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b6-0006h6-3B
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633067"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:32 -0800
Message-Id: <53f0e127c5bafcbe89246c7722b54cadda3d3be1.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 47/62] classes/base: note variable name in COMPATIBLE_* skip messages
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
X-List-Received-Date: Tue, 17 Jan 2012 08:44:37 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

When raising SkipPackage for COMPATIBLE_MACHINE and COMPATIBLE_HOST
exceptions, include the name of the variable as a hint to the user.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8898882..07d0695 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -379,7 +379,7 @@ python () {
             import re
             this_host = d.getVar('HOST_SYS', 1)
             if not re.match(need_host, this_host):
-                raise bb.parse.SkipPackage("incompatible with host %s" % this_host)
+                raise bb.parse.SkipPackage("incompatible with host %s (not in COMPATIBLE_HOST)" % this_host)
 
         need_machine = d.getVar('COMPATIBLE_MACHINE', 1)
         if need_machine:
@@ -388,7 +388,7 @@ python () {
             if this_machine and not re.match(need_machine, this_machine):
                 this_soc_family = d.getVar('SOC_FAMILY', 1)
                 if (this_soc_family and not re.match(need_machine, this_soc_family)) or not this_soc_family:
-                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
+                    raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
 
 
         dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', 1)
-- 
1.7.6.5



