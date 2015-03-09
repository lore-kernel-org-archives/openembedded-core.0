Return-Path: <B40290@freescale.com>
X-Greylist: delayed 855 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Mar 2015 07:39:17 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0113.outbound.protection.outlook.com [157.56.111.113])
	by mail.openembedded.org (Postfix) with ESMTP id 95E9F7391B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 07:39:17 +0000 (UTC)
Received: from BY2PR03CA055.namprd03.prod.outlook.com (10.141.249.28) by
	BL2PR03MB436.namprd03.prod.outlook.com (10.141.92.26) with Microsoft
	SMTP Server (TLS) id 15.1.112.13; Mon, 9 Mar 2015 07:25:01 +0000
Received: from BN1BFFO11FD027.protection.gbl (2a01:111:f400:7c10::1:180) by
	BY2PR03CA055.outlook.office365.com (2a01:111:e400:2c5d::28) with
	Microsoft
	SMTP Server (TLS) id 15.1.106.15 via Frontend Transport; Mon, 9 Mar 2015
	07:25:00 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD027.mail.protection.outlook.com (10.58.144.90) with
	Microsoft SMTP Server (TLS) id 15.1.112.13 via Frontend Transport;
	Mon, 9 Mar 2015 07:24:59 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t297OvUU025011;
	Mon, 9 Mar 2015 00:24:57 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 15:24:54 +0800
Message-ID: <1425885894-9030-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B40290@freescale.com; freescale.mail.onmicrosoft.com;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(50986999)(46102003)(48376002)(229853001)(50226001)(86362001)(6806004)(19580395003)(92566002)(104016003)(110136001)(2351001)(77156002)(62966003)(450100001)(19580405001)(106466001)(47776003)(85426001)(36756003)(87936001)(50466002)(105606002)(77096005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB436;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB436;
X-Microsoft-Antispam-PRVS: <BL2PR03MB43665D96502802697150AD6841B0@BL2PR03MB436.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002009)(5005006); SRVR:BL2PR03MB436; BCL:0;
	PCL:0; RULEID:; SRVR:BL2PR03MB436; 
X-Forefront-PRVS: 05102978A2
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2015 07:24:59.9310 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB436
Subject: [PATCH v3] u-boot.inc: fix rename image error
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
X-List-Received-Date: Mon, 09 Mar 2015 07:39:19 -0000
Content-Type: text/plain

  Resolve mismatch between U-Boot configs and uboot image name.
  The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
  and repeat compile or install so we need to check if ${type} match ${config} .

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 52 ++++++++------------------------------
 1 file changed, 11 insertions(+), 41 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6bdc86a..27fa809 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -62,19 +62,13 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
-    
+
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]
-                then
-                    continue
-                fi
-                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}" ]
+            for type in ${UBOOT_CONFIG}; do
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                 then
-                    break
-                else
                     oe_runmake O=${config} ${config}
                     oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
                     cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
@@ -92,15 +86,9 @@ do_install () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]
-                then
-                    continue
-                fi
-                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}" ]
+            for type in ${UBOOT_CONFIG}; do
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                 then
-                    break
-                else
                     install -d ${D}/boot
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
@@ -123,15 +111,9 @@ do_install () {
         if [ "x${UBOOT_CONFIG}" != "x" ]   
         then
             for config in ${UBOOT_MACHINE}; do
-                for type in in ${UBOOT_CONFIG}; do
-                     if [ "${type}"x = "in"x ]
+                for type in ${UBOOT_CONFIG}; do
+                     if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                      then
-                         continue
-                     fi
-                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}" ]
-                     then
-                         break
-                     else
                          install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
@@ -157,15 +139,9 @@ do_deploy () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
-                if [ "${type}"x = "in"x ]  
+            for type in ${UBOOT_CONFIG}; do
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                 then
-                    continue
-                fi
-                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}" ]
-                then 
-                    break
-                else
                     install -d ${DEPLOYDIR}
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
@@ -190,15 +166,9 @@ do_deploy () {
          if [ "x${UBOOT_CONFIG}" != "x" ]   
          then
              for config in ${UBOOT_MACHINE}; do
-                 for type in in ${UBOOT_CONFIG}; do
-                      if [ "${type}"x = "in"x ]
-                      then
-                          continue
-                      fi
-                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}" ]
+                 for type in ${UBOOT_CONFIG}; do
+                      if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                       then
-                          break
-                      else
                           install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
                           rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                           ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
-- 
1.9.2


