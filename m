Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E65E479979
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 05:43:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T5h8TL003379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 22:43:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 22:43:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:01:24 +0800
Message-ID: <a59f343500411bcbc31ed1e9c6b0d4cbf67e4cde.1538197206.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538197206.git.kai.kang@windriver.com>
References: <cover.1538197206.git.kai.kang@windriver.com>
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
X-List-Received-Date: Sat, 29 Sep 2018 05:43:08 -0000
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


