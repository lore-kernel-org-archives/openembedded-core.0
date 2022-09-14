X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
Subject: [PATCH] icecc.bbclass: fix filename of recipe in comment
Date: Wed, 14 Sep 2022 13:19:45 +0200
Message-Id: <20220914111945.3085854-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>

The character '%' is not a valid part of a recipe filename and has been used
here only to suggest a wildcard regarding the recipe's version, see reply [1] in
a companioned thread. Correct that by using the current recipe version instead.

[1] https://lists.yoctoproject.org/g/docs/message/3165

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e478ba488ce0..312e0f17b554 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -22,7 +22,7 @@
 # but nothing is sure. ;)
 #
 # If ICECC_ENV_EXEC is set in local.conf, then it should point to the icecc-create-env script provided by the user
-# or the default one provided by icecc-create-env_%.bb will be used.
+# or the default one provided by icecc-create-env_0.1.bb will be used.
 # (NOTE that this is a modified version of the needed script and *not the one that comes with icecream*).
 #
 # User can specify if specific recipes or recipes inheriting specific classes should not use icecc to distribute
-- 
2.30.2

