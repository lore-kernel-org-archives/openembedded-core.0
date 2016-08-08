Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFEF7716E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:46:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u785ku2f000367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Aug 2016 22:46:56 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 7 Aug 2016 22:46:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Aug 2016 22:46:54 -0700
Message-ID: <0b7f903f8c74204bb48cc74ce1a6957534ac9ede.1470635157.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1470635157.git.liezhi.yang@windriver.com>
References: <cover.1470635157.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xmlto: fix depends for native
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
X-List-Received-Date: Mon, 08 Aug 2016 05:46:56 -0000
Content-Type: text/plain

xmlto-native requires xsltproc which is provided by libxslt to run.
Fixed:
xmlto: Can't continue, xsltproc tool not found or not executable.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 886e7b4..d6f2e92 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -20,9 +20,9 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
                   util-linux \
                   libxml2 \
                   bash \
+                  libxslt \
 "
 RDEPENDS_${PN}_append_class-target = " \
-                  libxslt-bin \
                   coreutils \
 "
 CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=${bindir}/tail"
-- 
2.9.0


