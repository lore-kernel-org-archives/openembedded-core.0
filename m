Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 07/14] cve-check: Don't use f-strings
Date: Mon, 29 Aug 2022 11:02:26 -1000
Message-Id: <4cc681fd66031c8355f69e53443536b31377eba9.1661806803.git.steve@sakoman.com>
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Ernst Sjöstrand <ernstp@gmail.com>

Since we're keeping cve-check aligned between the active branches,
and dunfell is supported on Python 3.5, we can't use f-strings.

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1821cf7464cbba521b55a9c128fe8812c0cc5eca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 30fdc3e3dd..67f0644889 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -168,7 +168,7 @@ def get_cpe_ids(cve_product, version):
         else:
             vendor = "*"
 
-        cpe_id = f'cpe:2.3:a:{vendor}:{product}:{version}:*:*:*:*:*:*:*'
+        cpe_id = 'cpe:2.3:a:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, product, version)
         cpe_ids.append(cpe_id)
 
     return cpe_ids
-- 
2.25.1

