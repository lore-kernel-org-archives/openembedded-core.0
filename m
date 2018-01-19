Return-Path: <prvs=0557b8c70d=alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id E4CFC787DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 20:12:46 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0JKBmrr003101 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:12:47 -0600
Received: from nam01-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam01lp0111.outbound.protection.outlook.com
	[207.46.163.111])
	by mx0b-00010702.pphosted.com with ESMTP id 2fjb7qxu71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:12:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=P2EOjF1NNxwkFJr9kvEbKxHqtXmTjpTYOORndFxz58k=;
	b=VZDlSW9+5NxnjZfrQwlNZaruLJEr7hUar2uj3FZEA8l7XlJ1K6J2Wyqd6Gewc+FGeQmMDhT0fkKUXJ5utG4qWogVsBYoSPrFezuXpRm9JanD3VbvFe8+jmgCYcYb2/roeVRvNmH+mTnLpXto1Z9f4npgY15vPBDijLOeNmdVG5Y=
Received: from rtosams.amer.corp.natinst.com (130.164.62.180) by
	DM2PR0401MB0976.namprd04.prod.outlook.com (2a01:111:e400:3c0f::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7;
	Fri, 19 Jan 2018 20:12:44 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 14:12:08 -0600
Message-Id: <20180119201208.22752-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [130.164.62.180]
X-ClientProxiedBy: DM5PR19CA0019.namprd19.prod.outlook.com
	(2603:10b6:3:151::29) To DM2PR0401MB0976.namprd04.prod.outlook.com
	(2a01:111:e400:3c0f::13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c8ad2c-1587-4693-1091-08d55f79009b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DM2PR0401MB0976; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0976;
	3:PdpxWctpkVj4lySZz/c9hgzklWhMA487Ahw/qElevXmXnLDIxX/y4jSTnEKTltnr0JDKptxhM7JoiBG/u+KmeVDilZezxucPNOhHQvPAJ+JejADZryXHj7k1Dia3qKAxzv/OiBlzd5d7RwgBJ6wMKbG37Xu07sJsr9mfLegDO/jN+TIjUllCgrFUZCR7il/5m5E0hAZFLsRqkkaQXnkwNQOiupaitNeV158i02pXRQQLSropqCkQCBSSUITq8Ejk;
	25:LzMxZ99s8tULwW+/VbPyk5EZgPBQ0Et0uoUBBaZoV15HXtsr2/JdRLHhiU3Z/ANa9f7PLb/S8Gmr0FMukNeej4B0IRvCFlmC3u0ZlkFpxFgBjd96jZ9ZM0EjTNrYGR54IrW84uaeAoRzIBBTMawGajSE+q57dKwP41JxFLHp1W3R8JikssUGSZQUIvQi9ZDyzdkpbwJ+ME78WtJWuPV2ZOVR6wThQXyrbw0Y1JfIeQj78LhJ+PlJAb01rPUqN2wlje+eMAqNseLCH07VQmXhs+/XMYcZvJyrk1JNX9fGF7fZjpF29eUwqeahL8vYhQhvEmHG5nXYwqTATu9xhP3VUA==;
	31:+4+vh2sKoEqRIWwcEhvImBd+rs8v4cOJodwI+ncXdacAWVYI4kH4EHkRalj79GQIxaklmNwXT8rJid+/1vJEHMR8phucoLWnYu9KzFP5Q3Vt52RVibEGKsSS/tZRMzR3I7f2Mb6SEIanAK6FeScFDujX0cKZQGfgHeg+a6vansLC9x+wZPjywFUxV0R0aU+e4GLAB2AOSffXrnKUW4yvONwqe+MwdajkYXvep2vq2LI=
X-MS-TrafficTypeDiagnostic: DM2PR0401MB0976:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0976;
	20:8e8Q9bllMNf2RiFxdZ98tNEBEVVGgYv3+jTtzZ9s7NQse18XJkXIKfAbBHmMuBP1Jq0mpbo2obEzyeRccy3Pli1APGx7qglsZSPYN9PXEqsvivaS+dc0fyB8jkzNcDnOPPOcRW8xVWJQnR8MQ9Jy40h/gpk6qy3S2rukc4EpE6xUtacVy+x3+5CYx/G+yhq3+mt54qYpZcCVaIiUFP3a7hT092i6WREyHZ3gM35LjpgA+t6AJQ2e3Ju+pB7VDCDbc6hQCInnzBicJGMq/aaMq8CNrG1fS89T4sNZWcVEBb6mVE5LDx/yUrl1LClSyxubieJGaM78sexFVcgDmvlvvoyxtuPa+CCnFqQPwtRtftjVY2zRDAh/vNwRY2nCCwJ0q1QdF3UrLr159U8meQvlv6wf5e/D8o6iQHhwdJmDpOJVzUhYdl/+MB3e27NWyRZ5BNpmOiEzuwnIOaTgS8qzI5k7hbQzA3kBKknpHtaTOaUuGLorIXAZJRS0uTcMGWItZfIqnm3CI+lAJzg8FiyAHPQIgQTKwGpuqIcZmSPI6MXVwnoX0HwWRXBQY0cJhE+qNgofcKuJRNV0xu7aHft9pCkmOw+ZgEl0gYeAg8IHKRs=;
	4:pUAwNTltKMbbs+w8n4S78UYLPdJHRkqz1RWDkNtB3SeorIL6VUOlfDNmDfrqlgbYGtSPt7kDiR1PwLMSqF58NMJDFaWt6fOoxIAjORbvdef29fuVpnBAY31rYXO1ZMk8wtTiz3q4f61i8itm7KSDaOA6FNiA3sKipm4sPkZVMr0J18XfHXZxN0ArWFpVDezyJeAUIu6uZ/8hK2rsg4CzC8yApmD2CkPufDjxiyX8ARYoAEy09rtJEdoBdRHa53dmZJE3aJP0aGX/6qvzFMEWF//PDJQ3l4gkQlr4SrkCiI8B98wequSMY8Zd8C5RgP5g
X-Microsoft-Antispam-PRVS: <DM2PR0401MB0976D6CAD8E1333696056DFEFEEF0@DM2PR0401MB0976.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(2400081)(944501161)(3002001)(10201501046)(93006095)(93001095)(6041268)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:DM2PR0401MB0976; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR0401MB0976; 
X-Forefront-PRVS: 0557CBAD84
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(39380400002)(39860400002)(346002)(396003)(376002)(50944005)(189003)(199004)(6486002)(575784001)(86362001)(97736004)(105586002)(2906002)(6116002)(3846002)(106356001)(53936002)(2351001)(47776003)(1076002)(50466002)(25786009)(48376002)(2361001)(66066001)(52116002)(5660300001)(6506007)(386003)(6916009)(8676002)(6666003)(51416003)(36756003)(478600001)(4326008)(50226002)(16526018)(81166006)(305945005)(26005)(81156014)(59450400001)(7736002)(6306002)(8936002)(16586007)(6512007)(68736007)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0401MB0976;
	H:rtosams.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0401MB0976;
	23:6n5NBaqYgpVE2XCPUBkiFXOH2oz1yLFdowxLueC?=
	=?us-ascii?Q?SVxRBZY7LYmz6mM8FReYNUlQ1I5OTVca+fQ5R738LenUS4o1tIJzCrH2eB9w?=
	=?us-ascii?Q?E7odObOXjQZofqGQia3oMkMGM63yUlnAM+T7rYF0Isg+gtoGHgsLFNqeW+A0?=
	=?us-ascii?Q?04iYlOq0S4zZNXnNqy4yjrJi3FqqOn0g46IMrjV0J8RK/us8+AXdMQ06Opm1?=
	=?us-ascii?Q?XpFJE9V+1KmnClRT+r2vUVOxjopGj0qNIn1AAcvgNW/JRCCkZE4KNn0G8DGf?=
	=?us-ascii?Q?hu1b8RHBs4CkWulQEHQ1e8/9gkDKV2sxCul/TxMZTK9+MqVzit2rZoXYUHoq?=
	=?us-ascii?Q?JrScWOlwsvKbuA+B29fJRrgRQsZqbIibvIFjq9GV4rTZ/RdlxeFOtqSMkuDu?=
	=?us-ascii?Q?AT61Y38/9Vd6oEmVqntrs2V3hcEZvztJvpF4SJYupJPGJ5qG1NYEmHwKBYYI?=
	=?us-ascii?Q?LSFiOTAsoSazrVLH2ERTJf0kqQCOu15edjKsG9N8SAG2afq1TgeCD/CZcoaH?=
	=?us-ascii?Q?Lnv5Mh8VARteFsbiCInVZjlhPTUseMYdBegq/NwCrpWqgjVd4zJLUZagglo2?=
	=?us-ascii?Q?+KbMWVNOOT0nzuHuo8P2xQEtug/m0LQaJmNKMaxYGIGOrjgcfmDiYLWtfMee?=
	=?us-ascii?Q?DH31HaVE1reIRg1fHcEVPAKCVqQFGntRkOeAetGGZ6RDT0isOaVQj8yvQOV/?=
	=?us-ascii?Q?Y8D1DK9+XahqYazBIts3QA5eWQXxZOlk5BPPu0jTxh/kOK9k5ivWIl0jrzlG?=
	=?us-ascii?Q?teEwovy9ywwl1XL3eZ8Pm/7qhkSX5yRGX3hYlZ8NFMF3mYhAN+l8DIPW+t+6?=
	=?us-ascii?Q?V4LX0KCrj/dr5BK7Ip5hN2qGWb9YXxWH+GUa8wdhVIfVXt0sX+pKvVpfkfb4?=
	=?us-ascii?Q?7W5iY0QyNUWNF0ozYJcRhc7SsRVYbCXGtkJzPTUBUOppnrOmmVIVybFbddTa?=
	=?us-ascii?Q?cYVSx1yZkb3L2whIp75bRG7+LqSutQnOxDB5blDUc1x2ga6H/G5Ry+4RebPs?=
	=?us-ascii?Q?LapsbufV+twqZIMjgPfo2zPke3K2ijwIg4+2EyYRhGJeaZVOIyHVIbqSQTDy?=
	=?us-ascii?Q?7Zcm2nOznkFBh3nEOuauTnKJ9z8DlRgMO/gwgLw+5B7js4hbqbWWIWZk4irf?=
	=?us-ascii?Q?TbBFGusJuYiokqY9RUXI2f94tpGyQXjXdxTQEhejcQwEKmPvA5URAt6JVPH/?=
	=?us-ascii?Q?ksLoQE5hI7wt67Ng=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0401MB0976;
	6:Q52DhqlrvrCVvIMEa3CGTTbagzy6e1m7qC7eiSxb7EVz6Jx1gtYu6OeIyWlbypqBqwKSeNGQ+5uRMc0j3D0sDsslZEnBaU+E/3/j+N+cefa7182i/meKfhxG0FMkPK2MFVhJTiXt6JriijB2fLqnCGsOuGYsDLAp3xg0c63ZuHCMfEhd0hoPoR+W64Jraeoj4OPfMphzIV+kcytjyAlM1CGd3LPyjuJfTAAU5bS5ooqLrXRU2Tfdkmmhzinxvj1VgRbjghBgCL5xZNRWXpjx4qE6C+mva9UXmmZYkyFdomRjtdL1lrO5KrvfcpD2IgD3H7hEcdZaFoqpJ0iL0y0L6iNaruiEToE0oWYyjdCLAj8=;
	5:wlqGJTMkoyaD2G5osipTs1owNpk7HyKmKPtyQfdje0iFgSRWcgHBUirLixWKItPn0jTLzgCcL2SDpvpdWQ5PQEfxF8Oev5/GELfbsCwdenY2hF8ZDVEXw8Yy5Oip6SYuKpdvdkZSX+saQq9+fif9OSt+/aOU+KHQyP281TcLNVc=;
	24:7iWCqQHA/l9RQUdmIKwTP3QePBxapMFpO5WZWzv2T7NkP6QoElEkyc8ifCWCQM7zGFkMYC9YvMi18VhG2y9OoMJeRgHUuZdrsJZ1kt3k91I=;
	7:Z8uFtRJbQT50sMP4PhV2o5hAOZALoLuxsgfVp2Po5AbWHe19jgCDG2+Ns+kvfFBkr1Ey7lnpZTLBgw1yOp6T9gR76Tlf4J+/7QEVRFSNBsvcZK80+idHl8cvvVzHB5tfbnQ8OglSinGqY2YRFIzqYR07shFJ/1qzG1Va20PRjPpwXgFHGMdTpujG3a5A0KuQdYCdiYGVm8xSeFoP1UHVzlqaPYTq3nLqnjtejb9ct1c0JACcKvQTBablPKN2ntKi
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2018 20:12:44.7699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c8ad2c-1587-4693-1091-08d55f79009b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0401MB0976
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-19_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1801190262
Subject: [PATCH v3] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Fri, 19 Jan 2018 20:12:47 -0000
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
* Add util-linux-hwclock-init as its own recipe so that distros which
  exclusively use busybox do not have to build the entire util-linux
  recipe to get the hwclock.sh initscript.
* Provide the hwclock.sh script in util-linux-hwclock-init, which can be
  pulled by any packages that depend on its functionality.
* util-linux-hwclock RDEPENDS on util-linux-hwclock-init for its
  initscript.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-core/busybox/busybox.inc              | 16 +++--
 meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
 meta/recipes-core/busybox/files/hwclock.sh         | 83 ----------------------
 .../util-linux/util-linux-hwclock-init_1.0.bb      | 33 +++++++++
 meta/recipes-core/util-linux/util-linux.inc        |  1 +
 meta/recipes-core/util-linux/util-linux/hwclock.sh | 83 ++++++++++++++++++++++
 6 files changed, 126 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
 create mode 100644 meta/recipes-core/util-linux/util-linux-hwclock-init_1.0.bb
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
diff --git a/meta/recipes-core/util-linux/util-linux-hwclock-init_1.0.bb b/meta/recipes-core/util-linux/util-linux-hwclock-init_1.0.bb
new file mode 100644
index 0000000000..f53d95db26
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-hwclock-init_1.0.bb
@@ -0,0 +1,33 @@
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
+FILESEXTRAPATHS_prepend = "${THISDIR}/util-linux:"
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
index 248e8bee95..9fc83e701c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -300,6 +300,7 @@ python populate_packages_prepend() {
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
-- 
2.11.0


