Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB3726E648
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:02:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA2jhX024090
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:02:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:02:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:02:43 -0700
Message-ID: <8ce445b42f01fcc898468108a054ceb1f2074794.1436781736.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436781736.git.liezhi.yang@windriver.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gnu-config: set noexec for do_compile
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
X-List-Received-Date: Mon, 13 Jul 2015 10:02:47 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnu-config/gnu-config_20120814.bb              |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index f5fce6f..eb7e420 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -19,9 +19,7 @@ SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed
 
 CLEANBROKEN = "1"
 
-do_compile() {
-	:
-}
+do_compile[noexec] = "1"
 
 do_install () {
 	install -d ${D}${datadir}/gnu-config \
-- 
1.7.9.5


