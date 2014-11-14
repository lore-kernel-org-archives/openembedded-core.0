Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD0272127
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:44:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9iDhF020350
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 01:44:13 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:44:12 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 04:44:06 -0500
Message-ID: <50ca2bbefd3b432d2ced6e5fdf8fb396636d55c4.1415957951.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415957951.git.wenzong.fan@windriver.com>
References: <cover.1415957951.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] tcl: clean host path in tclConfig.sh
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
X-List-Received-Date: Fri, 14 Nov 2014 09:44:13 -0000
Content-Type: text/plain

From: Shiqun Lin <Shiqun.Lin@windriver.com>

* /usr/bin/crossscripts/tclConfig.sh

Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.2.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.2.bb b/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
index 75fef01..34f3e87 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
@@ -58,6 +58,11 @@ do_install() {
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
+	sed -i "/TCL_CC/s,\(--sysroot=\).*,--sysroot= '," tclConfig.sh
+	sed -i "/TCL_BUILD_LIB_SPEC/s,-L${STAGING_LIBDIR},-L${libdir}," tclConfig.sh
+	sed -i "/TCL_SRC_DIR/s,${STAGING_INCDIR},${includedir}," tclConfig.sh
+	sed -i "/TCL_BUILD_STUB_LIB_SPEC/s,-L${STAGING_LIBDIR},-L${libdir}," tclConfig.sh
+	sed -i "/TCL_BUILD_STUB_LIB_PATH/s,${STAGING_INCDIR},${includedir}," tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
-- 
1.7.9.5


