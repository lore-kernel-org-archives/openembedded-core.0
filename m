Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UCtJH-0001tT-D4
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 15:57:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2013 06:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="293869848"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2013 06:40:58 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 16:40:56 +0200
Message-Id: <1362494456-10456-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] (distro-alias|maintainers|package-regex).inc: mesa-dri -> mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 14:57:51 -0000

Since the mesa-dri recipe has been renamed to mesa, change the mentioned files
accordingly.

[YOCTO #3385]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta-yocto/conf/distro/include/distro_alias.inc  |    4 ++--
 meta-yocto/conf/distro/include/maintainers.inc   |    4 ++--
 meta-yocto/conf/distro/include/package_regex.inc |    8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-yocto/conf/distro/include/distro_alias.inc b/meta-yocto/conf/distro/include/distro_alias.inc
index 2246097..043c262 100644
--- a/meta-yocto/conf/distro/include/distro_alias.inc
+++ b/meta-yocto/conf/distro/include/distro_alias.inc
@@ -237,8 +237,8 @@ DISTRO_PN_ALIAS_pn-matchbox-themes-gtk = "OpenedHand"
 DISTRO_PN_ALIAS_pn-matchbox-wm-2 = "Mandriva=matchbox-window-manager Debian=matchbox-window-manager"
 DISTRO_PN_ALIAS_pn-matchbox-wm = "OpenedHand"
 DISTRO_PN_ALIAS_pn-menu-cache = "OSPDT"
-DISTRO_PN_ALIAS_pn-mesa-dri = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
-DISTRO_PN_ALIAS_pn-mesa-dri-glsl-native = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
+DISTRO_PN_ALIAS_pn-mesa = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
+DISTRO_PN_ALIAS_pn-mesa-glsl-native = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
 DISTRO_PN_ALIAS_pn-meta-environment-i586 = "OE-Core"
 DISTRO_PN_ALIAS_pn-meta-ide-support = "OE-Core"
 DISTRO_PN_ALIAS_pn-meta-toolchain-gmae = "OE-Core"
diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 0f7a872..4bef81f 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -516,8 +516,8 @@ RECIPE_MAINTAINER_pn-mc = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-mdadm = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 RECIPE_MAINTAINER_pn-menu-cache = "Constantin Musca <constantinx.musca@intel.com>"
 RECIPE_MAINTAINER_pn-mesa-demos = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_MAINTAINER_pn-mesa-dri-glsl-native = "Constantin Musca <constantinx.musca@intel.com>"
-RECIPE_MAINTAINER_pn-mesa-dri = "Constantin Musca <constantinx.musca@intel.com>"
+RECIPE_MAINTAINER_pn-mesa-glsl-native = "Constantin Musca <constantinx.musca@intel.com>"
+RECIPE_MAINTAINER_pn-mesa = "Constantin Musca <constantinx.musca@intel.com>"
 RECIPE_MAINTAINER_pn-metacity = "Constantin Musca <constantinx.musca@intel.com>"
 RECIPE_MAINTAINER_pn-meta-environment-i586 = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_MAINTAINER_pn-meta-ide-support = "Jessica Zhang <jessica.zhang@intel.com>"
diff --git a/meta-yocto/conf/distro/include/package_regex.inc b/meta-yocto/conf/distro/include/package_regex.inc
index fb1473d..4025e40 100644
--- a/meta-yocto/conf/distro/include/package_regex.inc
+++ b/meta-yocto/conf/distro/include/package_regex.inc
@@ -263,10 +263,10 @@ REGEX_URI_pn-bind = "ftp://ftp.isc.org/isc/bind9/"
 REGEX_pn-bind = "[hH][rR][eE][fF]=\"ftp://ftp.isc.org:21/isc/bind9/(?P<pver>((P?\d+[\.\-_]*)+))/\""
 REGEX_URI_pn-dhcp = "ftp://ftp.isc.org/isc/dhcp/"
 REGEX_pn-dhcp = "[hH][rR][eE][fF]=\"ftp://ftp.isc.org:21/isc/dhcp/(dhcp\-)?(?P<pver>((P?\d+[\.\-_]*)+))/\""
-REGEX_URI_pn-mesa-dri = "ftp://ftp.freedesktop.org/pub/mesa/"
-REGEX_pn-mesa-dri = "[hH][rR][eE][fF]=\"ftp://ftp.freedesktop.org:21/pub/mesa/(?P<pver>((\d+[\.\-_]*)+))/\""
-REGEX_URI_pn-mesa-dri-glsl-native = "ftp://ftp.freedesktop.org/pub/mesa/"
-REGEX_pn-mesa-dri-glsl-native = "[hH][rR][eE][fF]=\"ftp://ftp.freedesktop.org:21/pub/mesa/(?P<pver>((\d+[\.\-_]*)+))/\""
+REGEX_URI_pn-mesa = "ftp://ftp.freedesktop.org/pub/mesa/"
+REGEX_pn-mesa = "[hH][rR][eE][fF]=\"ftp://ftp.freedesktop.org:21/pub/mesa/(?P<pver>((\d+[\.\-_]*)+))/\""
+REGEX_URI_pn-mesa-glsl-native = "ftp://ftp.freedesktop.org/pub/mesa/"
+REGEX_pn-mesa-glsl-native = "[hH][rR][eE][fF]=\"ftp://ftp.freedesktop.org:21/pub/mesa/(?P<pver>((\d+[\.\-_]*)+))/\""
 REGEX_URI_pn-nspr = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/"
 REGEX_pn-nspr = "[hH][rR][eE][fF]=\"ftp://ftp.mozilla.org:21/pub/mozilla.org/nspr/releases/v(?P<pver>((\d+[\.\-_]*)+))/\""
 REGEX_URI_pn-createrepo = "http://createrepo.baseurl.org/download/"
-- 
1.7.9.5



