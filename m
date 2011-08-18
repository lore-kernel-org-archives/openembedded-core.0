Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtyou-0000kN-MI
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:23:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9Ih2B021067
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Aug 2011 02:18:44 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:18:43 -0700
Message-ID: <66018cb06a65f909f4bc24a1a9d6d2dd57f9a8ca.1313636030.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313636030.git.kai.kang@windriver.com>
References: <cover.1313636030.git.kai.kang@windriver.com>
Old-Date: Thu, 18 Aug 2011 10:44:40 +0800
Date: Thu, 18 Aug 2011 17:18:40 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] alsa-tools: update license and add distro tracking fields
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
X-List-Received-Date: Thu, 18 Aug 2011 09:23:26 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Update license and other informations, then bump up PR.
Update distro tracking fields.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    7 ++++---
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   11 +++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1190359..9dcd3ab 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5770,10 +5770,11 @@ RECIPE_COMMENTS_pn-rxvt-unicode = ""
 RECIPE_LAST_UPDATE_pn-rxvt-unicode = "May 25, 2011"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-alsa-tools = "red"
+RECIPE_STATUS_pn-alsa-tools = "green"
 RECIPE_LATEST_VERIONS_pn-alsa-tools = "1.0.24.1
-RECIPE_LAST_UPDATE_pn-alsa-tools = "Jan 31, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Jun 7, 2011" 
+RECIPE_LAST_UPDATE_pn-alsa-tools = "Jul 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Jul 28, 2011"
+RECIPE_MAINTAINER_pn-alsa-tools = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-mesa-demos = "red"
 RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index 1bf9cd0..ed2886d 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
@@ -1,13 +1,16 @@
 BROKEN = "1"
 
-DESCRIPTION = "Alsa Tools"
+DESCRIPTION = "Alsa Tools package contains advanced tools for certain sound cards."
+HOMEPAGE = "http://www.alsa-project.org"
+BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r2"
+PR = "r3"
 
-LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://autotools.patch"
-- 
1.7.5.1.300.gc565c



