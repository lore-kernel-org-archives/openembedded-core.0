Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA0F0728AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 05:44:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ5iLbC003254
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 21:44:21 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Dec 2014 21:44:20 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 13:41:59 +0800
Message-ID: <4c65601c878c0ba5a0803b5630deb14c4ffb0936.1418953574.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418953574.git.Chong.Lu@windriver.com>
References: <cover.1418953574.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] less: Upgrade to 471
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
X-List-Received-Date: Fri, 19 Dec 2014 05:44:23 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/less/{less_470.bb => less_471.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_470.bb => less_471.bb} (88%)

diff --git a/meta/recipes-extended/less/less_470.bb b/meta/recipes-extended/less/less_471.bb
similarity index 88%
rename from meta/recipes-extended/less/less_470.bb
rename to meta/recipes-extended/less/less_471.bb
index 5668329..81d354c 100644
--- a/meta/recipes-extended/less/less_470.bb
+++ b/meta/recipes-extended/less/less_471.bb
@@ -26,8 +26,8 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "abf7c37b1a2c3d83865eba3ab2eb369f"
-SRC_URI[sha256sum] = "f191dc51144e7ea0e7f116118d0ee7a5fe50d1ce330257e1ae5ee4c9d35d86ef"
+SRC_URI[md5sum] = "9a40d29a2d84b41f9f36d7dd90b4f950"
+SRC_URI[sha256sum] = "37f613fa9a526378788d790a92217d59b523574cf7159f6538da8564b3fb27f8"
 
 inherit autotools update-alternatives
 
-- 
1.9.1


