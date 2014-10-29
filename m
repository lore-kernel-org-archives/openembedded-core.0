Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3B370E0B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 18:33:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2014 11:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,278,1413270000"; d="scan'208";a="627817006"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2014 11:33:54 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 12:34:16 -0600
Message-Id: <1414607656-12144-5-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] license_class: Fix remove + trim in license_create_manifest.
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
X-List-Received-Date: Wed, 29 Oct 2014 18:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index a055660..74de364 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -121,9 +121,9 @@ python license_create_manifest() {
                 bb.fatal('%s: %s' % (d.getVar('P', True), exc))
 
             for lic in pkg_dic[pkg]["FLATTENED_LICENSE"]:
-                lic = re.sub('\+', '', lic)
                 lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
-                                        pkg_dic[pkg]["PN"], "generic_%s" % lic)
+                                        pkg_dic[pkg]["PN"], "generic_%s" %
+                                        re.sub('\+', '', lic))
                 if not os.path.exists(lic_file):
                    bb.warn("The license listed %s was not in the "\ 
                             "licenses collected for recipe %s" 
-- 
1.9.1


