Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C47586EFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 09:47:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1E9lUKo015353
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 01:47:30 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 14 Feb 2014 01:47:30 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 17:47:26 +0800
Message-ID: <e9c2c52073eb2b75edc88ae5ca8673c3d716a1de.1392371084.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392371084.git.Chong.Lu@windriver.com>
References: <cover.1392371084.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] flex: upgrade to 2.5.38
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
X-List-Received-Date: Fri, 14 Feb 2014 09:47:30 -0000
Content-Type: text/plain

Upgrade flex to 2.5.38.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/flex/{flex_2.5.37.bb => flex_2.5.38.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/flex/{flex_2.5.37.bb => flex_2.5.38.bb} (57%)

diff --git a/meta/recipes-devtools/flex/flex_2.5.37.bb b/meta/recipes-devtools/flex/flex_2.5.38.bb
similarity index 57%
rename from meta/recipes-devtools/flex/flex_2.5.37.bb
rename to meta/recipes-devtools/flex/flex_2.5.38.bb
index c57a948..226e469 100644
--- a/meta/recipes-devtools/flex/flex_2.5.37.bb
+++ b/meta/recipes-devtools/flex/flex_2.5.38.bb
@@ -5,5 +5,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://do_not_create_pdf_doc.patch"
 
-SRC_URI[md5sum] = "c75940e1fc25108f2a7b3ef42abdae06"
-SRC_URI[sha256sum] = "17aa7b4ebf19a13bc2dff4115b416365c95f090061539a932a68092349ac052a"
+SRC_URI[md5sum] = "b230c88e65996ff74994d08a2a2e0f27"
+SRC_URI[sha256sum] = "d42a67ce11b649ce977c8e239d04b2ef1bdbffebb8a79f4f65211ad295f274ec"
-- 
1.8.1.2


