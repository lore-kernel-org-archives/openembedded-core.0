Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T1DAy-0004jr-PB
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 11:12:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2012 02:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,765,1336374000"; d="scan'208";a="200505555"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2012 02:00:39 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 12:02:36 +0300
Message-Id: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 14 Aug 2012 09:12:37 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../B921600.patch                                  |    0
 .../busybox-appletlib-dependency.patch             |    0
 .../busybox-mkfs-minix-tests_bigendian.patch       |    0
 .../busybox-udhcpc-no_deconfig.patch               |   37 +++++++++-----------
 .../{busybox-1.19.4 => busybox-1.20.2}/defconfig   |    0
 .../fix-for-spurious-testsuite-failure.patch       |    0
 .../get_header_tar.patch                           |    0
 .../run-parts.in.usr-bin.patch                     |    0
 .../sys_resource.patch                             |    0
 .../watch.in.usr-bin.patch                         |    0
 .../wget_dl_dir_fix.patch                          |    0
 .../{busybox_1.19.4.bb => busybox_1.20.2.bb}       |    6 ++--
 12 files changed, 20 insertions(+), 23 deletions(-)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/B921600.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/busybox-mkfs-minix-tests_bigendian.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/busybox-udhcpc-no_deconfig.patch (78%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/fix-for-spurious-testsuite-failure.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/run-parts.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/sys_resource.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/watch.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.19.4 => busybox-1.20.2}/wget_dl_dir_fix.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.19.4.bb => busybox_1.20.2.bb} (87%)

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/B921600.patch b/meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/B921600.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/busybox-appletlib-dependency.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
similarity index 78%
rename from meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
index 13004f7..4c9ce3b 100644
--- a/meta/recipes-core/busybox/busybox-1.19.4/busybox-udhcpc-no_deconfig.patch
+++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
@@ -31,10 +31,10 @@ Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
  networking/udhcp/dhcpc.c |   29 +++++++++++++++++++++--------
  1 files changed, 21 insertions(+), 8 deletions(-)
 
-diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
-index 4d755e6..a21e2c6 100644
---- a/networking/udhcp/dhcpc.c
-+++ b/networking/udhcp/dhcpc.c
+Index: busybox-1.20.2/networking/udhcp/dhcpc.c
+===================================================================
+--- busybox-1.20.2.orig/networking/udhcp/dhcpc.c
++++ busybox-1.20.2/networking/udhcp/dhcpc.c
 @@ -29,6 +29,9 @@
  #include <netpacket/packet.h>
  #include <linux/filter.h>
@@ -42,10 +42,10 @@ index 4d755e6..a21e2c6 100644
 +/* option whether to down the interface when reconfiguring */
 +static int allow_deconfig = 1;
 +
- /* struct client_config_t client_config is in bb_common_bufsiz1 */
+ /* "struct client_config_t client_config" is in bb_common_bufsiz1 */
  
  
-@@ -82,8 +85,9 @@ enum {
+@@ -81,8 +84,9 @@ enum {
  	OPT_x = 1 << 18,
  	OPT_f = 1 << 19,
  	OPT_B = 1 << 20,
@@ -56,7 +56,7 @@ index 4d755e6..a21e2c6 100644
  	USE_FOR_MMU(             OPTBIT_b,)
  	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
  	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -899,7 +903,8 @@ static void perform_renew(void)
+@@ -1040,7 +1044,8 @@ static void perform_renew(void)
  		state = RENEW_REQUESTED;
  		break;
  	case RENEW_REQUESTED: /* impatient are we? fine, square 1 */
@@ -66,7 +66,7 @@ index 4d755e6..a21e2c6 100644
  	case REQUESTING:
  	case RELEASED:
  		change_listen_mode(LISTEN_RAW);
-@@ -923,7 +928,8 @@ static void perform_release(uint32_t requested_ip, uint32_t server_addr)
+@@ -1064,7 +1069,8 @@ static void perform_release(uint32_t ser
  		bb_info_msg("Unicasting a release of %s to %s",
  				inet_ntoa(temp_addr), buffer);
  		send_release(server_addr, requested_ip); /* unicast */
@@ -76,16 +76,16 @@ index 4d755e6..a21e2c6 100644
  	}
  	bb_info_msg("Entering released state");
  
-@@ -1083,7 +1089,7 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
- #endif
- 		;
+@@ -1215,7 +1221,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+ 	/* O,x: list; -T,-t,-A take numeric param */
+ 	opt_complementary = "O::x::T+:t+:A+" IF_UDHCP_VERBOSE(":vv") ;
  	IF_LONG_OPTS(applet_long_options = udhcpc_longopts;)
 -	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fB"
 +	opt = getopt32(argv, "CV:H:h:F:i:np:qRr:s:T:t:SA:O:ox:fBD"
  		USE_FOR_MMU("b")
  		IF_FEATURE_UDHCPC_ARPING("a")
  		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1175,6 +1181,9 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1316,6 +1322,9 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  		logmode |= LOGMODE_SYSLOG;
  	}
  
@@ -95,7 +95,7 @@ index 4d755e6..a21e2c6 100644
  	/* Make sure fd 0,1,2 are open */
  	bb_sanitize_stdio();
  	/* Equivalent of doing a fflush after every \n */
-@@ -1189,7 +1198,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1330,7 +1339,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  	srand(monotonic_us());
  
  	state = INIT_SELECTING;
@@ -105,7 +105,7 @@ index 4d755e6..a21e2c6 100644
  	change_listen_mode(LISTEN_RAW);
  	packet_num = 0;
  	timeout = 0;
-@@ -1341,7 +1351,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1484,7 +1494,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  				}
  				/* Timed out, enter init state */
  				bb_info_msg("Lease lost, entering init state");
@@ -115,8 +115,8 @@ index 4d755e6..a21e2c6 100644
  				state = INIT_SELECTING;
  				client_config.first_secs = 0; /* make secs field count from 0 */
  				/*timeout = 0; - already is */
-@@ -1489,7 +1500,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
- 						send_decline(xid, server_addr, packet.yiaddr);
+@@ -1667,7 +1678,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+ 						send_decline(/*xid,*/ server_addr, packet.yiaddr);
  
  						if (state != REQUESTING)
 -							udhcp_run_script(NULL, "deconfig");
@@ -125,7 +125,7 @@ index 4d755e6..a21e2c6 100644
  						change_listen_mode(LISTEN_RAW);
  						state = INIT_SELECTING;
  						client_config.first_secs = 0; /* make secs field count from 0 */
-@@ -1536,7 +1548,8 @@ int udhcpc_main(int argc UNUSED_PARAM, char **argv)
+@@ -1711,7 +1723,8 @@ int udhcpc_main(int argc UNUSED_PARAM, c
  				bb_info_msg("Received DHCP NAK");
  				udhcp_run_script(&packet, "nak");
  				if (state != REQUESTING)
@@ -135,6 +135,3 @@ index 4d755e6..a21e2c6 100644
  				change_listen_mode(LISTEN_RAW);
  				sleep(3); /* avoid excessive network traffic */
  				state = INIT_SELECTING;
--- 
-1.7.7.1
-
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/defconfig b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/defconfig
rename to meta/recipes-core/busybox/busybox-1.20.2/defconfig
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch b/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/get_header_tar.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/run-parts.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch b/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/sys_resource.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch
diff --git a/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch b/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
similarity index 100%
rename from meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch
rename to meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
similarity index 87%
rename from meta/recipes-core/busybox/busybox_1.19.4.bb
rename to meta/recipes-core/busybox/busybox_1.20.2.bb
index 2e262ca..ac92a8c 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r13"
+PR = "r0"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -27,7 +27,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-mkfs-minix-tests_bigendian.patch \
            file://fix-for-spurious-testsuite-failure.patch"
 
-SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
-SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"
+SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
+SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.7.9.5



