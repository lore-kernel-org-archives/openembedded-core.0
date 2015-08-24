Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECE372B1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 03:23:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7O3NUXk029614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Aug 2015 20:23:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 23 Aug 2015 20:23:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2015 11:19:19 +0800
Message-ID: <1440386359-14110-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] xmlto: xsltproc is required by both native and target
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
X-List-Received-Date: Mon, 24 Aug 2015 03:23:31 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

xsltproc is required by both native and target, so add libxslt to
RDEPENDS unconditionally

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.26.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
index a7a0183..767d258 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
@@ -20,9 +20,7 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
                   util-linux \
                   libxml2 \
                   bash \
-"
-RDEPENDS_${PN}_append_class-target = " \
-                  libxslt-bin \
+                  libxslt \
 "
 
 BBCLASSEXTEND = "native"
-- 
1.9.1


