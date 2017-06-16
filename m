Return-Path: <lgonza@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id EFC45784BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:36:42 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5GGYRtd033060 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:36:43 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2b4g5efgd5-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:36:43 -0400
Received: from localhost
	by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from <lgonza@us.ibm.com>;
	Fri, 16 Jun 2017 12:36:42 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
	by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 16 Jun 2017 12:36:40 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
	[9.57.199.111])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v5GGadZb2556308; Fri, 16 Jun 2017 16:36:39 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79E19AC048;
	Fri, 16 Jun 2017 12:36:38 -0400 (EDT)
Received: from gfw162.aus.stglabs.ibm.com (unknown [9.3.62.92])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 5F29AAC040;
	Fri, 16 Jun 2017 12:36:38 -0400 (EDT)
Received: by gfw162.aus.stglabs.ibm.com (Postfix, from userid 569833)
	id 6940BF51; Fri, 16 Jun 2017 11:36:39 -0500 (CDT)
From: Leonel Gonzalez <lgonzalez@us.ibm.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 11:36:37 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17061616-0024-0000-0000-000002956461
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007243; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000214; SDB=6.00875684; UDB=6.00436019;
	IPR=6.00655773; 
	BA=6.00005425; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015853;
	XFM=3.00000015; UTC=2017-06-16 16:36:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061616-0025-0000-0000-0000446944B1
Message-Id: <1497630997-13100-1-git-send-email-lgonzalez@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
	definitions=main-1706160275
Cc: Leonel Gonzalez <lgonzalez@us.ibm.com>
Subject: [PATCH v2] rngd: Add service file and systemd package config to rngd
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
X-List-Received-Date: Fri, 16 Jun 2017 16:36:46 -0000

Signed-off-by: Leonel Gonzalez <lgonzalez@us.ibm.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service |  8 ++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb         | 17 +++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd.service

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
new file mode 100644
index 0000000..7b0e9a7
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Hardware RNG Entropy Gatherer Daemon
+
+[Service]
+ExecStart=@SBINDIR@/rngd -f
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index e2acaba..c6d08e6 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -9,7 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
            file://uclibc-libuargp-configure.patch \
            file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
            file://init \
-           file://default"
+           file://default \
+           file://rngd.service"
 
 SRC_URI[md5sum] = "6726cdc6fae1f5122463f24ae980dd68"
 SRC_URI[sha256sum] = "60a102b6603bbcce2da341470cad42eeaa9564a16b4490e7867026ca11a3078e"
@@ -21,7 +22,7 @@ python () {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 PACKAGECONFIG = "libgcrypt"
 PACKAGECONFIG_libc-musl = "libargp"
@@ -29,6 +30,7 @@ PACKAGECONFIG_libc-uclibc = "libuargp"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
 PACKAGECONFIG[libuargp] = "--enable-uclibc,,,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd,systemd"
 
 do_install_append() {
     # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
@@ -41,7 +43,18 @@ do_install_append() {
         install -d "${D}${sysconfdir}/default"
         install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
     fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
+    fi
 }
 
 INITSCRIPT_NAME = "rng-tools"
 INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 30 0 6 1 ."
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "rngd.service"
-- 
1.8.3.1


