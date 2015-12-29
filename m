Return-Path: <joseph.lutz@novatechweb.com>
X-Greylist: delayed 5519 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Dec 2015 00:27:06 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0115.outbound.protection.outlook.com [207.46.100.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9401860762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 00:27:06 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=joseph.lutz@novatechweb.com; 
Received: from nova.novatech-llc.com (64.126.95.172) by
	BY2PR07MB566.namprd07.prod.outlook.com (10.141.221.18) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Tue, 29 Dec 2015 22:55:05 +0000
From: "Joseph A. Lutz" <joseph.lutz@novatechweb.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Dec 2015 16:54:27 -0600
Message-ID: <1451429667-23029-1-git-send-email-joseph.lutz@novatechweb.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [64.126.95.172]
X-ClientProxiedBy: BY2PR07CA067.namprd07.prod.outlook.com (10.141.251.42) To
	BY2PR07MB566.namprd07.prod.outlook.com (10.141.221.18)
X-Microsoft-Exchange-Diagnostics: 1; BY2PR07MB566;
	2:L3//OZow+qDqtM0ESsT5bHUSsAaB4mOMTt5ZjyuwcnZnHPa+iGdoAYDYtmErlvsRZvEZ9zA61H4SyCjxeRRfOfl0q+n/BoVISfS3jhy0x4BHHNDZEeBuHw6llTlVc+5s44hgXiAqVveouKehwDb6ww==;
	3:Zj/ZFdju1evnEBMKbcNG+Cp8zTznuZXoT526N2LrlIwpGaE3SVhj0MshdwITee39GJ/KVhlpMj0/O+PYHeXzB92OmXy/UGjv1rOHZogmyZ9qELNJn3ga3XV8+YZqhImS;
	25:MH+3bzRiNgcb7xWUlZdhW8SZC/Ua45TLe0k/lekI7sACLlL0Ee08108icwWa4jY8jgd/OQClFcK4jAO66k7cVyOwnOs+FrFanv9mqHE9UWXwk3d4GtuJn5QCb3jVtIiOijWuoiKp8avVeeS8gNfEN8e6dNIG3bQcWvwzgk8XLaHdgyUHah41lXRTRUHKPPCM03m1DfwpqDhTN0Qpt+I3VVS8FA1WZsKhevvHwOip3ru3GdsHuZarkbLw9zToQQ6R/fLzryup3X9RwXAW84S7mg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR07MB566;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR07MB566;
	20:TtMvlX+7vEIuPYrjeDZWCnJ9F0EklMhdmvr/bi7sM7rplzACISOyBNly2hyaiLcFaoXEVBAPh+HqdyfEV+DGLC2pE1d1RyiZON7iHUzTbUFVoxyfQiDBXU+O3cCA28fps4dnQzG8csJ+mREwdM1DA/CeJgJV+J3TI5NsdUxzHQUR9gN4uDOjfj0WDoPjQCd0DyEIc7Qp9yS99Wwjsu/0NfF6RAR99yWDz6vNdXdvPRQQIIX5K4nW8Ctft+4sd1rxee0gr/Wfq3DC+Rj57IiUsnxrXDNL4Ziq9BVvgHhgwdpKnkCuUH6IqafdiwJVp9NVOxwtMLiYEP1hSnGmzSwhrehNcSEqFRFgtsBE8NReo4gAp6w1VKFyGGBNqD89fefxdgpGSqFNUQYRYEGLGpV5q6cGi+pGaMnKi7X1KsxLB1BmwNsEPF6MTMg1c9l+xTnDAnGEIi10yStpkHQncJWQmm7w3F9XNmIGXYDdjA01bAXHMAM4jlPsaL6zakAzPdI/hZWURE2fV78T8vA6JUxmIZ6q0vaT6e4LRTVIxtUp/+Pfg4L+5U0ApMAO+/GIfMH1/sjkl8FTBat3q72zrJYvvX5Di2a6h0DY5sLSAM6/GI0=
X-Microsoft-Antispam-PRVS: <BY2PR07MB566769A6A7634D0E5FC8265FBFC0@BY2PR07MB566.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(242766173392958);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:BY2PR07MB566; BCL:0; PCL:0; RULEID:; SRVR:BY2PR07MB566; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR07MB566;
	4:GFqjgS48tEjfJT9z1QZsKD4p5TBqA7CfZureTRAiaP6knVCY/hmcEdqhaQWk2KY5ZNHso9oWGO48ABFPYstKfAqGzWinJZdT3Ugo627zzC+vPhTM0dsBu5wO/wLbrXWh3/dIgl3dlGFOGex3dVPy9/cHS1TE4YiaIJePmaqI0aFmeZKj75qsxwkWYmAIftkSokpYVy3klDPDJREgwHSjyX/3+114wSuKQyO+MiNA20a5y7OQx2vjH36St1Kkd2E2o/SBFcOZ/JahiWnib3KftW/IMHpN2nTXUX0TLqTXtQ/HsuHHuPWR80raW7d792TZ7rVCj7oIk+8+RRDGAL9eZQtsJv2w4Jey7H5qMm75ewEdQaskt1D23UOj3sPPppb1lrp30ue6jLzBNhvSeYJ63l/F3xXp/GlebolB3ZkgNMxNqogwEQY0MkG1PVldgh/u
X-Forefront-PRVS: 0805EC9467
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(53416004)(106356001)(87976001)(105586002)(5008740100001)(40100003)(19580405001)(36756003)(450100001)(97736004)(19580395003)(189998001)(69596002)(81156007)(4001430100002)(2351001)(66066001)(33646002)(50986999)(229853001)(47776003)(101416001)(3846002)(110136002)(5004730100002)(50226001)(107886002)(5001960100002)(77096005)(92566002)(586003)(50466002)(6116002)(42186005)(5003940100001)(48376002)(1096002)(122386002)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR07MB566;
	H:nova.novatech-llc.com; FPR:; SPF:None; PTR:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: novatechweb.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR07MB566;
	23:2Hwthys12ygFzAUsly+qx25RT8FukyE5WriEJkb+0l?=
	=?us-ascii?Q?KqoJQaf64wZMk1F3m2G+ZZmEH0n0FMUZSc6nWLrfeFtRIfDT3EAMpL85i9tE?=
	=?us-ascii?Q?BRstKnqmSyGrF6i4AmYqBVrUFmNtRV76kwPI8WgiSByLacwxyb5uZ9AYtPyJ?=
	=?us-ascii?Q?uJ47Yt4BZ4eEDtJnmKLivr6aDMFlHCHS8D+8tZlLNB8i8DGfSMfdKDhvqfBo?=
	=?us-ascii?Q?Pd2/xu3TChFVcNgeG8cr+n+pRk5JkD/GaIOuxCPDJIs7OAFzoUAatbg2VuSR?=
	=?us-ascii?Q?fBX5g4f+DKoA1DDICe+hHf9cnNtoyheScXVmvlqcJqs9rjs7eEmLqLnTEFtk?=
	=?us-ascii?Q?gdM09+VNn7k9a45fVC6OxlEYodVSYkMYuR4HIBpuUdVXYX6PTBAt0hylAs/J?=
	=?us-ascii?Q?i0kxG+KxBqkNBCYZSSBQW/MJ/mwbRsGCQU/fUthUfMU3MSnOVtryl6/Kh3Hv?=
	=?us-ascii?Q?YvTaiutkIKHqILIL2G1alTtT6Hu4v0WJyThWWOpcb48EZmVH37FuVfhvJgyQ?=
	=?us-ascii?Q?IK/cAWuq04Ull7ArxWVji3Y3J5ndd1aMX97lIIDNdV4qmoVmRpP4tKz9zORf?=
	=?us-ascii?Q?VHqAM14BJ98ZnsqSdGsgMMi5HluZk4+HVr1trKimlfkdRU7oG9GFvjmWqKsb?=
	=?us-ascii?Q?3pAdbsNa9NhoMC0ZmuWmEwCCJ4gTOmfgMRZmc5zrhSI+NeFWrdWcm+QaI+bp?=
	=?us-ascii?Q?S3BITXEeeSPbdjmNDVEq414f3QUA+4LqrZKjynQ3wnW15rmJRTjStKK6A1x+?=
	=?us-ascii?Q?bv3cKLq88yvIkKgDSGquxVgpnU2hU0IVCV6PIruvI/d+Lk6AJOw0ZDShn6SS?=
	=?us-ascii?Q?GlMMXjoZIcZ2/QtOgo+RO7yBRh4q+AqBsSerqyA68eqEtWvnpW0KGOD7XP56?=
	=?us-ascii?Q?CW49PIeSIGVrN86Ga9Yw4TumAzjtywokX9iaF/0wWXm/gx8ls91PUjOzAGv+?=
	=?us-ascii?Q?Gw+O5E+K13RfmSGjM6X/zsg5jxVfzN6rsWCcbHr9iieP0ENaudTBH5lr9jrJ?=
	=?us-ascii?Q?VmXStpOWsBoYhV0xI69okIh+HoekL3pI2Hd8hw73xpd1pgFazrZ4GDIvTX+B?=
	=?us-ascii?Q?sMFxk+mgtdGW6Gt0SyPHoOolnxctNU0mUvtNkTC81wHsHdt0J4UQti+8+0++?=
	=?us-ascii?Q?2lk3A6FkI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR07MB566;
	5:tE3WbuT/4L1wQ+GKDXiNydsd1+EnL03qU8JvdmLHFDxTFURlMp5CYnCFlW1Gfl0TRfhy42KmmpIjR4oCPuRN4Zo7FXXPymzOeHXBxJbhNh/xfHz0OYGqBhJgBU/UXLQMQL8SqXe51juDQsQmb5V5CA==;
	24:ZsBZRiNnZjTZkLMU8oMxj9KyFVkKETC5WEmo24hs29Dv+EFPSgbXPoklfvTqNIGc3Bo/bmdN+69tLVtSHPOQwuKbw3Ki5BxgQ/827kRVLQQ=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: novatechweb.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2015 22:55:05.7369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR07MB566
Subject: [PATCH] readline: move inputrc into readline
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
X-List-Received-Date: Wed, 30 Dec 2015 00:27:09 -0000
Content-Type: text/plain

inputrc is the global configuration file for the readline library.

Signed-off-by: Joseph A. Lutz <joseph.lutz@novatechweb.com>

# Conflicts:
#	meta/recipes-core/readline/readline.inc
---
 meta/recipes-core/base-files/base-files_3.0.14.bb                   | 4 +---
 meta/recipes-core/{base-files/base-files => readline/files}/inputrc | 0
 meta/recipes-core/readline/readline.inc                             | 6 ++++++
 3 files changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-core/{base-files/base-files => readline/files}/inputrc (100%)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index b71d5c5..d391707 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "file://rotation \
            file://nsswitch.conf \
            file://motd \
-           file://inputrc \
            file://host.conf \
            file://profile \
            file://shells \
@@ -55,7 +54,7 @@ dirs2775-lsb = "/var/mail"
 
 volatiles = "log tmp"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
-             ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/issue.net \
+             ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
              ${sysconfdir}/default"
 
@@ -124,7 +123,6 @@ do_install () {
 	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
 	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
 	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
-	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
 	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
diff --git a/meta/recipes-core/base-files/base-files/inputrc b/meta/recipes-core/readline/files/inputrc
similarity index 100%
rename from meta/recipes-core/base-files/base-files/inputrc
rename to meta/recipes-core/readline/files/inputrc
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 30892e1..35df8b4 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS += "ncurses"
 
 SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive"
+SRC_URI += "file://inputrc"
 
 inherit autotools texinfo
 
@@ -31,6 +32,11 @@ do_install_append () {
 	oe_libinstall -so -C shlib libreadline ${D}${libdir}
 
 	rmdir ${D}${bindir}
+
+	install -m 0755 -d ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CONFFILES_${PN} += "${sysconfdir}/inputrc"
-- 
2.6.2


