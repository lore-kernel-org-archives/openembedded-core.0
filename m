X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [honister][PATCH 15/17] packagedata.py: silence a DeprecationWarning
Date: Tue, 14 Dec 2021 09:20:50 +0800
Message-Id: <82f62387210757f66404f5d9c3f47461664124f5.1639444641.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Mingli Yu <mingli.yu@windriver.com>

Use regex strings (r’’) to silence below deprecation warning [1]:
 $ cat tmp/work/intel_x86_64-wrs-linux/linux-yocto/5.10.x+gitAUTOINC+917c420111_373c02c3ca-r0/temp/log.do_deploy
 [snip]
 /build/layers/oe-core/meta/lib/oe/packagedata.py:22: DeprecationWarning: invalid escape sequence \s
 r = re.compile("(^.+?):\s+(.*)")
 [snip]

[1] https://docs.python.org/3/library/re.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/packagedata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 02c81e5a52..212f048bc6 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -19,7 +19,7 @@ def read_pkgdatafile(fn):
         import re
         with open(fn, 'r') as f:
             lines = f.readlines()
-        r = re.compile("(^.+?):\s+(.*)")
+        r = re.compile(r"(^.+?):\s+(.*)")
         for l in lines:
             m = r.match(l)
             if m:
-- 
2.33.1

