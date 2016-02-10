Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 71FD3731E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:33:14 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 9CDEB1A7501;
	Wed, 10 Feb 2016 13:33:13 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Randy MacLeod <randy.macleod@windriver.com>, Tanu Kaskinen <tanuk@iki.fi>
Date: Wed, 10 Feb 2016 13:32:51 +0100
Message-Id: <1455107576-8931-3-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 2/7] systemd: realign packages list
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
X-List-Received-Date: Wed, 10 Feb 2016 12:33:14 -0000

Reformat list of built packages to a package per line format. Makes
easier to cope with subsequent changes.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/systemd/systemd_228.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index cd793d7cba802dbba60a77df49e9d9695c8cf7b7..9d7851e0f285f6c24458e16e0c493c8481236bf6 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -237,8 +237,18 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
-             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh ${PN}-xorg-xinitrc"
+PACKAGES =+ "\
+    ${PN}-gui \
+    ${PN}-vconsole-setup \
+    ${PN}-initramfs \
+    ${PN}-analyze \
+    ${PN}-kernel-install \
+    ${PN}-rpm-macros \
+    ${PN}-binfmt \
+    ${PN}-pam \
+    ${PN}-zsh \
+    ${PN}-xorg-xinitrc \
+"
 
 SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
-- 
2.5.0


