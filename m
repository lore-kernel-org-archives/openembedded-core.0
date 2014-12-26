Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6403872731
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:35:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBQ9ZbsF000439
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 01:35:37 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Dec 2014 01:35:37 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:35:29 +0800
Message-ID: <5c186869af0c62b451562013043770ee3a17b83f.1419586441.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419586441.git.Qi.Chen@windriver.com>
References: <cover.1419586441.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] sudo: upgrade to latest state version 1.8.11p2
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
X-List-Received-Date: Fri, 26 Dec 2014 09:35:42 -0000
Content-Type: text/plain

Files containing license information have changed position.
FILES_${PN}-dev needs to be modified to contain correct files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                        | 14 +++++++-------
 .../sudo/{sudo_1.8.10p3.bb => sudo_1.8.11p2.bb}            |  6 ++++--
 2 files changed, 11 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.10p3.bb => sudo_1.8.11p2.bb} (80%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 1d7e541..6e9aec8 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -6,12 +6,12 @@ SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=69e337d679950e304953813158595256 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0 \
-                    file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
-                    file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea \
-                    file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://compat/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
+                    file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
+                    file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
+                    file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
+                    file://lib/util/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea \
+                    file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
+                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
 
 inherit autotools
 
@@ -30,7 +30,7 @@ do_configure_prepend () {
 
 # mksigname/mksiglist are used on build host to generate source files
 do_compile_prepend () {
-	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC="$BUILD_CC" CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C compat mksigname mksiglist
+	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC="$BUILD_CC" CFLAGS="$BUILD_CFLAGS" CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C lib/util mksigname mksiglist
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
diff --git a/meta/recipes-extended/sudo/sudo_1.8.10p3.bb b/meta/recipes-extended/sudo/sudo_1.8.11p2.bb
similarity index 80%
rename from meta/recipes-extended/sudo/sudo_1.8.10p3.bb
rename to meta/recipes-extended/sudo/sudo_1.8.11p2.bb
index 4c53032..c5e2545 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.11p2.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "fcd8d0d9f9f0397d076ee901e242ed39"
-SRC_URI[sha256sum] = "6eda135fa68163108f1c24de6975de5ddb09d75730bb62d6390bda7b04345400"
+SRC_URI[md5sum] = "84012b4871b6c775c957cd310d5bad87"
+SRC_URI[sha256sum] = "8133849418fa18cf6b6bb6893d1855ff7afe21db8923234a00bf045c90fba1ad"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
@@ -25,3 +25,5 @@ do_install_append () {
 	# Explicitly remove the ${localstatedir}/run directory to avoid QA error
 	rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
 }
+
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la"
-- 
1.9.1


