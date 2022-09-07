X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
Subject: [PATCH 2/2] icecc.bbclass: delete 'rm' command
Date: Wed,  7 Sep 2022 12:57:51 +0200
Message-Id: <20220907105751.1591186-2-u.oelmann@pengutronix.de>
In-Reply-To: <20220907105751.1591186-1-u.oelmann@pengutronix.de>
References: <20220907105751.1591186-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>

The removed command was explicitly marked as transitional in commit [1] roughly
three years ago, so finally clean up.

[1] 40d74cb1d0dd ("icecc: Export ICECC_CC and friends via wrapper-script")

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/classes/icecc.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8f06e9dd7082..e478ba488ce0 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -380,7 +380,6 @@ set_icecc_env() {
     fi
     for compiler in $compilers; do
         ln -sf $ICECC_BIN $ICE_PATH/symlinks/$compiler
-        rm -f $ICE_PATH/$compiler
         cat <<-__EOF__ > $ICE_PATH/$compiler
 		#!/bin/sh -e
 		export ICECC_VERSION=$ICECC_VERSION
-- 
2.30.2

