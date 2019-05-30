Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E4C3F7E2EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 21:41:26 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u17so4773191pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 14:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=qSIa913X/eojZHRFwVKTEyQL4Ho56g+BjQZGbPBT4zM=;
	b=MVQuglWHNFHZR+pVPQ//doRUhbmAKX9qz28xMGouRVfKbvMMcMYfGGVbF2PiEkXC+P
	hLYi+aWgvlhWJLijK8MxDoc4da5VeuzMLsr1+F+5OSNDrNRdZkwG0C9pRa9juk072pCa
	rY2ZjNdJeH2mBME81EC7F+3Spvq7mpw5MXK+I0TVzshi/ibvNU0Xhzv3UPbVUa1G5Gsn
	ZONGUiTecuFqdSj1H+5Y3UDOx5JNVWoeIN4DG4NxZD6RsI5AGSZgfCtKii4eVmZ7iPXX
	AzqcBLHJnTamee77JyW2MqK0IAR96xm+qPVW9qJiv6zaL/RQlHIS8pMSQBLKHU+2cE5h
	Zx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qSIa913X/eojZHRFwVKTEyQL4Ho56g+BjQZGbPBT4zM=;
	b=BtgFKEfQH0goe58YRpaEsN1MZ1XVrzQ7gv9hpY/Eg1PRPBmbNqafCRr8JHYHjIw0ym
	gQGz01nrVf8ywnC/+1kqoFB/etV0JKXbpkSalEegCZ3qncAN84/fIeJXzgQq4/SkkJUE
	Ri6ZqxGweuObCBEQz4dcD2anI1mbiTokDx/kFe+rbrVhHrpgHZlGTFGrSDR/s0/2PONj
	RFh0X8Z9S/sn/EzQ1SyQPYf265HcC/zBb3RJaGIaxIIbkmJHzwsc0ULvFFcUbR5a8Yv9
	T/+Af2fBzJimrtdTGWqQweHQfZekQy7jtBeJJc2NXQFQ9Yjznt79WJPzKlT7DNbfljQ7
	cIHQ==
X-Gm-Message-State: APjAAAUpStV0661MexJI/e5K0xQjFhyrn70mxY9I+KzdGPFJD0ZM4/+P
	JZ+kdwJHp/2w75yvdqwRRy7ac2uJ
X-Google-Smtp-Source: APXvYqzuQsW85DINWGPU1FgFX/zDHJo+PS1nI/ZgmkN4V/MutuodzSmJHATj2JKF6tFd7K73mP+W9Q==
X-Received: by 2002:a65:56cb:: with SMTP id w11mr5595039pgs.236.1559252487400; 
	Thu, 30 May 2019 14:41:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id
	c142sm4189189pfb.171.2019.05.30.14.41.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 May 2019 14:41:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 14:41:23 -0700
Message-Id: <1559252485-2953-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH 1/3] busybox: Security fixes for CVE-2018-20679 CVE-2019-5747
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
X-List-Received-Date: Thu, 30 May 2019 21:41:27 -0000

Source: busybox.git
MR: 97332
Type: Security Fix
Disposition: Backport from busybox.git
ChangeID: ec203c79e7322de1ed5721d08b6f59b1eca67c7d
Description:

Affects < 1.30.0

Fixes:
CVE-2018-20679
CVE-2019-5747

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../busybox/busybox/CVE-2018-20679.patch           | 142 +++++++++++++++++++++
 .../busybox/busybox/CVE-2019-5747.patch            |  60 +++++++++
 meta/recipes-core/busybox/busybox_1.29.3.bb        |   2 +
 3 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2018-20679.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2019-5747.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2018-20679.patch b/meta/recipes-core/busybox/busybox/CVE-2018-20679.patch
new file mode 100644
index 0000000..e469376
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2018-20679.patch
@@ -0,0 +1,142 @@
+From 6d3b4bb24da9a07c263f3c1acf8df85382ff562c Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 17 Dec 2018 18:07:18 +0100
+Subject: [PATCH] udhcpc: check that 4-byte options are indeed 4-byte, closes
+ 11506
+
+function                                             old     new   delta
+udhcp_get_option32                                     -      27     +27
+udhcp_get_option                                     231     248     +17
+------------------------------------------------------------------------------
+(add/remove: 1/0 grow/shrink: 1/0 up/down: 44/0)               Total: 44 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2018-20679
+
+Affects < 1.30.0
+
+signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ networking/udhcp/common.c | 19 +++++++++++++++++++
+ networking/udhcp/common.h |  4 ++++
+ networking/udhcp/dhcpc.c  |  6 +++---
+ networking/udhcp/dhcpd.c  |  6 +++---
+ 4 files changed, 29 insertions(+), 6 deletions(-)
+
+Index: busybox-1.29.3/networking/udhcp/common.c
+===================================================================
+--- busybox-1.29.3.orig/networking/udhcp/common.c
++++ busybox-1.29.3/networking/udhcp/common.c
+@@ -270,6 +270,15 @@ uint8_t* FAST_FUNC udhcp_get_option(stru
+ 			goto complain; /* complain and return NULL */
+ 
+ 		if (optionptr[OPT_CODE] == code) {
++			if (optionptr[OPT_LEN] == 0) {
++				/* So far no valid option with length 0 known.
++				 * Having this check means that searching
++				 * for DHCP_MESSAGE_TYPE need not worry
++				 * that returned pointer might be unsafe
++				 * to dereference.
++				 */
++				goto complain; /* complain and return NULL */
++			}
+ 			log_option("option found", optionptr);
+ 			return optionptr + OPT_DATA;
+ 		}
+@@ -287,6 +296,16 @@ uint8_t* FAST_FUNC udhcp_get_option(stru
+ 	return NULL;
+ }
+ 
++uint8_t* FAST_FUNC udhcp_get_option32(struct dhcp_packet *packet, int code)
++{
++	uint8_t *r = udhcp_get_option(packet, code);
++	if (r) {
++		if (r[-1] != 4)
++			r = NULL;
++	}
++	return r;
++}
++
+ /* Return the position of the 'end' option (no bounds checking) */
+ int FAST_FUNC udhcp_end_option(uint8_t *optionptr)
+ {
+Index: busybox-1.29.3/networking/udhcp/common.h
+===================================================================
+--- busybox-1.29.3.orig/networking/udhcp/common.h
++++ busybox-1.29.3/networking/udhcp/common.h
+@@ -204,6 +204,10 @@ extern const uint8_t dhcp_option_lengths
+ unsigned FAST_FUNC udhcp_option_idx(const char *name, const char *option_strings);
+ 
+ uint8_t *udhcp_get_option(struct dhcp_packet *packet, int code) FAST_FUNC;
++/* Same as above + ensures that option length is 4 bytes
++ * (returns NULL if size is different)
++ */
++uint8_t *udhcp_get_option32(struct dhcp_packet *packet, int code) FAST_FUNC;
+ int udhcp_end_option(uint8_t *optionptr) FAST_FUNC;
+ void udhcp_add_binary_option(struct dhcp_packet *packet, uint8_t *addopt) FAST_FUNC;
+ #if ENABLE_UDHCPC || ENABLE_UDHCPD
+Index: busybox-1.29.3/networking/udhcp/dhcpc.c
+===================================================================
+--- busybox-1.29.3.orig/networking/udhcp/dhcpc.c
++++ busybox-1.29.3/networking/udhcp/dhcpc.c
+@@ -1694,7 +1694,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+  * They say ISC DHCP client supports this case.
+  */
+ 				server_addr = 0;
+-				temp = udhcp_get_option(&packet, DHCP_SERVER_ID);
++				temp = udhcp_get_option32(&packet, DHCP_SERVER_ID);
+ 				if (!temp) {
+ 					bb_error_msg("no server ID, using 0.0.0.0");
+ 				} else {
+@@ -1721,7 +1721,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+ 				struct in_addr temp_addr;
+ 				uint8_t *temp;
+ 
+-				temp = udhcp_get_option(&packet, DHCP_LEASE_TIME);
++				temp = udhcp_get_option32(&packet, DHCP_LEASE_TIME);
+ 				if (!temp) {
+ 					bb_error_msg("no lease time with ACK, using 1 hour lease");
+ 					lease_seconds = 60 * 60;
+@@ -1817,7 +1817,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+ 					uint32_t svid;
+ 					uint8_t *temp;
+ 
+-					temp = udhcp_get_option(&packet, DHCP_SERVER_ID);
++					temp = udhcp_get_option32(&packet, DHCP_SERVER_ID);
+ 					if (!temp) {
+  non_matching_svid:
+ 						log1("received DHCP NAK with wrong"
+Index: busybox-1.29.3/networking/udhcp/dhcpd.c
+===================================================================
+--- busybox-1.29.3.orig/networking/udhcp/dhcpd.c
++++ busybox-1.29.3/networking/udhcp/dhcpd.c
+@@ -640,7 +640,7 @@ static void add_server_options(struct dh
+ static uint32_t select_lease_time(struct dhcp_packet *packet)
+ {
+ 	uint32_t lease_time_sec = server_config.max_lease_sec;
+-	uint8_t *lease_time_opt = udhcp_get_option(packet, DHCP_LEASE_TIME);
++	uint8_t *lease_time_opt = udhcp_get_option32(packet, DHCP_LEASE_TIME);
+ 	if (lease_time_opt) {
+ 		move_from_unaligned32(lease_time_sec, lease_time_opt);
+ 		lease_time_sec = ntohl(lease_time_sec);
+@@ -987,7 +987,7 @@ int udhcpd_main(int argc UNUSED_PARAM, c
+ 		}
+ 
+ 		/* Get SERVER_ID if present */
+-		server_id_opt = udhcp_get_option(&packet, DHCP_SERVER_ID);
++		server_id_opt = udhcp_get_option32(&packet, DHCP_SERVER_ID);
+ 		if (server_id_opt) {
+ 			uint32_t server_id_network_order;
+ 			move_from_unaligned32(server_id_network_order, server_id_opt);
+@@ -1011,7 +1011,7 @@ int udhcpd_main(int argc UNUSED_PARAM, c
+ 		}
+ 
+ 		/* Get REQUESTED_IP if present */
+-		requested_ip_opt = udhcp_get_option(&packet, DHCP_REQUESTED_IP);
++		requested_ip_opt = udhcp_get_option32(&packet, DHCP_REQUESTED_IP);
+ 		if (requested_ip_opt) {
+ 			move_from_unaligned32(requested_nip, requested_ip_opt);
+ 		}
diff --git a/meta/recipes-core/busybox/busybox/CVE-2019-5747.patch b/meta/recipes-core/busybox/busybox/CVE-2019-5747.patch
new file mode 100644
index 0000000..4225b11
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2019-5747.patch
@@ -0,0 +1,60 @@
+From 74d9f1ba37010face4bd1449df4d60dd84450b06 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 7 Jan 2019 15:33:42 +0100
+Subject: [PATCH] udhcpc: when decoding DHCP_SUBNET, ensure it is 4 bytes long
+
+function                                             old     new   delta
+udhcp_run_script                                     795     801      +6
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2019-5747
+Affects < 1.30.0
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ networking/udhcp/common.c | 2 +-
+ networking/udhcp/common.h | 2 +-
+ networking/udhcp/dhcpc.c  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+Index: busybox-1.29.3/networking/udhcp/common.c
+===================================================================
+--- busybox-1.29.3.orig/networking/udhcp/common.c
++++ busybox-1.29.3/networking/udhcp/common.c
+@@ -300,7 +300,7 @@ uint8_t* FAST_FUNC udhcp_get_option32(st
+ {
+ 	uint8_t *r = udhcp_get_option(packet, code);
+ 	if (r) {
+-		if (r[-1] != 4)
++		if (r[-OPT_DATA + OPT_LEN] != 4)
+ 			r = NULL;
+ 	}
+ 	return r;
+Index: busybox-1.29.3/networking/udhcp/common.h
+===================================================================
+--- busybox-1.29.3.orig/networking/udhcp/common.h
++++ busybox-1.29.3/networking/udhcp/common.h
+@@ -119,7 +119,7 @@ enum {
+ //#define DHCP_TIME_SERVER      0x04 /* RFC 868 time server (32-bit, 0 = 1.1.1900) */
+ //#define DHCP_NAME_SERVER      0x05 /* IEN 116 _really_ ancient kind of NS */
+ //#define DHCP_DNS_SERVER       0x06
+-//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog)
++//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog) */
+ //#define DHCP_COOKIE_SERVER    0x08 /* "quote of the day" server */
+ //#define DHCP_LPR_SERVER       0x09
+ #define DHCP_HOST_NAME          0x0c /* either client informs server or server gives name to client */
+Index: busybox-1.29.3/networking/udhcp/dhcpc.c
+===================================================================
+--- busybox-1.29.3.orig/networking/udhcp/dhcpc.c
++++ busybox-1.29.3/networking/udhcp/dhcpc.c
+@@ -526,7 +526,7 @@ static char **fill_envp(struct dhcp_pack
+ 		temp = udhcp_get_option(packet, code);
+ 		*curr = xmalloc_optname_optval(temp, &dhcp_optflags[i], opt_name);
+ 		putenv(*curr++);
+-		if (code == DHCP_SUBNET) {
++		if (code == DHCP_SUBNET && temp[-OPT_DATA + OPT_LEN] == 4) {
+ 			/* Subnet option: make things like "$ip/$mask" possible */
+ 			uint32_t subnet;
+ 			move_from_unaligned32(subnet, temp);
diff --git a/meta/recipes-core/busybox/busybox_1.29.3.bb b/meta/recipes-core/busybox/busybox_1.29.3.bb
index 6064e9f..5714d70 100644
--- a/meta/recipes-core/busybox/busybox_1.29.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.29.3.bb
@@ -41,6 +41,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcS \
            file://rcK \
            file://makefile-libbb-race.patch \
+           file://CVE-2018-20679.patch \
+	   file://CVE-2019-5747.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.7.4


