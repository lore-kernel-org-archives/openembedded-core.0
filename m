Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDE260111
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 18:16:14 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id us13so13966126pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2016 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=81S/mWS3W9babdIGpUNZyCgPcWrormBaHhQPJhHikvg=;
	b=FZKG7sPc70D8HbIruM8ABV+SOG9cLst0KupsYBtai7xlQTbMWewJx2tF0IrfKCB3P4
	XUiKlVT9kd4fGg/w6nswrEQ5M5w0VFR24h6X4Xb3tX3MWQcCeHvufhQirc9AZSbLP1j1
	sXwHH+sQo3qeQez4Imw4LcHW25rQCGuJfMPN31nii014UR/WtTEO+Difw0FygTbd0iGI
	Xr2YOqd30ix3BF+4ypUZsjQ2twVinz8sp2g0Bl16rkKobxesoJL4biSaZUUlmhlu9aYw
	p9V084GZUWx13Uxh3aSU2QMBxVZs089kxuTHirNVlOpDKDLi0bcUcPGUfemyVo5HYNBh
	hwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=81S/mWS3W9babdIGpUNZyCgPcWrormBaHhQPJhHikvg=;
	b=dVxyYXnH3SMpi8fLpZcPHK4txJsjo/5eHCWQaRAfgLbzBuEkWO0+YYsR2GswctKRBe
	1zpfUvOKlhAa1Achuxpr+Okpa5tYk/ef9aNRZFzfhQI+gylPzdLyQVYx3E2OlKS+nvm3
	o+5sEuntZV9Use4h1uqFHVo/uvm3pee0WHP5Xrd9JWDtHvfgY7Th4whbLD98H/Jvc4Kd
	7AvPM/hKPzgfA22StZZSL3ZrL2XfbzPxQWVPKD3IWc/ntzNfItxZXsC9xuL3LbmLJjr1
	exyyoT1Js/xou9Z2BYkPrMlwRsnfZ94TkzotREv451A7sIc3+eNoQ1rDUUhrhKfmQvVc
	/bOQ==
X-Gm-Message-State: ALyK8tIbrNrWzR7bu7vBi0eAazV/p6buUiQ76fB++L7NETQkyvT5VzjnHicoQyRfXvDSDg==
X-Received: by 10.66.126.179 with SMTP id mz19mr16259156pab.27.1467569775181; 
	Sun, 03 Jul 2016 11:16:15 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 77sm4822770pfp.66.2016.07.03.11.16.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jul 2016 11:16:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun,  3 Jul 2016 11:15:46 -0700
Message-Id: <37b639873fc98fd97aaf72ee67fb89f24dd24f71.1467569369.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
Subject: [PATCH 3/5] runqemu: Add qemuppc64
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
X-List-Received-Date: Sun, 03 Jul 2016 18:16:14 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 scripts/runqemu          |  9 ++++++---
 scripts/runqemu-internal | 24 ++++++++++++++++++------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index de05035..9c73e25 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -121,7 +121,7 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "qemuzynqmp")
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemuppc64" | "qemumicroblaze" | "qemuzynq" | "qemuzynqmp")
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -251,13 +251,13 @@ fi
 if [ -z "$MACHINE" ]; then
     if [ "$IS_VM" = "true" ]; then
         [ "x$FSTYPE" = "xwic" ] && filename=$ROOTFS || filename=$VM
-        MACHINE=`basename $filename | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $filename | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemuppc64\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from image filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on image [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemuppc64\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
@@ -344,6 +344,9 @@ QEMUSH4_DEFAULT_FSTYPE=ext4
 QEMUPPC_DEFAULT_KERNEL=vmlinux-qemuppc.bin
 QEMUPPC_DEFAULT_FSTYPE=ext4
 
+QEMUPPC64_DEFAULT_KERNEL=vmlinux-qemuppc64.bin
+QEMUPPC64_DEFAULT_FSTYPE=ext4
+
 QEMUMICROBLAZE_DEFAULT_KERNEL=linux.bin.ub
 QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ea1a307..e8cc1a1 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -438,15 +438,27 @@ config_qemumips() {
 }
 
 config_qemuppc() {
-    set_mem_size 256
-    QEMU=qemu-system-ppc
-    MACHINE_SUBTYPE=mac99
-    CPU_SUBTYPE=G4
+    case "$MACHINE" in
+        qemuppc)
+            set_mem_size 256
+            QEMU=qemu-system-ppc
+            MACHINE_SUBTYPE=mac99
+            CPU_SUBTYPE=G4
+            MODEL=pcnet
+        ;;
+        qemuppc64)
+            set_mem_size 1024
+            QEMU=qemu-system-ppc64
+            MACHINE_SUBTYPE=pseries
+            CPU_SUBTYPE=POWER7
+            MODEL=e1000
+        ;;
+    esac
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     if [ "$SLIRP_ENABLED" = "yes" ]; then
         QEMU_NETWORK_CMD=""
     else
-        QEMU_NETWORK_CMD="-net nic,model=pcnet $QEMU_TAP_CMD"
+        QEMU_NETWORK_CMD="-net nic,model=$MODEL $QEMU_TAP_CMD"
     fi
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" -o "$FSTYPE" = "wic" ]; then
         KERNCMDLINE="root=$DROOT rw console=ttyS0 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY"
@@ -543,7 +555,7 @@ case "$MACHINE" in
     "qemumips" | "qemumipsel" | "qemumips64")
         config_qemumips
         ;;
-    "qemuppc")
+    "qemuppc" | "qemuppc64")
         config_qemuppc
         ;;
     "qemush4")
-- 
1.9.1


