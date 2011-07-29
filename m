Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QmcrY-0002JE-Qg
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 04:31:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6T2RRIZ029389
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jul 2011 19:27:27 -0700 (PDT)
Received: from localhost (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 28 Jul 2011 19:27:26 -0700
Message-ID: <6a3a2889548525813514095a36a5b38912a85fbc.1311906027.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311906027.git.kai.kang@windriver.com>
References: <cover.1311906027.git.kai.kang@windriver.com>
Old-Date: Thu, 28 Jul 2011 17:30:19 +0800
Date: Fri, 29 Jul 2011 10:27:23 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] distro_tracking_fields: update packages info
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
X-List-Received-Date: Fri, 29 Jul 2011 02:31:47 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

update distro tracking fields of libnewt mailx slang and alsa-tools.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   28 ++++++++++++-------
 meta/recipes-extended/slang/slang_2.2.4.bb         |    1 +
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    9 ++++--
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 3a3991d..974f6bd 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5697,8 +5697,13 @@ RECIPE_MAINTAINER_pn-docbook-utils = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_LATEST_VERSION_pn-task-qte-toolchain-target = "1.0"
 RECIPE_MANUAL_CHECK_DATE_pn-task-qte-toolchain-target = "Feb 28, 2011"
 DISTRO_PN_ALIAS_pn-task-qte-toolchain-target = "Intel"
-RECIPE_LATEST_VERSION_pn-mailx = "12.4"
-RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Feb 28, 2011"
+
+RECIPE_STATUS_pn-mailx = "red"
+RECIPE_LATEST_VERSION_pn-mailx = "12.5"
+RECIPE_LAST_UPDATE_pn-mailx = "Jul 1, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Jul 28, 2011"
+RECIPE_MAINTAINER_pn-mailx = "Kai Kang <kai.kang@windriver.com>"
+
 RECIPE_LATEST_VERSION_pn-libgcc = "4.5.1"
 RECIPE_MANUAL_CHECK_DATE_pn-libgcc = "Feb 28, 2011"
 
@@ -5724,13 +5729,15 @@ RECIPE_MAINTAINER_pn-linuxdoc-tools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-slang = "green"
 RECIPE_LATEST_VERSION_pn-slang = "2.2.4"
-RECIPE_LAST_UPDATE_pn-slang = "Apr 10, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 6, 2011"
+RECIPE_LAST_UPDATE_pn-slang = "Jul 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 28, 2011"
+RECIPE_MAINTAINER_pn-slang = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-libnewt = "green"
-RECIPE_LATEST_VERSION_pn-libnewt = "0.52.12"
-RECIPE_LAST_UPDATE_pn-libnewt = "Aug 06, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jun 4, 2011"
+RECIPE_LATEST_VERSION_pn-libnewt = "0.52.13"
+RECIPE_MAINTAINER_pn-libnewt = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-libnewt = "Jul 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jul 27, 2011"
 RECIPE_NO_UPDATE_REASON_pn-libnewt = ""
 
 RECIPE_STATUS_pn-createrepo = "green"
@@ -5762,10 +5769,11 @@ RECIPE_COMMENTS_pn-rxvt-unicode = ""
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
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 4bf5737..e13f0ad 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -7,6 +7,7 @@ The S-Lang library, provided in this package, provides the S-Lang \
 extension language.  S-Lang's syntax resembles C, which makes it easy \
 to recode S-Lang procedures in C if you need to."
 
+HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "pcre"
 PR = "r5"
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index 1bf9cd0..d6ecf7f 100644
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
 
 PR = "r2"
 
-LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://autotools.patch"
-- 
1.7.5.1.300.gc565c



