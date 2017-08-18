Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD9F7853D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 06:42:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7I6gNSU019008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 23:42:23 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 17 Aug 2017 23:42:23 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Aug 2017 02:42:20 -0400
Message-ID: <866a0e0dad91b2716029b546843148d37a85cc59.1503038501.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503038501.git.dengke.du@windriver.com>
References: <cover.1503038501.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mpg123: upgrade to 1.25.6
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
X-List-Received-Date: Fri, 18 Aug 2017 06:42:22 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-multimedia/mpg123/{mpg123_1.25.4.bb => mpg123_1.25.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.4.bb => mpg123_1.25.6.bb} (94%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.6.bb
similarity index 94%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.4.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.25.6.bb
index 96e8f21..cb86199 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.6.bb
@@ -11,8 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "810e9d00fd75c92c4afafa20245317b5"
-SRC_URI[sha256sum] = "cdb5620e8aab83f75a27dab3394a44b9cc4017fc77b2954b8425ca416db6b3e7"
+SRC_URI[md5sum] = "43336bef78f67c2e66c4f6c288ca1eb3"
+SRC_URI[sha256sum] = "0f0458c9b87799bc2c9bf9455279cc4d305e245db43b51a39ef27afe025c5a8e"
 
 inherit autotools pkgconfig
 
-- 
2.8.1


