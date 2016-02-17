Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E11C731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1HAMP3D007866 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:22:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 30IymsphUOWM
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:22:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1HAMLV0007862
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 10:22:22 GMT
Message-ID: <1455704541.28376.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 10:22:21 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] pcmciautils: Update SRC_URI
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
X-List-Received-Date: Wed, 17 Feb 2016 10:22:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Switch to use KERNELORG_MIRROR.
Use .xz tarball instead of bz2 as not all kernel mirrors carry .bz2 now.

This resolves various checkuri issues on the autobuilder infrastructure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 9d1c55b..581bff4 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "udev sysfsutils flex-native"
 RDEPENDS_${PN} = "udev module-init-tools"
 
-SRC_URI = "http://mirror.linux.org.au/linux/utils/kernel/pcmcia/${BP}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz"
 
 S = "${WORKDIR}/pcmciautils-${PV}"
 
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index d3dde7e..3556a45 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -5,8 +5,8 @@ SRC_URI += "file://makefile_fix.patch \
             file://lex_sys_types.patch \
 "
 
-SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
-SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0dc8ed5"
+SRC_URI[md5sum] = "885431c3cefb76ffdad8cb985134e996"
+SRC_URI[sha256sum] = "57c27be8f04ef4d535bcfa988567316cc57659fe69068327486dab53791e6558"
 
 PR = "r1"
 



