Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE8F6B346
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:35:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q7Zwi0002494
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 00:35:58 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 00:35:57 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 03:35:55 -0400
Message-ID: <e44d86edd598d06c444ea5cde10b50a1cd1727e3.1374823720.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374823720.git.wenzong.fan@windriver.com>
References: <cover.1374823720.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ccache: allow CCACHE_DIR to be overriden
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
X-List-Received-Date: Fri, 26 Jul 2013 07:35:57 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Use weaker assignment for CCACHE_DIR to allow users to override it
if desired.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/ccache.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index cd06a4b..ca3ca43 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,5 +1,5 @@
 CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
-export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
+export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
 CCACHE_DISABLE[unexport] = "1"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
-- 
1.7.9.5


