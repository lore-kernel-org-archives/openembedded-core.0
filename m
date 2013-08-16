Return-Path: <cristiana.voicu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE596B7BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 08:28:16 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2013 01:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,893,1367996400"; d="scan'208";a="282751131"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2013 01:27:44 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2013 11:30:49 +0300
Message-Id: <f9e441cc3a1beefe5e6463ed1db730f8803af38c.1376641437.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376641437.git.cristiana.voicu@intel.com>
References: <cover.1376641437.git.cristiana.voicu@intel.com>
Subject: [PATCH 1/2] cronie: upgrade to 1.4.11
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
X-List-Received-Date: Fri, 16 Aug 2013 08:28:16 -0000

LIC_FILES_CHKSUM changed because cron.h doesn't exist anymore.
Replaced it with cron.c.

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../cronie/{cronie_1.4.9.bb => cronie_1.4.11.bb}   |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.4.9.bb => cronie_1.4.11.bb} (92%)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.9.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
similarity index 92%
rename from meta/recipes-extended/cronie/cronie_1.4.9.bb
rename to meta/recipes-extended/cronie/cronie_1.4.11.bb
index b338c37..5b12448 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.9.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "mmaslano@redhat.com"
 # Internet Systems Consortium License
 LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
-                    file://src/cron.h;endline=20;md5=b425c334265026177128353a142633b4 \
+                    file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
                     file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
 
 SECTION = "utils"
@@ -18,8 +18,6 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-PR = "r0"
-
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
@@ -28,8 +26,8 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 
 
-SRC_URI[md5sum] = "9133195e5e6f824ef460f5ccc533f1b7"
-SRC_URI[sha256sum] = "bd7f6f118460c452bd1217a24b80fd3c000425d3de28731b98354a81a2133e92"
+SRC_URI[md5sum] = "2ba645cf54de17f138ef70312843862f"
+SRC_URI[sha256sum] = "fd08084cedddbb42499f80ddb7f2158195c3555c2ff40ee11d4ece2f9864d7be"
 
 inherit autotools update-rc.d useradd
 
-- 
1.7.9.5


