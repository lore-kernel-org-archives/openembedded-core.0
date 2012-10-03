Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJXPu-0000n9-0L
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 00:27:46 +0200
Received: from localhost (m8a2036d0.tmodns.net [208.54.32.138])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C73F530434
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2012 18:14:38 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 15:13:51 -0700
Message-Id: <080218c6767308d0c75455a9404e30cce8ab5165.1349302333.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349302333.git.scott.a.garman@intel.com>
References: <cover.1349302333.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349302333.git.scott.a.garman@intel.com>
References: <cover.1349302333.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C73F530434.860B9
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/3] runqemu-export-rootfs: use consistent whitespace
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 22:27:46 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-export-rootfs |   94 ++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 3c77dd7..ca79af3 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -40,9 +40,9 @@ NFS_EXPORT_DIR=$(cd "$2" && pwd)
 
 SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
 if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
-    echo "Error: Unable to find the oe-find-native-sysroot script"
-    echo "Did you forget to source your build environment setup script?"
-    exit 1
+	echo "Error: Unable to find the oe-find-native-sysroot script"
+	echo "Did you forget to source your build environment setup script?"
+	exit 1
 fi
 . $SYSROOT_SETUP_SCRIPT
 
@@ -50,9 +50,9 @@ if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd" ]; then
 	echo "Error: Unable to find rpc.mountd binary in $OECORE_NATIVE_SYSROOT/usr/sbin/"
 
 	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
-	    echo "Have you run 'bitbake meta-ide-support'?"
+		echo "Have you run 'bitbake meta-ide-support'?"
 	else
-	    echo "This shouldn't happen - something is missing from your toolchain installation"
+		echo "This shouldn't happen - something is missing from your toolchain installation"
 	fi
 	exit 1
 fi
@@ -104,53 +104,53 @@ case "$1" in
 	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd $MOUNTD_OPTS"
 	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd $MOUNTD_OPTS
 	if [ ! $? = 0 ]; then
-	    echo "====================="
-	    echo "Error starting MOUNTD"
-	    echo "====================="
-	    ps -ef | grep -v grep | grep rpcbind 2>&1 > /dev/null
-	    if [ $? = 0 ] ; then
-		echo "  If you see an error above that says:"
-		echo "    RPC: Authentication error; why = Client credential too weak"
-		echo "  You need to change the startup of rpcbind"
-		echo "  on your host by doing the following as root:"
-		echo "==============================================="
-		echo "  According to /etc/sysconfig/rpcbind, then "
-		echo "    echo RPCBIND_ARGS=-i >> /etc/sysconfig/rpcbind"
-		echo "  or"
-		echo "    echo RPCBIND_OPTIONS=-i >> /etc/sysconfig/rpcbind"
-		echo "    /etc/init.d/rpcbind restart"
-		echo "==============================================="
-		echo "For Ubuntu 11.10 hosts"
-		echo "Add OPTIONS=\"-i -w\"  to /etc/default/rpcbind"
-		echo "sudo service portmap restart"
-	    fi
-	    exit 1
+		echo "====================="
+		echo "Error starting MOUNTD"
+		echo "====================="
+		ps -ef | grep -v grep | grep rpcbind 2>&1 > /dev/null
+		if [ $? = 0 ] ; then
+			echo "  If you see an error above that says:"
+			echo "    RPC: Authentication error; why = Client credential too weak"
+			echo "  You need to change the startup of rpcbind"
+			echo "  on your host by doing the following as root:"
+			echo "==============================================="
+			echo "  According to /etc/sysconfig/rpcbind, then "
+			echo "    echo RPCBIND_ARGS=-i >> /etc/sysconfig/rpcbind"
+			echo "  or"
+			echo "    echo RPCBIND_OPTIONS=-i >> /etc/sysconfig/rpcbind"
+			echo "    /etc/init.d/rpcbind restart"
+			echo "==============================================="
+			echo "For Ubuntu 11.10 hosts"
+			echo "Add OPTIONS=\"-i -w\"  to /etc/default/rpcbind"
+			echo "sudo service portmap restart"
+		fi
+		exit 1
 	fi
 	echo "Starting User Mode nfsd"
 	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.nfsd $NFSD_OPTS"
 	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/rpc.nfsd $NFSD_OPTS
 	if [ ! $? = 0 ]; then
-	    echo "Error starting nfsd"
-	    exit 1
+		echo "Error starting nfsd"
+		exit 1
 	fi
 	# Check to make sure everything started ok.
 	if [ ! -f $MOUNTPID ]; then
-	    echo "rpc.mountd did not start correctly"
-	    exit 1
+		echo "rpc.mountd did not start correctly"
+		exit 1
 	fi
 	if [ ! -f $NFSPID ]; then
-	    echo "rpc.nfsd did not start correctly"
-	    exit 1
+		echo "rpc.nfsd did not start correctly"
+		exit 1
 	fi
 	ps -fp `cat $MOUNTPID` > /dev/null 2> /dev/null
 	if [ ! $? = 0 ]; then
-	    echo "rpc.mountd did not start correctly"
-	    exit 1
+		echo "rpc.mountd did not start correctly"
+		exit 1
 	fi
 	ps -fp `cat $NFSPID` > /dev/null 2> /dev/null
 	if [ ! $? = 0 ]; then
-	    echo "rpc.nfsd did not start correctly"
-	    exit 1
+		echo "rpc.nfsd did not start correctly"
+		exit 1
 	fi
 	echo " "
 	echo "On your target please remember to add the following options for NFS"
@@ -158,29 +158,29 @@ case "$1" in
 	;;
   stop)
 	if [ -f "$MOUNTPID" ]; then
-	    echo "Stopping rpc.mountd"
-	    kill `cat $MOUNTPID`
-	    rm -f $MOUNTPID
+		echo "Stopping rpc.mountd"
+		kill `cat $MOUNTPID`
+		rm -f $MOUNTPID
 	else
-	    echo "No PID file, not stopping rpc.mountd"
+		echo "No PID file, not stopping rpc.mountd"
 	fi
 	if [ -f "$NFSPID" ]; then
-	    echo "Stopping rpc.nfsd"
-	    kill `cat $NFSPID`
-	    rm -f $NFSPID
+		echo "Stopping rpc.nfsd"
+		kill `cat $NFSPID`
+		rm -f $NFSPID
 	else
-	    echo "No PID file, not stopping rpc.nfsd"
+		echo "No PID file, not stopping rpc.nfsd"
 	fi
 	if [ -f "$EXPORTS" ]; then
-        echo "Removing exports file"
-        rm -f $EXPORTS
+		echo "Removing exports file"
+		rm -f $EXPORTS
 	fi
 	;;
   restart)
 	$0 stop $NFS_EXPORT_DIR
 	$0 start $NFS_EXPORT_DIR 
 	if [ ! $? = 0 ]; then
-	    exit 1
+		exit 1
 	fi
 	;;
   *)
-- 
1.7.9.5



