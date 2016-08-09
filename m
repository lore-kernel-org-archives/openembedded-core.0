Return-Path: <manjukumar.harthikote-matha@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0065.outbound.protection.outlook.com
	[104.47.37.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF3817720E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 17:15:15 +0000 (UTC)
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
	(10.152.76.59) by BL2NAM02HT086.eop-nam02.prod.protection.outlook.com
	(10.152.77.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.567.7;
	Tue, 9 Aug 2016 17:15:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.567.7
	via Frontend Transport; Tue, 9 Aug 2016 17:15:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bXAcT-00082j-7g for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2016 10:15:13 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bXAcT-0007zk-AK for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2016 10:15:13 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u79HF8IO005262; Tue, 9 Aug 2016 10:15:08 -0700
Received: from [172.19.74.185] (helo=xsjveena50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bXAcO-0007sZ-AY; Tue, 09 Aug 2016 10:15:08 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Aug 2016 10:15:07 -0700
Message-ID: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.1.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22502.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(33646002)(50986999)(9786002)(586003)(7696003)(356003)(63266004)(50226002)(8676002)(8936002)(81166006)(86362001)(2906002)(47776003)(305945005)(11100500001)(4326007)(81156014)(36386004)(19580405001)(19580395003)(77096005)(230783001)(7846002)(4001430100002)(107886002)(450100001)(92566002)(50466002)(48376002)(106466001)(87936001)(229853001)(36756003)(110136002)(189998001)(2351001)(5003940100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT086; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT013;
	1:JCpvsCS2zTG2P0ugEJBuPpnwMz6B64cD6KWvS3jFe74//UbxHM4Y8hoirnsxTphdT6MSmF3WQNpVzyG9V/dichaOv7ZjrV3aQ0/6Qc/yeNwUBIZe3FesW3PtcNehpKN8voN5FEqWniOZijgGPgeQrIWI+n+uRgYuHrHNdNZLFvXM9YfDCOh+N90GCXFQ1z5BwEA4iVjvitGgMax8O0MVkZiyPi1mubCAlxIMj7xYf0B4yyzCGilmFPIV2CaqyG2kVBaFkQBP8SPat6Q/HBx9umug14ANQBCvCxOzX0RWMP3uCATYYQ3KXOFoTYLHNs8jOapxJCTMYOscNYZCt35yAH7QlfYGZn2v9MalyA7fRFIWvvOc0dEYx61U9BHDYmBxXA5XQfpYIiARs6Qtyese+RbN47d+3q3n+dfu7Z+csFzlSen3t6riMnjw7c8ITJbyf8vFWnzmksmJkUqLE4mKsivzasARs7RpD7rCbP2lJy0EYOTvArfEwxKPRTBSylsmUczVH4TFwZdqvtaL5QPlWe5ard7TO9xC76c+tU8iHFa6QuhZkfw4yQdCMGajVa2g
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: ff62fbfb-5dc8-4cff-7587-08d3c078ba72
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT086;
	2:h06vn4yF4ny84w9XDFerGGfyikad6DMUZpyKAQ1RC2YOCLsBm2phB2elayzJEFm81FhY/mIpq1ux5SS5mW+kMc7W/GmBSHc6pEIiVq6dTCnvJN/jpE1q44cWQ3gtigOM9PTEbqOa+/tMYoSd52OXHECGGaoa59gHdAHo+ixTyxIyQvLT9vheyf25BP1ZCTXZ;
	3:LMbyZjluHg+arPgCXPFDuF8UdJf3AmuknncJn9fyI/PlJNQUxJyQiE6japSZi6VdH38CscUJa1W8FajNgojQhDr4jpul9vQyWgcmFfz7rc1lSvJlpTbI4XCh3jrXVc5OYgrROGviLrC1n3U9jv8CtPMF9GBYn6tjsx0UolsD3EQ17coI3OxEqeJTIJ/ij9biAgFl2lbRRt7UodNNJ9UbDYeHsNk0Eikfgk6HECcTWMp30WAnth0WsjhA04x9bvGgKZR0rZLzC/W46PEl2vb49w==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BL2NAM02HT086; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT086;
	25:T+/n7G6w+rzTjRZ+yD8R0FG0cD0Kwjg6/G37ooiYhzaqMKVQIh1dXWsuBXDYkb1Zo1OPYV0imMR2kdg2/Az0dnCE3L1FnnTWZW5NEdw84IMLI9PDFwjklSIFlOHmkFzD5B8dT824AawPUSp8dDeBO5vbSdw6s9iY0sVC7jiZmL6E964PrbXewjRhv16I9DojjW8PAixoQWe8GMIxWB427OUm/idPjAbJRLREXDufHWsf+9whN4l5K7c5Sop85wDcKk83dRzkj6eUzDWPDhkbcdFUhj7SU9JGExc+OnCA+SHphaGLg9kjEKy0QoP0MfMPtmQ8UIrbuhQa8rjCAjZGWV9efzNnCWtn8RKcZAquLNm5VblpU5v1ntteqqY1iN/kgHBcEemGyX6GjLR/nY+TRlgSdkVlkydjS+okILxhuaNCXIFHKXiCMsVOPA+xji70kOtZdmjNAzrG0VT2nX6U7n+xcLZO9e4CAwSJBiwwUXfQeveXZlcc4TAdW4rZNjrAxpuBIynR3DNOSRzjZMGyr49L7b50u8mWlueiODNUOyRfgPr30hp/UMKJX3VnLMgqGuLorDWlLjsExGLYNVVmbbFvPvwQDLT7edPHMQHP2nB9x8dg2uU/b4/aRxazqntXzpIDOs55d28ORxI7t9g94RmDo9JndzAeEEIbYf3M/sFOSp7N3+hd36IddbrXhPdBSstaOWVJe8mLeZiDOJRdCoTpZYPUy9kZy4BIFenOGNY6fJMDU65v6/wcG47SneGX
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT086;
	31:C2GQOhkwZc21ej7je8XJ0apyscqbLTKubhp11tfkJxv3sKqUqQVfYH68/b+EQmj6uujCDMJOjozrQ2OvIP0hYo8W2x4TGLakjfP1Y902xkLx7ZD6hqioqcgztIuXYVzIo/o1GjEK4jcRDmX9TNoJuO3WPd07OlTdMR5jK8DpWB3L7mQesjLwhCwduyYsclMZ9P0e3/rprj2s4jtAEyDxsEMANdGZeQublzlYrSEvhFI=;
	20:1jia3RVrS/GyC3F046+0qCGs1h1YAgtOQ8fsGpO7ueYWarYino8v+XLwwAe1XqWNujd8F29WqprQelZQzFG4pvNrCkDOGVWCtTyfsvmU+Ln0dUJd17jto33Q7f7bjKX5gwVft6sEwBvLflAsNibEMWzsR4/eolo98MZm4cAblKetwRSax1NbCOgHtg+f/x2DzjWhu0A2/5doI4TZN+pyHuL0w5rmJtlX0Ax4NYvuGMzIBqgkYxgskSm/9aYUe+SpggJ5yY4ZfX3WOovJzYtKO+Q3ZcR4LJh92zTBi5XH2rg4ExHc0fsS3uiJd+/dfcitWkC8BjvNB6IGf+5ZkPswHu0N/cWvtA3PkdEcSSoqkzjoFk1aQ+duCQk7lFUbugcyPzVWPF5O/43jgUiMLVvCFfp3kRILXHLHpej07OqmBuE8DAhLBoMTF0QzB69LB5tS0FnNw+cmSOIul6FV5vT+Ko08Py8uzzoxwubBDqMnIXknmuJQZRPdal27Df+u7pKs
X-Microsoft-Antispam-PRVS: <72959f32534a471791857b8cb73dbb05@BL2NAM02HT086.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040161)(601004)(2401047)(13024025)(8121501046)(13023025)(13017025)(13015025)(5005006)(13018025)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT086; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT086; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT086;
	4:Cu6g0vbhTmZ0Tz+fro98gDtRZHoZ2NKt5G3zCn4Xnv/x++BSsCTul5YIWRF8n63JirFYkv0w0HR6iBZMwU8gzgbp3TvHOW71P5sjzISWHnwbv/7kFH0Llgtfsg0vwVyUXtUhf+fugLKg9cmiwzAOlI8G62xQTtQKAnUZwoE0UItFsXkqyEmIjV/MIek/XBhWPF5jiWRLDTHBB2+1wlg80OtRKNtGrHV7ncgE9DDt3olCUYb01Gw7MwYD9WE0uMD11Sgh54wZExgNBCsACSHe8Xis74pa8eZFeXZyfGJPtKCl/MWTOds2a/xpBzj1b/qz5s28g7UWbTiuBFsP8cuYkCq2dAA+LQi3upo40vWIsQ1aFUGC2UqjeO1QGdmVtcV2tauLLB9rYJJ9thiISqjDrpTMi3ohQ19K2at9PyOqY4z70It0LtQ48dhT2UPOEmph0ObFhH79g4wHEV7Q0ORUqDIYbqOpsslqq+7bNlMMkRACCl91irooZF0+es6Yzm/izXZ6Hd4qaOuCsPQ3D7JZw+IN26/riKFBvgJFGL/ltlw=
X-Forefront-PRVS: 0029F17A3F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2NAM02HT086;
	23:niffY5lncFjzqqOI62J2YTHfniGd9Ohy0EPutvG8b?=
	=?us-ascii?Q?xh4J/UJvFKO61uIYJZJLVNwt4LDAoOE6QYOA+p5vgUDgsnW8gBNBedU9IsxE?=
	=?us-ascii?Q?7EDKwnVMBMSR0oQzs3hz+abkq8kOp6m3kMDbwK4gT+BiCxfDSyHkwNayvqRI?=
	=?us-ascii?Q?aMO/c0vByVS2TEck98uL1f0uym4P0yT4r2XiBrdaZrfaHopnvNuuqF3ZaA26?=
	=?us-ascii?Q?6L7BQmRV8nBnUaD3DHk01zkYDS69N5WMc6r2bjiVhURWChzt/N3sycM2+zAt?=
	=?us-ascii?Q?I55IrS3r+3VfsGciRbJhooYDGcCd0VG22kGqPZbUEt/24xMlK723LPX9uZHT?=
	=?us-ascii?Q?Mv6xxiNRpY6ht8EC+guI92gKfvb6GLQp6AG0gEUlNa/pdWw6k+PJq1SgS4Wq?=
	=?us-ascii?Q?qP0jvfj34D0HgQrhgUTUOp7SzZDD0lhKiY7SjFEtFb3pF9QBNPpH2KjnhJUe?=
	=?us-ascii?Q?ye9RuCL84lCubq7giVCI+a8LeUBYINS6NWxqjKCUiFtAZHOQIydC5V2zqiJQ?=
	=?us-ascii?Q?5l7HAnw3p9jYa4fhP1pIMu5X3MEusNp0aZONVmOgty3ME8AjJr8llU4eOKRr?=
	=?us-ascii?Q?s9KNKUEFXr+0PgCctOZK2vTH1dWxIZmb3vMZXsyNP60L05fGqa0KU0ocLH/Q?=
	=?us-ascii?Q?5T8qJJcY4NNv8fogZHyE1Jp5bfCq6yL5jj8LBsDAKJpzbzU9zlFkww/Av1aF?=
	=?us-ascii?Q?ndpkJ1dS109ofgPOE83uB3YvW87GsZiXTarHX9dj5zpIHb3DPUexlR/bU9K3?=
	=?us-ascii?Q?k1yMuiOo2EztdnXKHVo6aY7jmPDO5FNgpMadhfmT//oCwrcHlep1Y2y7V7vT?=
	=?us-ascii?Q?3XlGo1scvYnQsDbsoJfDpaqQanhcddu4LVKIbfIfUY5J8UCz7Zu3vqZrWFET?=
	=?us-ascii?Q?5JuQTQiwQPLPrZarxKmtsCvXElDZvcg2GdLuUdtSxG+KW5cD3ywyhewCZx9Z?=
	=?us-ascii?Q?WKrK1I4CPKjJucC8EIiTONxj2LOZhcqq6RPBNvZL0oJMTzIzPKqwcql0cpl+?=
	=?us-ascii?Q?Qo45VcLZwtThUdSQl0hGCQsqJxe67dQlvhBAfAUENxzIgku1ha+bVjag0BYy?=
	=?us-ascii?Q?E+nvlqBJ5lBoNamoIYHuAw2naN+q1HOj2u/ZUXf1BDu4UwmQIrdpbRUGo37w?=
	=?us-ascii?Q?fUuj16JDQD6f1jQJ6+yxo2oh+lJf8zl?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT086;
	6:toDHSU3e4H9Ak5KoYho0he/b+cH5NB+Edqy8pwrUdWf3Pgod72Onuhmyo9BrRteSLojGdGQF3hdamnP3JiRA99f30D4O6GMRba+cQ6Xhi6JW8Mo0iXctmI+WWa3c4l+4dOkR2Uyx28SW146eUxAyjdKuuCnNPTKTakNxiG9BZj2dzvsdb8GEqA67eolAxv3RIPbO2ooiUcFk8qIkyyUMCpym/z2e4LWaAQ6icmnevSiRy9i4+hqI5O0Xw5cJF2QQVpDn38fiI39IQ9gQHjQP0j6QAWvetwLKnxSuawE3sJFYOwLjkuREEauGjo2kNzkeek+GjwgVJKR2t3de2hGKbw==;
	5:hlc1tE4vf+1UIuZSrEeQIhbhRIg9wVfYVWGoZ4ryvEDtCo9x9hnqA9H4thyAXKhmiMQbUemAhu1GzXyuGLPRwmuMEYhXyTTl/LbhmOopzOTo4zezbzylVgpv0t6vNnELooKn60OM/NwdJIDVncWG6Q==;
	24:k8NB/Xd9DqUrSvzT+CgB/VRTVbhtOvtm2D9m41tdSCgx7hI4nn8PfsABUNKJ+IE3AZzBGwtCRuc8SYIW4ZEa+ehkYLJOePjIYI9IAVnN6BM=;
	7:YO5pj+04W6jHjcHCPpJhRlLgOKLUgDbeiwcCx3NwOP6O8uYmynVc84iMFh8F70v+Iz4AUm9QT9DHXOEUek+MDfZkVSrPfZNaGxNdTXomcXuFWWIA9AQJ0wG2Pbh85lnGjareVvGanBSKZqlVqA9wk8S9q5XrrxkEy0lSCYcpTk/zzZdHcJEuSuTzypL2loyh1dAOqNsWKEpikb41l4mdUM6nY104hZegXGXePXwKYJm4rWes5MnhIiDNOg2oXGxL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2016 17:15:14.3074 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT086
Subject: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Tue, 09 Aug 2016 17:15:18 -0000
Content-Type: text/plain

This patch enabled out-of-tree builds for u-boot. This also helps building
u-boot using EXTERNALSRC flow

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 1f64faa..9e19c4f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -88,12 +89,12 @@ do_compile () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake O=${config} ${config}
-                    oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
+                    oe_runmake -C ${S} O=${B}/${config} ${config}
+                    oe_runmake -C ${S} O=${B}/${config} ${UBOOT_MAKE_TARGET}
                     for binary in ${UBOOT_BINARIES}; do
                         k=$(expr $k + 1);
                         if [ $k -eq $i ]; then
-                            cp ${S}/${config}/${binary} ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                            cp ${B}/${config}/${binary} ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
                         fi
                     done
                     unset k
@@ -103,8 +104,8 @@ do_compile () {
         done
         unset  i
     else
-        oe_runmake ${UBOOT_MACHINE}
-        oe_runmake ${UBOOT_MAKE_TARGET}
+        oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
+        oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
     fi
 
 }
@@ -119,7 +120,7 @@ do_install () {
                 if [ $j -eq $i ]
                 then
                     install -d ${D}/boot
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                 fi
@@ -129,7 +130,7 @@ do_install () {
         unset  i
     else
         install -d ${D}/boot
-        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        install ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
     fi
 
@@ -143,7 +144,7 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                     fi
@@ -152,7 +153,7 @@ do_install () {
             done
             unset i
         else
-            install ${S}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
+            install ${B}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
             ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
         fi
     fi
@@ -172,7 +173,7 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
                     fi
@@ -181,7 +182,7 @@ do_install () {
             done
             unset  i
         else
-            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
+            install ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
             ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
         fi
     fi
@@ -205,7 +206,7 @@ do_deploy () {
                 if [ $j -eq $i ]
                 then
                     install -d ${DEPLOYDIR}
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
@@ -218,7 +219,7 @@ do_deploy () {
         unset  i
     else
         install -d ${DEPLOYDIR}
-        install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
         cd ${DEPLOYDIR}
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
@@ -235,7 +236,7 @@ do_deploy () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
@@ -246,7 +247,7 @@ do_deploy () {
             done
             unset i
         else
-            install ${S}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
+            install ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
             ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
             ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
         fi
@@ -263,7 +264,7 @@ do_deploy () {
                      j=$(expr $j + 1);
                      if [ $j -eq $i ]
                      then
-                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
                          rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}
@@ -275,7 +276,7 @@ do_deploy () {
              done
              unset  i
          else
-             install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+             install ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
              rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
              ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
              ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
-- 
2.1.4


