Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 1D16877160
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 138AF600F5A
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:35 +0100
Message-Id: <6d47b3c277a3bb0f031084c24903a3412d7f4550.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 14/52] test-empty-image: rename from core-image-empty
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:21 -0000

From: Alex Franco <alejandro.franco@linux.intel.com>

As the empty image isn't a "core" image, and it's meant for testing

Additionally, don't set LICENSE as it is inherited from image

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-test/images/{core-image-empty.bb => test-empty-image.bb}     | 1 -
 1 file changed, 1 deletion(-)
 rename meta-selftest/recipes-test/images/{core-image-empty.bb => test-empty-image.bb} (86%)

diff --git a/meta-selftest/recipes-test/images/core-image-empty.bb b/meta-selftest/recipes-test/images/test-empty-image.bb
similarity index 86%
rename from meta-selftest/recipes-test/images/core-image-empty.bb
rename to meta-selftest/recipes-test/images/test-empty-image.bb
index 550567c..88d8d61 100644
--- a/meta-selftest/recipes-test/images/core-image-empty.bb
+++ b/meta-selftest/recipes-test/images/test-empty-image.bb
@@ -2,6 +2,5 @@ SUMMARY = "An empty image."
 IMAGE_INSTALL = ""
 IMAGE_LINGUAS = ""
 PACKAGE_INSTALL = ""
-LICENSE = "MIT"
 
 inherit image
-- 
2.1.4


