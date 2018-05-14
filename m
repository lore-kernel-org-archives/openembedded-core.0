Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12A27770A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 05:58:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4E5w86g011046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2018 22:58:30 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 13 May 2018 22:58:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2018 13:59:26 +0800
Message-ID: <757f2656ab116ac3d11705332f7d9c60c0fd4815.1526277424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1526277424.git.Qi.Chen@windriver.com>
References: <cover.1526277424.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] sudo: upgrade to 1.8.23
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
X-List-Received-Date: Mon, 14 May 2018 05:58:39 -0000
Content-Type: text/plain

Upgrade sudo to 1.8.23.

The license checksum changes but the actual license does not.

The /var/run/sudo directory has changed to /run/sudo, change
do_install_append according to avoid error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                           | 5 +++--
 meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} (81%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 362bd3a..6e57669 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=cc4bf2366b059c9598e3947f885931ec \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=805782a8466975716f8376b2be9aedde \
                     file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=7765a3d787cb4fed3ccc3c9cee030af9 \
                     file://lib/util/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
                     file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
                     file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
-                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
+                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a \
+                    "
 
 inherit autotools
 
diff --git a/meta/recipes-extended/sudo/sudo_1.8.22.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
similarity index 81%
rename from meta/recipes-extended/sudo/sudo_1.8.22.bb
rename to meta/recipes-extended/sudo/sudo_1.8.23.bb
index 9150178..9756fe2 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.22.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "24abdea48db4c5abcd410167c801cc8c"
-SRC_URI[sha256sum] = "7256cb27c20883b14360eddbd17f98922073d104b214cf65aeacf1d9c9b9fd02"
+SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
+SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
@@ -27,8 +27,8 @@ do_install_append () {
 	chmod 4111 ${D}${bindir}/sudo
 	chmod 0440 ${D}${sysconfdir}/sudoers
 
-	# Explicitly remove the ${localstatedir}/run directory to avoid QA error
-	rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
+	# Explicitly remove the /run directory to avoid QA error
+	rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
 }
 
 FILES_${PN} += "${libdir}/tmpfiles.d"
-- 
1.9.1


