Return-Path: <B40290@freescale.com>
X-Greylist: delayed 5594 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Mar 2015 11:11:27 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0138.outbound.protection.outlook.com [157.56.110.138])
	by mail.openembedded.org (Postfix) with ESMTP id E6DA565C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 11:11:27 +0000 (UTC)
Received: from BN3PR0301CA0078.namprd03.prod.outlook.com (25.160.152.174) by
	DM2PR0301MB1200.namprd03.prod.outlook.com (25.160.217.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.99.14; Thu, 5 Mar 2015 09:38:12 +0000
Received: from BL2FFO11FD052.protection.gbl (2a01:111:f400:7c09::167) by
	BN3PR0301CA0078.outlook.office365.com (2a01:111:e400:401e::46) with
	Microsoft
	SMTP Server (TLS) id 15.1.106.15 via Frontend Transport; Thu, 5 Mar 2015
	09:38:12 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD052.mail.protection.outlook.com (10.173.161.214) with
	Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport; Thu, 5 Mar 2015
	09:38:12 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t259c8gF011936;
	Thu, 5 Mar 2015 02:38:09 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2015 17:38:05 +0800
Message-ID: <1425548285-16530-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B40290@freescale.com; freescale.mail.onmicrosoft.com;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:0;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(105606002)(104016003)(92566002)(19580395003)(46102003)(62966003)(110136001)(229853001)(50986999)(77156002)(86362001)(19580405001)(106466001)(48376002)(2351001)(87936001)(450100001)(77096005)(85426001)(6806004)(50226001)(36756003)(50466002)(47776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1200;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1200;
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1200B2902947F971574BCA3AC71F0@DM2PR0301MB1200.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5001007); SRVR:DM2PR0301MB1200; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1200; 
X-Forefront-PRVS: 05066DEDBB
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2015 09:38:12.1991 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1200
Subject: [PATCH] u-boot.inc: fix rename image error
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
X-List-Received-Date: Thu, 05 Mar 2015 11:11:28 -0000
Content-Type: text/plain

  Resolve mismatch between U-Boot configs and uboot image name.
  The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
  and repeat compile or install so we need to check if ${type} match ${config} .

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6bdc86a..aa7c20f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -66,15 +66,13 @@ do_compile () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
+            for type in ${UBOOT_CONFIG}; do
                 if [ "${type}"x = "in"x ]
                 then
                     continue
                 fi
-                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}" ]
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                 then
-                    break
-                else
                     oe_runmake O=${config} ${config}
                     oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
                     cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
@@ -92,15 +90,13 @@ do_install () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
+            for type in ${UBOOT_CONFIG}; do
                 if [ "${type}"x = "in"x ]
                 then
                     continue
                 fi
-                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}" ]
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                 then
-                    break
-                else
                     install -d ${D}/boot
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
@@ -123,15 +119,13 @@ do_install () {
         if [ "x${UBOOT_CONFIG}" != "x" ]   
         then
             for config in ${UBOOT_MACHINE}; do
-                for type in in ${UBOOT_CONFIG}; do
+                for type in ${UBOOT_CONFIG}; do
                      if [ "${type}"x = "in"x ]
                      then
                          continue
                      fi
-                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}" ]
+                     if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                      then
-                         break
-                     else
                          install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
                          ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
@@ -157,15 +151,13 @@ do_deploy () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
     then
         for config in ${UBOOT_MACHINE}; do
-            for type in in ${UBOOT_CONFIG}; do
+            for type in ${UBOOT_CONFIG}; do
                 if [ "${type}"x = "in"x ]  
                 then
                     continue
                 fi
-                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}" ]
-                then 
-                    break
-                else
+                if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
+                then
                     install -d ${DEPLOYDIR}
                     install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
@@ -190,15 +182,13 @@ do_deploy () {
          if [ "x${UBOOT_CONFIG}" != "x" ]   
          then
              for config in ${UBOOT_MACHINE}; do
-                 for type in in ${UBOOT_CONFIG}; do
+                 for type in ${UBOOT_CONFIG}; do
                       if [ "${type}"x = "in"x ]
                       then
                           continue
                       fi
-                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}" ]
+                      if [ "`echo ${config} | cut -d'_' -f2`" = "${type}" ]
                       then
-                          break
-                      else
                           install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
                           rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                           ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
-- 
1.9.2


