Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0E6F72886
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 05:44:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ5iNqv003257
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 21:44:23 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 21:44:23 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 13:42:01 +0800
Message-ID: <e1de925bc9c49fe0bc5e321a02bcf8be47cfe78d.1418953574.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418953574.git.Chong.Lu@windriver.com>
References: <cover.1418953574.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] byacc: Upgrade to 20141128
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
X-List-Received-Date: Fri, 19 Dec 2014 05:44:25 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/byacc/{byacc_20141006.bb => byacc_20141128.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20141006.bb => byacc_20141128.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20141006.bb b/meta/recipes-extended/byacc/byacc_20141128.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20141006.bb
rename to meta/recipes-extended/byacc/byacc_20141128.bb
index 17600a1..15c14c9 100644
--- a/meta/recipes-extended/byacc/byacc_20141006.bb
+++ b/meta/recipes-extended/byacc/byacc_20141128.bb
@@ -7,5 +7,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "62d58192f2995f24cef41a7cb8ec9ba3"
-SRC_URI[sha256sum] = "391b0ac550e94920a86960c6973ec539784dc84849e7c2bb1645ae6d8178b14d"
+SRC_URI[md5sum] = "acb0ff0fb6cc414a6b50c799794b2425"
+SRC_URI[sha256sum] = "f517fc21f08c1a1f010177357df58fc64eb1131011e5dcd48c19fe44c47198d0"
-- 
1.9.1


