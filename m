Return-Path: <prvs=2618a40847=alex.stewart@ni.com>
X-Greylist: delayed 1080 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Mar 2018 19:14:26 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 686927889F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 19:14:26 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w2LIu2Lx016677 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 13:56:28 -0500
Received: from nam03-co1-obe.outbound.protection.outlook.com
	(mail-co1nam03lp0021.outbound.protection.outlook.com [216.32.181.21])
	by mx0b-00010702.pphosted.com with ESMTP id 2gs1a09hs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 13:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=q+PjN9Fz8/12z+c6jO+qOBt1LT7kPTOjycjVr+fcblE=;
	b=cxlPULb9PxbKGGAbAHcNsiabE00/Ht+biqCuLF7vAxczFBlJ77tQMI1Mzq6tJEayRKjEcAb6BXwvDdzQY141NICkeY86X0AldKDKmrXlzuUw7/EJCKRSjm4Zh3tiSTOk7QN+iU0J2DjkwxFMoqSKIH9nH4VSsC1udyullqYZkf4=
Received: from rtosams.amer.corp.natinst.com (130.164.62.179) by
	DM2PR0401MB0973.namprd04.prod.outlook.com (2a01:111:e400:3c0f::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.588.14;
	Wed, 21 Mar 2018 18:56:25 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 13:55:59 -0500
Message-Id: <20180321185559.30749-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180321185559.30749-1-alex.stewart@ni.com>
References: <20180321185559.30749-1-alex.stewart@ni.com>
MIME-Version: 1.0
X-Originating-IP: [130.164.62.179]
X-ClientProxiedBy: CY4PR1101CA0017.namprd11.prod.outlook.com
	(2603:10b6:910:15::27) To DM2PR0401MB0973.namprd04.prod.outlook.com
	(2a01:111:e400:3c0f::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b2b0eab-5522-4e30-6e97-08d58f5d7236
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM2PR0401MB0973; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	3:+yh0bhLMfQW3LqUVQFplMiQrOzM5GB4gFbAM/qqCcvbqUAL7iAcqNfnotVd1WAaqta+Y4We2TGWcsR4X1lBjWdUcXgFkQJSwvdAsaW0E/+MCptSutZfoY8FQjKd31z1Mbw5njtZMHsaPM7F+d9/YB0OzxCPN+3Oq5E0ZAaDmlomKDX0nW09EugTL25Kowha+3dAeyNwGB/xNdkmLOpCKjXbajCXaRdqwt5w/oA3aGAX+00OUUsMjHsOI3UB1NXO7;
	25:pxMF2s6FOclU7YG7hSJCrYrNS02wmREhhLw9p96GwYeoeFFBh/ZPJMZWoBz1RNZvjGq0Mn3ANM870zZ5lyc+ukpY8p74SisPLceFMcXOHXS9tPW/eOrtcuRnBTzId+wcBokONTNtb3/QAP38OPh5HSuMgPzIBqiypSVh6Udg3aLcskY4jg5rbZfs5bzs5D0hlOg1H1qFjEmp2jIW7gulNArqU+pTNDBLOLIct51bX31/kP5RZvzyh2ggOKCmu36DYPTjx/m+Ah/3dl3UOZ1n4RcR+wZPhwxMNS6lPJIWLhNVRmr+hQjjk+ufVrjoBIxURyRsPell4HiGF1BtIw/g2Q==;
	31:mFMBTXcp8lxyFFFITSNzYG4yJRonaOpTg5845fubNh2LzfQjlnWeEsBoV5WlMfSLhZvEKgB7JAq0sFmNo+EfNECNk4GhNj7KqcbuNSZjmRnK/cJTVBu+GDn7KOWBwB7KwqRXpiRX1ruDxG8wSAFKzwoRFKMUsu63WaZLM8j903v7aKMEsOYXdl44VFX5Mb08ChErZJcLwpzNlbzqAaVImnQ0WwSwqdMBHVQzM6UbdzA=
X-MS-TrafficTypeDiagnostic: DM2PR0401MB0973:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	20:fvO45cM4Jl2wCFhFQUdtKwymsCmNmTvtWDcUYIrZ2/tt4I2/hGWGi3cFAOZmm0/7HG/Q70UGNDiOjJuOlGKyFnKTbh/An8rYPXWsfulLxZ5zhn04WI4z62iv2k66NQ/tFOwIP4p/LSO5SnocNlG5sYDxO9y1RqTX3KyBxzKAUkK6FQ2R5h2qi/C8t6Zlzd7wY7nFN9Ax6gECgkPYe5Nkj99ei7i/SJqEzcnXsJFfr3X3NA1mTHxrw3LPVLAD1CTozCrsEfbHq0htglc0kMfgNzcn+CDomsYP+fC7M2tThACfDOUgegNH1GBXa1aJ/HM5qTecfC88pRzn1WPjgZL2tV46A6tr/7Bbxragw/JuJtvMDRcjTfZu7kzOJ9ho6toNNM/KWzO+NW5BrQU70J0zeJtxzo/T5ShcmEDwi0GApfMKhmvsS21BbI+EsUfBKF2mkxRCmrIw+zZhMBvZGr2jNO5xFpab+9cIzGHEhwwWIdszuNRwoCNCXKT2ZFMx125Id3QSW28shk29q3OtReYIvA5K9n4vj8lt8GtbYZdQTJdxenVvFWlcmYWBrLMlIHC8wGvGEZic10TPaQEqSV4cT6FZHUSCDIIOt9HW4sQaOR0=;
	4:4v6OYgE7u8dMq8fSLIenf7ozabMozb9C0goS6CSBI5dgH8FG2JroYSjYLKCQKUsyedCjz9ha+/la6ybI2fEpVw6fQocxWFoDmjAzeW3gGZ5et9JP7d9Hi7iymQMbnZAgKL5iVy0nP20QVcDeXLoLVVdAcvrN+wx2oZVs0GsiP3DjSu8Pu2ZSo6ruqe3oABO1d/I2ZiQaQT1x3dMHHh+asNWN405tsnl05lKymrCH3jKc6K98AKAHm5nnUXwPZZALIeQNK6c5Rc+SPk68+G1A3Po8k8O9dBe7Kmq/KSmZEPRm7NiDN9fusSMveNfdH4GO
X-Microsoft-Antispam-PRVS: <DM2PR0401MB0973F4C4C36F644ABD8AAFEAFEAA0@DM2PR0401MB0973.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231221)(944501326)(52105095)(3002001)(93006095)(93001095)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:DM2PR0401MB0973; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0401MB0973; 
X-Forefront-PRVS: 0618E4E7E1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(376002)(39380400002)(346002)(39860400002)(189003)(199004)(50944005)(6666003)(7736002)(3846002)(6116002)(2351001)(25786009)(4326008)(16526019)(52116002)(105586002)(76176011)(186003)(2361001)(305945005)(51416003)(8676002)(53936002)(6916009)(1076002)(316002)(86362001)(81166006)(16586007)(575784001)(59450400001)(2950100002)(6486002)(68736007)(6512007)(8936002)(81156014)(6306002)(48376002)(5660300001)(47776003)(50466002)(1857600001)(386003)(36756003)(2906002)(106356001)(6506007)(478600001)(97736004)(26005)(50226002)(66066001)(446003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB0973;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0401MB0973;
	23:cL0kFlKnZo8oWfrJTDPcsQrzY62RPbCr5R3sg8A?=
	=?us-ascii?Q?K6+XqnxxK48Cxeax0OkOOxsBt+SEsUjwRuF5l3Sa/Gk/NmqaynVoIUpxwqzr?=
	=?us-ascii?Q?EMnJLWJPvvDjEviUbBeMGEatSdcZ84PMc+8cFpYzFSTF3mSJJ2u2mmnesecY?=
	=?us-ascii?Q?2gxcRTmCtFUacY7Tj2FJr4x3RXcrGGWKQZfKA0TAf//VIMxTk+SLwwDFFAhP?=
	=?us-ascii?Q?U5BxMNVqA4+VzBtHVx9pkS4ShC55/0qVEayIQliWbb84OCUL0H6K5IShVBk0?=
	=?us-ascii?Q?12KNiGsn+c+TiFr9YvL8p2Yldk34C4ZHunCsKNSbMjFJEEKZez73I2N9b6p0?=
	=?us-ascii?Q?rKVoYIEJHBVJFD8Rg6hK0sEbDaJsZZeDjZVajGTLW+SKYGYETBLSGVsva38T?=
	=?us-ascii?Q?s+nJSF3JFlX+8wyvwz7QYCXXrDxnwJCMiLoIyUe38Aqapi/laHQBaPs7JQFp?=
	=?us-ascii?Q?5jS9JoKdYM6oS0eqLOOf339QJRe3e8RsvYZ7p5dYj4G1SV/mTU5Ks3ekJwBg?=
	=?us-ascii?Q?ihCLYwmzB5R1gnVRMfAwZFGAwswXzqSXSeQxlbE23vfP97eW+W7ec+wEGcOO?=
	=?us-ascii?Q?ZEh3c4N0W3XUFyIRnsRwRxKeoIlZ3cYX4Vn3p5fiBjeXxNRF+4f/+6vUehyu?=
	=?us-ascii?Q?cOkYQvmDoUk+MM8l/SLFAGKs7yMMWR8edgfUXqrCH07gqNQvpJXtkpUGCtiC?=
	=?us-ascii?Q?xhdERxvseknluoksrzXzwscKs9kigUjpbsY6M4e4DZIUclT6FMpdbZ7Qc0r9?=
	=?us-ascii?Q?6FQ4aL5pqbav1YeHliXAZ/lErh8SRrjNOecHXZmRrfgYs3S6OGuHg+PvZd+l?=
	=?us-ascii?Q?ROXcko6jqanAQKyE/GF7mr4wq4JMapMhCVXcP3yIeVi7WEYU8iIYc7IjqJrO?=
	=?us-ascii?Q?m/r9digeNJBRiGu99qTPekshhqSa8IYb4ppRV7pd9rHtWBZlT3PHPN12aZ/Z?=
	=?us-ascii?Q?MJRlJOEmsCwggOhm81yUQKMIG2g/RJy7v/25U1/COE/z5pv4g82AULcSy1Sy?=
	=?us-ascii?Q?6k+JYvhZ28dO41aBY+FesCYIebwI1I9V38zEHD1z0uxfAPomb27oljQB0l82?=
	=?us-ascii?Q?JioJQKCjXEWCi209zjWFu+cpRBzLY47HDZgDx0Y4A92bBmI+dEJ7L3P8Ol/s?=
	=?us-ascii?Q?7IfLJHUSd9VvGFpRhnEKYytZqOfCSfU3rDad/T8xXp/D9e9zzRApffyAi+ro?=
	=?us-ascii?Q?x5h8Z0KRrPSSdUuCNPpclsgHMiTZQVxMWR0/X4lPI+yGR6+m04UMK1Px/HC0?=
	=?us-ascii?Q?sj7wPiOA2DrptYjV3p7rJZbR2S8aWgCzpW7NteNvVK+zCKsxRSOj0S70rN5p?=
	=?us-ascii?Q?x6w=3D=3D?=
X-Microsoft-Antispam-Message-Info: q22XLCPUbf6/B2JLsWoZ2lXUHY8WAmRsgJxIbPGiEIwKtsp50Ce/NBlKY4xsR6MlwsYhRyNBVVzDOEbfiIsZ/KNTHv54dQJlv0QEsCpnqpImgnlGNCNJo2eAOM5BIIpFHpQ+5jGl7RVUsBYs3fioEmBOyPbSZ4BXP28xFc6uFrjMo8nx3livPjOLPqhNIZDG
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0973;
	6:70U3RpXulEwMavscXBinMO7VbdhVwIBNHBiH0f+4/EKRi3EVgsJwi63+AMEmEORfoZfrlyytejnvQ5LakF7f8ewu2mUHIOHaHbhAdKgiHJC4IBxOf85SswsPgjfw4CY9VBA8vl7MTA+t2VgAv2GV+DIUjd6EDRcRFWP60YSV4CbvRAOH5QrUHLUXLNVs4uG/yCTwEfqW1x49zFeaSMlj4SzkoG+uqUX0oByc0rLykRZTGy4EpTtsHCvxCS0yskGHU5yCDVoNO5V8kdINyZ9XvWMfChYlUOxO7NO7/w78ZTNnHEc0EHJAZFUCHdrRtHc058SHsgYsuZLJzc6x+6Bo4hVBUmIY0C74u5aNVtrI0HQ=;
	5:HVulpzI2Vhud1fgH3Ro4rS74WKFGrwkPOh6p9BmdRyFsx9qVsoQNeHE7JczHA3G1AE32erxsbnqKNkm/HeYJbDK8dABfOIRUcQWDZEnB6Emkf3nUZOfjvh5knpnPu2arXdeYQl1cgwLA/xuI9Q/77t3dloZYBF0a5mU30N/28d4=;
	24:cP6bHDLonSz1ya5H6FAH6HZEfpOhPx3dtBZRHN6pjjGrG8uhv4u6UtIe9MANlr1nqCnH3jRGdXEYRkrY3fPTsbUKKs4pjEcHXGreJHJFI/w=;
	7:jusbb0iwfSK2JLcbti66PyP8wV+Knk4dU+AEYucj3NQgNhuNdafvq170Ifza8HI9vwP/sKp8g8TP5gEREQdQ/zDNz5FwdLB2TBpm4aD3s/pbGvLBDicXBEB2aWGf0iMdDR1dDzObBLZ065zPgpdp5uT9tmUw+ORX8hmcdhNKqcNHMBDSJsoRIZ8apNvIjOM+iCWujVho4886kMAeD5VBLXU4bIDzcATDxeB/u7MAFi01SOk1TJvWRNznNG5p8cE3
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2018 18:56:25.1818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2b0eab-5522-4e30-6e97-08d58f5d7236
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB0973
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-21_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1803210217
Subject: [PATCH v2 1/1] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Wed, 21 Mar 2018 19:14:27 -0000
Content-Type: text/plain

* Move the hwclock.sh initscript from busybox into its own package and
  recipe (hwclock-init). This script is generally useful for distros
  that get their hwclock implementation from sources other than
  busybox (like util-linux).

:busybox/*
* Remove the busybox-hwclock package, as it no longer has a purpose.
* If busybox is configured to include hwclock, the busybox package will
  RDEPEND on hwclock-init.

:util-linux/*
* util-linux-hwclock RDEPENDS on hwclock-init for its initscript.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-core/busybox/busybox.inc              | 16 +++--
 meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
 meta/recipes-core/busybox/files/hwclock.sh         | 83 ----------------------
 meta/recipes-core/hwclock-init/files/hwclock.sh    | 83 ++++++++++++++++++++++
 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb | 31 ++++++++
 meta/recipes-core/util-linux/util-linux.inc        |  1 +
 6 files changed, 124 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
 create mode 100644 meta/recipes-core/hwclock-init/files/hwclock.sh
 create mode 100644 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index d1675c37aa..50cc837335 100644
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
@@ -284,9 +282,6 @@ do_install () {
 	if grep "CONFIG_UDHCPD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
-		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
-	fi
 	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
@@ -375,6 +370,13 @@ python do_package_prepend () {
     else:
         set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base_bindir}/busybox.nosuid")
         set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
+
+    # If busybox is configured to provide a hwclock implementation, add a
+    # package dependency on hwclock-init for the /etc/init.d/hwclock.sh
+    # initscript.
+    with open(d.getVar('B') + '/.config', 'r') as fp_conf:
+        if 'CONFIG_HWCLOCK=y' in fp_conf.read():
+            d.appendVar('RDEPENDS_busybox', ' hwclock-init ')
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 36a6342aaf..78d8e14a6b 100644
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
diff --git a/meta/recipes-core/hwclock-init/files/hwclock.sh b/meta/recipes-core/hwclock-init/files/hwclock.sh
new file mode 100644
index 0000000000..be5f94d86c
--- /dev/null
+++ b/meta/recipes-core/hwclock-init/files/hwclock.sh
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
diff --git a/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb b/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
new file mode 100644
index 0000000000..74200450ac
--- /dev/null
+++ b/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Initscript for hwclock utility"
+DESCRIPTION = "\
+Installs an initscript that updates the system clock based on the available \
+hwclock implementation."
+
+SECTION = "base"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://hwclock.sh"
+
+S = "${WORKDIR}"
+
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES = "${PN}"
+
+INITSCRIPT_NAME_${PN} = "hwclock.sh"
+INITSCRIPT_PARAMS_${PN} = "defaults"
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
+}
+
+PACKAGES = "${PN}"
+
+PACKAGE_ARCH = "all"
+
+FILES_${PN} = "${sysconfdir}/init.d/hwclock.sh"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5e40b2019a..6df5723d5e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -302,6 +302,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
+RDEPENDS_${PN}-hwclock += "hwclock-init"
 RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
 
 do_compile_ptest() {
-- 
2.11.0


