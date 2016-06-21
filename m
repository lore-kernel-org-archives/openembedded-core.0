Return-Path: <Alex.Gonzalez@digi.com>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Jun 2016 15:40:35 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.199])
	by mail.openembedded.org (Postfix) with ESMTP id BF8E76FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:40:35 +0000 (UTC)
Received: from [216.82.241.132] by server-7.bemta-8.messagelabs.com id
	24/78-25642-65E59675; Tue, 21 Jun 2016 15:33:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsXi5LtOQDcsLjP
	coLmR2+LOz3fsDowe5zauYAxgjGLNzEvKr0hgzWg48JCx4I16xYKVn5gbGLdKdzFycQgJrGKU
	2DfpFDOEs4VRoqlhPZDDycEmoCMxZf9hli5GDg4RAT2Jq/9EQcLCAmkSzy7vYAKxWQRUJV69P
	s4OYvMKuEm8urGCDcSWEJCTuDz9AZjNKeAusfj9drAaIaCaieuesUDUC0qcnPkEzGYWkJA4+O
	IFM0SNssSWFRcYIeYoSKw9cJ4JwjaRuHh1N9R8Q4nvs76xQNjSEnv7FjJPYBSchWTsLCRjFzA
	yrWJUL04tKkst0jXSSyrKTM8oyU3MzNE1NLDQy00tLk5MT81JTCrWS87P3cQIDE4GINjB+POP
	0yFGSQ4mJVFeZuWMcCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvJmxmeFCgkWp6akVaZk5wDiBS
	Utw8CiJ8CaBpHmLCxJzizPTIVKnGHU55k3adYxJiCUvPy9VSpx3FkiRAEhRRmke3AhYzF5ilJ
	US5mUEOkqIpyC1KDezBFX+FaM4B6OSMG8ayBSezLwSuE2vgI5gAjpiWX86yBEliQgpqQbGDcn
	dh9kD9A4bKTNcMS3q+nFCSLLPp83DqSleboeMRsul9YuWRvxtKK55vbHcPms/b7H6LRabStW2
	PQl5h5Ri+6Ukb78/VfbOMO3wz0kWIdZPX945u7ziPav9nv3P2l10ixlfCkx/vT/KZbaLWs1i7
	3r1kO+m53vz7X6nfv7FO//RTsecD6JKLMUZiYZazEXFiQApa26I1AIAAA==
X-Env-Sender: Alex.Gonzalez@digi.com
X-Msg-Ref: server-5.tower-45.messagelabs.com!1466523218!30052112!3
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 8.46; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15343 invoked from network); 21 Jun 2016 15:33:41 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-5.tower-45.messagelabs.com with SMTP;
	21 Jun 2016 15:33:41 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Tue, 21 Jun 2016 10:33:39 -0500
Received: from log-linux-hp-agonzal.digi.com (10.101.2.214) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.279.2; Tue, 21 Jun 2016 17:33:37 +0200
From: Alex Gonzalez <alex.gonzalez@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2016 17:32:39 +0200
Message-ID: <1466523159-12619-2-git-send-email-alex.gonzalez@digi.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466523159-12619-1-git-send-email-alex.gonzalez@digi.com>
References: <1466523159-12619-1-git-send-email-alex.gonzalez@digi.com>
MIME-Version: 1.0
X-Originating-IP: [10.101.2.214]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [RFC PATCH] u-boot.inc: Do not override defconfig targets on multiple u-boot builds.
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
X-List-Received-Date: Tue, 21 Jun 2016 15:40:36 -0000
Content-Type: text/plain

When building multiple u-boots they get compiled externally into a
directory named after machine defconfigs.

Once there is a directory with the same name as a defconfig it is not
possible to run the defconfig make target.

Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 1071d1f270bc..9f1ccadf3885 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -88,9 +88,9 @@ do_compile () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    oe_runmake O=${config} ${config}
-                    oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
-                    cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
+                    oe_runmake O=build_${config} ${config}
+                    oe_runmake O=build_${config} ${UBOOT_MAKE_TARGET}
+                    cp  ${S}/build_${config}/${UBOOT_BINARY}  ${S}/build_${config}/u-boot-${type}.${UBOOT_SUFFIX}
                 fi
             done
             unset  j
@@ -113,7 +113,7 @@ do_install () {
                 if [ $j -eq $i ]
                 then
                     install -d ${D}/boot
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${S}/build_${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                 fi
@@ -137,7 +137,7 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${S}/build_${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
                     fi
@@ -166,7 +166,7 @@ do_install () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                         install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${S}/build_${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}-${PV}-${PR}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
                     fi
@@ -199,7 +199,7 @@ do_deploy () {
                 if [ $j -eq $i ]
                 then
                     install -d ${DEPLOYDIR}
-                    install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install ${S}/build_${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
@@ -229,7 +229,7 @@ do_deploy () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install ${S}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        install ${S}/build_${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
                         ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
@@ -257,7 +257,7 @@ do_deploy () {
                      j=$(expr $j + 1);
                      if [ $j -eq $i ]
                      then
-                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
+                         install ${S}/build_${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
                          rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}
                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_BINARYNAME}

