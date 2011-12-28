Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfzin-0007mz-Qj
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:34 +0100
Received: by yhoo47 with SMTP id o47so7413885yho.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=LWP0ZVf4s1lDJWWBjNABbPWhWFii0P7y6fPso5VBzo0=;
	b=KWTqLfDU8wOrNobS7hbGwcAeK9fVQwsGP7pgAjtlH3xmugnSixlV/Im4/U6X0ByHEl
	K4kGECObGYnoGfF//eYwvm+y0SIOmQycKnf3gyEUtz6FGjRpRS8oTciLht/jn+AXtrhb
	5yhxlKp6IIC5Oo375DBfR3uUG3zorrKraaxFk=
Received: by 10.236.116.9 with SMTP id f9mr45247278yhh.0.1325102175134;
	Wed, 28 Dec 2011 11:56:15 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:30 +0000
Message-Id: <431f2e2e3d0f2101b9c44f13db34c46f6b3134f7.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 09/16] udev: use tabs for init script (no code changes)
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:35 -0000

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



