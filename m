Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 91F1A6DF29
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 16:25:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5GOvOt016503 for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 16:24:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rRI0OL50zCdO
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 16:24:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB5GOrMK016494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 16:24:54 GMT
Message-ID: <1386260688.25847.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Dec 2013 16:24:48 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] mx/lttng-*: Fix git branch references
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
X-List-Received-Date: Thu, 05 Dec 2013 16:25:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ensure the right branches are set in SRC_URI to match the revisions
used. This resolves certain fetch failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
index 5657469..ce35b61 100644
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -4,7 +4,7 @@ require mx.inc
 SRCREV = "9b1db6b8060bd00b121a692f942404a24ae2960f"
 PV = "1.4.7+git${SRCPV}"
 
-SRC_URI = "git://github.com/clutter-project/mx.git \
+SRC_URI = "git://github.com/clutter-project/mx.git;branch=mx-1.4 \
 	   file://fix-build-dir.patch \
 	   file://fix-test-includes.patch \
 	  "
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
index f293376..dd06546 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
@@ -13,7 +13,7 @@ inherit module
 SRCREV = "eef112db0e63feff6cbf0a98cda9af607cefb377"
 PV = "2.3.3"
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git \
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.3 \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
index 2f6e504..e0ce564 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN}-ptest += "make"
 SRCREV = "5d985544a7ad54afa0514ea7f522a89d8d844860"
 PV = "v2.3.1"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git \
+SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.3 \
            file://runtest.patch \
            file://run-ptest \
 	  "
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
index ae52ee8..bfcd3b6 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
@@ -21,7 +21,7 @@ SRCREV = "535d0408caee93577c2b4d8ad3cd672fa97eac1d"
 PV = "2.3.1"
 PE = "2"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git \
+SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.3 \
 	   "
 
 S = "${WORKDIR}/git"



