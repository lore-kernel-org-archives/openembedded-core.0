Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAB178454
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 00:50:35 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id g20-v6so1771764plo.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 17:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fc/N5ZNtw/3nwnivOvOqbQjmaQekhK0J3wBESIapaFk=;
	b=VtQRT+vxUR7WLQsXxFDFMwFxnO7RxSvDA5iH9py83hraQ/3wPB/0vHu8eO0V1MiJiL
	gT4MtH5TyFDMpi0qXJhOj0YzohVNfD8pdtAm5TpRDpobcWLd18orrwWzIPflTu8L5lx6
	uDctpoAI+AUGXqesmicMeilc0WV/a6QJCPi5q4dO1Zl8Fl1gakCu7X5hkdT6RFHDxmgb
	2dMWP2YUcUvxINmoInhFLaqW6Gadpr8xbHgdh57rtzgxFi9WdsQYuzJFMLqhk89HwAl9
	ZPu2XpPInD2Ikae1BuLUpNko4qtNifYbARprjj7UEylWsFjdJ0Vhp6A+D0Pd2kHDCSHW
	Z90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fc/N5ZNtw/3nwnivOvOqbQjmaQekhK0J3wBESIapaFk=;
	b=N8Td6cU9dRECzTWL3IvXP5zlfSr1+Fh1LtGQl35MRnADgKc6mE8EWP8QiLTT2ZVFYQ
	R9r0E8J90CmSfC+a6DRL7HF4WcWcMHqFd51Cw2hhC60CGs8gp3Mn+1PmiUCSRbVeJFln
	e8grw/1EPvE/GIQL3Mp//b+Az+yUaBmctBLflwf6cEK9NmqOZyIvMze8pUzCQhiI1L9U
	fky3uERsBSPP7iVnJAREgr4R8c8gL2RTzw1Pw6V2lBOvJ+TNQBiR5EssdhxpKXV23q4L
	X89eJiczg311uEZAMGN83ogNAhWqb0bd8HYH4k0eSr2b7o2V8rOdiikv1i9J4bek1xxx
	DmQA==
X-Gm-Message-State: AElRT7EoBSyQkf+mWILrpTr7AG+nYf3FraEbbkOO3twdlB9HBq6jwunp
	q6RffipXhmBUh2xd8yEh2xGAS3Ox
X-Google-Smtp-Source: AG47ELuedGnDPdXubH1I4bTnREHvIi63ozLdFSiPbQdKhOj5ax1AYCUoHUw1fbcyuMnBdvv0RoQePg==
X-Received: by 2002:a17:902:341:: with SMTP id
	59-v6mr41567360pld.407.1522111837295; 
	Mon, 26 Mar 2018 17:50:37 -0700 (PDT)
Received: from ip-172-31-22-0.ap-northeast-2.compute.internal
	(ec2-52-78-229-153.ap-northeast-2.compute.amazonaws.com.
	[52.78.229.153])
	by smtp.gmail.com with ESMTPSA id a82sm24547pfj.153.2018.03.26.17.50.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 17:50:36 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2018 00:50:29 +0000
Message-Id: <1522111830-49947-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] iproute2: update 4.14.1 -> 4.15.0
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
X-List-Received-Date: Tue, 27 Mar 2018 00:50:36 -0000

0001-iproute2-de-bash-scripts.patch is applied in upstream repo.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/0001-iproute2-de-bash-scripts.patch   | 63 ----------------------
 .../{iproute2_4.14.1.bb => iproute2_4.15.0.bb}     |  5 +-
 2 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_4.14.1.bb => iproute2_4.15.0.bb} (65%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
deleted file mode 100644
index c3d3fea..0000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-iproute2-de-bash-scripts.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Subject: [PATCH] iproute2: de-bash scripts
-
-de-bash these two scripts to make iproute2 not depend on bash.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- ip/ifcfg | 15 ++++++++-------
- ip/rtpr  |  2 +-
- 2 files changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/ip/ifcfg b/ip/ifcfg
-index 30a2dc4..8677b2e 100644
---- a/ip/ifcfg
-+++ b/ip/ifcfg
-@@ -1,12 +1,13 @@
--#! /bin/bash
-+#! /bin/sh
- 
- CheckForwarding () {
--  local sbase fwd
-+  local sbase fwd forwarding
-   sbase=/proc/sys/net/ipv4/conf
-   fwd=0
-   if [ -d $sbase ]; then
-     for dir in $sbase/*/forwarding; do
--      fwd=$[$fwd + `cat $dir`]
-+      forwarding=`cat $dir`
-+      fwd=$(($fwd+$forwarding))
-     done
-   else
-     fwd=2
-@@ -127,12 +128,12 @@ fi
- arping -q -A -c 1 -I $dev $ipaddr
- noarp=$?
- ( sleep 2 ;
--  arping -q -U -c 1 -I $dev $ipaddr ) >& /dev/null </dev/null &
-+  arping -q -U -c 1 -I $dev $ipaddr ) > /dev/null 2>&1 </dev/null &
- 
--ip route add unreachable 224.0.0.0/24 >& /dev/null
--ip route add unreachable 255.255.255.255 >& /dev/null
-+ip route add unreachable 224.0.0.0/24 > /dev/null 2>&1
-+ip route add unreachable 255.255.255.255 > /dev/null 2>&1
- if [ "`ip link ls $dev | grep -c MULTICAST`" -ge 1 ]; then
--  ip route add 224.0.0.0/4 dev $dev scope global >& /dev/null
-+  ip route add 224.0.0.0/4 dev $dev scope global > /dev/null 2>&1
- fi
- 
- if [ $fwd -eq 0 ]; then
-diff --git a/ip/rtpr b/ip/rtpr
-index c3629fd..674198d 100644
---- a/ip/rtpr
-+++ b/ip/rtpr
-@@ -1,4 +1,4 @@
--#! /bin/bash
-+#! /bin/sh
- 
- exec tr "[\\\\]" "[
- ]"
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb b/meta/recipes-connectivity/iproute2/iproute2_4.15.0.bb
similarity index 65%
rename from meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.15.0.bb
index 81e2e4a..7942bbf 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.14.1.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.15.0.bb
@@ -2,13 +2,12 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
-           file://0001-iproute2-de-bash-scripts.patch \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "1075423d7029e02a8f23ed4f42b7e372"
-SRC_URI[sha256sum] = "d43ac068afcc350a448f4581b6e292331ef7e4e7aa746e34981582d5fdb10067"
+SRC_URI[md5sum] = "0681bf4664b2649ad4e12551a3a7a1f9"
+SRC_URI[sha256sum] = "48d4616a99d7b609b7b795c0ae8ec57099fb0271ed89253e8772c02327798355"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


