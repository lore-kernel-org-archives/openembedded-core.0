Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AEE47606D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBRqe0004235 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:27:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1fiXm9GRcCHL
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:27:52 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBRmBo004232
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:27:49 +0100
Message-ID: <1463830068.4578.171.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2016 12:27:48 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] kernel-uimage: Fix python indentation
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
X-List-Received-Date: Sat, 21 May 2016 11:27:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Use spaces, not tabs for python functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index de7ca38..543f543 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -7,12 +7,12 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
 
-	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-	# to kernel.bbclass . We override the variable here, since we need
-	# to build uImage using the kernel build system if and only if
-	# KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
-	# the uImage .
-	if d.getVar("KEEPUIMAGE", True) != 'yes':
+        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+        # to kernel.bbclass . We override the variable here, since we need
+        # to build uImage using the kernel build system if and only if
+        # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
+        # the uImage .
+        if d.getVar("KEEPUIMAGE", True) != 'yes':
             d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "vmlinux")
 }
 



