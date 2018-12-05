Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6DFE06C48C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 08:33:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB58XakI017753
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 00:33:37 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 00:33:36 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 16:40:43 +0800
Message-ID: <0204ef5a9e27731b04e7f7e31733b188d187e037.1543996242.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1543996242.git.Qi.Chen@windriver.com>
References: <cover.1543996242.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] sudo: upgrade to 1.8.26
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
X-List-Received-Date: Wed, 05 Dec 2018 08:33:36 -0000
Content-Type: text/plain

License-Update: include more files to check, but license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                           | 7 +++++--
 meta/recipes-extended/sudo/{sudo_1.8.23.bb => sudo_1.8.26.bb} | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.23.bb => sudo_1.8.26.bb} (91%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 69dccde..7565503 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=cc4bf2366b059c9598e3947f885931ec \
-                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=805782a8466975716f8376b2be9aedde \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=45f9838a00199411eb97075c1e6a3102 \
+                    file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=4a162fc04b86b03f5632180fe6076cda \
                     file://lib/util/reallocarray.c;beginline=3;endline=16;md5=85b0905b795d4d58bf2e00635649eec6 \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://lib/util/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=cc4bf2366b059c9598e3947f885931ec \
                     file://lib/util/snprintf.c;beginline=6;endline=34;md5=c82c1b3a5c32e08545c9ec5d71e41e50 \
                     file://include/sudo_queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
                     file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a \
+                    file://lib/util/arc4random.c;beginline=3;endline=20;md5=15bdc89c1b003fa4d7353e6296ebfd68 \
+                    file://lib/util/arc4random_uniform.c;beginline=3;endline=17;md5=31e630ac814d692fd0ab7a942659b46f \
+                    file://lib/util/getentropy.c;beginline=1;endline=19;md5=9f1a275ecd44cc264a2a4d5e06a75292 \
                     "
 
 inherit autotools
diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.26.bb
similarity index 91%
rename from meta/recipes-extended/sudo/sudo_1.8.23.bb
rename to meta/recipes-extended/sudo/sudo_1.8.26.bb
index ce32bd1..7823675 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.26.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
-SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
+SRC_URI[md5sum] = "833084947d98e7745b94845f4b7a8a9a"
+SRC_URI[sha256sum] = "40da219a6f0341ccb22d04a98988e27f09b831d2561b14c6154067a49ef3fee2"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


