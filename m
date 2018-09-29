Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D29E7997A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:26:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T6Q6TQ027487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 23:26:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:26:05 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:43:56 +0800
Message-ID: <0b27127115cad5c47512fe6384898234a9bf53db.1538199671.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] vala: update vapigen-wrapper
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
X-List-Received-Date: Sat, 29 Sep 2018 06:26:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

gobject-introspection has changed installation paths of .gir files.
Update vapigen-wrapper accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/vala/vala.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index b22faad780..9f2f9bb996 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -29,7 +29,7 @@ do_configure_prepend_class-target() {
         # The wrapper will call a native vapigen
         cat > ${B}/vapigen-wrapper << EOF
 #!/bin/sh
-vapigen-${SHRT_VER} "\$@"
+vapigen-${SHRT_VER} --girdir=${STAGING_LIBDIR}/gir-1.0 "\$@"
 EOF
         chmod +x ${B}/vapigen-wrapper
 }
@@ -55,3 +55,5 @@ vapigen_sysroot_preprocess() {
            -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
            ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
 }
+
+SSTATE_SCAN_FILES += "vapigen-wrapper"
-- 
2.18.0


