Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB28C021A4
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 19:16:19 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.24835.1739387769459817279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 11:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YKl1DFdx;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f768e9be1aso10839347b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387768; x=1739992568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QK87lUR352qam2EqRfSxcY6ffBd33DJNvnThS5DFW98=;
        b=YKl1DFdxpOhD5NhFmj5ggnoembQBqZT6pg+YeuAFbEciCBAlnznYWT4LDCDdoErL2y
         1K3kssybQojHxB5JlwbUEAZiuNc7wXPUOV4DJ+RuH7pow8tEnv9y5aA0RDZ3U9bCSGDN
         sYxf6M1EqZ8naYNZB6lTYE8ZwBQdhbiFil29hX2tWz+dEDdrv9BhNdkwblukPk8ZvBNA
         iTG0u1egc51+iOvScNQlhUBs5HIfr/gnNSrXLmYEDNgZkO64+VuT9C2uFKz6pJ5PNe3Z
         RsmS8i0OyOBvT4+Nq6CjOTtfLSzq9HUF1rVKHL6BsvncZkkm8i6Wc7hcekvs9RZ/2epX
         JPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387768; x=1739992568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK87lUR352qam2EqRfSxcY6ffBd33DJNvnThS5DFW98=;
        b=gEh6I+2ssI1ciBxFrJZ8CKcLJzr3vher0MDp94/yKqjkv4C3F+vIzNuWDottKfGNA2
         42UaDZ67fShxfGSsaS8vCHwkwyOn1hpqkaTdqZ3qtI9oufAlsCjtHzSnMGIms/mkX8mp
         ZOdAl0SyXwnJb0e8eehkWes55vZI471KEgQfNs6+3hvpukqXbE7jl87zF3jpH1zrCRYu
         J5wXI0YB6z2i0sFeejD1qNwMk25dMmJTjpaXB6KTEKvBNsGLZimYiJIiozGNQNWMOwD6
         /3OQT32LGBMaSqx6vKZKN+aZPY6J79okFWgh27SA8g0KKe9XycXnmhBobSJZTr9SuzMS
         +ZcA==
X-Gm-Message-State: AOJu0Yz6HZWjkdNYKcvOC9Cj5LKxFgjY+Klr8SxcXJGtOjBDqI7KZq4T
	kvNxja/bKKeXqcH3aNzqEksLbj3g1rFw/Vuj0jdja07PuT90RDmvnKBXUQ==
X-Gm-Gg: ASbGncunm+EXNTD/b7QD1TsTzZUjt+0c1xsDtXAqmJwHD/8tnE16hcs+evaEbNmfuon
	uNMzF6qUcsnySnefH3fYIh5BkDVBjOswDzQVbrVsvzXFV45jsX8KgrDgdioXFcD2mqZa7isqHLU
	0J8gXWRRGGjsWsI2yz+iXu4VDxruSsJ/avXPcoU5WhL6sI/rvp8IJaJTG9iKqTR/HiULCbap3KC
	vkGlL0jQERiYbEy9oj0xYsmo6EVFByMdkFxicU1QI450SiD2d1FH4CLW94+iTGFJfUSYp8rD5Gf
	JPpTKZ/fQ+e+2VHzGWLSTdWIdv+cHaEUCh0ED9Ec
X-Google-Smtp-Source: AGHT+IHsnO92prgvx4kPdoqdo65IV4zvte5kKXO4b6UKs/hlDJAGadpKxcJgtMsyhrtsQyvYuMYlMQ==
X-Received: by 2002:a05:690c:2a45:b0:6f9:5a36:577d with SMTP id 00721157ae682-6fb33c9fac9mr1508357b3.9.1739387768372;
        Wed, 12 Feb 2025 11:16:08 -0800 (PST)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fce16d1sm28115017b3.23.2025.02.12.11.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:16:07 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 4/4] nfs-utils: Start nfsv4 utilities with sysvinit
Date: Wed, 12 Feb 2025 13:12:32 -0600
Message-ID: <20250212191518.1968329-4-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250212191518.1968329-1-danismostlikely@gmail.com>
References: <20250212191518.1968329-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 19:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211276

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Rewrite the nfs sysvinit scripts to start the services required
by nfsv4: gssd, idmapd, and statd.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 .../nfs-utils/nfs-utils/nfscommon             | 294 +++++++++++++++---
 .../nfs-utils/nfs-utils/nfsserver             |  43 ++-
 2 files changed, 289 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
index 4f07324a21f..6c7b92bdb1b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
@@ -1,63 +1,279 @@
 #!/bin/sh
+
 ### BEGIN INIT INFO
 # Provides:          nfs-common
 # Required-Start:    $portmap $time
 # Required-Stop:     $portmap $time
 # Default-Start:     S
 # Default-Stop:      0 1 6
-# Short-Description: NFS support for both client and server
+# Short-Description: NFS support files common to client and server
 # Description:       NFS is a popular protocol for file sharing across
-#                    TCP/IP networks. This service provides various
+#		     TCP/IP networks. This service provides various
 #                    support functions for NFS mounts.
 ### END INIT INFO
-#
-# Startup script for nfs-utils
-#
-#
-# Location of executables:
 
-# Source function library.
+# What is this?
+DESC="NFS common utilities"
+
+# Read config
+DEFAULTFILE=/etc/default/nfs-utils
+NEED_STATD=
+NEED_GSSD=
+if nfsconf --isset general pipefs-directory; then
+    PIPEFS_MOUNTPOINT=$(nfsconf --get general pipefs-directory)
+else
+    PIPEFS_MOUNTPOINT=/var/lib/nfs/rpc_pipefs
+fi
+if [ -f $DEFAULTFILE ]; then
+    . $DEFAULTFILE
+fi
+
 . /etc/init.d/functions
 
-test -x "$NFS_STATD" || NFS_STATD=/usr/sbin/rpc.statd
-test -z "$STATD_PID" && STATD_PID=/run/rpc.statd.pid
+# Exit if required binaries are missing.
+[ -x /usr/sbin/rpc.statd ] || exit 0
+
 #
-# The default state directory is /var/lib/nfs
-test -n "$NFS_STATEDIR" || NFS_STATEDIR=/var/lib/nfs
+# Parse the fstab file, and determine whether we need gssd. (The
+# /etc/defaults settings, if any, will override our autodetection.) This code
+# is partially adapted from the mountnfs.sh script in the sysvinit package.
 #
-#----------------------------------------------------------------------
-# Startup and shutdown functions.
-#  Actual startup/shutdown is at the end of this file.
-
-start_statd(){
-	echo -n "starting statd: "
-	start-stop-daemon --start --exec "$NFS_STATD" --pidfile "$STATD_PID"
-	echo done
+AUTO_NEED_GSSD=no
+
+if [ -f /etc/fstab ]; then
+    exec 9<&0 </etc/fstab
+
+    while read -r DEV _ _ OPTS _
+    do
+	case $DEV in
+	    ''|\#*)
+		continue
+		;;
+	esac
+	OLDIFS="$IFS"
+	IFS=","
+	for OPT in $OPTS; do
+	    case "$OPT" in
+		sec=krb5|sec=krb5i|sec=krb5p)
+		    AUTO_NEED_GSSD=yes
+		;;
+	    esac
+	done
+	IFS="$OLDIFS"
+    done
+
+    exec 0<&9 9<&-
+fi
+
+case "$NEED_STATD" in
+    yes|no)
+        ;;
+    *)
+        NEED_STATD=yes
+        ;;
+esac
+
+case "$NEED_IDMAPD" in
+    yes|no)
+        ;;
+    *)
+        NEED_IDMAPD=yes
+	;;
+esac
+
+case "$NEED_GSSD" in
+    yes|no)
+        ;;
+    *)
+        NEED_GSSD=$AUTO_NEED_GSSD
+	;;
+esac
+
+do_modprobe() {
+    if [ -x /sbin/modprobe ] && [ -f /proc/modules ]
+    then
+        modprobe -q "$1" || true
+    fi
+}
+
+do_mount() {
+    if ! grep -E -qs "$1\$" /proc/filesystems
+    then
+	return 1
+    fi
+    if ! mountpoint -q "$2"
+    then
+	mount -t "$1" "$1" "$2"
+	return
+    fi
+    return 0
 }
-stop_statd(){
-	echo -n 'stopping statd: '
-	start-stop-daemon --stop --quiet --signal 1 --pidfile "$STATD_PID"
-	echo done
+
+do_umount() {
+    if mountpoint -q "$1"
+    then
+	umount "$1"
+    fi
+    return 0
 }
-#----------------------------------------------------------------------
-#
-# supported options:
-#  start
-#  stop
-#  restart: stops and starts mountd
-#FIXME: need to create the /var/lib/nfs/... directories
+
+# See how we were called.
 case "$1" in
   start)
-	start_statd;;
+	echo -n "Starting $DESC ..."
+
+	if [ "$NEED_STATD" = yes ]; then
+	    echo -n " statd"
+
+	    # See if rpcbind is running
+	    if [ -x /usr/sbin/rpcinfo ]; then
+		/usr/sbin/rpcinfo -p >/dev/null 2>&1
+		RET=$?
+		if [ $RET != 0 ]; then
+		   echo
+		   echo "Not starting: portmapper is not running"
+		   exit 0
+		fi
+	    fi
+	    start-stop-daemon --start --oknodo --quiet \
+		--pidfile /run/rpc.statd.pid \
+	        --exec /sbin/rpc.statd
+	    RET=$?
+	    if [ $RET != 0 ]; then
+	        echo " failed" $RET
+	        exit $RET
+	    else
+		if [ -d /run/sendsigs.omit.d ]; then
+		    rm -f /run/sendsigs.omit.d/statd
+		    ln -s /run/rpc.statd.pid /run/sendsigs.omit.d/statd
+		fi
+	    fi
+	fi
+
+	# Don't start idmapd and gssd if we don't have them (say, if /usr is not
+	# up yet).
+	[ -x /usr/sbin/rpc.idmapd ] || NEED_IDMAPD=no
+	[ -x /usr/sbin/rpc.gssd   ] || NEED_GSSD=no
+
+	if [ "$NEED_IDMAPD" = yes ] || [ "$NEED_GSSD" = yes ]
+	then
+	    do_modprobe sunrpc
+	    do_modprobe nfs
+	    do_modprobe nfsd
+	    mkdir -p "$PIPEFS_MOUNTPOINT"
+	    if do_mount rpc_pipefs $PIPEFS_MOUNTPOINT
+	    then
+	    	if [ "$NEED_IDMAPD" = yes ]
+		then
+	            ecno -n " idmapd"
+		    start-stop-daemon --start --oknodo --quiet \
+			    --exec /usr/sbin/rpc.idmapd
+		    RET=$?
+	            if [ $RET != 0 ]; then
+        	        echo " failed" $RET
+        	        exit $RET
+                    fi
+		fi
+		if [ "$NEED_GSSD" = yes ]
+		then
+		    do_modprobe rpcsec_gss_krb5
+	            echo -n " gssd"
+
+		    start-stop-daemon --start --oknodo --quiet \
+			    --exec /usr/sbin/rpc.gssd
+		    RET=$?
+	            if [ $RET != 0 ]; then
+        	        echo " failed" $RET
+        	        exit $RET
+                    fi
+		fi
+	    fi
+	fi
+	echo " done"
+	;;
+
   stop)
-	stop_statd;;
+	echo -n "Stopping $DESC ..."
+
+	if [ "$NEED_GSSD" = yes ]
+	then
+	    echo -n " gssd"
+	    start-stop-daemon --stop --oknodo --quiet \
+		    --name rpc.gssd
+	    RET=$?
+	    if [ $RET != 0 ]; then
+                echo " failed" $RET
+                exit $RET
+            fi
+	fi
+	if [ "$NEED_IDMAPD" = yes ]
+	then
+	    echo -n " idmapd"
+	    start-stop-daemon --stop --oknodo --quiet \
+		--name rpc.idmapd
+            RET=$?
+	    if [ $RET != 0 ]; then
+                echo " failed" $RET
+                exit $RET
+            fi
+	fi
+	if [ "$NEED_STATD" = yes ]
+	then
+	    echo -n " statd"
+	    start-stop-daemon --stop --oknodo --quiet \
+	        --name rpc.statd
+	    RET=$?
+	    if [ $RET != 0 ]; then
+                echo " failed" $RET
+                exit $RET
+            fi
+	fi
+	do_umount $PIPEFS_MOUNTPOINT 2>/dev/null || true
+	echo " done"
+	;;
+
   status)
-	status $NFS_STATD
-	exit $?;;
-  restart)
+	if [ "$NEED_STATD" = yes ]
+	then
+	    if ! pidof rpc.statd >/dev/null
+	    then
+	        echo "rpc.statd not running"
+	        exit 3
+	    fi
+	fi
+
+	if [ "$NEED_GSSD" = yes ]
+	then
+            if ! pidof rpc.gssd >/dev/null
+	    then
+		echo "rpc.gssd not running"
+		exit 3
+	    fi
+	fi
+
+	if [ "$NEED_IDMAPD" = yes ]
+	then
+            if ! pidof rpc.idmapd >/dev/null
+	    then
+		echo "rpc.idmapd not running"
+		exit 3
+	    fi
+	fi
+
+	echo "all daemons running"
+	exit 0
+	;;
+
+  restart | force-reload)
 	$0 stop
-	$0 start;;
+	sleep 1
+	$0 start
+	;;
+
   *)
-	echo "Usage: $0 {start|stop|status|restart}"
-	exit 1;;
+	echo "Usage: nfscommon {start|stop|status|restart}"
+	exit 1
+	;;
 esac
+
+exit 0
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index 0f5747cc6db..cb6c1b4d08d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -1,8 +1,10 @@
 #!/bin/sh
+
 ### BEGIN INIT INFO
 # Provides:          nfs-kernel-server
-# Required-Start:    $remote_fs nfs-common $portmap hwclock
-# Required-Stop:     $remote_fs nfs-common $portmap hwclock
+# Required-Start:    $remote_fs nfs-common $portmap $time
+# Required-Stop:     $remote_fs nfs-common $portmap $time
+# Should-Start:      $named
 # Default-Start:     2 3 4 5
 # Default-Stop:      0 1 6
 # Short-Description: Kernel NFS server support
@@ -19,20 +21,25 @@
 #
 # The environment variable NFS_SERVERS may be set in /etc/default/nfsd
 # Other control variables may be overridden here too
-test -r /etc/default/nfsd && . /etc/default/nfsd
+test -r /etc/default/nfs-utils && . /etc/default/nfs-utils
 #
 # Location of executables:
 test -x "$NFS_MOUNTD" || NFS_MOUNTD=/usr/sbin/rpc.mountd
 test -x "$NFS_NFSD" || NFS_NFSD=/usr/sbin/rpc.nfsd
+test -x "$NFS_SVCGSSD" || NFS_SVCGSSD=/usr/sbin/rpc.svcgssd
 #
 # The user mode program must also exist (it just starts the kernel
 # threads using the kernel module code).
 test -x "$NFS_MOUNTD" || exit 0
 test -x "$NFS_NFSD" || exit 0
-#
-# Default is 8 threads, value is settable between 1 and the truely
-# ridiculous 99
-test "$NFS_SERVERS" != "" && test "$NFS_SERVERS" -gt 0 && test "$NFS_SERVERS" -lt 100 || NFS_SERVERS=8
+
+case "$NEED_SVCGSSD" in
+	yes|no)
+		;;
+	*)
+		NEED_SVCGSSD=no
+		;;
+esac
 #
 #----------------------------------------------------------------------
 # Startup and shutdown functions.
@@ -49,6 +56,22 @@ stop_mountd(){
 	echo done
 }
 #
+#svcgssd
+start_svcgssd(){
+	modprobe -q rpcsec_gss_krb5
+	if [ "$NEED_SVCGSSD" = "yes" ]; then
+		echo -n "starting svcgssd: "
+		start-stop-daemon --start --exec "$NFS_SVCGSSD" -- "$@"
+		echo done
+	fi
+}
+stop_svcgssd(){
+	if [ "$NEED_SVCGSSD" = "yes" ]; then
+		echo -n "stop svcgssd: "
+		start-stop-daemon --stop --exec "$NFS_SVCGSSD"
+		echo done
+	fi
+}
 #nfsd
 start_nfsd(){
         modprobe -q nfsd
@@ -62,7 +85,7 @@ start_nfsd(){
 		exit 1
         }
 
-	echo -n "starting $1 nfsd kernel threads: "
+	echo -n "starting nfsd: "
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
 }
@@ -108,11 +131,13 @@ stop_nfsd(){
 case "$1" in
   start)
 	test -r /etc/exports && exportfs -r
-	start_nfsd "$NFS_SERVERS"
+	start_nfsd
+	start_svcgssd
 	start_mountd
 	test -r /etc/exports && exportfs -a;;
   stop)	exportfs -ua
 	stop_mountd
+	stop_svcgssd
 	stop_nfsd;;
   status)
 	status /usr/sbin/rpc.mountd
-- 
2.47.0


