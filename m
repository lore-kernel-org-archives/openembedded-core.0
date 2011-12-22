Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rdi6w-00026J-3d
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:51:02 +0100
Received: by yhoo47 with SMTP id o47so5528251yho.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 04:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=LWP0ZVf4s1lDJWWBjNABbPWhWFii0P7y6fPso5VBzo0=;
	b=CeafbvTCubrIBqKxqMCsx/zwn4mM2olAeJ1e5VrD0Wj3fXqVHCpruv3fRqy+qEz8zZ
	Cr3nRH8NB/cskOF35oUqGocA16E0ZMoIdwYSbah6LhlWXJ+bCeJboYLnwPfiErOhaWtc
	x5hxbsDXElxfQ0D0oQ1tSqltykNNTr49Tk/Hs=
Received: by 10.236.191.39 with SMTP id f27mr14676146yhn.91.1324557833651;
	Thu, 22 Dec 2011 04:43:53 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm23456497anm.6.2011.12.22.04.43.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 04:43:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:43:24 +0000
Message-Id: <3fb984915eb445a2429aaede539e45f559c5f2e9.1324557763.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
Subject: [PATCH v2 4/9] udev: use tabs for init script (no code changes)
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
X-List-Received-Date: Thu, 22 Dec 2011 12:51:02 -0000

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
1.7.2.5



