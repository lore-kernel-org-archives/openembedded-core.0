Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 164437059E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJYwD012698
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:18:57 -0700
Message-ID: <5cafcef4b4d10c867d54f55c32247e78034e6f76.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/38] attr: add perl to RDEPENDS_attr-ptest
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:35 -0000
Content-Type: text/plain

These are perl scripts:
/usr/lib/attr/ptest/test/run
/usr/lib/attr/ptest/test/sort-getfattr-output

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/attr/attr.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index c37d34f..981e825 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -34,4 +34,4 @@ do_install_ptest() {
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
 }
 
-RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
+RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix perl"
-- 
1.7.9.5


