Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 70E987E815
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 08:53:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45ch3V4tGGz4q
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 10:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561971190;
	bh=hzMJ2+Z7+Hz0IGc1GfvDp2JNirCKD5O1UG2eM1x6t4M=;
	h=From:To:Subject:Date:From;
	b=UnOptkUJiyiKIQfeat+KzoHWB7MvJKyr+LzhdNDPa0XTygUR4BgsNOlmZXlCGv4Nc
	UW3+tfvu/GyCT8roN7tcdnQPpVCzxGyJowuAdXhZN4wnuS+LJSiiAL3rbHudMx0Flf
	SApn9WOBe4CXZKGzZ8C0QcMCZdRFVipXS4gTrCc+8+RGDkxSKoEPUvjpPTaLfo3MFJ
	EbwlYaDvCYfRMnQQIKni2XyENgV+vUdH62bsAVDoL7odZ2wo/6SbI5HPe1rhErHY3E
	CK6mQbCS8o3bA/pQ556DIADkUxqd0yL4omrOyPGobapcjztrhcxOhjWIGKD6GORytv
	s29EfHgTl1EpEjHZAgnEy88WA8DnAqeXzto8ngdCISVajj2jMZlLF1PEXFcb0TIlZG
	93S4wLsDX+aJp5AzEQsOPejzypyb9iwjsujZAb13PmQvk+7rN8l8uK5jKooY4Y01E3
	PZYg/8UgrwNZxNBflCaC1Zkch3FG7tXKin6Q0FAa844bTHY7576bio75f+yEBxC2Fj
	FdRUAckE2IhHcsZMDPmEfSncOQVIM63ib+4ZIUgPazSO3TJWCsy7C+nID8iUjgMV0H
	Ushkhp0nIae2Bco00tQsAHyaVblUyQF7VZH7Og2RYHa2hXHHyJ74jrO2VMoy+rjuUm
	n+HDHYZv5gPyrFLBAbzW0z60=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 11:53:09 +0300
Message-Id: <20190701085309.24766-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] unfs3: Switch to new upstream location
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
X-List-Received-Date: Mon, 01 Jul 2019 08:53:10 -0000

This uses the same code revision in the new repository.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{unfs3_0.9.22.r497.bb => unfs3_git.bb}    | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/unfs3/{unfs3_0.9.22.r497.bb => unfs3_git.bb} (63%)

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
similarity index 63%
rename from meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
rename to meta/recipes-devtools/unfs3/unfs3_git.bb
index 5a81a8fdb1..4b2cd5f2ce 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -3,24 +3,14 @@ SECTION = "console/network"
 LICENSE = "unfs3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
 
-# SVN support for upstream version check isn't implemented yet
-RECIPE_UPSTREAM_VERSION = "0.9.22.r497"
-RECIPE_UPSTREAM_DATE = "Oct 08, 2015"
-CHECK_DATE = "Dec 10, 2015"
-
 DEPENDS = "flex-native bison-native flex"
 DEPENDS += "libtirpc"
 DEPENDS_append_class-nativesdk = " flex-nativesdk"
 
 ASNEEDED = ""
 
-MOD_PV = "497"
-S = "${WORKDIR}/trunk"
-# Only subversion url left in OE-Core, use a mirror tarball instead since
-# this rarely changes.
-# svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protocol=http
-# rename the tarball in mirror to avoid clash with user local svn tarball
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/unfs3-0.9.22.r497.tar.gz \
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
            file://unfs3_parallel_build.patch \
            file://alternate_rpc_ports.patch \
            file://fix_pid_race_parent_writes_child_pid.patch \
@@ -31,8 +21,9 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/unfs3-0.9.22.r497.ta
            file://0001-daemon.c-Libtirpc-porting-fixes.patch \
            file://0001-attr-fix-utime-for-symlink.patch \
           "
-SRC_URI[md5sum] = "2e43e471c77ade0331901c40b8f8e9a3"
-SRC_URI[sha256sum] = "21009468a9ba07b72ea93780d025a63ab4e55bf8fc3127803c296f0900fe1bac"
+SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
+
+PV = "0.9.22+${SRCPV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


