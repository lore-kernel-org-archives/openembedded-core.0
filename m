Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFC966A382
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 06:06:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4K66nBP000604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 23:06:49 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 19 May 2014 23:06:48 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 May 2014 14:06:45 +0800
Message-ID: <08487da3901cd722248d895754571f49dabc3aec.1400565960.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1400565960.git.Chong.Lu@windriver.com>
References: <cover.1400565960.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] flex: Update to 2.5.39 version
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
X-List-Received-Date: Tue, 20 May 2014 06:06:51 -0000
Content-Type: text/plain

Upgrade flex to 2.5.39 version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/flex/{flex_2.5.38.bb => flex_2.5.39.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/flex/{flex_2.5.38.bb => flex_2.5.39.bb} (57%)

diff --git a/meta/recipes-devtools/flex/flex_2.5.38.bb b/meta/recipes-devtools/flex/flex_2.5.39.bb
similarity index 57%
rename from meta/recipes-devtools/flex/flex_2.5.38.bb
rename to meta/recipes-devtools/flex/flex_2.5.39.bb
index 226e469..7485743 100644
--- a/meta/recipes-devtools/flex/flex_2.5.38.bb
+++ b/meta/recipes-devtools/flex/flex_2.5.39.bb
@@ -5,5 +5,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://do_not_create_pdf_doc.patch"
 
-SRC_URI[md5sum] = "b230c88e65996ff74994d08a2a2e0f27"
-SRC_URI[sha256sum] = "d42a67ce11b649ce977c8e239d04b2ef1bdbffebb8a79f4f65211ad295f274ec"
+SRC_URI[md5sum] = "77d44c6bb8c0705e0017ab9a84a1502b"
+SRC_URI[sha256sum] = "add2b55f3bc38cb512b48fad7d72f43b11ef244487ff25fc00aabec1e32b617f"
-- 
1.8.1.2


