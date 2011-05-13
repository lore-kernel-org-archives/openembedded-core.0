Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkcz-0001tB-TT
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 22:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; 
   d="scan'208";a="1133376"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 22:06:41 -0700
Message-Id: <94991fb73586887bfc740eacf190032dfb206a65.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Wed, 11 May 2011 11:01:38 +0800
Date: Thu, 12 May 2011 22:06:40 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 3/8] recpies: add Upstream-Status for multiple recipes' patches
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
X-List-Received-Date: Fri, 13 May 2011 05:09:31 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

tcf-agent: update its patch's Upstream-Status
screen: update its patch's Upstream-Status
which (GPLv2): update its patch's Upstream-Status
gnome-vfs: update its patch's Upstream-Status
libart-lgpl: update its patch's Upstream-Status
librsvg: update its patch's Upstream-Status
fontconfig: update its patch's Upstream-Status
freetype: update its patch's Upstream-Status
libxsettings-client: update its patch's Upstream-Status
libxcb: update its patch's Upstream-Status
libx11: update its patch's Upstream-Status
 - remove 2 unused xim.patch.
libx11-trim: update its patch's Upstream-Status
libxcalibrate: update its patch's Upstream-Status
libxcomposite: update its patch's Upstream-Status
libxfont: update its patch's Upstream-Status
xtrans: update its patch's Upstream-Status
  - remove abstract_socket_fix.patch as it's not used at all for long.
calibrateproto: update its patch's Upstream-Status
latencytop: update its patch's Upstream-Status
powertop: update its patch's Upstream-Status
settings-daemon: update its patch's Upstream-Status
gnome-settings-daemon: update its patch's Upstream-Status
libxklavier: update its patch's Upstream-Status
liblbxutil: update its patch's Upstream-Status
oprofile: update its patch's Upstream-Status and remove an unused patch
  - delete xml_callgraph_details.patch as it's not used at all.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../gnome/gnome-settings-daemon/configurefix.patch |    2 +
 .../gnome-settings-daemon/desktop-moblin.patch     |    2 +
 ...-settings-daemon-2.24.0-catch-deviceadded.patch |    2 +
 .../gnome-settings-daemon-fix-gthread.patch        |    2 +
 .../gnome-settings-daemon/mojito-cleanup.patch     |    2 +
 .../gnome/gnome-settings-daemon/mount-plugin.patch |    2 +
 .../libxklavier/libxklavier/pkgconfigfix.patch     |    2 +
 .../xorg-lib/liblbxutil/mkg3states.patch           |    2 +
 .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |    2 +
 .../tcf-agent/tcf-agent/terminals_agent.patch      |    2 +
 .../screen/screen-4.0.3/configure.patch            |    2 +
 .../fix_name_conflict_group_member.patch           |    2 +
 .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |    2 +
 .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |    2 +
 .../gnome/libart-lgpl/Makefile.am.patch            |    2 +
 .../librsvg/librsvg-2.32.1/doc_Makefile.patch      |    2 +
 .../fontconfig-2.8.0/fix-pkgconfig.patch           |    2 +
 .../freetype/freetype-2.4.4/no-hardcode.patch      |    2 +
 .../libxsettings-client/disable_Os_option.patch    |    2 +
 .../libxsettings-client/link-x11.patch             |    2 +
 .../xcb/libxcb/xcbincludedir.patch                 |    2 +
 .../xorg-lib/libx11-1.3.4/include_fix.patch        |    2 +
 .../xorg-lib/libx11-1.3.4/nodolt.patch             |    2 +
 .../libx11-1.3.4/x11_disable_makekeys.patch        |    2 +
 .../xorg-lib/libx11-git/X18NCMSstubs.diff          |    2 +
 .../xorg-lib/libx11-git/fix-disable-xlocale.diff   |    2 +
 .../libx11-git/fix-utf8-wrong-define.patch         |    1 +
 .../xorg-lib/libx11-git/include_fix.patch          |    2 +
 .../xorg-lib/libx11-git/nodolt.patch               |    2 +
 .../xorg-lib/libx11-git/x11_disable_makekeys.patch |    2 +
 .../recipes-graphics/xorg-lib/libx11-git/xim.patch |   55 -----
 .../xorg-lib/libx11-trim/include_fix.patch         |    2 +
 .../xorg-lib/libx11-trim/nodolt.patch              |    2 +
 .../libx11-trim/x11_disable_makekeys.patch         |    2 +
 .../xorg-lib/libx11/X18NCMSstubs.diff              |    2 +
 .../xorg-lib/libx11/fix-disable-xlocale.diff       |    2 +
 .../xorg-lib/libx11/fix-utf8-wrong-define.patch    |    1 +
 .../xorg-lib/libx11/include_fix.patch              |    2 +
 meta/recipes-graphics/xorg-lib/libx11/nodolt.patch |    2 +
 .../xorg-lib/libx11/x11_disable_makekeys.patch     |    2 +
 meta/recipes-graphics/xorg-lib/libx11/xim.patch    |   55 -----
 .../xorg-lib/libxcalibrate/fix-xcb.patch           |    2 +
 .../libxcomposite/change-include-order.patch       |    2 +
 .../xorg-lib/libxfont/no-scalable-crash.patch      |    2 +
 .../xorg-lib/xtrans/abstract_socket_fix.patch      |   58 -----
 .../xorg-proto/calibrateproto/fix.patch            |    2 +
 .../latencytop-0.5/latencytop-makefile.patch       |    2 +
 .../recipes-kernel/oprofile/oprofile/opstart.patch |    2 +
 .../oprofile/oprofile/xml_callgraph_details.patch  |  232 --------------------
 .../stub_out_the_ncurses_calls_in_dump_mode.patch  |    2 +
 .../settings-daemon/files/addsoundkeys.patch       |    2 +
 .../files/dso_linking_change_build_fix.patch       |    2 +
 52 files changed, 94 insertions(+), 400 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/xim.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/xim.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/xtrans/abstract_socket_fix.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/xml_callgraph_details.patch

diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
index 01b4f64..892946f 100644
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
+++ b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gnome-settings-daemon-2.26.1/configure.ac
 ===================================================================
 --- gnome-settings-daemon-2.26.1.orig/configure.ac	2009-09-16 22:57:31.000000000 +0100
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
index d3fd76c..b8f1661 100644
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
+++ b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- gnome-settings-daemon-2.26.1/data/gnome-settings-daemon.desktop.in.in~	2009-04-24 20:59:51.000000000 -0700
 +++ gnome-settings-daemon-2.26.1/data/gnome-settings-daemon.desktop.in.in	2009-04-24 20:59:51.000000000 -0700
 @@ -2,7 +2,7 @@
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
index 8e1d0ce..b9cf6e1 100644
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
+++ b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 ============================================================
  Listen for DeviceAdded in addition to DeviceEnabled
 
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
index d77063e..965da09 100644
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
+++ b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gnome-settings-daemon-2.25.90/configure.ac
 ===================================================================
 --- gnome-settings-daemon-2.25.90.orig/configure.ac
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
index 1aff2d6..79f2871 100644
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
+++ b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/plugins/housekeeping/gsd-housekeeping-manager.c b/plugins/housekeeping/gsd-housekeeping-manager.c
 index f84cfad..e8f474a 100644
 --- a/plugins/housekeeping/gsd-housekeeping-manager.c
diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
index 67f056b..25dc36e 100644
--- a/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
+++ b/meta-demoapps/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/configure.ac b/configure.ac
 index 135f2ce..ba737a5 100644
 --- a/configure.ac
diff --git a/meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch b/meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch
index 4aaafb2..f58f30b 100644
--- a/meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch
+++ b/meta-demoapps/recipes-graphics/libxklavier/libxklavier/pkgconfigfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libxklavier-3.7/libxklavier.pc.in
 ===================================================================
 --- libxklavier-3.7.orig/libxklavier.pc.in	2009-06-10 15:58:46.000000000 +0100
diff --git a/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch b/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch
index 029d761..63c1847 100644
--- a/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch
+++ b/meta-demoapps/recipes-graphics/xorg-lib/liblbxutil/mkg3states.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 During the build process the mkg3states binary needs to be run. This patch
 allows it to be built with the build systems gcc allowing this to work.
 
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
index fa9e458..60b0b27 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [poky-specific script]
+
 --- a/Makefile
 +++ b/Makefile
 @@ -32,7 +32,7 @@
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/terminals_agent.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/terminals_agent.patch
index b88b5e7..aed62fa 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/terminals_agent.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/terminals_agent.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [source code; we'll remove it when upgrading tcf-agent in future]
+
 Index: org.eclipse.tm.tcf.terminals.agent/terminals.c
 ===================================================================
 --- org.eclipse.tm.tcf.terminals.agent/terminals.c	(revision 0)
diff --git a/meta/recipes-extended/screen/screen-4.0.3/configure.patch b/meta/recipes-extended/screen/screen-4.0.3/configure.patch
index 1061a56..b29071d 100644
--- a/meta/recipes-extended/screen/screen-4.0.3/configure.patch
+++ b/meta/recipes-extended/screen/screen-4.0.3/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 # The patch is borrowed from OE:
 # http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4ee790cc6974bdfe1c9b06c0567b1c56f56d6615
 # and was rebased to screen-4.0.3's configure.in
diff --git a/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch b/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch
index 568d423..fb9b1a4 100644
--- a/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch
+++ b/meta/recipes-extended/which/which-2.18/fix_name_conflict_group_member.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [this is 2.18(GPLv2) specific]
+
 # glibc also implements the function group_member. To avoid name conflict,
 # here let us append a "_" to which's version.
 #
diff --git a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch b/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
index 3dbc130..0f52136 100644
--- a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
+++ b/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- gnome-vfs-2.6.0/configure.in~	2004-03-22 12:36:23.000000000 +0000
 +++ gnome-vfs-2.6.0/configure.in	2004-06-07 16:04:34.000000000 +0100
 @@ -154,7 +154,7 @@
diff --git a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch b/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
index e25ecdd..dabec32 100644
--- a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
+++ b/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 removes kerberos completely to avoid conflicts with installed kerberos
 --- configure.in.orig	2007-01-05 19:42:26.418541610 +0200
 +++ configure.in	2007-01-05 19:42:56.604261797 +0200
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch b/meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch
index 28acbe1..190ba96 100644
--- a/meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch
+++ b/meta/recipes-gnome/gnome/libart-lgpl/Makefile.am.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libart_lgpl-2.3.21/Makefile.am
 ===================================================================
 --- libart_lgpl-2.3.21.orig/Makefile.am	2009-04-18 05:29:25.000000000 -0700
diff --git a/meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch b/meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch
index 217573b..860d7a9 100644
--- a/meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch
+++ b/meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Automake complains about using += before setting with =
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
index 7fec1e9..c8a3bf5 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  fontconfig.pc.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-graphics/freetype/freetype-2.4.4/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.4/no-hardcode.patch
index 44ae450..0f21d1f 100644
--- a/meta/recipes-graphics/freetype/freetype-2.4.4/no-hardcode.patch
+++ b/meta/recipes-graphics/freetype/freetype-2.4.4/no-hardcode.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- freetype-2.1.10/builds/unix/freetype-config.in.old	2006-05-01 12:39:20.000000000 +0100
 +++ freetype-2.1.10/builds/unix/freetype-config.in	2006-05-01 12:39:34.000000000 +0100
 @@ -16,7 +16,7 @@
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch b/meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch
index 716f562..64b7efa 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client/disable_Os_option.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Do not set Os optimization in target APP CFLAGS, since it may have potential
 error if "--enable-target-optspace" is not set when configuring GCC.
 
diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch b/meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch
index ee12f0a..d08d0d5 100644
--- a/meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch
+++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: Xsettings-client-0.10/Makefile.am
 ===================================================================
 --- Xsettings-client-0.10.orig/Makefile.am	2008-02-07 14:49:54.000000000 +0000
diff --git a/meta/recipes-graphics/xcb/libxcb/xcbincludedir.patch b/meta/recipes-graphics/xcb/libxcb/xcbincludedir.patch
index cef6350..d858a63 100644
--- a/meta/recipes-graphics/xcb/libxcb/xcbincludedir.patch
+++ b/meta/recipes-graphics/xcb/libxcb/xcbincludedir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- libxcb-1.0.orig/configure.ac	2006-11-23 15:33:01.000000000 +0000
 +++ libxcb-1.0/configure.ac	2008-09-10 20:29:12.000000000 +0100
 @@ -50,7 +50,7 @@
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/include_fix.patch
index c8aa085..eeb4175 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/include_fix.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/include_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.ac |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/nodolt.patch
index 011c23e..bf6c7d5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/nodolt.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/nodolt.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- libX11-1.3.4.orig/configure.ac
 +++ libX11-1.3.4/configure.ac
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
index 4036757..561b577 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.3.4/x11_disable_makekeys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  src/util/Makefile.am |   21 -----------------
  1 file changed, 21 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
index 2dd27fc..b49fc22 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 ---
  configure.ac       |    9 -
  src/Makefile.am    |    5 
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff
index 9dbf6da..7dcdd6a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11-git/fix-disable-xlocale.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
 +++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
 @@ -701,7 +701,11 @@
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch
index a098db1..26d3349 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-git/fix-utf8-wrong-define.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch
index 99ed571..b3bcbab 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-git/include_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.ac |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch
index ecf9625..cc05fdc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-git/nodolt.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libX11-1.2.1/configure.ac
 ===================================================================
 --- libX11-1.2.1.orig/configure.ac	2009-07-02 14:07:54.000000000 +0100
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
index 9cc2bbb..5dc6f06 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  src/util/Makefile.am |   17 -----------------
  1 file changed, 17 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11-git/xim.patch b/meta/recipes-graphics/xorg-lib/libx11-git/xim.patch
deleted file mode 100644
index 0eab197..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11-git/xim.patch
+++ /dev/null
@@ -1,55 +0,0 @@
---- libX11-6.2.1/src/X18NCMSstubs.c	2003-12-04 22:47:47.000000000 +0000
-+++ libX11-6.2.1/src/X18NCMSstubs.c-new	2005-12-09 12:09:03.000000000 +0000
-@@ -90,6 +90,52 @@
-   return;
- }
- 
-+XIM
-+XOpenIM (
-+    Display* display,
-+    struct _XrmHashBucketRec* rdb,
-+    char* res_name,
-+    char* res_class)
-+{
-+  return (XIM) NULL;
-+}
-+
-+Status
-+XCloseIM ( XIM im )
-+{
-+  return NULL;
-+}
-+
-+XIC
-+XCreateIC ( XIM im, ...)
-+{
-+  return NULL;
-+}
-+
-+void
-+XDestroyIC ( XIC ic )
-+{
-+  return;
-+}
-+
-+int
-+XmbLookupString (
-+    XIC ic,
-+    XKeyPressedEvent* ev,
-+    char* buffer,
-+    int nbytes,
-+    KeySym* keysym,
-+    Status* status)
-+{
-+  return XLookupNone;
-+}
-+
-+char *
-+XGetICValues( XIC ic, ...)
-+{
-+  return (char *) NULL;
-+}
-+
- XPointer
- _XimGetLocaleCode ( _Xconst char* encoding_name )
- {
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
index 99ed571..b3bcbab 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.ac |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
index ecf9625..cc05fdc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libX11-1.2.1/configure.ac
 ===================================================================
 --- libX11-1.2.1.orig/configure.ac	2009-07-02 14:07:54.000000000 +0100
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch
index 6705782..0445835 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim/x11_disable_makekeys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  src/util/Makefile.am |   17 -----------------
  1 file changed, 17 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
index 54b1727..2e86a48 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- libX11-X11R7.0-1.0.0/src/imConv.c.orig	2006-03-08 09:46:03.000000000 +0100
 +++ libX11-X11R7.0-1.0.0/src/imConv.c	2006-03-08 10:50:10.000000000 +0100
 @@ -83,6 +83,7 @@
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
index 9dbf6da..7dcdd6a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +0100
 +++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
 @@ -701,7 +701,11 @@
diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
index a098db1..26d3349 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
diff --git a/meta/recipes-graphics/xorg-lib/libx11/include_fix.patch b/meta/recipes-graphics/xorg-lib/libx11/include_fix.patch
index 99ed571..b3bcbab 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/include_fix.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/include_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.ac |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11/nodolt.patch b/meta/recipes-graphics/xorg-lib/libx11/nodolt.patch
index ecf9625..cc05fdc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/nodolt.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/nodolt.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libX11-1.2.1/configure.ac
 ===================================================================
 --- libX11-1.2.1.orig/configure.ac	2009-07-02 14:07:54.000000000 +0100
diff --git a/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
index 6705782..0445835 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  src/util/Makefile.am |   17 -----------------
  1 file changed, 17 deletions(-)
diff --git a/meta/recipes-graphics/xorg-lib/libx11/xim.patch b/meta/recipes-graphics/xorg-lib/libx11/xim.patch
deleted file mode 100644
index 0eab197..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11/xim.patch
+++ /dev/null
@@ -1,55 +0,0 @@
---- libX11-6.2.1/src/X18NCMSstubs.c	2003-12-04 22:47:47.000000000 +0000
-+++ libX11-6.2.1/src/X18NCMSstubs.c-new	2005-12-09 12:09:03.000000000 +0000
-@@ -90,6 +90,52 @@
-   return;
- }
- 
-+XIM
-+XOpenIM (
-+    Display* display,
-+    struct _XrmHashBucketRec* rdb,
-+    char* res_name,
-+    char* res_class)
-+{
-+  return (XIM) NULL;
-+}
-+
-+Status
-+XCloseIM ( XIM im )
-+{
-+  return NULL;
-+}
-+
-+XIC
-+XCreateIC ( XIM im, ...)
-+{
-+  return NULL;
-+}
-+
-+void
-+XDestroyIC ( XIC ic )
-+{
-+  return;
-+}
-+
-+int
-+XmbLookupString (
-+    XIC ic,
-+    XKeyPressedEvent* ev,
-+    char* buffer,
-+    int nbytes,
-+    KeySym* keysym,
-+    Status* status)
-+{
-+  return XLookupNone;
-+}
-+
-+char *
-+XGetICValues( XIC ic, ...)
-+{
-+  return (char *) NULL;
-+}
-+
- XPointer
- _XimGetLocaleCode ( _Xconst char* encoding_name )
- {
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch b/meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
index 0d7efc7..d614883 100644
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
+++ b/meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 There is no extra reply data and if we say not to disgard it, xcb
 throws fatal asserts.
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch b/meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch
index 848beff..60331f6 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 This patch makes the build use its own Xcomposite.h over rather than an
 older Xcomposite.h that might already be installed in the staging dir.
 
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch b/meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch
index 90bded6..b3c58af 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch
+++ b/meta/recipes-graphics/xorg-lib/libxfont/no-scalable-crash.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- /tmp/fontdir.c	2006-08-01 16:17:22.000000000 +0200
 +++ libXfont-1.2.0/src/fontfile/fontdir.c	2006-08-01 16:20:37.248306000 +0200
 @@ -695,6 +695,11 @@
diff --git a/meta/recipes-graphics/xorg-lib/xtrans/abstract_socket_fix.patch b/meta/recipes-graphics/xorg-lib/xtrans/abstract_socket_fix.patch
deleted file mode 100644
index 197da07..0000000
--- a/meta/recipes-graphics/xorg-lib/xtrans/abstract_socket_fix.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 556a351de83fc6f401b02213dae95731553c216d Mon Sep 17 00:00:00 2001
-From: Loïc Minier <lool@dooz.org>
-Date: Mon, 24  Mar  2008  19:38:27  +0000
-Subject: Bug #10489: Don't retry unix socket connect()s on ENOENT.
-
-If the socket isn't there, it's not gonna magically appear.  Either it's
-a server socket and you should have just waited for the SIGUSR1 from the
-server, or it's a stale reference to an ICE socket.
-
-However, do retry once, so fallback from abstract to filesystem namespace
-works.
-
-Originally Debian bug #385976.
----
-diff --git a/Xtranssock.c b/Xtranssock.c
-index 8a7d2ec..da4afe9 100644
---- a/Xtranssock.c
-+++ b/Xtranssock.c
-@@ -2146,8 +2146,13 @@ TRANS(SocketUNIXConnect) (XtransConnInfo ciptr, char *host, char *port)
- 	    errno = olderrno;
- 	    
- 	    /*
--	     * If the error was ENOENT, the server may be starting up
--	     * and we should try again.
-+	     * If the error was ENOENT, the server may be starting up; we used
-+	     * to suggest to try again in this case with
-+	     * TRANS_TRY_CONNECT_AGAIN, but this introduced problems for
-+	     * processes still referencing stale sockets in their environment.
-+	     * Hence, we now return a hard error, TRANS_CONNECT_FAILED, and it
-+	     * is suggested that higher level stacks handle retries on their
-+	     * level when they face a slow starting server.
- 	     *
- 	     * If the error was EWOULDBLOCK or EINPROGRESS then the socket
- 	     * was non-blocking and we should poll using select
-@@ -2161,14 +2166,14 @@ TRANS(SocketUNIXConnect) (XtransConnInfo ciptr, char *host, char *port)
- 	    else if (olderrno == EINTR)
- 		return TRANS_TRY_CONNECT_AGAIN;
- 	    else if (olderrno == ENOENT) {
--		/*
--		* If opening as abstract socket failed, try again "normally"
--		*/
--		if (abstract)
-+		/* If opening as abstract socket failed, try again normally */
-+		if (abstract) {
- 		    ciptr->transptr->flags &= ~(TRANS_ABSTRACT);
--		return TRANS_TRY_CONNECT_AGAIN;
--	    }
--	    else {
-+		    return TRANS_TRY_CONNECT_AGAIN;
-+		} else {
-+		    return TRANS_CONNECT_FAILED;
-+		}
-+	    } else {
- 		PRMSG (2,"SocketUNIXConnect: Can't connect: errno = %d\n",
- 		       EGET(),0, 0);
- 
---
-cgit v0.7.2-37-g538c
diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch b/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
index 0c85cb0..ff8cb25 100644
--- a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
+++ b/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Add missing length fields to the replies. Without these, sanity checking in recent X
 breaks things.
 
diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
index b979f57..59a0b1f 100644
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- a/Makefile	2010-07-20 18:51:32.000000000 +0800
 +++ b/Makefile	2010-07-20 18:54:54.000000000 +0800
 @@ -4,7 +4,8 @@
diff --git a/meta/recipes-kernel/oprofile/oprofile/opstart.patch b/meta/recipes-kernel/oprofile/oprofile/opstart.patch
index d61c300..c588deb 100644
--- a/meta/recipes-kernel/oprofile/oprofile/opstart.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/opstart.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: oprofile/utils/Makefile.am
 ===================================================================
 --- oprofile.orig/utils/Makefile.am	2005-03-31 18:20:41.000000000 +0100
diff --git a/meta/recipes-kernel/oprofile/oprofile/xml_callgraph_details.patch b/meta/recipes-kernel/oprofile/oprofile/xml_callgraph_details.patch
deleted file mode 100644
index e5ab3d9..0000000
--- a/meta/recipes-kernel/oprofile/oprofile/xml_callgraph_details.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-Work in Progress- This patch breaks output_symbol_bytes
----
- ChangeLog                     |    9 +++++++++
- libpp/callgraph_container.cpp |   10 ++++++++--
- libpp/callgraph_container.h   |   14 ++++++++++----
- libpp/format_output.cpp       |   30 +++++++++++++++++++++++++-----
- libpp/format_output.h         |    6 +++---
- pp/opreport.cpp               |    5 +++--
- pp/opreport_options.cpp       |    4 ++--
- 7 files changed, 60 insertions(+), 18 deletions(-)
-
-Index: oprofile1/pp/opreport.cpp
-===================================================================
---- oprofile1.orig/pp/opreport.cpp	2007-05-24 15:32:20.000000000 +0100
-+++ oprofile1/pp/opreport.cpp	2007-05-24 20:07:14.000000000 +0100
-@@ -555,10 +555,11 @@ int opreport(options::spec const & spec)
- 
- 		output_diff_symbols(pc1, pc2, multiple_apps);
- 	} else if (options::callgraph) {
--		callgraph_container cg_container;
-+		callgraph_container cg_container(options::debug_info,
-+						 options::details);
- 		cg_container.populate(options::archive_path, iprofiles,
- 			options::extra_found_images,
--			options::debug_info, options::threshold,
-+			options::threshold,
- 			options::merge_by.lib, options::symbol_filter);
- 
- 		output_cg_symbols(cg_container, multiple_apps);
-Index: oprofile1/ChangeLog
-===================================================================
---- oprofile1.orig/ChangeLog	2007-05-24 18:30:47.000000000 +0100
-+++ oprofile1/ChangeLog	2007-05-24 20:07:14.000000000 +0100
-@@ -1,5 +1,14 @@
- 2007-05-24  Richard Purdie  <rpurdie@openedhand.com>
- 
-+	* libpp/callgraph_container.cpp:
-+	* libpp/callgraph_container.h:
-+	* libpp/format_output.cpp:
-+	* libpp/format_output.h:
-+	* pp/opreport.cpp:
-+	* pp/opreport_options.cpp: Add callgraph XML detail support
-+
-+2007-05-24  Richard Purdie  <rpurdie@openedhand.com>
-+
- 	* events/arm/xscale1/events:
- 	* events/arm/xscale2/events: Add extra Xscale PMU event definitions
- 
-Index: oprofile1/libpp/callgraph_container.cpp
-===================================================================
---- oprofile1.orig/libpp/callgraph_container.cpp	2007-05-24 15:32:20.000000000 +0100
-+++ oprofile1/libpp/callgraph_container.cpp	2007-05-24 20:07:14.000000000 +0100
-@@ -391,15 +391,21 @@ const symbol_collection & arc_recorder::
- 	return cg_syms;
- }
- 
-+callgraph_container::callgraph_container(bool debug_info, bool need_details)
-+	:
-+	pc(debug_info, need_details),
-+	debug_info(debug_info)
-+{
-+}
-+
- 
- void callgraph_container::populate(string const & archive_path, 
-    list<inverted_profile> const & iprofiles,
--   extra_images const & extra, bool debug_info, double threshold,
-+   extra_images const & extra, double threshold,
-    bool merge_lib, string_filter const & sym_filter)
- {
- 	// non callgraph samples container, we record sample at symbol level
- 	// not at vma level.
--	profile_container pc(debug_info, false);
- 
- 	list<inverted_profile>::const_iterator it;
- 	list<inverted_profile>::const_iterator const end = iprofiles.end();
-Index: oprofile1/libpp/callgraph_container.h
-===================================================================
---- oprofile1.orig/libpp/callgraph_container.h	2007-05-24 15:32:20.000000000 +0100
-+++ oprofile1/libpp/callgraph_container.h	2007-05-24 20:07:14.000000000 +0100
-@@ -19,8 +19,8 @@
- #include "symbol.h"
- #include "symbol_functors.h"
- #include "string_filter.h"
-+#include "profile_container.h"
- 
--class profile_container;
- class inverted_profile;
- class profile_t;
- class extra_images;
-@@ -103,6 +103,8 @@ private:
-  */
- class callgraph_container {
- public:
-+	callgraph_container(bool debug_info, bool need_details);
-+
- 	/**
- 	 * Populate the container, must be called once only.
- 	 * @param archive_path  oparchive prefix path
-@@ -118,9 +120,8 @@ public:
- 	 */
- 	void populate(std::string const & archive_path,
- 		      std::list<inverted_profile> const & iprofiles,
--		      extra_images const & extra, bool debug_info,
--		      double threshold, bool merge_lib,
--		      string_filter const & sym_filter);
-+		      extra_images const & extra, double threshold,
-+		      bool merge_lib, string_filter const & sym_filter);
- 
- 	/// return hint on how data must be displayed.
- 	column_flags output_hint() const;
-@@ -131,6 +132,9 @@ public:
- 	// return all the cg symbols
- 	const symbol_collection & get_symbols() const;
- 
-+	// profile container callgraph is based on
-+	profile_container pc;
-+
- private:
- 	/**
- 	 * Record caller/callee for one cg file
-@@ -162,6 +166,8 @@ private:
- 		      profile_container const & pc, bool debug_info,
- 		      bool merge_lib);
- 
-+	bool debug_info;
-+
- 	/// record all main symbols
- 	void add_symbols(profile_container const & pc);
- 
-Index: oprofile1/pp/opreport_options.cpp
-===================================================================
---- oprofile1.orig/pp/opreport_options.cpp	2007-05-24 15:32:20.000000000 +0100
-+++ oprofile1/pp/opreport_options.cpp	2007-05-24 20:07:14.000000000 +0100
-@@ -165,8 +165,8 @@ void check_options(bool diff)
- 
- 	if (callgraph) {
- 		symbols = true;
--		if (details) {
--			cerr << "--callgraph is incompatible with --details" << endl;
-+		if (details && !xml) {
-+			cerr << "--callgraph is incompatible with --details without --xml" << endl;
- 			do_exit = true;
- 		}
- 
-Index: oprofile1/libpp/format_output.cpp
-===================================================================
---- oprofile1.orig/libpp/format_output.cpp	2007-05-24 15:32:20.000000000 +0100
-+++ oprofile1/libpp/format_output.cpp	2007-05-24 20:07:14.000000000 +0100
-@@ -594,9 +594,9 @@ xml_formatter::
- xml_formatter(profile_container const * p,
- 		symbol_collection & s)
- 	:
-+	need_details(false),
- 	profile(p),
--	symbols(s),
--	need_details(false)
-+	symbols(s)
- {
- 	if (profile)
- 		counts.total = profile->samples_count();
-@@ -673,8 +673,8 @@ void xml_formatter::output_symbol_data(o
- 			if (name.size() > 0 && name[0] != '?') {
- 				output_attribute(out, datum, ff_vma, STARTING_ADDR);
- 
--				if (need_details)
--					xml_support->output_symbol_bytes(bytes_out, symb, sd_it->second);
-+				//if (need_details)
-+				//	xml_support->output_symbol_bytes(bytes_out, symb, sd_it->second);
- 			}
- 			out << close_element();
- 
-@@ -843,7 +843,7 @@ output_attribute(ostream & out, field_da
- xml_cg_formatter::
- xml_cg_formatter(callgraph_container const * cg, symbol_collection & s)
- 	:
--	xml_formatter(0, s),
-+	xml_formatter(&cg->pc, s),
- 	callgraph(cg)
- {
- 	counts.total = callgraph->samples_count();
-@@ -946,6 +946,26 @@ output_symbol(ostream & out,
- 
- 	out << init_attr(ID_REF, indx);
- 
-+	if (need_details) {
-+		ostringstream details;
-+		symbol_details_t & sd = symbol_details[indx];
-+		size_t const detail_lo = sd.index;
-+
-+		string detail_str = output_symbol_details(symb, sd.index, lo, hi);
-+
-+		if (detail_str.size() > 0) {
-+			if (sd.id < 0)
-+				sd.id = indx;
-+			details << detail_str;
-+		}
-+
-+		if (sd.index > detail_lo) {
-+			sd.details = sd.details + details.str();
-+			out << init_attr(DETAIL_LO, detail_lo);
-+			out << init_attr(DETAIL_HI, sd.index-1);
-+		}
-+	}
-+
- 	out << close_element(NONE, true);
- 
- 	out << open_element(CALLERS);
-Index: oprofile1/libpp/format_output.h
-===================================================================
---- oprofile1.orig/libpp/format_output.h	2007-05-24 15:32:20.000000000 +0100
-+++ oprofile1/libpp/format_output.h	2007-05-24 20:07:14.000000000 +0100
-@@ -249,6 +249,9 @@ public:
- 	// output SymbolData XML elements
- 	void output_symbol_data(std::ostream & out);
- 
-+	/// true if we need to show details for each symbols
-+	bool need_details;
-+
- private:
- 	/// container we work from
- 	profile_container const * profile;
-@@ -256,9 +259,6 @@ private:
- 	// ordered collection of symbols associated with this profile
- 	symbol_collection & symbols;
- 
--	/// true if we need to show details for each symbols
--	bool need_details;
--
- 	// count of DetailData items output so far
- 	size_t detail_count;
- 
diff --git a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch b/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
index e837765..ae4cf5d 100644
--- a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
+++ b/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [this patch is 1.13 specific and 2.0 will be coming.]
+
 Running PowerTop in Poky in dump mode (with --dump) always ends with a
 segmentation fault.
 
diff --git a/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch b/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch
index e06f029..baf06d6 100644
--- a/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch
+++ b/meta/recipes-sato/settings-daemon/files/addsoundkeys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: settings-daemon/settings-daemon.c
 ===================================================================
 --- settings-daemon.orig/settings-daemon.c	2009-05-22 14:57:05.000000000 +0100
diff --git a/meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
index 5fd96d4..5943744 100644
--- a/meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 after gcc linking has changed, all the libraries must be explicitely specified to for linking. 
 This patch avoids this linking error:
 
-- 
1.7.1.1



