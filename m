Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9847C9F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 01:32:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1K1Vm6Q016400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:31:58 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 19 Feb 2019 17:31:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2019 09:40:37 +0800
Message-ID: <f19b266deb4af163758b8d5b0f45f4ff653d6184.1550626729.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1550626729.git.Qi.Chen@windriver.com>
References: <cover.1550626729.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] tar: upgrade to 1.31
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
X-List-Received-Date: Wed, 20 Feb 2019 01:32:07 -0000
Content-Type: text/plain

Remove the musl specific do_install, as it's not suitable for this
version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/tar/{tar_1.30.bb => tar_1.31.bb} | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/tar/{tar_1.30.bb => tar_1.31.bb} (88%)

diff --git a/meta/recipes-extended/tar/tar_1.30.bb b/meta/recipes-extended/tar/tar_1.31.bb
similarity index 88%
rename from meta/recipes-extended/tar/tar_1.30.bb
rename to meta/recipes-extended/tar/tar_1.31.bb
index bd24f47..a785042 100644
--- a/meta/recipes-extended/tar/tar_1.30.bb
+++ b/meta/recipes-extended/tar/tar_1.31.bb
@@ -11,8 +11,8 @@ SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://musl_dirent.patch \
 "
 
-SRC_URI[md5sum] = "8404e4c1fc5a3000228ab2b8ad674a65"
-SRC_URI[sha256sum] = "87592b86cb037c554375f5868bdd3cc57748aef38d6cb741c81065f0beac63b7"
+SRC_URI[md5sum] = "77afa35b696c8d760331fa0e12c2fac9"
+SRC_URI[sha256sum] = "577bd4463eea103bdfc662fc385789e2228dbeb399a1d0b98571ed9ce044f763"
 
 inherit autotools gettext texinfo
 
@@ -43,11 +43,6 @@ do_install_append_class-target() {
     fi
 }
 
-do_install_append_libc-musl() {
-    rm -f ${D}${libdir}/charset.alias
-    rmdir ${D}${libdir}
-}
-
 PACKAGES =+ "${PN}-rmt"
 
 FILES_${PN}-rmt = "${base_sbindir}/rmt*"
-- 
1.9.1


