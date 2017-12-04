Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 315D47865A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 20:44:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 12:44:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,361,1508828400"; d="scan'208";a="1251834334"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2017 12:44:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 09:43:27 +1300
Message-Id: <20171204204327.27664-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH] acpica: drop NATIVE_INSTALL_WORKS
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
X-List-Received-Date: Mon, 04 Dec 2017 20:44:05 -0000

This variable hasn't been used in a very long time, so there's no need
to be setting it here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/acpica/acpica_20170303.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20170303.bb b/meta/recipes-extended/acpica/acpica_20170303.bb
index e712ca0..7026c05 100644
--- a/meta/recipes-extended/acpica/acpica_20170303.bb
+++ b/meta/recipes-extended/acpica/acpica_20170303.bb
@@ -50,5 +50,4 @@ RPROVIDES_${PN} += "iasl"
 RREPLACES_${PN} += "iasl"
 RCONFLIGHTS_${PN} += "iasl"
 
-NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
-- 
2.9.5


