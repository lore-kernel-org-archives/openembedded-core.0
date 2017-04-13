Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC4C77A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:57:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D9vSo0028177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:57:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Apr 2017 02:57:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 02:57:23 -0700
Message-ID: <a93e1a24ed566a1127786d25ebc6ae330555a595.1492077359.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1492077359.git.liezhi.yang@windriver.com>
References: <cover.1492077359.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] binconfig.bbclass: fix typo in get_binconfig_mangle()
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
X-List-Received-Date: Thu, 13 Apr 2017 09:57:27 -0000
Content-Type: text/plain

It should be -IOEINCDIR, not -I-IOEINCDIR.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/binconfig.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 1be5fc4..39c3e2b 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -14,7 +14,7 @@ def get_binconfig_mangle(d):
         s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
         s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
         s += " -e 's:-L${WORKDIR}:-LOELIBDIR:'"
-        s += " -e 's:-I${WORKDIR}:-I-IOEINCDIR:'"
+        s += " -e 's:-I${WORKDIR}:-IOEINCDIR:'"
         s += " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
         s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
         s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
-- 
2.10.2


