Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2C88729A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBM5SWNL006902
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 21:28:32 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Dec 2014 21:28:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 21:28:28 -0800
Message-ID: <a53b4220ea296af7a0453c04f4e8f4d5ba0306db.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1419226071.git.liezhi.yang@windriver.com>
References: <cover.1419226071.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] git: upgrade to 2.2.0
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
X-List-Received-Date: Mon, 22 Dec 2014 05:28:32 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../git/{git_2.0.1.bb => git_2.2.0.bb}             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.0.1.bb => git_2.2.0.bb} (61%)

diff --git a/meta/recipes-devtools/git/git_2.0.1.bb b/meta/recipes-devtools/git/git_2.2.0.bb
similarity index 61%
rename from meta/recipes-devtools/git/git_2.0.1.bb
rename to meta/recipes-devtools/git/git_2.2.0.bb
index dbf32e1..7341d98 100644
--- a/meta/recipes-devtools/git/git_2.0.1.bb
+++ b/meta/recipes-devtools/git/git_2.2.0.bb
@@ -1,7 +1,7 @@
 require git.inc
 
-SRC_URI[md5sum] = "981f5937840716cb563be1cc6292c8d7"
-SRC_URI[sha256sum] = "02609a06fb40db1f6a968867c0e82bcb959b85902747830de0fda53228712daf"
+SRC_URI[md5sum] = "2d5bbcc3e887cc4ba499f80420e2d5f7"
+SRC_URI[sha256sum] = "bea9548f5a39daaf7c3873b6a5be47d7f92cbf42d32957e1be955a2e0e7b83b4"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


