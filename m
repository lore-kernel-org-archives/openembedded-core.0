Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED4165CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:17:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2015 09:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,551,1418112000"; d="scan'208";a="452675887"
Received: from flopezex-desk.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.zpn.intel.com) ([10.219.4.140])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2015 09:02:38 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2015 11:17:32 -0600
Message-Id: <c888dbe63fda7e3d0923f7660f7321bf906cb054.1423588562.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423588562.git.anibal.limon@linux.intel.com>
References: <cover.1423588562.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2] xserver-xorg: Update to 1.16.3
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
X-List-Received-Date: Tue, 10 Feb 2015 17:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add packageconfig for systemd-logind instead of hard disable in
EXTRA_OECONF this allows users to use packageconfig also add
dependency of dbus because systemd-logind require it for communicate
with systemd.

Update checksums.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc                   | 2 +-
 .../xorg-xserver/{xserver-xorg_1.16.2.bb => xserver-xorg_1.16.3.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.16.2.bb => xserver-xorg_1.16.3.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6154295..f0da488 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -114,7 +114,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --with-xkb-output=/var/lib/xkb \
                  --with-sha1=libcrypto \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
-                 --disable-systemd-logind \
 "
 
 PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
@@ -128,6 +127,7 @@ PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtua
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
index 7d7d83e..347ce3b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
@@ -7,8 +7,8 @@ SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://Fix-subwindow-in-Xi-emulated-events.patch \
            "
 
-SRC_URI[md5sum] = "89620960b13515db8d0a8dbb92a1378a"
-SRC_URI[sha256sum] = "446e0c3ebd556aced78ec0000ba9ae73f1e5317117d497f827afba48b787ce64"
+SRC_URI[md5sum] = "afd93977235584a9caa7528a737c1b52"
+SRC_URI[sha256sum] = "5e0f443238af1078b48f6eea98a382861b59187da221c2cf714d31c1d560b0fb"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.9.1


