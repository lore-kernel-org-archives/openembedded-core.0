Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43EFD71BD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 01:36:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7G1ane8032041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 18:36:49 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 Aug 2017 18:36:48 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 09:26:07 +0800
Message-ID: <03c66574d747ad8186978debb07bce4a2ffc7726.1502846743.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1502846743.git.kai.kang@windriver.com>
References: <cover.1502846743.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nss: 3.30.2 -> 3.31.1
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
X-List-Received-Date: Wed, 16 Aug 2017 01:36:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade nss from 3.30.2 to latest stable version 3.31.1.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-support/nss/{nss_3.30.2.bb => nss_3.31.1.bb} (96%)

diff --git a/meta/recipes-support/nss/nss_3.30.2.bb b/meta/recipes-support/nss/nss_3.31.1.bb
similarity index 96%
rename from meta/recipes-support/nss/nss_3.30.2.bb
rename to meta/recipes-support/nss/nss_3.31.1.bb
index 6683e5c..955862f 100644
--- a/meta/recipes-support/nss/nss_3.30.2.bb
+++ b/meta/recipes-support/nss/nss_3.31.1.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_30_2_RTM/src/${BP}.tar.gz \
+VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '_RTM'}"
+
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
            file://nss.pc.in \
            file://signlibs.sh \
            file://0001-nss-fix-support-cross-compiling.patch \
@@ -24,10 +26,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_30
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
            file://Fix-compilation-for-X32.patch \
-           file://0001-Fix-warnings-found-with-gcc7.patch \
            "
-SRC_URI[md5sum] = "42c22dd8ec6254f846259f1d8dd2eb76"
-SRC_URI[sha256sum] = "0d4a77ff26bcee79fa8afe0125e0df6ae9e798b6b36782fa29e28febf7cfce24"
+
+SRC_URI[md5sum] = "ebb44f1394250d2cf6ec3c2e3d71fa20"
+SRC_URI[sha256sum] = "933439214dc03ee60e86d1419c19e1568998b0776dde987f41fa70ced6cd08dc"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.10.1


