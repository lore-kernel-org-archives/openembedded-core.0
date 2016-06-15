Return-Path: <ting.liu@nxp.com>
X-Greylist: delayed 903 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Jun 2016 02:38:00 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0053.outbound.protection.outlook.com [157.56.110.53])
	by mail.openembedded.org (Postfix) with ESMTP id 491F960761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:38:00 +0000 (UTC)
Received: from DM2PR03CA0005.namprd03.prod.outlook.com (10.141.96.15) by
	CY1PR0301MB1626.namprd03.prod.outlook.com (10.162.166.28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.517.8; Wed, 15 Jun 2016 02:07:52 +0000
Received: from BL2FFO11OLC006.protection.gbl (2a01:111:f400:7c09::148) by
	DM2PR03CA0005.outlook.office365.com (2a01:111:e400:2428::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.523.12 via
	Frontend Transport; Wed, 15 Jun 2016 02:07:51 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC006.mail.protection.outlook.com (10.173.160.95) with
	Microsoft
	SMTP Server (TLS) id 15.1.511.7 via Frontend Transport; Wed, 15 Jun 2016
	02:07:51 +0000
Received: from mercury.localdomain (mercury.ap.freescale.net [10.192.208.79])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5F27mlB018954; Tue, 14 Jun 2016 19:07:50 -0700
From: <ting.liu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2016 10:07:27 +0800
Message-ID: <1465956447-15713-1-git-send-email-ting.liu@nxp.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131104300717633403;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(87936001)(48376002)(189998001)(36756003)(77096005)(19580405001)(104016004)(19580395003)(6806005)(50986999)(97736004)(5003940100001)(110136002)(81156014)(229853001)(68736007)(5008740100001)(92566002)(81166006)(8676002)(4326007)(50466002)(356003)(2906002)(105606002)(2876002)(106466001)(2351001)(47776003)(86152002)(33646002)(86362001)(85426001)(8936002)(586003)(11100500001)(50226002)(8666005)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB1626;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; CAT:NONE; LANG:en;
	CAT:NONE; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC006;
	1:zvAxxEm8lRPYVbX/OFFb1sAicsKvj27UO6SI/3Ayl9FaTBMTZMZqPU+w5VC4tUS+Av9/dAAlTToILFNl27VZo1Wdeahm7codTOR1D+FJjtZUdx5J8iabbGcEWJRTIZD7/wv0G9T2tkkjeDT7v8t2dwj5uHIpT0En42EuT9eSVMZnpCTCdCXZB20gAJJ3wXRbT/bLy3tBcrjYO9psS9BDDT0VZe6PbF+tNtURbyf3n5QYpgJ5fwlxSaXdhxfDbhVKdnN+iQr+h8Sx0c1ApcXcokoR6wyRZSCHl8bG9nzRqYOsuJkYR29R1EMrrMfVL8Xu2ctMjVKJxbbqUZwzHb+PMc0uqVhgO5sR3mw2rs1rYFtmilElmkhPl4EqfjdFFS48GO2uPff4k/OtV5d4hGyOJs2LXiWBfgMn/uGmbsDCRw02tS1jnkkUGLPexaN/REqJOsm3Rbk01wxZ8xGLqykEduRAxvB1pnB7D/wcxf+JDROzcvONXn1UzRoGW5tmD1JTNLsVDgFXVD9qNHwewGxHE+ekHcLgYsGTjeOz0KUev2BSTz5rbC/MYsb2huWC094l7BlRZeRgEJdLnif78qqRTfjyYUjAffcuWH/jyvzclcRW7+dBSrMBK0RrUetKghkFbNBC1vgkbp53HKqjIEffaU/JvHQ8bvKjkSiBKDUTC6rBO08GSbsTJLqlfuXhuXRM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 25f289f6-c9b5-46c9-8e20-08d394c1db41
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1626;
	2:AeKjqzL817EeEgUbEKDhLOyAl1SkiSVeN0sjLdS5K+Jj5MyN+hdkws3S5OVX4QFlzh4Drkn186rEVFCpKZhNdSvEYWbWYbyRGDAlDc+KP6FtKWyTLIMmeBSpGEW1HYJ2rfJ3JwXOFIQmmBVPG9JDAgAb7U3BOh9mwSSNQv15Ko0kXvLxpqoaIRO5WP/NuZaK;
	3:XRnQjvhGzaqQOb+GDA07eAOpDbQ4Vr2rkR2vMMMoEhxC4EZF+W5/a4/bwtismiDmYraXnW5YSS9uC7klo2lTxCoks73PbmomcyGIhLqaSwsMaC1ohwLIA0LnE+Ltfxp5jXwOrVWp//VJxqCYql2J8vg0W6lmXJPOOPukrR9IZsvDFwbODd0KsBFkslNw5uFps/4qXTfiYJPDdtu3IYmdGOLiSvxn7e4rVHbB5p4EDpA=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1626;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1626;
	25:44HtdPgpEBjeQ4tAVujy8omFL0CsZfvr+r5q/ibQuAxNTE/dK2nJKoQ1hCgLDvEvdHMj8RIqXaUINxTDCCuxKB9ngLCeihYEd+Sd62O159WPSs65Hpm1FZudhAx/rLEbjJ1J0onyq862+AAtc8PIi1Hdws+Q0iw5X0AudQBVp94wBa9PlROW67kkBiwjx9/1Cd5qs3SdTQL+keBRdwMfKkqwUjUVIHt9PO7mn1qYckj9V0D00kA8C8As7BvgaKhIz10aPUFDgn4lY/cvNoTSD0Z5X011q0cB7qa8U1d7G3ZJzG5MbssFs2/gEVpKuWaXgkAzpHyIAuCQjtb18WYayBsjV9jYLTQSUktjUX8SvbjI1qW7r78KJ7MgEi+RLMDLSMLYM4RsPmcpDel/SKKgjv/snAgplvlA47MDvEN4/8Pmi4+BgmNQuSI5L4p+oJnBNgu0BN3/U/dMdXiaekROGHmK4FDF7R+rynOMUwh+r4twRW7uIRbe7c+4iC2+NnQzfqOhc/4VdY5NTyMVRF0ID8Gw/4d+BPjBkA4lQpUJU40zL/CV3AK8IAJJf2SlNbb3cGzeQuQG2c4EJuswT8shCexTsrFIh3f6MhX/V6jpTArC2IJlbRkH7e0C3WDcAQdHA0AS/CUbW7uOkFdTK0vBDLFXbT3EAI14TNXq82LEaN8fQoC885X6euOlLI3eYfBiUzPnZw+JyfTYjHyhIPD5jed9UrNMSEd03LXe70rz8y4VzMNIL9JFIVEJorcPb62Y
X-Microsoft-Antispam-PRVS: <CY1PR0301MB16261B7941E925CD586806FA99550@CY1PR0301MB1626.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(13015025)(5005006)(13023025)(13017025)(13018025)(13024025)(10201501046)(3002001)(6055026);
	SRVR:CY1PR0301MB1626; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB1626; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1626;
	4:gCp7lcuedrXHLxL3J4UuUW8WxA2GMR9VSK/EKzoMqe9yqN3dSEvFm9yOzR5UNcQqLqZLOLgnYf2hqKUz3kpTj05QLCPX7wjGp0e3ct0Zh66FCBk/CqOne9LOJ/CeatOITptSf9+q2YtUazGCu2rBKQCQmkTbuZkxkz9b5WWX/E6q13p9Wgy6wgQTASLJ0sSQchCEVkIMGiy+Bk1DiGwMMinCp9xZSNuDLTEIES5yMMhbgdkCg2D+56r6afPvCwIuipFhZAkmcjqdVbNaWR7T4mK11VI2aSQw95noYIeyXlSPHzw4RTiasnJKBvhpHFjIUaic0KC5oSP+WPrBTKVKv3/IUnGO5ASKZEq8ri13emxXXNq9kvZ56J9hUu4F102CG0LNSMZsvEUHK0lvVmB7NuQh3XRrXiY4YCYKkewhINt161Zteamvt/p8A4Me+XJWx0uW2tIb79VFkoLjnFDNZWZvf96INPXppqinO22iYnGQvZW54ox+w1iuCCBiEJQlSlBok7iFEtfieeeG0B5yvA==
X-Forefront-PRVS: 09749A275C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1626;
	23:+ZbqJUFmkQR2wYX47seEvstwRaLUrtgvsDOy5ne?=
	=?us-ascii?Q?aq9TY9KmMakzL7p5W4jtz/2UudlcAlcL6QktrOU+KOuW3h1ZTmPkFmZlhOP2?=
	=?us-ascii?Q?BPJN87y3VwG/ef2ztlSPbFcUdO7sgtFkqWz35+2GkBs1m6UDuLLqEFxKGXBS?=
	=?us-ascii?Q?AnI24kYqySSkubPRsegqnDUzMtsjM5QZGnAx4vQJcm36rYB4P1egnettKbRR?=
	=?us-ascii?Q?vts8KYWL8ATtcp8VksxfIT5jNKfe5KJYO95/RqRh/sBFdAduXp2j3qRubRP+?=
	=?us-ascii?Q?DOFqr1b2rkB9o8XkzbH5msmRVocZQ2PFeP5wzaLi2QRiBTrj/D+wXANQQVE7?=
	=?us-ascii?Q?sYumNQlSUCl6np9Q/6/K8L4+3ZGoGEMOTfmaK10/dFZN+gYskhSLQ1toxr9N?=
	=?us-ascii?Q?Ud77469CunTWfyiX9OskinniPls3WZd5eqCPL//IB/AsH/ikptjkQD86nDuV?=
	=?us-ascii?Q?HzudVsGA9uUrIXY+EVxg6fEjjvXS7JLSW4dPLliwO9nq5BIb+I0dlAC6IX3Q?=
	=?us-ascii?Q?qbIXTJ/EU4uP0Z1hDUADO4fHhdiXqPW6KtGR4Cg78RTt55EAgR7muTZpScJz?=
	=?us-ascii?Q?b1AalLaUoDJjzEEIna6x+R6/OjFY9IccZ5wU1DkVK0GxFmXzIeJmUtkgpnYX?=
	=?us-ascii?Q?oork+2k2n7p8WavYjTYXeNWqcdDtrksSW5iP427VRsZDJZnjllZ0wi7SnO8d?=
	=?us-ascii?Q?7e4YTJuGj5vYCpCCzfVd3NoMobIeJe0/lCAAIIJFdppTMJO8KQ/j9q3rE8wz?=
	=?us-ascii?Q?r67NRTrD+hGXMRqPZL1J0x0W5t4IhT20ehSrZfUCGRsbRy+gadU9eVmXb3FW?=
	=?us-ascii?Q?5XiGvrdC4wCGxtapx08BMyxcKMeRwmXyKabnyiJom5B/+7TacM/bOtV5LU/8?=
	=?us-ascii?Q?ARvAK2XLWTh/rGYdsBDP/NTOEtmJxDEPdkliAixzHhkChZEVtupLI/roJzG7?=
	=?us-ascii?Q?KxQ8EqR5ITDtwkf0bLNmQeHvMgimLR1ipP7/vf0aPcYchb3mjl9JInxTnngm?=
	=?us-ascii?Q?6BPwQPH21vR78hLO143U6HAzRd5DS2YXhf/RjloDbeQ1hTVqwRUrMxGHvfbF?=
	=?us-ascii?Q?zodta9ixhaK/Z4Z5kYroracheTXaoly3XzRGQldavqIjgv/A6dEsdh6SzA72?=
	=?us-ascii?Q?NcV2xBsWdAh31Xq34PimFSZftelFKWjzcEAyBnWQ5Dv7y0+OxiN2lRQ=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1626;
	6:jE45+vOwZQJZVxnIP6dPepcjglYm9CqIWkCL+ey3DzGjDmcab9SydtH0AwPXaMN5hsf6Y71ZTlO59bPMzvRrpXgomazVdFqm2lc5eqqhsQVmhoSUbRfPQAt8IxIFxhmzaU2ydSHWIjKNQWxSDAhIZW2Kd9NweGZDLFR5AeYnUY/2CrAhNPnaKZMgu60n+3Q0UgYL18fqZL2Vb/cfe7RDnZ3hn8oThf3qXDvvkh+iKbrALz/QAgPAh0SiuA2q1giRF2tlfYFI4/OOswQpHO42kg==;
	5:exkZvQDmrlmn1ucik0Nbh9wYv8oVp2hmKSEoNA1vI6/bvDX1krjC4rIqsix9dGCUagRyEEZ4jV01cHANvzH5Jj+4CWZdWt2cSEoKz8WW3LVUAPq/U4/FkhcolvXCPM9H/5TF7rNR2DiriP/skTvBOM10ypPKVfUJcuI4B8pAU4c=;
	24:DnCPZM9ZKCaH/LxdGF9cTadFwXMj0lYIPaIEbZI0eEKJYkXwW82UnIW5YmP2iAlBHTjwcpfKf+26vQGr2WY7qVT/l9b512L31IXmZNnh2ss=;
	7:oCP1qxh3jsNyJ+IgRo9MhBl9S2piZrdxazj2/+czQti89cHpOCy7FtcknJLKVAGPRBBpafnqetIfVq5OrcZqXODG2hSTPDskriXoGCvahne90v13UGGTc4Qb7177pMXrKgW/YyqZDueprEVMIMsKuzwf7rLUXAt0dspmv3JjM+NDZYN613C9xaO1B24uPBR90K7Nh0/66kqGoGZSdcWHrA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2016 02:07:51.5761 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1626
Subject: [PATCH] u-boot: extend UBOOT_CONFIG format to support different binary name
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
X-List-Received-Date: Wed, 15 Jun 2016 02:38:01 -0000
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
index 1071d1f..92e9c11 100644
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
+                            break
+                        fi
+                    done
                 fi
             done
             unset  j
-- 
1.9.2


