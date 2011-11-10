Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROICt-0006nW-5n for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 01:09:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAA03BwT021585
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:03:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20755-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:03:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAA035MS021579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:03:06 GMT
Message-ID: <1320883387.10843.243.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 00:03:07 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] qemu: Ensure an internal qemugl script uses bash as it has bashisms
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
X-List-Received-Date: Thu, 10 Nov 2011 00:09:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
index bbc9c9e..4fb972a 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
@@ -280,7 +280,7 @@ Index: qemu-0.14.0/target-i386/beginend_funcs.sh
 --- /dev/null
 +++ qemu-0.14.0/target-i386/beginend_funcs.sh
 @@ -0,0 +1,23 @@
-+#! /bin/sh
++#! /bin/bash
 +# Copyright 2008 (C) Intel Corporation
 +#
 +# echo names of functions that are legal between a glBegin and glEnd pair.
diff --git a/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
index bbc9c9e..4fb972a 100644
--- a/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
@@ -280,7 +280,7 @@ Index: qemu-0.14.0/target-i386/beginend_funcs.sh
 --- /dev/null
 +++ qemu-0.14.0/target-i386/beginend_funcs.sh
 @@ -0,0 +1,23 @@
-+#! /bin/sh
++#! /bin/bash
 +# Copyright 2008 (C) Intel Corporation
 +#
 +# echo names of functions that are legal between a glBegin and glEnd pair.
diff --git a/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
index bbc9c9e..4fb972a 100644
--- a/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
@@ -280,7 +280,7 @@ Index: qemu-0.14.0/target-i386/beginend_funcs.sh
 --- /dev/null
 +++ qemu-0.14.0/target-i386/beginend_funcs.sh
 @@ -0,0 +1,23 @@
-+#! /bin/sh
++#! /bin/bash
 +# Copyright 2008 (C) Intel Corporation
 +#
 +# echo names of functions that are legal between a glBegin and glEnd pair.
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index 03519ad..5a0cd55 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r3"
+PR = "r4"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.0.bb b/meta/recipes-devtools/qemu/qemu_0.15.0.bb
index baeb4e9..e2e1340 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r0"
+PR = "r1"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index 59fc7f1..3b4369b 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 PV = "0.14.0"
-PR = "r1"
+PR = "r2"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-git/"
 FILESDIR = "${WORKDIR}"




