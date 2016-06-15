Return-Path: <ting.liu@nxp.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0100.outbound.protection.outlook.com [157.56.110.100])
	by mail.openembedded.org (Postfix) with ESMTP id B29316FFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 15:16:41 +0000 (UTC)
Received: from BLUPR0301CA0001.namprd03.prod.outlook.com (10.162.113.139) by
	CY1PR03MB2380.namprd03.prod.outlook.com (10.167.8.6) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.517.8; Wed, 15 Jun 2016 15:01:36 +0000
Received: from BN1AFFO11FD028.protection.gbl (2a01:111:f400:7c10::196) by
	BLUPR0301CA0001.outlook.office365.com (2a01:111:e400:5259::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.523.12 via
	Frontend Transport; Wed, 15 Jun 2016 15:01:36 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD028.mail.protection.outlook.com (10.58.52.88) with Microsoft
	SMTP Server (TLS) id 15.1.511.7 via Frontend Transport;
	Wed, 15 Jun 2016 15:01:35 +0000
Received: from mercury.localdomain (mercury.ap.freescale.net [10.192.208.79])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5FF1W1b009288; Wed, 15 Jun 2016 08:01:33 -0700
From: <ting.liu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2016 23:01:10 +0800
Message-ID: <1466002870-9934-1-git-send-email-ting.liu@nxp.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131104764962157639;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(50466002)(106466001)(5003940100001)(2906002)(2876002)(8936002)(81166006)(8676002)(50226002)(356003)(8666005)(4326007)(77096005)(86152002)(5008740100001)(87936001)(68736007)(97736004)(81156014)(229853001)(19580405001)(47776003)(48376002)(19580395003)(33646002)(50986999)(104016004)(189998001)(86362001)(105606002)(85426001)(6806005)(586003)(2351001)(92566002)(110136002)(11100500001)(36756003)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR03MB2380;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; CAT:NONE; LANG:en;
	CAT:NONE; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD028;
	1:CbuxlRG6o0+Zitmr4X4jI9Du+EooyKqPo+BVXPGpctYYd1r9OQWTtsbWuUOtg7mpF9kApeWyzGjzsu4z3YCotxdR+RMlYR9JBqF2Cg+YBAWVOEQSPdpFv4YY+gx/QIf8JJmEIogGZ8UwFs8ZWCHh1qJiwoNInKiAkpYPSA6VOVXaPX7RjJy0tvgkMPsOfSnaQqhjHWmBxVoSYOikxlb0kPItRt7ViFo0Ux3qNc8QXA5gVzYxKQOVKu1ab3r+xqi/Tm7XybDNxk9rIus/I0xdSbllfbLnqQyiig3n+R/LNPaINnLECDqXJCvQIDac00RKI1QDjoG9jXxna0EFNWRW5Z7RGKLV7MA/lQp5gRwbzrK1NETMGxStd4v/R5qWJ3vzrV7lVPYhIKD7zR+0pOTBoxWaz7wUaNQ/oqjXHTjYLk+RDjSdpac2dHJYbt7OgE4zFLGZPy6FIlnKbWpokRcGeARYoEfYoJfEeeysbDLMPnU5qHw4vNnNMlJ5ZoF5sfMI1ZnFknQZ7qY93CRykqlhQgYvZKMfaBn+9I17ETTR1dEwk+8ZfWYzNj3WFQbI0UPTH3gcpFo17TVUa4lm3uW4lj4wHF2Xqj4axQuObwpiyfJOMfuBy5A1h6x47GS071JMOWiJvV9NxHswdNTeRbvTQbFmj76Ob/l4B+v1eVYVyRfqiQSx9HMTuG/mhaWKcQjA
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8d4e8644-0a0e-40c4-d2e7-08d3952df262
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2380;
	2:qdUs3wniu2gALZvsmctDpvSeUvrVSw5tmP+drb2m6U9UFS8eakCv8IlMBOtMm9ptPjsEBzGwVhCTCR4hmY+4hxTEg4cw7fZ3Bemb2njLQ6b7qFQEoBCH7t6ve2yH5dpq1jjYQBvdVFZ4l4JcazH1xJdjJWlAgG8po860BkEFD9XqCETOWLWVieynAQxrc0fx;
	3:vqJ4JxXvhsVPlFVTnpbfy42CX3WGVWoUcn1nxnWBXgW6jsDfoOT8Dh/R6TqQYEJ3r+79Bqyu35b1h1dihbarPh/t3ov0eXt5DdfOLCguZoI5n7DVQS/7Zls3NRHjn3DiIYHp6f6vFyeH5KlvldqnKmzrPJ2Ba25b8R7rJoJR9L7ngUSLq00n+28YAyLkfQlIvORv8kVhKLjJHPhYDV8+lkikVX6KoUFTVhJIMObRq9A=;
	25:ZFjgZZauDdRjVt9eC8GGj9QoBSCQvIIAq9Zy26+lY+dZ/D8kWN9Mxzg4ySQW4vkIvClnZ/MtsVdQVJFCut/+xO0Ie4Vj3DconLW/1VTTNl1I7ndQvhtVlcQrL47bVBlJrqUlFn2j8TNa4bbjyNE3rKpVBcOxpfrqBKyCQmpS/KfaR71IJN7UoVJgsF0wMOBfQrPXSzJHLGXhgoub3t7jkSMpx9bCAh1rDcD/Q5W0mwmNTxDCkAnV42blcxCrkai/2DSvDKG0kNMBZFOR+k9ojvrbwbPMPzGc73TX7gCrfjTF0UB1iE0v/hILmoo63zOwcUSoYRYjgSWxLjh48Vg4cRd1QmXm5HPSLZ2+i59GHsz4R0806wkjOBRyhWSL8HVD4y3OgrH7GkXiI3CBEE4RSlq9yvhrugBa6cEG0bDAqx0=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR03MB2380;
X-Microsoft-Antispam-PRVS: <CY1PR03MB23800904D1489775C91F795D99550@CY1PR03MB2380.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(13024025)(13018025)(13017025)(13015025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:CY1PR03MB2380; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR03MB2380; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2380;
	4:IEt8lO/DR/xrAGFeIbO15qAEOJSxE+aMYER2kUc9MrSZ5LCiV8g/wTP5BdJgohmo9noiob0KLSBhvcLzyOFCn0L2fe6t26Bw4yIYbAKJ/wn3yQ73iBBQ4/U9qh7L7PL3dXClkTV1FxyNKlILPlNj0svhlwXNKU4rSJjPonTz+xrmiFFH8VtO/QzcJry9/edr5V/hQDTGYHlrS21uREcF7WWaYA5+xV+1PVTA4Ys8P6SIQinHppUqx1cNYgZyd00QE+3dYV2UGY19au4eYBy9Z23W0YQVo2d1uuIFKgf1hnn4pHWRLYalK79vQyDfpK+WjqTg+8omY0gciCLGhsu5fl3tEBPdh6Kk8B5f7z1se2bifOJ9OX8aIrPJo+xDw3plOOJqQ3OGFxYpGYkFMGu2QTBLkqsYKUqFOPFJgxKDtsO4S9rrswn69nfiIRSL7PULUVjPcRESbxmi9AKc9+uQ9eRqCAMVy3s0WzcTFKuZSBhq5hrk3OoUPf6dAOD3Befq4RUZ+JwNI1bJwINp3NGd0g==
X-Forefront-PRVS: 09749A275C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB2380;
	23:yY2PuR51IHUu3fQ9N0IqRsFYFiwwZMEMdngOfuPyY?=
	=?us-ascii?Q?Ig8FvAr3taeyE1my9cjUcvYoX6nyY/NF0J7Pigfvh5AHB8OrPzRjv3CEM4CC?=
	=?us-ascii?Q?yD6u/gxGVN/78a6qADZEveswuutqSxAmshB6PpsHhcytEPA60Hlnx1Wtvx6H?=
	=?us-ascii?Q?8Ms5HmaUwGtpzCIRiB6WmIbk1VdvDVsPAcDF5o/6KCcas9Q7T4rDzLNbYA6y?=
	=?us-ascii?Q?sylKzeCkPQ7HT8zzQBv1HqWwtdJNDuw3NdI0WblzD+mdFN5jnLUhDfJan2Z+?=
	=?us-ascii?Q?Uep+dBlcSALGMv/Pof4IQwriZLnVO07NjmNtdEWGDmsUl4Kn3kppj+fbO9ID?=
	=?us-ascii?Q?bxTAhqfov6n0dVwCZreux5bG+4a/IvYfIpAjQeBG0p5UYoUTUCmLcoY+krmS?=
	=?us-ascii?Q?Zzqk32LB3QgxrMXlIdLqDS2aVJTKeJ4eMMbFDffzuqVyVwkmVC/6Fn305zds?=
	=?us-ascii?Q?p2wWYkj6bqN0AzgdXri5WvCL092HYc969h50d53vnBfe26KllgLEZFbkVSUf?=
	=?us-ascii?Q?9D8ReSf/zznjkW5USGrpcZ79jHGhwvk1REoHjvJVg0BKd7YltjC/bLeq5c2M?=
	=?us-ascii?Q?/ecz5Hs/brDRkycXrfAnGMOKTRC25sWlY9tTSc5/znScCEsszSkSRYj5GF8H?=
	=?us-ascii?Q?nsApkq1e4YFSUDdqDmf6Naty+fRgnYFoAbPCqLJbyiqHJ4NihgKuKguocn4Z?=
	=?us-ascii?Q?UGYOv0zsRMfSVi0Cxzg8d5U4DeeLCmSTFFbDqU46597yOBp++XKQzrg5mJP0?=
	=?us-ascii?Q?N+QyK+DP8mOjNx1vSMwKLRNVPUq1e0loZ43jVPZ+eoPCB1K4nJ/mKV06sg/Y?=
	=?us-ascii?Q?6KiSnYFRqN1awH4+/ppVnqElLe1xEEUtl8ZNBqutEvDfavbHPRRO+RYympzs?=
	=?us-ascii?Q?p5OY4R4sscwMjCWFC/bBs0U6j4XvWHAJrjA9/PCS2DlEwAFvMhC1XPmEDDYT?=
	=?us-ascii?Q?vxGAcmZUYxhET/JxHYPFuOTILcnQvX3NwV3dbLsgZ7ll+PsDGyE9fPBuLRVX?=
	=?us-ascii?Q?JDpDkxwVDSQ0LxkR6EsjiBCERQaH4eZKBM+F+jBGDyGO32CPvnM1aD7ALiKp?=
	=?us-ascii?Q?ivV/J0RF0BygCXjsXXJNpgen9O+mnrb4fbCu+GJqpdyJ09T+1EFXTz12S2Dk?=
	=?us-ascii?Q?aqCMRR9q7VGaSoNIyoBtwwHUVqJX/Y7k1+4/bH7xkQbn5qUv7uL6A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2380;
	6:nKGbzEv6pnK1P5jop0yIdlzkjc7dURpiCrVFCVsylj3ZaGexhjkx2S3MepJh2GstVnZC0LEtxoxeYMvzlOaHwox9l+HDQi5Sh1NBsoh44/zAf7Y8xqWRqln9q3ATOQlr6J33UbZmEuRMO8/X4dGNJqXImPNqN51ZXI99gFzZzf/5HjgWjBqZ9Ws+dJoj8HMXAgr9fv45gPWEYxx9lH35HK84BO0ds+SpFsR9VAOx4k3m7jW3qo066wJptJfZwYid1RiGXLl5zDT6rWbYjuU+rQ==;
	5:GE05EALHoSb3uCizpKnnvRSe7KAKhKhsR72nGYNN6VhhkC7gYS+fkU6YO3suwWNj60+Y1AKir5CeVr0Zvmg/Tjj2Ft/PhdmHh9KOF/pGCTnnehLzssth/lKdlAXv+6+a+/u96L/RCJANf0G67a7VW9TZ7KDoL2RbnV3fXV1qKMM=;
	24:yWHAfvTg38C94kRheCpPVdqw+a6WuS0WbZvvMOT0zZh4ZklUlklnerndyFVR3CmtG2P56pABxwjWy60FmSk2PDnmK/9wfnjEDpqlolmyKds=;
	7:NxSFkYOlDiyBHXLTIiUZdtqrLXzioOjJlMArzy3JlQsnZq8sAP+Nr0Qs2rNBJDPouYJiGcF9DbzgKBJofhQn/MCRh1B+OJbJPxEoDA4MdO9UlFSEIxatV57Ubx/uzk9LZglWjH8wKNF1gioIeoWWe3/6ltLX9gZz4L8e3ZvgGfqqhEzpKZxd/O9nk82NL7q5h9v1hzcgweVR/gfjHEpyCw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2016 15:01:35.9349 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2380
Subject: [PATCH v2] u-boot: extend UBOOT_CONFIG format to support different binary name
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
X-List-Received-Date: Wed, 15 Jun 2016 15:16:42 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@nxp.com>

When using UBOOT_CONFIG format, the final u-boot binary for each config
may have different names. Extend UBOOT_CONFIG format to support different
binary to be copied.

The new format is supposed to be compatible with old one as ${UBOOT_BINARY}
is copied by default, and images,binary can be empty.

An example format to specify it, in the machine, is:
UBOOT_CONFIG ??= "sdcard-ifc sdcard-qspi lpuart qspi secure-boot nor"
UBOOT_CONFIG[nor] = "ls1021atwr_nor_config,,u-boot-dtb.bin"
UBOOT_CONFIG[sdcard-ifc] = "ls1021atwr_sdcard_ifc_config,,u-boot-with-spl-pbl.bin"
UBOOT_CONFIG[sdcard-qspi] = "ls1021atwr_sdcard_qspi_config,,u-boot-with-spl-pbl.bin"
UBOOT_CONFIG[lpuart] = "ls1021atwr_nor_lpuart_config,,u-boot-dtb.bin"
UBOOT_CONFIG[qspi] = "ls1021atwr_qspi_config,,u-boot-dtb.bin"
UBOOT_CONFIG[secure-boot] = "ls1021atwr_nor_SECURE_BOOT_config"

Signed-off-by: Ting Liu <ting.liu@nxp.com>
---
 meta/classes/uboot-config.bbclass  | 19 ++++++++++++++++---
 meta/recipes-bsp/u-boot/u-boot.inc | 12 +++++++++---
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index cb061af..3f760f2 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -3,7 +3,7 @@
 # The format to specify it, in the machine, is:
 #
 # UBOOT_CONFIG ??= <default>
-# UBOOT_CONFIG[foo] = "config,images"
+# UBOOT_CONFIG[foo] = "config,images,binary"
 #
 # or
 #
@@ -11,9 +11,13 @@
 #
 # Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
 
+UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
+
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE", True)
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
+    ubootbinary = d.getVar('UBOOT_BINARY', True)
+    ubootbinaries = d.getVar('UBOOT_BINARIES', True)
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
 
@@ -27,6 +31,9 @@ python () {
     if ubootmachine and ubootconfigflags:
         raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
 
+    if ubootconfigflags and ubootbinaries:
+        raise bb.parse.SkipPackage("You cannot use UBOOT_BINARIES as it is internal to uboot_config.bbclass.")
+
     if not ubootconfigflags:
         return
 
@@ -36,13 +43,19 @@ python () {
             for f, v in ubootconfigflags.items():
                 if config == f: 
                     items = v.split(',')
-                    if items[0] and len(items) > 2:
-                        raise bb.parse.SkipPackage('Only config,images can be specified!')
+                    if items[0] and len(items) > 3:
+                        raise bb.parse.SkipPackage('Only config,images,binary can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
                     # IMAGE_FSTYPES appending
                     if len(items) > 1 and items[1]:
                         bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
                         d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+                    if len(items) > 2 and items[2]:
+                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % items[2])
+                        d.appendVar('UBOOT_BINARIES', ' ' + items[2])
+                    else:
+                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
+                        d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
                     break
     elif len(ubootconfig) == 0:
        raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 1071d1f..1f64faa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -32,7 +32,6 @@ UBOOT_LOCALVERSION ?= ""
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ??= "bin"
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?= "all"
 
@@ -82,15 +81,22 @@ do_compile () {
 
     if [ -n "${UBOOT_CONFIG}" ]
     then
+        unset i j k
         for config in ${UBOOT_MACHINE}; do
             i=$(expr $i + 1);
-            for type  in ${UBOOT_CONFIG}; do
+            for type in ${UBOOT_CONFIG}; do
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
                     oe_runmake O=${config} ${config}
                     oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
-                    cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                    for binary in ${UBOOT_BINARIES}; do
+                        k=$(expr $k + 1);
+                        if [ $k -eq $i ]; then
+                            cp ${S}/${config}/${binary} ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                        fi
+                    done
+                    unset k
                 fi
             done
             unset  j
-- 
1.9.2


