Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 188F565C88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:46:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M1kVFS002079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:46:31 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 21 Oct 2014 18:46:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Oct 2014 21:46:25 -0400
Message-ID: <e1b6d4f53772ff012c4f58a52b1cb34c601b575a.1413941715.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1413941715.git.wenzong.fan@windriver.com>
References: <cover.1413941715.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] tcl: clean host path in tclConfig.sh
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
X-List-Received-Date: Wed, 22 Oct 2014 01:46:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* /usr/bin/crossscripts/tclConfig.sh

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index 27f73f2..6c2c642 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -58,6 +58,7 @@ do_install() {
 	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
 	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
 	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
+	sed -i "/TCL_CC/s,\(--sysroot=\).*,--sysroot= '," tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
-- 
1.7.9.5


