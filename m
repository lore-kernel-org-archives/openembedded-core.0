Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18C3960557
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:42:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C8glU9000952
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:42:47 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:42:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:42:46 -0700
Message-ID: <7282283b22483821654767c643af2082380f2174.1465720945.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465720945.git.liezhi.yang@windriver.com>
References: <cover.1465720945.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-mako: rm -df -> rmdir
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
X-List-Received-Date: Sun, 12 Jun 2016 08:42:47 -0000
Content-Type: text/plain

The old rm (e.g., Ubuntu 12.04's) doesn't has -d option, use rmdir to
make it work. BTW., the "-f" option in rm -df doesn't make any sense.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-mako_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-mako_1.0.3.bb b/meta/recipes-devtools/python/python-mako_1.0.3.bb
index d4f426d..abab0bc 100644
--- a/meta/recipes-devtools/python/python-mako_1.0.3.bb
+++ b/meta/recipes-devtools/python/python-mako_1.0.3.bb
@@ -26,5 +26,5 @@ BBCLASSEXTEND = "native nativesdk"
 # The same utility is packaged in python3-mako, so it would conflict
 do_install_append() {
     rm -f ${D}${bindir}/mako-render
-    rm -df ${D}${bindir}
+    rmdir ${D}${bindir}
 }
-- 
2.8.0


