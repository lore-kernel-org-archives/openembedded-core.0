Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 40D8B7CFDD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:55:22 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id f18so5949648lja.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6Jkyv5APsMVx8lG2H2tmNn0NBCbEQwX/Y39rMGUXKMg=;
	b=RX7+NL4bL7UF9CRTdrhI1W3CUNc22up5bHQBPplI7oZhEEuGOwI57zD4XLjErrHTZO
	J4ObB1X2d9B0cI3CPNtN3FZuHzlNlb51Ae1KSdJNDWVLDJ89dAEpfyvLo9MQqPv1lYKE
	2SYDVKjx/hDFdJ+AvQcZQT+YKUlYRaB/WMgK/ehlJSi/dT16SYw8tlI/TRU4J+luqplB
	6zlIta6/9kzdi+tbg4wEgkbYg64rqbu+3wmhGFE6evI7eabIV6EYIlLwykPlLe+w8ayN
	NZukaKqs1xwlVDITGRu4z0vHQdpUsSis5pcqSYIxb8SRm+gnS9L1WdSriQ+jOIW8/6ew
	Wsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6Jkyv5APsMVx8lG2H2tmNn0NBCbEQwX/Y39rMGUXKMg=;
	b=rUUzq5S6QwuUrltSTFrkJ2TEj6ewSlzz6PIDGyqrJrW4pKeSD2YfiDKREBmyBcjQ9I
	jZuPyu80Z18zlimbkMxMMuqyiBTyaeSMx+QMDrpxk3LSYfHMv8vinX7ZCh/bPCmQU93l
	vyMZgGL6PrzsOiB/S7tY1aekVpd6odRnTerZsR5SSvcub0H/hjOby3BLu1J694NGdlfV
	8k4XmVh7u8RZX8XEC4Tqng5peZv/DuMiucBjSaSsD8ZXCY3dmUuBIKjKQiWQuYf3gLlw
	t0hOJDIO6v7XaCblMLH4NlAbmaEk+l9sWZSPkl1q2G7TKJREtuOVpwIfeCcXfYmyjdus
	G33A==
X-Gm-Message-State: APjAAAWg8cyWrs/rwwfvh2BPlqSDZhlz2lhiqR6mIfR0OeOnJdNeTnzA
	y9DiXmkWhFXzBoO43DbeMnHxFBk2cO0=
X-Google-Smtp-Source: APXvYqwUcwgQaTkAYhLZm+WERuet/q1wN4dWk7OCaFDEm83YbgUooYvzrw7aTL7VjcMhLT6KqLL7gA==
X-Received: by 2002:a2e:5d94:: with SMTP id v20mr29616953lje.138.1554051322632;
	Sun, 31 Mar 2019 09:55:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d3sm1555688ljc.15.2019.03.31.09.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 09:55:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 18:55:15 +0200
Message-Id: <20190331165515.13754-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] iproute2: update to 5.0.0
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
X-List-Received-Date: Sun, 31 Mar 2019 16:55:23 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../iproute2/iproute2.inc                     | 16 ++++++++--
 .../iproute2/iproute2/configure-cross.patch   | 31 ++++++++++++-------
 .../{iproute2_4.19.0.bb => iproute2_5.0.0.bb} |  4 +--
 3 files changed, 34 insertions(+), 17 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.19.0.bb => iproute2_5.0.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 1aa1eec0de..d72871767f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -18,7 +18,8 @@ CLEANBROKEN = "1"
 PACKAGECONFIG ??= "tipc"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
+                ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
@@ -37,10 +38,19 @@ do_install () {
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
-PACKAGES =+ "${PN}-tc ${PN}-lnstat ${PN}-ifstat ${PN}-genl ${PN}-rtacct ${PN}-nstat ${PN}-ss ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
+PACKAGES =+ "${PN}-tc \
+             ${PN}-lnstat \
+             ${PN}-ifstat \
+             ${PN}-genl \
+             ${PN}-rtacct \
+             ${PN}-nstat \
+             ${PN}-ss \
+             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
-FILES_${PN}-lnstat = "${base_sbindir}/lnstat ${base_sbindir}/ctstat ${base_sbindir}/rtstat"
+FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
+                      ${base_sbindir}/ctstat \
+                      ${base_sbindir}/rtstat"
 FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
 FILES_${PN}-genl = "${base_sbindir}/genl"
 FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
index 8b75a2ada4..b0c4a088fa 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
@@ -1,6 +1,6 @@
-From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
+From 3835b1cc4a55361443c2b37dea688da652217635 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 3 Nov 2011 10:46:16 +0100
+Date: Sun, 31 Mar 2019 17:32:07 +0200
 Subject: [PATCH] make configure cross compile safe
 
 According to Kevin Tian:
@@ -9,11 +9,15 @@ Upstream-Status: Pending
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Shane Wang <shane.wang@intel.com>
 
-Index: iproute2-4.14.1/configure
-===================================================================
---- iproute2-4.14.1.orig/configure
-+++ iproute2-4.14.1/configure
-@@ -2,6 +2,7 @@
+---
+ configure | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 45fcffb6..0c5c9146 100755
+--- a/configure
++++ b/configure
+@@ -3,6 +3,7 @@
  # This is not an autoconf generated configure
  #
  INCLUDE=${1:-"$PWD/include"}
@@ -21,12 +25,15 @@ Index: iproute2-4.14.1/configure
  
  # Output file which is input to Makefile
  CONFIG=config.mk
-@@ -195,7 +196,7 @@ check_ipt_lib_dir()
+@@ -162,7 +163,7 @@ check_ipt_lib_dir()
  		return
  	fi
  
--	for dir in /lib /usr/lib /usr/local/lib
-+	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
- 	do
- 		for file in $dir/{xtables,iptables}/lib*t_*so ; do
+-	for dir in /lib /usr/lib /usr/local/lib; do
++	for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib; do
+ 		for file in "xtables" "iptables"; do
+ 			file="$dir/$file/lib*t_*so"
  			if [ -f $file ]; then
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
index 6db4062d68..c5ac987b6f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.0.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "67eeebacaac4515cab73dfd2fc796af3"
-SRC_URI[sha256sum] = "d9ec5ca1f47d8a85416fa26e7dc1cbf5d067640eb60e90bdc1c7e5bdc6a29984"
+SRC_URI[md5sum] = "d22107b4d7cfb999eeb8ad8a0aec1124"
+SRC_URI[sha256sum] = "df047302a39650ef832c07e8dab5df7a23218cd398bd310c8628e386161d20ba"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


