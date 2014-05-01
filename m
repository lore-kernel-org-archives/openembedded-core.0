Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BFC8161EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 14:41:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s41EfLs9002558 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:41:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e7ZXTAcMF8fM
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 15:41:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s41EfICn002555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 May 2014 15:41:19 +0100
Message-ID: <1398955272.30460.82.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 May 2014 15:41:12 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] cross: Update PKG_CONFIG variables after recent changes
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
X-List-Received-Date: Thu, 01 May 2014 14:41:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The PKG_CONFIG definitions should now more closely match those from native.bbclass.
We can't use ${libdir} here since it contains the target arch prefix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index a8f3b60..28fd211 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -21,8 +21,8 @@ STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
-export PKG_CONFIG_DIR = "${STAGING_DIR}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig"
-export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+export PKG_CONFIG_DIR = "${exec_prefix}/lib/pkgconfig"
+export PKG_CONFIG_SYSROOT_DIR = ""
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"



