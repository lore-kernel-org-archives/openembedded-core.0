X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [honister][PATCH 33/37] systemd: add missing include for musl
Date: Tue, 26 Oct 2021 23:58:04 +0800
Message-Id: <1c4c9f68f13d40bfea489fe27556b85e59255da8.1635257336.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Yureka <yuka@yuka.dev>

Fixes "error: ‘FTW_ACTIONRETVAL’ undeclared (first use in this
function)" in src/shared/mount-setup.c.

Signed-off-by: Yureka <yuka@yuka.dev>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7707d08bb10db5eb782a2476be58ebe4b8bba154)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0008-add-missing-FTW_-macros-for-musl.patch  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 1de7ccf150..444e123854 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -10,10 +10,10 @@ This is to avoid build failures like below for musl.
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
  src/basic/missing_type.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
+ src/shared/mount-setup.c |  1 +
+ 2 files changed, 21 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
 index aeaf6ad5ec..3df1084ef2 100644
@@ -43,3 +43,15 @@ index aeaf6ad5ec..3df1084ef2 100644
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
+diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
+index ef3527e9a7..c1cab40eb8 100644
+--- a/src/shared/mount-setup.c
++++ b/src/shared/mount-setup.c
+@@ -32,6 +32,7 @@
+ #include "strv.h"
+ #include "user-util.h"
+ #include "virt.h"
++#include "missing_type.h"
+ 
+ typedef enum MountMode {
+         MNT_NONE           = 0,
-- 
2.31.1

