Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0107.outbound.protection.outlook.com [157.56.111.107])
	by mail.openembedded.org (Postfix) with ESMTP id C0A7071144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:00:38 +0000 (UTC)
Received: from CO2PR03CA0045.namprd03.prod.outlook.com (10.141.194.172) by
	BLUPR03MB438.namprd03.prod.outlook.com (10.141.78.149) with Microsoft
	SMTP Server (TLS) id 15.1.59.20; Thu, 22 Jan 2015 06:28:01 +0000
Received: from BY2FFO11FD041.protection.gbl (2a01:111:f400:7c0c::123) by
	CO2PR03CA0045.outlook.office365.com (2a01:111:e400:1414::44) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Thu, 22 Jan 2015
	06:28:00 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD041.mail.protection.outlook.com (10.1.14.226) with Microsoft
	SMTP Server (TLS) id 15.1.59.14 via Frontend Transport;
	Thu, 22 Jan 2015 06:28:00 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0M6Rrle018427; Wed, 21 Jan 2015 23:27:57 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 14:27:50 +0800
Message-ID: <1421908070-13605-2-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1421908070-13605-1-git-send-email-B40290@freescale.com>
References: <1421908070-13605-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(106466001)(105606002)(50986999)(76176999)(85426001)(2351001)(110136001)(104016003)(50226001)(19580405001)(48376002)(229853001)(87936001)(50466002)(6806004)(19580395003)(86362001)(450100001)(77156002)(62966003)(97736003)(2950100001)(77096005)(64706001)(92566002)(36756003)(68736005)(47776003)(46102003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB438;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BLUPR03MB438;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BLUPR03MB438; 
X-Forefront-PRVS: 0464DBBBC4
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB438;
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2015 06:28:00.6211 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB438
Subject: [PATCH v5 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Thu, 22 Jan 2015 07:00:45 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 150 +++++++++++++++++++++++++++++++------
 1 file changed, 129 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c695b73..58725fa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -62,15 +62,56 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
+    
+    if [ "x${UBOOT_CONFIG}" != "x" ]
+    then
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x = "in"x ]
+                then
+                    continue
+                fi
+                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then
+                    break
+                else
+                    oe_runmake O=${config} ${config}
+                    oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
+                    cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                fi
+            done
+        done
+    else
+        oe_runmake ${UBOOT_MACHINE}
+        oe_runmake ${UBOOT_MAKE_TARGET}
+    fi
 
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake ${UBOOT_MAKE_TARGET}
 }
 
 do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    if [ "x${UBOOT_CONFIG}" != "x" ]
+    then
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x = "in"x ]
+                then
+                    continue
+                fi
+                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then
+                    break
+                else
+                    install -d ${D}/boot
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+                fi
+            done
+        done
+    else
+        install -d ${D}/boot
+        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+    fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
         install -d ${D}${sysconfdir}
@@ -79,8 +120,28 @@ do_install () {
 
     if [ "x${SPL_BINARY}" != "x" ]
     then
-        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
-        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        if [ "x${UBOOT_CONFIG}" != "x" ]   
+        then
+            for config in ${UBOOT_MACHINE}; do
+                for type in in ${UBOOT_CONFIG}; do
+                     if [ "${type}"x = "in"x ]
+                     then
+                         continue
+                     fi
+                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}"]
+                     then
+                         break
+                     else
+                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
+                         ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
+                     fi
+                done
+            done
+        else
+            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
+        fi
     fi
 
     if [ "x${UBOOT_ENV}" != "x" ]
@@ -93,21 +154,68 @@ do_install () {
 FILES_${PN} = "/boot ${sysconfdir}"
 
 do_deploy () {
-    install -d ${DEPLOYDIR}
-    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-
-    cd ${DEPLOYDIR}
-    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
-    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
-
-    if [ "x${SPL_BINARY}" != "x" ]
+    if [ "x${UBOOT_CONFIG}" != "x" ]
     then
-        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
-        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-    fi
+        for config in ${UBOOT_MACHINE}; do
+            for type in in ${UBOOT_CONFIG}; do
+                if [ "${type}"x = "in"x ]  
+                then
+                    continue
+                fi
+                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}"]
+                then 
+                    break
+                else
+                    install -d ${DEPLOYDIR}
+                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
+                    cd ${DEPLOYDIR}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+                    ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+                fi 
+            done 
+        done
+    else
+        install -d ${DEPLOYDIR}
+        install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        cd ${DEPLOYDIR}
+        rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+   fi
+    
+
+
+     if [ "x${SPL_BINARY}" != "x" ]
+     then
+         if [ "x${UBOOT_CONFIG}" != "x" ]   
+         then
+             for config in ${UBOOT_MACHINE}; do
+                 for type in in ${UBOOT_CONFIG}; do
+                      if [ "${type}"x = "in"x ]
+                      then
+                          continue
+                      fi
+                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}"]
+                      then
+                          break
+                      else
+                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
+                          rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}
+                      fi
+                 done
+             done
+         else
+             install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+             rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
+             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
+             ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+         fi
+     fi
+
 
     if [ "x${UBOOT_ENV}" != "x" ]
     then
-- 
1.9.2


