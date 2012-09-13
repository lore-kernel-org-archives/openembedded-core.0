Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCFFW-000559-Nw
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 21:38:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2012 12:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,418,1344236400"; d="scan'208";a="192469224"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.93])
	by azsmga001.ch.intel.com with ESMTP; 13 Sep 2012 12:26:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 12:26:19 -0700
Message-Id: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC PATCH] license: Ensure we find multilib packages also
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 19:38:55 -0000

Make sure to find -package, this was causing a failure
in the multi-lib build license generation during rootfs.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 29fe938..b29067c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -88,7 +88,7 @@ license_create_manifest() {
 	# list of installed packages is broken for deb
 	for pkg in ${INSTALLED_PKGS}; do
 		# not the best way to do this but licenses are not arch dependant iirc
-		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
+		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/*${pkg}| head -1`
 		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
 
 		# exclude locale recipes
-- 
1.7.7.6



