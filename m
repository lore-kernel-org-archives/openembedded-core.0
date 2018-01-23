Return-Path: <prvs=056101b04e=alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD9B6010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:22:09 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0NGKgl5016216; Tue, 23 Jan 2018 10:22:10 -0600
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0080.outbound.protection.outlook.com [207.46.163.80])
	by mx0b-00010702.pphosted.com with ESMTP id 2fm4f86crw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2018 10:22:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=a7DDe81yrtot0ytXGgqA53lDE5aX1xjPUyL35d2RVzg=;
	b=Gyj5mayWo7UnHjX7Osh22MwYct9zq3FZxRi4CFp4fZkOtoN7EFNtW2jLK+W5Y3JIy/tqPm2btO1H4hIfYlgakILfZxPYzqi1xIBOWWD1lMWHars3HPM3s5+E/YDecO8smpcqe1ikByLzHyJ6EhaVqGSarj1ZBMIgXqAXgKd8B6k=
Received: from rtosams.amer.corp.natinst.com (130.164.62.180) by
	BY2PR0401MB0968.namprd04.prod.outlook.com (10.160.64.151) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Tue, 23 Jan 2018 16:22:07 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 10:21:36 -0600
Message-Id: <20180123162136.11518-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [130.164.62.180]
X-ClientProxiedBy: MWHPR2201CA0061.namprd22.prod.outlook.com (10.174.103.14)
	To BY2PR0401MB0968.namprd04.prod.outlook.com (10.160.64.151)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9eee285-e4ed-456e-8915-08d5627d7288
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR0401MB0968; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0968;
	3:OOSq/YkRw7sjqSLkz2l3jpIfLYxfit7lteHxiE5gP+s+LTtij6t4df5t7El7/xAlZOeTPv0ITeVNlb4L9wOdgPnlD7R1CoJTsW7HAAGQOTpZjFSbVhX+/KWqvcQejUUuLYuiRDzvKYbgHzJHICqJph1QyirpYu1oRqvI9iTZhO5zTTghUF0yv8/PPs9sMV195/3ZeTP1cfU14D4+BGJme4P4h/2Sf61pT8k6AXFuFo0xWOGXPyr5dHYDl6uy0g6v;
	25:Z0UmFzcGL7lpesM8QZ11ZFdjjoMRjLXLs7lXyJ61QQz4+9MThEz6ibmfRp6ovEgULS//q64OwAEjUOMwmsAVOGw1DayHmwzPQkiLnjeZTq8CnK9GFDMfhROAsfZNuH2k1Ah2zuQJkS5PFV0WObONN4twHo9smzWfs9eXAfvXVZ27HNZeT1y33WFFJTPpVAot+yEk0AiO5oGkEyi1CFkT0exFMKAAyRo3SjrAqh0XYifJQTi4U3RS5oEJVPckTAk6QKsfRsoKO5mKmul8EF3gSG+mmiaUYtxX4qCn//kWEn6zxv1QoSeZaESp+DlQC31WedngkLk05udRvtuZ7+i6Jw==;
	31:HYgqn39w7VWlRj5+psQoZ0JsDJMhrFJ+7ttxyGxD84WjhvXfl0S4QJfoSqHcecAVXGCzXN7WFlF2/7/4XudVDcLTsIxhagNRrvouRUDBxxOijLd8J88OltYS6vYjt2paJNQ+JmS7PLGv+brQVSWma+KlOCdaiofRNb5iUtC1phk3nCxTQoI4cH/nLmaibjZZQDIO8ZFHNlvQhKHKPFnv4YpvrVZfKnlzXLCtdfgegnQ=
X-MS-TrafficTypeDiagnostic: BY2PR0401MB0968:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0968;
	20:C8ETQN5ke+snURS2c+SNtBwYUI4zcAAYguMBjYZcmTPN4ewdEI97IHmMXTKtB1f5l5jhh4Y0owHktw+8+p54FS06vhXl1KC53eXn5si7LOVSPhziV9dkSVno4ZITGNRcs2gRCVKzCTJ8arrtKfG5peefS5YDr9NfocDab12RWwIHsRcgT9aOC7OVcJEWqaOdiHPCAq3deZtFzYxaxoRoPye44GU+UFESDrOFzBocvKg6DORbGfbd54ftIqQJHP5nR2WR6gkH3Y448FatJQ9+ro/roLw7rLVNxjBEkhhSVTqESAaNymoFJGeMDr2w5Q1q0HkXYA8w7IyV2GBFKc5oHe1XlItIT8GfCOb3V0MMCZtcNA8xb5F+agSUQr9Br1dVJC2SpWy3Luf3/N2x5ChsuwQaolf+viGJS1pGG9IbTgmdBiz8aczQp9tK2ljNdrR9xdAV7rsE0D3xpjHEH9pqOgJBQWpDBYmJykNjRxDN8yyclXMRKJvf3hEeu/9KjDo0F592F6vDMysAdqUSEgewYK71y7ZVFGCDVdHbw4l/U6M0a2e83bM82t4iJJ/tGLpxiYBw4ODwRH3SFcvLz+4JXtMO2V4yVEC/etB/kVk/EM8=;
	4:FKK/ZeQ/jSf57HDGE/d6uW3D3Mf+XqrJUL2UqqaVO6p1R3R+W96F+YV8WUdTu1CyxxZLwgHygDlmPjOM759FlhJjoOgcy5JE4Cc9ZvjSEVp2oMv3OkQDnvu+C22nFTP7RKU8ANGJwTSZyMBrmD0L544ZhHUruhUyhAt4w9Rc0WSUfR9dzzCKDwltEe2+TgPaKmX8w5LxogDI6LtedjWagy9QU24kovH7asqtDqCAzU+kvdlOCTEl8TbCE3y/WI3hE4l8fXoyFWhCJ5zJRSMY1SBdGbQvDgqE1ktmcnMEQ3VAfDb5FbCAKMWOqmx8Gzaw
X-Microsoft-Antispam-PRVS: <BY2PR0401MB0968220A80EDC892D8D51108FEE30@BY2PR0401MB0968.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231023)(2400081)(944501161)(6041288)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR0401MB0968; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR0401MB0968; 
X-Forefront-PRVS: 05610E64EE
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(346002)(376002)(396003)(366004)(39860400002)(199004)(189003)(50944005)(86362001)(81166006)(81156014)(48376002)(50226002)(25786009)(4326008)(5660300001)(8936002)(8676002)(50466002)(316002)(6486002)(53936002)(97736004)(16586007)(106356001)(6306002)(105586002)(575784001)(68736007)(1076002)(59450400001)(478600001)(6666003)(6916009)(6512007)(7736002)(6506007)(47776003)(26005)(305945005)(6116002)(3846002)(2906002)(2351001)(66066001)(51416003)(52116002)(2361001)(16526018)(386003)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0401MB0968;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0401MB0968;
	23:PQ7lxpsfGu2gOnKjzrSA0pMYbMni0PGyAzWVysR?=
	=?us-ascii?Q?/vrlXbmIvB6Th0czM83EKpe6YqkfQNQjmvq7u/dy67faoe0QN8sVqX7VyVp/?=
	=?us-ascii?Q?MH7Zi1QxBskppLrnQ/QTKrlOlbHvtoJocis0b5mgri36RV89ZmuCWpBm9M7y?=
	=?us-ascii?Q?ru+Oz6vG3wbD8azSJPjyhEtqi6f2PnAcxfWByh/+CoNEedAZj7a8IhzF8LHM?=
	=?us-ascii?Q?TumdrQwJdw1bAenMQaR4IfnbfV50N0jGW2O5pETZiOw1NiGAIfHd5NOH4yen?=
	=?us-ascii?Q?vCYdInYxXIsHpiJe/pMzX2v2pH/2ZT7P87j8RyLI9Vi0/CMciaUAPk3sCAeb?=
	=?us-ascii?Q?JqnZaKIOZn1KKkILhFbM4aXIIzeHSpjBiTH+1AzlOD1j/mQ3nOaWgrzxhNge?=
	=?us-ascii?Q?jm/TtDIowvqOF96C3hVxsZh2dOhosZR7UUYeuMc4KjzhnH5bSR35bVUML9lD?=
	=?us-ascii?Q?+S/cnokdgYG/h025opY+KS/rKo1akYMt+MZCHID7wrvXD6aGFpUhV2Mj2M1x?=
	=?us-ascii?Q?j29BnQ/5/iMCI1vMAOwwpMlxp0omZzWWGsBcc9g9k8OiLpieLweXg4zWe+Nk?=
	=?us-ascii?Q?TmK4p738Fq8uNYDWcLPiCiTm71uvQznrzsJecB/hyegxLdL1HIn/BZOls+EV?=
	=?us-ascii?Q?LvRL6ZD8jl3cTA5trSa1i7NU7r47fyltP+QYZkBpqLibSyIE+TjcnTKCqUVb?=
	=?us-ascii?Q?KidNx9rdUbvtrhd/TLyhpdSSl3S91/byQwZqoAhuI62bfTLzjxMf6kErHgjl?=
	=?us-ascii?Q?sEoNGbPuETi3FDwcqX6DqkDyGP3S2tWAwqdyH3qCZtETW8tWU0vRUFZV7tta?=
	=?us-ascii?Q?y7rhdcMdJ5tUeGevE62gLFpxClcAZ3GbehKos+a4QjIEmYhLmU4BsPvHcfVF?=
	=?us-ascii?Q?r0pf25kXSCMz3hT0Skv9pi9sNZaLvaI+qYQcoacYJ0dzF7Tnn7BAVD27D5yc?=
	=?us-ascii?Q?kCzltpQ0G8Iu+aU240PigJClbnV8JOmrs/AT27SWlTChE6Z3xGPxAkaqTSm5?=
	=?us-ascii?Q?I391qQee+QjF1hSz9rMA0ohM+j4apzyQiZAuUN6oc38+6I++z/XuqogNQFcR?=
	=?us-ascii?Q?EebNsoFI2HP2Skn74MBB+74R7DX+eZhC/s/URxBjFXlfiBQ1prcuw5gRoK8p?=
	=?us-ascii?Q?mKGfIqOk0MkokUrEiE873qV/Z/r0/itKBhPzsQ9T9eVhT6t3XxIC5TvOkQg0?=
	=?us-ascii?Q?ECZfUG4fjZXVto2Q=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0968;
	6:e/1C1c61sl23d5npqLjMNaWydo0Ze0nM/Am6vEkwTaAVwf6eQYlkvFBSahY8pR58X0sMi4lcriJQpKEr/xtXdjzKFUjVZ5COO+dblHsP/2z//jefk3JQ1Otct0NaUqlj6u84PmvXo48x9raFLr+lAQ+EvqJiLVJ+7KX+60Vd/7u6ntmRpw+WQPmme8jy5VtHzhSD916fRy/NSljJMW3bXmXd92VeffZj80x4T7FNtLBrvNYras5QAi4nDpAQoPX/ib35HkHXmDJouuXEVXIBQEFiBmSpPiMxXG3GWRp0ZBs58/bZwylHgsMoDWk7VboakHfFOMpdNlRHEg9KY2UaEEY553wqt7atjGFevv5Wd6Y=;
	5:+KJOJRM5x+5rtXA5uhcIM6fDIhiPXw1Y4UDww+cVXG9b5DCYUtdfJIAV199K8ADxUJeqb63rBPA4wZdqIdizss67bsipCdL0MWsJl8Q6lJWNSta70DwUTux+KHbfewQ0RcfO2skpaaqTzGjzTGD5AtP/91gs/rltNoypZW/WrCs=;
	24:WTqB7DTlBnNaQXQ99CTJyQNYFjzuqPRBmO9LH1wtcsPhC0FDJqkAGfUpBPQPAFkAt5tnZv0hCdnDgpx/6Vi8W9N7qB0SNP2pGg68rWpg0GI=;
	7:/HH9sQG1zwN21MFMQGtdWim+vbjq83STxYLJEn2GzyYh1+iM4aYwLiEakuczrLsfr1ET4vhKxxpWOmHIHLpA/3UDj44581aOqNOGnOFUKQBq1HwzPoie/iomMMuANO55LUQw8+Vwp9niRqM5qQRuuLNDO3qhH1Ei5S8ETV0Iy3Th7mAc692yOoMTj04gAju2c8ZCc4DW6yt+CtCx2UsHc92lmiEBx+UTuGYZvXOQ6We2UWMFDxrEMaLR7zpJKa+a
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2018 16:22:07.0402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eee285-e4ed-456e-8915-08d5627d7288
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0401MB0968
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1801230225
Cc: otavio.salvador@ossystems.com.br
Subject: [PATCH] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Tue, 23 Jan 2018 16:22:10 -0000
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
index 4012f921c6..bfcc6ba31a 100644
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
+    # package dependency on hwclock-init for the /etc/init.d/hwclock.sh
+    # initscript.
+    with open(d.getVar('B', expand=True) + '/.config', 'r') as fp_conf:
+        if 'CONFIG_HWCLOCK=y' in fp_conf.read():
+            d.appendVar('RDEPENDS_busybox', ' hwclock-init ')
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
index 248e8bee95..e8c54e498e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -300,6 +300,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
+RDEPENDS_${PN}-hwclock += "hwclock-init"
 RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
 
 do_compile_ptest() {
-- 
2.11.0


