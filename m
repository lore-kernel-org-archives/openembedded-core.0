Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5636E650
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 06:00:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1660b6E015611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Feb 2017 22:00:37 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 5 Feb 2017 22:00:36 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Feb 2017 01:00:33 -0500
Message-ID: <1499e7406dc74a2276449dba77bc2d7323f9ee5f.1486360706.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486360706.git.dengke.du@windriver.com>
References: <cover.1486360706.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dosfstools: upgrade to 4.1
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
X-List-Received-Date: Mon, 06 Feb 2017 06:00:38 -0000
Content-Type: text/plain

upgrade dosfstools from 4.0 to 4.1

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../dosfstools/{dosfstools_4.0.bb => dosfstools_4.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dosfstools/{dosfstools_4.0.bb => dosfstools_4.1.bb} (86%)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.0.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
similarity index 86%
rename from meta/recipes-devtools/dosfstools/dosfstools_4.0.bb
rename to meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index e7b1f61..458cf87 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.0.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.xz \
           "
-SRC_URI[md5sum] = "20f8388b99702f276c973d228c7cff45"
-SRC_URI[sha256sum] = "9037738953559d1efe04fc5408b6846216cc0138f7f9d32de80b6ec3c35e7daf"
+SRC_URI[md5sum] = "07a1050db1a898e9a2e03b0c4569c4bd"
+SRC_URI[sha256sum] = "e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173"
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
-- 
2.8.1


