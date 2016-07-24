Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89FBD607A5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jul 2016 05:16:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6O5GgOt015281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jul 2016 22:16:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 23 Jul 2016 22:16:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Jul 2016 22:16:40 -0700
Message-ID: <07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469337362.git.liezhi.yang@windriver.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Sun, 24 Jul 2016 05:16:42 -0000
Content-Type: text/plain

Fixed:
checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

The module is installed to sysroot, but need use native perl to find it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.20.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
index eba480b..a61e2cf 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
 	   gsettings-desktop-schemas gnome-desktop3 libxml2-native intltool-native"
 
-inherit gnomebase gsettings distro_features_check upstream-version-is-even
+inherit gnomebase gsettings distro_features_check upstream-version-is-even perlnative
 # libwnck3 is x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -22,4 +22,3 @@ do_configure_prepend() {
 FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
 RRECOMMENDS_${PN} = "ca-certificates"
-
-- 
2.9.0


