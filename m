Return-Path: <alex.stewart@ni.com>
X-Greylist: delayed 685 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 19:27:02 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 11F247885B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:27:02 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0BJBXYe003564 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 13:15:39 -0600
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp0023.outbound.protection.outlook.com [207.46.163.23])
	by mx0b-00010702.pphosted.com with ESMTP id 2fech189g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 13:15:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iJfCQwhchTNSQRuSJ3jAAYzAKJqVw1fjmPcbnqmzdPI=;
	b=dlee6JveplWKvTze+hjxBwqJk/lT6SiL4ZEa8fE1yQy/tIDEgc5lwkZCzMu1XaasKtnn9CYVLAY+tD65BD64kDOfjrgyVfW3sdwDPaN9AVI0Wp+3sJ4NYqr4n3aMyJIVtKc4W2UsnDpWPPjMjWpHqg02NDGzarQZfQ/KnRwhDIA=
Received: from rtosams.amer.corp.natinst.com (130.164.62.180) by
	DM2PR0401MB0974.namprd04.prod.outlook.com (2a01:111:e400:3c0e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7;
	Thu, 11 Jan 2018 19:15:35 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:12:35 -0600
Message-Id: <20180111191235.17671-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [130.164.62.180]
X-ClientProxiedBy: BN6PR05CA0002.namprd05.prod.outlook.com
	(2603:10b6:405:39::15) To DM2PR0401MB0974.namprd04.prod.outlook.com
	(2a01:111:e400:3c0e::14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bf311bb-edd6-490f-acb1-08d55927b16a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:DM2PR0401MB0974; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0974;
	3:2QdiFr5YQwAorFoe/yroDanmkiQJWTwV47LTvtiYGe7nCNeZLRs85ZZcOJ72INWrv4B+QRelq7ePuxyy7dzLGUUtNg9oVOWprAwWhwSHrBvYKwJ3goDxv4TU/8sUofINJe2xDuvf1UPE8Xa54+GN7V7f+4noyLtW5GhFrAz8iFDs6H2MHGXi+fZkfnXmsUmlnvrfIt9XsePySLz4vRQM4zErbFjMQqx9Fif4UkMQc6sDYAQ5qCm73dO1AyyOGrOO;
	25:vzQiPIGrrvE3vDreSjt19UPcHEi8hLTyu8Epx6qfM10Sroh7czLWjp9bTgulqJB5JP+e7fYHAGedrVDiSddsjQGjEEKPa2hlkdpbvLFeb4RRM+JOY+FN3uYDERxEhfnz1UTcmlnCOXYeyKeLKYVAkhh/OMbmYrh9DFyPRy9WyzZ3HyP/Ju0clETkLhYXVJD+/ejawIJmXszN77WcprNe1v90e1FIBrSsIIUC2dpJ36Muv8EWVB+JEa82s24YK1kWSpzhTxoE1n1A2pl2vLYyr9kQ1kGYGfos+hicr0MUkFC7etU04gxDcGFBUQm+ETsnWC5kI/BBhKI2HpgaqRHjSg==;
	31:iFFtv7/pS8+WN/V8qlpXK1sN0DbdguxWBB1L3FtbgY5IJdWNguO6EFJI71023AotyGfcw3u1DtTr82mAp1GelTfvLKfagLWyV2RlN4tStQlGKn7gC79ByXKu9AUnuwk7xlJREDJBXRU7QOgbpzqJpIp/Vb7OZB/m/HDw+oUuYQekKPHp6/YCl/kPXFIolS9SsnT9+HAQUcQmeV92lcQhTH9jEJ9Dc3aPmbG3SMKDlOQ=
X-MS-TrafficTypeDiagnostic: DM2PR0401MB0974:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0974;
	20:aDXRlSrbeGf/1W0jZ0IBAFADtl8EDyH1iXo9WpKLdDdHKb759weMmKcZSP1dmAZo1muhx9mqzhz5Ld6c3Gu685iDipMeSYh7XB/DUijSUCANOMsxH+K6IOi+Nnh0HPfSfk4X39q6GhzE1+i9HK4Xf+8oE5UvCzFwXJTWrHBRzH+jt8z5Ieq81+DH+XOS3HR98EqZJ+JjH3RoP0rg9x2c6EgpKgjlQ130Gfr6oSPgWptp/Uwab1WYy6E9Oy8gy7czPloBeRrePQVuxaAN8i/ujxrsHPMpJG2T8iplawFherhU+kubwKUXgA2Jyxb2NshFKEhmeFA+qRaacZF4KiThkXqauJAa7U0O8w1FSf5g7j43MZEnMrBKvJBj1U7dwt3evEU7qG556UT5w5qWY7a+4MJGSfvviUD/rxjHta8DxFTsJemOM/o4EiBYK9qIOS4CVIKZ8zntk+pE7lUybm/cY1hXk07csJK4906c1LQ9+RTt8zHvjYhGRxy6NF4Lgay5V3zFXMzE8aYuz9rX5t+GgZpxK62tfcSf9736rUqvFsQFXQeIfNYuUWOpuexFdMzk24RxlL+8PlG/EGP9Vm6ow2w7JlSnqgMEIaRpxOdZNWs=;
	4:NBxkH5rt2pUD0CV1gKPHCLXTNZ9NQ/wiGDtXNzkBPULehbY1KmvJXjBMTLwqKVYf/BjBt6e/VAcrdoH0OXYQFtHv43CI83vM2lG8aNJ+I8RGclp+LY9pTw4U8AnqYJQpC1fSDwT+5AF/o5o0+Bnq1yziRPI/TvOOIY3DzLG5gc5xpZFKshfuEafQV/bAYO94ysZliRGTih9rkmb57I45rOr+ZMnA3H9EGEXHcX7ABCkBk0rlLT+tNCNTIlUA/IV5sxmIQXYdD6B0nt7FYK63Dz3DgL+ogj0MTTzX/OglIY+b57eMsjiYaGn+Cg0dvFiQ
X-Microsoft-Antispam-PRVS: <DM2PR0401MB097432E2AEC1D4852AB01F48FE160@DM2PR0401MB0974.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(10201501046)(3231023)(944501075)(3002001)(93006095)(93001095)(6041268)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR0401MB0974; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR0401MB0974; 
X-Forefront-PRVS: 0549E6FD50
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(396003)(376002)(39380400002)(39860400002)(189003)(199004)(8676002)(8936002)(105586002)(4326008)(50226002)(305945005)(7736002)(68736007)(2361001)(81156014)(81166006)(2351001)(3846002)(36756003)(47776003)(6116002)(5660300001)(48376002)(1076002)(50466002)(106356001)(2906002)(25786009)(478600001)(386003)(59450400001)(66066001)(6916009)(51416003)(52116002)(6506007)(16586007)(316002)(16526018)(575784001)(6486002)(53936002)(86362001)(6512007)(97736004)(6306002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB0974;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0401MB0974;
	23:iiKRRDNOLQvdCP8sJqBdeIVHEn9ZtObp9fmIbai?=
	=?us-ascii?Q?A2rHfnKnKMFax+qICi0wl+0l/yliT9rOafxDBHm/2a3IcBQVgiItcB7+kEnU?=
	=?us-ascii?Q?s7dHisevqMHzF41u2fM7kuFbKH085lcqD7qQua5SkRzgCqoBnPD5jLty94Gm?=
	=?us-ascii?Q?bPuemEjfGYXSTE0K4h1pdlzT1OCMFEOMzq30e/G/3u1D+fStOSXNtZ8T3/j8?=
	=?us-ascii?Q?0mAP063+cSD/QncOLqxtne3rSbwFscGFa0i+a0VEpjbr4nnniBS9npqFtJ11?=
	=?us-ascii?Q?SkVEpUOYmMQq619ZKqKbvfhezwJbZa0DxinrNrWx0UtJ+Z9NzeZWg81Hx32+?=
	=?us-ascii?Q?xk/cndJW4yK6YqvYE0D0M3p9oxpJTlTnr9rD5pJR2DgcIXfhIlwTDRTFhRGQ?=
	=?us-ascii?Q?Uyjv9Q6i53mhwlIxMtAeCUR9U30REwFcQ1TvRZVgiZdO1SB3hqfv+JhQkHIY?=
	=?us-ascii?Q?YhMxnD0+uZ/WemokFwfZwQ4CDfgSgj0m6nLcjthgvJY8y2orqrIGP6jlSjBj?=
	=?us-ascii?Q?p4jKZERxw4IVG0+mSYhzSmRW7I1cfnhIDKRdPBtdjaGOfCpjAa+gd5GJrseR?=
	=?us-ascii?Q?CZ4W63wqlud7a4dBs9F0tqFsPDcvd/FwMVmypv4vz2FQl5ybNBgZukiBC7hF?=
	=?us-ascii?Q?PsGGS0o+NYhNehAnKiLHryR//JKL0Pd3imc4K4dVs4bUzKCA7XTMEH/Y3G3b?=
	=?us-ascii?Q?t2w93V9f2TwteW5BXY7hoBBEccSk4NL2sSrTzY5TEi62hqGmRM5Vwp6YrbFE?=
	=?us-ascii?Q?DFPo25SH6BUXltzIdnKIJRgWD5L9ZFxk1BAkV1CxVzs8njFp2/HTifJ8Mgw2?=
	=?us-ascii?Q?mD3NLnyYzVhz+7bVQhzTyaZc6osG5A3Nfz3MZ3gSQq+mYdKe9YkQf58HIeiy?=
	=?us-ascii?Q?Bb9ugCwaY4ziT3DE0oUyB9J0BnPslMlH0zk3rhcx5Qc1itDAe6jGBeP1pKTh?=
	=?us-ascii?Q?JRiTM1jwDOej1qsgyjjmicTz0DIC9EOW0X8DSOBbuVesBfxQaCk7NV8vWgHP?=
	=?us-ascii?Q?5o028MjbKlzOYBWv1tT97xciXvDkyK73jciLQeok02BFggy6xr9034/3ZPWg?=
	=?us-ascii?Q?uRW2+yY/TFgyL2VrWguBD8ktN6qql3kjnB8MOudp9STKh5hN+YwwI0szQhmv?=
	=?us-ascii?Q?WZBnd/QB+/Lnz9bGVpDlXZxiaF3HX6XlJ?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0974;
	6:eoIf7GE1ME8vaxwce/o6K38MNvXCtcTWEG3KCZRjQdbSLgB+srz6HiWHUURUqqGrGriEiJUvE90i0KJ+EbieOrCRwq7BQoS9sq4EWs0huAnMAlgjAxXLxxrVnj1RBBNfmoAJ+jjxMwbUqA+jcFALMUlTVoFCJ9pyrKJdg59jSdMKSt4ncFf0M2vY4CLPKGUZ8m/FzZ7LH07AmEd71ep8OVy4eWt65uCAINl/6+1n4QD7GmqiA22FRpjrlmw+OIAkIwR7ssZ7yGdqG73chx7PZiPcUIerg6wKp8Vwyut174VUzSR4lU99vM8pJGis8Jehql7+6tbu25etHnfgn8rJ/fF+9IZwXl6SvNYEEdB/YU8=;
	5:1bGmo/6M1Tshd8jiZpss5VBFINoOxMVUm9Ymgzp7aC3FHAlfbUbLUC+kgb/42ei/blSfw1sOQJ8o8kSm5yy6xPVSM/KGhRNkfsY89haCyk8j9XOuJGRTl8WMKlfZ3oKoPZABxzXfVhyxe2N7fliltXFnmA9oJvuKnPybjPaY5cI=;
	24:KNI7SB/z1b5WsJwlk9QOm6wLRPNNkVEYLGZmAgDrWAggRKXx5szGK3WCHV6BIE+YqGiR5IXrkLc3l8VSitI2ovJl+cH0l0zDYJhdpw+Kni4=;
	7:OlLwSd8gvq5KzXQ9olZOutZwIpWXY32B/LPPWwz12tPfjYYLE6KawMTQYEkQHYg97tRjCAK+tXiTI2rVUwEyJm2qXKv4qnfPOb+tzdGeeqOFr0kX0nAnwr7o0hjPU1JiLCZ/W3Kfzo1ucr2ncfo0egQB9qx0vN/urRIGsRqjAlfsbHzvZCuN8Su9uTSu6VI06PMPlFBdsN0zF3EXCT8ngjN9bJsiPAAyZoOCv5h4tWJTSErsyBTG367AYQTBqrQ/
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2018 19:15:35.4979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf311bb-edd6-490f-acb1-08d55927b16a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB0974
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1801110262
Subject: [PATCH] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Thu, 11 Jan 2018 19:27:03 -0000
Content-Type: text/plain

* Move the hwclock.sh initscript from the busybox recipe to util-linux.
  This script is generally useful for distros that get their hwclock
  implementation from sources other than busybox and we follow debian's
  example by providing it in util-linux.

:busybox/*
* Remove the busybox-hwclock package, as it no longer has a purpose.
* If busybox is configured to include hwclock, the busybox package will
  RDEPEND on util-linux-hwclock-init.

:util-linux/*
* Provide the hwclock.sh script in util-linux-hwclock-init, which can be
  pulled by any packages that depend on its functionality.
* util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its
  initscript.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Acked-by: Haris Okanovic <haris.okanovic@ni.com>
Acked-by: Adrian Ratiu <adrian.ratiu@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
Natinst-ReviewBoard-ID: 214983, 215755
---
 meta/recipes-core/busybox/busybox.inc                    | 16 +++++++++-------
 meta/recipes-core/busybox/busybox_1.27.2.bb              |  1 -
 meta/recipes-core/util-linux/util-linux.inc              | 14 ++++++++++++--
 .../{busybox/files => util-linux/util-linux}/hwclock.sh  |  0
 meta/recipes-core/util-linux/util-linux_2.31.bb          |  1 +
 5 files changed, 22 insertions(+), 10 deletions(-)
 rename meta/recipes-core/{busybox/files => util-linux/util-linux}/hwclock.sh (100%)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4012f921c6..d9c3c2793b 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -20,19 +20,17 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
-FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
-INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
 INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
@@ -276,9 +274,6 @@ do_install () {
 	if grep "CONFIG_UDHCPD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
-	fi
 	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
@@ -377,6 +372,13 @@ python do_package_prepend () {
     else:
         set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base_bindir}/busybox.nosuid")
         set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
+
+    # If busybox is configured to provide a hwclock implementation, add a
+    # package dependency on util-linux-hwclock-init for the
+    # /etc/init.d/hwclock.sh initscript.
+    with open(d.getVar('B', expand=True) + '/.config', 'r') as fp_conf:
+        if 'CONFIG_HWCLOCK=y' in fp_conf.read():
+            d.appendVar('RDEPENDS_busybox', ' util-linux-hwclock-init ')
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 6c1f4888cf..af2abadc5e 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -8,7 +8,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-udhcpd \
            file://default.script \
            file://simple.script \
-           file://hwclock.sh \
            file://mount.busybox \
            file://syslog \
            file://syslog-startup.conf \
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 248e8bee95..7f86227811 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -19,13 +19,16 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion ptest
+inherit autotools gettext pkgconfig systemd update-alternatives update-rc.d python3-dir bash-completion ptest
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
            "
+INITSCRIPT_PACKAGES = "${PN}-hwclock-init"
+
+INITSCRIPT_NAME_${PN}-hwclock-init = "hwclock.sh"
 
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
@@ -35,7 +38,9 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
              util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit \
-             util-linux-ionice util-linux-switch-root"
+             util-linux-ionice util-linux-switch-root \
+             util-linux-hwclock-init \
+"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
@@ -89,6 +94,7 @@ FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-rfkill = "${base_bindir}/rfkill*"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
+FILES_util-linux-hwclock-init = "${sysconfdir}/init.d/hwclock.sh"
 FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
@@ -193,6 +199,9 @@ do_install () {
 		# and thus prevents the operation.
 		ln -s su ${D}${sysconfdir}/pam.d/su-l
 	fi
+
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 }
 
 # nologin causes a conflict with shadow-native
@@ -300,6 +309,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
+RDEPENDS_${PN}-hwclock += "util-linux-hwclock-init"
 RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
 
 do_compile_ptest() {
diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/util-linux/util-linux/hwclock.sh
similarity index 100%
rename from meta/recipes-core/busybox/files/hwclock.sh
rename to meta/recipes-core/util-linux/util-linux/hwclock.sh
diff --git a/meta/recipes-core/util-linux/util-linux_2.31.bb b/meta/recipes-core/util-linux/util-linux_2.31.bb
index a83919b5ac..9d754de719 100644
--- a/meta/recipes-core/util-linux/util-linux_2.31.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.31.bb
@@ -7,6 +7,7 @@ OLDHOST = ""
 OLDHOST_class-native = "file://util-linux-native-qsort.patch"
 
 SRC_URI += "file://configure-sbindir.patch \
+            file://hwclock.sh \
             file://runuser.pamd \
             file://runuser-l.pamd \
             ${OLDHOST} \
-- 
2.11.0


