Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAA47319C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:37 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id o11so4563210qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3gRTgzKinQHXSlRDijtu1iy7Dw+5j4Nerel6bxxSyYA=;
	b=eHT9CKLiD/arvL/ddRy5fp1em8lj2JxhvK6+lrhwpyE+lZAqJ4OuyDrJAjfeqMlkrA
	rFEzW7NJd/pEpbcDqRiKPJdmUmOi9pMyBmo4LXUXdAz70dV1zbvruXikVkETUHgxDhwT
	BncGZLeDrD3tQacJR1qvz2f/B8ssedN2SM9lvwizSoi+eZ8xEiALJQjy1SsyuzqjDphR
	UfobC/0oKopAsZRyRGz2b8cI3SUuQpJm/zYu/YgbDMZPsvo4eDsexSgfrOT720XjYyQs
	ZWiFKpnD8aig0Coc+s/AWZpiqd4tz8SYBYAkyvctN+g5DBxrPinMa+1qfzOsPfzqRBIf
	AEBQ==
X-Received: by 10.140.175.196 with SMTP id v187mr16165723qhv.75.1450569158412; 
	Sat, 19 Dec 2015 15:52:38 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:19 +0000
Message-Id: <ee95a08b80d625c652318c77b351495cc9077a15.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 10/17] connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:38 -0000

We now check at configure time of libc has pktinfo struct

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0003-Fix-header-inclusions-for-musl.patch      | 79 +++++++++++++++-------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch b/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
index 6327aa2..eefc683 100644
--- a/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
+++ b/meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  tools/dnsproxy-test.c | 1 +
  5 files changed, 3 insertions(+), 5 deletions(-)
 
-diff --git a/gweb/gresolv.c b/gweb/gresolv.c
-index 3ad8e70..61d6fe8 100644
---- a/gweb/gresolv.c
-+++ b/gweb/gresolv.c
+Index: connman-1.30/gweb/gresolv.c
+===================================================================
+--- connman-1.30.orig/gweb/gresolv.c
++++ connman-1.30/gweb/gresolv.c
 @@ -28,6 +28,7 @@
  #include <stdarg.h>
  #include <string.h>
@@ -26,10 +26,10 @@ index 3ad8e70..61d6fe8 100644
  #include <resolv.h>
  #include <sys/types.h>
  #include <sys/socket.h>
-diff --git a/plugins/wifi.c b/plugins/wifi.c
-index dfe849f..99cff3f 100644
---- a/plugins/wifi.c
-+++ b/plugins/wifi.c
+Index: connman-1.30/plugins/wifi.c
+===================================================================
+--- connman-1.30.orig/plugins/wifi.c
++++ connman-1.30/plugins/wifi.c
 @@ -30,9 +30,8 @@
  #include <string.h>
  #include <sys/ioctl.h>
@@ -41,10 +41,10 @@ index dfe849f..99cff3f 100644
  
  #ifndef IFF_LOWER_UP
  #define IFF_LOWER_UP	0x10000
-diff --git a/src/tethering.c b/src/tethering.c
-index ceeec74..c44cb36 100644
---- a/src/tethering.c
-+++ b/src/tethering.c
+Index: connman-1.30/src/tethering.c
+===================================================================
+--- connman-1.30.orig/src/tethering.c
++++ connman-1.30/src/tethering.c
 @@ -31,10 +31,8 @@
  #include <stdio.h>
  #include <sys/ioctl.h>
@@ -56,10 +56,10 @@ index ceeec74..c44cb36 100644
  #include <netinet/in.h>
  #include <linux/if_bridge.h>
  
-diff --git a/tools/dhcp-test.c b/tools/dhcp-test.c
-index c34e10a..eae66fc 100644
---- a/tools/dhcp-test.c
-+++ b/tools/dhcp-test.c
+Index: connman-1.30/tools/dhcp-test.c
+===================================================================
+--- connman-1.30.orig/tools/dhcp-test.c
++++ connman-1.30/tools/dhcp-test.c
 @@ -33,7 +33,6 @@
  #include <arpa/inet.h>
  #include <net/route.h>
@@ -68,10 +68,10 @@ index c34e10a..eae66fc 100644
  
  #include <gdhcp/gdhcp.h>
  
-diff --git a/tools/dnsproxy-test.c b/tools/dnsproxy-test.c
-index 551cae9..226ba86 100644
---- a/tools/dnsproxy-test.c
-+++ b/tools/dnsproxy-test.c
+Index: connman-1.30/tools/dnsproxy-test.c
+===================================================================
+--- connman-1.30.orig/tools/dnsproxy-test.c
++++ connman-1.30/tools/dnsproxy-test.c
 @@ -27,6 +27,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -80,6 +80,39 @@ index 551cae9..226ba86 100644
  #include <arpa/inet.h>
  #include <netinet/in.h>
  #include <sys/types.h>
--- 
-2.5.1
-
+Index: connman-1.30/configure.ac
+===================================================================
+--- connman-1.30.orig/configure.ac
++++ connman-1.30/configure.ac
+@@ -173,6 +173,8 @@ AM_CONDITIONAL(PPTP_BUILTIN, test "${ena
+ 
+ AC_CHECK_HEADERS([execinfo.h])
+ 
++AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#include <netinet/in.h>]])
++
+ AC_CHECK_HEADERS(resolv.h, dummy=yes,
+ 	AC_MSG_ERROR(resolver header files are required))
+ AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
+Index: connman-1.30/gdhcp/common.h
+===================================================================
+--- connman-1.30.orig/gdhcp/common.h
++++ connman-1.30/gdhcp/common.h
+@@ -19,6 +19,7 @@
+  *
+  */
+ 
++#include <config.h>
+ #include <netinet/udp.h>
+ #include <netinet/ip.h>
+ 
+@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_lengths
+ 	[OPTION_U32]	= 4,
+ };
+ 
+-/* already defined within netinet/in.h if using GNU compiler */
+-#ifndef __USE_GNU
++/* already defined within netinet/in.h if using GNU or musl libc */
++#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
+ struct in6_pktinfo {
+ 	struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
+ 	unsigned int ipi6_ifindex;  /* send/recv interface index */
-- 
2.6.4


