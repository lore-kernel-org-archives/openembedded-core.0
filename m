Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D616371D81
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 12:51:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 05:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="1163544013"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2017 05:51:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 15:51:46 +0300
Message-Id: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/6] dtc: upgrade to 1.4.4
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
X-List-Received-Date: Tue, 02 May 2017 12:51:56 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/dtc/{dtc_1.4.2.bb => dtc_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.4.2.bb => dtc_1.4.4.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.4.2.bb b/meta/recipes-kernel/dtc/dtc_1.4.4.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.4.2.bb
rename to meta/recipes-kernel/dtc/dtc_1.4.4.bb
index cc72adc6137..eadb7bab6f7 100644
--- a/meta/recipes-kernel/dtc/dtc_1.4.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.4.4.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "ec02b34c05be04f249ffaaca4b666f5246877dea"
+SRCREV = "558cd81bdd432769b59bff01240c44f82cfb1a9d"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


