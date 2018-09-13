Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id AEC5A79941
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 19:04:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v26-v6so5532972ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qm9B47esNQgQLkbuNaSuKvzZiiIf8n52wX5kCjdvIrs=;
	b=EPYIkRnQ4lQtnceZRxfhiZWgdpwzYJiC9G1GvciZ4JxvwX6zEO5/7oCe0u0RGUCmOg
	o3k6iYSeDTQeiwE0+yyouC0sUfjYiUza5jgWHVET65ypdHQj1EFa+73gl48WVLoNScdN
	bSsfTx7r8lfRCDfYTtNxbVm7nqmXIbZVA116Bd2vv7QHr/Ad465+B61fSaA1SrsqH487
	stIpu9q2pehDCqr1nf+0ga2IgyeuXfej5HkoKvf3bPDa043r9Y2QQhQAN/kbMwIZ5Dkg
	ZmLKNJD32VdwIRGKyNYIKeHUqK5OxFIogBgc/zFVg5nfSfORJIs2dFLixioryMkzdMtq
	iIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qm9B47esNQgQLkbuNaSuKvzZiiIf8n52wX5kCjdvIrs=;
	b=INm46oGE657ucnMMkuQptkMCIdRcDeKizKDCb/9CRctHjfBQwMY/AAPE1WqgCSjNoZ
	HWjwxBF3955NnyuBLmg35CorwILRqTtNlVVxSh/1UaOeZJomtyBX3diMFym1ig2DYhxO
	l1jeIn6+wDGnVaMlKYRqXMXM4aOXpE+gd/mq3Il+HRjxqMWTv1L8S5fjlZBJR/+oLt/o
	2d4HKY5NqPIEHj/cweqaIk445czyyO+y39TO1d01owyy6ALGPWCr4vckj03IvgozWolA
	/SRf67LmJSzO8KN0hylBTO6RGoO+zByQpD9IJk/YeMgn0ou86H9IBV+RMVeVmTS+Vyo4
	pgGA==
X-Gm-Message-State: APzg51ABYNb340e1rvE9ejA8SdP94xn8vHMYGk/9x6LHmaaTb4p427/V
	ebej4Qf3kNEEBNWhBufz6hIbtd89G9o=
X-Google-Smtp-Source: ANB0VdbNONFDbz3HGWW2WkuEa72v8EfTtLG6h/9QegJ7deRKbb3FX1oQVMgE2sMni2p86NFoEw7KoA==
X-Received: by 2002:a2e:9095:: with SMTP id
	l21-v6mr5735951ljg.15.1536865487023; 
	Thu, 13 Sep 2018 12:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:b821:e49c:2197:f50])
	by smtp.gmail.com with ESMTPSA id
	f25-v6sm812158ljc.97.2018.09.13.12.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 12:04:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2018 21:04:44 +0200
Message-Id: <20180913190444.9320-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [PATCH] connman: update to 1.36
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
X-List-Received-Date: Thu, 13 Sep 2018 19:04:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-connectivity/connman/connman.inc |   2 +-
 ...> 0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch} | 446 ++++++++----------
 ...tls-Fix-a-crash-using-wispr-over-TLS.patch |  41 --
 ...refixlen-to-iproute_default_function.patch |  63 ---
 ...eep-track-of-addr-in-fw_snat-session.patch | 112 -----
 ...ubnet-route-creation-deletion-in-ipr.patch |  69 ---
 ...PIs-for-creating-and-deleting-subnet.patch |  68 ---
 ...net-route-creation-and-deletion-APIs.patch |  77 ---
 .../connman/connman_1.35.bb                   |  22 -
 .../connman/connman_1.36.bb                   |  17 +
 10 files changed, 212 insertions(+), 705 deletions(-)
 rename meta/recipes-connectivity/connman/connman/{includes.patch => 0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch} (68%)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_1.35.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.36.bb

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 2b03f9cb06..0ba375137d 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -156,7 +156,7 @@ RDEPENDS_${PN}-client ="${PN}"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} ${datadir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
             ${datadir}/dbus-1/system-services/* \
             ${sysconfdir}/tmpfiles.d/connman_resolvconf.conf"
diff --git a/meta/recipes-connectivity/connman/connman/includes.patch b/meta/recipes-connectivity/connman/connman/0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch
similarity index 68%
rename from meta/recipes-connectivity/connman/connman/includes.patch
rename to meta/recipes-connectivity/connman/connman/0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch
index 55cb187931..e826bf002d 100644
--- a/meta/recipes-connectivity/connman/connman/includes.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch
@@ -1,36 +1,40 @@
-Fix various issues which cause problems under musl.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 630516bcc0233b047f65665c003201ba6e77453d Mon Sep 17 00:00:00 2001
+From 56fc228eebadc546d969a7073caf14d465ef3e5a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 9 Aug 2016 16:22:36 +0100
-Subject: [PATCH 1/3] Use AC_USE_SYSTEM_EXTENSIONS
+Date: Thu, 13 Sep 2018 19:57:54 +0200
+Subject: [PATCH] Use AC_USE_SYSTEM_EXTENSIONS
 
-Instead of using #define _GNU_SOURCE in some source files which causes problems
-when building with musl as more files need the define, simply use
-AC_USE_SYSTEM_EXTENSIONS in configure.ac to get it defined globally.
+Instead of using #define _GNU_SOURCE in some source files which causes
+problems when building with musl as more files need the define, simply
+use AC_USE_SYSTEM_EXTENSIONS in configure.ac to get it defined globally.
 ---
- configure.ac       | 1 +
- gdhcp/client.c     | 1 -
- plugins/tist.c     | 1 -
- src/backtrace.c    | 1 -
- src/inet.c         | 1 -
- src/log.c          | 1 -
- src/ntp.c          | 1 -
- src/resolver.c     | 1 -
- src/rfkill.c       | 1 -
- src/stats.c        | 1 -
- src/timezone.c     | 1 -
- tools/stats-tool.c | 1 -
- tools/tap-test.c   | 1 -
- tools/wispr.c      | 1 -
- vpn/plugins/vpn.c  | 1 -
- 15 files changed, 1 insertion(+), 14 deletions(-)
+ configure.ac                 | 3 +++
+ gdhcp/client.c               | 1 -
+ gdhcp/common.h               | 5 +++--
+ gweb/gresolv.c               | 2 ++
+ plugins/tist.c               | 1 -
+ plugins/wifi.c               | 3 +--
+ src/backtrace.c              | 1 -
+ src/inet.c                   | 1 -
+ src/ippool.c                 | 1 -
+ src/iptables.c               | 2 +-
+ src/log.c                    | 1 -
+ src/ntp.c                    | 1 -
+ src/resolver.c               | 1 -
+ src/rfkill.c                 | 1 -
+ src/stats.c                  | 1 -
+ src/tethering.c              | 2 --
+ src/timezone.c               | 1 -
+ tools/dhcp-test.c            | 1 -
+ tools/dnsproxy-test.c        | 1 +
+ tools/private-network-test.c | 2 +-
+ tools/stats-tool.c           | 1 -
+ tools/tap-test.c             | 3 +--
+ tools/wispr.c                | 1 -
+ vpn/plugins/vpn.c            | 1 -
+ 24 files changed, 13 insertions(+), 25 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6e66ab3..bacf5ec 100644
+index 39745f76..984126c2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -20,6 +20,7 @@ AC_SUBST(abs_top_srcdir)
@@ -41,8 +45,17 @@ index 6e66ab3..bacf5ec 100644
  
  AC_PROG_CC
  AM_PROG_CC_C_O
+@@ -185,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
+ AC_CHECK_HEADERS([execinfo.h])
+ AM_CONDITIONAL([BACKTRACE], [test "${ac_cv_header_execinfo_h}" = "yes"])
+ 
++AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#include <netinet/in.h>]])
++
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+ 			AC_MSG_ERROR(signalfd support is required))
+ 
 diff --git a/gdhcp/client.c b/gdhcp/client.c
-index fbb40ab..3aeb089 100644
+index 67357782..c7db76f0 100644
 --- a/gdhcp/client.c
 +++ b/gdhcp/client.c
 @@ -23,7 +23,6 @@
@@ -53,8 +66,49 @@ index fbb40ab..3aeb089 100644
  #include <stdio.h>
  #include <errno.h>
  #include <unistd.h>
+diff --git a/gdhcp/common.h b/gdhcp/common.h
+index 75abc183..6899499e 100644
+--- a/gdhcp/common.h
++++ b/gdhcp/common.h
+@@ -19,6 +19,7 @@
+  *
+  */
+ 
++#include <config.h>
+ #include <netinet/udp.h>
+ #include <netinet/ip.h>
+ 
+@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_lengths[] = {
+ 	[OPTION_U32]	= 4,
+ };
+ 
+-/* already defined within netinet/in.h if using GNU compiler */
+-#ifndef __USE_GNU
++/* already defined within netinet/in.h if using glibc or musl */
++#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
+ struct in6_pktinfo {
+ 	struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
+ 	unsigned int ipi6_ifindex;  /* send/recv interface index */
+diff --git a/gweb/gresolv.c b/gweb/gresolv.c
+index 81c79b6c..180e57ba 100644
+--- a/gweb/gresolv.c
++++ b/gweb/gresolv.c
+@@ -23,11 +23,13 @@
+ #include <config.h>
+ #endif
+ 
++#include <ctype.h>
+ #include <errno.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <stdio.h>
+ #include <resolv.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
 diff --git a/plugins/tist.c b/plugins/tist.c
-index ad5ef79..cc2800a 100644
+index ad5ef79e..cc2800a1 100644
 --- a/plugins/tist.c
 +++ b/plugins/tist.c
 @@ -23,7 +23,6 @@
@@ -65,8 +119,23 @@ index ad5ef79..cc2800a 100644
  #include <stdio.h>
  #include <stdbool.h>
  #include <stdlib.h>
+diff --git a/plugins/wifi.c b/plugins/wifi.c
+index dc08c6af..46e4cca4 100644
+--- a/plugins/wifi.c
++++ b/plugins/wifi.c
+@@ -30,9 +30,8 @@
+ #include <string.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+-#include <linux/if_arp.h>
+-#include <linux/wireless.h>
+ #include <net/ethernet.h>
++#include <linux/wireless.h>
+ 
+ #ifndef IFF_LOWER_UP
+ #define IFF_LOWER_UP	0x10000
 diff --git a/src/backtrace.c b/src/backtrace.c
-index 6a66c0a..4dbdda8 100644
+index e8d7f432..bede6698 100644
 --- a/src/backtrace.c
 +++ b/src/backtrace.c
 @@ -24,7 +24,6 @@
@@ -78,7 +147,7 @@ index 6a66c0a..4dbdda8 100644
  #include <unistd.h>
  #include <stdlib.h>
 diff --git a/src/inet.c b/src/inet.c
-index 69ded19..81d92c2 100644
+index a31372b5..a58ce7c1 100644
 --- a/src/inet.c
 +++ b/src/inet.c
 @@ -25,7 +25,6 @@
@@ -89,8 +158,33 @@ index 69ded19..81d92c2 100644
  #include <stdio.h>
  #include <errno.h>
  #include <unistd.h>
+diff --git a/src/ippool.c b/src/ippool.c
+index cea1dccd..8a645da2 100644
+--- a/src/ippool.c
++++ b/src/ippool.c
+@@ -28,7 +28,6 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+-#include <sys/errno.h>
+ #include <sys/socket.h>
+ 
+ #include "connman.h"
+diff --git a/src/iptables.c b/src/iptables.c
+index f3670e77..469effed 100644
+--- a/src/iptables.c
++++ b/src/iptables.c
+@@ -28,7 +28,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <sys/socket.h>
+ #include <xtables.h>
+ #include <inttypes.h>
 diff --git a/src/log.c b/src/log.c
-index 9bae4a3..f7e82e5 100644
+index 9bae4a3d..f7e82e5d 100644
 --- a/src/log.c
 +++ b/src/log.c
 @@ -23,7 +23,6 @@
@@ -102,7 +196,7 @@ index 9bae4a3..f7e82e5 100644
  #include <unistd.h>
  #include <stdarg.h>
 diff --git a/src/ntp.c b/src/ntp.c
-index dd246eb..db8ae96 100644
+index 51ba9aac..724ca188 100644
 --- a/src/ntp.c
 +++ b/src/ntp.c
 @@ -23,7 +23,6 @@
@@ -114,7 +208,7 @@ index dd246eb..db8ae96 100644
  #include <fcntl.h>
  #include <unistd.h>
 diff --git a/src/resolver.c b/src/resolver.c
-index fbe4be7..ef61f92 100644
+index 76f0a8e1..10121aa5 100644
 --- a/src/resolver.c
 +++ b/src/resolver.c
 @@ -23,7 +23,6 @@
@@ -126,7 +220,7 @@ index fbe4be7..ef61f92 100644
  #include <errno.h>
  #include <fcntl.h>
 diff --git a/src/rfkill.c b/src/rfkill.c
-index 2bfb092..af49d12 100644
+index d9bed4d2..b2514c41 100644
 --- a/src/rfkill.c
 +++ b/src/rfkill.c
 @@ -23,7 +23,6 @@
@@ -138,7 +232,7 @@ index 2bfb092..af49d12 100644
  #include <errno.h>
  #include <fcntl.h>
 diff --git a/src/stats.c b/src/stats.c
-index 26343b1..cfcdc94 100644
+index 663bc382..c9ddc2e8 100644
 --- a/src/stats.c
 +++ b/src/stats.c
 @@ -23,7 +23,6 @@
@@ -149,8 +243,21 @@ index 26343b1..cfcdc94 100644
  #include <errno.h>
  #include <sys/mman.h>
  #include <sys/types.h>
+diff --git a/src/tethering.c b/src/tethering.c
+index 4b202369..f3cb36f4 100644
+--- a/src/tethering.c
++++ b/src/tethering.c
+@@ -34,8 +34,6 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+-#include <linux/sockios.h>
+-#include <linux/if_tun.h>
+ #include <linux/if_bridge.h>
+ 
+ #include "connman.h"
 diff --git a/src/timezone.c b/src/timezone.c
-index e346b11..8e91267 100644
+index e346b11a..8e912670 100644
 --- a/src/timezone.c
 +++ b/src/timezone.c
 @@ -23,7 +23,6 @@
@@ -161,216 +268,8 @@ index e346b11..8e91267 100644
  #include <errno.h>
  #include <stdio.h>
  #include <fcntl.h>
-diff --git a/tools/stats-tool.c b/tools/stats-tool.c
-index b076478..428d94b 100644
---- a/tools/stats-tool.c
-+++ b/tools/stats-tool.c
-@@ -22,7 +22,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <sys/mman.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-diff --git a/tools/tap-test.c b/tools/tap-test.c
-index fdc098a..57917f5 100644
---- a/tools/tap-test.c
-+++ b/tools/tap-test.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <errno.h>
- #include <fcntl.h>
-diff --git a/tools/wispr.c b/tools/wispr.c
-index d5f9341..e56dfc1 100644
---- a/tools/wispr.c
-+++ b/tools/wispr.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <fcntl.h>
- #include <unistd.h>
-diff --git a/vpn/plugins/vpn.c b/vpn/plugins/vpn.c
-index 9a42385..479c3a7 100644
---- a/vpn/plugins/vpn.c
-+++ b/vpn/plugins/vpn.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <string.h>
- #include <fcntl.h>
- #include <unistd.h>
--- 
-2.8.1
-
-
-From b8b7878e6cb2a1ed4fcfa256f7e232511a40e3d9 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 9 Aug 2016 15:37:50 +0100
-Subject: [PATCH 2/3] Check for in6_pktinfo.ipi6_addr explicitly
-
-Instead of assuming that just glibc has this structure, check for it at
-configure as musl also has it.
-
-Based on work by Khem Raj <raj.khem@gmail.com>.
----
- configure.ac   | 2 ++
- gdhcp/common.h | 5 +++--
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bacf5ec..ad00456 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -186,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
- AC_CHECK_HEADERS([execinfo.h])
- AM_CONDITIONAL([BACKTRACE], [test "${ac_cv_header_execinfo_h}" = "yes"])
- 
-+AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#include <netinet/in.h>]])
-+
- AC_CHECK_FUNC(signalfd, dummy=yes,
- 			AC_MSG_ERROR(signalfd support is required))
- 
-diff --git a/gdhcp/common.h b/gdhcp/common.h
-index 75abc18..6899499 100644
---- a/gdhcp/common.h
-+++ b/gdhcp/common.h
-@@ -19,6 +19,7 @@
-  *
-  */
- 
-+#include <config.h>
- #include <netinet/udp.h>
- #include <netinet/ip.h>
- 
-@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_lengths[] = {
- 	[OPTION_U32]	= 4,
- };
- 
--/* already defined within netinet/in.h if using GNU compiler */
--#ifndef __USE_GNU
-+/* already defined within netinet/in.h if using glibc or musl */
-+#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
- struct in6_pktinfo {
- 	struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
- 	unsigned int ipi6_ifindex;  /* send/recv interface index */
--- 
-2.8.1
-
-
-From c0726e432fa0274a2b9c70179b03df6720972816 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 9 Aug 2016 15:19:23 +0100
-Subject: [PATCH 3/3] Rationalise includes
-
-gweb/gresolv.c uses snprintf() and isspace() so it should include stdio.h and
-ctype.h.
-
-tools/dnsproxy-test uses functions from stdio.h.
-
-musl warns when sys/ headers are included when the non-sys form should be used,
-so switch sys/errno.h and so on to errno.h.
-
-musl also causes redefinition errors when pieces of the networking headers are
-included, so remove the redundant includes.
-
-Based on work by Khem Raj <raj.khem@gmail.com>.
----
- gweb/gresolv.c               | 2 ++
- plugins/wifi.c               | 3 +--
- src/ippool.c                 | 1 -
- src/iptables.c               | 2 +-
- src/tethering.c              | 2 --
- tools/dhcp-test.c            | 1 -
- tools/dnsproxy-test.c        | 1 +
- tools/private-network-test.c | 2 +-
- tools/tap-test.c             | 2 +-
- 9 files changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/gweb/gresolv.c b/gweb/gresolv.c
-index 8a51a9f..d55027c 100644
---- a/gweb/gresolv.c
-+++ b/gweb/gresolv.c
-@@ -23,11 +23,13 @@
- #include <config.h>
- #endif
- 
-+#include <ctype.h>
- #include <errno.h>
- #include <unistd.h>
- #include <stdarg.h>
- #include <string.h>
- #include <stdlib.h>
-+#include <stdio.h>
- #include <resolv.h>
- #include <sys/types.h>
- #include <sys/socket.h>
-diff --git a/plugins/wifi.c b/plugins/wifi.c
-index 9d56671..148131d 100644
---- a/plugins/wifi.c
-+++ b/plugins/wifi.c
-@@ -30,9 +30,8 @@
- #include <string.h>
- #include <sys/ioctl.h>
- #include <sys/socket.h>
--#include <linux/if_arp.h>
--#include <linux/wireless.h>
- #include <net/ethernet.h>
-+#include <linux/wireless.h>
- 
- #ifndef IFF_LOWER_UP
- #define IFF_LOWER_UP	0x10000
-diff --git a/src/ippool.c b/src/ippool.c
-index cea1dcc..8a645da 100644
---- a/src/ippool.c
-+++ b/src/ippool.c
-@@ -28,7 +28,6 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
--#include <sys/errno.h>
- #include <sys/socket.h>
- 
- #include "connman.h"
-diff --git a/src/iptables.c b/src/iptables.c
-index 5ef757a..82e3ac4 100644
---- a/src/iptables.c
-+++ b/src/iptables.c
-@@ -28,7 +28,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <sys/socket.h>
- #include <xtables.h>
- #include <inttypes.h>
-diff --git a/src/tethering.c b/src/tethering.c
-index 3153349..ad062d5 100644
---- a/src/tethering.c
-+++ b/src/tethering.c
-@@ -31,10 +31,8 @@
- #include <stdio.h>
- #include <sys/ioctl.h>
- #include <net/if.h>
--#include <linux/sockios.h>
- #include <string.h>
- #include <fcntl.h>
--#include <linux/if_tun.h>
- #include <netinet/in.h>
- #include <linux/if_bridge.h>
- 
 diff --git a/tools/dhcp-test.c b/tools/dhcp-test.c
-index c34e10a..eae66fc 100644
+index c34e10a8..eae66fc2 100644
 --- a/tools/dhcp-test.c
 +++ b/tools/dhcp-test.c
 @@ -33,7 +33,6 @@
@@ -382,7 +281,7 @@ index c34e10a..eae66fc 100644
  #include <gdhcp/gdhcp.h>
  
 diff --git a/tools/dnsproxy-test.c b/tools/dnsproxy-test.c
-index 551cae9..371e2e2 100644
+index 551cae91..371e2e23 100644
 --- a/tools/dnsproxy-test.c
 +++ b/tools/dnsproxy-test.c
 @@ -24,6 +24,7 @@
@@ -394,7 +293,7 @@ index 551cae9..371e2e2 100644
  #include <string.h>
  #include <unistd.h>
 diff --git a/tools/private-network-test.c b/tools/private-network-test.c
-index 3dd115b..2828bb3 100644
+index 3dd115ba..2828bb30 100644
 --- a/tools/private-network-test.c
 +++ b/tools/private-network-test.c
 @@ -32,7 +32,7 @@
@@ -406,11 +305,29 @@ index 3dd115b..2828bb3 100644
  #include <sys/signalfd.h>
  #include <unistd.h>
  
+diff --git a/tools/stats-tool.c b/tools/stats-tool.c
+index efa39de2..5695048f 100644
+--- a/tools/stats-tool.c
++++ b/tools/stats-tool.c
+@@ -22,7 +22,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <sys/mman.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
 diff --git a/tools/tap-test.c b/tools/tap-test.c
-index 57917f5..cb3ee62 100644
+index fdc098aa..cb3ee622 100644
 --- a/tools/tap-test.c
 +++ b/tools/tap-test.c
-@@ -28,7 +28,7 @@
+@@ -23,13 +23,12 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <errno.h>
  #include <fcntl.h>
  #include <unistd.h>
  #include <string.h>
@@ -419,5 +336,30 @@ index 57917f5..cb3ee62 100644
  #include <sys/ioctl.h>
  
  #include <netinet/in.h>
+diff --git a/tools/wispr.c b/tools/wispr.c
+index d5f9341f..e56dfc16 100644
+--- a/tools/wispr.c
++++ b/tools/wispr.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+diff --git a/vpn/plugins/vpn.c b/vpn/plugins/vpn.c
+index 10548aaf..6e3f640c 100644
+--- a/vpn/plugins/vpn.c
++++ b/vpn/plugins/vpn.c
+@@ -23,7 +23,6 @@
+ #include <config.h>
+ #endif
+ 
+-#define _GNU_SOURCE
+ #include <string.h>
+ #include <fcntl.h>
+ #include <unistd.h>
 -- 
-2.8.1
+2.17.1
+
diff --git a/meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch b/meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch
deleted file mode 100644
index f9080d4ba9..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 929fc9b7068100444e0ffcccd25841f78791e619 Mon Sep 17 00:00:00 2001
-From: Jian Liang <jianliang@tycoint.com>
-Date: Fri, 15 Sep 2017 06:40:08 -0400
-Subject: [PATCH] gweb: Fix a crash using wispr over TLS
-To: connman@lists.01.org
-Cc: wagi@monom.org
-
-When gnutls_channel is instantiated, the gnutls_channel->established
-has to be initiated as FALSE. Otherwise, check_handshake function
-won't work. A random initial value 1 of gnutls_channel->established
-will make check_handshake return G_IO_STATUS_NORMAL, when the channel
-is actually not ready to be used. The observed behaviours are,
-
-- wispr is getting random errors in wispr_portal_web_result
-- ConnMan crashes on exit after those random errors
-- when wispr is luckly working, ConnMan doesn't crash on exit
-
-Signed-off-by: Jian Liang <jianliang@tycoint.com>
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=73e53f3bd9e7debae86341f1eee7b97862a56a5e]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
- gweb/giognutls.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gweb/giognutls.c b/gweb/giognutls.c
-index 09dc9e7..c029a8b 100644
---- a/gweb/giognutls.c
-+++ b/gweb/giognutls.c
-@@ -421,7 +421,7 @@ GIOChannel *g_io_channel_gnutls_new(int fd)
- 
- 	DBG("");
- 
--	gnutls_channel = g_new(GIOGnuTLSChannel, 1);
-+	gnutls_channel = g_new0(GIOGnuTLSChannel, 1);
- 
- 	channel = (GIOChannel *) gnutls_channel;
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch b/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
deleted file mode 100644
index dd7b356741..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-inet-Add-prefixlen-to-iproute_default_function.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 508dc60a1f0758ebc586b6b086478a176d493086 Mon Sep 17 00:00:00 2001
-From: Jian Liang <jianliang@tycoint.com>
-Date: Thu, 5 Oct 2017 09:34:41 +0100
-Subject: [PATCH 1/4] inet: Add prefixlen to iproute_default_function
-To: connman@lists.01.org
-Cc: wagi@monom.org
-
-Add prefixlen parameter to this function in preparation for using
-it also in creating subnet route later, e.g.
-
-default via 192.168.100.1 dev eth0
-192.168.100.0/24 dev eth0
-
-Signed-off-by: Jian Liang <jianliang@tycoint.com>
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=edda5b695de2ee79f02314abc9b46fdd46b388e1]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
- src/inet.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/inet.c b/src/inet.c
-index b887aa0..ab8aec8 100644
---- a/src/inet.c
-+++ b/src/inet.c
-@@ -2796,7 +2796,7 @@ int __connman_inet_del_fwmark_rule(uint32_t table_id, int family, uint32_t fwmar
- }
- 
- static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
--			const char *gateway)
-+			const char *gateway, unsigned char prefixlen)
- {
- 	struct __connman_inet_rtnl_handle rth;
- 	unsigned char buf[sizeof(struct in6_addr)];
-@@ -2829,6 +2829,7 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
- 	rth.req.u.r.rt.rtm_protocol = RTPROT_BOOT;
- 	rth.req.u.r.rt.rtm_scope = RT_SCOPE_UNIVERSE;
- 	rth.req.u.r.rt.rtm_type = RTN_UNICAST;
-+	rth.req.u.r.rt.rtm_dst_len = prefixlen;
- 
- 	__connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req), RTA_GATEWAY,
- 								buf, len);
-@@ -2860,7 +2861,7 @@ int __connman_inet_add_default_to_table(uint32_t table_id, int ifindex,
- {
- 	/* ip route add default via 1.2.3.4 dev wlan0 table 1234 */
- 
--	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway);
-+	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway, 0);
- }
- 
- int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
-@@ -2868,7 +2869,7 @@ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
- {
- 	/* ip route del default via 1.2.3.4 dev wlan0 table 1234 */
- 
--	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway);
-+	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway, 0);
- }
- 
- int __connman_inet_get_interface_ll_address(int index, int family,
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch b/meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch
deleted file mode 100644
index f1b4d0aaa7..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From b5fd5945886fa1845db5c969424b63d894fe0376 Mon Sep 17 00:00:00 2001
-From: Jian Liang <jianliang@tycoint.com>
-Date: Fri, 25 Aug 2017 10:02:16 -0400
-Subject: [PATCH 1/2] session: Keep track of addr in fw_snat & session
-To: connman@lists.01.org
-Cc: wagi@monom.org
-
-When there is more than one session in fw_snat's list of sessions,
-fw_snat failed to be re-created when update-session-state is triggered
-with new IP address. This is because index alone is not sufficient to
-decide if fw_snat needs to be re-created. The solution here is to keep
-a track of IP addr and use it to avoid false lookup of fw_snat.
-
-Signed-off-by: Jian Liang <jianliang@tycoint.com>
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=f9e27d4abfcab5c80a38e0850b5ddb26277f97c1]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
- src/session.c | 19 +++++++++++++++----
- 1 file changed, 15 insertions(+), 4 deletions(-)
-
-diff --git a/src/session.c b/src/session.c
-index 9e3c559..965ac06 100644
---- a/src/session.c
-+++ b/src/session.c
-@@ -65,6 +65,7 @@ struct connman_session {
- 	struct firewall_context *fw;
- 	uint32_t mark;
- 	int index;
-+	char *addr;
- 	char *gateway;
- 	bool policy_routing;
- 	bool snat_enabled;
-@@ -79,6 +80,7 @@ struct fw_snat {
- 	GSList *sessions;
- 	int id;
- 	int index;
-+	char *addr;
- 	struct firewall_context *fw;
- };
- 
-@@ -200,7 +202,7 @@ static char *service2bearer(enum connman_service_type type)
- 	return "";
- }
- 
--static struct fw_snat *fw_snat_lookup(int index)
-+static struct fw_snat *fw_snat_lookup(int index, const char *addr)
- {
- 	struct fw_snat *fw_snat;
- 	GSList *list;
-@@ -208,8 +210,11 @@ static struct fw_snat *fw_snat_lookup(int index)
- 	for (list = fw_snat_list; list; list = list->next) {
- 		fw_snat = list->data;
- 
--		if (fw_snat->index == index)
-+		if (fw_snat->index == index) {
-+			if (g_strcmp0(addr, fw_snat->addr) != 0)
-+				continue;
- 			return fw_snat;
-+		}
- 	}
- 	return NULL;
- }
-@@ -224,6 +229,7 @@ static int fw_snat_create(struct connman_session *session,
- 
- 	fw_snat->fw = __connman_firewall_create();
- 	fw_snat->index = index;
-+	fw_snat->addr = g_strdup(addr);
- 
- 	fw_snat->id = __connman_firewall_enable_snat(fw_snat->fw,
- 						index, ifname, addr);
-@@ -238,6 +244,7 @@ static int fw_snat_create(struct connman_session *session,
- 	return 0;
- err:
- 	__connman_firewall_destroy(fw_snat->fw);
-+	g_free(fw_snat->addr);
- 	g_free(fw_snat);
- 	return err;
- }
-@@ -393,7 +400,7 @@ static void del_nat_rules(struct connman_session *session)
- 		return;
- 
- 	session->snat_enabled = false;
--	fw_snat = fw_snat_lookup(session->index);
-+	fw_snat = fw_snat_lookup(session->index, session->addr);
- 
- 	if (!fw_snat)
- 		return;
-@@ -420,8 +427,11 @@ static void add_nat_rules(struct connman_session *session)
- 	if (!addr)
- 		return;
- 
-+	g_free(session->addr);
-+	session->addr = g_strdup(addr);
-+
- 	session->snat_enabled = true;
--	fw_snat = fw_snat_lookup(index);
-+	fw_snat = fw_snat_lookup(index, session->addr);
- 	if (fw_snat) {
- 		fw_snat_ref(session, fw_snat);
- 		return;
-@@ -502,6 +512,7 @@ static void free_session(struct connman_session *session)
- 	g_free(session->info);
- 	g_free(session->info_last);
- 	g_free(session->gateway);
-+	g_free(session->addr);
- 
- 	g_free(session);
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch b/meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch
deleted file mode 100644
index 9c953e5d51..0000000000
--- a/meta/recipes-connectivity/connman/connman/0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 08cda4004491d3971a8b9df937426c43800d15b1 Mon Sep 17 00:00:00 2001
-From: Jian Liang <jianliang@tycoint.com>
-Date: Thu, 5 Oct 2017 09:37:06 +0100
-Subject: [PATCH 2/4] inet: Implement subnet route creation/deletion in
- iproute_default_modify
-To: connman@lists.01.org
-Cc: wagi@monom.org
-
-- Calculate subnet address base on gateway address and prefixlen
-- Differentiate creation of routes to gateway and subnet
-
-Signed-off-by: Jian Liang <jianliang@tycoint.com>
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=ff7dcf91f12a2a237feebc6e606d0a8e92975528]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
- src/inet.c | 22 +++++++++++++++++++---
- 1 file changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/src/inet.c b/src/inet.c
-index ab8aec8..0ddb030 100644
---- a/src/inet.c
-+++ b/src/inet.c
-@@ -2802,6 +2802,9 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
- 	unsigned char buf[sizeof(struct in6_addr)];
- 	int ret, len;
- 	int family = connman_inet_check_ipaddress(gateway);
-+	char *dst = NULL;
-+
-+	DBG("gateway %s/%u table %u", gateway, prefixlen, table_id);
- 
- 	switch (family) {
- 	case AF_INET:
-@@ -2814,7 +2817,19 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
- 		return -EINVAL;
- 	}
- 
--	ret = inet_pton(family, gateway, buf);
-+	if (prefixlen) {
-+		struct in_addr ipv4_subnet_addr, ipv4_mask;
-+
-+		memset(&ipv4_subnet_addr, 0, sizeof(ipv4_subnet_addr));
-+		ipv4_mask.s_addr = htonl((0xffffffff << (32 - prefixlen)) & 0xffffffff);
-+		ipv4_subnet_addr.s_addr = inet_addr(gateway);
-+		ipv4_subnet_addr.s_addr &= ipv4_mask.s_addr;
-+
-+		dst = g_strdup(inet_ntoa(ipv4_subnet_addr));
-+	}
-+
-+	ret = inet_pton(family, dst ? dst : gateway, buf);
-+	g_free(dst);
- 	if (ret <= 0)
- 		return -EINVAL;
- 
-@@ -2831,8 +2846,9 @@ static int iproute_default_modify(int cmd, uint32_t table_id, int ifindex,
- 	rth.req.u.r.rt.rtm_type = RTN_UNICAST;
- 	rth.req.u.r.rt.rtm_dst_len = prefixlen;
- 
--	__connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req), RTA_GATEWAY,
--								buf, len);
-+	__connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req),
-+		prefixlen > 0 ? RTA_DST : RTA_GATEWAY, buf, len);
-+
- 	if (table_id < 256) {
- 		rth.req.u.r.rt.rtm_table = table_id;
- 	} else {
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch b/meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch
deleted file mode 100644
index 56ba5c3f4b..0000000000
--- a/meta/recipes-connectivity/connman/connman/0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From a9243f13d6e1aadd69bfcc27f75f69c38be51677 Mon Sep 17 00:00:00 2001
-From: Jian Liang <jianliang@tycoint.com>
-Date: Wed, 4 Oct 2017 17:30:17 +0100
-Subject: [PATCH 3/4] inet: Implement APIs for creating and deleting subnet
- route
-To: connman@lists.01.org
-Cc: wagi@monom.org
-
-Signed-off-by: Jian Liang <jianliang@tycoint.com>
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=3a15b0b7fccd053aff91da2cc68585509d0c509b]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
- src/connman.h |  4 ++++
- src/inet.c    | 14 ++++++++++++++
- 2 files changed, 18 insertions(+)
-
-diff --git a/src/connman.h b/src/connman.h
-index 21b7080..da4446a 100644
---- a/src/connman.h
-+++ b/src/connman.h
-@@ -240,7 +240,11 @@ int __connman_inet_rtnl_addattr32(struct nlmsghdr *n, size_t maxlen,
- int __connman_inet_add_fwmark_rule(uint32_t table_id, int family, uint32_t fwmark);
- int __connman_inet_del_fwmark_rule(uint32_t table_id, int family, uint32_t fwmark);
- int __connman_inet_add_default_to_table(uint32_t table_id, int ifindex, const char *gateway);
-+int __connman_inet_add_subnet_to_table(uint32_t table_id, int ifindex,
-+			const char *gateway, unsigned char prefixlen);
- int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex, const char *gateway);
-+int __connman_inet_del_subnet_from_table(uint32_t table_id, int ifindex,
-+			const char *gateway, unsigned char prefixlen);
- int __connman_inet_get_address_netmask(int ifindex,
- 		struct sockaddr_in *address, struct sockaddr_in *netmask);
- 
-diff --git a/src/inet.c b/src/inet.c
-index 0ddb030..dcd1ab2 100644
---- a/src/inet.c
-+++ b/src/inet.c
-@@ -2880,6 +2880,13 @@ int __connman_inet_add_default_to_table(uint32_t table_id, int ifindex,
- 	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway, 0);
- }
- 
-+int __connman_inet_add_subnet_to_table(uint32_t table_id, int ifindex,
-+						const char *gateway, unsigned char prefixlen)
-+{
-+	/* ip route add 1.2.3.4/24 dev eth0 table 1234 */
-+	return iproute_default_modify(RTM_NEWROUTE, table_id, ifindex, gateway, prefixlen);
-+}
-+
- int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
- 						const char *gateway)
- {
-@@ -2888,6 +2895,13 @@ int __connman_inet_del_default_from_table(uint32_t table_id, int ifindex,
- 	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway, 0);
- }
- 
-+int __connman_inet_del_subnet_from_table(uint32_t table_id, int ifindex,
-+						const char *gateway, unsigned char prefixlen)
-+{
-+	/* ip route del 1.2.3.4/24 dev eth0 table 1234 */
-+	return iproute_default_modify(RTM_DELROUTE, table_id, ifindex, gateway, prefixlen);
-+}
-+
- int __connman_inet_get_interface_ll_address(int index, int family,
- 								void *address)
- {
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch b/meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch
deleted file mode 100644
index ca213eb18b..0000000000
--- a/meta/recipes-connectivity/connman/connman/0004-session-Use-subnet-route-creation-and-deletion-APIs.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From deb9372db8396da4f7cd20555ce7c9a8b3ad96bd Mon Sep 17 00:00:00 2001
-From: Jian Liang <jianliang@tycoint.com>
-Date: Fri, 6 Oct 2017 11:40:16 +0100
-Subject: [PATCH 4/4] session: Use subnet route creation and deletion APIs
-To: connman@lists.01.org
-Cc: wagi@monom.org
-
-As subnet route is address and session specific in this case, so add
-prefixlen into struct connman_session, and update it along with ipconfig.
-Then use it in subnet route related APIs.
-
-Signed-off-by: Jian Liang <jianliang@tycoint.com>
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=285f25ef6cc9e4a43dab83523f3e2eab4365ac26]
-Signed-off-by: André Draszik <andre.draszik@jci.com>
- src/session.c | 20 ++++++++++++++++----
- 1 file changed, 16 insertions(+), 4 deletions(-)
-
-diff --git a/src/session.c b/src/session.c
-index 965ac06..7b7a14b 100644
---- a/src/session.c
-+++ b/src/session.c
-@@ -67,6 +67,7 @@ struct connman_session {
- 	int index;
- 	char *addr;
- 	char *gateway;
-+	unsigned char prefixlen;
- 	bool policy_routing;
- 	bool snat_enabled;
- };
-@@ -357,13 +358,17 @@ static void del_default_route(struct connman_session *session)
- 	if (!session->gateway)
- 		return;
- 
--	DBG("index %d routing table %d default gateway %s",
--		session->index, session->mark, session->gateway);
-+	DBG("index %d routing table %d default gateway %s/%u",
-+		session->index, session->mark, session->gateway, session->prefixlen);
-+
-+		__connman_inet_del_subnet_from_table(session->mark,
-+			session->index, session->gateway, session->prefixlen);
- 
- 	__connman_inet_del_default_from_table(session->mark,
- 					session->index, session->gateway);
- 	g_free(session->gateway);
- 	session->gateway = NULL;
-+	session->prefixlen = 0;
- 	session->index = -1;
- }
- 
-@@ -383,13 +388,20 @@ static void add_default_route(struct connman_session *session)
- 	if (!session->gateway)
- 		session->gateway = g_strdup(inet_ntoa(addr));
- 
--	DBG("index %d routing table %d default gateway %s",
--		session->index, session->mark, session->gateway);
-+	session->prefixlen = __connman_ipconfig_get_prefixlen(ipconfig);
-+
-+	DBG("index %d routing table %d default gateway %s/%u",
-+		session->index, session->mark, session->gateway, session->prefixlen);
- 
- 	err = __connman_inet_add_default_to_table(session->mark,
- 					session->index, session->gateway);
- 	if (err < 0)
- 		DBG("session %p %s", session, strerror(-err));
-+
-+	err = __connman_inet_add_subnet_to_table(session->mark,
-+					session->index, session->gateway, session->prefixlen);
-+	if (err < 0)
-+		DBG("session add subnet route %p %s", session, strerror(-err));
- }
- 
- static void del_nat_rules(struct connman_session *session)
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/connman/connman_1.35.bb b/meta/recipes-connectivity/connman/connman_1.35.bb
deleted file mode 100644
index ff2118113f..0000000000
--- a/meta/recipes-connectivity/connman/connman_1.35.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require connman.inc
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
-            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
-            file://connman \
-            file://no-version-scripts.patch \
-            file://includes.patch \
-            file://0001-session-Keep-track-of-addr-in-fw_snat-session.patch \
-            file://0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch \
-            file://0001-inet-Add-prefixlen-to-iproute_default_function.patch \
-            file://0002-inet-Implement-subnet-route-creation-deletion-in-ipr.patch \
-            file://0003-inet-Implement-APIs-for-creating-and-deleting-subnet.patch \
-            file://0004-session-Use-subnet-route-creation-and-deletion-APIs.patch \
-            "
-SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
-                             "
-
-SRC_URI[md5sum] = "bae37b45ee9b3db5ec8115188f8a7652"
-SRC_URI[sha256sum] = "66d7deb98371545c6e417239a9b3b3e3201c1529d08eedf40afbc859842cf2aa"
-
-RRECOMMENDS_${PN} = "connman-conf"
diff --git a/meta/recipes-connectivity/connman/connman_1.36.bb b/meta/recipes-connectivity/connman/connman_1.36.bb
new file mode 100644
index 0000000000..62c89b1e5d
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman_1.36.bb
@@ -0,0 +1,17 @@
+require connman.inc
+
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
+            file://connman \
+            file://no-version-scripts.patch \
+            file://0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch \
+"
+
+SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+"
+
+SRC_URI[md5sum] = "dae77d9c904d2c223ae849e32079d57e"
+SRC_URI[sha256sum] = "c789db41cc443fa41e661217ea321492ad59a004bebcd1aa013f3bc10a6e0074"
+
+RRECOMMENDS_${PN} = "connman-conf"
-- 
2.17.1


