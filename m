Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id E1A6965FF5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 08:06:24 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 10 May 2014 10:06:39 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-09-01.atm.binero.net (Postfix) with ESMTPSA id 1B6DA3A145;
	Sat, 10 May 2014 10:06:15 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 May 2014 10:06:01 +0200
Message-Id: <a8ffb5c87144b9c70f77a61ce8b54e42aa0dce91.1399671290.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
References: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
In-Reply-To: <cover.1399671290.git.petter@technux.se>
References: <cover.1399671290.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv2 08/13] linuxdoc-tools: remove usage of FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 08:06:25 -0000
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


