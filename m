Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Qa3CG-0005aU-CS
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 12:01:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5O9vVch015340
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 02:57:31 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 24 Jun 2011 02:57:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 17:53:14 +0800
Message-ID: <51a1c9f9962aa6658ec984980978c6bf0ba1c301.1308902512.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308902512.git.wenzong.fan@windriver.com>
References: <cover.1308902512.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] ccache: Remove duplicate 'ccache.inc' from 'meta/class/'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2011 10:01:09 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/ccache.inc |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)
 delete mode 100644 meta/classes/ccache.inc

diff --git a/meta/classes/ccache.inc b/meta/classes/ccache.inc
deleted file mode 100644
index d830a1b..0000000
--- a/meta/classes/ccache.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-# Make ccache use a TMPDIR specific ccache directory if using the crosscompiler,
-# since it isn't likely to be useful with any other toolchain than the one we just
-# built, and would otherwise push more useful things out of the default cache.
-
-CCACHE_DIR_TARGET = "${TMPDIR}/ccache"
-
-python () {
-    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        bb.data.setVar('CCACHE_DIR', '${CCACHE_DIR_TARGET}', d)
-        bb.data.setVarFlag('CCACHE_DIR', 'export', '1', d)
-}
-- 
1.7.0.4



