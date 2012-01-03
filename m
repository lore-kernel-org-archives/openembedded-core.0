Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrJ-0004L1-8u
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752199"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:30 -0800
Message-Id: <d6b7ff13a64c6ff2aa8d1ee089733c9aada539a9.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 044/113] udev: use tabs for init script (no code changes)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jan 2012 06:28:32 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev/init |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 073942f..edc3c9a 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -17,10 +17,10 @@ export TZ=/etc/localtime
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
-        if [ -x /sbin/pidof ]; then
-                pid=`/sbin/pidof -x udevd`
-                [ -n "$pid" ] && kill $pid
-        fi
+	if [ -x /sbin/pidof ]; then
+		pid=`/sbin/pidof -x udevd`
+		[ -n "$pid" ] && kill $pid
+	fi
 }
 
 export ACTION=add
@@ -29,9 +29,9 @@ echo -n "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
 LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
-        mount -n -o mode=0755 -t tmpfs none "/dev"
-        mkdir -m 0755 /dev/pts
-        mkdir -m 1777 /dev/shm
+	mount -n -o mode=0755 -t tmpfs none "/dev"
+	mkdir -m 0755 /dev/pts
+	mkdir -m 1777 /dev/shm
 }
 
 if [ -e /etc/dev.tar ]; then
@@ -42,18 +42,18 @@ fi
 # make_extra_nodes
 kill_udevd > "/dev/null" 2>&1
 
-        # trigger the sorted events
-        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-        /sbin/udevd -d
-
-        /sbin/udevadm control --env=STARTUP=1
-		if [ "$not_first_boot" != "" ];then
-			/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
-			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
-		else
-			/sbin/udevadm trigger --action=add
-			/sbin/udevadm settle
-		fi
+# trigger the sorted events
+echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+/sbin/udevd -d
+
+/sbin/udevadm control --env=STARTUP=1
+if [ "$not_first_boot" != "" ];then
+	/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
+	(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
+else
+	/sbin/udevadm trigger --action=add
+	/sbin/udevadm settle
+fi
 
 echo
 exit 0
-- 
1.7.6.4



