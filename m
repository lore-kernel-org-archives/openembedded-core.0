Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RxDeh-0008AG-NF
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 09:22:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1E8EJWP025791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 00:14:19 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 14 Feb 2012 00:14:19 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2012 15:56:01 +0800
Message-ID: <8dc72ee03207898ed0257d9a8d7a5858c45709f2.1329185046.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1329185046.git.wenzong.fan@windriver.com>
References: <cover.1329185046.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] eds-tools: Update it to fix the build error
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
X-List-Received-Date: Tue, 14 Feb 2012 08:22:32 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The head file 'libedataserver/e-data-server-module.h' has been moved
to 'libebackend/e-data-server-module.h', just update eds-tools to get
the latest changes for fixing the path of 'e-data-server-module.h'.

Also update its recipe file to reflect it has been converted to git
repo and split all generated binaries to correct packages.

[YOCTO#1786]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 meta/recipes-sato/eds/eds-tools_git.bb             |    8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 02aeabd..5381c18 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5802,11 +5802,11 @@ DISTRO_PN_ALIAS_pn-aaina = "Intel"
 RECIPE_STATUS_pn-table = "red"
 DISTRO_PN_ALIAS_pn-table = "Intel"
 
-RECIPE_STATUS_pn-eds-tools = "red"
+RECIPE_STATUS_pn-eds-tools = "green"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
 RECIPE_LATEST_VERSION_pn-eds-tools = "git"
 RECIPE_LAST_UPDATE_pn-eds-tools = "Oct 10, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Jan 12, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Feb 13, 2012"
 RECIPE_MAINTAINER_pn-eds-tools = "Wenzong Fan <wenzong.fan@windriver.com>"
 
 RECIPE_STATUS_pn-abiword-embedded = "red"
diff --git a/meta/recipes-sato/eds/eds-tools_git.bb b/meta/recipes-sato/eds/eds-tools_git.bb
index fedfaf5..cf0d72f 100644
--- a/meta/recipes-sato/eds/eds-tools_git.bb
+++ b/meta/recipes-sato/eds/eds-tools_git.bb
@@ -4,8 +4,8 @@ DEPENDS = "dbus-glib eds-dbus"
 RDEPENDS_${PN} = "libedata-book"
 DESCRIPTION = "Test applications for EDS"
 
-SRCREV = "882df681014cf42f75882995e507c75254b6b62f"
-PR = "r0"
+SRCREV = "5e9afbd22a021d1f0d0a0249d5995d19dd770584"
+PR = "r1"
 
 SRC_URI = "git://github.com/rossburton/eds-tools.git;protocol=git"
 
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit autotools pkgconfig
 
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/git"
 
 FILES_${PN} += "${libdir}/evolution-data-server-1.2/extensions/*.so"
+FILES_${PN} += "${libdir}/evolution-data-server-1.2/extensions/*.la"
+FILES_${PN}-dbg += "${libdir}/evolution-data-server-1.2/extensions/.debug/*.so"
-- 
1.7.0.4



