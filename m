Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1C826FF60
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C8PMhT000546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:22 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:11 -0700
Message-ID: <ef23fc2019328585bb1163d173442cf72cf1a550.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] libcap: 2.24 -> 2.25
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:22 -0000
Content-Type: text/plain

And fixed do_install:
SBINDIR="${D}${sbindir}" -> SBINDIR="${sbindir}"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/libcap/{libcap_2.24.bb => libcap_2.25.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.24.bb => libcap_2.25.bb} (92%)

diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.25.bb
similarity index 92%
rename from meta/recipes-support/libcap/libcap_2.24.bb
rename to meta/recipes-support/libcap/libcap_2.25.bb
index a701019..865ebb8 100644
--- a/meta/recipes-support/libcap/libcap_2.24.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -9,8 +9,8 @@ DEPENDS = "hostperl-runtime-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d43ab9f680435a7fff35b4ace8d45b80"
-SRC_URI[sha256sum] = "cee4568f78dc851d726fc93f25f4ed91cc223b1fe8259daa4a77158d174e6c65"
+SRC_URI[md5sum] = "6666b839e5d46c2ad33fc8aa2ceb5f77"
+SRC_URI[sha256sum] = "693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162"
 
 inherit lib_package
 
@@ -54,7 +54,7 @@ do_install() {
 		${EXTRA_OECONF} \
 		DESTDIR="${D}" \
 		prefix="${prefix}" \
-		SBINDIR="${D}${sbindir}"
+		SBINDIR="${sbindir}"
 }
 
 do_install_append() {
-- 
2.8.0


