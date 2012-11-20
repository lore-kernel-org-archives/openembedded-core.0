Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TajFS-0008Uc-QC for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 09:32:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAK8Hx2J003433
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 08:17:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02860-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 08:17:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAK8Hptm003419
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 08:17:53 GMT
Message-ID: <1353399470.1190.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Nov 2012 08:17:50 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] classes: Drop do_package stamp-extra-info
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
X-List-Received-Date: Tue, 20 Nov 2012 08:32:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This was needed when do_package for target recipes was target specific
however since it now isn't we can remove these stale references.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index d191cd7..21157e5 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -21,4 +21,3 @@ EXCLUDE_FROM_SHLIBS = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INHIBIT_PACKAGE_STRIP = "1"
 
-do_package[stamp-extra-info] = ""
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 7dc20c6..7ab36ac 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -94,4 +94,3 @@ SHLIBSDIRS = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/
 SHLIBSDIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/shlibs/"
 
 do_populate_sysroot[stamp-extra-info] = ""
-do_package[stamp-extra-info] = ""
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index f3a502a..32b14d3 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -27,7 +27,6 @@ target_exec_prefix = "${SDKPATHNATIVE}${exec_prefix_nativesdk}"
 baselib = "lib"
 
 do_populate_sysroot[stamp-extra-info] = ""
-do_package[stamp-extra-info] = ""
 
 # Need to force this to ensure consitency accross architectures
 EXTRA_OECONF_FPU = ""
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1462ffb..c08ca19 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -156,4 +156,3 @@ do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
 do_populate_sysroot[stamp-extra-info] = ""
-do_package[stamp-extra-info] = ""
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 94365e3..8b689e7 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -91,4 +91,3 @@ python () {
 addhandler nativesdk_virtclass_handler
 
 do_populate_sysroot[stamp-extra-info] = ""
-do_package[stamp-extra-info] = ""




