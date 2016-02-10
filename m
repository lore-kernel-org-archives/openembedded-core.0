Return-Path: <dfldashgkv@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 537966FF5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:24:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g62so2919251wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7LEHLKFcw+rB0uB16eJIp0BlNMKvFjYS3LXn1Kxpj8E=;
	b=ADkrqONhJO87x8N60PqlJ2ehUdm4z72s0t5FUiwMDcliyRWOY2OBz38gLFLEQIxUGk
	sHq12BoNeHUiW4Jm72DG7JG176nT8kdqDVVprR2ilxo/rqxsO233i6u+hy1O9W60UNTj
	PWexuBSxZHtVFMtR8jnQUMge5Pdpn6FkiXM0XCQ/i5a2UxTTBPD+Fd3kt56QPBJL6eTU
	783M2ZTLNUSHo9JLBj2WPBk2wTMY7LYV9QZUloqldOzsg801b+2+LfMWf8UMGIrFQ4Fm
	CWb6Q7Z4ZsHhRBDLHmtUb55B3q2TESnUMtLJHxdRkgqZnQjiMf3mb+q9/Vy4vdnC+ts7
	lTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=7LEHLKFcw+rB0uB16eJIp0BlNMKvFjYS3LXn1Kxpj8E=;
	b=b3L5DmA1FTTCBYGbZSo3maUC+QyC4vhuLGGk14Q3tm9dOIB2zXBnxNTjcihutYhQ/R
	lbLaFv2LFQHKz9W/zXiM+djheto338calqMLAxk5WsASNOlG2J48OxzXPEXeJ1KKJD0q
	pKld7U3HBp37eYdhYsi0big9/cE81uhyUpqQ9AyGPmI05sULcxSXKjdgYfyt5AtSjc8s
	Uu10mRzxcZgmE2AuFXHq70KC1JnVUtWk3uSaeLuGr2nyBTZwXCeAfQXunJxeutQV1QAj
	RaPT8fCQlODbxU6526qH0lfhuw2rESgn1u+kYAHEBjX910euC53fMqaR/2sagEkRCjmo
	FsvA==
X-Gm-Message-State: AG10YOTB/6IZvK6uol6bBLV9sxgPSjIXeON+HIzFSmjAIlG75rAoTVivsBium23yzRG4Gw==
X-Received: by 10.195.13.129 with SMTP id ey1mr37756425wjd.132.1455096248855; 
	Wed, 10 Feb 2016 01:24:08 -0800 (PST)
Received: from localhost.localdomain (remote.biotector.com. [31.193.219.90])
	by smtp.gmail.com with ESMTPSA id w8sm2031040wjx.21.2016.02.10.01.24.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 01:24:08 -0800 (PST)
Sender: "Mark O'Donovan" <dfldashgkv@gmail.com>
From: "Mark O'Donovan" <shiftee@eircom.net>
X-Google-Original-From: Mark O'Donovan <modonovan@biotector.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 09:23:53 +0000
Message-Id: <1455096233-22707-1-git-send-email-modonovan@biotector.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455026305.6918.5.camel@linux.intel.com>
References: <1455026305.6918.5.camel@linux.intel.com>
Cc: Mark O'Donovan <modonovan@biotector.com>
Subject: [PATCH v2] udhcpc: specify full path for ip command calls
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
X-List-Received-Date: Wed, 10 Feb 2016 09:24:09 -0000

Signed-off-by: Mark O'Donovan <modonovan@biotector.com>
---
 meta/recipes-core/busybox/busybox.inc         |  3 ++-
 meta/recipes-core/busybox/files/simple.script | 28 +++++++++++++--------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f74d1a4..4827d08 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -258,7 +258,8 @@ do_install () {
 	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
-                install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
+		install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
+		sed -i "s:/SBIN_DIR/:${base_sbindir}/:" ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 	fi
 	if grep "CONFIG_INETD=y" ${B}/.config; then
diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 22168b0..6ed0293 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -14,7 +14,7 @@ root_is_nfs() {
 }
 
 have_bin_ip=0
-if [ -x /sbin/ip ]; then
+if [ -x /SBIN_DIR/ip ]; then
   have_bin_ip=1
   BROADCAST="broadcast +"
 fi
@@ -23,34 +23,34 @@ fi
 
 case "$1" in
 	deconfig)
-		if [ -x /sbin/resolvconf ]; then
-			/sbin/resolvconf -d "${interface}.udhcpc"
+		if [ -x /SBIN_DIR/resolvconf ]; then
+			/SBIN_DIR/resolvconf -d "${interface}.udhcpc"
 		fi
 		if ! root_is_nfs ; then
                         if [ $have_bin_ip -eq 1 ]; then
-                                ip addr flush dev $interface
-                                ip link set dev $interface up
+                                /SBIN_DIR/ip addr flush dev $interface
+                                /SBIN_DIR/ip link set dev $interface up
                         else
-                                /sbin/ifconfig $interface 0.0.0.0
+                                /SBIN_DIR/ifconfig $interface 0.0.0.0
                         fi
 		fi
 		;;
 
 	renew|bound)
                 if [ $have_bin_ip -eq 1 ]; then
-                        ip addr add dev $interface local $ip/$mask $BROADCAST
+                        /SBIN_DIR/ip addr add dev $interface local $ip/$mask $BROADCAST
                 else
-                        /sbin/ifconfig $interface $ip $BROADCAST $NETMASK
+                        /SBIN_DIR/ifconfig $interface $ip $BROADCAST $NETMASK
                 fi
 
 		if [ -n "$router" ] ; then
 			if ! root_is_nfs ; then
                                 if [ $have_bin_ip -eq 1 ]; then
-                                        while ip route del default dev $interface 2>/dev/null ; do
+                                        while /SBIN_DIR/ip route del default dev $interface 2>/dev/null ; do
                                                 :
                                         done
                                 else
-                                        while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
+                                        while /SBIN_DIR/route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
                                                 :
                                         done
                                 fi
@@ -59,9 +59,9 @@ case "$1" in
 			metric=10
 			for i in $router ; do
                                 if [ $have_bin_ip -eq 1 ]; then
-                                        ip route add default via $i metric $metric
+                                        /SBIN_DIR/ip route add default via $i metric $metric
                                 else
-                                        route add default gw $i dev $interface metric $metric 2>/dev/null
+                                        /SBIN_DIR/route add default gw $i dev $interface metric $metric 2>/dev/null
                                 fi
                                 metric=$(($metric + 1))
 			done
@@ -77,8 +77,8 @@ case "$1" in
 "
 		done
 
-		if [ -x /sbin/resolvconf ]; then
-			echo -n "$R" | /sbin/resolvconf -a "${interface}.udhcpc"
+		if [ -x /SBIN_DIR/resolvconf ]; then
+			echo -n "$R" | /SBIN_DIR/resolvconf -a "${interface}.udhcpc"
 		else
 			echo -n "$R" > "$RESOLV_CONF"
 		fi
-- 
1.9.1


