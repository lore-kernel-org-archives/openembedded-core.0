Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1S7hiG-00005F-9d
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 07:29:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E6Kk0a005983
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:20:46 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 13 Mar 2012 23:20:46 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 14:25:01 +0800
Message-ID: <a90c253c8bdfa49b6d43668855296ff3c69515f9.1331705212.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1331705212.git.wenzong.fan@windriver.com>
References: <cover.1331705212.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] chkconfig: update it from 1.3.57 to 1.3.58
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
X-List-Received-Date: Wed, 14 Mar 2012 06:29:32 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update chkconfig and related distro tracking fields.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 .../{chkconfig_1.3.57.bb => chkconfig_1.3.58.bb}   |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.57.bb => chkconfig_1.3.58.bb} (84%)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d82ab04..5729ad2 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -6203,9 +6203,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-ccache = "Mar 14, 2012"
 
 RECIPE_STATUS_pn-chkconfig = "green"
 RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan <wenzong.fan@windriver.com>"
-RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
-RECIPE_LAST_UPDATE_pn-chkconfig = "Oct 19, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "Oct 25, 2011"
+RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.58"
+RECIPE_LAST_UPDATE_pn-chkconfig = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "Mar 14, 2012"
 
 RECIPE_STATUS_pn-libiconv = "green"
 RECIPE_LATEST_VERSION_pn-libiconv = "1.14"
diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
similarity index 84%
rename from meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
rename to meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index b8ef2f6..2045728 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -16,8 +16,8 @@ PR = "r0"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "35a2d0630f1cb5c251e749eefde70afd"
-SRC_URI[sha256sum] = "6a95472873984a0a8e99dca23ce9efe0ffe9db06d9990ce325575f8506babc1c"
+SRC_URI[md5sum] = "c2039ca67f2749fe0c06ef7c6f8ee246"
+SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f18271211de68"
 
 inherit autotools gettext
 
-- 
1.7.0.4



