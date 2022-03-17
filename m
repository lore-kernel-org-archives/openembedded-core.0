Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/26] python3-imagesize: Add new recipe
Date: Thu, 17 Mar 2022 11:56:37 +0000
Message-Id: <20220317115700.993924-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Needed for sphinx support.

Based on a patch from Armin Kuster <akuster808@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-imagesize_1.2.0.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-imagesize_1.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-imagesize_1.2.0.bb b/meta/recipes-devtools/python/python3-imagesize_1.2.0.bb
new file mode 100644
index 00000000000..62dc226e9d3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-imagesize_1.2.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Parses image files’ header and return image size."
+HOMEPAGE = "https://github.com/shibukawa/imagesize_py"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0c128f0f7e8a02e1b83884c0b5a41cda"
+
+SRC_URI[sha256sum] = "b1f6b5a4eab1f73479a50fb79fcf729514a900c341d8503d62a62dbc4127a2b1"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0

