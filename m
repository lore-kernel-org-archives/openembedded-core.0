Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qtyol-0000gy-MP
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:23:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9IZEk021050
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Aug 2011 02:18:35 -0700 (PDT)
Received: from localhost (128.224.162.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:18:35 -0700
Message-ID: <2cadbb83f4f0af765a3d5a9de419698fd62de099.1313636030.git.kai.kang@windriver.com>
In-Reply-To: <cover.1313636030.git.kai.kang@windriver.com>
References: <cover.1313636030.git.kai.kang@windriver.com>
Old-Date: Thu, 18 Aug 2011 10:33:55 +0800
Date: Thu, 18 Aug 2011 17:18:32 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.220]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] mailx: update license and distro tracking fileds
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
X-List-Received-Date: Thu, 18 Aug 2011 09:23:16 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

update mailx license and bump up PR, and update distro tracking fields.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    9 +++++++--
 meta/recipes-extended/mailx/mailx_12.5.bb          |    4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c7e5db5..ad4cabe 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5699,8 +5699,13 @@ RECIPE_MAINTAINER_pn-docbook-utils = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_LATEST_VERSION_pn-task-qte-toolchain-target = "1.0"
 RECIPE_MANUAL_CHECK_DATE_pn-task-qte-toolchain-target = "Feb 28, 2011"
 DISTRO_PN_ALIAS_pn-task-qte-toolchain-target = "Intel"
-RECIPE_LATEST_VERSION_pn-mailx = "12.4"
-RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Feb 28, 2011"
+
+RECIPE_STATUS_pn-mailx = "green"
+RECIPE_LATEST_VERSION_pn-mailx = "12.5"
+RECIPE_LAST_UPDATE_pn-mailx = "Jul 1, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Jul 28, 2011"
+RECIPE_MAINTAINER_pn-mailx = "Kai Kang <kai.kang@windriver.com>"
+
 RECIPE_LATEST_VERSION_pn-libgcc = "4.5.1"
 RECIPE_MANUAL_CHECK_DATE_pn-libgcc = "Feb 28, 2011"
 
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index 1173b0a..52b906f 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -6,8 +6,8 @@ for MIME, IMAP, POP3, SMTP, and S/MIME."
 
 HOMEPAGE = "http://heirloom.sourceforge.net/mailx.html"
 SECTION = "console/network"
-PR = "r0"
-LICENSE = "GPL"
+PR = "r1"
+LICENSE = "BSD & MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
-- 
1.7.5.1.300.gc565c



