Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9DA73219
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B0VZAU024680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jan 2016 16:31:35 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:34 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:34 +0800
Message-ID: <0aa122d223f824a7135a16fbafc26a08648405b2.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] xmlto: 0.0.26 -> 0.0.28
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:35 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../configure.in-drop-the-test-of-xmllint-and-xsltproc.patch          | 0
 meta/recipes-devtools/xmlto/{xmlto_0.0.26.bb => xmlto_0.0.28.bb}      | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/xmlto/{xmlto-0.0.26 => xmlto-0.0.28}/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch (100%)
 rename meta/recipes-devtools/xmlto/{xmlto_0.0.26.bb => xmlto_0.0.28.bb} (88%)

diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
similarity index 100%
rename from meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
rename to meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
similarity index 88%
rename from meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
rename to meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index a7a0183..514f527 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
            file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
            file://catalog.xml \
 "
-SRC_URI[md5sum] = "0cca8be787ba01e00c618cb390c988b9"
-SRC_URI[sha256sum] = "cfd8d2a26077be1d5566dfe22dd66099ae4f4600dea97d6e113a2cc5b8708977"
+SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
+SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
 
 inherit autotools
 
-- 
1.9.1


