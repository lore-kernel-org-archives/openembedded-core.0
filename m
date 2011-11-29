Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXD3-0003Ro-0u
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086469"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:52 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:19 +0800
Message-Id: <402e5d95c06f6a8c55ffb198b72d91faf135ed30.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 8/8] busybox: Upgrade to 1.19.3
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:35 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-udhcpc-no_deconfig.patch               |   51 ++++++++++----------
 .../{busybox-1.18.5 => busybox-1.19.3}/defconfig   |    0
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |   25 +++++-----
 .../udhcpc-fix-nfsroot.patch                       |    0
 .../udhcpscript.patch                              |    0
 .../{busybox_1.18.5.bb => busybox_1.19.3.bb}       |    6 +-
 9 files changed, 42 insertions(+), 40 deletions(-)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/busybox-udhcpc-no_deconfig.patch (74%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/run-parts.in.usr-bin.patch (46%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpc-fix-nfsroot.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.18.5 => busybox-1.19.3}/udhcpscript.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.18.5.bb => busybox_1.19.3.bb} (85%)

diff --git a/meta/recipes-core/busybox/busybox-1.18.5/B921600.patch b/meta/recipes-core/busybox/busybox-1.19.3/B921600.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/B921600.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/B921600.patch
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.19.3/busybox-appletlib-dependency.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/busybox-appletlib-dependency.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/busybox-appletlib-dependency.patch
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch
similarity index 74%
rename from meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch
index 405d482..e7c1a6a 100644
--- a/meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox-1.19.3/busybox-udhcpc-no_deconfig.patch
@@ -15,11 +15,12 @@ option spec is changed
 
 Signed-off-by: Qing He <qing.he@intel.com>
 
-diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/udhcp/dhcpc.c
---- busybox-1.17.3.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.17.3/networking/udhcp/dhcpc.c
-@@ -35,6 +35,9 @@
- #endif
+Index: busybox-1.19.3/networking/udhcp/dhcpc.c
+===================================================================
+--- busybox-1.19.3.orig/networking/udhcp/dhcpc.c	2011-09-06 10:35:17.000000000 +0800
++++ busybox-1.19.3/networking/udhcp/dhcpc.c	2011-11-29 20:22:51.000000000 +0800
+@@ -29,6 +29,9 @@
+ #include <netpacket/packet.h>
  #include <linux/filter.h>
  
 +/* option whether to down the interface when reconfiguring */
@@ -28,7 +29,15 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  /* struct client_config_t client_config is in bb_common_bufsiz1 */
  
  
-@@ -709,7 +712,8 @@
+@@ -82,6 +85,7 @@
+ 	OPT_x = 1 << 18,
+ 	OPT_f = 1 << 19,
+ 	OPT_B = 1 << 20,
++	OPT_D = 1 << 21,
+ /* The rest has variable bit positions, need to be clever */
+ 	OPTBIT_B = 20,
+ 	USE_FOR_MMU(             OPTBIT_b,)
+@@ -899,7 +903,8 @@
  		state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
@@ -38,7 +47,7 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -733,7 +737,8 @@
+@@ -923,7 +928,8 @@
  		bb_info_msg("Unicasting a release of %s to %s",
  				inet_ntoa(temp_addr), buffer);
  		send_release(server_addr, requested_ip); /* unicast */
@@ -48,24 +57,16 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	}
  	bb_info_msg("Entering released state");
  
-@@ -836,6 +841,7 @@
- 		OPT_o = 1 << 17,
- 		OPT_x = 1 << 18,
- 		OPT_f = 1 << 19,
-+		OPT_D = 1 << 20,
- /* The rest has variable bit positions, need to be clever */
- 		OPTBIT_f = 20,
- 		USE_FOR_MMU(             OPTBIT_b,)
-@@ -861,7 +867,7 @@
+@@ -1083,7 +1089,7 @@
  #endif
  		;
  	IF_LONG_OPTS(applet_long_options = udhcpc_longopts;)
--	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:f"
-+	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fD"
+-	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fB"
++	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -950,6 +956,9 @@
+@@ -1175,6 +1181,9 @@
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -75,7 +76,7 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	/* Make sure fd 0,1,2 are open */
  	bb_sanitize_stdio();
  	/* Equivalent of doing a fflush after every \n */
-@@ -964,7 +973,8 @@
+@@ -1189,7 +1198,8 @@
  	srand(monotonic_us());
  
  	state = INIT_SELECTING;
@@ -85,7 +86,7 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1100,7 +1110,8 @@
+@@ -1341,7 +1351,8 @@
  				}
  				/* Timed out, enter init state */
  				bb_info_msg("Lease lost, entering init state");
@@ -93,9 +94,9 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
 +				if (allow_deconfig)
 +					udhcp_run_script(NULL, "deconfig");
  				state = INIT_SELECTING;
+ 				client_config.first_secs = 0; /* make secs field count from 0 */
  				/*timeout = 0; - already is */
- 				packet_num = 0;
-@@ -1246,7 +1257,8 @@
+@@ -1489,7 +1500,8 @@
  						send_decline(xid, server_addr, packet.yiaddr);
  
  						if (state != REQUESTING)
@@ -104,8 +105,8 @@ diff -ur busybox-1.17.3.orig/networking/udhcp/dhcpc.c busybox-1.17.3/networking/
 +								udhcp_run_script(NULL, "deconfig");
  						change_listen_mode(LISTEN_RAW);
  						state = INIT_SELECTING;
- 						requested_ip = 0;
-@@ -1292,7 +1304,8 @@
+ 						client_config.first_secs = 0; /* make secs field count from 0 */
+@@ -1536,7 +1548,8 @@
  				bb_info_msg("Received DHCP NAK");
  				udhcp_run_script(&packet, "nak");
  				if (state != REQUESTING)
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/defconfig
rename to meta/recipes-core/busybox/busybox-1.19.3/defconfig
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.19.3/get_header_tar.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/get_header_tar.patch
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch
similarity index 46%
rename from meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch
index 7d532e6..5fcce63 100644
--- a/meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch
+++ b/meta/recipes-core/busybox/busybox-1.19.3/run-parts.in.usr-bin.patch
@@ -15,15 +15,16 @@ Upstream-Status: Inappropriate [configuration]
 # Poky doesn't have debianutils, but let's keep it for safety
 # above comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
 
-diff -uNr busybox-1.15.3.orig//include/applets.src.h busybox-1.15.3/include/applets.src.h
---- busybox-1.15.3.orig//include/applets.src.h	2009-12-12 22:13:28.000000000 +0100
-+++ busybox-1.15.3/include/applets.src.h	2010-04-30 15:35:40.000000000 +0200
-@@ -323,7 +323,7 @@
- IF_RPM(APPLET(rpm, _BB_DIR_BIN, _BB_SUID_DROP))
- IF_RPM2CPIO(APPLET(rpm2cpio, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RTCWAKE(APPLET(rtcwake, _BB_DIR_USR_BIN, _BB_SUID_DROP))
--IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_BIN, _BB_SUID_DROP, run_parts))
-+IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_USR_BIN, _BB_SUID_DROP, run_parts))
- IF_RUNCON(APPLET(runcon, _BB_DIR_USR_BIN, _BB_SUID_DROP))
- IF_RUNLEVEL(APPLET(runlevel, _BB_DIR_SBIN, _BB_SUID_DROP))
- IF_RUNSV(APPLET(runsv, _BB_DIR_USR_BIN, _BB_SUID_DROP))
+Index: busybox-1.19.3/include/applets.src.h
+===================================================================
+--- busybox-1.19.3.orig/include/applets.src.h	2011-09-06 10:35:36.000000000 +0800
++++ busybox-1.19.3/include/applets.src.h	2011-11-29 20:12:22.000000000 +0800
+@@ -306,7 +306,7 @@
+ IF_RPM(APPLET(rpm, BB_DIR_BIN, BB_SUID_DROP))
+ IF_RPM2CPIO(APPLET(rpm2cpio, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_BIN, BB_SUID_DROP))
+-IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_BIN, BB_SUID_DROP, run_parts))
++IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_USR_BIN, BB_SUID_DROP, run_parts))
+ IF_RUNCON(APPLET(runcon, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_RUNLEVEL(APPLET(runlevel, BB_DIR_SBIN, BB_SUID_DROP))
+ IF_RUNSV(APPLET(runsv, BB_DIR_USR_BIN, BB_SUID_DROP))
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.patch b/meta/recipes-core/busybox/busybox-1.19.3/udhcpc-fix-nfsroot.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/udhcpc-fix-nfsroot.patch
diff --git a/meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch b/meta/recipes-core/busybox/busybox-1.19.3/udhcpscript.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch
rename to meta/recipes-core/busybox/busybox-1.19.3/udhcpscript.patch
diff --git a/meta/recipes-core/busybox/busybox_1.18.5.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
similarity index 85%
rename from meta/recipes-core/busybox/busybox_1.18.5.bb
rename to meta/recipes-core/busybox/busybox_1.19.3.bb
index 17d583e..08e7909 100644
--- a/meta/recipes-core/busybox/busybox_1.18.5.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
@@ -25,7 +25,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://umount.busybox \
            file://defconfig"
 
-SRC_URI[tarball.md5sum] = "96dd43cc7cee4017a6bf31b7da82a1f5"
-SRC_URI[tarball.sha256sum] = "10954fcd5c48d8a262a3497b16227bf983a05658bf2bf661af2fdeca773f2fc0"
+SRC_URI[tarball.md5sum] = "c3938e1ac59602387009bbf1dd1af7f6"
+SRC_URI[tarball.sha256sum] = "a1a9a35732c719ef384f02b6e357c324d8be25bc154af91a48c4264b1e6038f0"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.7.1



