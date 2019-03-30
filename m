Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4917C60B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 18:50:38 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id r24so4704558ljg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qGBi+kPAnQ/aquw7bMULbrXlEPI44CX9AfFw0wC7M7s=;
	b=En3u5tCUVFFR1bUDFePtlrQtP31OONl3/GPeV7sunLKigaKggva++z8jYehXQ1Qamf
	LqJWElnGk+vakTCHvvvYhHmhqiCBgiUZSJEKCR5kqNveK0wUvA4uvGj7YfRXPfuvXdap
	SVyOC7M/cUT+LPCPhE/z7ZQ5QoI8kUanc/aTbC+7BMZgZyZqats7DCmnnQv6ZjLSVXN+
	jz7AI3HhPBn8XFiYYRvcy/ib09O0oYbRl9uJnbFWqX7HBlPyM5uatGs9HMGrkoi/TfXD
	g5Vmw9wHVPg/NfFEAD0xMmlOB5QPywkGVqMA6S1t6HHdWF0ZzXaLvoSiwOJK3YmwvKCW
	CYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qGBi+kPAnQ/aquw7bMULbrXlEPI44CX9AfFw0wC7M7s=;
	b=Vme9uUN3VKLDfS1lt+0/0Y8kYDplnD2Iajuwbaru/8dlek3hkTteIjPMvoz7BIo7/B
	La125zP7TA22VKgC3Nzc0yZtIb62RD/pdBqELAcnp9SHyjmTiT2F59w8lpvUr7sMx0sr
	NQJodiPYqkzK/ESyE8qfMFCzhvCj07OM4b+V3+GDQRl2GtIJArwsXUrwH/WcDHfTxYkm
	a8T7TknZCB8e8wmFV62KarPef6JZWAx3oKpvg7CtWEOo2sXMXJCu65+jkLdKcq5XtrKt
	MpAHcntTwUPOoLZ3T2kjz1IdW6KFKp7iV8kFfiGTtIEw2EKXeNVGFh0nDu5HXc/BiIkZ
	KJbw==
X-Gm-Message-State: APjAAAXozBqBj7FRVrhWXgUvDqLtJxbdIUPp0sQ0lIVLUq64eJSbmll6
	aKQhf5WcjYHtHfv7J+5OFOhnX7BszhY=
X-Google-Smtp-Source: APXvYqw5OdcaBYEE7eM5je4JbN1A5G+0gDgACInJ0juvvIW40zwnxbt4RAxqY0rLB8J1VDef5XsHiQ==
X-Received: by 2002:a2e:b058:: with SMTP id d24mr31960315ljl.42.1553971838763; 
	Sat, 30 Mar 2019 11:50:38 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id e3sm935598lfn.80.2019.03.30.11.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Mar 2019 11:50:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Mar 2019 19:50:25 +0100
Message-Id: <20190330185025.27885-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] connman: update to 1.37
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
X-List-Received-Date: Sat, 30 Mar 2019 18:50:40 -0000

Removed patch has been upstreamed.

Changelog:
- Fix issue with handling invalid gateway addresses.
- Fix issue with handling updates of default gateway.
- Fix issue with DHCP servers that require broadcast flag.
- Add support for option to use gateways as time servers.
- Add support for option to select default technology.
- Add support for Address Conflict Detection (ACD).
- Add support for IPv6 iptables management.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...sues-which-cause-problems-under-musl.patch | 362 ------------------
 .../{connman_1.36.bb => connman_1.37.bb}      |   5 +-
 2 files changed, 2 insertions(+), 365 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-Fix-various-issues-which-cause-problems-under-musl.patch
 rename meta/recipes-connectivity/connman/{connman_1.36.bb => connman_1.37.bb} (67%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-Fix-various-issues-which-cause-problems-under-musl.patch b/meta/recipes-connectivity/connman/connman/0001-Fix-various-issues-which-cause-problems-under-musl.patch
deleted file mode 100644
index f344fea109..0000000000
--- a/meta/recipes-connectivity/connman/connman/0001-Fix-various-issues-which-cause-problems-under-musl.patch
+++ /dev/null
@@ -1,362 +0,0 @@
-From 181ff3439783c6920f5211730672685a210c318f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 8 Oct 2018 22:12:56 +0200
-Subject: [PATCH] Fix various issues which cause problems under musl
-
-Instead of using #define _GNU_SOURCE in some source files which causes
-problems when building with musl as more files need the define, simply
-use AC_USE_SYSTEM_EXTENSIONS in configure.ac to get it defined globally.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Backport [bd1326ba7d68df38c5ccaafd2403a5fb30bd452b]
----
- configure.ac                 | 3 +++
- gdhcp/client.c               | 1 -
- gdhcp/common.h               | 5 +++--
- gweb/gresolv.c               | 1 +
- plugins/tist.c               | 1 -
- plugins/wifi.c               | 3 +--
- src/backtrace.c              | 1 -
- src/inet.c                   | 1 -
- src/ippool.c                 | 1 -
- src/iptables.c               | 2 +-
- src/log.c                    | 1 -
- src/ntp.c                    | 1 -
- src/resolver.c               | 1 -
- src/rfkill.c                 | 1 -
- src/stats.c                  | 1 -
- src/tethering.c              | 2 --
- src/timezone.c               | 1 -
- tools/dhcp-test.c            | 1 -
- tools/dnsproxy-test.c        | 1 +
- tools/private-network-test.c | 2 +-
- tools/stats-tool.c           | 1 -
- tools/tap-test.c             | 3 +--
- tools/wispr.c                | 1 -
- vpn/plugins/vpn.c            | 1 -
- 24 files changed, 12 insertions(+), 25 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 39745f76..984126c2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -20,6 +20,7 @@ AC_SUBST(abs_top_srcdir)
- AC_SUBST(abs_top_builddir)
- 
- AC_LANG_C
-+AC_USE_SYSTEM_EXTENSIONS
- 
- AC_PROG_CC
- AM_PROG_CC_C_O
-@@ -185,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
- AC_CHECK_HEADERS([execinfo.h])
- AM_CONDITIONAL([BACKTRACE], [test "${ac_cv_header_execinfo_h}" = "yes"])
- 
-+AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#include <netinet/in.h>]])
-+
- AC_CHECK_FUNC(signalfd, dummy=yes,
- 			AC_MSG_ERROR(signalfd support is required))
- 
-diff --git a/gdhcp/client.c b/gdhcp/client.c
-index 67357782..c7db76f0 100644
---- a/gdhcp/client.c
-+++ b/gdhcp/client.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <errno.h>
- #include <unistd.h>
-diff --git a/gdhcp/common.h b/gdhcp/common.h
-index 75abc183..6899499e 100644
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
-diff --git a/gweb/gresolv.c b/gweb/gresolv.c
-index 81c79b6c..b06f8932 100644
---- a/gweb/gresolv.c
-+++ b/gweb/gresolv.c
-@@ -29,6 +29,7 @@
- #include <string.h>
- #include <stdlib.h>
- #include <resolv.h>
-+#include <stdio.h>
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <netdb.h>
-diff --git a/plugins/tist.c b/plugins/tist.c
-index ad5ef79e..cc2800a1 100644
---- a/plugins/tist.c
-+++ b/plugins/tist.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdbool.h>
- #include <stdlib.h>
-diff --git a/plugins/wifi.c b/plugins/wifi.c
-index dc08c6af..46e4cca4 100644
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
-diff --git a/src/backtrace.c b/src/backtrace.c
-index e8d7f432..bede6698 100644
---- a/src/backtrace.c
-+++ b/src/backtrace.c
-@@ -24,7 +24,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <unistd.h>
- #include <stdlib.h>
-diff --git a/src/inet.c b/src/inet.c
-index a31372b5..a58ce7c1 100644
---- a/src/inet.c
-+++ b/src/inet.c
-@@ -25,7 +25,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <errno.h>
- #include <unistd.h>
-diff --git a/src/ippool.c b/src/ippool.c
-index cea1dccd..8a645da2 100644
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
-index f3670e77..469effed 100644
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
-diff --git a/src/log.c b/src/log.c
-index 9bae4a3d..f7e82e5d 100644
---- a/src/log.c
-+++ b/src/log.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <unistd.h>
- #include <stdarg.h>
-diff --git a/src/ntp.c b/src/ntp.c
-index 51ba9aac..724ca188 100644
---- a/src/ntp.c
-+++ b/src/ntp.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <errno.h>
- #include <fcntl.h>
- #include <unistd.h>
-diff --git a/src/resolver.c b/src/resolver.c
-index 76f0a8e1..10121aa5 100644
---- a/src/resolver.c
-+++ b/src/resolver.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <errno.h>
- #include <fcntl.h>
-diff --git a/src/rfkill.c b/src/rfkill.c
-index d9bed4d2..b2514c41 100644
---- a/src/rfkill.c
-+++ b/src/rfkill.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <errno.h>
- #include <fcntl.h>
-diff --git a/src/stats.c b/src/stats.c
-index 663bc382..c9ddc2e8 100644
---- a/src/stats.c
-+++ b/src/stats.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <errno.h>
- #include <sys/mman.h>
- #include <sys/types.h>
-diff --git a/src/tethering.c b/src/tethering.c
-index 4b202369..f3cb36f4 100644
---- a/src/tethering.c
-+++ b/src/tethering.c
-@@ -34,8 +34,6 @@
- #include <string.h>
- #include <fcntl.h>
- #include <netinet/in.h>
--#include <linux/sockios.h>
--#include <linux/if_tun.h>
- #include <linux/if_bridge.h>
- 
- #include "connman.h"
-diff --git a/src/timezone.c b/src/timezone.c
-index e346b11a..8e912670 100644
---- a/src/timezone.c
-+++ b/src/timezone.c
-@@ -23,7 +23,6 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <errno.h>
- #include <stdio.h>
- #include <fcntl.h>
-diff --git a/tools/dhcp-test.c b/tools/dhcp-test.c
-index c34e10a8..eae66fc2 100644
---- a/tools/dhcp-test.c
-+++ b/tools/dhcp-test.c
-@@ -33,7 +33,6 @@
- #include <arpa/inet.h>
- #include <net/route.h>
- #include <net/ethernet.h>
--#include <linux/if_arp.h>
- 
- #include <gdhcp/gdhcp.h>
- 
-diff --git a/tools/dnsproxy-test.c b/tools/dnsproxy-test.c
-index 551cae91..371e2e23 100644
---- a/tools/dnsproxy-test.c
-+++ b/tools/dnsproxy-test.c
-@@ -24,6 +24,7 @@
- #endif
- 
- #include <errno.h>
-+#include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
-diff --git a/tools/private-network-test.c b/tools/private-network-test.c
-index 3dd115ba..2828bb30 100644
---- a/tools/private-network-test.c
-+++ b/tools/private-network-test.c
-@@ -32,7 +32,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <signal.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/signalfd.h>
- #include <unistd.h>
- 
-diff --git a/tools/stats-tool.c b/tools/stats-tool.c
-index efa39de2..5695048f 100644
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
-index fdc098aa..cb3ee622 100644
---- a/tools/tap-test.c
-+++ b/tools/tap-test.c
-@@ -23,13 +23,12 @@
- #include <config.h>
- #endif
- 
--#define _GNU_SOURCE
- #include <stdio.h>
- #include <errno.h>
- #include <fcntl.h>
- #include <unistd.h>
- #include <string.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/ioctl.h>
- 
- #include <netinet/in.h>
-diff --git a/tools/wispr.c b/tools/wispr.c
-index d5f9341f..e56dfc16 100644
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
-index 10548aaf..6e3f640c 100644
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
-2.17.1
-
diff --git a/meta/recipes-connectivity/connman/connman_1.36.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
similarity index 67%
rename from meta/recipes-connectivity/connman/connman_1.36.bb
rename to meta/recipes-connectivity/connman/connman_1.37.bb
index 6e4dbdfda6..2cf904cd85 100644
--- a/meta/recipes-connectivity/connman/connman_1.36.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -5,12 +5,11 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
             file://connman \
             file://no-version-scripts.patch \
-            file://0001-Fix-various-issues-which-cause-problems-under-musl.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[md5sum] = "dae77d9c904d2c223ae849e32079d57e"
-SRC_URI[sha256sum] = "c789db41cc443fa41e661217ea321492ad59a004bebcd1aa013f3bc10a6e0074"
+SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
+SRC_URI[sha256sum] = "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
2.17.1


