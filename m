Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 11D2773169
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:04 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id e65so142592826pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RO5KCbqk/n3T7Xx6jwZ2jXoXdAiyEP6FvshgqbAS01g=;
	b=aX3HCq9HIRy+MMes7VU3JFRJethZo6dFWSQqcxtF5neS7UoAQOv5qMrFRRQqXWR25Z
	iwRtKONH3czXkp0bnofx8wprMd399MKONmZ107gZftjLnKeKnVJK0bxYDmCWhkByBrV2
	zkdYym64FOGKzVDw9PDn8OCJADjs8eGKfxxxeBHW8cWUU9wHQubpCXsOaZgBQyHXag0Y
	nLnwz/JXYbbRE/FXi4SqRnRqs0qPZm5G/BE4S2Oo5CPdSSnoJe9jftvZh2NNK3ZCd8i7
	xZdvMyV5GpLNx3a8jyyyOVtE5igRrYaBoUidn35NNeobMk9lXU1OPWGrqbfnDPc5ciL8
	u/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=RO5KCbqk/n3T7Xx6jwZ2jXoXdAiyEP6FvshgqbAS01g=;
	b=CKVWgWCfrKObsU/ixI1RCW7+hHxXWvrJHY7po9Cr5/6LcgnX0CwJdLLt3NdSGWxx8n
	80L4ZQNowJ648XHxD/4u6ruX1XMe1aL6jTYGOUEXNp8Vls7+VY6tfobYrwu+pN9FxD4T
	EwCg5CucCGPF+stxgBzgbj0TheXIDPfrC/0yqj6Fr/qmm41Qd56VkHsnZe/ePV3r0idJ
	QJkQ8YS1gCgO5YyHi343to+wYiIfwuKwSkuoBBmMncKztU1iT1Tf4Luz+8cY3fW+wrUj
	T7W6XfLEV5xAsTEKMOGoMJo4THON/XjL4Qu+7JNgMZt+z+f4n6cVOEHXQ1Z49xWSXWHo
	d/Qg==
X-Gm-Message-State: ALoCoQn9FFqpnML0PVeltAmyltmY4Vif3lA/QzKP8sCfgObEhVgZWAZhNObd0uVOQk8lW3E1TaahtTTlqQqy0Alrpi5FwLKa1A==
X-Received: by 10.98.71.130 with SMTP id p2mr28402830pfi.99.1453030625664;
	Sun, 17 Jan 2016 03:37:05 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:39 -0800
Message-Id: <92c0cf48efe02ca249e75f2f71c258505b35bd28.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 06/73] connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:05 -0000

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


