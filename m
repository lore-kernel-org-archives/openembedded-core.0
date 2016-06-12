Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 1822 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 12 Jun 2016 09:42:00 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0059.outbound.protection.outlook.com [157.56.110.59])
	by mail.openembedded.org (Postfix) with ESMTP id 047F86FEE0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 09:42:00 +0000 (UTC)
Received: from BN3PR03MB2369.namprd03.prod.outlook.com (10.166.74.152) by
	BN3PR03MB2370.namprd03.prod.outlook.com (10.166.74.153) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.517.8; Sun, 12 Jun 2016 09:42:00 +0000
Received: from BY2PR03CA045.namprd03.prod.outlook.com (10.141.249.18) by
	BN3PR03MB2369.namprd03.prod.outlook.com (10.166.74.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.511.8; Sun, 12 Jun 2016 09:11:37 +0000
Received: from BN1AFFO11FD039.protection.gbl (2a01:111:f400:7c10::116) by
	BY2PR03CA045.outlook.office365.com (2a01:111:e400:2c5d::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.517.8 via
	Frontend Transport; Sun, 12 Jun 2016 09:11:36 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD039.mail.protection.outlook.com (10.58.52.243) with
	Microsoft SMTP Server (TLS) id 15.1.511.7 via Frontend Transport;
	Sun, 12 Jun 2016 09:11:36 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u5C9BQYK015323; Sun, 12 Jun 2016 02:11:33 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 17:02:34 +0800
Message-ID: <1465722154-29644-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.4.11
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131101962963000090;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(229853001)(85426001)(2906002)(2351001)(48376002)(5003940100001)(68736007)(110136002)(19580395003)(105606002)(106466001)(4326007)(8666004)(36756003)(8936002)(33646002)(50226002)(97736004)(586003)(8676002)(87936001)(47776003)(5008740100001)(50986999)(189998001)(92566002)(50466002)(86362001)(19580405001)(6806005)(77096005)(11100500001)(81156014)(356003)(104016004)(81166006)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB2369;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD039;
	1:BB1HyGG7aLqvzdevW883zOZlKRS7gGPQ8b8G2wgjB2eDD5r7eGsl7xxhKThBLLW1BfphdTAZh9VHFYFDAcFScTSvE3y0U+mc2Kpd426J7Rjzh72JVovqiDOxCUKaKrcAkrUVpy0YP945hTI/Qn2g7iNQSdsCSTJWeXYQ94IoqmAZ9VVrEZcT65KXwfde3213fbN7sAJRdESLMEknAFrzh7BEiqX4tI/v5nBq2Dft41aP6t/sKVbpze/D/YloqbjhGk3Xwdq0r3DQaPQwW0/sWuYMXwjZeL82n0JT3+hThRlgbAYoDcVQ2Mo3MHsvB3avhSjVBJT82AvPZWWMI3Z0/DdLtpGYEXsEqVb6L8HLu2Vv9E482k1fpxQJZZKJPXGuZlQxDszTouN9GhlqMGRvyPNg75UACrwF6nS2qeXMge4fmGVtacfrczOsZb052+JZmEetQd11fv+KLgrPQe1uWP0MpGFZsTK64ESy2eDSMbKZuD7uRmfS8aScPyYyGGB2ScWTcjojzFH8MNhHqSt0jaKsGu++NZ6cYteS4wB+9vuSSf44sF4o5aD7SMO4g8mvfNjrU+m+vKrwZ9+QmT73qV7aQEUv/gUEe9QqGJBiyLpIL9IlnshyBx6fxeM/WDNyujnu/+vM6xB3EoDJ/ig4wZURC0wl0SN//GwF6HWIBOulNcTuhcIGWnp5pAus+0IW
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: d7cfae2c-aaf7-47ac-b9b7-08d392a18e38
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB2369;
	2:069aQzC1WZyDzmSEyDKw72+dyCjTOTEypMYWZPQaeQveynRsCR3vnB1cRnDONPext9pdw3hElEd10PnMCaWNs7Vnnf/FdSo2qgvQt0GMnhuEZf8bFcK0p+TtHA4EJEpFYaf+lrVK4G1MSIVV5ci7FTlfDG1E0vNo+Bc5AztmSmAM/Bjv6BuSUA9CiH4rMejO;
	3:glfkb6SzVhjNQcGE4pNmolFXLc0ktQdm1bYmZVDGyZS4RU6srG+6ZCBufTqvjxCFDA2ZE9qXlP5gjTskW8qsaMbjMXBif14BuKNwQUAEzBa02VUkn979IFIgnSuj2DxAGPMMYBa8MVHfCYq5qnQIuNsZT+QBTbBOjSrIO21rs2XMXnqGkVqev8obeM5CrtxHpNhmmRB+iaSgvncqH41QNG1jJ5fnOHS7/H1NO1JX3G0=;
	25:STcJBHEe/iLZ56BmSiKB1omZv//N8MxSuSkcVXF6QVdm2tdMOwRMlxzfEgoYIeGBL/yczq7aZqtGdgx6VSDWth4epk3Pc3fsSlWg6w2qAod1iXOjrkprn6VRXAmqxVJ7X5khDK/OhCoUTaHcUbDukJZaImC9cG7+HzmkK3iComFZlA/4mALqqK59yY45+zrpbvMgHpHbTfRB49npiLsJvpcr5JDWUcne8PYEqczXs0c9V+Mcq2hvJ30+0TmzmXyh5nvnhbxeAGoUzYDQk94vfuqkdtdvaisMhR5QOioReZj+isIPiWmAWLhnf10ykosrG/Z4S8jq1lRU+bQN08f0IAl+k0r3MsUeEDI7lic2eueH2yYVJkXuCZ23gJ1et0rM/1NJGc/j24XkRGGVbIPcIrVm4bzk/Gb/SIowZ7GpxTk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB2369;
X-Microsoft-Antispam-PRVS: <BN3PR03MB236989C6F4E98798072E1F8EEE520@BN3PR03MB2369.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(5005006)(8121501046)(13017025)(13018025)(13015025)(13023025)(3002001)(10201501046)(6055026);
	SRVR:BN3PR03MB2369; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN3PR03MB2369; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB2369;
	4:HE9/xGHNC1vDSumagzDkt1ob+Vg+BAaYNEGKTYzBf8RmtY8FQ4GFdM67sN7HchjITh7t3heFtYzi+msvYtV4rFUjeZtVBl9YptC5RwpgdPLbnrS35OTaDeujzSL16ZYcxkg+AKgh+tXVwUZdNPC8OuOxm3vWCI3Xeu99wHenC5K8rKnF6dMLz8SH8Tnyy2Mr2oAS/ubi9wrYWrwVQLcQwnES1wMyk8jAGhDyOXekainGW1aRQZsrG1NRH/10zCZIaV1sa1l7BHBwd5A5uHcjzdzmzPFTLPa0I6Zn5yTsmkxS22Q/C+IXL6GurC/uLRn3XkXU3pUeIWloUtBgvzZedTRlPaMtYI/Hsp8DsGtaZKHRUzTcW9wVH6kD1ZWJbbDZXKbEZ4xDWa6XSvLl3iUb2mXOTUwcfZWra9N9vkeIv643U/lhDY+GmVMMWKRBEZGJrZIZhE3QABfiSGP5B9DE2LsGwwFJhkDNxd9sw24IeKRkrSU+Lgs+Eeo9DTG+2y0NNdE+ExsGduJjNvpbL0FY3w==
X-Forefront-PRVS: 0971922F40
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB2369;
	23:5yAyIJ8GtyXVkh2k4fxi7jFiFzfSEx9YasInzvlNL?=
	=?us-ascii?Q?EFTPQOjnAuUG9pUyhQIoqOQLWMCq84AiFvZf7ppp8gCOLZpIlrt+0mQyKzex?=
	=?us-ascii?Q?mPczbW7UuAHiQHYWPA5WOdEVjrSlLWtTPDofTRUNqvP6O+C5TlXFr/xizY8d?=
	=?us-ascii?Q?da9X1JbaX2t2Q8+SyYzQyrnSUG2fmlAd0eg4GQwmv1916Y5rMJIaubyi7O4u?=
	=?us-ascii?Q?wpP5ltTNIktLCPmJPZfhrrAQ6R3+RXyMUkbckIOoVOu1wm2tQXRb3jwYwISV?=
	=?us-ascii?Q?UVT+p3gyVIhbVwfsVrjruzqbFz10MnbAlRAiKXN+FWvBkYO671UJ+XIttozY?=
	=?us-ascii?Q?QAjHO66s2Rppjp1KE8jiOeK7SlS1j6eyywsCo7H/Nmzj4gmD57/q7BYeLemN?=
	=?us-ascii?Q?fAS4IZs45HiSRNMHgM66RXmSO9ZKlcim+ieMIeiDyxn/OZRBMkqxjKpzWVgE?=
	=?us-ascii?Q?3ZFiXdUHwQbvRMIodAnsel5oFQFb+AA1XLfRv1uPzilxeoUlUt/CJAJv07Qm?=
	=?us-ascii?Q?UomRjw/OSfBLTdjNw7hPE/9/HUyxkwHzES0VM2nbvvQgrSzTZZdzwRguuPHf?=
	=?us-ascii?Q?Y1Px+uD1eUT+wN06zI8tCaplY64/ZDBVB7YOYHWZs1sSwxXfKxgKZTIOZqBV?=
	=?us-ascii?Q?gnBek3d0a9Xm37CGdo+Rpsqc3T/8/29xrUSLijbnOCp0bDslboyxHswcg/EA?=
	=?us-ascii?Q?04Q/vRm9P4ClfVmiqFWcGcI3zSlpoNno/SLDKYY4wCrWyif0ApmO3L3Z2IMN?=
	=?us-ascii?Q?XHWQg0Z9hdmahJLzf9WGgLHpyI6azdJkt+k8Lfrg8hpuPOTZE7ovHP3eml1S?=
	=?us-ascii?Q?w8glrH6Gm/tZ0PnOLW5fHrIBv0hj3HVUv5NQm3nleac+kuQNWpX/YVAC4K1r?=
	=?us-ascii?Q?4QBIB8Cpas/XF0w0h2KI1ey+dH+xvF6B1SsvrcNYczkM4eROwigabtNmBTuv?=
	=?us-ascii?Q?qkFxbRGHvm+s5B4pnd4WCHc3uqXf9cTVopYYihPwMgiH6TlQtwsaZJ5lOKeY?=
	=?us-ascii?Q?wLB5QEDcaYj1V3/7Ew3h2OisR+eWVo9SUcmzg+qcRbq1sV2nWiWUzsA0RlJB?=
	=?us-ascii?Q?g85vahysHo1WFswVaVW1QSy9y1DM0TQYA9RIaZjWCxnUBnCf6ver7szNIu2u?=
	=?us-ascii?Q?9gQDCtnjlj1UB5RuqVK32O12r3Ndem/?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB2369;
	5:4/tIYn7siRpIFSkqxk/l9BfbVTX4O8qQxBYrEXTG4OK8Bt0m3uPM/skPDQ9d7/zmMtCl/LvjzcAYxDRedCPvcy6TPipcvaAQmAMOOjhtcNzOsrfl3Y2fcbtkqirJ8EzGrmFqJkgE/2LtKqoJX/1NF2Mcbh9jlNaopxW3c69wpsE=;
	24:/q9EVSrQ6zzz/qD+QsUBdn6Lgp1YnMxKEe0LEokrFJuycf449ftJ+AxRVuC39hURgKG7fFvJWbNAqeqd3gsMVoz8rJbD6zLekdUXHwN5Nis=;
	7:now/q6G6O2gVsE/iAyQMxjqHQP091CWYNwFrCgvamR0nsmxnAU7/o1DXWWXRWDUEdV+mVUVZfq57fY3Er6LZ4H8r1HY55Pd+6fivmLj4DzkUh5zoW/s5URpQaq9q4SwLwnJWqXcqBbLtR6nLmrDqzH5LZRcwwiOF3nHXg4F9RZtvGn0GoPJ15P55YAahYhOfDaIirPZmsV18sJb9Jic2jGsEw5pDu/+QIZbH3nXO65o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2016 09:11:36.0816 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2369
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB2370;
	2:BkfN6dGb+bcDgFfaEy8rklWiLA8vrKHLQXS31Mn0PLRhJEJYffR9cOzSyAveooSXpm3J9B5DmVYD1Ia6dS8tdLxwmubH2orPLVGj1LupazDbwzDC3hBQSk7RVmMwfCytST/3U3UZM8Tra8OKqqKyIAN+dbaqPCPA/BuPCbjhsq0gYRFBM6XzAlmwcuEY86iv;
	23:HHtug95Wa2tS3ZL5MAU2WrrN2ia0T2arLne0+LRDNaHhrirwl0I+zbULM8GYLCJTOVH33ohgAxYjxxYUV6sCxMPxA7FBxZRejvac17EAUDcFf7LhO2N6olotIurShwzU8gws2vcrx0Uwev3O46KkA7aqk43gpg5nj/JmhgSEIws=
Subject: [PATCH] binutils: fix the incorrect assembling for ppc wait instruction
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
X-List-Received-Date: Sun, 12 Jun 2016 09:42:05 -0000
Content-Type: text/plain

The wait mnemonic for ppc targets is incorrectly assembled into 0x7c00003c due
to duplicated address definition with waitasec instruction. The issue causes
kernel boot calltrace for ppc targets when wait instruction is executed.

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 meta/recipes-devtools/binutils/binutils-2.26.inc   |  1 +
 ...ncorrect-assembling-for-ppc-wait-mnemonic.patch | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index 6d535fc..6d77452 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -34,6 +34,7 @@ SRC_URI = "\
      file://0012-Add-support-for-Netlogic-XLP.patch \
      file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
      file://0014-Correct-nios2-_gp-address-computation.patch \
+     file://0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
new file mode 100644
index 0000000..5aa5e31
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -0,0 +1,36 @@
+From 78decbeb84fb60db4e549ad3e8eb34e030e96d39 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@nxp.com>
+Date: Sat, 11 Jun 2016 22:08:29 -0500
+Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
+
+Upstream-Status: Pending
+---
+ opcodes/ppc-opc.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
+index e8c92f6..a9de474 100644
+--- a/opcodes/ppc-opc.c
++++ b/opcodes/ppc-opc.c
+@@ -4777,7 +4777,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+ {"ldepx",	X(31,29),	X_MASK,      E500MC|PPCA2|PPCVLE, PPCNONE, {RT, RA0, RB}},
+ 
+ {"waitasec",	X(31,30),	XRTRARB_MASK,POWER8,	POWER9,		{0}},
+-{"wait",	X(31,30),	XWC_MASK,    POWER9,	PPCNONE,	{WC}},
+ 
+ {"lwepx",	X(31,31),	X_MASK,	     E500MC|PPCA2|PPCVLE, PPCNONE, {RT, RA0, RB}},
+ 
+@@ -4831,7 +4830,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+ 
+ {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, PPCNONE,	{0}},
+ {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, PPCNONE,	{0}},
+-{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2|PPCVLE, PPCNONE, {WC}},
++{"wait",	X(31,62),	XWC_MASK,    E500MC|PPCA2|PPCVLE|POWER9, PPCNONE, {WC}},
+ 
+ {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2|PPCVLE, PPCNONE, {RA0, RB}},
+ 
+-- 
+2.5.0
+
-- 
2.4.11


