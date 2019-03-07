Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 2D95F7CEBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 20:29:11 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id E2FC41C001F;
	Fri,  8 Mar 2019 09:29:10 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 09:29:06 +1300
Message-Id: <20190307202906.7421-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] icecc: Slightly more verbose log messages in the success case
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
X-List-Received-Date: Thu, 07 Mar 2019 20:29:12 -0000

The path containing the symlinks to icecc itself.
The path to the build env tarball.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index aebcc44667..6d003dccef 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -405,7 +405,8 @@ set_icecc_env() {
     export ICECC_VERSION ICECC_CC ICECC_CXX
     export PATH="$ICE_PATH:$PATH"
 
-    bbnote "Using icecc"
+    bbnote "Using icecc path: $ICE_PATH"
+    bbnote "Using icecc tarball: $ICECC_VERSION"
 }
 
 do_configure_prepend() {
-- 
2.17.1


