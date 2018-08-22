Return-Path: <ahedges@student.ethz.ch>
X-Greylist: delayed 383 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Aug 2018 06:27:07 UTC
Received: from edge10.ethz.ch (edge10.ethz.ch [82.130.75.186])
	by mail.openembedded.org (Postfix) with ESMTP id 676357900D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:27:07 +0000 (UTC)
Received: from CAS10.d.ethz.ch (172.31.38.210) by edge10.ethz.ch
	(82.130.75.186) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 22 Aug 2018 08:20:31 +0200
Received: from MBX215.d.ethz.ch ([fe80::8572:f435:81be:9baf]) by
	CAS10.d.ethz.ch ([fe80::cce:fc66:7b56:a06a%10]) with mapi id
	14.03.0415.000; Wed, 22 Aug 2018 08:20:32 +0200
From: "Hedges  Alexander" <ahedges@student.ethz.ch>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] Fix inconsistent indentation
Thread-Index: AdQ54DrHUM7t9U4PQvCOk8H2+1sQ8Q==
Date: Wed, 22 Aug 2018 06:20:32 +0000
Message-ID: <5D23E7CAADD3BE4A97642792FFC691C561C97BF1@MBX215.d.ethz.ch>
Accept-Language: en-US, de-CH
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.132.139.7]
MIME-Version: 1.0
Subject: [PATCH] Fix inconsistent indentation
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
X-List-Received-Date: Wed, 22 Aug 2018 06:27:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 23438137cea726c9144db29b593b7034f5ac2408 Mon Sep 17 00:00:00 2001=0A=
From: Alexander Hedges <ahedges@ethz.ch>=0A=
Date: Tue, 21 Aug 2018 19:17:50 +0200=0A=
=0A=
This removes some extra spaces.=0A=
=0A=
Signed-off-by: Alexander Hedges <ahedges@ethz.ch>=0A=
---=0A=
 meta/recipes-bsp/u-boot/u-boot.inc | 54 +++++++++++++++---------------=0A=
 1 file changed, 27 insertions(+), 27 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc=0A=
index 95c2f4db14..48fbc57215 100644=0A=
--- a/meta/recipes-bsp/u-boot/u-boot.inc=0A=
+++ b/meta/recipes-bsp/u-boot/u-boot.inc=0A=
@@ -231,7 +231,7 @@ do_deploy () {=0A=
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}=0A=
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}=0A=
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}=0A=
-   fi=0A=
+    fi=0A=
 =0A=
     if [ -n "${UBOOT_ELF}" ]=0A=
     then=0A=
@@ -263,32 +263,32 @@ do_deploy () {=0A=
 =0A=
      if [ -n "${SPL_BINARY}" ]=0A=
      then=0A=
-         if [ -n "${UBOOT_CONFIG}" ]=0A=
-         then=0A=
-             for config in ${UBOOT_MACHINE}; do=0A=
-                 i=3D$(expr $i + 1);=0A=
-                 for type in ${UBOOT_CONFIG}; do=0A=
-                     j=3D$(expr $j + 1);=0A=
-                     if [ $j -eq $i ]=0A=
-                     then=0A=
-                         install -m 644 ${B}/${config}/${SPL_BINARY} ${DEP=
LOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}=0A=
-                         rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}=
/${SPL_SYMLINK}-${type}=0A=
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYD=
IR}/${SPL_BINARYNAME}-${type}=0A=
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYD=
IR}/${SPL_BINARYNAME}=0A=
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYD=
IR}/${SPL_SYMLINK}-${type}=0A=
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYD=
IR}/${SPL_SYMLINK}=0A=
-                     fi=0A=
-                 done=0A=
-                 unset  j=0A=
-             done=0A=
-             unset  i=0A=
-         else=0A=
-             install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}=
=0A=
-             rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLI=
NK}=0A=
-             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}=0A=
-             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}=0A=
-         fi=0A=
-     fi=0A=
+        if [ -n "${UBOOT_CONFIG}" ]=0A=
+        then=0A=
+            for config in ${UBOOT_MACHINE}; do=0A=
+                i=3D$(expr $i + 1);=0A=
+                for type in ${UBOOT_CONFIG}; do=0A=
+                    j=3D$(expr $j + 1);=0A=
+                    if [ $j -eq $i ]=0A=
+                    then=0A=
+                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPL=
OYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}=0A=
+                        rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/=
${SPL_SYMLINK}-${type}=0A=
+                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_BINARYNAME}-${type}=0A=
+                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_BINARYNAME}=0A=
+                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_SYMLINK}-${type}=0A=
+                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_SYMLINK}=0A=
+                    fi=0A=
+                done=0A=
+                unset  j=0A=
+            done=0A=
+            unset  i=0A=
+        else=0A=
+            install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}=0A=
+            rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLIN=
K}=0A=
+            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}=0A=
+            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}=0A=
+        fi=0A=
+    fi=0A=
 =0A=
 =0A=
     if [ -n "${UBOOT_ENV}" ]=0A=
-- =0A=
2.17.1=0A=

