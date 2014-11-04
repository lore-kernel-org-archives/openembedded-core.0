Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0B4471F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 17:14:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Nov 2014 09:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,313,1413270000"; d="scan'208";a="631275838"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2014 09:14:32 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:14:56 -0600
Message-Id: <1415121300-16524-5-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
References: <1415121300-16524-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 4/8] license_class: Fix remove + trim in license_create_manifest.
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
X-List-Received-Date: Tue, 04 Nov 2014 17:14:43 -0000
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


