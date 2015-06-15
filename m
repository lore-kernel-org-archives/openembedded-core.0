Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D8448759E7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:04:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2015 11:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="588243863"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 15 Jun 2015 11:04:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 958966A4083;
	Mon, 15 Jun 2015 11:04:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 19:10:46 +0300
Message-Id: <1434384647-2901-10-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 09/10] init-install: code cleanup: Replace tabs with spaces
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
X-List-Received-Date: Mon, 15 Jun 2015 18:04:51 -0000

Cleaned up spaces from init-install* shell scripts.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index a6a8679..dca1432 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -24,22 +24,22 @@ echo "Searching for hard drives ..."
 
 for device in `ls /sys/block/`; do
     case $device in
-	loop*)
+        loop*)
             # skip loop device
-	    ;;
-	sr*)
+            ;;
+        sr*)
             # skip CDROM device
-	    ;;
-	ram*)
+            ;;
+        ram*)
             # skip ram device
-	    ;;
-	*)
-	    # skip the device LiveOS is on
-	    # Add valid hard drive name to the list
-	    if [ $device != $live_dev_name -a -e /dev/$device ]; then
-		hdnamelist="$hdnamelist $device"
-	    fi
-	    ;;
+            ;;
+        *)
+            # skip the device LiveOS is on
+            # Add valid hard drive name to the list
+            if [ $device != $live_dev_name -a -e /dev/$device ]; then
+                hdnamelist="$hdnamelist $device"
+            fi
+            ;;
     esac
 done
 
@@ -49,8 +49,8 @@ for hdname in $hdnamelist; do
     echo "-------------------------------"
     echo /dev/$hdname
     if [ -r /sys/block/$hdname/device/vendor ]; then
-	echo -n "VENDOR="
-	cat /sys/block/$hdname/device/vendor
+        echo -n "VENDOR="
+        cat /sys/block/$hdname/device/vendor
     fi
     if [ -r /sys/block/$hdname/device/model ]; then
         echo -n "MODEL="
@@ -63,18 +63,17 @@ for hdname in $hdnamelist; do
     echo
     # Get user choice
     while true; do
-	echo -n "Do you want to install this image there? [y/n] "
-	read answer
-	if [ "$answer" = "y" -o "$answer" = "n" ]; then
-	    break
-	fi
-	echo "Please answer y or n"
+        echo -n "Do you want to install this image there? [y/n] "
+        read answer
+        if [ "$answer" = "y" -o "$answer" = "n" ]; then
+            break
+        fi
+        echo "Please answer y or n"
     done
     if [ "$answer" = "y" ]; then
-	TARGET_DEVICE_NAME=$hdname
-	break
+        TARGET_DEVICE_NAME=$hdname
+        break
     fi
-
 done
 
 if [ -n "$TARGET_DEVICE_NAME" ]; then
@@ -170,7 +169,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
     fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 2c5d530..df2babd 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -23,22 +23,22 @@ echo "Searching for hard drives ..."
 
 for device in `ls /sys/block/`; do
     case $device in
-	loop*)
+        loop*)
             # skip loop device
-	    ;;
-	sr*)
+            ;;
+        sr*)
             # skip CDROM device
-	    ;;
-	ram*)
+            ;;
+        ram*)
             # skip ram device
-	    ;;
-	*)
-	    # skip the device LiveOS is on
-	    # Add valid hard drive name to the list
-	    if [ $device != $live_dev_name -a -e /dev/$device ]; then
-		hdnamelist="$hdnamelist $device"
-	    fi
-	    ;;
+            ;;
+        *)
+            # skip the device LiveOS is on
+            # Add valid hard drive name to the list
+            if [ $device != $live_dev_name -a -e /dev/$device ]; then
+                hdnamelist="$hdnamelist $device"
+            fi
+            ;;
     esac
 done
 
@@ -48,8 +48,8 @@ for hdname in $hdnamelist; do
     echo "-------------------------------"
     echo /dev/$hdname
     if [ -r /sys/block/$hdname/device/vendor ]; then
-	echo -n "VENDOR="
-	cat /sys/block/$hdname/device/vendor
+        echo -n "VENDOR="
+        cat /sys/block/$hdname/device/vendor
     fi
     if [ -r /sys/block/$hdname/device/model ]; then
         echo -n "MODEL="
@@ -62,16 +62,16 @@ for hdname in $hdnamelist; do
     echo
     # Get user choice
     while true; do
-	echo -n "Do you want to install this image there? [y/n] "
-	read answer
-	if [ "$answer" = "y" -o "$answer" = "n" ]; then
-	    break
-	fi
-	echo "Please answer y or n"
+        echo -n "Do you want to install this image there? [y/n] "
+        read answer
+        if [ "$answer" = "y" -o "$answer" = "n" ]; then
+            break
+        fi
+        echo "Please answer y or n"
     done
     if [ "$answer" = "y" ]; then
-	TARGET_DEVICE_NAME=$hdname
-	break
+        TARGET_DEVICE_NAME=$hdname
+        break
     fi
 done
 
@@ -101,7 +101,7 @@ fi
 
 mkdir -p /tmp
 if [ ! -L /etc/mtab ]; then
-	cat /proc/mounts > /etc/mtab
+    cat /proc/mounts > /etc/mtab
 fi
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
@@ -130,8 +130,8 @@ swap_start=$((rootfs_end))
 rootwait=""
 part_prefix=""
 if [ ! "${device#mmcblk}" = "${device}" ]; then
-	part_prefix="p"
-	rootwait="rootwait"
+    part_prefix="p"
+    rootwait="rootwait"
 fi
 
 if [ $grub_version -eq 0 ] ; then
@@ -204,7 +204,7 @@ if [ -d /tgt_root/etc/ -a $grub_version -ne 0 ] ; then
     echo "UUID=$boot_uuid              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
     fi
 fi
 umount /tgt_root
-- 
2.1.4


