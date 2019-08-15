Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74FE67F2E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 08:46:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7F8kjEN005202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 01:46:45 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 15 Aug 2019 01:46:44 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Aug 2019 04:46:38 -0400
Message-ID: <20190815084638.124222-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: disable gold on mipsn32
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
X-List-Received-Date: Thu, 15 Aug 2019 08:46:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Using gold on mipsn32 still fails. It fails to run

$ bitbake webkitgtk -c configure

with configuration:

MACHINE ?= "qemumips"
DEFAULTTUNE = "mips64-n32"

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.24.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
index c42c3de69f..0e5ee5ba00 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
@@ -88,6 +88,7 @@ EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 
+EXTRA_OECMAKE_append_mipsarchn32 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
-- 
2.20.0


