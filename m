Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RDYMK-0008AN-Hp
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 11:10:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B956ti025035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2011 02:05:06 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 11 Oct 2011 02:05:06 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
Date: Tue, 11 Oct 2011 17:10:20 +0800
Message-ID: <fb40a58687fdb1a591e9cf26ce6a0cc132bc0df9.1318323779.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1318323779.git.wenzong.fan@windriver.com>
References: <cover.1318323779.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_tracking_fields: update 3 packages information
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
X-List-Received-Date: Tue, 11 Oct 2011 09:10:49 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

update the following packages distro tracking fields:
    ccache
    chkconfig
    gobject-introspection

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   26 +++++++++++++------
 1 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7b6c4a9..539f7b8 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5093,14 +5093,12 @@ RECIPE_LAST_UPDATE_pn-gdk-pixbuf-csource-native = "Sep 24, 2008"
 RECIPE_MAINTAINER_pn-gdk-pixbuf-csource-native = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-gdk-pixbuf-csource-native = "Debian=libgdk-pixbuf2.0-0 Fedora=gdk-pixbuf2"
 
-RECIPE_STATUS_pn-gobject-introspection = "red" # update needed
-RECIPE_DEPENDENCY_CHECK_pn-gobject-introspection = "not done"
-RECIPE_LATEST_VERSION_pn-gobject-introspection = "0.9.5"
-RECIPE_NO_OF_PATCHES_pn-gobject-introspection = "3"
-RECIPE_INTEL_SECTION_pn-gobject-introspection = "graphic UX"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gobject-introspection = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-gobject-introspection = "09/2010"
-RECIPE_COMMENTS_pn-gobject-introspection = ""
+RECIPE_STATUS_pn-gobject-introspection = "red"
+RECIPE_LATEST_VERSION_pn-gobject-introspection = "1.30.0"
+RECIPE_MAINTAINER_pn-gobject-introspection = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LAST_UPDATE_pn-gobject-introspection = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-gobject-introspection = "October 11, 2011"
+
 RECIPE_LAST_UPDATE_pn-gnome-common = "Jul 7, 2010"
 RECIPE_MAINTAINER_pn-gnome-common = "Zhai Edwin <edwin.zhai@intel.com>"
 
@@ -5906,6 +5904,18 @@ RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
 RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011" 
 DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
+RECIPE_STATUS_pn-ccache = "red"
+RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
+RECIPE_LAST_UPDATE_pn-ccache = "June 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 11, 2011"
+
+RECIPE_STATUS_pn-chkconfig = "red"
+RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
+RECIPE_LAST_UPDATE_pn-chkconfig = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "October 11, 2011"
+
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
 DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
-- 
1.7.0.4



