Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF1D65E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 08:27:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8F8RAYG008078
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Sep 2014 01:27:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Sep 2014 01:27:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <tudor.florea@enea.com>
Date: Mon, 15 Sep 2014 16:27:11 +0800
Message-ID: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] kmod: remove the setting of INHIBIT_PACKAGE_STRIP
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
X-List-Received-Date: Mon, 15 Sep 2014 08:27:19 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Setting INHIBIT_PACKAGE_STRIP is added by 61cb45869c[kmod: ptest fixes], but I
can not reproduce the described issue, and seems it make wrong logical [
when enable ptest, INHIBIT_PACKAGE_STRIP is always 1; and when disable ptest,
INHIBIT_PACKAGE_STRIP is always 0]

Cc: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d4c21a4..9dd5867 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -44,7 +44,6 @@ do_compile_ptest () {
         oe_runmake buildtest-TESTS rootfs
 }
 
-INHIBIT_PACKAGE_STRIP = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
 INSANE_SKIP_${PN}-ptest = "arch"
 
 inherit update-alternatives
-- 
1.7.10.4


