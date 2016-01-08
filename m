Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 14B7373D27
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:31 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p186so118755814qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RO5KCbqk/n3T7Xx6jwZ2jXoXdAiyEP6FvshgqbAS01g=;
	b=TVyZN0BhEmSbKqWeKGMC9m9Id9DmdS3ME2zq/KqKl190eyDwLvryOjFJ5vM0sKbqvT
	m4zAaiv8VdZAJcfACn/MKZ7Jw8KQUt0gIAguLGNsvdfhoZVCxiQxY8kxDWqFCzANEO8G
	cRR4/mW5uQEn22g9tYbzu6+itvf8qw09hgJ3bM6fnZb5eouhUZqnoOutdK7MojUoeLL1
	HY92COAC6kRF1b4dghqNwOvYy9X35Mh29AudxoOFDWF9LxXXyyAUoYdt1slKdcsRCsYh
	tWHfp0BTcywxhFHZv6T7+hFMOosW9W9HCAIa8ZrsZcwFwTiaZOc7/WP2VwGN47/a3hk6
	+D8A==
X-Received: by 10.55.75.144 with SMTP id y138mr52302927qka.96.1452248372409;
	Fri, 08 Jan 2016 02:19:32 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:35 +0000
Message-Id: <3fe83addb1adc36a7e93d469f55a192868d57f27.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 07/53] connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:32 -0000

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
2.7.0


