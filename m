Return-Path: <alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id AC5737886B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 13:14:06 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0CDE5IC003335 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 07:14:07 -0600
Received: from nam01-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam01lp0177.outbound.protection.outlook.com
	[216.32.180.177])
	by mx0b-00010702.pphosted.com with ESMTP id 2fewerr19a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 07:13:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cMztSwS4I8dY/2Ax2d/15tsH3PBmS87Je0QawWlsgEI=;
	b=Y26HwBP4VTg0stoxCZf0fCGq1lYytFgN90xRbAs9pVEeySMAcqEmnI5PV0Thjt9mHYynYV3dxKCDDSIr5Vrvv/aQeQPdDGTGo0/Y/gOBJGb95QyGAcGOCxlFBH1xERyHK0iqG4Hdnibpqt5xdWRV3Ok6LljU0CLDRWd9PDmtccE=
Received: from rtosams.amer.corp.natinst.com (130.164.62.180) by
	DM2PR0401MB0975.namprd04.prod.outlook.com (2a01:111:e400:3c0f::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7;
	Fri, 12 Jan 2018 13:07:22 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 07:06:44 -0600
Message-Id: <20180112130644.21313-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [130.164.62.180]
X-ClientProxiedBy: BN6PR21CA0005.namprd21.prod.outlook.com
	(2603:10b6:404:8e::15) To DM2PR0401MB0975.namprd04.prod.outlook.com
	(2a01:111:e400:3c0f::12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c70a3f28-d116-42e7-ecc1-08d559bd6b93
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:DM2PR0401MB0975; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0975;
	3:lrwC9elItX/Q5uD3t+iwCbg7hn45y/sV4J0eUwvu1jSURGbM/svZ3KNZ1CegrRf4lKw+o58mpdU/KXzMgthLfkSQfNH8qzXIbjZTzqOom9wYuAzlsWl2Ban0uDuIxL6OSqjRBFNACUpA9N366BdxOgKiznKqAxZ1nYYPFRm+JJwrbRILElQesiQiTtSNQDpqVY3OSY9M/CezzyMhfuDIU0pbqpxBA4uDJtpGhwKOLg3/BdcQsoZRmbNy97rInRXw;
	25:N7Uxma4C5YQxBOXXXH663AMalLmUCIG1oMGqLGkykT+Y/e8bACp7YN1a0iWGfvHEbn2lnaD/Mi1xLt2TjxBJ2KasvqAHgGCcOz0EBKVigO2HLJvtCpDF4Nk/5PmBxWwroRrV5TCDqjMacsWsXWoUpLnv/iZ54dYEzDvcCaGxPMlqxEsBzCD5WKMPyIoNVyE7+/hXU60dEujtQvqoKFimRxs0fW7DQ5FF85GZhsss24p/36XhgVD4/5MlmqczcCFZoWqupmkdNQE5Qo2Lkw4e6dA9cga9fY+boT9LKbqncxi0a7NwBl3HgP+mSJ9m9uXSNS3T38lF/IdDuRShp3FOjg==;
	31:uL2VI0jkuQ+K3mF+d89vaCN7O1Z54l4DMaSVj1G8xP5y1YBkUvy2budxxw3HABIFeORXvjcK93+FrpMTVcnZMp7Ynk9WCK87JfNCI9NZQoSsDwgEInfOzSuwYcjoVXvzS/mV5Y5YptwXTZ8/hfEIc1aoYnp/vuT5Xrpfn9f2xWGTk3YW5YRRVbiD6NLFcy6XaYTXhEiyTgez/BVTekgrYfGtt67IQYK7u+X/QJ4hJ5k=
X-MS-TrafficTypeDiagnostic: DM2PR0401MB0975:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0975;
	20:Bhsldv3buRtbkCJJXbymAGxpa1k5QyeSs0NntbeZnZRQ/xOF9Rh7ukqwD7YEgbrPSUgSSifjb5kTAN4whV/EXhYMpF26jMmqzsRSwP33Ed4AdEaxl6opzEt3vsX03uFJoCXGGO9yQMluh3KyirsCOR/HWU7At8ZmeJhQQC/AWl1xdWnQ+a4EvpMdu+gbGNLWvPYMqe4s6r99opAcY5WQH9Z/x7OylMiXPzyF8mrGLXSs+A9CRJuxvf0HYzhSthbNgdQfdNMhNlvEIAPoV+qH/r59u/Y3loPbvYl2ZUTRmknDTim/KIsW797wY2mF6fHVrzAKiw97O0YRaEX5zJtr+KMnwYi5qQsJd0VKkDHnCSwYTXiOqg0AFcaQsSS04sUuQhNB0WDtXbQ6Z+ZoG+PcpPSz2b8Ic8rFLX7kC8C3K8CSEIHeUiNtih2cHRps3QpDttNM8YdFy7NAD/TVpjO6qEKK/ymK9qxME2j6s8qxDIu0LlUYxjME+KCVgQD+d1hNz1MKbh5xmgMx0aivEDqJEwDKYpovIENrPzFAnRUEKLJUMBFq6mrOSyCJkhAKjEYQmhG6IwGc4Z0C4q3FkgkvaYJAkA8uPm4ICaag1633p/E=;
	4:aaTXVdC61cd0c8ix3dlNDBFnjt/Tk3UETm9Faq6ng4L1F7DR/CA0CMdMFGD0pRxe7WTo/m9UGJA9cIBZOofjju/RTJzYGYgZVnOM1h21LzmzbjhF5MUWGE7jg1d24gASb7YAv8fLTJQVUQ4huh+3FqrPtBdDavBuroYLbFP82jwaSbt1LYxqIDqlNOdUHSg1DeBA1Ed/VG45AcGl8tNXGZkN8J3PU86xB6EffVHNzM67jKVAyx2+4aeWrEQc+cK4K5ljVaMkJrxqqvLQgOiyGyCilUmUVQnQm8EjhH6C2lBx+sskwpz1xXN4AznbTgGL
X-Microsoft-Antispam-PRVS: <DM2PR0401MB0975AA3D90DD18C967EC340BFE170@DM2PR0401MB0975.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(10201501046)(3231023)(944501075)(3002001)(93006095)(93001095)(6041268)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:DM2PR0401MB0975; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR0401MB0975; 
X-Forefront-PRVS: 0550778858
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(39860400002)(396003)(39380400002)(376002)(189003)(199004)(50944005)(106356001)(16526018)(51416003)(386003)(6506007)(105586002)(59450400001)(52116002)(5660300001)(50226002)(8936002)(16586007)(47776003)(4326008)(66066001)(8676002)(6486002)(25786009)(81166006)(81156014)(86362001)(575784001)(316002)(3846002)(6116002)(305945005)(478600001)(36756003)(2906002)(6512007)(50466002)(68736007)(2361001)(6916009)(6666003)(2351001)(97736004)(1076002)(7736002)(48376002)(6306002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB0975;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0401MB0975;
	23:tqZlWEF7XQcZr6vooIDlfSZgO6+4loxGGkwMkcM?=
	=?us-ascii?Q?6O+jAEFVdqAVyyoIE0yMeCwqThi6QeLNruF1bM1dRlZY49GQ428JYQxitRi5?=
	=?us-ascii?Q?d3G+tfXYgvyaoXGwbSIZa6v5w2tRedCZio0Plhw+DfeT2OXaCi2qDc4GT/dM?=
	=?us-ascii?Q?WTMvY0bylOuDgqyuiG2VLodPlE5FQd1J0DUoTJq4hCeOx0DW3UHYw+Ksbkp+?=
	=?us-ascii?Q?hYyPvGiHHKrNN8qQRpyxcyAxEDLiGp2+C4y7NsViTybNlRrZoQYc3SVhphKg?=
	=?us-ascii?Q?SRgiZctJd/tm7KcHmp3hXALlhewOJNOYkBkAItig8inf0yU9VMfAHKioy5xq?=
	=?us-ascii?Q?1e9j64e5eYtJpKEFa7RxwdFtCtItiNJclbdCdp6Bky30fq5Bqi/594kOlBUQ?=
	=?us-ascii?Q?0ixFNhj00b8xyLiJM70GPlasZSdYOKDFKwcQtAKGMTRHnCRViujPB+4+aW+H?=
	=?us-ascii?Q?uZ+LRV1W4NSXIrFpvwMV8sDn3D026yZuImeABwl5Vs5GPJBH98EZIXynXFbi?=
	=?us-ascii?Q?Lb6FV5l+6c+2xBaS5grTjPLUiFz4juxSfEvLu8MXlOIWBI/ewPVGzxRueJX+?=
	=?us-ascii?Q?g+/xx9rBOpPZ81RjKQ6SGmGXsSEK0SEFGgIPH7qu4VhvH/w0qZKLxxHTebLr?=
	=?us-ascii?Q?Ttvt7jOc86ubdrQW+BiBIj3lbjC8dWjT2UTBhMA6+P137/GCsEWkYxFQg8Py?=
	=?us-ascii?Q?ryB4NQTrkyqk3PeRSsUQ+5zjAK5ZEmLb/ql9MD92S4nQxeM8xyaOiVGuLsEr?=
	=?us-ascii?Q?kgY+cHfPZ9TgZhan1QLbZbgZuSOrnP//GuZqgWfChVj/cwuozK3sIk6UDf6N?=
	=?us-ascii?Q?HeuX2ljh5M34hKevH3G/lcEb3oiDhYJe6ategQcA9XhE2Wro1PLYu0j3Pe8/?=
	=?us-ascii?Q?1jTh+wtfHnd2BWt+oYEjIh7XLsLA7Euqizce84H0Uua99TzVaSz1L22MHSjL?=
	=?us-ascii?Q?/TJMORf8B6gb52UCtoM8p6B9lA+yeHGMTi9Cmx6f+FbYsdV0Fv6nLJNfLfG1?=
	=?us-ascii?Q?GAsGQiieBXqTusuSxAeovJCmZcr3EI3RlMWPq1k9ybnAyidb8C1J58Rh7bOn?=
	=?us-ascii?Q?DFkezHBb0wy6+MCLAU5iKEBe13p6+Pshu8fh5zDEDmSMiNJI40LZolG7yUaD?=
	=?us-ascii?Q?q1YJcWwKVd44sBcwUSDZHGmTnuq48dcu9zRJ81hqCyTR4XVqv3iwqUQZJMTQ?=
	=?us-ascii?Q?Y3skkr8figsXwTvo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0975;
	6:ByKykYElhHI0zSJmajKYblylWPh9LX16A97+0z2MNLAukCYjLf/keW9Cb9SSZax3hgwDQZ2/KAZDJtPTex+fTBeSlfY1B+5Twt4PCGK09bRqP+g44ZYVgU4+gH41e0yWke74e1vFUOOLmQh0/t1ndN39TTqSsPn882rNRSE4a+sh9Gxzkwnx6ElyVtfrshXik0uhsHjK1C0Odeu6hoRvn2bwocHvf2fFwf0k99Pw8ocAYJpDQ7Vn4yaCC7JQrwhWnmaaOYJ9fNUokUnNo4PoQsbZdcuXBwmlZyECrHZDc3z6s8ZQuaMSyayVE+jumwdfvMd4vSNNkCWaHIcHHx+iq1472hxOWBhq0Sz1OEfgEZM=;
	5:YKwB3B8J2nSRpajxReGmM1i6BoQl49KncmEyQUwXnB4YHUmdJBd9nhJ9tGv0dNz6Lq3qM2Ux4eueY4cj1X58VnLPKI1VvmUqTV/WG5YUNZLAqxhDLOYYesVGWebI9mPWgyF2gGhwl70tagkgy5xYUqP3CFgZzLQn08a03IcdQaA=;
	24:fDmSqP0oIcNY1RzuEGjOM9guFEtnYdUIDujB48hPrOfcPHZSceBMyL748Kfi59+xcNFfFeFaKqCncuL5Nv7NW3y3MUEfjGXyKVZHyy9HbVk=;
	7:hq5J47J1ZUrjdi2jh4YJYlAbLoMDUH8xQS0Tj9oeTmzTAMbVVCUahIOddfwjprpZBR07eeEPno1m5WD08jcQeyv0GUBhHE/GrsGRe4wqNxBVrbQb+abkhW21708RZfwhRmLqux/G8z1CmdhIlSRJThi4lyB0Mm+u6ik+j7qT+pd7YrqqtqkrjQYLxemKit7eNlJqUQtyk/7l3CeGR+eCBrtye8utvO1209IXScdR728p5tcRWrkpAeucTLE27J0N
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2018 13:07:22.8528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70a3f28-d116-42e7-ecc1-08d559bd6b93
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB0975
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-12_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1801120180
Subject: [PATCH v2] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Fri, 12 Jan 2018 13:14:06 -0000
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
 meta/recipes-core/busybox/busybox.inc              | 16 +++--
 meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
 meta/recipes-core/busybox/files/hwclock.sh         | 83 ----------------------
 meta/recipes-core/util-linux/util-linux.inc        | 14 +++-
 meta/recipes-core/util-linux/util-linux/hwclock.sh | 83 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.31.bb    |  1 +
 6 files changed, 105 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
 create mode 100644 meta/recipes-core/util-linux/util-linux/hwclock.sh

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
diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/busybox/files/hwclock.sh
deleted file mode 100644
index be5f94d86c..0000000000
--- a/meta/recipes-core/busybox/files/hwclock.sh
+++ /dev/null
@@ -1,83 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          hwclock
-# Required-Start:    
-# Required-Stop:     $local_fs
-# Default-Start:     S
-# Default-Stop:      0 6
-# Short-Description: Set system clock
-# Description:       Set system clock to hardware clock, according to the UTC
-#                    setting in /etc/default/rcS (see also rcS(5)).
-### END INIT INFO
-#
-# WARNING:      If your hardware clock is not in UTC/GMT, this script
-#               must know the local time zone. This information is
-#               stored in /etc/localtime. This might be a problem if
-#               your /etc/localtime is a symlink to something in
-#               /usr/share/zoneinfo AND /usr isn't in the root
-#               partition! The workaround is to define TZ either
-#               in /etc/default/rcS, or in the proper place below.
-
-[ ! -x /sbin/hwclock ] && exit 0
-
-[ -f /etc/default/rcS ] && . /etc/default/rcS
-
-[ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
-case "$1" in
-        start)
-                if [ "$VERBOSE" != no ]
-                then
-                        echo "System time was `date`."
-                        echo "Setting the System Clock using the Hardware Clock as reference..."
-                fi
-
-		if [ "$HWCLOCKACCESS" != no ]
-		then
-			if [ -z "$TZ" ]
-			then
-	                   hwclock $tz --hctosys
-			else
-			   TZ="$TZ" hwclock $tz --hctosys
-			fi
-		fi
-
-                if [ "$VERBOSE" != no ]
-                then
-                        echo "System Clock set. System local time is now `date`."
-                fi
-                ;;
-        stop|restart|reload|force-reload)
-		#
-		# Updates the Hardware Clock with the System Clock time.
-		# This will *override* any changes made to the Hardware Clock.
-		#
-		# WARNING: If you disable this, any changes to the system
-		#          clock will not be carried across reboots.
-		#
-		if [ "$VERBOSE" != no ]
-		then
-			echo "Saving the System Clock time to the Hardware Clock..."
-		fi
-		if [ "$HWCLOCKACCESS" != no ]
-		then
-			hwclock $tz --systohc
-		fi
-		if [ "$VERBOSE" != no ]
-		then
-			echo "Hardware Clock updated to `date`."
-		fi
-                exit 0
-                ;;
-	show)
-		if [ "$HWCLOCKACCESS" != no ]
-		then
-			hwclock $tz --show
-		fi
-		;;
-        *)
-                echo "Usage: hwclock.sh {start|stop|show|reload|restart}" >&2
-		echo "       start sets kernel (system) clock from hardware (RTC) clock" >&2
-		echo "       stop and reload set hardware (RTC) clock from kernel (system) clock" >&2
-                exit 1
-                ;;
-esac
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
diff --git a/meta/recipes-core/util-linux/util-linux/hwclock.sh b/meta/recipes-core/util-linux/util-linux/hwclock.sh
new file mode 100644
index 0000000000..be5f94d86c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/hwclock.sh
@@ -0,0 +1,83 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          hwclock
+# Required-Start:    
+# Required-Stop:     $local_fs
+# Default-Start:     S
+# Default-Stop:      0 6
+# Short-Description: Set system clock
+# Description:       Set system clock to hardware clock, according to the UTC
+#                    setting in /etc/default/rcS (see also rcS(5)).
+### END INIT INFO
+#
+# WARNING:      If your hardware clock is not in UTC/GMT, this script
+#               must know the local time zone. This information is
+#               stored in /etc/localtime. This might be a problem if
+#               your /etc/localtime is a symlink to something in
+#               /usr/share/zoneinfo AND /usr isn't in the root
+#               partition! The workaround is to define TZ either
+#               in /etc/default/rcS, or in the proper place below.
+
+[ ! -x /sbin/hwclock ] && exit 0
+
+[ -f /etc/default/rcS ] && . /etc/default/rcS
+
+[ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
+case "$1" in
+        start)
+                if [ "$VERBOSE" != no ]
+                then
+                        echo "System time was `date`."
+                        echo "Setting the System Clock using the Hardware Clock as reference..."
+                fi
+
+		if [ "$HWCLOCKACCESS" != no ]
+		then
+			if [ -z "$TZ" ]
+			then
+	                   hwclock $tz --hctosys
+			else
+			   TZ="$TZ" hwclock $tz --hctosys
+			fi
+		fi
+
+                if [ "$VERBOSE" != no ]
+                then
+                        echo "System Clock set. System local time is now `date`."
+                fi
+                ;;
+        stop|restart|reload|force-reload)
+		#
+		# Updates the Hardware Clock with the System Clock time.
+		# This will *override* any changes made to the Hardware Clock.
+		#
+		# WARNING: If you disable this, any changes to the system
+		#          clock will not be carried across reboots.
+		#
+		if [ "$VERBOSE" != no ]
+		then
+			echo "Saving the System Clock time to the Hardware Clock..."
+		fi
+		if [ "$HWCLOCKACCESS" != no ]
+		then
+			hwclock $tz --systohc
+		fi
+		if [ "$VERBOSE" != no ]
+		then
+			echo "Hardware Clock updated to `date`."
+		fi
+                exit 0
+                ;;
+	show)
+		if [ "$HWCLOCKACCESS" != no ]
+		then
+			hwclock $tz --show
+		fi
+		;;
+        *)
+                echo "Usage: hwclock.sh {start|stop|show|reload|restart}" >&2
+		echo "       start sets kernel (system) clock from hardware (RTC) clock" >&2
+		echo "       stop and reload set hardware (RTC) clock from kernel (system) clock" >&2
+                exit 1
+                ;;
+esac
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


