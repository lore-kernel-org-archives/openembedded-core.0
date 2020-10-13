Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.57])
 by mx.groups.io with SMTP id smtpd.web11.9798.1602588807348653287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 04:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4nho2Thn;
 spf=pass (domain: arm.com, ip: 40.107.13.57, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1i6DE4SbEruPoN8m3YyIapXW9V985m9n+MpncufYws=;
 b=4nho2ThnhWGOWTSPCHpveeTT4lAhOYQq6TwANt04WMmcMWcgkNqXv5lwYHaRGScMkeHyRIlbH6davXmryeEhDvqdcpD34o+m2JB2LhFjQdFm9ZdXhwg2WMvnojm4fPMFKshjVfWMPOI8c0muRCARtLinVL2LggjQeuMBRddcDA4=
Received: from AM6P195CA0081.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::22)
 by AM4PR08MB2660.eurprd08.prod.outlook.com (2603:10a6:205:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Tue, 13 Oct
 2020 11:33:23 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::af) by AM6P195CA0081.outlook.office365.com
 (2603:10a6:209:86::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 11:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 11:33:22 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 13 Oct 2020 11:33:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4a2b3706c69c1f7
X-CR-MTA-TID: 64aa7808
Received: from 0939827b2316.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A058574A-CA94-4E71-BBA0-3078B6FA6604.1;
	Tue, 13 Oct 2020 11:32:45 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0939827b2316.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 11:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYNjol1rorM87WaUJR0IMJ7Ge/ILsWQ6uN1JbmaWrS4LaXJVUdy03WO+9iS9bZEb7iQZwYi4DbjtW93Y/cvr6B8Sxx3k3NLmoUC74749jD2R+CLVO8X2oF315Z3Q7VrLBcG+ybjXFZNsF28d4Tr/l9Fa9g7wJmKhDjKlFZapPJ8lh3fgG53b1V82um4BnCtcEyRvB9Ltc7JLXjRDfOeY02XggKpClT6BOcoOAGY6E7PzSm7SKSBKtGN0VqjoO+Q4XU/nLndjK7FQG6wRtPx3i0AosUmkpMHpKeJlUv/fWnsbhZ1/EMwpxBiytxrvXd2UlL8JMH+V44589Vg3UlEoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1i6DE4SbEruPoN8m3YyIapXW9V985m9n+MpncufYws=;
 b=iyOuPlQFFF6Y3T0GjZCxX03IHiVYSDk4B82w73oJvGZlzBuFpxapqEVEgneZy52r1Un9HjRmflNONR6B9zYgecORBWYpcR+lncjOoPHEOZh1j0acpKM7EhaFyTJ+pxc+Uu/R0TlzApyqiAa27jDqVjhMlbuGGtjD84EXaCV4oEN5Q+lEVG04JG/6NqMtngQzoNafCON+ukYHivp6b1U53wlqSVlMTolAW7mv1ts0Th7NjOSvFZpbRzLj8HJ0muvnRiiCTkmDd8u76kr34558KeB4zrSVhmie/+7XMk6sQGjlixtPRZ8w3QdBte2CSL+c3XBcyor36+wsDIfMBDQAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1i6DE4SbEruPoN8m3YyIapXW9V985m9n+MpncufYws=;
 b=4nho2ThnhWGOWTSPCHpveeTT4lAhOYQq6TwANt04WMmcMWcgkNqXv5lwYHaRGScMkeHyRIlbH6davXmryeEhDvqdcpD34o+m2JB2LhFjQdFm9ZdXhwg2WMvnojm4fPMFKshjVfWMPOI8c0muRCARtLinVL2LggjQeuMBRddcDA4=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0802MB2325.eurprd08.prod.outlook.com (2603:10a6:4:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 11:32:43 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 11:32:43 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: openembedded-core@lists.openembedded.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [meta-oe][PATCH 1/2] kernel-fitimage: adding support for Initramfs bundle and u-boot script
Date: Tue, 13 Oct 2020 12:32:31 +0100
Message-Id: <20201013113232.29228-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>
References: <20201013113232.29228-1-abdellatif.elkhlifi@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::34) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27 via Frontend Transport; Tue, 13 Oct 2020 11:32:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c49d2524-2ee5-484c-623d-08d86f6bcafb
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2325:|AM4PR08MB2660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB26607BAD048D64DCF0A087DAFD040@AM4PR08MB2660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TdJHtW5eGxJxGQoJDQRBIsyog2nVLRva2py53I4hok0wk7DUQvqQjoyiFncE910jWzZmpq8UQJAWwMdxV0sP9miMoQRh8hd+YKk2Gaj4QOABu0haPF8WPLTiwqdgj74fmWgSFpGNscvoB3KmOAxNoPJNVW3H/NRixj4dvZR33Be5DOPeSAnFkjPMocC+nQ57pzTEWIutR30PUqtn0i5HHzedZdGQj8QXKpkVYK8V3aBf83QVxKBzRsYnsHOrGCp61vlM1DydEhYXre4WA+D7Ds7AuS5pJFZPzixCXLTMWhKKbnzyrktX+FPRnNc+mXGFx/ZVcMw2cSuPRphsi2I9a+fZ0h262nSckQcLZtB/xtAld/L1uB/2dgCDAqQAEXYMEbcUWts95XaVU8veoP9P1w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(30864003)(966005)(36756003)(66946007)(4326008)(66476007)(66556008)(7696005)(8676002)(478600001)(5660300002)(52116002)(6486002)(2616005)(956004)(6666004)(2906002)(26005)(8936002)(1076003)(9686003)(16526019)(186003)(316002)(86362001)(83080400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 nQims0Nm/bkNA5TioGLwrDIRwasmonjLjHPrHRbts9TWNlo5VTLDWoJCNDqAejkbmAyFyGMJLTPnUKDNjxUATfQzbPMyaDdyaCZmDbzB8oEo1QV36Ml6Tfv02bmEc6doE8KszQpdffYVLJR9Ipi75izNOVks/UbLZXqFVeQEmi8kbCI2b8++pdKKs9EnjM6tT5qsdDTSHMLbaM7JCL8sEF02G23YXzve1BSJddGG147C8+45JImCfaUDAOhFJVY/Do7vMs9C9UHyuQN/8snJIpbQlLFEbXPnP5++BdNN5xhW2JDvXTiwnPPUm5pnXvEJpYPEG7uRYpkA2tAH3U9Xgn1+gLEg+PVeQ3qGNxjM77n6Xeow2xr6oED49uXjN93RQ1N8yV/bUhmQtuz/hBCOv4t+UOTPht6vCvU9Zh6vHeoc9klD8rhv2fqS+GA8sthPTlOZNwQJNzDpCtvMqgLAYKiFg2Xp+BVtWvGsnqVtxjVKUwSe+uUFYr0qeBEQQXThxesqslC6briyaISP9EyS32vAe29xMtF1pwWaNAulAqfv+m/uyVIfL1ox6j0cdsjGXTdZiosmT2BhI48wrc54I6dC876ipjlgGjOAZKx/x6Cx4k6kcrB/fIIiqlzDXfT3hXWJr5nvOSq7/7tMmTzoyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2325
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	66401c77-419e-405b-51a2-08d86f6bb239
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ov4a6hOB5U/OdnK3/hJWVstdhOk4AlZAEFRoqsT7B1FINZhcz/SglBdS0AJUIp6NmG1q34ZD03o5PbfLt4RdW39/KbGiJJBqGtTFrY8KtDe3zlAt6OLuDI2FJzZQvcOnEXvlnulKIWTtNnZHdcg8Ek0eXhQB4j9MV+ugHGemI5ErEZixrjCrb74MKheWbrDm3K2E8x7J7ExPK4S8IGbJ6H/wS4l3EFUf6n2TtvgYGcEppEgLdKYzQn1kdlR5vgLOiEv1APkU3nqfYYA4zPRMtU+5gjRQfXcRywzST1dd9tMGef9e16N2f3m8S3oJzysDg1Zxl8FK3wraeF56ewpVTgTrymZOjt+76KJFtQk68yh5ntYA3f8OJSFTHFkUAcaz8d6Su8twxr4coOujOK78zxHQCJ3yVRWrlHJ4FjlNL7kFF5AaJV5XJm05FrK+dUGJit0iRyfDhuH7u3y/g0KcXu7ehtFYkSjk6hFCcehW3PU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(47076004)(2616005)(956004)(36756003)(356005)(2906002)(5660300002)(6666004)(8936002)(86362001)(30864003)(83380400001)(8676002)(336012)(82740400003)(316002)(82310400003)(7696005)(83080400001)(478600001)(966005)(4326008)(6486002)(81166007)(36906005)(186003)(16526019)(70586007)(9686003)(70206006)(26005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 11:33:22.9797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c49d2524-2ee5-484c-623d-08d86f6bcafb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2660
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds Initramfs bundle support to the FIT image in addition
to u-boot boot script capability.

These new features are selectable.

In case of Initramfs, the kernel is configured to be bundled with the rootfs
in the same binary (ie: zImage-initramfs-<machine>.bin). When the kernel is
copied to RAM and executed, it unpacks the Initramfs rootfs.

For more information about Initramfs please read:

https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt

For more details about the Initramfs bundle and boot script implementation
please check the kernel-fitimage.bbclass paragraph in Yocto reference
or mega manual.

Current limitations:

- Initramfs bundle FIT support has been tested on ARM 32-bit
- The kernel image type in case of ARM 32-bit is zImage

Change-Id: I901bfd899e8d733c5b9a2b6645b1d4748f4b1fda
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta/classes/kernel-fitimage.bbclass | 148 ++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 24 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index bb2f3c4ccc..f94d4d1b3d 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,5 +1,7 @@
 inherit kernel-uboot kernel-artifact-names uboot-sign
 
+KERNEL_IMAGETYPE_REPLACEMENT = ""
+
 python __anonymous () {
     kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
     if 'fitImage' in kerneltypes.split():
@@ -21,6 +23,8 @@ python __anonymous () {
         else:
             replacementtype = "zImage"
 
+        d.setVar("KERNEL_IMAGETYPE_REPLACEMENT", replacementtype)
+
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
         # to kernel.bbclass . We have to override it, since we pack zImage
         # (at least for now) into the fitImage .
@@ -45,6 +49,8 @@ python __anonymous () {
         if d.getVar('UBOOT_SIGN_ENABLE') == "1" and d.getVar('UBOOT_DTB_BINARY'):
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
+            if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
+                d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
@@ -190,6 +196,30 @@ fitimage_emit_section_dtb() {
 EOF
 }
 
+#
+# Emit the fitImage ITS u-boot script section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to boot script image
+fitimage_emit_section_boot_script() {
+
+        bootscr_csum="${FIT_HASH_ALG}"
+
+        cat << EOF >> ${1}
+                bootscr@${2} {
+                        description = "U-boot script";
+                        data = /incbin/("${3}");
+                        type = "script";
+                        arch = "${UBOOT_ARCH}";
+                        compression = "none";
+                        hash@1 {
+                                algo = "${bootscr_csum}";
+                        };
+                };
+EOF
+}
+
 #
 # Emit the fitImage ITS setup section
 #
@@ -260,8 +290,9 @@ EOF
 # $2 ... Linux kernel ID
 # $3 ... DTB image name
 # $4 ... ramdisk ID
-# $5 ... config ID
-# $6 ... default flag
+# $5 ... u-boot script ID
+# $6 ... config ID
+# $7 ... default flag
 fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
@@ -277,6 +308,7 @@ fitimage_emit_section_config() {
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
+	bootscr_line=""
 	setup_line=""
 	default_line=""
 
@@ -307,11 +339,17 @@ fitimage_emit_section_config() {
 	fi
 
 	if [ -n "${5}" ]; then
+		conf_desc="${conf_desc}${sep}u-boot script"
+		sep=", "
+		bootscr_line="bootscr = \"bootscr@${5}\";"
+	fi
+
+	if [ -n "${6}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
-		setup_line="setup = \"setup@${5}\";"
+		setup_line="setup = \"setup@${6}\";"
 	fi
 
-	if [ "${6}" = "1" ]; then
+	if [ "${7}" = "1" ]; then
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "${3}" ]; then
@@ -324,10 +362,11 @@ fitimage_emit_section_config() {
 	cat << EOF >> ${1}
                 ${default_line}
                 $conf_node {
-			description = "${6} ${conf_desc}";
+			description = "${7} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
+			${bootscr_line}
 			${setup_line}
                         hash@1 {
                                 algo = "${conf_csum}";
@@ -355,6 +394,11 @@ EOF
 		fi
 
 		if [ -n "${5}" ]; then
+			sign_line="${sign_line}${sep}\"bootscr\""
+			sep=", "
+		fi
+
+		if [ -n "${6}" ]; then
 			sign_line="${sign_line}${sep}\"setup\""
 		fi
 
@@ -386,6 +430,7 @@ fitimage_assemble() {
 	DTBS=""
 	ramdiskcount=${3}
 	setupcount=""
+	bootscr_id=""
 	rm -f ${1} arch/${ARCH}/boot/${2}
 
 	fitimage_emit_fit_header ${1}
@@ -396,7 +441,22 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} imagestart
 
 	uboot_prep_kimage
-	fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
+
+	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+		initramfs_bundle_path="arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE_REPLACEMENT}".initramfs"
+		if [ -e "${initramfs_bundle_path}" ]; then
+
+			#
+			# Include the kernel/rootfs bundle.
+			#
+
+			fitimage_emit_section_kernel ${1} "${kernelcount}" "${initramfs_bundle_path}" "${linux_comp}"
+		else
+			bbwarn "${initramfs_bundle_path} not found."
+		fi
+	else
+		fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
+	fi
 
 	#
 	# Step 2: Prepare a DTB image section
@@ -430,7 +490,21 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 3: Prepare a setup section. (For x86)
+	# Step 3: Prepare a u-boot script section
+	#
+
+	if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
+		if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
+			cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
+			bootscr_id="${UBOOT_ENV_BINARY}"
+			fitimage_emit_section_boot_script ${1} "${bootscr_id}" ${UBOOT_ENV_BINARY}
+		else
+			bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
+		fi
+	fi
+
+	#
+	# Step 4: Prepare a setup section. (For x86)
 	#
 	if [ -e arch/${ARCH}/boot/setup.bin ]; then
 		setupcount=1
@@ -438,9 +512,9 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 4: Prepare a ramdisk section.
+	# Step 5: Prepare a ramdisk section.
 	#
-	if [ "x${ramdiskcount}" = "x1" ] ; then
+	if [ "x${ramdiskcount}" = "x1" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
@@ -461,13 +535,15 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 5: Prepare a configurations section
+	# Step 6: Prepare a configurations section
 	#
 	fitimage_emit_section_maint ${1} confstart
 
 	# kernel-fitimage.bbclass currently only supports a single kernel (no less or
 	# more) to be added to the FIT image along with 0 or more device trees and
 	# 0 or 1 ramdisk.
+        # It is also possible to include an initramfs bundle (kernel and rootfs in one binary)
+        # When the initramfs bundle is used ramdisk is disabled.
 	# If a device tree is to be part of the FIT image, then select
 	# the default configuration to be used is based on the dtbcount. If there is
 	# no dtb present than select the default configuation to be based on
@@ -479,13 +555,13 @@ fitimage_assemble() {
 			if [ "${dtb_ext}" = "dtbo" ]; then
 				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} = ${dtbcount}`"
 			else
-				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
+				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
 			fi
 			i=`expr ${i} + 1`
 		done
 	else
 		defaultconfigcount=1
-		fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${setupcount}" "${defaultconfigcount}"
+		fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${bootscr_id}"  "${setupcount}" "${defaultconfigcount}"
 	fi
 
 	fitimage_emit_section_maint ${1} sectend
@@ -493,7 +569,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} fitend
 
 	#
-	# Step 6: Assemble the image
+	# Step 7: Assemble the image
 	#
 	uboot-mkimage \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
@@ -501,7 +577,7 @@ fitimage_assemble() {
 		arch/${ARCH}/boot/${2}
 
 	#
-	# Step 7: Sign the image and add public key to U-Boot dtb
+	# Step 8: Sign the image and add public key to U-Boot dtb
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
 		add_key_to_u_boot=""
@@ -532,7 +608,11 @@ do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
 		test -n "${INITRAMFS_IMAGE}" ; then
 		cd ${B}
-		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage ""
+		else
+			fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
+		fi
 	fi
 }
 
@@ -571,22 +651,27 @@ kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
-		echo "Copying fit-image.its source file..."
-		install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
-		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
 
-		echo "Copying linux.bin file..."
-		install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
-		ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+			echo "Copying fit-image.its source file..."
+			install -m 0644 ${B}/fit-image.its "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
+			ln -snf fitImage-its-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${KERNEL_FIT_LINK_NAME}"
+
+			echo "Copying linux.bin file..."
+			install -m 0644 ${B}/linux.bin $deployDir/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
+			ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}"
+		fi
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
 			install -m 0644 ${B}/fit-image-${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
 			ln -snf fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
 
-			echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
-			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
-			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ]; then
+				echo "Copying fitImage-${INITRAMFS_IMAGE} file..."
+				install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin"
+				ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}"
+			fi
 		fi
 		if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
 			# UBOOT_DTB_IMAGE is a realfile, but we can't use
@@ -596,3 +681,18 @@ kernel_do_deploy_append() {
 		fi
 	fi
 }
+
+# The function below performs the following in case of initramfs bundles:
+# - Removes do_assemble_fitimage. FIT generation is done through
+#   do_assemble_fitimage_initramfs. do_assemble_fitimage is not needed
+#   and should not be part of the tasks to be executed.
+# - Since do_generate_rsa_keys is inserted by default
+#   between do_compile and do_assemble_fitimage, this is
+#   not suitable in case of initramfs bundles.  do_generate_rsa_keys
+#   should be between do_bundle_initramfs and do_assemble_fitimage_initramfs.
+python () {
+    if d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
+        bb.build.deltask('do_assemble_fitimage', d)
+        bb.build.deltask('generate_rsa_keys', d)
+        bb.build.addtask('generate_rsa_keys', 'do_assemble_fitimage_initramfs', 'do_bundle_initramfs', d)
+}
\ No newline at end of file
-- 
2.17.1

