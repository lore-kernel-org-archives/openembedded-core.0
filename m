Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA1A70034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:39:10 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id fg1so1470413pad.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=81S/mWS3W9babdIGpUNZyCgPcWrormBaHhQPJhHikvg=;
	b=bPW7iRzytTpSDdHJUstgbjijS3cwdbLGjgbmvzPJx6K8HtgipVjm+f3JMo12k076/E
	u31m0P4jTyTGYNcYATzHCkkHLAZd61c9t14kMdEAqGqNyhifprEQo689L00p0Pd7UzZC
	jq4X9LG1PHu+qSPw9sZ37G9Od+wk3ip1hiUOZhr/kIRM/9jv973k/pTzTSl80py293XZ
	nN6c9rR+s2mVdPIYg0t9Jm8Y0lxGfECj6NyY5nqqbx7KCesopWn5Ey+tN6Blhqb53wNt
	mqXyjhFy0exxp0fruWFvVx6BZeKDDWNTtYlHTQO+SrwC4Z0M8FFzRaIvAMU4xZANvjrl
	gvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=81S/mWS3W9babdIGpUNZyCgPcWrormBaHhQPJhHikvg=;
	b=N4DF6m3TnEaFH7Yy45FAfePhNa6W1TdBlaCm4nt8H6ep+r7HyPOihyKageg5U98cvr
	qB8UM5fgfTH/qBay1ONUSjaDHjpmL5T1PCgW7SvOWnbPWNA5Ll2TiDAqU6K3c2EpnvS1
	O/bQ7qKn/9Ef0y9gyv/7NVM11CR1ahuw1FXxA0xtWI2Zbu3BHLAF4FwoRB8MdiNOgkAP
	uuQfs/PuapDMk/FIZ9l9xfKlV2e6hLg0EjPROliXvT7CEGYzlw2PBkppFSCAspKvPDjK
	3kZm5hvWGCfT8MIou1SkOaBRdjpf35eipnXzq3n9lIj1Pb7pBM4w4Hmzi1QK4GT1g9Hc
	aiOQ==
X-Gm-Message-State: ALyK8tI/kT0SCTOxvZR/vMKH0dFYVoLZYl++U8ZuAvZAm07vWwgE4E6DlLl5uyVXDAt9Fg==
X-Received: by 10.66.172.49 with SMTP id az17mr28518600pac.104.1466519950489; 
	Tue, 21 Jun 2016 07:39:10 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	t4sm51199340paf.39.2016.06.21.07.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 07:39:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 07:39:02 -0700
Message-Id: <1466519942-5978-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/3] runqemu: Add qemuppc64
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
X-List-Received-Date: Tue, 21 Jun 2016 14:39:10 -0000

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


