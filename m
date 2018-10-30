Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5775749F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:01:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9U80Yfr005989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:01:00 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 01:00:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2018 16:06:42 +0800
Message-ID: <3f11c027a28d53147ea2d27ecef8e58a563b1bbc.1540886735.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1540886735.git.Qi.Chen@windriver.com>
References: <cover.1540886735.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gdbm: fix ptest failure
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
X-List-Received-Date: Tue, 30 Oct 2018 08:01:09 -0000
Content-Type: text/plain

Some of gdbm's ptest cases require gdbmtool, which is packaged into
${PN}-bin. So extend the RDEPENDS_${PN}-ptest to include the package.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/gdbm/gdbm_1.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.18.bb b/meta/recipes-support/gdbm/gdbm_1.18.bb
index 2d2016d..aad4300 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.bb
@@ -31,7 +31,7 @@ do_install_append () {
     ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
 }
 
-RDEPENDS_${PN}-ptest += "diffutils"
+RDEPENDS_${PN}-ptest += "diffutils ${PN}-bin"
 
 do_compile_ptest() {
     oe_runmake -C tests buildtests
-- 
1.9.1


