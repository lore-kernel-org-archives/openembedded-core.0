Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69C7562135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 09:17:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4Q9HYBh020667
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 02:17:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 26 May 2016 02:17:34 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2016 17:17:19 +0800
Message-ID: <1464254239-21826-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] xmlto: xmlto needs tail to run
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
X-List-Received-Date: Thu, 26 May 2016 09:17:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 71f873f..14d1009 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -14,16 +14,18 @@ SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51f
 
 inherit autotools
 
-# xmlto needs getopt/xmllint/xsltproc/bash at runtime
+# xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
 RDEPENDS_${PN} = "docbook-xml-dtd4 \
                   docbook-xsl-stylesheets \
                   util-linux \
                   libxml2 \
                   bash \
+                  coreutils \
 "
 RDEPENDS_${PN}_append_class-target = " \
                   libxslt-bin \
 "
+CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=${bindir}/tail"
 
 BBCLASSEXTEND = "native"
 
-- 
2.8.1


