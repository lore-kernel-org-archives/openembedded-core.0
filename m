Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D836B73180
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u671bAiW019730
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:37:03 -0700
Message-ID: <d2eff5be7ed3443d7d7ae55b14cba10ed9c0e7c4.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] gmp: 6.1.0 -> 6.1.1
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:10 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-Append-the-user-provided-flags-to-the-auto-detected-.patch   | 0
 meta/recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/amd64.patch         | 0
 .../recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/use-includedir.patch | 0
 meta/recipes-support/gmp/{gmp_6.1.0.bb => gmp_6.1.1.bb}               | 4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.1.0.bb => gmp_6.1.1.bb} (87%)

diff --git a/meta/recipes-support/gmp/gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch b/meta/recipes-support/gmp/gmp-6.1.1/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
rename to meta/recipes-support/gmp/gmp-6.1.1/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
diff --git a/meta/recipes-support/gmp/gmp-6.1.0/amd64.patch b/meta/recipes-support/gmp/gmp-6.1.1/amd64.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.0/amd64.patch
rename to meta/recipes-support/gmp/gmp-6.1.1/amd64.patch
diff --git a/meta/recipes-support/gmp/gmp-6.1.0/use-includedir.patch b/meta/recipes-support/gmp/gmp-6.1.1/use-includedir.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.1.0/use-includedir.patch
rename to meta/recipes-support/gmp/gmp-6.1.1/use-includedir.patch
diff --git a/meta/recipes-support/gmp/gmp_6.1.0.bb b/meta/recipes-support/gmp/gmp_6.1.1.bb
similarity index 87%
rename from meta/recipes-support/gmp/gmp_6.1.0.bb
rename to meta/recipes-support/gmp/gmp_6.1.1.bb
index 9acf5cf..1df9b06 100644
--- a/meta/recipes-support/gmp/gmp_6.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            "
 
-SRC_URI[md5sum] = "86ee6e54ebfc4a90b643a65e402c4048"
-SRC_URI[sha256sum] = "498449a994efeba527885c10405993427995d3f86b8768d8cdf8d9dd7c6b73e8"
+SRC_URI[md5sum] = "4c175f86e11eb32d8bf9872ca3a8e11d"
+SRC_URI[sha256sum] = "a8109865f2893f1373b0a8ed5ff7429de8db696fc451b1036bd7bdf95bbeffd6"
 
 acpaths = ""
 
-- 
2.9.0


