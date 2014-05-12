Return-Path: <petter@technux.se>
Received: from vsp-authed-03-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id AB98B65EF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:28:37 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-03-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:28:44 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-245-133.mobileonline.telia.com [90.236.245.133])
	(Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 619F53A228;
	Mon, 12 May 2014 15:55:46 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 15:55:33 +0200
Message-Id: <56720bda0d310d4910f2c3a49d6222de250b50b3.1399868537.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
References: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
In-Reply-To: <cover.1399868537.git.petter@technux.se>
References: <cover.1399868537.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv3 08/13] linuxdoc-tools: remove usage of FILESPATH
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
X-List-Received-Date: Mon, 12 May 2014 14:28:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb |    3 ---
 .../disable_dvips_doc.patch                        |    0
 .../disable_sgml2rtf.patch                         |    0
 .../disable_tex_doc.patch                          |    0
 .../disable_txt_doc.patch                          |    0
 5 files changed, 3 deletions(-)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_dvips_doc.patch (100%)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_sgml2rtf.patch (100%)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_tex_doc.patch (100%)
 rename meta/recipes-devtools/linuxdoc-tools/{linuxdoc-tools-native => linuxdoc-tools}/disable_txt_doc.patch (100%)

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index fce4178..ed6ab73 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931"
 
 DEPENDS = "groff-native openjade-native"
 
-
 SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.gz \
            file://disable_sgml2rtf.patch \
            file://disable_txt_doc.patch \
@@ -15,8 +14,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.
 SRC_URI[md5sum] = "1d13d500918a7a145b0edc2f16f61dd1"
 SRC_URI[sha256sum] = "7103facee18a2ea97186ca459d743d22f7f89ad4b5cd1dfd1c34f83d6bfd4101"
 
-FILESPATH = "${FILE_DIRNAME}/linuxdoc-tools-native/"
-
 inherit autotools-brokensep native
 
 do_configure () {
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_dvips_doc.patch
similarity index 100%
rename from meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_dvips_doc.patch
rename to meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_dvips_doc.patch
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_sgml2rtf.patch
similarity index 100%
rename from meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_sgml2rtf.patch
rename to meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_sgml2rtf.patch
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_tex_doc.patch
similarity index 100%
rename from meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_tex_doc.patch
rename to meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_tex_doc.patch
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_txt_doc.patch b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_txt_doc.patch
similarity index 100%
rename from meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native/disable_txt_doc.patch
rename to meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_txt_doc.patch
-- 
1.7.9.5


