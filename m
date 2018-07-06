Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2129789F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 00:26:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w660QbPd000629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jul 2018 17:26:37 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 5 Jul 2018 17:26:30 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2018 17:26:23 -0700
Message-ID: <20180706002623.120984-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] diffutils-ptest: add runtime dependency on make
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
X-List-Received-Date: Fri, 06 Jul 2018 00:26:36 -0000
Content-Type: text/plain

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-extended/diffutils/diffutils_3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.6.bb b/meta/recipes-extended/diffutils/diffutils_3.6.bb
index deadd62c65..8ba897d18f 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.6.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.6.bb
@@ -19,6 +19,8 @@ acpaths = "-I ./m4"
 
 inherit ptest
 
+RDEPENDS_${PN}-ptest += "make"
+
 do_install_ptest() {
 	t=${D}${PTEST_PATH}
 	install -D ${S}/build-aux/test-driver $t/build-aux/test-driver
-- 
2.17.1


