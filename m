Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 698C47865A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 20:46:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 12:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,361,1508828400"; 
   d="scan'208";a="9004411"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2017 12:46:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 09:46:20 +1300
Message-Id: <20171204204620.28871-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH v2] acpica: drop NATIVE_INSTALL_WORKS and fix RCONFLICTS
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
X-List-Received-Date: Mon, 04 Dec 2017 20:46:30 -0000

* NATIVE_INSTALL_WORKS hasn't been used in a very long time, so there's no
  need to be setting it here.
* RCONFLIGHTS was clearly a typo.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/acpica/acpica_20170303.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/acpica/acpica_20170303.bb b/meta/recipes-extended/acpica/acpica_20170303.bb
index e712ca0..8e914cd 100644
--- a/meta/recipes-extended/acpica/acpica_20170303.bb
+++ b/meta/recipes-extended/acpica/acpica_20170303.bb
@@ -48,7 +48,6 @@ do_install() {
 PROVIDES = "iasl"
 RPROVIDES_${PN} += "iasl"
 RREPLACES_${PN} += "iasl"
-RCONFLIGHTS_${PN} += "iasl"
+RCONFLICTS_${PN} += "iasl"
 
-NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
-- 
2.9.5


